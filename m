Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9125424467A;
	Thu, 19 Jun 2025 07:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750318977; cv=none; b=hZQU9FxGHeXBZr1qJaHyJj3fJ3f3hlrncZSGHlt3vekRumTjM4VMfiC9nnYzBfW0/Sv5dgzsdMhijUd1OHl9YRFcB2CZBGXXpc2F7GJOz6t1ngV4fY8GoE+Yqd6FAZa5+2wE+ippdD2sCa5J6alTfkvX8P8+//4LHWwCXkNr5R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750318977; c=relaxed/simple;
	bh=9qb8RJoUhgul5Go2hZXCbdox/mF+r49Ysd7ZI3Y+oLA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=suzWvpkgspt6cmgm+cn2R6dhGNMto1MAPv85UbUxc5w6Fb2Wkce115NngaGbcOdcyCvoJiaHltdvx1iEGde6vKrcdO0SBtGMk7nJ9S3n0h0h18bXCjICHPvSy40+C3ccK2pHr9nb1rixvz3fZ7F+sGZhuhfsJkwS5AvCDP+lyTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H1KiiZX1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H1KiiZX1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B21FC4CEED;
	Thu, 19 Jun 2025 07:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750318977;
	bh=9qb8RJoUhgul5Go2hZXCbdox/mF+r49Ysd7ZI3Y+oLA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=H1KiiZX1oIxAtKoqlMHXHIVHed86uVZpD+tu/Ca+saVyibAfAwbUoU340nvHFgIgW
	 EPXrWSKpceY1M0bnK5eJOsgx1w6brENlL1H/yCldFOv+Zf1XEe6QmVijkV5QjFy3F1
	 I2KqetbX8BNgl6mqNAYsKROMSqwxTFlQty8gbCb4f/OOAlhqVTAtglKAEfkAs0cnO5
	 U8YIbd6X5A8MtTi0OXTRXUJdIOxRPChAv3kPmUw96+rUxLCy/VyqRjOIiEhBubzM5C
	 9Qlxe2e9nCNwBd4lUEvZAMNiUiYcLQ48M5LxQh+6w+egwm/ZVcVvbFfUdpftZsuIEN
	 tmBa2b4GDOB6A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B4B9C7115A;
	Thu, 19 Jun 2025 07:42:57 +0000 (UTC)
From: Sung-Chi Li via B4 Relay <devnull+lschyi.chromium.org@kernel.org>
Subject: [PATCH v4 0/3] Export fan control and register fans as cooling
 devices
Date: Thu, 19 Jun 2025 15:42:53 +0800
Message-Id: <20250619-cros_ec_fan-v4-0-ca11548ce449@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH2/U2gC/23NSw6CMBSF4a2Qjq3p04Aj92EM6eMWOoCaVhsNY
 e8WJipheG7y/XdCCaKHhM7VhCJkn3wYyxCHCplejR1gb8tGjDBJBGuwiSG1YFqnRmwV1yehTGM
 oQUXcIzj/WmvXW9m9T48Q32s80+W638kUE6xq2wAHpzVVF9PHMPjncAyxQ0sqsy+XhP1zVriws
 q5LWhHqdjj/4XTD+fK9cUwzKR0xdsPnef4A6WbDmycBAAA=
X-Change-ID: 20250429-cros_ec_fan-da3b64ac9c10
To: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Sung-Chi Li <lschyi@google.com>, Sung-Chi Li <lschyi@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750318976; l=4074;
 i=lschyi@chromium.org; s=20250429; h=from:subject:message-id;
 bh=9qb8RJoUhgul5Go2hZXCbdox/mF+r49Ysd7ZI3Y+oLA=;
 b=sqGQ1pEaKFju1CzI4hdoX/iGbWtY98SgZNiHqg/2pz1p/P73Psi/JEw9upYOyghubiqbRhpQR
 ghFxt3zETz/BP6dbbGOIqWH38LxvFL5LZTRtcdvQi7+Inoog03iHM05
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
Changes in v4:
- Treat fan control is supported without `CONFIG_PM` is enabled.
- Change logic of registering cooling devices for fan from abandom
  immediately to log warning logs, then continue with the next fan.
- Fix error checking logic to use IS_ERR for
  devm_thermal_of_cooling_device_register.
- Revise variable declaration ordering with reverse christmas tree.
- Rename member variable `manual_fan_pwm_values` to `manual_fan_pwm`.
- Use %pe for printing error pointers, and add newline for logs.
- Revise comments in suspend and resume hook.
- Link to v3: https://lore.kernel.org/r/20250512-cros_ec_fan-v3-0-a9f2b255f0cd@chromium.org

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
 drivers/hwmon/cros_ec_hwmon.c                  | 310 +++++++++++++++++++++++++
 include/linux/platform_data/cros_ec_commands.h |  29 ++-
 3 files changed, 344 insertions(+), 2 deletions(-)
---
base-commit: 85086c90284303c1fd60fdd6ac5e6751443e44d6
change-id: 20250429-cros_ec_fan-da3b64ac9c10

Best regards,
-- 
Sung-Chi Li <lschyi@chromium.org>


