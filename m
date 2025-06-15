Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACC127CB02;
	Sun, 15 Jun 2025 18:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750010425; cv=none; b=YiJBxFUgYpX5y+gTB1K99TZNYtnFkiC0E+Koa280dxRkeUv+iLPWtRJTOJyhdyL15DWk5NhvhPaWnoZCWRH22FdSSKzFyr5OGHIRs50YkbeuH31lS2d7sjS1gflBdsfkEAaScsfFGwA2nE0YI1sGSHBOXtTxP0+E+nuyPCLczAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750010425; c=relaxed/simple;
	bh=QgeyTZVZKOf/8ActcxewZRBrHCIvnTgKTouqgxzGQF0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fEO4IEWPyT4ZKKBdRlLSauH3lS9LRr91KMPfR0Rd+60lbLc260C7BfB57L/PL2mgEadhX3WJ5Xx+T/EdS0hlAjP4WAu0WQFhmFUZXll5tg+tq4r+3WuJP5hMSONbIPNhIXDVgXaazggQuJ4TXHpemi54O4uZQqLRnQSdSis5Jc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=HJ499vWT; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="HJ499vWT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1750010415; x=1750615215; i=w_armin@gmx.de;
	bh=hna+rt+oNeHuCjg+5zbcQwdllAa1K0DJq60jQTBqmIk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=HJ499vWTTKaQqKdCIUaVYvmMS2mvzfa62uLFr4mafIzZscakZ355g82wHdFgxqCG
	 rOhNFrF+Tgh76Yn5ewaafKRpYzA0MEBom8MrAqeMcPFhGvoidj1gM7jfqCX/gsbcN
	 wT5sIHDRmWyru97+03M4wTpLmfOqYXeql3co+BrGFrer/UVyArxGldQDWg4g5B+vH
	 elfqBC9vq4dTd1niC+J5DnvJaPLN/KP/du/+8fVjLyHXBfvNHr2p91T1erDVoJumt
	 v8fadc1Dy+bc27IbjIlAleiGy/MyR8KIZvkb+O4dMLx5nnXJ3T9cICIziL9xALBIR
	 dlERSL/tmQTSV6Qqzg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([87.177.78.219]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MWRRZ-1uJYCT3LDP-00V4kG; Sun, 15 Jun 2025 20:00:14 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	chumuzero@gmail.com,
	corbet@lwn.net,
	cs@tuxedo.de,
	wse@tuxedocomputers.com,
	ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [RFC PATCH 3/3] Documentation: laptops: Add documentation for uniwill laptops
Date: Sun, 15 Jun 2025 19:59:57 +0200
Message-Id: <20250615175957.9781-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250615175957.9781-1-W_Armin@gmx.de>
References: <20250615175957.9781-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yyWq/asKig2O69Toi1Nb0pKOCxGMsmdFUV6mfUhRr+xJhIsDaow
 lTAAbt5b4BfpkTA/lqhFDoEIldLGs0PsU5kA8E9D0Ngs7HoFvO+dJXf9HvD+EZthErotomG
 eDw3r+fQ0alcPDFMKcE+3QZo1CJkM+EKV/FnGZRdPGz0+zpM2K9yE5b1ig+I+sU6+Pw88UI
 DmylsjfpzgASgEFc4Sb6w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QyDqTdSZ8t4=;ZUCqakBQZMJqrdj3Nq7p/T0X6dg
 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

Add documentation for admins regarding Uniwill laptops. This should
help users to setup the uniwill-laptop and uniwill-wmi drivers, which
sadly cannot be loaded automatically.

Reported-by: cyear <chumuzero@gmail.com>
Closes: https://github.com/lm-sensors/lm-sensors/issues/508
Closes: https://github.com/Wer-Wolf/uniwill-laptop/issues/3
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 Documentation/admin-guide/laptops/index.rst   |  1 +
 .../admin-guide/laptops/uniwill-laptop.rst    | 68 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 70 insertions(+)
 create mode 100644 Documentation/admin-guide/laptops/uniwill-laptop.rst

diff --git a/Documentation/admin-guide/laptops/index.rst b/Documentation/a=
dmin-guide/laptops/index.rst
index db842b629303..6432c251dc95 100644
=2D-- a/Documentation/admin-guide/laptops/index.rst
+++ b/Documentation/admin-guide/laptops/index.rst
@@ -17,3 +17,4 @@ Laptop Drivers
    sonypi
    thinkpad-acpi
    toshiba_haps
+   uniwill-laptop
diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst b/Docume=
ntation/admin-guide/laptops/uniwill-laptop.rst
new file mode 100644
index 000000000000..8b977c09e747
=2D-- /dev/null
+++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
@@ -0,0 +1,68 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+Uniwill laptop extra features
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
+
+On laptops manufactured by Uniwill (either directly or as ODM), the ``uni=
will-laptop`` and
+``uniwill-wmi`` driver both handle various platform-specific features.
+However due to a design flaw in the underlying firmware interface, both d=
rivers might need
+to be loaded manually on some devices.
+
+.. warning:: Not all devices supporting the firmware interface will neces=
sarily support those
+             drivers, please be careful.
+
+Module Loading
+--------------
+
+The ``uniwill-laptop`` driver relies on a DMI table to automatically load=
 on supported devices.
+When using the ``force`` module parameter, this DMI check will be omitted=
, allowing the driver
+to be loaded on unsupported devices for testing purposes.
+
+The ``uniwill-wmi`` driver always needs to be loaded manually. However th=
e ``uniwill-laptop``
+driver will automatically load it as a dependency.
+
+Hotkeys
+-------
+
+Usually the FN keys work without a special driver. However as soon as the=
 ``uniwill-laptop`` driver
+is loaded, the FN keys need to be handled manually. This is done by the `=
`uniwill-wmi`` driver.
+
+Keyboard settings
+-----------------
+
+The ``uniwill-laptop`` driver allows the user to enable/disable:
+
+ - the FN and super key lock functionality of the integrated keyboard
+ - the touchpad toggle functionality of the integrated touchpad
+
+See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details.
+
+Hwmon interface
+---------------
+
+The ``uniwill-laptop`` driver supports reading of the CPU and GPU tempera=
ture and supports up to
+two fans. Userspace applications can access sensor readings over the hwmo=
n sysfs interface.
+
+Platform profile
+----------------
+
+Support for changing the platform performance mode is currently not imple=
mented.
+
+Battery Charging Control
+------------------------
+
+The ``uniwill-laptop`` driver supports controlling the battery charge lim=
it. This happens over
+the standard ``charge_control_end_threshold`` power supply sysfs attribut=
e. All values
+between 1 and 100 percent are supported.
+
+Additionally the driver signals the presence of battery charging issues t=
hru the standard ``health``
+power supply sysfs attribute.
+
+Lightbar
+--------
+
+The ``uniwill-laptop`` driver exposes the lightbar found on some models a=
s a standard multicolor
+led class device. The default name of this led class device is ``uniwill:=
multicolor:status``.
+
+See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details on =
how to control the various
+animation modes of the lightbar.
diff --git a/MAINTAINERS b/MAINTAINERS
index 5b12cc498d56..fa72aaf94bcb 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25501,6 +25501,7 @@ M:	Armin Wolf <W_Armin@gmx.de>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-driver-uniwill-laptop
+F:	Documentation/admin-guide/laptops/uniwill-laptop.rst
 F:	Documentation/wmi/devices/uniwill-laptop.rst
 F:	drivers/platform/x86/uniwill/uniwill-laptop.c
=20
=2D-=20
2.39.5

