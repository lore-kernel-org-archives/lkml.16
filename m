Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456BB26A0DB
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745388209; cv=none; b=ed5t0UndI1kcze6DE8dQFxIxny1jJWsI2ExYJhAPBaYcxWbTkApD7LLbIoqZkLOhIuhMQWavAq8JoDhnwDwND1YlMxHwa/6Mi9bR1ryArMfI/W51A6grtLmmvrGjL9xcHneUtvESIwCbD+cuj83kXLbxmW0NS/UX3g6Qny8rMw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745388209; c=relaxed/simple;
	bh=6KSGxPUnS1mPNRJ96C4CkAbWKnuWJ5Byr6T4Z3L2c0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pdG1Mh8O5qQh+2Ufk/gJ7RHSEmeqyUYyEgEjjgQ9nv6GaE/WhMVWm/ZcWJhN81MhjCOJa7/JJ6TFNcq3C70tKkmCrvgnkCiIqQgQg4e/nEi1AnTEakNBTuX/j5/BYa8sHfyPhs51W0cv4SERk5AiIyOBjz2jHhrB8Njy5XKrmi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=CLxbm5cJ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="CLxbm5cJ"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac3b12e8518so975813966b.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 23:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388205; x=1745993005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwnDSUvK6FGHCaa/OUJvqxFp0aKtITa+jYSMw/i6jvs=;
        b=CLxbm5cJtLwuUx3J69Ru0l4YnRYGSdRppt047NX/doT/cDrAsmj+Rj7QD03PZuYlRj
         sIUSIvDugj9+Qo8YOIDdrDaEvLMSJ4qeIdqkSj9QoxZzXreIIlKGu9BJWeEVgUVFWRY+
         1JoGzIUlsSJkQlou3+9VxI69eCm/Tr8FjiFmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388205; x=1745993005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwnDSUvK6FGHCaa/OUJvqxFp0aKtITa+jYSMw/i6jvs=;
        b=PHeSzz06oj+r0uJDsE4Mf3CFj0SJkWAjxmjcyDjO9fVksqX47uxCslTa+tL3LCVDjf
         fkmFCeHuyyV0AbPOx0/tYX2drSdW2b276J+dQeYRYm04leHxYXuUMoNjwY4X/A4Hr1yU
         Z77eFh7M2UveBOSvSz36eMskAAIqaPgbU9LfkigR/HYq6+UqncTghDkp+m9iSAkktTP6
         fHRbM0URJkEy6u3XXGRbx9y/ZCJIww3CX1N0Ww9mPvbhDxzwDvFgktVwpPPrOJisThiG
         H1ABReoQKEl9T7YLxOM+VUD1TPf5+PxqeY54GzWMvRxsbe/1w3BMVGpHxsqCqV/ZFgRi
         H61w==
X-Gm-Message-State: AOJu0Ywt2NLTWDYwbujomSheDQqZDhDc+7FH37NHHqlTosDC6RRV4yPq
	A8QMwTSqOwlouIw/1HFHeF5W1xILoIGx8cX2n1+YGYnZIAUPv1/+0RpiRFTGcncGjhTohlTm8B+
	m
X-Gm-Gg: ASbGncsqShdKeaQhZGRxqgbQUj8KQOAtk0mL8hESilfytqoa9neP2+Vu1kug2dALmDB
	OQPZ0CCobJzykFcxPA3ubZd7BS+DJpNLwPz7rRjA7BRBfbBFgcd44gtaiBXnWbu+RK0gT2Xhd7/
	DbXSvTdVM6gHFTuGcWuMw41e8MTkro3FRP+aJHxHZ2s9VA/KWxdVvhXQ85uLZYQV2b4UBGWcbMt
	l91RVxvwhuQi44HxzGgrDKRF2WhwZEiwI9saZa+Ltwl/WpAFsCyMPwH7MM8IL/lDdr1c2e8zLmM
	AUu/KwaESERY22yPeO5+B+4yQL+MAUUzkKhBNEDZqNE3+kadu8IZjs4Wm4qoGbLJis9itvFoujV
	OY0PCrLTwFyibfbM=
X-Google-Smtp-Source: AGHT+IGsUxDaV1VG5VEFOK4UELVg2Pwf+4jwnx9ulQMNovrjSuWKEHY8T3Kxuf+EnYLtMT72UxcKgQ==
X-Received: by 2002:a17:906:7c43:b0:acb:b381:c28b with SMTP id a640c23a62f3a-acbb381cc4dmr568952866b.47.1745388205316;
        Tue, 22 Apr 2025 23:03:25 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:25 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
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
Subject: [PATCH v11 18/18] arm64: dts: imx8mp: add PLLs to clock controller module (CCM)
Date: Wed, 23 Apr 2025 08:02:35 +0200
Message-ID: <20250423060241.95521-19-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
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

