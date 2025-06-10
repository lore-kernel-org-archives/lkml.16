Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFE025F7A2;
	Tue, 10 Jun 2025 05:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749534947; cv=none; b=n6DAKRCRKezMWa5P4fB6Gz739M0hop3Gx6aUWYZ4NwG1fkXcP9Ynr47h54Dlvj/OarO2JLekcqldBYnBNPYVjulttike//jo9E3GvJy1zaJGX3s7Zl2wx3Awm7fjPIJoEHgOSed+kpGr9z5uNevgsqTOxTDtvcEZcf6SpmAP0v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749534947; c=relaxed/simple;
	bh=ybT/6LzbsTJe9XbUclvW55O/CINdufKjms9E4PJV35k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lB24u5OPsA4T+9eZcjozGW215v38TpALUzfwaALQcehYQrAxvrvlZtH3Pb4as333prrA76w+eLcjwOktDbxyBsHOK4U6Cd1G5Staw63tSmjgSxL1pPI7LGi0cDosGhSVJMUqOzqXt9ysGMAl8WdNR5sep8spV0gWzUWEEor/Y7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=TLvbBoEw; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="TLvbBoEw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1749534934; x=1750139734; i=w_armin@gmx.de;
	bh=i5+Pxcmp/SbEOw11Mc+rQ1F242lhNXtVYD6Xck5KQw0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=TLvbBoEwJXQVhcNQE2Dxl+oPuXzBN0dDcWT0CBoPdtEcTkim0NYfjaYc8GoaeKiW
	 0PEUNFG0Kpt0wdMDG+nTpM0QDVsaP2YwunAW5SojDBYOJvz9PW9d30iMPX1DXCEj7
	 fAgPyCgpWSm6Koa/9fUyvcOl9jAA+q+GAN7TaYc/jBZTLXzfkMZqX4ha7wRVnrJkU
	 GLrDyOtTsliNQCzSl61qGmsYYCAn58Uz0EgmgPM4EICYFW7n88+IbXCOkZY1QgX75
	 heY1R0STooUnepP/n0VoVpmojFRoXMYu5wUjmSh0OBzFaAgKkP1VLYtXWtRT1B/AD
	 l1eP9S7WfSw9rpSjFA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([87.177.78.219]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M59GG-1uNm1i0xwC-00CM24; Tue, 10 Jun 2025 07:55:34 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: Dell.Client.Kernel@dell.com,
	jithu.joseph@intel.com
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	corbet@lwn.net,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] Documentation: ABI: Update WMI device paths in ABI docs
Date: Tue, 10 Jun 2025 07:55:25 +0200
Message-Id: <20250610055526.23688-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pKaX/vPIFZdWEIntIE7snXU3W4yyvzue7+cVzj+WoP0/Suu/2zB
 SHzhKzt3TYaBSeINry9tbi4V9aOJoYWu9Bx84pYVTkHAGSs5Ar9EKRVTfeaFJMTmSGZPMhm
 7SpXpBhadAaUgs7MQAeHlTEFQkLdvx9y29zMrFg87p3xFN7qrE0yBTVQLpWCKCTFftc0vzF
 zXwuLqX5RaPwOyOUc7rAg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pmQi7xs/HFU=;FrKZryHMm9etmgFazZGZHJFfnkv
 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

The WMI driver core might append an ID to the WMI device name to avoid
name collisions in case multiple WMI devices with the same GUID are
present. Update all sysfs path referring to WMI devices to inform
users about this important detail.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 .../ABI/testing/sysfs-platform-dell-privacy-wmi          | 8 ++++----
 .../ABI/testing/sysfs-platform-intel-wmi-sbl-fw-update   | 2 +-
 .../ABI/testing/sysfs-platform-intel-wmi-thunderbolt     | 2 +-
 Documentation/admin-guide/thunderbolt.rst                | 9 ++-------
 4 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi b/D=
ocumentation/ABI/testing/sysfs-platform-dell-privacy-wmi
index 1f1f274a6979..b4da7b2ea0ca 100644
=2D-- a/Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
+++ b/Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
@@ -1,4 +1,4 @@
-What:		/sys/bus/wmi/devices/6932965F-1671-4CEB-B988-D3AB0A901919/dell_pri=
vacy_supported_type
+What:		/sys/bus/wmi/devices/6932965F-1671-4CEB-B988-D3AB0A901919[-X]/dell=
_privacy_supported_type
 Date:		Apr 2021
 KernelVersion:	5.13
 Contact:	"<perry.yuan@dell.com>"
@@ -29,12 +29,12 @@ Description:
=20
 		For example to check which privacy devices are supported::
=20
-		    # cat /sys/bus/wmi/drivers/dell-privacy/6932965F-1671-4CEB-B988-D3A=
B0A901919/dell_privacy_supported_type
+		    # cat /sys/bus/wmi/drivers/dell-privacy/6932965F-1671-4CEB-B988-D3A=
B0A901919*/dell_privacy_supported_type
 		    [Microphone Mute] [supported]
 		    [Camera Shutter] [supported]
 		    [ePrivacy Screen] [unsupported]
=20
-What:		/sys/bus/wmi/devices/6932965F-1671-4CEB-B988-D3AB0A901919/dell_pri=
vacy_current_state
+What:		/sys/bus/wmi/devices/6932965F-1671-4CEB-B988-D3AB0A901919[-X]/dell=
_privacy_current_state
 Date:		Apr 2021
 KernelVersion:	5.13
 Contact:	"<perry.yuan@dell.com>"
@@ -66,6 +66,6 @@ Description:
=20
 		For example to check all supported current privacy device states::
=20
-		    # cat /sys/bus/wmi/drivers/dell-privacy/6932965F-1671-4CEB-B988-D3A=
B0A901919/dell_privacy_current_state
+		    # cat /sys/bus/wmi/drivers/dell-privacy/6932965F-1671-4CEB-B988-D3A=
B0A901919*/dell_privacy_current_state
 		    [Microphone] [unmuted]
 		    [Camera Shutter] [unmuted]
diff --git a/Documentation/ABI/testing/sysfs-platform-intel-wmi-sbl-fw-upd=
ate b/Documentation/ABI/testing/sysfs-platform-intel-wmi-sbl-fw-update
index 02ae1e9bbfc8..7ffd1579b8f7 100644
=2D-- a/Documentation/ABI/testing/sysfs-platform-intel-wmi-sbl-fw-update
+++ b/Documentation/ABI/testing/sysfs-platform-intel-wmi-sbl-fw-update
@@ -1,4 +1,4 @@
-What:		/sys/bus/wmi/devices/44FADEB1-B204-40F2-8581-394BBDC1B651/firmware=
_update_request
+What:		/sys/bus/wmi/devices/44FADEB1-B204-40F2-8581-394BBDC1B651[-X]/firm=
ware_update_request
 Date:		April 2020
 KernelVersion:	5.7
 Contact:	"Jithu Joseph" <jithu.joseph@intel.com>
diff --git a/Documentation/ABI/testing/sysfs-platform-intel-wmi-thunderbol=
t b/Documentation/ABI/testing/sysfs-platform-intel-wmi-thunderbolt
index fd3a7ec79760..10ef1282c9d2 100644
=2D-- a/Documentation/ABI/testing/sysfs-platform-intel-wmi-thunderbolt
+++ b/Documentation/ABI/testing/sysfs-platform-intel-wmi-thunderbolt
@@ -1,4 +1,4 @@
-What:		/sys/devices/platform/<platform>/force_power
+What:		/sys/bus/wmi/devices/86CCFD48-205E-4A77-9C48-2021CBEDE341[-X]/forc=
e_power
 Date:		September 2017
 KernelVersion:	4.15
 Contact:	"Mario Limonciello" <mario.limonciello@outlook.com>
diff --git a/Documentation/admin-guide/thunderbolt.rst b/Documentation/adm=
in-guide/thunderbolt.rst
index 240fee618e06..102c693c8f81 100644
=2D-- a/Documentation/admin-guide/thunderbolt.rst
+++ b/Documentation/admin-guide/thunderbolt.rst
@@ -358,12 +358,7 @@ Forcing power
 Many OEMs include a method that can be used to force the power of a
 Thunderbolt controller to an "On" state even if nothing is connected.
 If supported by your machine this will be exposed by the WMI bus with
-a sysfs attribute called "force_power".
-
-For example the intel-wmi-thunderbolt driver exposes this attribute in:
-  /sys/bus/wmi/devices/86CCFD48-205E-4A77-9C48-2021CBEDE341/force_power
-
-  To force the power to on, write 1 to this attribute file.
-  To disable force power, write 0 to this attribute file.
+a sysfs attribute called "force_power", see
+Documentation/ABI/testing/sysfs-platform-intel-wmi-thunderbolt for detail=
s.
=20
 Note: it's currently not possible to query the force power state of a pla=
tform.
=2D-=20
2.39.5

