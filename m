Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCC91DA5F;
	Mon, 19 May 2025 07:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.90.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747639763; cv=none; b=Lo6Ya17hv7KJITuQZQvs+Uia9fuEYnnQjSZackDH6Y1aCp47JtBwd8vEyK2DgtQPRgCZWTvKpwJrEgzTebxxxuTmLRdlYnHUSeRMQT9dhA70DFIo0vYlIgGW4uKXvOXCBvKDE07/167xcjxQaImr82/ffb3Vfut1/k7DEAmRYU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747639763; c=relaxed/simple;
	bh=iH+nmmU4D2Q00jNKLdtiGfpOSOS2rVBXD5mlABm6pso=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=jrJ0g0feV1gJaJqSyV4qgq74gti/i3ig3gI4i0jCYNOvUc83D/1bhXnnNbpEwMMXZcxXadd/lImQZX60kYcVWvI3SqCbyohfe2bY2oYrbEKt/Lvs/yFO5Lr6eY3YpmNvVMTjgfvOhCRbMei1VDqHcZ73lxBAh0uCn9/Z2vi0aTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=aBNBTtc+; arc=none smtp.client-ip=207.54.90.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="aBNBTtc+"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747639762; x=1779175762;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iH+nmmU4D2Q00jNKLdtiGfpOSOS2rVBXD5mlABm6pso=;
  b=aBNBTtc+MHiSTumhPcxLUiVBgU+E5KxLI09oXOiPdRilF8t2aAairZK7
   4ndZsiXUY96NCHTirQkmnL7B7eWscuB3dT3q+XR/SnB1at3BRx1JLpcMz
   +MbCS6FKXr4d6sbwk9QyKNIJDrsFMuHRn9OpgH8hp1cO/rtHGnbbBJsD1
   Ca+ZqtYt0yMHJdif0ch1hLaPsnEZXf7Q1KMS1Jiz1TIm7zJsSf+YGzfLK
   MJ9zzRH+y0VadaRAUsMkUYZWywmsbCHGC3f+avMtOXRWt0ndGI4BAUYay
   wwoHkfcLP0Hk16fDIcCQnbcucT1fD/z0Qq0A2qoJsWltrACmDI4iIts+Y
   w==;
X-CSE-ConnectionGUID: cGY1z9TzRq+UqnqKSUyfEA==
X-CSE-MsgGUID: 5wJRuWrdT7acLME9mSHw6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="199874952"
X-IronPort-AV: E=Sophos;i="6.15,300,1739804400"; 
   d="scan'208";a="199874952"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 16:28:11 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3AC98C2260;
	Mon, 19 May 2025 16:28:08 +0900 (JST)
Received: from oym-om4.fujitsu.com (oym-om4.o.css.fujitsu.com [10.85.58.164])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C513D88D0;
	Mon, 19 May 2025 16:28:08 +0900 (JST)
Received: from sm-arm-grace07.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by oym-om4.fujitsu.com (Postfix) with ESMTP id B038A4005AE54;
	Mon, 19 May 2025 16:28:07 +0900 (JST)
From: Shinji Nomoto <fj5851bi@fujitsu.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shinji Nomoto <fj5851bi@fujitsu.com>
Subject: [PATCH] doc: hwmon: acpi_power_meter: Add information about enabling the power capping feature.
Date: Mon, 19 May 2025 16:27:44 +0900
Message-ID: <20250519072756.1512244-1-fj5851bi@fujitsu.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To enable the power capping feature of the acpi_power_meter driver on
systems other than IBM products, you must explicitly specify
the force_cap_on module parameter.

Add information to the documentation about enabling the power capping
feature with this driver, including the above, to improve user convenience.

Signed-off-by: Shinji Nomoto <fj5851bi@fujitsu.com>
---
 Documentation/hwmon/acpi_power_meter.rst | 25 +++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/Documentation/hwmon/acpi_power_meter.rst b/Documentation/hwmon/acpi_power_meter.rst
index 8628c1161015..334054afc498 100644
--- a/Documentation/hwmon/acpi_power_meter.rst
+++ b/Documentation/hwmon/acpi_power_meter.rst
@@ -37,9 +37,16 @@ arbitrary strings that ACPI provides with the meter.  The measures/ directory
 contains symlinks to the devices that this meter measures.
 
 Some computers have the ability to enforce a power cap in hardware.  If this is
-the case, the `power[1-*]_cap` and related sysfs files will appear.  When the
-average power consumption exceeds the cap, an ACPI event will be broadcast on
-the netlink event socket and a poll notification will be sent to the
+the case, the `power[1-*]_cap` and related sysfs files will appear.
+For information on enabling the power cap feature, refer to the description
+of the "force_on_cap" option in the "Module Parameters" chapter.
+To use the power cap feature properly, you need to set appropriate value
+(in microWatts) to the `power[1-*]_cap` sysfs files.
+The value must be within the range between the minimum value at `power[1-]_cap_min`
+and the maximum value at `power[1-]_cap_max (both in microWatts)`.
+
+When the average power consumption exceeds the cap, an ACPI event will be
+broadcast on the netlink event socket and a poll notification will be sent to the
 appropriate `power[1-*]_alarm` file to indicate that capping has begun, and the
 hardware has taken action to reduce power consumption.  Most likely this will
 result in reduced performance.
@@ -52,3 +59,15 @@ follows:
 `power[1-*]_cap` will be notified if the firmware changes the power cap.
 `power[1-*]_interval` will be notified if the firmware changes the averaging
 interval.
+
+Module Parameters
+-----------------
+
+* force_cap_on: bool
+                        Forcefully enable the power capping feature to specify
+                        the upper limit of the system's power consumption.
+
+                        By default, the driver's power capping feature is only
+                        enabled on IBM products.
+                        Therefore, on other systems that support power capping,
+                        you will need to use the option to enable it.
-- 
2.43.0

