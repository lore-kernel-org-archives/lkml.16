Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE60720B811
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475757; cv=none; b=caoh7aRJcyp0p66WDA2KUV7VJ2SnfGo0AKAtP/pg/FwECsqV3S8E7WJahfZYnSZHrLjmEdkDa8P/NYJiyb/UTvbXWaHGyhtHRzskHuQEJDohJdVyCI0t3tKgGzqJ7uTBsxNk2Pc5A4Iyykxx1SIlvA4uK4n7USGyD9jPiMSi5u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475757; c=relaxed/simple;
	bh=josoN2oXJTAyky6w/wxcQUrGfF0otE5lKJmegdfRuAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rinYwUQpZmrlrsQFeV8EWrUFpWK2fDwRuExJc+Np+lV+U0DiO4YWMrzr2T/U1Ffs8H/BGsPiC7sh/moAnDuBrzAYcNaREieLcPN7dtM1AeFCHC15wuwbczwnzT9YQXHuywjGpBtNDzLJ1yrroxRCV3cXqYqcs/GhmtwX7pJ2NdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=n2yUiVXc; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="n2yUiVXc"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso5693425e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475754; x=1746080554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFzIBseBXs31QtpNYYtETMYlqRrqWSPS6FJ1rAB6aBE=;
        b=n2yUiVXcb3XawtvtZIcG0yhmXCbxcKL7SphRgNoUVQo07EDw45zm/Lwex1G9Th5jpI
         l8PJ9SN2XDjT8JEfEcguPwKLHRFxEMzplmmKASB09EKe0f3mFpnJj6YionT3BC54chtK
         vU+/RrAxXU2XV7QqlVhbiF7rMRxJegXaIJ5/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475754; x=1746080554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xFzIBseBXs31QtpNYYtETMYlqRrqWSPS6FJ1rAB6aBE=;
        b=oPISrbc/xQF13zb0adTWqGYAENQm308TwmkESxWE05jvTl+6nFI5WoZXkO46krq9Np
         Yz9bF0uct/pvfEY4Jd7RAVRsb2VHB2aUkxZ4ytw+59jal13RpdWtykhmvrgthEeeIKUt
         DM7thRZUwoDtufJ74qsJHeHqZ0nkCNHfmIPLOVHtPF7Cv2ZdNeP/NnAILHuk/f1vWZ6M
         R5pI6ulL1bW1nrioAKuJ3mpgS1AUmzg9malC5fXsphidUvcUQE6TL12EepTt1/AB6Irw
         ryqsASRAS76WsXGXja17LyJUSHD6eCmjdrtRN2nOqMdzokdGv7cz2Z3u4pEgBThcUVN5
         Srlw==
X-Gm-Message-State: AOJu0Yy1ShB1cHX9L2SIvpyOz6pxjneF+Hj/ULAmdyzueBI5JzsS49H5
	nOCgRn993kIFvPiteKeSkYXNHuLvHQXTRoFT4jUCuRFwAyszhr/zRG7hdRBEvhkdoG0W/tOzfv7
	u
X-Gm-Gg: ASbGnctxJsNT85ewByugw1ocdcFXzyi1Do5gidQeP5qfrsqZuDNY1/jXX1CLAlqab9H
	aNlkHPWPIrSx8LR4aiRrqyOwvYsdNNeHZ4V97PrkNN3Gv1dlc99EKs8VPyDpIZwzUUW7cFrC+up
	dRLtUj6e6XA0BXnXCptEw1waDkTGqmiKDCdRmEmwyWvd4/HVD955XrT6jEVBiRV3Y3Uk8spHXCJ
	GJOCNI+KdG9o61Z7MSiAalq+tHWXSrSYC0PUiEZTTlYzUlCRWlw7193p0UHMM8Te9YdzCBiK3uQ
	MaeSSHmVeWhrUgCHnTQBed/fLzxhr2y4XsjthMiEpMKd8EvPBJK6Fk3QJfxnJWuUyiEZPF5q5ng
	SbVoH
X-Google-Smtp-Source: AGHT+IHlkO0fTEbB2RjnKyjqf/3UhcogYgQtKjOhgIefhZdroj8G8F35OQptYoAwMwAcZLh8vRUsvg==
X-Received: by 2002:a05:600c:3b8c:b0:43d:fa59:be39 with SMTP id 5b1f17b1804b1-4409bd8bd4amr8437045e9.33.1745475754091;
        Wed, 23 Apr 2025 23:22:34 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:33 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v12 19/19] arm64: dts: imx8mp: add PLLs to clock controller module (CCM)
Date: Thu, 24 Apr 2025 08:21:49 +0200
Message-ID: <20250424062154.2999219-20-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the PLLs generated by anatop to the clock list of the Clock
Controller Module (CCM) node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v12:
- Add the patch
  15/19: arm64: dts: imx8mp-aristainetos3a-som-v1: don't replicate clk properties
  to fix new warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/'

Changes in v11:
- Fix conflict while rebasing on master for patches:
  13/18 clk: imx: add support for i.MX8MP anatop clock driver
  14/18 clk: imx8mp: rename ccm_base to base
  15/18 dt-bindings: clock: imx8m-clock: add PLLs
- Add 'Reviewed-by' tag of Peng Fan for patches:
  11/18 clk: imx: add support for i.MX8MM anatop clock driver
  13/18 clk: imx: add support for i.MX8MP anatop clock driver
  14/18 clk: imx8mp: rename ccm_base to base

Changes in v10:
- Drop the v9 patches:
  16/23 dt-bindings: clock: imx8m-clock: support spread spectrum clocking
  17/23 clk: imx: pll14xx: support spread spectrum clock generation
  17/23 clk: imx8mn: support spread spectrum clock generation
  21/23 clk: imx8mp: support spread spectrum clock generation
  23/23 clk: imx8mm: support spread spectrum clock generation

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan for imx8mn platform patches
- Fix building warning raised by the kernel test robot for patch
  v8, 11/18 clk: imx: add support for i.MX8MN anatop clock driver
- Add patches for imx8m{m,p} platforms:
  - 23/23 clk: imx8mm: support spread spectrum clock generation
  - 22/23 clk: imx: add support for i.MX8MM anatop clock driver
  - 21/23 clk: imx8mp: support spread spectrum clock generation
  - 20/23 clk: imx8mp: rename ccm_base to base
  - 19/23 clk: imx: add support for i.MX8MP anatop clock driver

Changes in v8:
- Drop the patches added in version 7:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v7:
- Add and manage fsl,anatop property as phandle to the anatop node with
  the new patches:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v6:
- Merge patches:
  10/20 dt-bindings: clock: imx8mm: add binding definitions for anatop
  11/20 dt-bindings: clock: imx8mn: add binding definitions for anatop
  12/20 dt-bindings: clock: imx8mp: add binding definitions for anatop
  to
  05/20 dt-bindings: clock: imx8m-anatop: define clocks/clock-names
  now renamed
  05/18 dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
- Split the patch
  15/20 dt-bindings-clock-imx8m-clock-support-spread-spectru.patch
  into
  12/18 dt-bindings: clock: imx8m-clock: add PLLs
  16/18 dt-bindings: clock: imx8m-clock: support spread spectrum clocking

Changes in v5:
- Fix compilation errors.
- Separate driver code from dt-bindings

Changes in v4:
- Add dt-bindings for anatop
- Add anatop driver
- Drop fsl,ssc-clocks from spread spectrum dt-bindings
- New

Changes in v3:
- Patches 1/8 has been added in version 3. The dt-bindings have
  been moved from fsl,imx8m-anatop.yaml to imx8m-clock.yaml. The
  anatop device (fsl,imx8m-anatop.yaml) is indeed more or less a
  syscon, so it represents a memory area accessible by ccm
  (imx8m-clock.yaml) to setup the PLLs.
- Patches {3,5}/8 have been added in version 3.
- Patches {4,6,8}/8 use ccm device node instead of the anatop one.

Changes in v2:
- Add "allOf:" and place it after "required:" block, like in the
  example schema.
- Move the properties definition to the top-level.
- Drop unit types as requested by the "make dt_binding_check" command.

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 78d71aacd0a5..212596927f0a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -751,9 +751,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MP_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MP_ANATOP_AUDIO_PLL2>,
+					 <&anatop IMX8MP_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MP_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				assigned-clocks = <&clk IMX8MP_CLK_A53_SRC>,
 						  <&clk IMX8MP_CLK_A53_CORE>,
 						  <&clk IMX8MP_CLK_NOC>,
-- 
2.43.0

