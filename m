Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F80E19FA8D;
	Fri,  2 May 2025 05:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746164094; cv=none; b=tqb2OyRG72RE7B+D5GtdZNGsgjjXfsScSYW3yjh3yscPUD6JYO3yEfeXglLHq/5+rOZ3Avzjp4VnltrualU8utafBrI+5XrEhLpvHdhIKjn5JDvStd/Zz2xyo5q12LNdfzKfOkQ26ae2TfjIvvPSViQH1RTNSQiIsGQAVcdPOAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746164094; c=relaxed/simple;
	bh=KLyWWIpNFhDYUhaND9qD9RHoBDrHRDJMdlpTn12gGg4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=q6IPsZJeES3jnV3+6Lg9/biJ7YSy/0YNcVsP7j9wkk0gFPdbN4iJuYJgGYjgGRdzq+IwK+wHlmSZv1E1dHh6S52YjLnHo+fFmkzUE4iXbB79lrQHnExAU2GIAPri2zneRKD/Ndr7NmKPymnPYChBFS8wHaQactTDD/6Ud9/oVG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iUFPZBmT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iUFPZBmT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9D58C4CEE4;
	Fri,  2 May 2025 05:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746164093;
	bh=KLyWWIpNFhDYUhaND9qD9RHoBDrHRDJMdlpTn12gGg4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=iUFPZBmTGFvAZ+1dco05rx9Dn4a8/ed3M6ucvaglKmBpVNn9pmMCgPK8XCLPSYY1T
	 i9Qtn7QoeaLYqbbd2YIpe6jy7O+1Ul1Z5mhkIYlRYY4t3VcAnSAvkE5KfN7n3X+QI6
	 8WvQEgFC3kWYWwZpUw6kKHTc97njtJhsFouoF9X3NxtTW8UEGO6LD58QwgnIcXSMCi
	 tSa1LdqD5YkXA+/X067cwRJyQUuz1F40EY7YuKe+43zmPHWPij2PT7alpqD+MdcW7D
	 38/WKMpci99S8ixDyY9WNui3oRVS1dEGzh4JTN6x0re/xn2M9AZxHFB/nfdMV/DAyJ
	 Lpf098jHosRWw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5471C3ABA9;
	Fri,  2 May 2025 05:34:53 +0000 (UTC)
From: Sung-Chi Li via B4 Relay <devnull+lschyi.chromium.org@kernel.org>
Subject: [PATCH v2 0/3] Export fan control and register fans as cooling
 devices
Date: Fri, 02 May 2025 13:34:44 +0800
Message-Id: <20250502-cros_ec_fan-v2-0-4d588504a01f@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHRZFGgC/23MQQ6CMBCF4auQWVvTFjTWlfcwhAxloLOAmqkSD
 endraxd/i953waJhCnBtdpAaOXEcSlhDxX4gMtEiofSYLU96cY65SWmjnw34qIGrPtzg955o6E
 8HkIjv3ft3pYOnJ5RPju+mt/631mN0govg6Oaxr43ePNB4syv+Rhlgjbn/AX3TPOvqQAAAA==
X-Change-ID: 20250429-cros_ec_fan-da3b64ac9c10
To: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Sung-Chi Li <lschyi@google.com>, Sung-Chi Li <lschyi@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746164092; l=2642;
 i=lschyi@chromium.org; s=20250429; h=from:subject:message-id;
 bh=KLyWWIpNFhDYUhaND9qD9RHoBDrHRDJMdlpTn12gGg4=;
 b=aNL/Qtmvl8LnJJ+DCJb69VFm2O7Bo7Gqjv27A2d/4mlCa7IxVqSntzbQM4M9O+HBFVCm8HXo5
 cTLVn8k2zK4ANZOiqhsphzynlWGE8+RuK9k0YwFLrds/3WFiql3q8Ur
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
 drivers/hwmon/cros_ec_hwmon.c                  | 267 +++++++++++++++++++++++++
 include/linux/platform_data/cros_ec_commands.h |  29 ++-
 3 files changed, 301 insertions(+), 2 deletions(-)
---
base-commit: 33035b665157558254b3c21c3f049fd728e72368
change-id: 20250429-cros_ec_fan-da3b64ac9c10

Best regards,
-- 
Sung-Chi Li <lschyi@chromium.org>


