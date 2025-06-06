Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6074C266EF8;
	Fri,  6 Jun 2025 06:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749191586; cv=none; b=CKrtdOX/YrKrbEmXPzUcnn5iYNR5P9SrhtxeDv4ehm1GGxcHjvqylK3XcIqCoBj1VS1eiJzROfxMBAi3mwyaHbLNa7XUQTSd+J3ByUqMkBUtdoM2RYUdo0GGGxwZZmi14THgBQ0cEACzySYgZqPU31mu0O6p/7OVSWs+bstjVOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749191586; c=relaxed/simple;
	bh=EgMVvjrq/bC4ZR8YwwCqCXYWKr03o6IaHYPp3OFjU2M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W7hraBrCGgxqgswLqH5usjorP9qMP5/8OWcTqL0fMkXxi8t6eielJpQFRjwYM8NLm3+r/FhF0aBJ+wVe9UruTaayPvZq+3+aTc63WaDJF99l0CEbNhJm2hciVnkcJg3fhZCuBY6W8i7e0fDEPmVcuauegtXWy0RDDGNnUY+8R/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=jAlCc2Cf; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="jAlCc2Cf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1749191585; x=1780727585;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EgMVvjrq/bC4ZR8YwwCqCXYWKr03o6IaHYPp3OFjU2M=;
  b=jAlCc2CfnNOY4BJihlqRAb6d0bevOMThQQR9ClMURqeKm2CB6jCo0hcF
   hguxfWKYJiNf97Yw6HFkjycNCF/H3NeK3rShWOMeA0rXCb2NlbBbGAHep
   o1Y9dGsq9EKKA3bwXJpNBNc70dg4ReVwVyLw/sPHo7QWxNQpmuPh7HbRS
   cBBo4nf3ttF6hpjlKLuooOTNktYbans+5c8XW54k3M3Npvacs0imCs03R
   uzPbHV0zJiqIfGOY0+e0A8sqV5d/r+wEhrmGSBjar42Vi9y0z/UB0j5CJ
   fY1b+DqllZBnIStXVvxx3Y10K7S/F+qQhv/SoSkWjQLZxhEoVoMAVOeds
   g==;
X-CSE-ConnectionGUID: 7bOu4lzXThWtLeFYOSzTdQ==
X-CSE-MsgGUID: HhPlYsP7QTKsbAc+X0ECAQ==
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="209983028"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Jun 2025 23:33:03 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 5 Jun 2025 23:32:04 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Thu, 5 Jun 2025 23:31:53 -0700
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
Subject: [PATCH v6 RESEND 4/4] ARM: configs: at91: Enable Microchip's MIPI DSI Host Controller support
Date: Fri, 6 Jun 2025 12:00:55 +0530
Message-ID: <20250606063055.224159-5-manikandan.m@microchip.com>
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

Enable the Microchip's DSI controller wrapper driver that uses
the Synopsys DesignWare MIPI DSI host controller bridge for
sam9x7 SoC family.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
changes in v6:
- Rewrite commit message
---
 arch/arm/configs/at91_dt_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
index ff13e1ecf4bb..78b7873d0e45 100644
--- a/arch/arm/configs/at91_dt_defconfig
+++ b/arch/arm/configs/at91_dt_defconfig
@@ -145,6 +145,7 @@ CONFIG_VIDEO_OV7740=m
 CONFIG_DRM=y
 CONFIG_DRM_ATMEL_HLCDC=y
 CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER=y
+CONFIG_DRM_MICROCHIP_DW_MIPI_DSI=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_PANEL_EDP=y
 CONFIG_FB_ATMEL=y
-- 
2.25.1

