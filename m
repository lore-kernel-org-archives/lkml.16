Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179761465A1;
	Thu, 12 Jun 2025 00:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749688776; cv=none; b=E3Vzbgan4/CnZKCxDvQQdTN2l2vwFt4VMf7dEOAdvPXJX8uNChuK5adfGSyjPlJVOS3lm+jnpZzKEJ9/eihifiY3j+29f6EpbjMd26jcRfcM4ZcmO26x2n4NHoZvWwltbQzA75nrVwsP+YKOGbAiZp/RAzsCXb0qwx+r0ZdWp/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749688776; c=relaxed/simple;
	bh=9qiaGT5spkiZqJJJHPCBqPrhM9VOU1z/Z2IVaS4z1Vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MwFHsRIeinygsH4liN5UODWgN2ANjXtpnoVzWzfEugwND1vE4v4YKPHYevWWip9kW7HaHjuq47QTpPwEfCRqYRg9inShzBH0X7aRti1WvVCFdbQWMZ0IZo5koEyvlAZF1cPBEBU4AAPYZ8palUmyTSHrRYmdTzIq8SbLpbA7JMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGoFMz0r; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGoFMz0r"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7d09ab17244so42417885a.0;
        Wed, 11 Jun 2025 17:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749688774; x=1750293574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyLSDtp3/79+REpFtOfivoiwhQtWS2WlyGvRoudAipo=;
        b=GGoFMz0ra1E3WtxAVhb+KWEJU/zIQ+/ATH5PZ1uoojdjUJmRx7WW5dDYQk/fINl1R/
         tRDOl4AfpFR0Ukc5uPqX8YX2IcvXODnxjmbu0WX5ysEenkV+6tgV1YI4eRFmcV/XqU5p
         qwM9uTPmQbMSTI4fXP+IREVwKuQnChssvKNSzRG7Le7pvxJ8EkS9dmPdG6rZu8EGLdKT
         ISUfoRub+36chLs+3Mvkmaq0L21V/3qyPd3gzB2jCEv+D3Wm6Iss+Myqenj9YI4zIAAK
         cApHzXT0O4YrNmmhO3XxBMqpn0BWhGiCQfLYsf9PfMcTuGqfEmF5T/DM3esGc/P7Gm/t
         7loA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749688774; x=1750293574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VyLSDtp3/79+REpFtOfivoiwhQtWS2WlyGvRoudAipo=;
        b=GZ6E8wH2kkY9avVva7cVwuTx9+2Ni8RvvM9Hyv90QVG0wS5B3dhIvjPmI9nqKVoxwh
         pSWoHfnRjWmX/su5PB64VN3PfCPW9MvMs3uQf+k7cm9i+kH8CFCYUzDXOvBysElRHzDb
         3qeJ8I/q1ARV0Q5cq1Xi1pA4P/8jFaB3Wx+nEhfqTltiO2p4qqvO87WbKTXOpioJV2Jm
         sjzH7QQc0GXzcS44JcQaWwpiwIQMMj0eKssWAEYFX+rQXaPFXQMNUKBprxAYBCJ3MdAp
         cVLDE5gK3zobJMoCH9rAPlJRXcCnEwHkYvtjAEDFRR95ouC4sHVbYT/dXj7DMhUuSiyF
         8oaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm2QeitrhTqzZpD8McNznCuqBKysYmKABFc1nJ3P1FQRwWuC6H995kR1/fjB57tQQjPFLR6V7cPh8S@vger.kernel.org, AJvYcCXH8T/qXBdyHMc5jBvrl/xXyQHsdT4KxHr3iKDmlJG1esAb0mXobnsQg0+ugpdzgGonxP+H092A0zkn60di@vger.kernel.org
X-Gm-Message-State: AOJu0YxjpMqZQdt1b4C4BhjMkx2OL+1XhNTZw9oEZ+LL3bvr5A09N6sT
	P88loWDrwOXmwrdTAZwFsFzf60y+mpFXpDKXwE2+jWBQFyxdU7iE9lLJ
X-Gm-Gg: ASbGncucP6TTYqpKtKeWCMfbEwYvMBMWvaCCsKJZCE4IVuchH0DrTHSt+qpczbzW2/a
	J71d9/3CWyqNhp0qZ/sfiuoMxGfL4xVLEOp2gWMvsr6WAzvOZ5OoVnK+4QGpApEIjAck2MbEZY3
	gOZ3d24g8u2MpsPGI4SrUn7336YfT8aFigzRuDmxKtD9XM2usOT9Pe2VuW/uNmGyVkGWCSY9/0b
	abhPA3f6yT1FdTe2H5FfsOgmjY2Q0r5al7KGgvFimRfnKhJ1wB4koAfx6iuuXWDkx3Bhjauuk9C
	7sxLTTtJejo4zLtTcXezfaEVbCFClP3oDkXK3teJ1DSylkfDlqaL7Znk+53V6tVVAH+jG4Nut0g
	DCEQum2u5JoGCqdmLcyiwwG8SAoX66jYM40mM
X-Google-Smtp-Source: AGHT+IG1wkiN8hZKQxPPHMcYnO6q68DrpDvat0v3sRECZKC1dxLK1aUfI6nU+MNWxjZ/Pnf7eAsbVg==
X-Received: by 2002:a05:620a:450e:b0:7c0:b523:e1b6 with SMTP id af79cd13be357-7d3b2a0001dmr241481285a.11.1749688773986;
        Wed, 11 Jun 2025 17:39:33 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b528c300sm35935485a.101.2025.06.11.17.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 17:39:33 -0700 (PDT)
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
Subject: [PATCH V2 4/4] arm64: dts: imx8mp: Configure VPU clocks for overdrive
Date: Wed, 11 Jun 2025 19:39:22 -0500
Message-ID: <20250612003924.178251-5-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250612003924.178251-1-aford173@gmail.com>
References: <20250612003924.178251-1-aford173@gmail.com>
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
V2:  Move VPU_PLL assignment into the G2 node, since it's only needed
     for it.

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 909555a5da4b..8884b3fe5e60 100644
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
 
@@ -2266,9 +2266,9 @@ vpu_g2: video-codec@38310000 {
 			reg = <0x38310000 0x10000>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk IMX8MP_CLK_VPU_G2_ROOT>;
-			assigned-clocks = <&clk IMX8MP_CLK_VPU_G2>;
-			assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>;
-			assigned-clock-rates = <500000000>;
+			assigned-clocks = <&clk IMX8MP_CLK_VPU_G2>, <&clk IMX8MP_VPU_PLL_OUT>;
+			assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
+			assigned-clock-rates = <700000000>, <700000000>;
 			power-domains = <&vpumix_blk_ctrl IMX8MP_VPUBLK_PD_G2>;
 		};
 
@@ -2283,9 +2283,9 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
 				 <&clk IMX8MP_CLK_VPU_G2_ROOT>,
 				 <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
 			clock-names = "g1", "g2", "vc8000e";
-			assigned-clocks = <&clk IMX8MP_VPU_PLL>, <&clk IMX8MP_CLK_VPU_BUS>;
-			assigned-clock-parents = <0>, <&clk IMX8MP_VPU_PLL_OUT>;
-			assigned-clock-rates = <600000000>, <600000000>;
+			assigned-clocks = <&clk IMX8MP_CLK_VPU_BUS>;
+			assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>;
+			assigned-clock-rates = <800000000>;
 			interconnects = <&noc IMX8MP_ICM_VPU_G1 &noc IMX8MP_ICN_VIDEO>,
 					<&noc IMX8MP_ICM_VPU_G2 &noc IMX8MP_ICN_VIDEO>,
 					<&noc IMX8MP_ICM_VPU_H1 &noc IMX8MP_ICN_VIDEO>;
-- 
2.48.1

