Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5735F207A3A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475756; cv=none; b=ccgTUpJ84WbtdZGnBYVnirc0cc8feI/bz0KzeYNYy5j3cFtK6IijPZbf/LBXGJitFm6FaqqTSGj7edGXlg3jUu6K9hyTVJVancXZPUPEzxlwoV2i8j282a7XhAiTy7Y7xq79VztPK6as6DCP0l3V+Yq2SHFff7yzea1D/Blhs1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475756; c=relaxed/simple;
	bh=7yYZJd86bIYU+vT8RAjY7wEp1oq0Xfmfy1RQITDVRe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d5mQnI/TkPKSSDRwSbAMirwkFoYeI1WC7XiuErAhlNUk2thZ7q60nAPyqlViSTCOfYAR/+lDRcVq/FwDZ2OPMuBzZkq7x+TSkNA0Y3GnhMDuO4VYTA6Jd3g7ASgyd/0Da2Wm2+gQurhyZoXt/w61oHTsYD5SEEodj49N5aYNWkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=qy7NHEoZ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="qy7NHEoZ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d0782d787so3505375e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475752; x=1746080552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8grfYWwIX4hpiA7jlx82Mk2yoAsYJcNHuOuvJvnYwRc=;
        b=qy7NHEoZK8v2NqtBimdBQ6h8eVD+ofk2n6xWKA5CxfSkA38GiWmaAwnHa7O/Rd/I1J
         N9anPEx3rXow21dmR2dUvxiYnq4t8WBs6TsippebzUIvJvt50bsT8FBHUJLMtwuNVuNf
         1DsK/36rF1pJrivjbGO+RJRhi8w9A3z4osJ0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475752; x=1746080552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8grfYWwIX4hpiA7jlx82Mk2yoAsYJcNHuOuvJvnYwRc=;
        b=mtJ/C1+cNxx2R0qNdGzMC50be6NCrzK3e2PemVUzPNnEyuQO82u9jG85bvI8uSDddS
         DhrqKtt/2MbB12bBSeyU05bPJ1D9o75zewy/sbuMW8DGLdE13fwzzbjHhNofR1qZ1mr1
         FK0Z/hGon1XBanBTWduN9kwxsTsfwWysxUaf5kBxRhPJSTKPvwwq18Xl8sp+UNxNYntG
         NVjTr/H34lcY4T1h/h0U8hIAZ1WFPryX1+PMNfH+FLXdFBmkoijsaGwujlyDBGZkntcN
         PyVLoXK60pEQ4ZcqAgelcJ/Sl7wwgl2c4UDoQR2FNZAesSfRcaOCkhPgyFgmaH5/uQ9w
         Ba7A==
X-Gm-Message-State: AOJu0YwYm+yVb/yspYuGm4dWnBPl1u2Ljoezbd2FQzQhGAmopEdt+o9z
	ePXsezZ5e4R6+J4ahZyxeeMgWIO7qOgXTvlIlDKOWhQPfU93ksffUQPK/pQpP5PmmSV64oGm5Wm
	v
X-Gm-Gg: ASbGncvs4yNg65mjdx0itzuF1c4/TZQZ+LbI/37kM96yHM+/ge9G108RlldIOlj2SCp
	F0xyTMVi8qZu0qXmenYX96dOsjRJexM47UGRon/T7OY4uF3mh2GESz5RSZVzc+n8j1WRpixYlA9
	l92ys03LrNDdTH+TvnrPBVBvV+OxPCzQO1AJQMVLmtDqlVJPZ7FCns/oAUvwThqvGJ1KPVaMpMT
	6SOpztu4D7+jh14biDVBtx3MPKAe7BBmkpoL7N0XynaY5ZrZnFOOLGgYTQcuBrwIcsPs5lltnZi
	qp1YnDnZOM57xD9QISNwU38beSoInprkG2zHeSsTol+TbNTUPdPGL1Ad0tXbRHQjA0bJNcqRqEG
	AWPuj
X-Google-Smtp-Source: AGHT+IEM0/VMCcdJocFhRZ/eLD26SRY/PzYxq7+AJZINwcLXa5TSv1nOFj6pBR4AmZJ1H3dAT+70rw==
X-Received: by 2002:a05:600c:4693:b0:43d:b32:40aa with SMTP id 5b1f17b1804b1-4409bcfc1f6mr10567655e9.3.1745475752419;
        Wed, 23 Apr 2025 23:22:32 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:32 -0700 (PDT)
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
Subject: [PATCH v12 18/19] arm64: dts: imx8mn: add PLLs to clock controller module (CCM)
Date: Thu, 24 Apr 2025 08:21:48 +0200
Message-ID: <20250424062154.2999219-19-dario.binacchi@amarulasolutions.com>
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

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index 49be492b5687..01013c1fd61d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -643,9 +643,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MN_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MN_ANATOP_AUDIO_PLL2>,
+					 <&anatop IMX8MN_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MN_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				assigned-clocks = <&clk IMX8MN_CLK_A53_SRC>,
 						<&clk IMX8MN_CLK_A53_CORE>,
 						<&clk IMX8MN_CLK_NOC>,
-- 
2.43.0

