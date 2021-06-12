PLATFORM_IOS = iOS Simulator,name=iPhone 12 Pro,OS=14.4

test:
	@xcodebuild test \
		-workspace MultiCalculator.xcworkspace \
		-scheme Staging \
		-destination platform="$(PLATFORM_IOS)"

format:
	@swift format \
		--ignore-unparsable-files \
		--in-place \
		--recursive \
		./App/ \
		./Package.swift \
		./Sources/

licenses:
	swift run -c release \
		--package-path Tools license-plist \
		--output-path App/Production/Settings.bundle
