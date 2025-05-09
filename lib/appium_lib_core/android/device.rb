# frozen_string_literal: true

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require_relative 'device/emulator'
require_relative 'device/clipboard'
require_relative 'device/performance'
require_relative 'device/screen'
require_relative 'device/auth_finger_print'

module Appium
  module Core
    module Android
      module Device
        extend Forwardable

        # rubocop:disable Layout/LineLength

        # @!method open_notifications
        #   Open Android notifications
        #
        # @example
        #
        #   @driver.open_notifications
        #

        # @!method current_activity
        # Get current activity name
        # @return [String] An activity name
        #
        # @example
        #
        #   @driver.current_activity # '.ApiDemos'
        #

        # @!method current_package
        # Get current package name
        # @return [String] A package name
        #
        # @example
        #
        #   @driver.current_package # 'com.example.android.apis'
        #

        # @!method get_system_bars
        # Get system bar's information
        # @return [String]
        #
        # @example
        #
        #   @driver.get_system_bars
        #   @driver.system_bars
        #

        # @!method get_display_density
        # Get connected device's density.
        # @return [Integer] The size of density
        #
        # @example
        #
        #   @driver.get_display_density # 320
        #

        # @!method location
        # Get the location of the device.
        #
        # @return [::Appium::Location]
        #
        # @example
        #
        #   driver.location #=> ::Appium::Location.new(10, 10, 10)
        #
        # @!method location=
        # Set the [::Appium::Location] of the device.
        #
        # @example
        #
        #   driver.location = ::Appium::Location.new(10, 10, 10)
        #

        # @!method set_location(latitude, longitude, altitude, speed: nil, satellites: nil)
        # Set the location of the device.
        #
        # @param [String, Number] latitude Set the latitude.
        # @param [String, Number] longitude Set the longitude.
        # @param [String, Number] altitude Set the altitude.
        # @param [String, Number] speed Set the speed to apply the location on Android real devices
        #                               in meters/second @since Appium 1.21.0 and in knots for emulators @since Appium 1.22.0.
        # @param [String, Number] satellites Sets the count of geo satellites being tracked in range 1..12 @since Appium 1.22.0.
        #                                    This number is respected on Emulators.
        #
        # @example
        #
        #   driver.set_location 10, 10, 0
        #

        # @!method toggle_location_services
        #   Switch the state of the location service
        #
        # @return [String]
        #
        # @example
        #
        #   @driver.toggle_location_services
        #

        # @!method hide_keyboard(close_key = nil)
        # Hide the onscreen keyboard
        # @param [String] close_key The name of the key which closes the keyboard.
        #   Defaults to 'Done' for iOS(except for XCUITest).
        #
        # @example
        #
        #  @driver.hide_keyboard                   # Close a keyboard with the 'Done' button
        #  @driver.hide_keyboard('Finished')       # Close a keyboard with the 'Finished' button
        #

        # @!method get_performance_data_types
        #   Get the information type of the system state which is supported to read such as
        #   cpu, memory, network, battery via adb commands.
        #   https://github.com/appium/appium-base-driver/blob/be29aec2318316d12b5c3295e924a5ba8f09b0fb/lib/mjsonwp/routes.js#L300
        #
        # @example
        #
        #   @driver.get_performance_data_types #=> ["cpuinfo", "batteryinfo", "networkinfo", "memoryinfo"]
        #

        # @!method get_performance_data(package_name:, data_type:)
        #   Get the resource usage information of the application.
        #   https://github.com/appium/appium-base-driver/blob/be29aec2318316d12b5c3295e924a5ba8f09b0fb/lib/mjsonwp/routes.js#L303
        # @param [String] package_name: Package name
        # @param [String] data_type: Data type get with +get_performance_data_types+
        #
        # @example
        #
        #   @driver.get_performance_data package_name: package_name, data_type: data_type
        #

        # @!method start_recording_screen(remote_path: nil, user: nil, pass: nil, method: 'PUT', file_field_name: nil, form_fields: nil, headers: nil, force_restart: nil, video_size: nil, time_limit: '180', bit_rate: '4000000', bug_report: nil)
        # @param [String] remote_path The path to the remote location, where the resulting video should be uploaded.
        #                             The following protocols are supported: http/https, ftp.
        #                             Null or empty string value (the default setting) means the content of resulting
        #                             file should be encoded as Base64 and passed as the endpoint response value.
        #                             An exception will be thrown if the generated media file is too big to
        #                             fit into the available process memory.
        #                             This option only has an effect if there is screen recording process in progress
        #                             and +forceRestart+ parameter is not set to +true+.
        # @param [String] user The name of the user for the remote authentication.
        # @param [String] pass The password for the remote authentication.
        # @param [String] method The http multipart upload method name. The 'PUT' one is used by default.
        # @param [String] file_field_name The name of the form field containing the binary payload in multipart/form-data
        #                             requests since Appium 1.18.0. Defaults to 'file'.
        # @param [Array<Hash, Array<String>>] form_fields The form fields mapping in multipart/form-data requests since Appium 1.18.0.
        #                             If any entry has the same key in this mapping, then it is going to be ignored.
        # @param [Hash] headers The additional headers in multipart/form-data requests since Appium 1.18.0.
        # @param [Boolean] force_restart Whether to try to catch and upload/return the currently running screen recording
        #                                 (+false+, the default setting on server) or ignore the result of it
        #                                 and start a new recording immediately (+true+).
        #
        # @param [String] video_size The format is widthxheight.
        #                            The default value is the device's native display resolution (if supported),
        #                            1280x720 if not. For best results,
        #                            use a size supported by your device's Advanced Video Coding (AVC) encoder.
        #                            For example, "1280x720"
        # @param [String] time_limit Recording time. 180 seconds is by default.
        #                            Since Appium 1.8.2 the time limit can be up to 1800 seconds (30 minutes).
        #                            Appium will automatically try to merge the 3-minutes chunks recorded
        #                            by the screenrecord utility, however, this requires FFMPEG utility
        #                            to be installed and available in PATH on the server machine. If the utility is not
        #                            present then the most recent screen recording chunk is going to be returned as the result.
        # @param [String] bit_rate The video bit rate for the video, in megabits per second.
        #                          4 Mbp/s(4000000) is by default for Android API level below 27. 20 Mb/s(20000000) for API level 27 and above.
        # @param [Boolean] bug_report Set it to +true+ in order to display additional information on the video overlay,
        #                             such as a timestamp, that is helpful in videos captured to illustrate bugs.
        #                             This option is only supported since API level 27 (Android P).
        # @return [String] Base64 encoded content of the recorded media file or an empty string
        #                  if the file has been successfully uploaded to a remote location (depends on the actual options)
        #
        # @example
        #
        #    @driver.start_recording_screen
        #    @driver.start_recording_screen video_size: '1280x720', time_limit: '180', bit_rate: '5000000'
        #

        # @!method get_clipboard(content_type: :plaintext)
        #   Set the content of device's clipboard.
        # @param [String] content_type: one of supported content types.
        # @return [String]
        #
        # @example
        #
        #   @driver.get_clipboard #=> "happy testing"
        #

        # @!method set_clipboard(content:, content_type: :plaintext, label: nil)
        #   Set the content of device's clipboard.
        # @param [String] label: clipboard data label.
        # @param [String] content_type: one of supported content types.
        # @param [String] content: Contents to be set. (Will encode with base64-encoded inside this method)
        #
        # @example
        #
        #   @driver.set_clipboard(content: 'happy testing') #=> {"protocol"=>"W3C"}
        #

        # @!method finger_print(finger_id)
        #     Authenticate users by using their finger print scans on supported emulators.
        #
        # @param [Integer] finger_id Finger prints stored in Android Keystore system (from 1 to 10)
        #
        # @example
        #
        #   @driver.finger_print 1
        #

        # @!method execute_cdp(cmd, **params)
        #     Execute Chrome Devtools protocol commands
        #     https://chromedevtools.github.io/devtools-protocol
        #
        # @param [String] cmd The name of command
        # @option params The parameter for the command as keyword options.
        #
        # @example
        #
        #   @driver.execute_cdp 'Page.captureScreenshot', quality: 50, format: 'jpeg'
        #   @driver.execute_cdp 'Page.getResourceTree'
        #
        #   # for Ruby 2,7 and 3+ compatibility
        #   params = {'timezoneId': 'Asia/Tokyo'}
        #   driver.execute_cdp 'Emulation.setTimezoneOverride', **params
        #

        ####
        ## class << self
        ####

        # rubocop:enable Layout/LineLength

        class << self
          def extended(_mod)
            ::Appium::Core::Device.extend_webdriver_with_forwardable

            ::Appium::Core::Device.add_endpoint_method(:open_notifications) do
              def open_notifications
                execute_script 'mobile:openNotifications', {}
              end
            end

            ::Appium::Core::Device.add_endpoint_method(:current_activity) do
              def current_activity
                execute_script 'mobile:getCurrentActivity', {}
              end
            end

            ::Appium::Core::Device.add_endpoint_method(:current_package) do
              def current_package
                execute_script 'mobile:getCurrentPackage', {}
              end
            end

            ::Appium::Core::Device.add_endpoint_method(:get_system_bars) do
              def get_system_bars
                execute_script 'mobile:getSystemBars', {}
              end
            end
            # as alias to get_system_bars
            ::Appium::Core::Device.add_endpoint_method(:system_bars) do
              def system_bars
                execute_script 'mobile:getSystemBars', {}
              end
            end

            ::Appium::Core::Device.add_endpoint_method(:toggle_location_services) do
              def toggle_location_services
                execute_script 'mobile:toggleGps', {}
              end
            end

            # Android, Override included method in bridge
            ::Appium::Core::Device.add_endpoint_method(:hide_keyboard) do
              def hide_keyboard(_close_key = nil)
                execute_script 'mobile:hideKeyboard', {}
              end
            end

            # Android, Override included method in bridge
            ::Appium::Core::Device.add_endpoint_method(:background_app) do
              def background_app(duration = 0)
                execute_script 'mobile:backgroundApp', { seconds: duration }
              end
            end

            ::Appium::Core::Device.add_endpoint_method(:execute_cdp) do
              # SeleniumWebdriver could already define this method
              return if method_defined? :execute_cdp

              def execute_cdp(cmd, **params)
                execute :chrome_send_command, {}, { cmd: cmd, params: params }
              end
            end

            Screen.add_methods
            Performance.add_methods
            Clipboard.add_methods
            Emulator.add_methods
            Authentication.add_methods
          end
        end
      end # module Device
    end # module Android
  end
end # module Appium
