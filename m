Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F016288C84;
	Fri, 30 May 2025 22:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748643448; cv=none; b=l58n5V8mUjaSqXtlAXLOJg+L4jvZHO2Bhd8ni+rocG1tYSpl9Yl1x1bYH/ECsC8X03gS8b4QcNruei7HegztxCsCWns0MArnbTSfuQhHbobfo2HleaoLagxPw1IOwNqriF/vW+P3Q7Moah1eGKKdQBFUgG98YuHfKwHj0uzdqvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748643448; c=relaxed/simple;
	bh=DExqEOT0kX/jHMPfIZs0OV/v3fcxxd6h0sqWoIMhHDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TfjBpnVJLZlhxS0qcnQNWN98p6/MsuvieKrlQ6pmG/ShfRSHr0Paf3CqEOVS7VkvUhwwwuLAEieRdhypoLinPUk6ZVLMPkf2Xq1r4sPKqdVtGCX6HwLxMH944tOFASinpxmJ/SPUlR2QKwC8cTtyVo+EPFc4w4Q5LMVt/wSBfJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPfHVFlu; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPfHVFlu"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6f0ad744811so19637316d6.1;
        Fri, 30 May 2025 15:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748643446; x=1749248246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqOT/fzFZhw9tODgMNpZ7Zh9gU62VfKJbyQr/u6ucPo=;
        b=QPfHVFlu/tbpj/LeQeHyFXyWNLi7Kj2AcoLPqBaMizZZTt+cDrt09/Exyl5P5z3GeY
         IKeFQLLXmteND1dMEbqxBcVl/ZlzzxD1uNe81qGmgTh4qojY4xj4FNN7c0dIuSeBMmOZ
         83EbX9zcUU0ZVIpzznOeL7ykxTJUOATwXoEi6m8yJyRcfJ0lZr2GmbPMS6c/bNP9JM52
         Uj46OebMRXCb2pJUHgaiRzmeGlgQnDLE7Z5tldBj6LiG2yUTaYXD4VDddoY6V61WvNBN
         YFKx8GTC1B/arh5QtohaOrjqiECUADFf+XQkC36PrwqwTVS7Mw8N5Fj+2RbiVTdvfUMU
         ohPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748643446; x=1749248246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YqOT/fzFZhw9tODgMNpZ7Zh9gU62VfKJbyQr/u6ucPo=;
        b=tWASzGnkRM+AVqgCIHJadISqRTwNMrn4CRMn6wnyWbjZP94Qc9mQF/126Ax9idQO2p
         cpT9K698jw70g3iMufkG28saJnpJ2R93X9XtV75y3s6meXoSfxWq8Z96ATe/ROBxlDSY
         wL7MH7FwPwNvOhc3adop9KOEO9DvSSOUS12MmlUAyb280ttHoQsDy9gQLeWVTGW2aqUl
         qIhU/6oDy5qVNS325k7Pu9miFEAGK0h3CFo6DuoTVMJFAQJWKzwShhS7aE0uLtwo64+9
         I3p0YgHVCqVyHjEQvmpvQwod4CPZKYEPfbngMA+BDwBZ/gN/5/SJHyh4euycDC+Mdvvj
         ofsw==
X-Forwarded-Encrypted: i=1; AJvYcCWXGMk1VTcMW+x3+LYd6zs2up+3/sUBCxRfPES4b7X6FQQfgRauVJeRDFPWF2x3J7j5aSHrwWYg7JSH@vger.kernel.org, AJvYcCXyrkH4uaepjbVVNwTsMWvDIGreqTYo5/Uda0KUj4ytR2KvdG+BjlqE2IlGCVRtArEWh2Cw7nCsxTU6fzdC@vger.kernel.org
X-Gm-Message-State: AOJu0Yy++Z6jjXukTkdUo39czcAL2xbEij4j1/njeCtDTcngdkRtMkEA
	2KQUy5BnPPCIcEgFVyEWqLyOOGz7oYykmZWu2b4vK6Tv0CCW/SlRsRyG
X-Gm-Gg: ASbGncuX8hqBoCZ0N9CDwxR0Tc2NGONCNDBWp1rrS8cpZAHSwg18ASmq5Onq94rzjx5
	ERnf1YW05NrC0p78fIq76p69kU/pDGOZo/7kehx3v/Wf0j4ndL9YmPLfvQefGvdseGbQcpu8L15
	NZnl10CBjjHSVQ+WmJz+9HSh60Xxny0ULvTERKe4LWzh8WtJX/Sq2jJfl74Yr1aADV9HTG52u5S
	KN0KtO7YMw2RLTQpi/KMIEg5kWCJAf3CH+3DEUm7+e+kJrs+k9hwGI9UnlYgTJqIixF4pXMuAEK
	O4w4sdFrjEsbC7vyvZjtAt9uI2d9Up8dAK23WcXYBt3fVZAqp7Ggcx5FG6Mgd7WoDSXsg+3sQzc
	gPwcwGUSC4UA9q1H0Wjz8EYHvLA==
X-Google-Smtp-Source: AGHT+IG5/kDcd76kYK3js7nON8eVvFn7F/M4ye+7rDR9BOtAKIBHqXL1giHYzo1HsEvEPCKdjFVk0A==
X-Received: by 2002:a05:6214:29c7:b0:6fa:c043:7781 with SMTP id 6a1803df08f44-6fad9090d99mr2047706d6.6.1748643445856;
        Fri, 30 May 2025 15:17:25 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d4d0cesm29986866d6.35.2025.05.30.15.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 15:17:25 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	m.felsch@pengutronix.de,
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
Subject: [PATCH 2/4] arm64: dts: imx8mp: fix VPU_BUS clock setting
Date: Fri, 30 May 2025 17:17:09 -0500
Message-ID: <20250530221713.54804-3-aford173@gmail.com>
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

From: Marco Felsch <m.felsch@pengutronix.de>

The VPU_PLL clock must be set before the VPU_BUS clock which is derived
from the VPU_PLL clock else the VPU_BUS clock is 300MHz and not 600MHz.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 1bf15c502280..909555a5da4b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2283,8 +2283,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
 				 <&clk IMX8MP_CLK_VPU_G2_ROOT>,
 				 <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
 			clock-names = "g1", "g2", "vc8000e";
-			assigned-clocks = <&clk IMX8MP_CLK_VPU_BUS>, <&clk IMX8MP_VPU_PLL>;
-			assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
+			assigned-clocks = <&clk IMX8MP_VPU_PLL>, <&clk IMX8MP_CLK_VPU_BUS>;
+			assigned-clock-parents = <0>, <&clk IMX8MP_VPU_PLL_OUT>;
 			assigned-clock-rates = <600000000>, <600000000>;
 			interconnects = <&noc IMX8MP_ICM_VPU_G1 &noc IMX8MP_ICN_VIDEO>,
 					<&noc IMX8MP_ICM_VPU_G2 &noc IMX8MP_ICN_VIDEO>,
-- 
2.48.1

