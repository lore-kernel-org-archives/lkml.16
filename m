Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47C41E0E13;
	Mon, 31 Mar 2025 18:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743445930; cv=none; b=NwB5N0tWp28N4zonlqWZ7bVVSYEefxuYYibxm1iYWs1KSBm014EadtF2UEW9B0Z/RImj6MkZqeyHzA2G5IkCtsXbTBMJx+4mDs2GQSS+pM8JjQgNOhP9pIwWj7Woq5VfCD5E5WFjtDPKAlhzLMNblUfwJA5HbDqNd6GM+4/qOy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743445930; c=relaxed/simple;
	bh=hCHGLIQRlS81v4saVTJQKp++mO53XYCzWBbD9/uwNc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kR+aF+qIAq33WfDpzzxzw8UoDgOBNH76zbcNKxp53FG40ADfLn1ViRCdGSEdq8IWV9DhRkVXYvSZ28IdgcsYgotlBX9MpSmik9ddabZacJtXf5m853Vww46H4bizTESnGYGmhmPUMdIXG8IGkOC9vUfCzioF1zNGbQn0UImA9iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=ZHSG+/3g; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="ZHSG+/3g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1743445924;
	bh=hCHGLIQRlS81v4saVTJQKp++mO53XYCzWBbD9/uwNc4=;
	h=From:Date:Subject:To:Cc:From;
	b=ZHSG+/3g6fYVOaFci988hLr4Ulh49rqUJRa62h9ABOKeiJz+tbVY0ZanB/YyJHi/6
	 8VNM+jIKWeqjqs8uQC6yBFRBMfe72xl4iUubXv4aIsR8v5laS1he6w/dtIG5J+FcmF
	 4NrO0UDJQG3oG8HtaMF53Fie8KawmfJoipP0R/1c=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 31 Mar 2025 20:29:47 +0200
Subject: [PATCH] MAINTAINERS: consistently use my dedicated email address
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250331-email-correction-v1-1-4c0e92862202@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIABrf6mcC/x2MWwqAIBAAryL7neCjILtK9CG21kJprBFBdPekz
 4GZeaAgExYYxAOMFxXKqYJuBITVpwUlzZXBKNMpa7XE3dMmQ2bGcFZZamd73YZoXTRQs4Mx0v0
 vx+l9P8PUmD1iAAAA
X-Change-ID: 20250331-email-correction-193814cf39f2
To: Tzung-Bi Shih <tzungbi@kernel.org>, Benson Leung <bleung@chromium.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 chrome-platform@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743445923; l=2962;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=hCHGLIQRlS81v4saVTJQKp++mO53XYCzWBbD9/uwNc4=;
 b=Tp0HEruAidpJojz6x3Rwemd36RYaKTRqh0VwqC4u3VxhSrEGurR0Yoat1Nw0gaURCZHNI4vGO
 TS7YlRn5eluAJMqLC3BxI18Cw6hfYK0iXGgFzcVzBKA0E03qoGJ6jjI
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

I use a dedicated address for kernel development.
Unfortunately at some point I used another address and later copied it
around to other places.

Consistently use the dedicated address everywhere.

As the old address does in fact work, an update to mailmap is
not necessary.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Could this be merged either through the chrome platform or pdx86 tree?
---
 MAINTAINERS                         | 8 ++++----
 drivers/platform/x86/gigabyte-wmi.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 306b1384eb6d4cb7a310ada44605eaeb88cc732f..dedd5a82886ac564cb7751b9c71ef86a087b4a8b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5506,12 +5506,12 @@ F:	Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
 F:	sound/soc/codecs/cros_ec_codec.*
 
 CHROMEOS EC CHARGE CONTROL
-M:	Thomas Weißschuh <thomas@weissschuh.net>
+M:	Thomas Weißschuh <linux@weissschuh.net>
 S:	Maintained
 F:	drivers/power/supply/cros_charge-control.c
 
 CHROMEOS EC HARDWARE MONITORING
-M:	Thomas Weißschuh <thomas@weissschuh.net>
+M:	Thomas Weißschuh <linux@weissschuh.net>
 L:	chrome-platform@lists.linux.dev
 L:	linux-hwmon@vger.kernel.org
 S:	Maintained
@@ -5519,7 +5519,7 @@ F:	Documentation/hwmon/cros_ec_hwmon.rst
 F:	drivers/hwmon/cros_ec_hwmon.c
 
 CHROMEOS EC LED DRIVER
-M:	Thomas Weißschuh <thomas@weissschuh.net>
+M:	Thomas Weißschuh <linux@weissschuh.net>
 S:	Maintained
 F:	drivers/leds/leds-cros_ec.c
 
@@ -9992,7 +9992,7 @@ F:	Documentation/hwmon/gigabyte_waterforce.rst
 F:	drivers/hwmon/gigabyte_waterforce.c
 
 GIGABYTE WMI DRIVER
-M:	Thomas Weißschuh <thomas@weissschuh.net>
+M:	Thomas Weißschuh <linux@weissschuh.net>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/gigabyte-wmi.c
diff --git a/drivers/platform/x86/gigabyte-wmi.c b/drivers/platform/x86/gigabyte-wmi.c
index f6ba88baee4da8734809013067a8ecbd17ff7d3d..f42c85607a6bc8a751ec215b1818edf160acf644 100644
--- a/drivers/platform/x86/gigabyte-wmi.c
+++ b/drivers/platform/x86/gigabyte-wmi.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *  Copyright (C) 2021 Thomas Weißschuh <thomas@weissschuh.net>
+ *  Copyright (C) 2021 Thomas Weißschuh <linux@weissschuh.net>
  */
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
@@ -159,6 +159,6 @@ static struct wmi_driver gigabyte_wmi_driver = {
 module_wmi_driver(gigabyte_wmi_driver);
 
 MODULE_DEVICE_TABLE(wmi, gigabyte_wmi_id_table);
-MODULE_AUTHOR("Thomas Weißschuh <thomas@weissschuh.net>");
+MODULE_AUTHOR("Thomas Weißschuh <linux@weissschuh.net>");
 MODULE_DESCRIPTION("Gigabyte WMI temperature driver");
 MODULE_LICENSE("GPL");

---
base-commit: 609706855d90bcab6080ba2cd030b9af322a1f0c
change-id: 20250331-email-correction-193814cf39f2

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

