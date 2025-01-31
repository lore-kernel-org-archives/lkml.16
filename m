Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE66D1DE4E5;
	Fri, 31 Jan 2025 15:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738337299; cv=none; b=nQKNkaoUxZ6AvviW8c+IsnZp14+ZazgNMzu5n2ffCeNdUq2VKoSyRkkYhy9x1hXf1yf39BKSGRCgCsnHHhhvERILiVYZMPaCtOV4ix+7+2EajcvFcpvsf41SwSGlBUy39FWDssBJhqQwHrazgLZDkTi7JE0Ya6iv6Wc/L5+ZNSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738337299; c=relaxed/simple;
	bh=+vCvvqEb4G2xvrVY/4j4fwlp/klrJ+xrwbNbFXxNAI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I+4D85eXILd7D+RQTP5ZsxPgjfdL++iK94ZheAYW6r1Ieb7YvERd4fGEUTBggVjA5k/CAaqRMz9dJi8O/JHu6ZxuqXd2veEHW8DI6BE4FtIj4gw5/LLHA0M8Ea5IP8djUW6F0agBGi+PlnbCeUS8utg7oeW6HOaU8sAfgKupFjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-854a68f5a9cso131174639f.0;
        Fri, 31 Jan 2025 07:28:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738337295; x=1738942095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JYrOof8WEHM7xQrPpI3MLzBmMWizUxJkDqZTOOld4rk=;
        b=I7iy9JxojPxey+WRLBrPpZfgDlQTddKV6bFZPX4eNt7sAftRcRWTkJrDNpvqkK323p
         so7ZcTEitiSIlhRjDz1LqE+l5Zj3MRvNR/pSeZLjmE9MszXst1T7RWPjYYR5V7mpsvvA
         hKZI3JzOm+Vj58cmFPsAzz2uvW/HQ87BbCFyoeA6k8yU5IVoRScB2L6kTzAJScRbzKFZ
         TGj37l3y9FK/EpTJhIZBxUcgeCus2rD5Gh1vFaBIDts/v6JrO4jPzq8c8c4Li5pmOmxo
         9X9U2dyQYqmhBPv6C2Jpx1hcTTYMZze9hw1prmE6RgPgpYHjTO/5aS8T4DypZBaQqWlU
         Ozfw==
X-Forwarded-Encrypted: i=1; AJvYcCUCrCAn+4VErhAQT9YqR+UqasS/VssI24Evg4TyXj6l91CuEHuxXsS9msFIZPtqK1vOvfhxfJQ2HGSTbQEY@vger.kernel.org, AJvYcCVHvV53D9LbufMkcBv5Kt+/EFJUpUnx7Bm/CZ1of2eS+qASToDwBicPNd56SDgMW2/PWD/vscItK+y+E0ADRu4nx6jZZg==@vger.kernel.org, AJvYcCWcIWcO5QGxOWuTN7G5sKDUEEeNKHmXZdFU9P38iGmj/+98jFlUCAeYaEdBo0MD9OugIWRmuqDpPTM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzesCDHGL+GOTEeXGl67VyGgfTQLp8t7KizlXT+RDWTrgExq2Zt
	U68QM1QX/EyJYRnBFPIsFBrWrnpauP1L3dfM/+8BlIHgRfOrRyGvvdpo1gsluoM=
X-Gm-Gg: ASbGncthbtMnib8BXgoGfpX/xHWb6cKJY6SCVIo7AdqxK8ueo5LxILey9jPWfFGPFAy
	BNchQmrHZS6WoWzZt07gXVsKjYuGgmLTae1d+M4wUx0HhumycBGsa+XvG6KyHGmzJSpPkODLRhu
	AJ9sRKB4KMF+UNBd1eifQY+cUJKFpiofmWBkrl+8NdM/T0gHq8zr0n46vzqLSjINrWxOHBHe6qX
	iY7DBEr8BSVuUytAjmbeIgh2kRg8ToQhu4CSs+QpAs6LU6rpvCQQ3Qtavwz0vhqpleNuVwnTXEU
	Q+wkKJneY2S0daF6aGaAtlUkB1azHZvTV8B/aE/BT/n0VydSBO5KZPVLbiLB
X-Google-Smtp-Source: AGHT+IFi3TliN5zobWwfZqNGDjW1bH07bat5ZfsxNH581pJL5+WTE9A+9qit5NHrx7HFvZusdJayoQ==
X-Received: by 2002:a05:6602:1481:b0:84a:810c:cf43 with SMTP id ca18e2360f4ac-85439fa26damr954865839f.9.1738337294343;
        Fri, 31 Jan 2025 07:28:14 -0800 (PST)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com. [209.85.166.180])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-854a15cfd46sm92640539f.1.2025.01.31.07.28.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 07:28:14 -0800 (PST)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3cfe17f75dfso16000255ab.2;
        Fri, 31 Jan 2025 07:28:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV544GHrUKtGJ1yrk1+ksvOXC4+IX8RUp7+IiUZufk8lmOnsRJpq0lcdIEpuVicMoVlFZyiQhan9Y+QDqOT@vger.kernel.org, AJvYcCWTZ9vjD10SRcCU/fGwvAYitjo9KXQ6sBJrN2FGVEdiNPCqRilwExFQvuTk8F4YhZ+lGl3ULYb5qUA=@vger.kernel.org, AJvYcCXNqwOwjtqvSQ6Y/sB9vUpxW4Xv9Jt4iCHxzPOAQo5jkhtCuBWtHFL1zNI0xDzE1Ref7T76Imz+BUB291HiynrgIL6+sw==@vger.kernel.org
X-Received: by 2002:a05:6e02:1565:b0:3d0:fe8:607e with SMTP id
 e9e14a558f8ab-3d00fe86243mr49111175ab.14.1738337293422; Fri, 31 Jan 2025
 07:28:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130234339.71061-1-josh@joshuagrisham.com>
In-Reply-To: <20250130234339.71061-1-josh@joshuagrisham.com>
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Fri, 31 Jan 2025 16:28:01 +0100
X-Gmail-Original-Message-ID: <CAMF+Keb_QfyFLHS0H3t9POehLLMw3Jcky4cho-bdXeEq_EcMgA@mail.gmail.com>
X-Gm-Features: AWEUYZnDGkcQMa-PnS6esQ4WVYRltywWsJejODT0mOnEaCVh1gDYo8UoacW5cMY
Message-ID: <CAMF+Keb_QfyFLHS0H3t9POehLLMw3Jcky4cho-bdXeEq_EcMgA@mail.gmail.com>
Subject: Re: [PATCH v9] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
To: Joshua Grisham <josh@joshuagrisham.com>
Cc: W_Armin@gmx.de, thomas@t-8ch.de, kuurtb@gmail.com, 
	ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com, 
	platform-driver-x86@vger.kernel.org, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Den fre 31 jan. 2025 kl 00:43 skrev Joshua Grisham <josh@joshuagrisham.com>=
:
>
> Add a new driver for Samsung Galaxy Book series notebook devices with the
> following features:
>
> - Keyboard backlight control
> - Battery hook for installing power supply extension to add charge
>   control end threshold
> - Controller for Samsung's performance modes using the platform profile
>   interface
> - Adds firmware-attributes to control various system features
> - Handles various hotkeys and notifications
>
> Signed-off-by: Joshua Grisham <josh@joshuagrisham.com>
>
> ---
>
> v1->v2:
> - Attempt to resolve all review comments from v1 as written here:
> https://lore.kernel.org/platform-driver-x86/53c5075b-1967-45d0-937f-46391=
2dd966d@gmx.de/T/#mbcbd8d5d9bc4496bac5486636c7d3b32bc3e5cd0
>
> v2->v3:
> - Tweak to battery attribute to closer match pattern in dell-wmi-ddv
> - implement platform_profile_remove() change from
>   9b3bb37b44a317626464e79da8b39989b421963f
> - Small tweak to Documentation page
>
> v3->v4:
> - Remove custom tracepoint (can trace via existing mechanisms)
> - Remove module parameters
> - Move sysfs attributes from device to firmware-attributes
> - Refactor "allow_recording" to "camera_lens_cover" plus other small
>   renames in aim to have more standardized naming that are cross-vendor
> - Attempt to improve locking mechanisms
> - Tweak logic for setting and getting led brightness
> - More fixes for aiming to use devres/devm pattern
> - Change battery charge end threshold to use 1 to 100 instead of 0 to 99
> - Add swtich input event for camera_lens_cover remove all others (they wi=
ll
>   be generated as ACPI netlink events instead)
> - Various other small tweaks and features as requested from feedback
>
> v4-v5:
> - Prefix all locally defined symbols with "GB_" as a namespace
> - Remove extra unused out_buf from galaxybook_acpi_method
> - Tighten up logic flow for setting and unsetting global pointer (now it
>   is done directly in association with the i8042 filter init and exit)
> - Rename "camera_lens_cover" to "block_recording"
> - Change input device to only apply for "Camera Lens Cover", remove spars=
e
>   keymap and set capabilities manually as part of block_recording init,
>   then notify using input_report_switch when setting block_recording
> - Correct firmware-attributes enumeration implementation (adding all
>   attributes) and remove erroneous ABI fw attrs docs update
> - Few small tweaks to how locks are used
> - Use device_unregister instead of device_destroy for firmware attributes
>   device
> - Tighten up and clean up performance mode to profile mapping logic; now
>   the mapping is largely "fixed" apart from "Ultra" that will map to
>   performance while also re-mapping "Performance" to balanced-performance
> - Tighten up error handling so probe will fail in more cases where it
>   should fail
> - Replace platform_profile_register with devm_platform_profile_register
>
> v5->v6:
> - A few small clean-up/fixes as requested from feedback
> - Revamp performance mode profile mapping so it is more static and relies
>   more on the facilities already built in to platform_profile, including:
>   - setting and using bits on profile handler choices to drive most of th=
e
>     behavior instead of having totally separate logic
>   - get_performance_mode_profile() is now a mostly static mapping that
>     drives both setting initial profile choices and retrieving the right
>     profile for a given performance_mode during runtime
>   - during init most of the mappings are hard-coded and the only things
>     that are changed are the exception cases (override legacy values and
>     downgrade of performance when Ultra mode is present)
>   - new function galaxybook_performance_mode_init() now handles initial
>     startup performance mode in a much more simple and straight-forward w=
ay
>
> v6->v7:
> - Rebase to latest for-next and implement updates to firmware-attributes,
>   platform_profile, and i8042 filter (including removal of global pointer=
).
>
> v7->v8:
> - Simplification and logic correction to platform_profile mapping and
>   probe implementation, including renaming the internal performance modes
>   to more closely match the internal names used by Samsung in Windows and
>   align the logic in this driver to how it works with their Windows
>   services.
>
> v8->v9:
> - Refactored "optional feature" init logic to return EOPNOTSUPP instead o=
f
>   0 and then centralized handling of various flags in the probe function
> - Re-sorted so get/show functions are always defined before set/store
> - Removed manually deleting fw_attrs (kset_unregister takes care of this)
> - Removed some unnecessary variable initializations
> - Removed manually creating charge_control_end_threshold sysfs attribute
>   and implemented new power supply extension framework instead
> - Removed gb_pfmode() macro and instead use a local pointer in
>   galaxybook_platform_profile_probe()
> ---
>  Documentation/admin-guide/laptops/index.rst   |    1 +
>  .../laptops/samsung-galaxybook.rst            |  174 ++
>  MAINTAINERS                                   |    7 +
>  drivers/platform/x86/Kconfig                  |   17 +
>  drivers/platform/x86/Makefile                 |    5 +-
>  drivers/platform/x86/samsung-galaxybook.c     | 1419 +++++++++++++++++
>  6 files changed, 1621 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/admin-guide/laptops/samsung-galaxybook.=
rst
>  create mode 100644 drivers/platform/x86/samsung-galaxybook.c
>
> diff --git a/Documentation/admin-guide/laptops/index.rst b/Documentation/=
admin-guide/laptops/index.rst
> index cd9a1c2695fd..e71c8984c23e 100644
> --- a/Documentation/admin-guide/laptops/index.rst
> +++ b/Documentation/admin-guide/laptops/index.rst
> @@ -11,6 +11,7 @@ Laptop Drivers
>     disk-shock-protection
>     laptop-mode
>     lg-laptop
> +   samsung-galaxybook
>     sony-laptop
>     sonypi
>     thinkpad-acpi
> diff --git a/Documentation/admin-guide/laptops/samsung-galaxybook.rst b/D=
ocumentation/admin-guide/laptops/samsung-galaxybook.rst
> new file mode 100644
> index 000000000000..752b8f1a4a74
> --- /dev/null
> +++ b/Documentation/admin-guide/laptops/samsung-galaxybook.rst
> @@ -0,0 +1,174 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +Samsung Galaxy Book Driver
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +
> +Joshua Grisham <josh@joshuagrisham.com>
> +
> +This is a Linux x86 platform driver for Samsung Galaxy Book series noteb=
ook
> +devices which utilizes Samsung's ``SCAI`` ACPI device in order to contro=
l
> +extra features and receive various notifications.
> +
> +Supported devices
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Any device with one of the supported ACPI device IDs should be supported=
. This
> +covers most of the "Samsung Galaxy Book" series notebooks that are curre=
ntly
> +available as of this writing, and could include other Samsung notebook d=
evices
> +as well.
> +
> +Status
> +=3D=3D=3D=3D=3D=3D
> +
> +The following features are currently supported:
> +
> +- :ref:`Keyboard backlight <keyboard-backlight>` control
> +- :ref:`Performance mode <performance-mode>` control implemented using t=
he
> +  platform profile interface
> +- :ref:`Battery charge control end threshold
> +  <battery-charge-control-end-threshold>` (stop charging battery at give=
n
> +  percentage value) implemented as a battery hook
> +- :ref:`Firmware Attributes <firmware-attributes>` to allow control of v=
arious
> +  device settings
> +- :ref:`Handling of Fn hotkeys <keyboard-hotkey-actions>` for various ac=
tions
> +- :ref:`Handling of ACPI notifications and hotkeys
> +  <acpi-notifications-and-hotkey-actions>`
> +
> +Because different models of these devices can vary in their features, th=
ere is
> +logic built within the driver which attempts to test each implemented fe=
ature
> +for a valid response before enabling its support (registering additional=
 devices
> +or extensions, adding sysfs attributes, etc). Therefore, it can be impor=
tant to
> +note that not all features may be supported for your particular device.
> +
> +The following features might be possible to implement but will require
> +additional investigation and are therefore not supported at this time:
> +
> +- "Dolby Atmos" mode for the speakers
> +- "Outdoor Mode" for increasing screen brightness on models with ``SAM04=
27``
> +- "Silent Mode" on models with ``SAM0427``
> +
> +.. _keyboard-backlight:
> +
> +Keyboard backlight
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +A new LED class named ``samsung-galaxybook::kbd_backlight`` is created w=
hich
> +will then expose the device using the standard sysfs-based LED interface=
 at
> +``/sys/class/leds/samsung-galaxybook::kbd_backlight``. Brightness can be
> +controlled by writing the desired value to the ``brightness`` sysfs attr=
ibute or
> +with any other desired userspace utility.
> +
> +.. note::
> +  Most of these devices have an ambient light sensor which also turns
> +  off the keyboard backlight under well-lit conditions. This behavior do=
es not
> +  seem possible to control at this time, but can be good to be aware of.
> +
> +.. _performance-mode:
> +
> +Performance mode
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This driver implements the
> +Documentation/userspace-api/sysfs-platform_profile.rst interface for wor=
king
> +with the "performance mode" function of the Samsung ACPI device.
> +
> +Mapping of each Samsung "performance mode" to its respective platform pr=
ofile is
> +performed dynamically by the driver, as not all models support all of th=
e same
> +performance modes. Your device might have one or more of the following m=
appings:
> +
> +- "Silent" maps to ``low-power``
> +- "Quiet" maps to ``quiet``
> +- "Optimized" maps to ``balanced``
> +- "High performance" maps to ``performance``
> +
> +The result of the mapping can be printed in the kernel log when the modu=
le is
> +loaded. Supported profiles can also be retrieved from
> +``/sys/firmware/acpi/platform_profile_choices``, while
> +``/sys/firmware/acpi/platform_profile`` can be used to read or write the
> +currently selected profile.
> +
> +The ``balanced`` platform profile will be set during module load if no p=
rofile
> +has been previously set.
> +
> +.. _battery-charge-control-end-threshold:
> +
> +Battery charge control end threshold
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This platform driver will add the ability to set the battery's charge co=
ntrol
> +end threshold, but does not have the ability to set a start threshold.
> +
> +This feature is typically called "Battery Saver" by the various Samsung
> +applications in Windows, but in Linux we have implemented the standardiz=
ed
> +"charge control threshold" sysfs interface on the battery device to allo=
w for
> +controlling this functionality from the userspace.
> +
> +The sysfs attribute
> +``/sys/class/power_supply/BAT1/charge_control_end_threshold`` can be use=
d to
> +read or set the desired charge end threshold.
> +
> +If you wish to maintain interoperability with the Samsung Settings appli=
cation
> +in Windows, then you should set the value to 100 to represent "off", or =
enable
> +the feature using only one of the following values: 50, 60, 70, 80, or 9=
0.
> +Otherwise, the driver will accept any value between 1 and 100 as the per=
centage
> +that you wish the battery to stop charging at.
> +
> +.. note::
> +  Some devices have been observed as automatically "turning off" the cha=
rge
> +  control end threshold if an input value of less than 30 is given.
> +
> +.. _firmware-attributes:
> +
> +Firmware Attributes
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The following enumeration-typed firmware attributes are set up by this d=
river
> +and should be accessible under
> +``/sys/class/firmware-attributes/samsung-galaxybook/attributes/`` if you=
r device
> +supports them:
> +
> +- ``power_on_lid_open`` (device should power on when the lid is opened)
> +- ``usb_charging``  (USB ports can deliver power to connected devices ev=
en when
> +  the device is powered off or in a low sleep state)
> +- ``block_recording`` (blocks access to camera and microphone)
> +
> +All of these attributes are simple boolean-like enumeration values which=
 use 0
> +to represent "off" and 1 to represent "on". Use the ``current_value`` at=
tribute
> +to get or change the setting on the device.
> +
> +Note that when ``block_recording`` is updated, the input device "Samsung=
 Galaxy
> +Book Lens Cover" will receive a ``SW_CAMERA_LENS_COVER`` switch event wh=
ich
> +reflects the current state.
> +
> +.. _keyboard-hotkey-actions:
> +
> +Keyboard hotkey actions (i8042 filter)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The i8042 filter will swallow the keyboard events for the Fn+F9 hotkey (=
Multi-
> +level keyboard backlight toggle) and Fn+F10 hotkey (Block recording togg=
le)
> +and instead execute their actions within the driver itself.
> +
> +Fn+F9 will cycle through the brightness levels of the keyboard backlight=
. A
> +notification will be sent using ``led_classdev_notify_brightness_hw_chan=
ged``
> +so that the userspace can be aware of the change. This mimics the behavi=
or of
> +other existing devices where the brightness level is cycled internally b=
y the
> +embedded controller and then reported via a notification.
> +
> +Fn+F10 will toggle the value of the "block recording" setting, which blo=
cks
> +or allows usage of the built-in camera and microphone (and generates the=
 same
> +Lens Cover switch event mentioned above).
> +
> +.. _acpi-notifications-and-hotkey-actions:
> +
> +ACPI notifications and hotkey actions
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +ACPI notifications will generate ACPI netlink events under the device cl=
ass
> +``samsung-galaxybook`` and bus ID matching the Samsung ACPI device ID fo=
und on
> +your device. The events can be received using userspace tools such as
> +``acpi_listen`` and ``acpid``.
> +
> +The Fn+F11 Performance mode hotkey will be handled by the driver; each k=
eypress
> +will cycle to the next available platform profile.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 936e80f2c9ce..9d3d5359d304 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20913,6 +20913,13 @@ L:     linux-fbdev@vger.kernel.org
>  S:     Maintained
>  F:     drivers/video/fbdev/s3c-fb.c
>
> +SAMSUNG GALAXY BOOK DRIVER
> +M:     Joshua Grisham <josh@joshuagrisham.com>
> +L:     platform-driver-x86@vger.kernel.org
> +S:     Maintained
> +F:     Documentation/admin-guide/laptops/samsung-galaxybook.rst
> +F:     drivers/platform/x86/samsung-galaxybook.c
> +
>  SAMSUNG INTERCONNECT DRIVERS
>  M:     Sylwester Nawrocki <s.nawrocki@samsung.com>
>  M:     Artur =C5=9Awigo=C5=84 <a.swigon@samsung.com>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 0258dd879d64..c77178e2640b 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -778,6 +778,23 @@ config BARCO_P50_GPIO
>           To compile this driver as a module, choose M here: the module
>           will be called barco-p50-gpio.
>
> +config SAMSUNG_GALAXYBOOK
> +       tristate "Samsung Galaxy Book driver"
> +       depends on ACPI
> +       depends on ACPI_BATTERY
> +       depends on INPUT
> +       depends on LEDS_CLASS
> +       depends on SERIO_I8042
> +       select ACPI_PLATFORM_PROFILE
> +       select FW_ATTR_CLASS
> +       help
> +         This is a driver for Samsung Galaxy Book series notebooks. It a=
dds
> +         support for the keyboard backlight control, performance mode co=
ntrol,
> +         function keys, and various firmware attributes.
> +
> +         For more information about this driver, see
> +         <file:Documentation/admin-guide/laptops/samsung-galaxybook.rst>=
.
> +
>  config SAMSUNG_LAPTOP
>         tristate "Samsung Laptop driver"
>         depends on RFKILL || RFKILL =3D n
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefil=
e
> index e1b142947067..32ec4cb9d902 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -95,8 +95,9 @@ obj-$(CONFIG_PCENGINES_APU2)  +=3D pcengines-apuv2.o
>  obj-$(CONFIG_BARCO_P50_GPIO)   +=3D barco-p50-gpio.o
>
>  # Samsung
> -obj-$(CONFIG_SAMSUNG_LAPTOP)   +=3D samsung-laptop.o
> -obj-$(CONFIG_SAMSUNG_Q10)      +=3D samsung-q10.o
> +obj-$(CONFIG_SAMSUNG_GALAXYBOOK)       +=3D samsung-galaxybook.o
> +obj-$(CONFIG_SAMSUNG_LAPTOP)           +=3D samsung-laptop.o
> +obj-$(CONFIG_SAMSUNG_Q10)              +=3D samsung-q10.o
>
>  # Toshiba
>  obj-$(CONFIG_TOSHIBA_BT_RFKILL)        +=3D toshiba_bluetooth.o
> diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform=
/x86/samsung-galaxybook.c
> new file mode 100644
> index 000000000000..3c6d8ad06930
> --- /dev/null
> +++ b/drivers/platform/x86/samsung-galaxybook.c
> @@ -0,0 +1,1419 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Samsung Galaxy Book driver
> + *
> + * Copyright (c) 2025 Joshua Grisham <josh@joshuagrisham.com>
> + *
> + * With contributions to the SCAI ACPI device interface:
> + * Copyright (c) 2024 Giulio Girardi <giulio.girardi@protechgroup.it>
> + *
> + * Implementation inspired by existing x86 platform drivers.
> + * Thank you to the authors!
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/bits.h>
> +#include <linux/err.h>
> +#include <linux/i8042.h>
> +#include <linux/init.h>
> +#include <linux/input.h>
> +#include <linux/kernel.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/platform_profile.h>
> +#include <linux/serio.h>
> +#include <linux/sysfs.h>
> +#include <linux/uuid.h>
> +#include <linux/workqueue.h>
> +#include <acpi/battery.h>
> +#include "firmware_attributes_class.h"
> +
> +#define DRIVER_NAME "samsung-galaxybook"
> +
> +struct samsung_galaxybook {
> +       struct platform_device *platform;
> +       struct acpi_device *acpi;
> +
> +       struct device *fw_attrs_dev;
> +       struct kset *fw_attrs_kset;
> +       /* block in case firmware attributes are updated in multiple thre=
ads */
> +       struct mutex fw_attr_lock;
> +
> +       bool has_kbd_backlight;
> +       bool has_block_recording;
> +       bool has_performance_mode;
> +
> +       struct led_classdev kbd_backlight;
> +       struct work_struct kbd_backlight_hotkey_work;
> +       /* block in case brightness updated using hotkey and another thre=
ad */
> +       struct mutex kbd_backlight_lock;
> +
> +       void *i8042_filter_ptr;
> +
> +       struct work_struct block_recording_hotkey_work;
> +       struct input_dev *camera_lens_cover_switch;
> +
> +       struct acpi_battery_hook battery_hook;
> +
> +       u8 profile_performance_modes[PLATFORM_PROFILE_LAST];
> +};
> +
> +enum galaxybook_fw_attr_id {
> +       GB_ATTR_POWER_ON_LID_OPEN,
> +       GB_ATTR_USB_CHARGING,
> +       GB_ATTR_BLOCK_RECORDING,
> +};
> +
> +static const char * const galaxybook_fw_attr_name[] =3D {
> +       [GB_ATTR_POWER_ON_LID_OPEN] =3D "power_on_lid_open",
> +       [GB_ATTR_USB_CHARGING]      =3D "usb_charging",
> +       [GB_ATTR_BLOCK_RECORDING]   =3D "block_recording",
> +};
> +
> +static const char * const galaxybook_fw_attr_desc[] =3D {
> +       [GB_ATTR_POWER_ON_LID_OPEN] =3D "Power On Lid Open",
> +       [GB_ATTR_USB_CHARGING]      =3D "USB Charging",
> +       [GB_ATTR_BLOCK_RECORDING]   =3D "Block Recording",
> +};
> +
> +#define GB_ATTR_LANGUAGE_CODE "en_US.UTF-8"
> +
> +struct galaxybook_fw_attr {
> +       struct samsung_galaxybook *galaxybook;
> +       enum galaxybook_fw_attr_id fw_attr_id;
> +       struct attribute_group attr_group;
> +       struct kobj_attribute display_name;
> +       struct kobj_attribute current_value;
> +       int (*get_value)(struct samsung_galaxybook *galaxybook, bool *val=
ue);
> +       int (*set_value)(struct samsung_galaxybook *galaxybook, const boo=
l value);
> +};
> +
> +struct sawb {
> +       u16 safn;
> +       u16 sasb;
> +       u8 rflg;
> +       union {
> +               struct {
> +                       u8 gunm;
> +                       u8 guds[250];
> +               } __packed;
> +               struct {
> +                       u8 caid[16];
> +                       u8 fncn;
> +                       u8 subn;
> +                       u8 iob0;
> +                       u8 iob1;
> +                       u8 iob2;
> +                       u8 iob3;
> +                       u8 iob4;
> +                       u8 iob5;
> +                       u8 iob6;
> +                       u8 iob7;
> +                       u8 iob8;
> +                       u8 iob9;
> +               } __packed;
> +               struct {
> +                       u8 iob_prefix[18];
> +                       u8 iobs[10];
> +               } __packed;
> +       } __packed;
> +} __packed;
> +
> +#define GB_SAWB_LEN_SETTINGS          0x15
> +#define GB_SAWB_LEN_PERFORMANCE_MODE  0x100
> +
> +#define GB_SAFN  0x5843
> +
> +#define GB_SASB_KBD_BACKLIGHT     0x78
> +#define GB_SASB_POWER_MANAGEMENT  0x7a
> +#define GB_SASB_USB_CHARGING_GET  0x67
> +#define GB_SASB_USB_CHARGING_SET  0x68
> +#define GB_SASB_NOTIFICATIONS     0x86
> +#define GB_SASB_BLOCK_RECORDING   0x8a
> +#define GB_SASB_PERFORMANCE_MODE  0x91
> +
> +#define GB_SAWB_RFLG_POS     4
> +#define GB_SAWB_GB_GUNM_POS  5
> +
> +#define GB_RFLG_SUCCESS  0xaa
> +#define GB_GUNM_FAIL     0xff
> +
> +#define GB_GUNM_FEATURE_ENABLE          0xbb
> +#define GB_GUNM_FEATURE_ENABLE_SUCCESS  0xdd
> +#define GB_GUDS_FEATURE_ENABLE          0xaa
> +#define GB_GUDS_FEATURE_ENABLE_SUCCESS  0xcc
> +
> +#define GB_GUNM_GET  0x81
> +#define GB_GUNM_SET  0x82
> +
> +#define GB_GUNM_POWER_MANAGEMENT  0x82
> +
> +#define GB_GUNM_USB_CHARGING_GET            0x80
> +#define GB_GUNM_USB_CHARGING_ON             0x81
> +#define GB_GUNM_USB_CHARGING_OFF            0x80
> +#define GB_GUDS_POWER_ON_LID_OPEN           0xa3
> +#define GB_GUDS_POWER_ON_LID_OPEN_GET       0x81
> +#define GB_GUDS_POWER_ON_LID_OPEN_SET       0x80
> +#define GB_GUDS_BATTERY_CHARGE_CONTROL      0xe9
> +#define GB_GUDS_BATTERY_CHARGE_CONTROL_GET  0x91
> +#define GB_GUDS_BATTERY_CHARGE_CONTROL_SET  0x90
> +#define GB_GUNM_ACPI_NOTIFY_ENABLE          0x80
> +#define GB_GUDS_ACPI_NOTIFY_ENABLE          0x02
> +
> +#define GB_BLOCK_RECORDING_ON   0x0
> +#define GB_BLOCK_RECORDING_OFF  0x1
> +
> +#define GB_FNCN_PERFORMANCE_MODE       0x51
> +#define GB_SUBN_PERFORMANCE_MODE_LIST  0x01
> +#define GB_SUBN_PERFORMANCE_MODE_GET   0x02
> +#define GB_SUBN_PERFORMANCE_MODE_SET   0x03
> +
> +/* guid 8246028d-8bca-4a55-ba0f-6f1e6b921b8f */
> +static const guid_t performance_mode_guid =3D
> +       GUID_INIT(0x8246028d, 0x8bca, 0x4a55, 0xba, 0x0f, 0x6f, 0x1e, 0x6=
b, 0x92, 0x1b, 0x8f);
> +#define GB_PERFORMANCE_MODE_GUID performance_mode_guid
> +
> +#define GB_PERFORMANCE_MODE_FANOFF          0xb
> +#define GB_PERFORMANCE_MODE_LOWNOISE        0xa
> +#define GB_PERFORMANCE_MODE_OPTIMIZED       0x0
> +#define GB_PERFORMANCE_MODE_OPTIMIZED_V2    0x2
> +#define GB_PERFORMANCE_MODE_PERFORMANCE     0x1
> +#define GB_PERFORMANCE_MODE_PERFORMANCE_V2  0x15
> +#define GB_PERFORMANCE_MODE_ULTRA           0x16
> +#define GB_PERFORMANCE_MODE_IGNORE1         0x14
> +#define GB_PERFORMANCE_MODE_IGNORE2         0xc
> +
> +#define GB_ACPI_METHOD_ENABLE            "SDLS"
> +#define GB_ACPI_METHOD_ENABLE_ON         1
> +#define GB_ACPI_METHOD_ENABLE_OFF        0
> +#define GB_ACPI_METHOD_SETTINGS          "CSFI"
> +#define GB_ACPI_METHOD_PERFORMANCE_MODE  "CSXI"
> +
> +#define GB_KBD_BACKLIGHT_MAX_BRIGHTNESS  3
> +
> +#define GB_ACPI_NOTIFY_BATTERY_STATE_CHANGED    0x61
> +#define GB_ACPI_NOTIFY_DEVICE_ON_TABLE          0x6c
> +#define GB_ACPI_NOTIFY_DEVICE_OFF_TABLE         0x6d
> +#define GB_ACPI_NOTIFY_HOTKEY_PERFORMANCE_MODE  0x70
> +
> +#define GB_KEY_KBD_BACKLIGHT_KEYDOWN    0x2c
> +#define GB_KEY_KBD_BACKLIGHT_KEYUP      0xac
> +#define GB_KEY_BLOCK_RECORDING_KEYDOWN  0x1f
> +#define GB_KEY_BLOCK_RECORDING_KEYUP    0x9f
> +#define GB_KEY_BATTERY_NOTIFY_KEYUP     0xf
> +#define GB_KEY_BATTERY_NOTIFY_KEYDOWN   0x8f
> +
> +/*
> + * ACPI method handling
> + */
> +
> +static int galaxybook_acpi_method(struct samsung_galaxybook *galaxybook,=
 acpi_string method,
> +                                 struct sawb *buf, size_t len)
> +{
> +       struct acpi_buffer output =3D {ACPI_ALLOCATE_BUFFER, NULL};
> +       union acpi_object in_obj, *out_obj;
> +       struct acpi_object_list input;
> +       acpi_status status;
> +       int err;
> +
> +       in_obj.type =3D ACPI_TYPE_BUFFER;
> +       in_obj.buffer.length =3D len;
> +       in_obj.buffer.pointer =3D (u8 *)buf;
> +
> +       input.count =3D 1;
> +       input.pointer =3D &in_obj;
> +
> +       status =3D acpi_evaluate_object_typed(galaxybook->acpi->handle, m=
ethod, &input, &output,
> +                                           ACPI_TYPE_BUFFER);
> +
> +       if (ACPI_FAILURE(status)) {
> +               dev_err(&galaxybook->acpi->dev, "failed to execute method=
 %s; got %s\n",
> +                       method, acpi_format_exception(status));
> +               return -EIO;
> +       }
> +
> +       out_obj =3D output.pointer;
> +
> +       if (out_obj->buffer.length !=3D len || out_obj->buffer.length < G=
B_SAWB_GB_GUNM_POS + 1) {
> +               dev_err(&galaxybook->acpi->dev,
> +                       "failed to execute %s; response length mismatch\n=
",
> +                       method);
> +               err =3D -EPROTO;
> +               goto out_free;
> +       }
> +       if (out_obj->buffer.pointer[GB_SAWB_RFLG_POS] !=3D GB_RFLG_SUCCES=
S) {
> +               dev_err(&galaxybook->acpi->dev,
> +                       "failed to execute %s; device did not respond wit=
h success code 0x%x\n",
> +                       method, GB_RFLG_SUCCESS);
> +               err =3D -ENXIO;
> +               goto out_free;
> +       }
> +       if (out_obj->buffer.pointer[GB_SAWB_GB_GUNM_POS] =3D=3D GB_GUNM_F=
AIL) {
> +               dev_err(&galaxybook->acpi->dev,
> +                       "failed to execute %s; device responded with fail=
ure code 0x%x\n",
> +                       method, GB_GUNM_FAIL);
> +               err =3D -ENXIO;
> +               goto out_free;
> +       }
> +
> +       memcpy(buf, out_obj->buffer.pointer, len);
> +       err =3D 0;
> +
> +out_free:
> +       kfree(out_obj);
> +       return err;
> +}
> +
> +static int galaxybook_enable_acpi_feature(struct samsung_galaxybook *gal=
axybook, const u16 sasb)
> +{
> +       struct sawb buf =3D {};
> +       int err;
> +
> +       buf.safn =3D GB_SAFN;
> +       buf.sasb =3D sasb;
> +       buf.gunm =3D GB_GUNM_FEATURE_ENABLE;
> +       buf.guds[0] =3D GB_GUDS_FEATURE_ENABLE;
> +
> +       err =3D galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTING=
S,
> +                                    &buf, GB_SAWB_LEN_SETTINGS);
> +       if (err)
> +               return err;
> +
> +       if (buf.gunm !=3D GB_GUNM_FEATURE_ENABLE_SUCCESS &&
> +           buf.guds[0] !=3D GB_GUDS_FEATURE_ENABLE_SUCCESS)
> +               return -ENODEV;
> +
> +       return 0;
> +}
> +
> +/*
> + * Keyboard Backlight
> + */
> +
> +static int kbd_backlight_acpi_get(struct samsung_galaxybook *galaxybook,
> +                                 enum led_brightness *brightness)
> +{
> +       struct sawb buf =3D {};
> +       int err;
> +
> +       buf.safn =3D GB_SAFN;
> +       buf.sasb =3D GB_SASB_KBD_BACKLIGHT;
> +       buf.gunm =3D GB_GUNM_GET;
> +
> +       err =3D galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTING=
S,
> +                                    &buf, GB_SAWB_LEN_SETTINGS);
> +       if (err)
> +               return err;
> +
> +       *brightness =3D buf.gunm;
> +
> +       return 0;
> +}
> +
> +static int kbd_backlight_acpi_set(struct samsung_galaxybook *galaxybook,
> +                                 const enum led_brightness brightness)
> +{
> +       struct sawb buf =3D {};
> +
> +       buf.safn =3D GB_SAFN;
> +       buf.sasb =3D GB_SASB_KBD_BACKLIGHT;
> +       buf.gunm =3D GB_GUNM_SET;
> +
> +       buf.guds[0] =3D brightness;
> +
> +       return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS=
,
> +                                     &buf, GB_SAWB_LEN_SETTINGS);
> +}
> +
> +static enum led_brightness kbd_backlight_show(struct led_classdev *led)
> +{
> +       struct samsung_galaxybook *galaxybook =3D
> +               container_of(led, struct samsung_galaxybook, kbd_backligh=
t);
> +       enum led_brightness brightness;
> +       int err;
> +
> +       err =3D kbd_backlight_acpi_get(galaxybook, &brightness);
> +       if (err)
> +               return err;
> +
> +       return brightness;
> +}
> +
> +static int kbd_backlight_store(struct led_classdev *led,
> +                              const enum led_brightness brightness)
> +{
> +       struct samsung_galaxybook *galaxybook =3D
> +               container_of_const(led, struct samsung_galaxybook, kbd_ba=
cklight);
> +
> +       return kbd_backlight_acpi_set(galaxybook, brightness);
> +}
> +
> +static int galaxybook_kbd_backlight_init(struct samsung_galaxybook *gala=
xybook)
> +{
> +       struct led_init_data init_data =3D {};
> +       enum led_brightness brightness;
> +       int err;
> +
> +       err =3D devm_mutex_init(&galaxybook->platform->dev, &galaxybook->=
kbd_backlight_lock);
> +       if (err)
> +               return err;
> +
> +       err =3D galaxybook_enable_acpi_feature(galaxybook, GB_SASB_KBD_BA=
CKLIGHT);
> +       if (err) {
> +               dev_dbg(&galaxybook->platform->dev,
> +                       "failed to enable kbd_backlight feature, error %d=
\n", err);
> +               return EOPNOTSUPP;
> +       }
> +
> +       err =3D kbd_backlight_acpi_get(galaxybook, &brightness);
> +       if (err) {
> +               dev_dbg(&galaxybook->platform->dev,
> +                       "failed to get initial kbd_backlight brightness, =
error %d\n", err);
> +               return EOPNOTSUPP;
> +       }
> +
> +       init_data.devicename =3D DRIVER_NAME;
> +       init_data.default_label =3D ":" LED_FUNCTION_KBD_BACKLIGHT;
> +       init_data.devname_mandatory =3D true;
> +
> +       galaxybook->kbd_backlight.brightness_get =3D kbd_backlight_show;
> +       galaxybook->kbd_backlight.brightness_set_blocking =3D kbd_backlig=
ht_store;
> +       galaxybook->kbd_backlight.flags =3D LED_BRIGHT_HW_CHANGED;
> +       galaxybook->kbd_backlight.max_brightness =3D GB_KBD_BACKLIGHT_MAX=
_BRIGHTNESS;
> +
> +       return devm_led_classdev_register_ext(&galaxybook->platform->dev,
> +                                             &galaxybook->kbd_backlight,=
 &init_data);
> +}
> +
> +/*
> + * Battery Extension (adds charge_control_end_threshold to the battery d=
evice)
> + */
> +
> +static int charge_control_end_threshold_acpi_get(struct samsung_galaxybo=
ok *galaxybook, u8 *value)
> +{
> +       struct sawb buf =3D {};
> +       int err;
> +
> +       buf.safn =3D GB_SAFN;
> +       buf.sasb =3D GB_SASB_POWER_MANAGEMENT;
> +       buf.gunm =3D GB_GUNM_POWER_MANAGEMENT;
> +       buf.guds[0] =3D GB_GUDS_BATTERY_CHARGE_CONTROL;
> +       buf.guds[1] =3D GB_GUDS_BATTERY_CHARGE_CONTROL_GET;
> +
> +       err =3D galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTING=
S,
> +                                    &buf, GB_SAWB_LEN_SETTINGS);
> +       if (err)
> +               return err;
> +
> +       *value =3D buf.guds[1];
> +
> +       return 0;
> +}
> +
> +static int charge_control_end_threshold_acpi_set(struct samsung_galaxybo=
ok *galaxybook, u8 value)
> +{
> +       struct sawb buf =3D {};
> +
> +       buf.safn =3D GB_SAFN;
> +       buf.sasb =3D GB_SASB_POWER_MANAGEMENT;
> +       buf.gunm =3D GB_GUNM_POWER_MANAGEMENT;
> +       buf.guds[0] =3D GB_GUDS_BATTERY_CHARGE_CONTROL;
> +       buf.guds[1] =3D GB_GUDS_BATTERY_CHARGE_CONTROL_SET;
> +       buf.guds[2] =3D value;
> +
> +       return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS=
,
> +                                     &buf, GB_SAWB_LEN_SETTINGS);
> +}
> +
> +static int galaxybook_battery_ext_property_get(struct power_supply *psy,
> +                                              const struct power_supply_=
ext *ext,
> +                                              void *ext_data,
> +                                              enum power_supply_property=
 psp,
> +                                              union power_supply_propval=
 *val)
> +{
> +       struct samsung_galaxybook *galaxybook =3D ext_data;
> +       int err;
> +
> +       if (psp !=3D POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD)
> +               return -EINVAL;
> +
> +       err =3D charge_control_end_threshold_acpi_get(galaxybook, (u8 *)&=
val->intval);
> +       if (err)
> +               return err;
> +
> +       /*
> +        * device stores "no end threshold" as 0 instead of 100;
> +        * if device has 0, report 100
> +        */
> +       if (val->intval =3D=3D 0)
> +               val->intval =3D 100;
> +
> +       return 0;
> +}
> +
> +static int galaxybook_battery_ext_property_set(struct power_supply *psy,
> +                                              const struct power_supply_=
ext *ext,
> +                                              void *ext_data,
> +                                              enum power_supply_property=
 psp,
> +                                              const union power_supply_p=
ropval *val)
> +{
> +       struct samsung_galaxybook *galaxybook =3D ext_data;
> +       u8 value;
> +
> +       if (psp !=3D POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD)
> +               return -EINVAL;
> +
> +       value =3D val->intval;
> +
> +       if (value < 1 || value > 100)
> +               return -EINVAL;
> +
> +       /*
> +        * device stores "no end threshold" as 0 instead of 100;
> +        * if setting to 100, send 0
> +        */
> +       if (value =3D=3D 100)
> +               value =3D 0;
> +
> +       return charge_control_end_threshold_acpi_set(galaxybook, value);
> +}
> +
> +static int galaxybook_battery_ext_property_is_writeable(struct power_sup=
ply *psy,
> +                                                       const struct powe=
r_supply_ext *ext,
> +                                                       void *ext_data,
> +                                                       enum power_supply=
_property psp)
> +{
> +       if (psp =3D=3D POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD)
> +               return true;
> +
> +       return false;
> +}
> +
> +static const enum power_supply_property galaxybook_battery_properties[] =
=3D {
> +       POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
> +};
> +
> +static const struct power_supply_ext galaxybook_battery_ext =3D {
> +       .name                   =3D DRIVER_NAME,
> +       .properties             =3D galaxybook_battery_properties,
> +       .num_properties         =3D ARRAY_SIZE(galaxybook_battery_propert=
ies),
> +       .get_property           =3D galaxybook_battery_ext_property_get,
> +       .set_property           =3D galaxybook_battery_ext_property_set,
> +       .property_is_writeable  =3D galaxybook_battery_ext_property_is_wr=
iteable,
> +};
> +
> +static int galaxybook_battery_add(struct power_supply *battery, struct a=
cpi_battery_hook *hook)
> +{
> +       struct samsung_galaxybook *galaxybook =3D
> +               container_of(hook, struct samsung_galaxybook, battery_hoo=
k);
> +
> +       return power_supply_register_extension(battery, &galaxybook_batte=
ry_ext,
> +                                              &battery->dev, galaxybook)=
;
> +}
> +
> +static int galaxybook_battery_remove(struct power_supply *battery, struc=
t acpi_battery_hook *hook)
> +{
> +       power_supply_unregister_extension(battery, &galaxybook_battery_ex=
t);
> +       return 0;
> +}
> +
> +static int galaxybook_battery_threshold_init(struct samsung_galaxybook *=
galaxybook)
> +{
> +       u8 value;
> +       int err;
> +
> +       err =3D charge_control_end_threshold_acpi_get(galaxybook, &value)=
;
> +       if (err) {
> +               dev_dbg(&galaxybook->platform->dev,
> +                       "failed to get initial battery charge end thresho=
ld, error %d\n", err);
> +               return 0;
> +       }
> +
> +       galaxybook->battery_hook.add_battery =3D galaxybook_battery_add;
> +       galaxybook->battery_hook.remove_battery =3D galaxybook_battery_re=
move;
> +       galaxybook->battery_hook.name =3D "Samsung Galaxy Book Battery Ex=
tension";
> +
> +       return devm_battery_hook_register(&galaxybook->platform->dev, &ga=
laxybook->battery_hook);
> +}
> +
> +/*
> + * Platform Profile / Performance mode
> + */
> +
> +static int performance_mode_acpi_get(struct samsung_galaxybook *galaxybo=
ok, u8 *performance_mode)
> +{
> +       struct sawb buf =3D {};
> +       int err;
> +
> +       buf.safn =3D GB_SAFN;
> +       buf.sasb =3D GB_SASB_PERFORMANCE_MODE;
> +       export_guid(buf.caid, &GB_PERFORMANCE_MODE_GUID);
> +       buf.fncn =3D GB_FNCN_PERFORMANCE_MODE;
> +       buf.subn =3D GB_SUBN_PERFORMANCE_MODE_GET;
> +
> +       err =3D galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_PERFORM=
ANCE_MODE,
> +                                    &buf, GB_SAWB_LEN_PERFORMANCE_MODE);
> +       if (err)
> +               return err;
> +
> +       *performance_mode =3D buf.iob0;
> +
> +       return 0;
> +}
> +
> +static int performance_mode_acpi_set(struct samsung_galaxybook *galaxybo=
ok,
> +                                    const u8 performance_mode)
> +{
> +       struct sawb buf =3D {};
> +
> +       buf.safn =3D GB_SAFN;
> +       buf.sasb =3D GB_SASB_PERFORMANCE_MODE;
> +       export_guid(buf.caid, &GB_PERFORMANCE_MODE_GUID);
> +       buf.fncn =3D GB_FNCN_PERFORMANCE_MODE;
> +       buf.subn =3D GB_SUBN_PERFORMANCE_MODE_SET;
> +       buf.iob0 =3D performance_mode;
> +
> +       return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_PERFORMA=
NCE_MODE,
> +                                     &buf, GB_SAWB_LEN_PERFORMANCE_MODE)=
;
> +}
> +
> +static int get_performance_mode_profile(struct samsung_galaxybook *galax=
ybook,
> +                                       const u8 performance_mode,
> +                                       enum platform_profile_option *pro=
file)
> +{
> +       switch (performance_mode) {
> +       case GB_PERFORMANCE_MODE_FANOFF:
> +               *profile =3D PLATFORM_PROFILE_LOW_POWER;
> +               break;
> +       case GB_PERFORMANCE_MODE_LOWNOISE:
> +               *profile =3D PLATFORM_PROFILE_QUIET;
> +               break;
> +       case GB_PERFORMANCE_MODE_OPTIMIZED:
> +       case GB_PERFORMANCE_MODE_OPTIMIZED_V2:
> +               *profile =3D PLATFORM_PROFILE_BALANCED;
> +               break;
> +       case GB_PERFORMANCE_MODE_PERFORMANCE:
> +       case GB_PERFORMANCE_MODE_PERFORMANCE_V2:
> +       case GB_PERFORMANCE_MODE_ULTRA:
> +               *profile =3D PLATFORM_PROFILE_PERFORMANCE;
> +               break;
> +       case GB_PERFORMANCE_MODE_IGNORE1:
> +       case GB_PERFORMANCE_MODE_IGNORE2:
> +               return -EOPNOTSUPP;
> +       default:
> +               dev_warn(&galaxybook->platform->dev,
> +                        "unrecognized performance mode 0x%x\n", performa=
nce_mode);
> +               return -EOPNOTSUPP;
> +       }
> +
> +       return 0;
> +}
> +
> +static int galaxybook_platform_profile_get(struct device *dev,
> +                                          enum platform_profile_option *=
profile)
> +{
> +       struct samsung_galaxybook *galaxybook =3D dev_get_drvdata(dev);
> +       u8 performance_mode;
> +       int err;
> +
> +       err =3D performance_mode_acpi_get(galaxybook, &performance_mode);
> +       if (err)
> +               return err;
> +
> +       return get_performance_mode_profile(galaxybook, performance_mode,=
 profile);
> +}
> +
> +static int galaxybook_platform_profile_set(struct device *dev,
> +                                          enum platform_profile_option p=
rofile)
> +{
> +       struct samsung_galaxybook *galaxybook =3D dev_get_drvdata(dev);
> +
> +       return performance_mode_acpi_set(galaxybook,
> +                                        galaxybook->profile_performance_=
modes[profile]);
> +}
> +
> +static int galaxybook_platform_profile_probe(void *drvdata, unsigned lon=
g *choices)
> +{
> +       struct samsung_galaxybook *galaxybook =3D drvdata;
> +       u8 *perfmodes =3D galaxybook->profile_performance_modes;
> +       enum platform_profile_option profile;
> +       struct sawb buf =3D {};
> +       unsigned int i;
> +       int err;
> +
> +       buf.safn =3D GB_SAFN;
> +       buf.sasb =3D GB_SASB_PERFORMANCE_MODE;
> +       export_guid(buf.caid, &GB_PERFORMANCE_MODE_GUID);
> +       buf.fncn =3D GB_FNCN_PERFORMANCE_MODE;
> +       buf.subn =3D GB_SUBN_PERFORMANCE_MODE_LIST;
> +
> +       err =3D galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_PERFORM=
ANCE_MODE,
> +                                    &buf, GB_SAWB_LEN_PERFORMANCE_MODE);
> +       if (err) {
> +               dev_dbg(&galaxybook->platform->dev,
> +                       "failed to get supported performance modes, error=
 %d\n", err);
> +               return err;
> +       }
> +
> +       /* set initial default profile performance mode values */
> +       perfmodes[PLATFORM_PROFILE_LOW_POWER] =3D GB_PERFORMANCE_MODE_FAN=
OFF;
> +       perfmodes[PLATFORM_PROFILE_QUIET] =3D GB_PERFORMANCE_MODE_LOWNOIS=
E;
> +       perfmodes[PLATFORM_PROFILE_BALANCED] =3D GB_PERFORMANCE_MODE_OPTI=
MIZED;
> +       perfmodes[PLATFORM_PROFILE_PERFORMANCE] =3D GB_PERFORMANCE_MODE_P=
ERFORMANCE;
> +
> +       /*
> +        * Value returned in iob0 will have the number of supported perfo=
rmance
> +        * modes per device. The performance mode values will then be giv=
en as a
> +        * list after this (iob1-iobX). Loop through the supported values=
 and
> +        * enable their mapped platform_profile choice, overriding "legac=
y"
> +        * values along the way if a non-legacy value exists.
> +        */
> +       for (i =3D 1; i <=3D buf.iob0; i++) {
> +               err =3D get_performance_mode_profile(galaxybook, buf.iobs=
[i], &profile);
> +               if (err) {
> +                       dev_dbg(&galaxybook->platform->dev,
> +                               "ignoring unmapped performance mode 0x%x\=
n", buf.iobs[i]);
> +                       continue;
> +               }
> +               switch (buf.iobs[i]) {
> +               case GB_PERFORMANCE_MODE_OPTIMIZED_V2:
> +                       perfmodes[profile] =3D GB_PERFORMANCE_MODE_OPTIMI=
ZED_V2;
> +                       break;
> +               case GB_PERFORMANCE_MODE_PERFORMANCE_V2:
> +                       /* only update if not already overwritten by Ultr=
a */
> +                       if (perfmodes[profile] !=3D GB_PERFORMANCE_MODE_U=
LTRA)
> +                               perfmodes[profile] =3D GB_PERFORMANCE_MOD=
E_PERFORMANCE_V2;
> +                       break;
> +               case GB_PERFORMANCE_MODE_ULTRA:
> +                       perfmodes[profile] =3D GB_PERFORMANCE_MODE_ULTRA;
> +                       break;
> +               default:
> +                       break;
> +               }
> +               set_bit(profile, choices);
> +               dev_dbg(&galaxybook->platform->dev,
> +                       "setting platform profile %d to use performance m=
ode 0x%x\n",
> +                       profile, perfmodes[profile]);
> +       }
> +
> +       /* initialize performance_mode using balanced's mapped value */
> +       if (test_bit(PLATFORM_PROFILE_BALANCED, choices))
> +               return performance_mode_acpi_set(galaxybook, perfmodes[PL=
ATFORM_PROFILE_BALANCED]);
> +
> +       return 0;
> +}
> +
> +static const struct platform_profile_ops galaxybook_platform_profile_ops=
 =3D {
> +       .probe =3D galaxybook_platform_profile_probe,
> +       .profile_get =3D galaxybook_platform_profile_get,
> +       .profile_set =3D galaxybook_platform_profile_set,
> +};
> +
> +static int galaxybook_platform_profile_init(struct samsung_galaxybook *g=
alaxybook)
> +{
> +       struct device *platform_profile_dev;
> +       u8 performance_mode;
> +       int err;
> +
> +       err =3D performance_mode_acpi_get(galaxybook, &performance_mode);
> +       if (err) {
> +               dev_dbg(&galaxybook->platform->dev,
> +                       "failed to get initial performance mode, error %d=
\n", err);
> +               return EOPNOTSUPP;
> +       }
> +
> +       platform_profile_dev =3D devm_platform_profile_register(&galaxybo=
ok->platform->dev,
> +                                                             DRIVER_NAME=
, galaxybook,
> +                                                             &galaxybook=
_platform_profile_ops);
> +
> +       return PTR_ERR_OR_ZERO(platform_profile_dev);
> +}
> +
> +/*
> + * Firmware Attributes
> + */
> +
> +/* Power on lid open (device should power on when lid is opened) */
> +
> +static int power_on_lid_open_acpi_get(struct samsung_galaxybook *galaxyb=
ook, bool *value)
> +{
> +       struct sawb buf =3D {};
> +       int err;
> +
> +       buf.safn =3D GB_SAFN;
> +       buf.sasb =3D GB_SASB_POWER_MANAGEMENT;
> +       buf.gunm =3D GB_GUNM_POWER_MANAGEMENT;
> +       buf.guds[0] =3D GB_GUDS_POWER_ON_LID_OPEN;
> +       buf.guds[1] =3D GB_GUDS_POWER_ON_LID_OPEN_GET;
> +
> +       err =3D galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTING=
S,
> +                                    &buf, GB_SAWB_LEN_SETTINGS);
> +       if (err)
> +               return err;
> +
> +       *value =3D buf.guds[1];
> +
> +       return 0;
> +}
> +
> +static int power_on_lid_open_acpi_set(struct samsung_galaxybook *galaxyb=
ook, const bool value)
> +{
> +       struct sawb buf =3D {};
> +
> +       lockdep_assert_held(&galaxybook->fw_attr_lock);
> +
> +       buf.safn =3D GB_SAFN;
> +       buf.sasb =3D GB_SASB_POWER_MANAGEMENT;
> +       buf.gunm =3D GB_GUNM_POWER_MANAGEMENT;
> +       buf.guds[0] =3D GB_GUDS_POWER_ON_LID_OPEN;
> +       buf.guds[1] =3D GB_GUDS_POWER_ON_LID_OPEN_SET;
> +       buf.guds[2] =3D value ? 1 : 0;
> +
> +       return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS=
,
> +                                     &buf, GB_SAWB_LEN_SETTINGS);
> +}
> +
> +/* USB Charging (USB ports can provide power when device is powered off)=
 */
> +
> +static int usb_charging_acpi_get(struct samsung_galaxybook *galaxybook, =
bool *value)
> +{
> +       struct sawb buf =3D {};
> +       int err;
> +
> +       buf.safn =3D GB_SAFN;
> +       buf.sasb =3D GB_SASB_USB_CHARGING_GET;
> +       buf.gunm =3D GB_GUNM_USB_CHARGING_GET;
> +
> +       err =3D galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTING=
S,
> +                                    &buf, GB_SAWB_LEN_SETTINGS);
> +       if (err)
> +               return err;
> +
> +       *value =3D buf.gunm =3D=3D 1;
> +
> +       return 0;
> +}
> +
> +static int usb_charging_acpi_set(struct samsung_galaxybook *galaxybook, =
const bool value)
> +{
> +       struct sawb buf =3D {};
> +
> +       lockdep_assert_held(&galaxybook->fw_attr_lock);
> +
> +       buf.safn =3D GB_SAFN;
> +       buf.sasb =3D GB_SASB_USB_CHARGING_SET;
> +       buf.gunm =3D value ? GB_GUNM_USB_CHARGING_ON : GB_GUNM_USB_CHARGI=
NG_OFF;
> +
> +       return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS=
,
> +                                     &buf, GB_SAWB_LEN_SETTINGS);
> +}
> +
> +/* Block recording (blocks access to camera and microphone) */
> +
> +static int block_recording_acpi_get(struct samsung_galaxybook *galaxyboo=
k, bool *value)
> +{
> +       struct sawb buf =3D {};
> +       int err;
> +
> +       buf.safn =3D GB_SAFN;
> +       buf.sasb =3D GB_SASB_BLOCK_RECORDING;
> +       buf.gunm =3D GB_GUNM_GET;
> +
> +       err =3D galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTING=
S,
> +                                    &buf, GB_SAWB_LEN_SETTINGS);
> +       if (err)
> +               return err;
> +
> +       *value =3D buf.gunm =3D=3D GB_BLOCK_RECORDING_ON;
> +
> +       return 0;
> +}
> +
> +static int block_recording_acpi_set(struct samsung_galaxybook *galaxyboo=
k, const bool value)
> +{
> +       struct sawb buf =3D {};
> +       int err;
> +
> +       lockdep_assert_held(&galaxybook->fw_attr_lock);
> +
> +       buf.safn =3D GB_SAFN;
> +       buf.sasb =3D GB_SASB_BLOCK_RECORDING;
> +       buf.gunm =3D GB_GUNM_SET;
> +       buf.guds[0] =3D value ? GB_BLOCK_RECORDING_ON : GB_BLOCK_RECORDIN=
G_OFF;
> +
> +       err =3D galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTING=
S,
> +                                    &buf, GB_SAWB_LEN_SETTINGS);
> +       if (err)
> +               return err;
> +
> +       input_report_switch(galaxybook->camera_lens_cover_switch,
> +                           SW_CAMERA_LENS_COVER, value ? 1 : 0);
> +       input_sync(galaxybook->camera_lens_cover_switch);
> +
> +       return 0;
> +}
> +
> +static int galaxybook_block_recording_init(struct samsung_galaxybook *ga=
laxybook)
> +{
> +       bool value;
> +       int err;
> +
> +       err =3D galaxybook_enable_acpi_feature(galaxybook, GB_SASB_BLOCK_=
RECORDING);
> +       if (err) {
> +               dev_dbg(&galaxybook->platform->dev,
> +                       "failed to initialize block_recording, error %d\n=
", err);
> +               return EOPNOTSUPP;
> +       }
> +
> +       guard(mutex)(&galaxybook->fw_attr_lock);
> +
> +       err =3D block_recording_acpi_get(galaxybook, &value);
> +       if (err) {
> +               dev_dbg(&galaxybook->platform->dev,
> +                       "failed to get initial block_recording state, err=
or %d\n", err);
> +               return EOPNOTSUPP;
> +       }
> +
> +       galaxybook->camera_lens_cover_switch =3D
> +               devm_input_allocate_device(&galaxybook->platform->dev);
> +       if (!galaxybook->camera_lens_cover_switch)
> +               return -ENOMEM;
> +
> +       galaxybook->camera_lens_cover_switch->name =3D "Samsung Galaxy Bo=
ok Camera Lens Cover";
> +       galaxybook->camera_lens_cover_switch->phys =3D DRIVER_NAME "/inpu=
t0";
> +       galaxybook->camera_lens_cover_switch->id.bustype =3D BUS_HOST;
> +
> +       input_set_capability(galaxybook->camera_lens_cover_switch, EV_SW,=
 SW_CAMERA_LENS_COVER);
> +
> +       err =3D input_register_device(galaxybook->camera_lens_cover_switc=
h);
> +       if (err)
> +               return err;
> +
> +       input_report_switch(galaxybook->camera_lens_cover_switch,
> +                           SW_CAMERA_LENS_COVER, value ? 1 : 0);
> +       input_sync(galaxybook->camera_lens_cover_switch);
> +
> +       return 0;
> +}
> +
> +/* Firmware Attributes setup */
> +
> +static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *at=
tr, char *buf)
> +{
> +       return sysfs_emit(buf, "enumeration\n");
> +}
> +
> +static struct kobj_attribute fw_attr_type =3D __ATTR_RO(type);
> +
> +static ssize_t default_value_show(struct kobject *kobj, struct kobj_attr=
ibute *attr, char *buf)
> +{
> +       return sysfs_emit(buf, "0\n");
> +}
> +
> +static struct kobj_attribute fw_attr_default_value =3D __ATTR_RO(default=
_value);
> +
> +static ssize_t possible_values_show(struct kobject *kobj, struct kobj_at=
tribute *attr, char *buf)
> +{
> +       return sysfs_emit(buf, "0;1\n");
> +}
> +
> +static struct kobj_attribute fw_attr_possible_values =3D __ATTR_RO(possi=
ble_values);
> +
> +static ssize_t display_name_language_code_show(struct kobject *kobj, str=
uct kobj_attribute *attr,
> +                                              char *buf)
> +{
> +       return sysfs_emit(buf, "%s\n", GB_ATTR_LANGUAGE_CODE);
> +}
> +
> +static struct kobj_attribute fw_attr_display_name_language_code =3D
> +       __ATTR_RO(display_name_language_code);
> +
> +static ssize_t display_name_show(struct kobject *kobj, struct kobj_attri=
bute *attr, char *buf)
> +{
> +       struct galaxybook_fw_attr *fw_attr =3D
> +               container_of(attr, struct galaxybook_fw_attr, display_nam=
e);
> +
> +       return sysfs_emit(buf, "%s\n", galaxybook_fw_attr_desc[fw_attr->f=
w_attr_id]);
> +}
> +
> +static ssize_t current_value_show(struct kobject *kobj, struct kobj_attr=
ibute *attr, char *buf)
> +{
> +       struct galaxybook_fw_attr *fw_attr =3D
> +               container_of(attr, struct galaxybook_fw_attr, current_val=
ue);
> +       bool value;
> +       int err;
> +
> +       err =3D fw_attr->get_value(fw_attr->galaxybook, &value);
> +       if (err)
> +               return err;
> +
> +       return sysfs_emit(buf, "%u\n", value);
> +}
> +
> +static ssize_t current_value_store(struct kobject *kobj, struct kobj_att=
ribute *attr,
> +                                  const char *buf, size_t count)
> +{
> +       struct galaxybook_fw_attr *fw_attr =3D
> +               container_of(attr, struct galaxybook_fw_attr, current_val=
ue);
> +       struct samsung_galaxybook *galaxybook =3D fw_attr->galaxybook;
> +       bool value;
> +       int err;
> +
> +       if (!count)
> +               return -EINVAL;
> +
> +       err =3D kstrtobool(buf, &value);
> +       if (err)
> +               return err;
> +
> +       guard(mutex)(&galaxybook->fw_attr_lock);
> +
> +       err =3D fw_attr->set_value(galaxybook, value);
> +       if (err)
> +               return err;
> +
> +       return count;
> +}
> +
> +#define NUM_FW_ATTR_ENUM_ATTRS  6
> +
> +static int galaxybook_fw_attr_init(struct samsung_galaxybook *galaxybook=
,
> +                                  const enum galaxybook_fw_attr_id fw_at=
tr_id,
> +                                  int (*get_value)(struct samsung_galaxy=
book *galaxybook,
> +                                                   bool *value),
> +                                  int (*set_value)(struct samsung_galaxy=
book *galaxybook,
> +                                                   const bool value))
> +{
> +       struct galaxybook_fw_attr *fw_attr;
> +       struct attribute **attrs;
> +
> +       fw_attr =3D devm_kzalloc(&galaxybook->platform->dev, sizeof(*fw_a=
ttr), GFP_KERNEL);
> +       if (!fw_attr)
> +               return -ENOMEM;
> +
> +       attrs =3D devm_kcalloc(&galaxybook->platform->dev, NUM_FW_ATTR_EN=
UM_ATTRS + 1,
> +                            sizeof(*attrs), GFP_KERNEL);
> +       if (!attrs)
> +               return -ENOMEM;
> +
> +       attrs[0] =3D &fw_attr_type.attr;
> +       attrs[1] =3D &fw_attr_default_value.attr;
> +       attrs[2] =3D &fw_attr_possible_values.attr;
> +       attrs[3] =3D &fw_attr_display_name_language_code.attr;
> +
> +       sysfs_attr_init(&fw_attr.display_name);
> +       fw_attr->display_name.attr.name =3D "display_name";
> +       fw_attr->display_name.attr.mode =3D 0444;
> +       fw_attr->display_name.show =3D display_name_show;
> +       attrs[4] =3D &fw_attr->display_name.attr;
> +
> +       sysfs_attr_init(&fw_attr.current_value);
> +       fw_attr->current_value.attr.name =3D "current_value";
> +       fw_attr->current_value.attr.mode =3D 0644;
> +       fw_attr->current_value.show =3D current_value_show;
> +       fw_attr->current_value.store =3D current_value_store;
> +       attrs[5] =3D &fw_attr->current_value.attr;
> +
> +       attrs[6] =3D NULL;
> +
> +       fw_attr->galaxybook =3D galaxybook;
> +       fw_attr->fw_attr_id =3D fw_attr_id;
> +       fw_attr->attr_group.name =3D galaxybook_fw_attr_name[fw_attr_id];
> +       fw_attr->attr_group.attrs =3D attrs;
> +       fw_attr->get_value =3D get_value;
> +       fw_attr->set_value =3D set_value;
> +
> +       return sysfs_create_group(&galaxybook->fw_attrs_kset->kobj, &fw_a=
ttr->attr_group);
> +}
> +
> +static void galaxybook_kset_unregister(void *data)
> +{
> +       struct kset *kset =3D data;
> +
> +       kset_unregister(kset);
> +}
> +
> +static void galaxybook_fw_attrs_dev_unregister(void *data)
> +{
> +       struct device *fw_attrs_dev =3D data;
> +
> +       device_unregister(fw_attrs_dev);
> +}
> +
> +static int galaxybook_fw_attrs_init(struct samsung_galaxybook *galaxyboo=
k)
> +{
> +       bool value;
> +       int err;
> +
> +       err =3D devm_mutex_init(&galaxybook->platform->dev, &galaxybook->=
fw_attr_lock);
> +       if (err)
> +               return err;
> +
> +       galaxybook->fw_attrs_dev =3D device_create(&firmware_attributes_c=
lass, NULL, MKDEV(0, 0),
> +                                                NULL, "%s", DRIVER_NAME)=
;
> +       if (IS_ERR(galaxybook->fw_attrs_dev))
> +               return PTR_ERR(galaxybook->fw_attrs_dev);
> +
> +       err =3D devm_add_action_or_reset(&galaxybook->platform->dev,
> +                                      galaxybook_fw_attrs_dev_unregister=
,
> +                                      galaxybook->fw_attrs_dev);
> +       if (err)
> +               return err;
> +
> +       galaxybook->fw_attrs_kset =3D kset_create_and_add("attributes", N=
ULL,
> +                                                       &galaxybook->fw_a=
ttrs_dev->kobj);
> +       if (!galaxybook->fw_attrs_kset)
> +               return -ENOMEM;
> +       err =3D devm_add_action_or_reset(&galaxybook->platform->dev,
> +                                      galaxybook_kset_unregister, galaxy=
book->fw_attrs_kset);
> +       if (err)
> +               return err;
> +
> +       err =3D power_on_lid_open_acpi_get(galaxybook, &value);
> +       if (!err) {
> +               err =3D galaxybook_fw_attr_init(galaxybook,
> +                                             GB_ATTR_POWER_ON_LID_OPEN,
> +                                             &power_on_lid_open_acpi_get=
,
> +                                             &power_on_lid_open_acpi_set=
);
> +               if (err)
> +                       return err;
> +       }
> +
> +       err =3D usb_charging_acpi_get(galaxybook, &value);
> +       if (!err) {
> +               err =3D galaxybook_fw_attr_init(galaxybook,
> +                                             GB_ATTR_USB_CHARGING,
> +                                             &usb_charging_acpi_get,
> +                                             &usb_charging_acpi_set);
> +               if (err)
> +                       return err;
> +       }
> +
> +       err =3D galaxybook_block_recording_init(galaxybook);
> +       if (!err)
> +               galaxybook->has_block_recording =3D true;
> +       else if (err !=3D EOPNOTSUPP)
> +               return err;
> +
> +       return galaxybook_fw_attr_init(galaxybook,
> +                                      GB_ATTR_BLOCK_RECORDING,
> +                                      &block_recording_acpi_get,
> +                                      &block_recording_acpi_set);
> +}
> +
> +/*
> + * Hotkeys and notifications
> + */
> +
> +static void galaxybook_kbd_backlight_hotkey_work(struct work_struct *wor=
k)
> +{
> +       struct samsung_galaxybook *galaxybook =3D
> +               from_work(galaxybook, work, kbd_backlight_hotkey_work);
> +       int brightness;
> +       int err;
> +
> +       guard(mutex)(&galaxybook->kbd_backlight_lock);
> +
> +       brightness =3D galaxybook->kbd_backlight.brightness;
> +       if (brightness < galaxybook->kbd_backlight.max_brightness)
> +               brightness++;
> +       else
> +               brightness =3D 0;
> +
> +       err =3D led_set_brightness_sync(&galaxybook->kbd_backlight, brigh=
tness);
> +       if (err) {
> +               dev_err(&galaxybook->platform->dev,
> +                       "failed to set kbd_backlight brightness, error %d=
\n", err);
> +               return;
> +       }
> +
> +       led_classdev_notify_brightness_hw_changed(&galaxybook->kbd_backli=
ght, brightness);
> +}
> +
> +static void galaxybook_block_recording_hotkey_work(struct work_struct *w=
ork)
> +{
> +       struct samsung_galaxybook *galaxybook =3D
> +               from_work(galaxybook, work, block_recording_hotkey_work);
> +       bool value;
> +       int err;
> +
> +       guard(mutex)(&galaxybook->fw_attr_lock);
> +
> +       err =3D block_recording_acpi_get(galaxybook, &value);
> +       if (err) {
> +               dev_err(&galaxybook->platform->dev,
> +                       "failed to get block_recording, error %d\n", err)=
;
> +               return;
> +       }
> +
> +       err =3D block_recording_acpi_set(galaxybook, !value);
> +       if (err)
> +               dev_err(&galaxybook->platform->dev,
> +                       "failed to set block_recording, error %d\n", err)=
;
> +}
> +
> +static bool galaxybook_i8042_filter(unsigned char data, unsigned char st=
r, struct serio *port,
> +                                   void *context)
> +{
> +       struct samsung_galaxybook *galaxybook =3D context;
> +       static bool extended;
> +
> +       if (str & I8042_STR_AUXDATA)
> +               return false;
> +
> +       if (data =3D=3D 0xe0) {
> +               extended =3D true;
> +               return true;
> +       } else if (extended) {
> +               extended =3D false;
> +               switch (data) {
> +               case GB_KEY_KBD_BACKLIGHT_KEYDOWN:
> +                       return true;
> +               case GB_KEY_KBD_BACKLIGHT_KEYUP:
> +                       if (galaxybook->has_kbd_backlight)
> +                               schedule_work(&galaxybook->kbd_backlight_=
hotkey_work);
> +                       return true;
> +
> +               case GB_KEY_BLOCK_RECORDING_KEYDOWN:
> +                       return true;
> +               case GB_KEY_BLOCK_RECORDING_KEYUP:
> +                       if (galaxybook->has_block_recording)
> +                               schedule_work(&galaxybook->block_recordin=
g_hotkey_work);
> +                       return true;
> +
> +               /* battery notification already sent to battery + SCAI de=
vice */
> +               case GB_KEY_BATTERY_NOTIFY_KEYUP:
> +               case GB_KEY_BATTERY_NOTIFY_KEYDOWN:
> +                       return true;
> +
> +               default:
> +                       /*
> +                        * Report the previously filtered e0 before conti=
nuing
> +                        * with the next non-filtered byte.
> +                        */
> +                       serio_interrupt(port, 0xe0, 0);
> +                       return false;
> +               }
> +       }
> +
> +       return false;
> +}
> +
> +static void galaxybook_i8042_filter_remove(void *data)
> +{
> +       struct samsung_galaxybook *galaxybook =3D data;
> +
> +       i8042_remove_filter(galaxybook_i8042_filter);
> +       cancel_work_sync(&galaxybook->kbd_backlight_hotkey_work);
> +       cancel_work_sync(&galaxybook->block_recording_hotkey_work);
> +}
> +
> +static int galaxybook_i8042_filter_install(struct samsung_galaxybook *ga=
laxybook)
> +{
> +       int err;
> +
> +       if (!galaxybook->has_kbd_backlight && !galaxybook->has_block_reco=
rding)
> +               return 0;
> +
> +       INIT_WORK(&galaxybook->kbd_backlight_hotkey_work,
> +                 galaxybook_kbd_backlight_hotkey_work);
> +       INIT_WORK(&galaxybook->block_recording_hotkey_work,
> +                 galaxybook_block_recording_hotkey_work);
> +
> +       err =3D i8042_install_filter(galaxybook_i8042_filter, galaxybook)=
;
> +       if (err)
> +               return err;
> +
> +       return devm_add_action_or_reset(&galaxybook->platform->dev,
> +                                       galaxybook_i8042_filter_remove, g=
alaxybook);
> +}
> +
> +/*
> + * ACPI device setup
> + */
> +
> +static void galaxybook_acpi_notify(acpi_handle handle, u32 event, void *=
data)
> +{
> +       struct samsung_galaxybook *galaxybook =3D data;
> +
> +       switch (event) {
> +       case GB_ACPI_NOTIFY_BATTERY_STATE_CHANGED:
> +       case GB_ACPI_NOTIFY_DEVICE_ON_TABLE:
> +       case GB_ACPI_NOTIFY_DEVICE_OFF_TABLE:
> +               break;
> +       case GB_ACPI_NOTIFY_HOTKEY_PERFORMANCE_MODE:
> +               if (galaxybook->has_performance_mode)
> +                       platform_profile_cycle();
> +               break;
> +       default:
> +               dev_warn(&galaxybook->platform->dev,
> +                        "unknown ACPI notification event: 0x%x\n", event=
);
> +       }
> +
> +       acpi_bus_generate_netlink_event(DRIVER_NAME, dev_name(&galaxybook=
->platform->dev),
> +                                       event, 1);
> +}
> +
> +static int galaxybook_enable_acpi_notify(struct samsung_galaxybook *gala=
xybook)
> +{
> +       struct sawb buf =3D {};
> +       int err;
> +
> +       err =3D galaxybook_enable_acpi_feature(galaxybook, GB_SASB_NOTIFI=
CATIONS);
> +       if (err)
> +               return err;
> +
> +       buf.safn =3D GB_SAFN;
> +       buf.sasb =3D GB_SASB_NOTIFICATIONS;
> +       buf.gunm =3D GB_GUNM_ACPI_NOTIFY_ENABLE;
> +       buf.guds[0] =3D GB_GUDS_ACPI_NOTIFY_ENABLE;
> +
> +       return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS=
,
> +                                     &buf, GB_SAWB_LEN_SETTINGS);
> +}
> +
> +static void galaxybook_acpi_remove_notify_handler(void *data)
> +{
> +       struct samsung_galaxybook *galaxybook =3D data;
> +
> +       acpi_remove_notify_handler(galaxybook->acpi->handle, ACPI_ALL_NOT=
IFY,
> +                                  galaxybook_acpi_notify);
> +}
> +
> +static void galaxybook_acpi_disable(void *data)
> +{
> +       struct samsung_galaxybook *galaxybook =3D data;
> +
> +       acpi_execute_simple_method(galaxybook->acpi->handle,
> +                                  GB_ACPI_METHOD_ENABLE, GB_ACPI_METHOD_=
ENABLE_OFF);
> +}
> +
> +static int galaxybook_acpi_init(struct samsung_galaxybook *galaxybook)
> +{
> +       acpi_status status;
> +       int err;
> +
> +       status =3D acpi_execute_simple_method(galaxybook->acpi->handle, G=
B_ACPI_METHOD_ENABLE,
> +                                           GB_ACPI_METHOD_ENABLE_ON);
> +       if (ACPI_FAILURE(status))
> +               return -EIO;
> +       err =3D devm_add_action_or_reset(&galaxybook->platform->dev,
> +                                      galaxybook_acpi_disable, galaxyboo=
k);
> +       if (err)
> +               return err;
> +
> +       status =3D acpi_install_notify_handler(galaxybook->acpi->handle, =
ACPI_ALL_NOTIFY,
> +                                            galaxybook_acpi_notify, gala=
xybook);
> +       if (ACPI_FAILURE(status))
> +               return -EIO;
> +       err =3D devm_add_action_or_reset(&galaxybook->platform->dev,
> +                                      galaxybook_acpi_remove_notify_hand=
ler, galaxybook);
> +       if (err)
> +               return err;
> +
> +       err =3D galaxybook_enable_acpi_notify(galaxybook);
> +       if (err)
> +               dev_dbg(&galaxybook->platform->dev, "failed to enable ACP=
I notifications; "
> +                       "some hotkeys will not be supported\n");
> +
> +       err =3D galaxybook_enable_acpi_feature(galaxybook, GB_SASB_POWER_=
MANAGEMENT);
> +       if (err)
> +               dev_dbg(&galaxybook->platform->dev,
> +                       "failed to initialize ACPI power management featu=
res; "
> +                       "many features of this driver will not be availab=
le\n");
> +
> +       return 0;
> +}
> +
> +/*
> + * Platform driver
> + */
> +
> +static int galaxybook_probe(struct platform_device *pdev)
> +{
> +       struct acpi_device *adev =3D ACPI_COMPANION(&pdev->dev);
> +       struct samsung_galaxybook *galaxybook;
> +       int err;
> +
> +       if (!adev)
> +               return -ENODEV;
> +
> +       galaxybook =3D devm_kzalloc(&pdev->dev, sizeof(*galaxybook), GFP_=
KERNEL);
> +       if (!galaxybook)
> +               return -ENOMEM;
> +
> +       galaxybook->platform =3D pdev;
> +       galaxybook->acpi =3D adev;
> +
> +       /*
> +        * Features must be enabled and initialized in the following orde=
r to
> +        * avoid failures seen on certain devices:
> +        * - GB_SASB_POWER_MANAGEMENT (including performance mode)
> +        * - GB_SASB_KBD_BACKLIGHT
> +        * - GB_SASB_BLOCK_RECORDING (as part of fw_attrs init)
> +        *
> +        * The init function for features which are not supported on all =
devices
> +        * will return EOPNOTSUPP (positive to differentiate it from upst=
ream
> +        * error codes) if the feature is not working and should be ignor=
ed.
> +        */
> +
> +       err =3D galaxybook_acpi_init(galaxybook);
> +       if (err)
> +               return dev_err_probe(&galaxybook->platform->dev, err,
> +                                    "failed to initialize ACPI device\n"=
);
> +
> +       err =3D galaxybook_platform_profile_init(galaxybook);
> +       if (!err)
> +               galaxybook->has_performance_mode =3D true;
> +       else if (err !=3D EOPNOTSUPP)
> +               return dev_err_probe(&galaxybook->platform->dev, err,
> +                                    "failed to initialize platform profi=
le\n");
> +
> +       err =3D galaxybook_battery_threshold_init(galaxybook);
> +       if (err)
> +               return dev_err_probe(&galaxybook->platform->dev, err,
> +                                    "failed to initialize battery thresh=
old\n");
> +
> +       err =3D galaxybook_kbd_backlight_init(galaxybook);
> +       if (!err)
> +               galaxybook->has_kbd_backlight =3D true;
> +       else if (err !=3D EOPNOTSUPP)
> +               return dev_err_probe(&galaxybook->platform->dev, err,
> +                                    "failed to initialize kbd_backlight\=
n");
> +
> +       err =3D galaxybook_fw_attrs_init(galaxybook);
> +       if (err)
> +               return dev_err_probe(&galaxybook->platform->dev, err,
> +                                    "failed to initialize firmware-attri=
butes\n");
> +
> +       err =3D galaxybook_i8042_filter_install(galaxybook);
> +       if (err)
> +               return dev_err_probe(&galaxybook->platform->dev, err,
> +                                    "failed to initialize i8042_filter\n=
");
> +
> +       return 0;
> +}
> +
> +static const struct acpi_device_id galaxybook_device_ids[] =3D {
> +       { "SAM0427" },
> +       { "SAM0428" },
> +       { "SAM0429" },
> +       { "SAM0430" },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(acpi, galaxybook_device_ids);
> +
> +static struct platform_driver galaxybook_platform_driver =3D {
> +       .driver =3D {
> +               .name =3D DRIVER_NAME,
> +               .acpi_match_table =3D galaxybook_device_ids,
> +       },
> +       .probe =3D galaxybook_probe,
> +};
> +module_platform_driver(galaxybook_platform_driver);
> +
> +MODULE_AUTHOR("Joshua Grisham <josh@joshuagrisham.com>");
> +MODULE_DESCRIPTION("Samsung Galaxy Book driver");
> +MODULE_LICENSE("GPL");
> --
> 2.45.2
>

I thought to mention one thing to any reviewers that were going to
take a look at this after the discussion from v8.

One thing I was not super happy about with returning EOPNOTSUPP
directly is that it throws a checkpatch warning on all occurrences,
and when searching through the kernel I do not really see so many
other instances of returning pre-existing error codes as positive
values. If the direction that it went now with v9 is still desired,
but we do not want any kind of checkpatch warnings, I have thought
that maybe it would work to define my own symbol (such as
GB_NOT_SUPPORTED) and it can be any positive value I want (e.g. can
just be an alias directly to EOPNOTSUPP) and return / check for that
instead in these few "optional feature not supported" cases within
this driver. This does in fact feel a bit more "self-documenting", and
to be sure I did check to confirm and no checkpatch warnings are given
when doing it like this.

Does that sound preferred over what is currently here in this v9 (if
so I can send immediately as a v10 and everyone can ignore this v9) or
is it ok / not a problem that checkpatch will have these warnings on
returning positive standard error codes from these init functions?

Thanks again!

Best regards,
Joshua
