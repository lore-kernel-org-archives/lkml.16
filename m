Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406321FBE8A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873631; cv=none; b=g0GkQO4r2pDRhj1DG61v2fTE1R+g1Y4hcrB5plJVEqu5yXn2lxbJ/q6t7zaselIhWh/GIePH3W8WK+GOutLxM67Hdy1Ts0APmd5VlSnSvdxuRP9vhSHK6YWxPw/4EUV05MdxqQX5cJHxruO+ywLtjgJOfUFjloKTLPsGJYYScCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873631; c=relaxed/simple;
	bh=pInPQLUtMI6WPc5FK33MH4c5RvY3/0InJhwRLV7jmP4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lujhrQzrXmHOzw4xFBDK6ism4ponPxh2bh44kqTSEcAxk8DNX+SI9E2ragtAdq0iNZUqVL1fsqGvS5qxrlnCj71sYcaDA0DVF+Pc9UsTwfeRm1u8bsX6J5n68fNVmf+STx1D5/QgdRir6P7TPhmVuqWs1zPg8G/I7UNm1tMDEr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=tIkCqS96; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tIkCqS96"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53SKrad12906825
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 15:53:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745873617;
	bh=DH6GXAu28P+paRygaPvQ/RCNUmo6GrCq7ae0FlmoHS4=;
	h=From:To:CC:Subject:Date;
	b=tIkCqS96wkIjSuqqpycbEf2sku3SYJpatOs8xxcULW/FkpWfRJUuOgO3o34GQa4gJ
	 ufRt+VpFg/0FGTshQ0vNVoupZVNg/bdAGdr2uqPlH+IWR1WWZieWfKggMgAJKONXHj
	 I2cXp9iaS9GkWiYRaB7m248drQB0OPLAsOK+4rIk=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53SKragN030028
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 15:53:36 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 15:53:36 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 15:53:36 -0500
Received: from uda0506412.dhcp.ti.com (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53SKraQl061891;
	Mon, 28 Apr 2025 15:53:36 -0500
From: Kendall Willis <k-willis@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <d-gole@ti.com>
CC: <khilman@baylibre.com>, <msp@baylibre.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <k-willis@ti.com>
Subject: [PATCH v2] firmware: ti_sci: Convert CPU latency constraint from us to ms
Date: Mon, 28 Apr 2025 15:53:36 -0500
Message-ID: <20250428205336.2947118-1-k-willis@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Fix CPU resume latency constraint units sent to device manager through the
TI SCI API. The device manager expects CPU resume latency to be in msecs
which is passed in with the TI SCI API [1]. CPU latency constraints are
set in userspace using the PM QoS framework which uses usecs as the unit.
Since PM QoS uses usecs for units and the device manager expects msecs as
the unit, TI SCI needs to convert from usecs to msecs before passing to
device manager.

[1] https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#tisci-msg-lpm-set-latency-constraint

Cc: stable@vger.kernel.org
Fixes: a7a15754c7f7 ("firmware: ti_sci: add CPU latency constraint management")
Signed-off-by: Kendall Willis <k-willis@ti.com>
---
Link to v1:
https://lore.kernel.org/all/20250425153754.2141984-1-k-willis@ti.com/

Changes from v1 to v2:
- reworded commit message to clearer about TI SCI CPU resume latency API
- added comment about converting to msecs and rounding down for the
  device manager
- changed commit to be inline with stable kernel rules
- rebased on linux-next

Test log [2] shows entry to MCU Only low power mode by sending a CPU
resume latency constraint of 100000 us using PM QoS. On line 860,
MCU Only is shown to be entered by 0x1 as the printed mode [3].

[2] https://gist.github.com/kwillis01/4cf6e19893927d232e7faa0676ea2425 
[3] https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#supported-low-power-modes
---
 drivers/firmware/ti_sci.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 806a975fff22..ae5fd1936ad3 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -2,7 +2,7 @@
 /*
  * Texas Instruments System Control Interface Protocol Driver
  *
- * Copyright (C) 2015-2024 Texas Instruments Incorporated - https://www.ti.com/
+ * Copyright (C) 2015-2025 Texas Instruments Incorporated - https://www.ti.com/
  *	Nishanth Menon
  */
 
@@ -3670,6 +3670,7 @@ static int __maybe_unused ti_sci_suspend(struct device *dev)
 	struct ti_sci_info *info = dev_get_drvdata(dev);
 	struct device *cpu_dev, *cpu_dev_max = NULL;
 	s32 val, cpu_lat = 0;
+	u16 cpu_lat_ms;
 	int i, ret;
 
 	if (info->fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED) {
@@ -3682,9 +3683,16 @@ static int __maybe_unused ti_sci_suspend(struct device *dev)
 			}
 		}
 		if (cpu_dev_max) {
-			dev_dbg(cpu_dev_max, "%s: sending max CPU latency=%u\n", __func__, cpu_lat);
+			/*
+			 * PM QoS latency unit is usecs, device manager uses msecs.
+			 * Convert to msecs and round down for device manager.
+			 */
+			cpu_lat_ms = cpu_lat / USEC_PER_MSEC;
+			dev_dbg(cpu_dev_max, "%s: sending max CPU latency=%u ms\n", __func__,
+				cpu_lat_ms);
 			ret = ti_sci_cmd_set_latency_constraint(&info->handle,
-								cpu_lat, TISCI_MSG_CONSTRAINT_SET);
+								cpu_lat_ms,
+								TISCI_MSG_CONSTRAINT_SET);
 			if (ret)
 				return ret;
 		}

base-commit: 33035b665157558254b3c21c3f049fd728e72368
-- 
2.34.1

