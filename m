Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B0028C2D0;
	Fri, 30 May 2025 22:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748643452; cv=none; b=HpCqdC6C1EIomrTN1OZ65B4d0PkVBtXJR84J+CtDrppmL7EDz8rg5X7Egm6c3uaWT0sw67czGwVwVqNqSej1SpzmH6348voq3ErLXDwr74Odc2OqHXeszyGBLCUS6yF1kyV93O0vbQwn2pq4iCcqZgNzKBK/Nsh2FCodIsCX3ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748643452; c=relaxed/simple;
	bh=+rOvhQd/jMBSV5uT4L5LEtK0HwicWLzbj+u/i4d3U5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ri40F8hAzLF/Rm2qLWooan3YpwPSHxW7Yr1YX8DBsIW5gC9VPsAsnq+QRODVHHyFzSE+YGOrHBm99QeU6PI1auxlAHV6LF5oxSujof4df4Dn6LfpUFPbXN09m9rTXyBjJZwvFoU38tX6f6H8CuvgHs0zErUVOMWahbJ2mAsEmxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JCaU+adp; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JCaU+adp"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6face367320so16626976d6.3;
        Fri, 30 May 2025 15:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748643449; x=1749248249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89/6esdxobIB3oXPFQQO57dHmv1o6cOWK2fx905kC30=;
        b=JCaU+adpz1mtcBIHzD6kByEvdXoVEsvlcXXKsY2KQ8cTPBZW5XjoVq4TZfRLt6N/JX
         rCPqooX3RRfirZQ0GS2sblP3f2GNVAz+wqYFNr4nNsoWp0KNrILZdclcNd/j5NPYa0ZK
         OU2PV73wmcZWH9vh7LSOmJwCOOv7oyo5w4WlQ77HO8lkv/MBdGNztLgKd5bR3aeM5Br7
         FBviUIt0xjlfU5zkC0pwv8mlzF7Qag3TN+lBArijcKfGBj1CTo5WxznugwUg/ISPwKTW
         KkYmq+r3rbxXKNap0tJ4IixcIKyiiPHgDTPTG6EDHxZbmUeRfb4cYxWMyKEl9Vs9LxhJ
         Eaow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748643449; x=1749248249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89/6esdxobIB3oXPFQQO57dHmv1o6cOWK2fx905kC30=;
        b=UsT2iswOVUY7IkWdfoSpm7tKMRkki3HDqD3ByTZrBVLUBqTeULogb8QHVY2JBb7o1F
         4XgH1sy4mPdf6Gu0Qy+NKFKeyNkP5WEIYXn4rOmlSUzPGpAMYdkq2UKLvlkxzZXDC4MI
         rTEAsqZSCk2SXOJpHw3n1s8O/H5HWCAHwoUXDg0my4+bqih0c0OP+4be2wZDX2YbAXJY
         zLUfBbKw46BY6iUXkcfOBXgxbNtklnLlQkLVByIR68ZnGQhjlhXNCY9LxG0ywAS5LPG1
         FJvxB6ljm08QWa0oQcepZCJTzn8k84IgScD59ZTNlcnseigGRQ4HQ7Z1pM5JgS/tEeNM
         Ra7g==
X-Forwarded-Encrypted: i=1; AJvYcCWB/kd2Mc7+2qSjyjwBHhYGEeFiUP5JwHMtFYzFNtBtkXoZtR4K7z8L6zIRpdPireOzgqmNmrY9aieh@vger.kernel.org, AJvYcCWlWAPXSrtr48GXnFxxoFiP6+VKz7hnulivZpZoJHi4B8Rd74LXVgrTzML2PdCvQHnyZqpptYs6r6EL2z7h@vger.kernel.org
X-Gm-Message-State: AOJu0YxkEHmroebzDsSIyqsXPqLfpkGFHOpMbXcZR8phseG5U4U67nwa
	qj9x+W8HXAxk/PZcnmBH9+NvHf1mrRwcEihj5A/HoaWSYodUaPht9Im07+ezTg==
X-Gm-Gg: ASbGncuRdXuuh9jRs27ieFX8noFIXJADcMZVAP0PtO23Nc0HUfyRSXElakmTNWrQcPv
	HQFS8sxc7POVBkGZiaJEbqr8xgysEVM4Kou8u4mK7djtY8lBeP0ciMMEvrBuS76wsqPgm405SGk
	4gaNLdCbz53G5clUEP/YuGIznR0bfoq3FZmjiRhYlamEXADXXAs2mi1l/SrL8bn5Nz4YdcTTsg8
	uZux4Xmew9z+BUwgjSwpOmDbYOettv8P6LMYNIn86ryHcOoIEvtu8668VWe3W9q8I6eWzLB5UpF
	VFf3Tr15voF529Y2hg1ONcbsZGLI+Ga7w7gnKIJ6h4vTkXTDPQHTX6fJ6hz9sEV7AIkg6oApwDE
	F1jvKmUzSJr+JpuPiji+Fl6LjfQ==
X-Google-Smtp-Source: AGHT+IH6ZsYKk6i7ecLc1HWTvwLW3YahjSaeJf60X60SsGSRpv9givwN0lV3GVO1/HEeeqSYTFYdjA==
X-Received: by 2002:ad4:574e:0:b0:6d4:19a0:202 with SMTP id 6a1803df08f44-6fad1a9d02amr63019336d6.33.1748643449174;
        Fri, 30 May 2025 15:17:29 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d4d0cesm29986866d6.35.2025.05.30.15.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 15:17:28 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	m.felsch@pengutronix.de,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: imx8mp: Configure VPU clocks for overdrive
Date: Fri, 30 May 2025 17:17:11 -0500
Message-ID: <20250530221713.54804-5-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250530221713.54804-1-aford173@gmail.com>
References: <20250530221713.54804-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The defaults for this SoC are configured for overdrive mode, but
the VPU clocks are currently configured for nominal mode.
Increase VPU_G1_CLK_ROOT to 800MHZ from 600MHz,
Increase VPU_G2_CLK_ROOT to 700MHZ from 500MHz, and
Increase VPU_BUS_CLK_ROOT to 800MHz from 600MHz.

This requires adjusting the clock parents. Since there is already
800MHz clock references, move the VPU_BUS and G1 clocks to it.
This frees up the VPU_PLL to be configured at 700MHz to run
the G2 clock at 700MHz.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 909555a5da4b..848b25c9b752 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2256,8 +2256,8 @@ vpu_g1: video-codec@38300000 {
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk IMX8MP_CLK_VPU_G1_ROOT>;
 			assigned-clocks = <&clk IMX8MP_CLK_VPU_G1>;
-			assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
-			assigned-clock-rates = <600000000>;
+			assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>;
+			assigned-clock-rates = <800000000>;
 			power-domains = <&vpumix_blk_ctrl IMX8MP_VPUBLK_PD_G1>;
 		};
 
@@ -2267,8 +2267,8 @@ vpu_g2: video-codec@38310000 {
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk IMX8MP_CLK_VPU_G2_ROOT>;
 			assigned-clocks = <&clk IMX8MP_CLK_VPU_G2>;
-			assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>;
-			assigned-clock-rates = <500000000>;
+			assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
+			assigned-clock-rates = <700000000>;
 			power-domains = <&vpumix_blk_ctrl IMX8MP_VPUBLK_PD_G2>;
 		};
 
@@ -2284,8 +2284,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
 				 <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
 			clock-names = "g1", "g2", "vc8000e";
 			assigned-clocks = <&clk IMX8MP_VPU_PLL>, <&clk IMX8MP_CLK_VPU_BUS>;
-			assigned-clock-parents = <0>, <&clk IMX8MP_VPU_PLL_OUT>;
-			assigned-clock-rates = <600000000>, <600000000>;
+			assigned-clock-parents = <0>, <&clk IMX8MP_SYS_PLL1_800M>;
+			assigned-clock-rates = <700000000>, <800000000>;
 			interconnects = <&noc IMX8MP_ICM_VPU_G1 &noc IMX8MP_ICN_VIDEO>,
 					<&noc IMX8MP_ICM_VPU_G2 &noc IMX8MP_ICN_VIDEO>,
 					<&noc IMX8MP_ICM_VPU_H1 &noc IMX8MP_ICN_VIDEO>;
-- 
2.48.1

