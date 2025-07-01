Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D8726057C;
	Tue,  1 Jul 2025 06:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751351151; cv=none; b=LuXm2tz+74UwqH1fmcFjjex7C291MZohp2nS6aYeU7ibJbcNI8S9pC1sqlV1JsSh03FcwpXt2jKS+fWu1ur8OoOmEfdHvCZkWzpRrUfDnlJgj6fxhIEhttT3WJOEwg7Eu/ETrx97CEKhjuelbUJOtb4THnaxj+eZF1aabOlt5Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751351151; c=relaxed/simple;
	bh=ts1HEmGcB2ML2xiAudKYeg2OM2+gY48sIAW2zJhZ1PA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k9oF4MjOscBqYR62SUzSfxgz2jAsxM8A7w6Q3e1N7tXRkvmWWA/FfAdkrxoxVBVot496WdBgL5oVtMpg7OHGs0GyKleidlSm17I9U9qh+loDfBGTtqfA0O/5dz/2WWzDJA6TWrK5IScNo9WbowqTFdRaKrng0HRh42UOxGtoTFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=mZGD8Rp6; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=H2oCv6Ov reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="mZGD8Rp6";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="H2oCv6Ov"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751351149; x=1782887149;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uGl5l4cbrW0oZiz5/Hn8qYIROz+YDPJP8w6FEA4IyCw=;
  b=mZGD8Rp66jKgMH9uDs9YrZLnCcMUpq18Dd61EH4yQirn5hMLmNwukRkP
   k7hmOlecd8ztuae8nrv/Iu3wBzvh9KPrSnBTSNo7ObJ41SAglQZkq3tuA
   AY29trEVFwBTJS/u8pir2/Lfgt0hm7QLg+Rmuv6jg0vrfswsbkR3WXAeA
   HGJvyvBbtrd9mTyu/9h/v/JADfnM27jTQOj+LK8TOc+eSh3jbrIPFPwpV
   lF+3vVF7gieEqCLVApju2Lh4Y0266ts8ERkAvSGMDk16ZBwHEoailtJ3R
   6Pb0Dsa5AEpImxjbORZC4t4AETAC2lZMc51CtHwjxvcyYYAXl79DwNHnN
   Q==;
X-CSE-ConnectionGUID: kQ0Sl0NvSaKDZ5sTI77HNg==
X-CSE-MsgGUID: HXn+a99eQiC5kBXXehRZ8A==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; 
   d="scan'208";a="44943389"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Jul 2025 08:25:48 +0200
X-CheckPoint: {68637F6C-E-B72BD212-DAE8BA0F}
X-MAIL-CPID: 7E2F37648E5EFC1D7552387AF6DBB2FE_1
X-Control-Analysis: str=0001.0A006377.68637F79.003A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C053316A60B;
	Tue,  1 Jul 2025 08:25:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751351144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uGl5l4cbrW0oZiz5/Hn8qYIROz+YDPJP8w6FEA4IyCw=;
	b=H2oCv6OvW1wEnz7TbQS2gzetFzUgFUepcTii1esFbzf5kFGX0YcYR9PwlfT9our+XmHUwH
	87rgW4ir3ixWi1mZI+MENBAZRlJM6En3NSdwgFkelKnqOV1fYvDZ8bUo+UdFZ81UQDr6LQ
	TwmC3TB2me3dbJQ9jLTMYj1ptdu5uobQcU7XoGt6XgwPUNvagm9Aa8LftuYtQHA8+6pbhb
	3C5oblHujUluDWzH+6NZZ//Un1dYLS3xn/XWKNeu1Z5zM6cqcw3yKtrcEat+WgD3gn18Uc
	+69pqjjEoDpx4PaMrBlWeshGqdYcDcRouKEu5hMKjv8OsgrVWFUGn+S9tNemFw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 7/8] arm64: dts: freescale: tqmls10xx-mbls10xxa: Add vdd-supply for i2c mux
Date: Tue,  1 Jul 2025 08:24:55 +0200
Message-ID: <20250701062500.515735-8-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701062500.515735-1-alexander.stein@ew.tq-group.com>
References: <20250701062500.515735-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The I²C mux controller is supplied by 3.3V rail. Add the corresponding
supply.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/tqmls10xxa-mbls10xxa.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/tqmls10xxa-mbls10xxa.dtsi b/arch/arm64/boot/dts/freescale/tqmls10xxa-mbls10xxa.dtsi
index 40fa41eadd836..444bbf5115968 100644
--- a/arch/arm64/boot/dts/freescale/tqmls10xxa-mbls10xxa.dtsi
+++ b/arch/arm64/boot/dts/freescale/tqmls10xxa-mbls10xxa.dtsi
@@ -89,6 +89,7 @@ i2c-mux@70 {
 		reg = <0x70>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		vdd-supply = <&reg_3v3>;
 
 		i2c@0 {
 			reg = <0x0>;
-- 
2.43.0

