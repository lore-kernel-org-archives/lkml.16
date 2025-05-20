Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCC625CC7A;
	Tue, 20 May 2025 06:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.90.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747722507; cv=none; b=l2//ERgC1MivUmwcEgPHttcc2NMqbHqZcnhnIMGFzsMaXyoX1fy6PIxgcrcEFIAVUVWZpfoLlUJjn+IawV0A+rMVO7GefBFX6ad3EZdt2Vde2egbIPOpGN8BxaxbV4YdQgEosR0bcYQyTumW8yLNk9XV2jCBdBvf8YPlgdidWlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747722507; c=relaxed/simple;
	bh=atb6z9XN7RCNKDZIpyj4g2de70/OejRuLU3sua0jLJY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=DK+mRc6yYlsosqyNXyvAhDFppUkSgjygsUh6he9BEYgFi+PGU4oS9iohT5eNRkf25OCyZszRhyMQ8HjG79GRTOhgGd13fyIOiBuzv3Pi+HwxGMKCTxJICJqKEahizIX+9zvqFsWsUtMYbDNfncg7WPDgYsCfbTR1CHz5srA2CKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=sbxkTALx; arc=none smtp.client-ip=207.54.90.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="sbxkTALx"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747722505; x=1779258505;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=atb6z9XN7RCNKDZIpyj4g2de70/OejRuLU3sua0jLJY=;
  b=sbxkTALxEGIfT60slQtcl95iWBamxuAYRDnWAacVK2fPc/eWsRIgmkQl
   ilBDpnp16ZQcnIb68LdwFDqsZLnOtvbaKZnAjeSUGJ5IvuWATvo/q0ogJ
   nGUcihAk/UUnJRms5/W3p0zNDdfpOU/MprU7iFN5puoXlTnEmLcCSgxyA
   KlkQNF/ClOSVKa3/LFJ1R3gfKbtRLtzNcaPC4SClPRwKMIET0hU47gqnd
   yUEdjtRBfiCWxVO2hsSp+8lHR/GIMr2N3tVsp+79ZrBECLxeuMGhJfbw0
   WGxg0bIX9q50Qjmff/lwjgJkWHJrAJadwDmWDeR+muDjg8DGnOXgEZkBA
   w==;
X-CSE-ConnectionGUID: LvLGJodVRRu2qf2agvdBUA==
X-CSE-MsgGUID: vpB2GC5QSlqDUko+T+DTZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="179514708"
X-IronPort-AV: E=Sophos;i="6.15,302,1739804400"; 
   d="scan'208";a="179514708"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 15:27:15 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E5664C68A5;
	Tue, 20 May 2025 15:27:11 +0900 (JST)
Received: from oym-om3.fujitsu.com (oym-om3.o.css.fujitsu.com [10.85.58.163])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B2472CFA2E;
	Tue, 20 May 2025 15:27:11 +0900 (JST)
Received: from sm-arm-grace07.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by oym-om3.fujitsu.com (Postfix) with ESMTP id 5293E4004BB01;
	Tue, 20 May 2025 15:27:11 +0900 (JST)
From: Shinji Nomoto <fj5851bi@fujitsu.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shinji Nomoto <fj5851bi@fujitsu.com>
Subject: [PATCH v2] doc: hwmon: acpi_power_meter: Add information about enabling the power capping feature.
Date: Tue, 20 May 2025 15:27:04 +0900
Message-ID: <20250520062707.1657667-1-fj5851bi@fujitsu.com>
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

-----

Here are the differences from the previous patch:
* Added a note to the "Module Parameters" description regarding systems
  that do not support power capping.

The previous post can be found at:
https://lore.kernel.org/linux-hwmon/20250519072756.1512244-1-fj5851bi@fujitsu.com/T/#u

Signed-off-by: Shinji Nomoto <fj5851bi@fujitsu.com>
---
 Documentation/hwmon/acpi_power_meter.rst | 29 +++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/Documentation/hwmon/acpi_power_meter.rst b/Documentation/hwmon/acpi_power_meter.rst
index 8628c1161015..a91403a2a26f 100644
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
@@ -52,3 +59,19 @@ follows:
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
+
+                        Note: power capping is potentially unsafe feature.
+                        Please check the platform specifications to make sure
+                        that capping is supported before using this option.
-- 
2.43.0

