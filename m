Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843ED1EB9F6;
	Tue, 11 Feb 2025 07:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739257303; cv=none; b=RlO5WuGc/uAZ/5mOGD2/VAH2FefFtr/s+wKIAMEH2wbrka6tnx5OodV5tUPgMZvtTYLV9sAypOXp8WDPDFO/uHrFx/PrpxR39nGB/BvjDVhDZtx/DDzrL+GEVIZVtYQBDu1+MsqQIW1z+BlzOAwiSbtycul9U67JWu6v92K7G50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739257303; c=relaxed/simple;
	bh=sr2IgtJYE8sPS1hnzttAFXQJSTSxMHA8wKwZp6MRVmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jHboSJpCr5kWDKlaC9Cq2TTBQDNX6aXjlz+vIAfbxalJ+R7XicE5NGb368qW4RffgqDxLI3Prlm6TKmfEd4fVm5MI0x/9uwrBr2VJ0dTPQTnow/tKNXTYRIoUd4IkDoe53guCG5fyBGVBMqFxTCHCk3Q4wVW/J2PrUuldCjWUFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aebkpSSa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aebkpSSa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07C35C4CEDD;
	Tue, 11 Feb 2025 07:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739257303;
	bh=sr2IgtJYE8sPS1hnzttAFXQJSTSxMHA8wKwZp6MRVmc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aebkpSSa023zOiVfF10V9QrELDdDz0ov8PF6WpwScwyGEYuupx55j9rhNmLHlHlqI
	 pCG2FQS4VZFIgPP1wBDidnBAFZVbFk4C2cFROOs+jRPd2EN8nz6bjhIHo7wjnL6N1A
	 Btnp6wwnDTgKECu/8X6fo/fXmMAF0m8izF+NLg7hSOqxwKVZlino8AaCyMWsyu290l
	 xuFWBcjjf9z3QWtctTqjvIsUdh+LT7ioLEFrcHUSnI9y485Yh6Az61FfsK8gXGMG3A
	 2cIyXSn3kYSNer4fSM576O5UZzVnc0LYiP2B+KA/nELWAMyKY+zfPqbOdZAe8W9iN0
	 lHkcQeNKjGKRQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E80AFC021A0;
	Tue, 11 Feb 2025 07:01:42 +0000 (UTC)
From: Cryolitia PukNgae via B4 Relay <devnull+Cryolitia.gmail.com@kernel.org>
Date: Tue, 11 Feb 2025 15:01:18 +0800
Subject: [PATCH v5 2/2] hwmon: document: add gpd-fan
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-gpd_fan-v5-2-608f4255f0e1@gmail.com>
References: <20250211-gpd_fan-v5-0-608f4255f0e1@gmail.com>
In-Reply-To: <20250211-gpd_fan-v5-0-608f4255f0e1@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Cryolitia PukNgae <Cryolitia@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, Celeste Liu <CoelacanthusHex@gmail.com>, 
 Yao Zi <ziyao@disroot.org>, Derek John Clark <derekjohn.clark@gmail.com>, 
 =?utf-8?q?Marcin_Str=C4=85gowski?= <marcin@stragowski.com>, 
 someone5678 <someone5678.dev@gmail.com>, 
 Justin Weiss <justin@justinweiss.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3009;
 i=Cryolitia@gmail.com; h=from:subject:message-id;
 bh=Ra7Bz7JR/t/+vRZrFRWqPASIg4t3PfuJpe83YD+tFAY=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0did012TXdDV1dQRU9OYzFGS3JRM2phY
 lVraHZSVlh5K1VMYkc2OU92aXNqbmZkZ1RuYjdCMTdWRlptcUR3CjhOM0tTK2RLdHN1SGJSUVQ2
 Q2hsWVJEallwQVZVMlJaSVdNOXNhNmtLL3VLZk1zZW1EbXNUQ0JER0xnNEJXQWkKRHFvTS83TmJ
 MdVUyM2JtcnRiYmZPZEoyNDl5T3l3dnJEQ04yWnA0MjVyOFJhSm5Ub2Nid3Y4aEthZm5yaWlsTg
 ptN2Y5a3RPcFBtZ3I4SDIxN3RORHU1T1BxaGh4UHhYWXl3d0EKPVl0REsKLS0tLS1FTkQgUEdQI
 E1FU1NBR0UtLS0tLQo=
X-Developer-Key: i=Cryolitia@gmail.com; a=openpgp;
 fpr=1C3C6547538D7152310C0EEA84DD0C0130A54DF7
X-Endpoint-Received: by B4 Relay for Cryolitia@gmail.com/default with
 auth_id=186
X-Original-From: Cryolitia PukNgae <Cryolitia@gmail.com>
Reply-To: Cryolitia@gmail.com

From: Cryolitia PukNgae <Cryolitia@gmail.com>

Add GPD fan driver document

Signed-off-by: Cryolitia PukNgae <Cryolitia@gmail.com>
---
 Documentation/hwmon/gpd-fan.rst | 63 +++++++++++++++++++++++++++++++++++++++++
 Documentation/hwmon/index.rst   |  1 +
 MAINTAINERS                     |  1 +
 3 files changed, 65 insertions(+)

diff --git a/Documentation/hwmon/gpd-fan.rst b/Documentation/hwmon/gpd-fan.rst
new file mode 100644
index 0000000000000000000000000000000000000000..9d478c7350b5fb88e43e54407503dac441328142
--- /dev/null
+++ b/Documentation/hwmon/gpd-fan.rst
@@ -0,0 +1,63 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver gpd-fan
+=========================
+
+Author:
+    - Cryolitia PukNgae <Cryolitia@gmail.com>
+
+Description
+------------
+
+Handheld devices from Shenzhen GPD Technology Co., Ltd. provide fan readings and fan control through
+their embedded controllers.
+
+Supported devices
+-----------------
+
+Currently the driver supports the following handhelds:
+
+ - GPD Win Mini (7840U)
+ - GPD Win Mini (8840U)
+ - GPD Win Max 2
+ - GPD Win Max 2 2023 (7840U)
+ - GPD Win Max 2 2024 (8840U)
+ - GPD Win 4 (6800U)
+ - GPD Win 4 (7840U)
+
+Module parameters
+-----------------
+
+gpd_fan_board
+  Force specific which module quirk should be used.
+  Use it like "gpd_fan_board=wm2".
+
+   - wm2
+       - GPD Win 4 (7840U)
+       - GPD Win Max 2 (6800U)
+       - GPD Win Max 2 2023 (7840U)
+       - GPD Win Max 2 2024 (8840U)
+   - win4
+       - GPD Win 4 (6800U)
+   - win_mini
+       - GPD Win Mini (7840U)
+       - GPD Win Mini (8840U)
+
+Sysfs entries
+-------------
+
+The following attributes are supported:
+
+fan1_input
+  Read Only. Reads current fan RPM.
+
+pwm1_enable
+  Read/Write. Enable manual fan control. Write "0" to disable control and run at
+  full speed. Write "1" to set to manual, write "2" to let the EC control decide
+  fan speed. Read this attribute to see current status.
+
+pwm1
+  Read/Write. Read this attribute to see current duty cycle in the range [0-255].
+  When pwm1_enable is set to "1" (manual) write any value in the range [0-255]
+  to set fan speed.
+
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 55f1111594b2e9ada4a881e5d4d8884f33256d1f..d5c7cd0cfdeb7059b6cd83050ae98aa7cb1334e6 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -80,6 +80,7 @@ Hardware Monitoring Kernel Drivers
    gigabyte_waterforce
    gsc-hwmon
    gl518sm
+   gpd-fan
    gxp-fan-ctrl
    hih6130
    hp-wmi-sensors
diff --git a/MAINTAINERS b/MAINTAINERS
index 777ba74ccb07ccc0840c3cd34e7b4d98d726f964..20faebeae981e4b7619fb10331c50525d98db944 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9766,6 +9766,7 @@ GPD FAN DRIVER
 M:	Cryolitia PukNgae <Cryolitia@gmail.com>
 L:	linux-hwmon@vger.kernel.org
 S:	Maintained
+F:	Documentation/hwmon/gpd-fan.rst
 F:	drivers/hwmon/gpd-fan.c
 
 GPD POCKET FAN DRIVER

-- 
2.47.1


