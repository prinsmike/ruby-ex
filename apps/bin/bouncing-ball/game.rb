#!/usr/bin/ruby

require "rubygame"

include Rubygame
include Rubygame::Events
include Rubygame::EventActions
include Rubygame::EventTriggers

class Ball
	include Sprites::Sprite
	include EventHandler::HasEventHandler

	def initialize(width, height)
		@width, @height = width, height		# Screen widht and height.
		@bx, @by = @width/2, @height/2		# Current position.
		@vx, @vy = 5, 5						# Current velocity.

		@keys = []							# The keys being pressed.

		# The ball's appearance. A white square.
		@image = Surface.new([10,10])
		@image.fill(:white)
		@rect = @image.make_rect

		make_magic_hooks(
			KeyPressed => :key_pressed,
			KeyReleased => :key_released,
			ClockTicked => :update
		)
	end

	def key_pressed(event)
		@keys += [event.key]
	end

	def key_released(event)
		@keys -= [event.key]
	end

	def update(event)
		@bx += @vx
		@by += @vy

		if @bx < 0 && @vx < 0
			@vx = -@vx
		end
		if @bx > @width && @vx > 0
			@vx = -@vx
		end
		if @by < 0 && @vy < 0
			@vy = -@vy
		end
		if @by > @height && @vy > 0
			@vy = -@vy
		end

		@rect.center = [@bx, @by]
	end
end

class Game
	include EventHandler::HasEventHandler

	def initialize()
		make_screen
		make_clock
		make_queue
		make_event_hooks
		make_ball
	end

	def go
		catch(:quit) do
			loop do
				step
			end
		end
	end

	private

	def make_clock
		@clock = Clock.new()
		@clock.target_framerate = 50
		@clock.calibrate
		@clock.enable_tick_events
	end

	def make_event_hooks
		hooks = {
			:escape => :quit,
			:q => :quit,
			QuitRequested => :quit
		}
		make_magic_hooks(hooks)
	end

	def make_queue
		@queue = EventQueue.new()
		@queue.enable_new_style_events
		@queue.ignore = [MouseMoved]
	end

	def make_screen
		@screen = Screen.open([640,480])
		@screen.title = "Bouncing ball!"
	end

	def make_ball
		@ball = Ball.new(@screen.w, @screen.h)
		make_magic_hooks_for(@ball, {YesTrigger.new() => :handle})
	end

	def quit
		throw :quit
	end

	def step
		@screen.fill(:black)
		@queue.fetch_sdl_events
		@queue << @clock.tick

		@queue.each do |event|
			handle(event)
		end

		@ball.draw(@screen)

		@screen.update()
	end
end

Game.new.go

Rubygame.quit()
