Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E54230BD9;
	Wed, 21 May 2025 05:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747806237; cv=none; b=OCH5pOKpJjEDuLpnDOdViGHw9NKXKVmkaRPXdR9H7KEjIBt8i0hfEGI96GDh+LNmjQcguAFQw7m0FTVXDmOiQ6f4aJ5XbC1a7fW8f5PpyvOrdV8pudx2MeAAuMICwYjimPgGK41JQB+dpX2M1aAromp+pNhCTK4zvCHCfwPajbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747806237; c=relaxed/simple;
	bh=Jtw7JeQj+gKKTo4+jL9MB/YjLoD9N+YDMSLHz007/3E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KKYfpeTYrulFQjXKRtAZD8Tq4T9j2JxMRUURYOtWWGsieuqhP5gnLZC6JzCuzQ3uJn7FhDtQp4YSJOve8hxYk7NSPxgJUZZczY+BDNf06pGzUFw2X8mr+DU8tSu4nN+ry+GGWOiKTWARpLYS1sB4SaiBXmKlwRjeXsF76gUruO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=wTGlpqER; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="wTGlpqER"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1747806235; x=1779342235;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Jtw7JeQj+gKKTo4+jL9MB/YjLoD9N+YDMSLHz007/3E=;
  b=wTGlpqERqrWO545nWZ8vELyE/Z7Z/fuCr8xbiK4441/XBQg6IY+SyCmX
   DVG9q9qpDf8t4mXJZzgXAyAvpiKjNFVU7BpjtGQ0sCyhbUCjDM4fyRBSP
   Sj6o3bpczJGrF9eJQzmy6lo9IWhZ/XAhpoqkZ965Dt/X5NwkVMv7AGVA4
   xCSh2tJylo32Ty3NeqqwBzB/vODpWeEIrvkwn2033maacpa4OTI+1sQ1i
   F6yhCa7+K+bmwd05u2e8O3Z9eJy++j2uCbtyKCg/jxHxyyvupr8YIEoOA
   hX2f/tL6EfpXYjnkHscgpC+Hew3d52sDF0+lZLA6ztqlvkStdZOcDIG9F
   g==;
X-CSE-ConnectionGUID: k0o2CMOdRGO0OGeppoCe8w==
X-CSE-MsgGUID: t36/8hdiSFObJkHdZAeIwA==
X-IronPort-AV: E=Sophos;i="6.15,303,1739862000"; 
   d="scan'208";a="41428746"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 May 2025 22:43:46 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 20 May 2025 22:43:28 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 20 May 2025 22:43:23 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <tudor.ambarus@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH v2 2/4] ARM: dts: microchip: sama5d27_som1: rename spi-cs-setup-ns property to spi-cs-setup-delay-ns
Date: Wed, 21 May 2025 11:13:07 +0530
Message-ID: <20250521054309.361894-2-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250521054309.361894-1-manikandan.m@microchip.com>
References: <20250521054309.361894-1-manikandan.m@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The naming scheme for delay properties includes "delay" in the name,
so renaming spi-cs-setup-ns property to spi-cs-setup-delay-ns.

Fixes: 09ce8651229b ("ARM: dts: at91-sama5d27_som1: Set sst26vf064b SPI NOR flash at its maximum frequency")
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
changes in v2:
- add fixes tag
---
 arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi b/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi
index 8ac85dac5a96..13c28e92b17e 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi
+++ b/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi
@@ -44,7 +44,7 @@ flash@0 {
 					compatible = "jedec,spi-nor";
 					reg = <0>;
 					spi-max-frequency = <104000000>;
-					spi-cs-setup-ns = <7>;
+					spi-cs-setup-delay-ns = <7>;
 					spi-tx-bus-width = <4>;
 					spi-rx-bus-width = <4>;
 					m25p,fast-read;
-- 
2.25.1

