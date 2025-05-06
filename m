Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1702277021
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 11:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746529222; cv=none; b=VvIv13t2zaiKqBAT5Xx3ATQU72QkykNR/mvgxDJLpigMpZswB8WrW/kgaIPV/0T8B6m6rjcVl4Mc89kj2Uu4hmj7MXGxWOpdTXE4rrDAFnsuob9Zp32uFEe0wHNgFwqzdz9OqXLVnUuvkA+u5gblYK3kmflC7cmsjFqOHQH4Kb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746529222; c=relaxed/simple;
	bh=2FK34TDVpzFxuDR64LSb5BuRqCCt3kIA//1O9qEW4d8=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hn8l6XVobyMBKNUcePVY750+Zl0dCt/vpILNEgEUg4Ij4BHLN19rFQYuiZ2Dm0yngCoZBCprxz6nkMIiZEP5jxKl+kIYyBeplTHlT1vXIti7vdhAOysyhUQmauca50nGYHzR13lFOWrzxY1Qg5L2raqoFJWS9ZOjR9TDFQMJjqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=Noq5Z0Tj; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="Noq5Z0Tj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1746529212; x=1746788412;
	bh=jpbwGmjDsaT++Arg0RH1dhnTlcrqhXSMrEFZw5Kex8Y=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=Noq5Z0TjP3hX/LInB6+ydx5V1REriPGupC4pjn9V7Mtw/8FD+k8vlXhCkQe6is96T
	 mOW5JEC3M6ilsp9OiZI+TkMpHE648gFlGS55xxRobG9dFK+hlYNAUbNgIL6+YO4wFj
	 VBoH7ynLu/v+rYFZ4P/gTgwdkicE4ONIODFyXfroEd5DxQAOqCMqSLMBpQ0BPmB3PO
	 hMow19dPemF+7AlHvuHsjHjKtqbM06PAZPT2NdR9e1GkHoUQKMtkGshyAD5zVgA6g9
	 zH3jGRxxNX/KBjPi/eBC43n3sbuxf+lBBw/D7QrTXzQZRHIE9+87sB9WHzTtZzolWO
	 H930am1hdhfJw==
Date: Tue, 06 May 2025 11:00:07 +0000
To: eric.piel@tremplin-utc.net, corbet@lwn.net, gregkh@linuxfoundation.org, arnd@arndb.de, linux-kernel@vger.kernel.org
From: Roxana Nicolescu <nicolescu.roxana@protonmail.com>
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] misc: lis3lv02d: Fix correct sysfs directory path for lis3lv02d
Message-ID: <20250506110002.36477-1-nicolescu.roxana@protonmail.com>
Feedback-ID: 136600343:user:proton
X-Pm-Message-ID: ae345caf53851cecc608073d0b98aff61ba09938
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The lis3lv02d driver does not create a platform device anymore. It was
recently changed to use a faux device instead. Therefore the sysfs path
has changed from /sys/devices/platform/lis3lv02d to
/sys/devices/faux/lis3lv02d.

Fixes: 3b18ccb5472b ("misc: lis3lv02d: convert to use faux_device")
Signed-off-by: Roxana Nicolescu <nicolescu.roxana@protonmail.com>
---
 Documentation/misc-devices/lis3lv02d.rst | 6 +++---
 drivers/misc/lis3lv02d/Kconfig           | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/misc-devices/lis3lv02d.rst b/Documentation/misc-=
devices/lis3lv02d.rst
index 959bd2b822cf..6b3b7405ebdf 100644
--- a/Documentation/misc-devices/lis3lv02d.rst
+++ b/Documentation/misc-devices/lis3lv02d.rst
@@ -22,10 +22,10 @@ sporting the feature officially called "HP Mobile Data =
Protection System 3D" or
 models (full list can be found in drivers/platform/x86/hp_accel.c) will ha=
ve
 their axis automatically oriented on standard way (eg: you can directly pl=
ay
 neverball). The accelerometer data is readable via
-/sys/devices/platform/lis3lv02d. Reported values are scaled
+/sys/devices/faux/lis3lv02d. Reported values are scaled
 to mg values (1/1000th of earth gravity).
=20
-Sysfs attributes under /sys/devices/platform/lis3lv02d/:
+Sysfs attributes under /sys/devices/faux/lis3lv02d/:
=20
 position
       - 3D position that the accelerometer reports. Format: "(x,y,z)"
@@ -85,7 +85,7 @@ the accelerometer are converted into a "standard" organis=
ation of the axes
 If your laptop model is not recognized (cf "dmesg"), you can send an
 email to the maintainer to add it to the database.  When reporting a new
 laptop, please include the output of "dmidecode" plus the value of
-/sys/devices/platform/lis3lv02d/position in these four cases.
+/sys/devices/faux/lis3lv02d/position in these four cases.
=20
 Q&A
 ---
diff --git a/drivers/misc/lis3lv02d/Kconfig b/drivers/misc/lis3lv02d/Kconfi=
g
index bb2fec4b5880..56005243a230 100644
--- a/drivers/misc/lis3lv02d/Kconfig
+++ b/drivers/misc/lis3lv02d/Kconfig
@@ -10,7 +10,7 @@ config SENSORS_LIS3_SPI
 =09help
 =09  This driver provides support for the LIS3LV02Dx accelerometer connect=
ed
 =09  via SPI. The accelerometer data is readable via
-=09  /sys/devices/platform/lis3lv02d.
+=09  /sys/devices/faux/lis3lv02d.
=20
 =09  This driver also provides an absolute input class device, allowing
 =09  the laptop to act as a pinball machine-esque joystick.
@@ -26,7 +26,7 @@ config SENSORS_LIS3_I2C
 =09help
 =09  This driver provides support for the LIS3LV02Dx accelerometer connect=
ed
 =09  via I2C. The accelerometer data is readable via
-=09  /sys/devices/platform/lis3lv02d.
+=09  /sys/devices/faux/lis3lv02d.
=20
 =09  This driver also provides an absolute input class device, allowing
 =09  the device to act as a pinball machine-esque joystick.
--=20
2.34.1


