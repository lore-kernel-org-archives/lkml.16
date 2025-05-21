Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5D57DA6D;
	Wed, 21 May 2025 07:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747811048; cv=none; b=dh+QxHut72KtYy8SPwoeEuJb3kyIg4gXaQthkIcgdTQxk1+t4kEEC+aCEcXk3ORRWoSr7toEZQ+4j9efsqRPdEJPdpckZbGkRxY+u5/DOlGqj4ev/9TNWJ1a2cJhfcH8A8nhhFEnwOapDux3vJ8O4Sz7+vcru6odo8RgYhOLMAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747811048; c=relaxed/simple;
	bh=C2oODVLtH9/VdmDMbvX4+EZYiZzWYKNovQyJnAFylQk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kJzQeNJZl9Tv5jSw5xgTDUlKZHPsavPdgxryyaxhbU9qheBx+5jdiX6bH+JOS/bdxLBSmEcgp9hP6Het/5pw22svTf1zkFCjhKhMyb3pRaXAM67YU2KEknAVkqkzj8S0KvdyLFutS/w2y1wlhBHVxH1Ef3LEL37qXkGXEO4hiVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=qAnqaFDd; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="qAnqaFDd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1747811047; x=1779347047;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=C2oODVLtH9/VdmDMbvX4+EZYiZzWYKNovQyJnAFylQk=;
  b=qAnqaFDdvOsnKoHnswS17UgmcfzDMoyylGo4gB7fbCBUpWMd52BNX7Uz
   fTTTGP/vypQEfrM9WjKrobZ8+zIXt/mYBPkxE/SjjpdV9f8LUFPaW6hE2
   HDE2YPhlJD/t5twZOay+3ASw0rJxvs4CtaecrZT/zTt76/nHxr7Ug9gtG
   Ei0a06FSoBjPfSPS9WNdskMbmjmY1DajkSO3IVhHUCzOz+SnGbGKwKuuq
   +5dGtZDzz30S/Zoud0hwt5M8BPjk2OmKruHvyoxR+SLnXdHOaL4AJ25xB
   dc12BR1PEA5WV1rkWzPiAYYiEkVfCqp/ujMHTebD2vABOYRY5xhcZHvEc
   w==;
X-CSE-ConnectionGUID: Pj+r2YzxQHq6YitjaiF/ww==
X-CSE-MsgGUID: EEPYZbNBR/yRNlAIfM5lKQ==
X-IronPort-AV: E=Sophos;i="6.15,303,1739862000"; 
   d="scan'208";a="46698916"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 May 2025 00:04:06 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 21 May 2025 00:03:55 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 21 May 2025 00:03:48 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <tudor.ambarus@linaro.org>,
	<pratyush@kernel.org>, <mwalle@kernel.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH v3 0/3] Read MAC Address from SST vendor specific SFDP region
Date: Wed, 21 May 2025 12:33:33 +0530
Message-ID: <20250521070336.402202-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch series adds support to parse the SFDP SST vendor map, read and
store the EUI-48 and EUI-64 Address (if its programmed) using the
resource-managed devm_kcalloc which will be freed on driver detach.
Register EUI addresses into NVMEM framework for the net drivers to access
them using nvmem properties.
This change ensures consistent and reliable MAC address retrieval
from QSPI benefiting boards like the sama5d27_wlsom1, sama5d29 curiosity
and sam9x75 curiosity.

--------
changes in v3:
- 2/3 - add support to update the QSPI partition into 'fixed-partition'
	binding in sama5d27_wlsom1
- 3/3 - add nvmem-layout in qspi node for EUI48 MAC Address and nvmem cell
	properties for macb node in sama5d27_wlsom1

changes in v2:
- 1/3 - parse the SST vendor table, read and store the addresses
	into a resource - managed space. Register the addresses
	into NVMEM framework
- 2/3 - add support to update the QSPI partition into 'fixed-partition'
	binding
--------

Manikandan Muralidharan (3):
  mtd: spi-nor: sfdp: parse SFDP SST vendor map and register EUI
    addresses into NVMEM framework
  ARM: dts: microchip: sama5d27_wlsom1: update the QSPI partitions using
    "fixed-partition" binding
  ARM: dts: microchip: sama5d27_wlsom1: Add nvmem-layout in QSPI for
    EUI48 MAC Address

 .../dts/microchip/at91-sama5d27_wlsom1.dtsi   |  65 ++++---
 drivers/mtd/spi-nor/sfdp.c                    | 161 ++++++++++++++++++
 include/linux/mtd/spi-nor.h                   |   7 +
 3 files changed, 209 insertions(+), 24 deletions(-)

-- 
2.25.1

