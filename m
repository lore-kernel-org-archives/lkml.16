Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EBC22F770;
	Wed, 21 May 2025 05:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747806260; cv=none; b=dEDadHl6RRKZwT8Rp32NLoLHsOnNiZWvbQnumdp1cFtdFMhsEN9/86cePVM3t85ha5X6Rs0yMk1stI8bPuXgweDyIwnaMMJNv6Q6ONA33yhFsuOSZev7C3zDu1rdzDqhWHyXCZ9E1fiLc2N5n63/E5Dnpx6IHLNOTrBVhwuc65g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747806260; c=relaxed/simple;
	bh=3CHm6v7jyTAu8MzIb3P5qTUxnFyDj80RHZQfU4Jp/SE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G6LiTgmI2Co7CXGH6iU+Lv/sKZ521xoYYf9TAL1yUoOFjMlkx4623w/lRe/BvWBwGQfGerjU25+NmeJw+GfPNfwkjT7shBt3IKILk9CmkNR/lzuX85eciSUpdbB6MjngyFXP34emIIQrQWDZh55GbTx67iAxqWv+SBctT1xxR8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=M8TR/HN/; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="M8TR/HN/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1747806259; x=1779342259;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3CHm6v7jyTAu8MzIb3P5qTUxnFyDj80RHZQfU4Jp/SE=;
  b=M8TR/HN/EnjfzG9+0Y9QeoQHpgJbHxQIQn59lNxVFvZS/+hGAyzPk7x4
   YKNc/osKwRIK8rDSUjhoZbSQmV/RHr5clYM6drDVSdkYryVui2Y4BqbDP
   ZUjjCyrKZQ6FuV+ERnkfz/DIGpZt4OzhDh0uiwK2zIhmstAh38x5iVMtJ
   ad/7bsKmRXTM2vXoydTLs4ZMsbjRKD23J2AGsi+c74/uyYryBiuTLTgAb
   4QGtyc2K0/3rfRr3H4mX75ZCi5XguDAX0hJtMhmHrtrfcUtsepBg5Sv8v
   cN1lWk9WRM6B3QGSxmDjgm+eDakYzgOPdTM/V6YOtfBaPBgAR30ZLPNku
   w==;
X-CSE-ConnectionGUID: CeUgBc8xRnucLyhtnuJrfw==
X-CSE-MsgGUID: kX4N0k7/R/uqiCpOZt4kdg==
X-IronPort-AV: E=Sophos;i="6.15,303,1739862000"; 
   d="scan'208";a="46696439"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 May 2025 22:44:18 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 20 May 2025 22:43:37 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 20 May 2025 22:43:32 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <tudor.ambarus@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH v2 3/4] ARM: dts: microchip: sama5d27_wlsom1: rename spi-cs-setup-ns property to spi-cs-setup-delay-ns
Date: Wed, 21 May 2025 11:13:08 +0530
Message-ID: <20250521054309.361894-3-manikandan.m@microchip.com>
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

Fixes: 417e58ea41ab ("ARM: dts: at91-sama5d27_wlsom1: Set sst26vf064b SPI NOR flash at its maximum frequency")
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
changes in v2:
- add fixes tag
---
 arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
index ef11606a82b3..9543214adc9f 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
+++ b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
@@ -234,7 +234,7 @@ qspi1_flash: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <104000000>;
-		spi-cs-setup-ns = <7>;
+		spi-cs-setup-delay-ns = <7>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
 		m25p,fast-read;
-- 
2.25.1

