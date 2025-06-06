Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF10526C3B3;
	Fri,  6 Jun 2025 06:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749191590; cv=none; b=hgm1X4p/t6g1xH1zX6dOU/z8Q5U8I3aGORzDJ4qb10ipoxf6GzvFBTVugbee/MJlEJ4czRLqSpD2orKCypjvK2mQpadPb7yfQDb7SFwP8YiOnNPP4kZqtIy8hCo0f9oNARCGU0WMscAoMOtrikZG2xpIs+LERtVcQQ6zlKSETR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749191590; c=relaxed/simple;
	bh=Z51SxzdRMddVEx3I1w41kaD1gSreXpgx/GzJBjqhaBY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o2WU4oXWfzTFW6lnkDoxDp68lIFo7VBVWa3i1JGLkFXZo040vqRdDcxYF+KtUQSdP0E3kvuNtGIgB9hbTB7f4kjt6m55Tk19HEAiY19nlOU+RPUsKFo9IYBlAlwFc2rPIwcjFKPYlhRfASdStF1mOgMZcl2gr9NZ08CeJYC/sRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=GtYGQXY+; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="GtYGQXY+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1749191589; x=1780727589;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z51SxzdRMddVEx3I1w41kaD1gSreXpgx/GzJBjqhaBY=;
  b=GtYGQXY+/WBLR/aRm9SJDAhS/VQhW/G8XyIkID490EpIMXIVfOmUukvJ
   UUJiwSaUsRa3nF6ddvdtJO39cTcVYM63Hxp8bE4Za39LcdfKcORtSTNtN
   m+ix5OtIzAqTeBw3X8/OSTMfL48l8a6ruc4GVoe99ra5nUica7BSL5+3/
   V22yjZpevYDhtwZP6OFNAkM40b/rqlyOTaHXcSWLCo6m+p+KKZoAfSLiZ
   /kiMFczqirV+7718ZF81VAyVsgmeSNYUVCyx26tCme+IMGNn/cdaNa74C
   O0y/jL0cDyUkh3TUkH7CfGdQoPO/f8gh/RAKnnVJVcLZkKyGqjtqphAC1
   Q==;
X-CSE-ConnectionGUID: oUgoCjtdR6urrjAWwMc5YQ==
X-CSE-MsgGUID: SD1+5EidR1yxH1Lg9lB3sw==
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="273876228"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Jun 2025 23:31:59 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 5 Jun 2025 23:31:53 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Thu, 5 Jun 2025 23:31:43 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
	<rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
	<jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux@armlinux.org.uk>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <ebiggers@google.com>,
	<varshini.rajendran@microchip.com>, <ardb@kernel.org>,
	<martin.petersen@oracle.com>, <mihai.sain@microchip.com>,
	<dharma.b@microchip.com>, <dri-devel@lists.freedesktop.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v6 RESEND 3/4] MAINTAINERS: add SAM9X7 SoC's Microchip's MIPI DSI host wrapper driver
Date: Fri, 6 Jun 2025 12:00:54 +0530
Message-ID: <20250606063055.224159-4-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250606063055.224159-1-manikandan.m@microchip.com>
References: <20250606063055.224159-1-manikandan.m@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add the Microchip's DSI controller wrapper driver that uses the
Synopsys DesignWare MIPI DSI host controller bridge for the SAM9X7
SoC series to the MAINTAINERS entry.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
changes in v3:
- Drop T: section
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e94d21953227..2cfca810e692 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16067,6 +16067,13 @@ S:	Supported
 F:	Documentation/devicetree/bindings/display/bridge/microchip,sam9x75-lvds.yaml
 F:	drivers/gpu/drm/bridge/microchip-lvds.c
 
+DRM DRIVER FOR MICROCHIP SAM9X7-COMPATIBLE MIPI DSI HOST CONTROLLER
+M:	Manikandan Muralidharan <manikandan.m@microchip.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+F:	Documentation/devicetree/bindings/display/bridge/microchip,sam9x75-mipi-dsi.yaml
+F:	drivers/gpu/drm/bridge/dw-mipi-dsi-mchp.c
+
 MICROCHIP SAMA5D2-COMPATIBLE ADC DRIVER
 M:	Eugen Hristev <eugen.hristev@microchip.com>
 L:	linux-iio@vger.kernel.org
-- 
2.25.1

