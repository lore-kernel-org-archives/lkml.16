Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0188527B505;
	Tue, 29 Apr 2025 08:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745914467; cv=none; b=BDEA65ykd8NRx0wp7B+zY/D8Qt0zKkUsRRca3DCGqXkyvalU8ZtoiGdSUGUGnlT06r0hQFysJQAmEkfTIgYk3J1rAHQy/FelY8bv+PIiDo37NUlL1G1UPZYJ2i+1Rp8vNO8pce5e0v+MxU4/kY+Z3nz2idxkdbt812stO31pVQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745914467; c=relaxed/simple;
	bh=Plr+eKET24dQ8Cc4qkU4oOyv/FkIHbVvHYuJwqLayx0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qnBzD30hCOTxHB0t9GUkKPYg1cQ20GzVf03SZN1MFX7ni6PFXIMgpoTvzU1Kr8MANWfwxWK3i5jETbS94f8tdVFcXb/VuZbEOvDIKhv4mBG/Y/6UiycFLgzdcXISXqo77VWy4357ITiWXKd+flKibMVrYIMnpFB5VnDf3c3CZe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bPt7ClTT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bPt7ClTT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77B59C4CEE3;
	Tue, 29 Apr 2025 08:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745914466;
	bh=Plr+eKET24dQ8Cc4qkU4oOyv/FkIHbVvHYuJwqLayx0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=bPt7ClTTXxsUQx8mrVoF2onrKglSrN/BqoMcoM6bNf+s7k1J7LcCmkgbOBNJi1FDp
	 QRk3+HYJ7ijCSV+pnWtTEdzG/liAmBeIhPajnktEcD9P3AhxBPx2zbvHuC48MOUVbS
	 TKl0d+79JOdfOfcpl2tnekYWJ5IKfYJoFhnbxqtgFH/V2l+Nm2E3HfdanJsn/pwKxy
	 E1DJXuQOLG162moUWnI/bh3G4RFZMOkV1QXtEOsy+O43O+YIWdR02BGsqJnXxU2hMM
	 7g0KACYpTXISsiLnJwgiD7gBriiEUqs2kHUjSWWTjBupquBkctYl0F33VbRteBWNnp
	 0G/Z/FcS7hFpg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E8B4C369DC;
	Tue, 29 Apr 2025 08:14:26 +0000 (UTC)
From: Sung-Chi Li via B4 Relay <devnull+lschyi.chromium.org@kernel.org>
Subject: [PATCH 0/3] Export fan control and register fans as cooling
 devices
Date: Tue, 29 Apr 2025 16:14:20 +0800
Message-Id: <20250429-cros_ec_fan-v1-0-a8d9e3efbb1a@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFyKEGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyNL3eSi/OL41OT4tMQ83ZRE4yQzk8Rky2RDAyWgjoKi1LTMCrBp0bG
 1tQBABFOaXQAAAA==
X-Change-ID: 20250429-cros_ec_fan-da3b64ac9c10
To: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Sung-Chi Li <lschyi@google.com>, Sung-Chi Li <lschyi@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745914465; l=2176;
 i=lschyi@chromium.org; s=20250429; h=from:subject:message-id;
 bh=Plr+eKET24dQ8Cc4qkU4oOyv/FkIHbVvHYuJwqLayx0=;
 b=B+aPviG+tNfkDTwtlggR0zOZTRRU03+WGP9jdqEtermjB3Z2bUBztZ357bM6C4CzxoEjJuoBK
 exqeoiWY7LmAU6Nr6j7XhC29otBOCoENKGoq0Y5jQaso56VLRpwqrBw
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
Sung-Chi Li (3):
      platform/chrome: update pwm fan control host commands
      hwmon: (cros_ec) add PWM control over fans
      hwmon: (cros_ec) register fans into thermal framework cooling devices

 Documentation/hwmon/cros_ec_hwmon.rst          |   7 +-
 drivers/hwmon/cros_ec_hwmon.c                  | 309 ++++++++++++++++++++++++-
 include/linux/platform_data/cros_ec_commands.h |  29 ++-
 3 files changed, 339 insertions(+), 6 deletions(-)
---
base-commit: 33035b665157558254b3c21c3f049fd728e72368
change-id: 20250429-cros_ec_fan-da3b64ac9c10

Best regards,
-- 
Sung-Chi Li <lschyi@chromium.org>


