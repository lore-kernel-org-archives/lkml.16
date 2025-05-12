Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8879D2561BF;
	Mon, 12 May 2025 07:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747033921; cv=none; b=YE9MnJyQTZM0+NTMZNNuRGHySYesjO3JNq9buCVDVWlQXLelhhnQaY9yGBkctRt9WWyJ2bmwuh0TE2qDAtW2bqmo5GbFPcApd4ggePFF0zfqNKHAnUWNFtwVwo16HIjOGr9MPWcIssqHM9lH0P/YUuoHn4b9AtxeIvnlmcctryM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747033921; c=relaxed/simple;
	bh=UWaHpy3tnuk3FHkK9ajulVDIc6cTkMBqJq892XSpDJ8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A8GlUzE86GXbOOcVdPSqRqfnQPP9VhwgJ5/ebZCQbKwKTrWu0kwsZrCfZ0u8snMCGAc6W5+r4NM+prDJevJO7siRpYCy0HLTwyBYjn8ZO63f5MaW7ZvxqNqWnY1S5lQpVfp0gBBeBpqlQP8ZqBOgOyPCVVW0LfWk7YY2qb4vNbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cNx3CHpM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cNx3CHpM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 063E5C4CEE7;
	Mon, 12 May 2025 07:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747033921;
	bh=UWaHpy3tnuk3FHkK9ajulVDIc6cTkMBqJq892XSpDJ8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=cNx3CHpMxuoX6aa0usZ5ar0ypKnec4Jlm2rV27TTE5anvmg4ItL2sRdW/1MGAb53J
	 eHzZrvqRW/J2PDtcgaQjxnP1uC0ZQ9f1NsH7w2seaNmsve0ZdZEdH8luHLFopV0vax
	 b1l128KRpmFvxquOfPRdN2E8u8zrJTFsj7+Pl0QPyzHGB4JoA8oHQmZp1m3CjAl4Fr
	 JGpEndGq2LwPulC2O/xNBatG5jR7HvZWs7qM1foaGK7we5X1NrdJ8IEIfTj7IYbOQ9
	 hHiUERZ8NzefcAAIBjj9FOQB0jiRBE2kYoOVHFrj8AaUjGvqOgQGNs4U+JGTaVsqud
	 FSKgkq+CuE96w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A01C3ABC3;
	Mon, 12 May 2025 07:12:00 +0000 (UTC)
From: Sung-Chi Li via B4 Relay <devnull+lschyi.chromium.org@kernel.org>
Subject: [PATCH v3 0/3] Export fan control and register fans as cooling
 devices
Date: Mon, 12 May 2025 15:11:54 +0800
Message-Id: <20250512-cros_ec_fan-v3-0-a9f2b255f0cd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADqfIWgC/23MQQ6CMBCF4auYrq1pCxhw5T2MIUM7hVlAzVQbD
 eHuFjZG4/K95P9mEZEJozjtZsGYKFKY8ij2O2EHmHqU5PIWRplKlaaRlkNs0bYeJumg6I4l2MZ
 qJXJxY/T03LTLNe+B4j3wa8OTXt//TtJSSahdgwX6rtNwtgOHkR7jIXAvViqZT14p852bnJeuq
 utMg9L+J1+W5Q0Luz3p6AAAAA==
X-Change-ID: 20250429-cros_ec_fan-da3b64ac9c10
To: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Sung-Chi Li <lschyi@google.com>, Sung-Chi Li <lschyi@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747033920; l=3417;
 i=lschyi@chromium.org; s=20250429; h=from:subject:message-id;
 bh=UWaHpy3tnuk3FHkK9ajulVDIc6cTkMBqJq892XSpDJ8=;
 b=EQQGXva2ZZS8B7c6+//f34iGTwDkWEWiJYknBjz7FXnCpBoYGtn0gOLAtaIXoHIvnx5LRG97E
 Y4wuF7ijplXBlacBRO/kZ3ALLzh/sTiap7mvYUCqRWkDgnu+hgDoJ2k
X-Developer-Key: i=lschyi@chromium.org; a=ed25519;
 pk=9gCZPRJmYyHDt6VN9FV2UreFcUr73JFrwYvmsltW9Y8=
X-Endpoint-Received: by B4 Relay for lschyi@chromium.org/20250429 with
 auth_id=392
X-Original-From: Sung-Chi Li <lschyi@chromium.org>
Reply-To: lschyi@chromium.org

This is a continuation of the previous series "Export the target RPM fan
control by ChromeOS EC under hwmon"
(https://lore.kernel.org/lkml/20250313-extend_ec_hwmon_fan-v1-0-5c566776f2c4@chromium.org/T/#t).
There is a change from controlling the target fan RPM value to control
the PWM value.

We anticipate to involve fans connected to EC as thermal cooling
devices, so we can utilize the thermal framework to have further thermal
control strategies.

This series updates the required EC controls definitions, implements the
mechanism for controlling fan PWM values, and registers these fans under
thermal framework as cooling devices.

Adapting comments from the previous series, the driver probes the host
command capability at beginning to see whether a fan is controllable:
  - if command `EC_CMD_PWM_GET_FAN_DUTY` is supported (v0, this is a
    new command).
  - if command `EC_CMD_THERMAL_AUTO_FAN_CTRL` v2 is supported.
  - if command `EC_CMD_PWM_SET_FAN_DUTY` v1 is supported.

This combination is selected as this is the minimum requirement for a
fan to be fully controllable under hwmon framework.

The driver supports changing the fan control mode, and allows to change
the fan PWM value only if the fan is in manual control mode. The power
management hook is implemented as well for keeping the fan control
settings, as EC will automatically restore the control method to auto
when device is suspended.

Change-Id: I4e2fdc8c4bc50778c0d04cfbefeaab7088d3181e
Signed-off-by: Sung-Chi Li <lschyi@google.com>
---
Changes in v3:
- Make required EC command versions macros.
- Add `CONFIG_THERMAL` guarding for registering as thermal fan cooling
  devices.
- Add error handling during registering thermal cooling devices, and
  immediately abort the registration if any error occurred to align with
  the thermal sensor registration in hwmon core.
- Add error handling for EC fan communication during suspend and resume.
- Add `CONFIG_PM` guarding for checking whether the EC supports a
  complete fan control in hwmon driver.
- Sort variables order in declaration.
- Separate declaration and logic to different sections.
- Move `cros_ec_thermal_cooling_ops` next right after the operation
  functions declaration.
- Improve describing the resume behavior in documentation.

Changes in v2:
- Change column from 80 to 100 and fix styles.
- Directly store driver data into platform dev with
  platform_set_drvdata.
- Unify the PWM unit (from 0 ~ 255) between hwmon and thermal cooling
  devices.
- Only fetch the fan control mode and PWM value when suspending rather
  than caching values when writing. The suspend hook is thus added.
- Link to v1: https://lore.kernel.org/r/20250429-cros_ec_fan-v1-0-a8d9e3efbb1a@chromium.org

---
Sung-Chi Li (3):
      platform/chrome: update pwm fan control host commands
      hwmon: (cros_ec) add PWM control over fans
      hwmon: (cros_ec) register fans into thermal framework cooling devices

 Documentation/hwmon/cros_ec_hwmon.rst          |   7 +-
 drivers/hwmon/cros_ec_hwmon.c                  | 306 +++++++++++++++++++++++++
 include/linux/platform_data/cros_ec_commands.h |  29 ++-
 3 files changed, 340 insertions(+), 2 deletions(-)
---
base-commit: 33035b665157558254b3c21c3f049fd728e72368
change-id: 20250429-cros_ec_fan-da3b64ac9c10

Best regards,
-- 
Sung-Chi Li <lschyi@chromium.org>


