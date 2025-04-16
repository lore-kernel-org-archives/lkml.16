Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8200C20F066;
	Wed, 16 Apr 2025 01:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744765324; cv=none; b=teqFxn5Y7/7vLRugIBkYkZPNYVPmvaD6kPxSEXTg3ZBJq8KqfveId/5IPEj+BsBd7b9SCJQ4RTnDG4gL/mi21LQDViSaM8dyD1PcZBmhudm1Ym7dult+t4T5GEg6NbjMwkKMm4LXPc/rfQ9QaXhl00U6UVSboLpZua3nC5KmXTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744765324; c=relaxed/simple;
	bh=wrNk5hl91Nx0/hhcEKOiV1QTtEVWIAnPCPdBZO1w5UY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UiOEpk5hN0SlbW7O8jNy18U+WxzbbEfjqeJkjQli6YOjAHNW8/0TJfnMBdf0DyGFmlhNmsTYoQh2XvyPbGgChIRCMiViabjnQ5yZxFIIjCk69tNsznRjiL06sVfEt8ElcofV69YyTjA6SfkxHYKpYXRYuyUcOwP8Ce6rYxfFP7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AwW1a7Rk; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AwW1a7Rk"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4775ce8a4b0so94961671cf.1;
        Tue, 15 Apr 2025 18:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744765321; x=1745370121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INCYZW3hzgKSK4AliiojJjATw3Q2KBub6aarsjSNZ2g=;
        b=AwW1a7RkByiPFgjwvLTt4W/Sbe4RjWkR7laFV+/nm2nepRmgyjvDxaZ1KZ5vpSYdhU
         a11VBaJ4wYSQYIDHnKB7fLZuW4BywHo764Tn6ixQzKlXnLQjE413sNZYQfzonTVbsvvk
         YMXGRygPAhossCeNq0ZLLsVxKKN7hHaOVlHOSHp66orF3tHrLZRHpf6CXzWgmvtVFBXn
         fUxONE6DR4kEp5QSLe6gN5+mGZw5xSm/APQmY/opvnHWYKPHVe6Apkho8Kny1Uqq2A1U
         c5dO/34UFnsMKYGOTs8dARjmyH08B51CRcw3IEI7Q/SWyILb2/5nm/IC+Tdw+H0PAWED
         W6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765321; x=1745370121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=INCYZW3hzgKSK4AliiojJjATw3Q2KBub6aarsjSNZ2g=;
        b=RJnR+B+S1ZnYTwM80P5rTs2QIsZ1q+a+l9MRnSVcDglqT7Y9UlopNnP684YSJV94n7
         BpLb/m233fpL4M19oeLTPlseZHd1cbT/FoG0CqLXueM02nibZdfWr/+vwLQqdWGUq6Ns
         rxCHUqbFNb9hg16xWgdLGjS8p8aYxemwceAzH3o6KAwOdk260/uWbJbfjOb4Sz2njKFI
         ZUe32xdxyrHrlX9MkHB+wFbcOO9oWRZArFICD5RW9LZGf/GbdpjqP5Xgv2D7IAydeo8o
         kjNoqt+kFjyJ3ZQn+xqaGGn0nsKQyFDoWCz4i2qVqF8/hwoD/i0TnaPeUqk0ni9rAQq+
         4tsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwUbs3vQeyjyuI9HnrXUx+51upzlfhcxhuAZGSrwswW3xmN8Xax/madrwkoGQm0gvF6y6JX0FyDvA1DlGH@vger.kernel.org, AJvYcCWkmY+M31WuMvJGoMRx2Z53u2JV/sYlgymUb5/mmnaqCzQXD/I3wHDAgRJTCvUNSjVlqiqIQ3ThMfhs@vger.kernel.org
X-Gm-Message-State: AOJu0YwHgEW72XdGC1uHcQaKDy8mZbLnDcEBFt564/E8mfVx5gAOsDYB
	RWfPZpg6KFsleFW5l1dw9VTUkyBb1wE6zQFHJUZZTEdJsEJgZGjF
X-Gm-Gg: ASbGncuuQ+WfqBiFDotnEfORkJtzUXokbOuPnxqIZwjidpVF+I8cNRRPupEmjqT0wP2
	Tt6DkmzjscGlOjJ1FfRKRIOv8Rxk65k5/NqHYUYF2Vk0wKsbzZKsuDOOlY9GLpOkoc1TjNO8oEA
	+TJ/FUgbom7Ii5Bq3FjIgmeANbWVeXCmr6tSIgK1oBZomMO6Ac4alHy4sOPfMCbnPqHfApFJr5y
	v67hIRDfVY3mhQKH+JXafqG3PoIySCEKemBxeSp/7H8JpK68Th2dOOht/YjcoIHroGBPkUcfeOv
	FHZAxHVFXm0ogcgT1gOOhJXIaEjSWuO8EPHpjbXUGM90b+sisUy/ZK4eqKC+g3tlVv3Q4zgYxXI
	BILfA8x12dLS05/k=
X-Google-Smtp-Source: AGHT+IGxhkCmvbvhdNDyJBr3gKgLsE1Y/iVTIpUOgdp7ylffmNMMo/b6PF6ouKPTqYWmOf1JNxqzBQ==
X-Received: by 2002:a05:622a:24b:b0:476:bb72:f429 with SMTP id d75a77b69052e-47ad3ac0f4fmr21814201cf.42.1744765321404;
        Tue, 15 Apr 2025 18:02:01 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc29ccsm99746291cf.77.2025.04.15.18.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:02:00 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Frank.li@nxp.com,
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
Subject: [PATCH V2 08/10] arm64: dts: imx8mm-beacon: Enable RTC interrupt and wakeup-source
Date: Tue, 15 Apr 2025 20:01:34 -0500
Message-ID: <20250416010141.1785841-8-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416010141.1785841-1-aford173@gmail.com>
References: <20250416010141.1785841-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the interrupts and wakeup-source to allow the external RTC to be
used as an alarm.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Update commit message. Re-order node

 arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
index ed7a1be4a1a6..c7a8f2a6fe90 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
@@ -236,7 +236,12 @@ eeprom@50 {
 	rtc: rtc@51 {
 		compatible = "nxp,pcf85263";
 		reg = <0x51>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_rtc>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
 		quartz-load-femtofarads = <12500>;
+		wakeup-source;
 	};
 };
 
@@ -354,6 +359,12 @@ MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3	0x141
 		>;
 	};
 
+	pinctrl_rtc: rtcgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO13_GPIO1_IO13	0x146
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_UART1_RXD_UART1_DCE_RX	0x140
-- 
2.48.1

