Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAEA269AED;
	Fri, 18 Apr 2025 06:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744957880; cv=none; b=cj6NPWQ3uOylEa1BgZmszoUTMuiVtikwDHvO/Nvk2w4hkESCKp8zU/49aYy4oRYXssgALgfkVJ66gBJgHc+Xqmcz3RRoA5CHSoQkB7pfTv2ojSBxTPKHINy+mb+H93DJjjb5Qp5LnRACw0E8ZoIdNz0YcGQaGUamiEU6/Kwx1gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744957880; c=relaxed/simple;
	bh=FwgWWF+LP2EHZLRFmQS+agKbeiCpXr1FEFxEHMATv8g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nCg/ehIhbn+2mCWLFE4VpT1cmm2eiheGcTXckovZ5VY/GVoDoVaCOrPe+5x16HsOWPCS4dCmoNHsZ8YKakw85G5Qbc1IsaYZfx//+2VYI5Bbam70GG6dRgjp7qtzch4gQruwXZpMTPU/3vPY+Z/nVn8BG3wwnd22Gg/Pl6pUivw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=LQ73NpTa; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="LQ73NpTa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Itm00J1uaD0MfR8SRxtol0/+CWNZ2SWKT/We+OoqJm4=; b=LQ73NpTaqBVef0LspueNCcEg4o
	TeXvKaVTIJ4CHBN3We+wJy33eiUQ3a5yV2hftqGeiWGUJRwJVYmTg+twNqY1F3XyHDHRcmx/dmvyp
	6xQcqDA5HOTF58c+t++wR4urUsFwFXpuFPz9EBHLjBqYx/0goFH0jczjmKRRmdvI3oiV0pRtH6cNW
	EdfkZ0yiIOR60h2W4Zr6Ef2n14L/LCySABVLm+l1mIBmqHLPeuG52iexNkH1NILxoPPQFtTalClVW
	P0gah+1FUtBqXqwCx89jNs+KBcHcIeVTFWtoFi5D/LT9YllOj8ODRKgMEInAsua1NWtvJuFZ3Fn5z
	UmU3WM1w==;
Received: from [89.212.21.243] (port=56446 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u5fFn-00AbM0-1F;
	Fri, 18 Apr 2025 08:31:11 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v3 05/15] arm64: dts: freescale: imx93-phycore-som: Add eMMC no-1-8-v by default
Date: Fri, 18 Apr 2025 08:30:54 +0200
Message-Id: <20250418063104.2202085-6-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418063104.2202085-1-primoz.fiser@norik.com>
References: <20250418063104.2202085-1-primoz.fiser@norik.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

The phyCORE-i.MX93 SoM comes in two variants, one with VDD_IO set to
3.3V and the other variant to 1.8V. The 3.3V variant can only support
DDR52 mode, while 1.8V variant is capable of HS400ES eMMC mode. The
information about VDD_IO option is encoded in the SoM's EEPROM. EEPROM
is read in the bootloader and bootloader clears the "no-1-8-v" flag in
case of 1.8V SoM variant is detected. Thus add property 'no-1-8-v' by
default to usdhc1 (eMMC) node and let bootloader handle the flag. In
case EEPROM is erased or read-out fails, flag "no-1-8-v" also ensures
fall-back compatibility with both SoM variants.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v3:
- no changes

 arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index 663530a7e2bb..22dbcc89e311 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -172,6 +172,7 @@ &usdhc1 {
 	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
 	bus-width = <8>;
 	non-removable;
+	no-1-8-v;
 	status = "okay";
 };
 
-- 
2.34.1

