Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61D91E7C11
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475727; cv=none; b=D+4lXuAB4M1T1Fx6tP3B+WzI/S2VxRWluojt6LcdvmCC7j8MfSSMO6yt/gU009a2j/lORPatA34ZHYbKDjnOg1DGTxrAZmXevK/OAS73MZCwXYHiAVFNKRbSCGdOE2oKzQSF94/iGskRgjb9ubbpGhloNG7Z8qkGTng4qYjN5lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475727; c=relaxed/simple;
	bh=awl6YwE5UVjc3KUbwMt94afSEc7QEcOUZKoHgRnGp2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MfJyrwctq9ictEyee6O7VE63TeahK9mc5EWONLqeEBTQ4ZgxsZo0Y0eq6W94YLmUxmNR0ABCdgVGiVEqrudbz3CoKLedYzFu7vJb54vJO95GfV0FzbL8NQbaFg6f6XatqMrR59Dh1Ii9r8PY6h1+hGIUg0Yu3ff4fcaQsKUkQX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=mOBntPKb; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="mOBntPKb"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so3797375e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475723; x=1746080523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXAgzqp6YN1DpD4nDAOaVXpHZiShYKGqmKOr0HW9Cag=;
        b=mOBntPKbGLZPg21pmkzH4rajgZeGoGQlRTq32UcuUd0cwJCvPOZPNOwg38DApf/FSd
         pWpPFMvIwLsBeYJSMdhn5PBQkMB9JcAgTvbC7kBOiY8gz6aEZo8GJxpCfrj7qOwJbSUw
         DvtWKe56q6y6FBgO7w7pHbfa9px7vZai4VPWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475723; x=1746080523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kXAgzqp6YN1DpD4nDAOaVXpHZiShYKGqmKOr0HW9Cag=;
        b=UL6SZrtYvZu3dIbdakKq2xRFDO5puISVXH+qSN2Kt0DEVB6UoDcqQrjseSqMcoHlpV
         rgBGTKvvOuExdrRa/7aThSjuOmX9cdz4m7jP7P733ViSxFnpNZqZbzc+IJr4FIFF1i3x
         ujtyaHQcl1wKXs1Vr4gjVO5hzpSqL2cqhtxGS5ypEEEyNwUJoRjPxdjNI8iSwtCHm4yh
         jQ23Os9/8n2ci6j7Z6BD4PLepOzmFTshWztT1SjgF1CVLqvSjR4cVJHVjzrl+eD6ArPO
         z/Vfc3JM1r9lKuLcA6xVjQofKUMVO7uVOp7G7BzxPB1QcfwPGjoxhduzAVpQOP7L3f1r
         srjg==
X-Gm-Message-State: AOJu0YwDv6Ucvgqhcjg5vWcn3tzkUEBE0uD346iInmzWHovUm/pmPe4W
	9tWmqT3tn7jPlCuNtZFMuyPMwwMbC7TUlu6c39BqM7mBzEwX/9ZxXLyTJGiADNL8VjCUYbAUQMV
	q
X-Gm-Gg: ASbGncsg1CSRSj9PyWW2mreUFwibk7pRtltedG6g5bdyAyWunJk67MoUqwIF/MjzRtF
	aQKROBuV1TOM4j/br1BvkE5TWDpJc7WyCkATNk5ut2snzx4iJtkxBBZ3G8BQdixRPFq/sOj/L0i
	dM44e4CJs8XgFUHlYkXkHVskotJrl1feb83D0B70XrxyivKn47rcMSkZJjkbyy2r3y6Y+pWM86M
	ps+sqWyfxiKNBaIsvrml9K2RwYqrWUhP1o3IHrHuLfbbbjm9ARYRdD8w49u/zdHhgoqAJG2ZCIB
	TJ/YxxPmaHYTuyAZwUDTdp0e9hEi0dtQYNzUaw6ue49g6BgciMjZt2lakxKFxXHI560H0WxuwAB
	GfEjy
X-Google-Smtp-Source: AGHT+IHiuwu++MpB0rh8geSuRUg2ApJvNYV9ZCOhJ0sCaeNWtbzqjSeGkvL+slg0LCFSZ+G3bDRPHg==
X-Received: by 2002:a05:600c:1ca8:b0:43c:fffc:786c with SMTP id 5b1f17b1804b1-4409bd2d745mr9600355e9.19.1745475723135;
        Wed, 23 Apr 2025 23:22:03 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:02 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v12 02/19] clk: imx8mm: rename video_pll1 to video_pll
Date: Thu, 24 Apr 2025 08:21:32 +0200
Message-ID: <20250424062154.2999219-3-dario.binacchi@amarulasolutions.com>
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

Unlike audio_pll1 and audio_pll2, there is no video_pll2. Further, the
name used in the RM is video_pll. So, let's rename "video_pll1" to
"video_pll" to be consistent with the RM and avoid misunderstandings.

No functional changes intended.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>

---
The patch, which simply replaces video_pll1 with video_pll, highlights
many warnings raised by checkpatch.pl. These are not generated by the
changes made but are inherited from how the module was originally
written. Fixing them would have meant "obscuring" the actual changes
introduced.

(no changes since v7)

Changes in v7:
- Add 'Reviewed-by' tag of Peng Fan

Changes in v5:
- Split the patch dropping the dt-bindings changes.

Changes in v4:
- New

 drivers/clk/imx/clk-imx8mm.c | 102 +++++++++++++++++------------------
 1 file changed, 51 insertions(+), 51 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index 342049b847b9..8a1fc7e17ba2 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -28,7 +28,7 @@ static u32 share_count_nand;
 static const char *pll_ref_sels[] = { "osc_24m", "dummy", "dummy", "dummy", };
 static const char *audio_pll1_bypass_sels[] = {"audio_pll1", "audio_pll1_ref_sel", };
 static const char *audio_pll2_bypass_sels[] = {"audio_pll2", "audio_pll2_ref_sel", };
-static const char *video_pll1_bypass_sels[] = {"video_pll1", "video_pll1_ref_sel", };
+static const char *video_pll_bypass_sels[] = {"video_pll", "video_pll_ref_sel", };
 static const char *dram_pll_bypass_sels[] = {"dram_pll", "dram_pll_ref_sel", };
 static const char *gpu_pll_bypass_sels[] = {"gpu_pll", "gpu_pll_ref_sel", };
 static const char *vpu_pll_bypass_sels[] = {"vpu_pll", "vpu_pll_ref_sel", };
@@ -42,22 +42,22 @@ static const char *imx8mm_a53_sels[] = {"osc_24m", "arm_pll_out", "sys_pll2_500m
 static const char * const imx8mm_a53_core_sels[] = {"arm_a53_div", "arm_pll_out", };
 
 static const char *imx8mm_m4_sels[] = {"osc_24m", "sys_pll2_200m", "sys_pll2_250m", "sys_pll1_266m",
-				       "sys_pll1_800m", "audio_pll1_out", "video_pll1_out", "sys_pll3_out", };
+				       "sys_pll1_800m", "audio_pll1_out", "video_pll_out", "sys_pll3_out", };
 
 static const char *imx8mm_vpu_sels[] = {"osc_24m", "arm_pll_out", "sys_pll2_500m", "sys_pll2_1000m",
 					"sys_pll1_800m", "sys_pll1_400m", "audio_pll1_out", "vpu_pll_out", };
 
 static const char *imx8mm_gpu3d_sels[] = {"osc_24m", "gpu_pll_out", "sys_pll1_800m", "sys_pll3_out",
-					  "sys_pll2_1000m", "audio_pll1_out", "video_pll1_out", "audio_pll2_out", };
+					  "sys_pll2_1000m", "audio_pll1_out", "video_pll_out", "audio_pll2_out", };
 
 static const char *imx8mm_gpu2d_sels[] = {"osc_24m", "gpu_pll_out", "sys_pll1_800m", "sys_pll3_out",
-					  "sys_pll2_1000m", "audio_pll1_out", "video_pll1_out", "audio_pll2_out", };
+					  "sys_pll2_1000m", "audio_pll1_out", "video_pll_out", "audio_pll2_out", };
 
 static const char *imx8mm_main_axi_sels[] = {"osc_24m", "sys_pll2_333m", "sys_pll1_800m", "sys_pll2_250m",
-					     "sys_pll2_1000m", "audio_pll1_out", "video_pll1_out", "sys_pll1_100m",};
+					     "sys_pll2_1000m", "audio_pll1_out", "video_pll_out", "sys_pll1_100m",};
 
 static const char *imx8mm_enet_axi_sels[] = {"osc_24m", "sys_pll1_266m", "sys_pll1_800m", "sys_pll2_250m",
-					     "sys_pll2_200m", "audio_pll1_out", "video_pll1_out", "sys_pll3_out", };
+					     "sys_pll2_200m", "audio_pll1_out", "video_pll_out", "sys_pll3_out", };
 
 static const char *imx8mm_nand_usdhc_sels[] = {"osc_24m", "sys_pll1_266m", "sys_pll1_800m", "sys_pll2_200m",
 					       "sys_pll1_133m", "sys_pll3_out", "sys_pll2_250m", "audio_pll1_out", };
@@ -72,28 +72,28 @@ static const char *imx8mm_disp_apb_sels[] = {"osc_24m", "sys_pll2_125m", "sys_pl
 					     "sys_pll1_40m", "audio_pll2_out", "clk_ext1", "clk_ext3", };
 
 static const char *imx8mm_disp_rtrm_sels[] = {"osc_24m", "sys_pll1_800m", "sys_pll2_200m", "sys_pll2_1000m",
-					      "audio_pll1_out", "video_pll1_out", "clk_ext2", "clk_ext3", };
+					      "audio_pll1_out", "video_pll_out", "clk_ext2", "clk_ext3", };
 
 static const char *imx8mm_usb_bus_sels[] = {"osc_24m", "sys_pll2_500m", "sys_pll1_800m", "sys_pll2_100m",
 					    "sys_pll2_200m", "clk_ext2", "clk_ext4", "audio_pll2_out", };
 
 static const char *imx8mm_gpu_axi_sels[] = {"osc_24m", "sys_pll1_800m", "gpu_pll_out", "sys_pll3_out", "sys_pll2_1000m",
-					    "audio_pll1_out", "video_pll1_out", "audio_pll2_out", };
+					    "audio_pll1_out", "video_pll_out", "audio_pll2_out", };
 
 static const char *imx8mm_gpu_ahb_sels[] = {"osc_24m", "sys_pll1_800m", "gpu_pll_out", "sys_pll3_out", "sys_pll2_1000m",
-					    "audio_pll1_out", "video_pll1_out", "audio_pll2_out", };
+					    "audio_pll1_out", "video_pll_out", "audio_pll2_out", };
 
 static const char *imx8mm_noc_sels[] = {"osc_24m", "sys_pll1_800m", "sys_pll3_out", "sys_pll2_1000m", "sys_pll2_500m",
-					"audio_pll1_out", "video_pll1_out", "audio_pll2_out", };
+					"audio_pll1_out", "video_pll_out", "audio_pll2_out", };
 
 static const char *imx8mm_noc_apb_sels[] = {"osc_24m", "sys_pll1_400m", "sys_pll3_out", "sys_pll2_333m", "sys_pll2_200m",
-					    "sys_pll1_800m", "audio_pll1_out", "video_pll1_out", };
+					    "sys_pll1_800m", "audio_pll1_out", "video_pll_out", };
 
 static const char *imx8mm_ahb_sels[] = {"osc_24m", "sys_pll1_133m", "sys_pll1_800m", "sys_pll1_400m",
-					"sys_pll2_125m", "sys_pll3_out", "audio_pll1_out", "video_pll1_out", };
+					"sys_pll2_125m", "sys_pll3_out", "audio_pll1_out", "video_pll_out", };
 
 static const char *imx8mm_audio_ahb_sels[] = {"osc_24m", "sys_pll2_500m", "sys_pll1_800m", "sys_pll2_1000m",
-					      "sys_pll2_166m", "sys_pll3_out", "audio_pll1_out", "video_pll1_out", };
+					      "sys_pll2_166m", "sys_pll3_out", "audio_pll1_out", "video_pll_out", };
 
 static const char *imx8mm_dram_alt_sels[] = {"osc_24m", "sys_pll1_800m", "sys_pll1_100m", "sys_pll2_500m",
 					     "sys_pll2_1000m", "sys_pll3_out", "audio_pll1_out", "sys_pll1_266m", };
@@ -108,10 +108,10 @@ static const char *imx8mm_vpu_g2_sels[] = {"osc_24m", "vpu_pll_out", "sys_pll1_8
 					   "sys_pll1_100m", "sys_pll2_125m", "sys_pll3_out", "audio_pll1_out", };
 
 static const char *imx8mm_disp_dtrc_sels[] = {"osc_24m", "dummy", "sys_pll1_800m", "sys_pll2_1000m",
-					      "sys_pll1_160m", "video_pll1_out", "sys_pll3_out", "audio_pll2_out", };
+					      "sys_pll1_160m", "video_pll_out", "sys_pll3_out", "audio_pll2_out", };
 
 static const char *imx8mm_disp_dc8000_sels[] = {"osc_24m", "dummy", "sys_pll1_800m", "sys_pll2_1000m",
-						"sys_pll1_160m", "video_pll1_out", "sys_pll3_out", "audio_pll2_out", };
+						"sys_pll1_160m", "video_pll_out", "sys_pll3_out", "audio_pll2_out", };
 
 static const char *imx8mm_pcie1_ctrl_sels[] = {"osc_24m", "sys_pll2_250m", "sys_pll2_200m", "sys_pll1_266m",
 					       "sys_pll1_800m", "sys_pll2_500m", "sys_pll2_333m", "sys_pll3_out", };
@@ -122,47 +122,47 @@ static const char *imx8mm_pcie1_phy_sels[] = {"osc_24m", "sys_pll2_100m", "sys_p
 static const char *imx8mm_pcie1_aux_sels[] = {"osc_24m", "sys_pll2_200m", "sys_pll2_50m", "sys_pll3_out",
 					      "sys_pll2_100m", "sys_pll1_80m", "sys_pll1_160m", "sys_pll1_200m", };
 
-static const char *imx8mm_dc_pixel_sels[] = {"osc_24m", "video_pll1_out", "audio_pll2_out", "audio_pll1_out",
+static const char *imx8mm_dc_pixel_sels[] = {"osc_24m", "video_pll_out", "audio_pll2_out", "audio_pll1_out",
 					     "sys_pll1_800m", "sys_pll2_1000m", "sys_pll3_out", "clk_ext4", };
 
-static const char *imx8mm_lcdif_pixel_sels[] = {"osc_24m", "video_pll1_out", "audio_pll2_out", "audio_pll1_out",
+static const char *imx8mm_lcdif_pixel_sels[] = {"osc_24m", "video_pll_out", "audio_pll2_out", "audio_pll1_out",
 						"sys_pll1_800m", "sys_pll2_1000m", "sys_pll3_out", "clk_ext4", };
 
-static const char *imx8mm_sai1_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll1_out",
+static const char *imx8mm_sai1_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll_out",
 					 "sys_pll1_133m", "osc_hdmi", "clk_ext1", "clk_ext2", };
 
-static const char *imx8mm_sai2_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll1_out",
+static const char *imx8mm_sai2_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll_out",
 					 "sys_pll1_133m", "osc_hdmi", "clk_ext2", "clk_ext3", };
 
-static const char *imx8mm_sai3_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll1_out",
+static const char *imx8mm_sai3_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll_out",
 					 "sys_pll1_133m", "osc_hdmi", "clk_ext3", "clk_ext4", };
 
-static const char *imx8mm_sai4_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll1_out",
+static const char *imx8mm_sai4_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll_out",
 					 "sys_pll1_133m", "osc_hdmi", "clk_ext1", "clk_ext2", };
 
-static const char *imx8mm_sai5_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll1_out",
+static const char *imx8mm_sai5_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll_out",
 					 "sys_pll1_133m", "osc_hdmi", "clk_ext2", "clk_ext3", };
 
-static const char *imx8mm_sai6_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll1_out",
+static const char *imx8mm_sai6_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll_out",
 					 "sys_pll1_133m", "osc_hdmi", "clk_ext3", "clk_ext4", };
 
-static const char *imx8mm_spdif1_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll1_out",
+static const char *imx8mm_spdif1_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll_out",
 					   "sys_pll1_133m", "osc_hdmi", "clk_ext2", "clk_ext3", };
 
-static const char *imx8mm_spdif2_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll1_out",
+static const char *imx8mm_spdif2_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll_out",
 					   "sys_pll1_133m", "osc_hdmi", "clk_ext3", "clk_ext4", };
 
 static const char *imx8mm_enet_ref_sels[] = {"osc_24m", "sys_pll2_125m", "sys_pll2_50m", "sys_pll2_100m",
-					     "sys_pll1_160m", "audio_pll1_out", "video_pll1_out", "clk_ext4", };
+					     "sys_pll1_160m", "audio_pll1_out", "video_pll_out", "clk_ext4", };
 
 static const char *imx8mm_enet_timer_sels[] = {"osc_24m", "sys_pll2_100m", "audio_pll1_out", "clk_ext1", "clk_ext2",
-					       "clk_ext3", "clk_ext4", "video_pll1_out", };
+					       "clk_ext3", "clk_ext4", "video_pll_out", };
 
 static const char *imx8mm_enet_phy_sels[] = {"osc_24m", "sys_pll2_50m", "sys_pll2_125m", "sys_pll2_200m",
-					     "sys_pll2_500m", "video_pll1_out", "audio_pll2_out", };
+					     "sys_pll2_500m", "video_pll_out", "audio_pll2_out", };
 
 static const char *imx8mm_nand_sels[] = {"osc_24m", "sys_pll2_500m", "audio_pll1_out", "sys_pll1_400m",
-					 "audio_pll2_out", "sys_pll3_out", "sys_pll2_250m", "video_pll1_out", };
+					 "audio_pll2_out", "sys_pll3_out", "sys_pll2_250m", "video_pll_out", };
 
 static const char *imx8mm_qspi_sels[] = {"osc_24m", "sys_pll1_400m", "sys_pll2_333m", "sys_pll2_500m",
 					 "audio_pll2_out", "sys_pll1_266m", "sys_pll3_out", "sys_pll1_100m", };
@@ -174,16 +174,16 @@ static const char *imx8mm_usdhc2_sels[] = {"osc_24m", "sys_pll1_400m", "sys_pll1
 					   "sys_pll3_out", "sys_pll1_266m", "audio_pll2_out", "sys_pll1_100m", };
 
 static const char *imx8mm_i2c1_sels[] = {"osc_24m", "sys_pll1_160m", "sys_pll2_50m", "sys_pll3_out", "audio_pll1_out",
-					 "video_pll1_out", "audio_pll2_out", "sys_pll1_133m", };
+					 "video_pll_out", "audio_pll2_out", "sys_pll1_133m", };
 
 static const char *imx8mm_i2c2_sels[] = {"osc_24m", "sys_pll1_160m", "sys_pll2_50m", "sys_pll3_out", "audio_pll1_out",
-					 "video_pll1_out", "audio_pll2_out", "sys_pll1_133m", };
+					 "video_pll_out", "audio_pll2_out", "sys_pll1_133m", };
 
 static const char *imx8mm_i2c3_sels[] = {"osc_24m", "sys_pll1_160m", "sys_pll2_50m", "sys_pll3_out", "audio_pll1_out",
-					 "video_pll1_out", "audio_pll2_out", "sys_pll1_133m", };
+					 "video_pll_out", "audio_pll2_out", "sys_pll1_133m", };
 
 static const char *imx8mm_i2c4_sels[] = {"osc_24m", "sys_pll1_160m", "sys_pll2_50m", "sys_pll3_out", "audio_pll1_out",
-					 "video_pll1_out", "audio_pll2_out", "sys_pll1_133m", };
+					 "video_pll_out", "audio_pll2_out", "sys_pll1_133m", };
 
 static const char *imx8mm_uart1_sels[] = {"osc_24m", "sys_pll1_80m", "sys_pll2_200m", "sys_pll2_100m",
 					  "sys_pll3_out", "clk_ext2", "clk_ext4", "audio_pll2_out", };
@@ -213,19 +213,19 @@ static const char *imx8mm_ecspi2_sels[] = {"osc_24m", "sys_pll2_200m", "sys_pll1
 					   "sys_pll1_800m", "sys_pll3_out", "sys_pll2_250m", "audio_pll2_out", };
 
 static const char *imx8mm_pwm1_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_160m", "sys_pll1_40m",
-					 "sys_pll3_out", "clk_ext1", "sys_pll1_80m", "video_pll1_out", };
+					 "sys_pll3_out", "clk_ext1", "sys_pll1_80m", "video_pll_out", };
 
 static const char *imx8mm_pwm2_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_160m", "sys_pll1_40m",
-					 "sys_pll3_out", "clk_ext1", "sys_pll1_80m", "video_pll1_out", };
+					 "sys_pll3_out", "clk_ext1", "sys_pll1_80m", "video_pll_out", };
 
 static const char *imx8mm_pwm3_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_160m", "sys_pll1_40m",
-					 "sys_pll3_out", "clk_ext2", "sys_pll1_80m", "video_pll1_out", };
+					 "sys_pll3_out", "clk_ext2", "sys_pll1_80m", "video_pll_out", };
 
 static const char *imx8mm_pwm4_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_160m", "sys_pll1_40m",
-					 "sys_pll3_out", "clk_ext2", "sys_pll1_80m", "video_pll1_out", };
+					 "sys_pll3_out", "clk_ext2", "sys_pll1_80m", "video_pll_out", };
 
 static const char *imx8mm_gpt1_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_400m", "sys_pll1_40m",
-					 "video_pll1_out", "sys_pll1_80m", "audio_pll1_out", "clk_ext1" };
+					 "video_pll_out", "sys_pll1_80m", "audio_pll1_out", "clk_ext1" };
 
 static const char *imx8mm_wdog_sels[] = {"osc_24m", "sys_pll1_133m", "sys_pll1_160m", "vpu_pll_out",
 					 "sys_pll2_125m", "sys_pll3_out", "sys_pll1_80m", "sys_pll2_166m", };
@@ -234,31 +234,31 @@ static const char *imx8mm_wrclk_sels[] = {"osc_24m", "sys_pll1_40m", "vpu_pll_ou
 					  "sys_pll1_266m", "sys_pll2_500m", "sys_pll1_100m", };
 
 static const char *imx8mm_dsi_core_sels[] = {"osc_24m", "sys_pll1_266m", "sys_pll2_250m", "sys_pll1_800m",
-					     "sys_pll2_1000m", "sys_pll3_out", "audio_pll2_out", "video_pll1_out", };
+					     "sys_pll2_1000m", "sys_pll3_out", "audio_pll2_out", "video_pll_out", };
 
 static const char *imx8mm_dsi_phy_sels[] = {"osc_24m", "sys_pll2_125m", "sys_pll2_100m", "sys_pll1_800m",
-					    "sys_pll2_1000m", "clk_ext2", "audio_pll2_out", "video_pll1_out", };
+					    "sys_pll2_1000m", "clk_ext2", "audio_pll2_out", "video_pll_out", };
 
 static const char *imx8mm_dsi_dbi_sels[] = {"osc_24m", "sys_pll1_266m", "sys_pll2_100m", "sys_pll1_800m",
-					    "sys_pll2_1000m", "sys_pll3_out", "audio_pll2_out", "video_pll1_out", };
+					    "sys_pll2_1000m", "sys_pll3_out", "audio_pll2_out", "video_pll_out", };
 
 static const char *imx8mm_usdhc3_sels[] = {"osc_24m", "sys_pll1_400m", "sys_pll1_800m", "sys_pll2_500m",
 					   "sys_pll3_out", "sys_pll1_266m", "audio_pll2_out", "sys_pll1_100m", };
 
 static const char *imx8mm_csi1_core_sels[] = {"osc_24m", "sys_pll1_266m", "sys_pll2_250m", "sys_pll1_800m",
-					      "sys_pll2_1000m", "sys_pll3_out", "audio_pll2_out", "video_pll1_out", };
+					      "sys_pll2_1000m", "sys_pll3_out", "audio_pll2_out", "video_pll_out", };
 
 static const char *imx8mm_csi1_phy_sels[] = {"osc_24m", "sys_pll2_333m", "sys_pll2_100m", "sys_pll1_800m",
-					     "sys_pll2_1000m", "clk_ext2", "audio_pll2_out", "video_pll1_out", };
+					     "sys_pll2_1000m", "clk_ext2", "audio_pll2_out", "video_pll_out", };
 
 static const char *imx8mm_csi1_esc_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_80m", "sys_pll1_800m",
 					     "sys_pll2_1000m", "sys_pll3_out", "clk_ext3", "audio_pll2_out", };
 
 static const char *imx8mm_csi2_core_sels[] = {"osc_24m", "sys_pll1_266m", "sys_pll2_250m", "sys_pll1_800m",
-					      "sys_pll2_1000m", "sys_pll3_out", "audio_pll2_out", "video_pll1_out", };
+					      "sys_pll2_1000m", "sys_pll3_out", "audio_pll2_out", "video_pll_out", };
 
 static const char *imx8mm_csi2_phy_sels[] = {"osc_24m", "sys_pll2_333m", "sys_pll2_100m", "sys_pll1_800m",
-					     "sys_pll2_1000m", "clk_ext2", "audio_pll2_out", "video_pll1_out", };
+					     "sys_pll2_1000m", "clk_ext2", "audio_pll2_out", "video_pll_out", };
 
 static const char *imx8mm_csi2_esc_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_80m", "sys_pll1_800m",
 					     "sys_pll2_1000m", "sys_pll3_out", "clk_ext3", "audio_pll2_out", };
@@ -286,9 +286,9 @@ static const char *imx8mm_dram_core_sels[] = {"dram_pll_out", "dram_alt_root", }
 static const char *imx8mm_clko1_sels[] = {"osc_24m", "sys_pll1_800m", "dummy", "sys_pll1_200m",
 					  "audio_pll2_out", "sys_pll2_500m", "vpu_pll", "sys_pll1_80m", };
 static const char *imx8mm_clko2_sels[] = {"osc_24m", "sys_pll2_200m", "sys_pll1_400m", "sys_pll2_166m",
-					  "sys_pll3_out", "audio_pll1_out", "video_pll1_out", "osc_32k", };
+					  "sys_pll3_out", "audio_pll1_out", "video_pll_out", "osc_32k", };
 
-static const char * const clkout_sels[] = {"audio_pll1_out", "audio_pll2_out", "video_pll1_out",
+static const char * const clkout_sels[] = {"audio_pll1_out", "audio_pll2_out", "video_pll_out",
 					   "dummy", "dummy", "gpu_pll_out", "vpu_pll_out",
 					   "arm_pll_out", "sys_pll1", "sys_pll2", "sys_pll3",
 					   "dummy", "dummy", "osc_24m", "dummy", "osc_32k"};
@@ -327,7 +327,7 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 
 	hws[IMX8MM_AUDIO_PLL1_REF_SEL] = imx_clk_hw_mux("audio_pll1_ref_sel", base + 0x0, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 	hws[IMX8MM_AUDIO_PLL2_REF_SEL] = imx_clk_hw_mux("audio_pll2_ref_sel", base + 0x14, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MM_VIDEO_PLL1_REF_SEL] = imx_clk_hw_mux("video_pll1_ref_sel", base + 0x28, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MM_VIDEO_PLL_REF_SEL] = imx_clk_hw_mux("video_pll_ref_sel", base + 0x28, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 	hws[IMX8MM_DRAM_PLL_REF_SEL] = imx_clk_hw_mux("dram_pll_ref_sel", base + 0x50, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 	hws[IMX8MM_GPU_PLL_REF_SEL] = imx_clk_hw_mux("gpu_pll_ref_sel", base + 0x64, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 	hws[IMX8MM_VPU_PLL_REF_SEL] = imx_clk_hw_mux("vpu_pll_ref_sel", base + 0x74, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
@@ -336,7 +336,7 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 
 	hws[IMX8MM_AUDIO_PLL1] = imx_clk_hw_pll14xx("audio_pll1", "audio_pll1_ref_sel", base, &imx_1443x_pll);
 	hws[IMX8MM_AUDIO_PLL2] = imx_clk_hw_pll14xx("audio_pll2", "audio_pll2_ref_sel", base + 0x14, &imx_1443x_pll);
-	hws[IMX8MM_VIDEO_PLL1] = imx_clk_hw_pll14xx("video_pll1", "video_pll1_ref_sel", base + 0x28, &imx_1443x_pll);
+	hws[IMX8MM_VIDEO_PLL] = imx_clk_hw_pll14xx("video_pll", "video_pll_ref_sel", base + 0x28, &imx_1443x_pll);
 	hws[IMX8MM_DRAM_PLL] = imx_clk_hw_pll14xx("dram_pll", "dram_pll_ref_sel", base + 0x50, &imx_1443x_dram_pll);
 	hws[IMX8MM_GPU_PLL] = imx_clk_hw_pll14xx("gpu_pll", "gpu_pll_ref_sel", base + 0x64, &imx_1416x_pll);
 	hws[IMX8MM_VPU_PLL] = imx_clk_hw_pll14xx("vpu_pll", "vpu_pll_ref_sel", base + 0x74, &imx_1416x_pll);
@@ -348,7 +348,7 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 	/* PLL bypass out */
 	hws[IMX8MM_AUDIO_PLL1_BYPASS] = imx_clk_hw_mux_flags("audio_pll1_bypass", base, 16, 1, audio_pll1_bypass_sels, ARRAY_SIZE(audio_pll1_bypass_sels), CLK_SET_RATE_PARENT);
 	hws[IMX8MM_AUDIO_PLL2_BYPASS] = imx_clk_hw_mux_flags("audio_pll2_bypass", base + 0x14, 16, 1, audio_pll2_bypass_sels, ARRAY_SIZE(audio_pll2_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MM_VIDEO_PLL1_BYPASS] = imx_clk_hw_mux_flags("video_pll1_bypass", base + 0x28, 16, 1, video_pll1_bypass_sels, ARRAY_SIZE(video_pll1_bypass_sels), CLK_SET_RATE_PARENT);
+	hws[IMX8MM_VIDEO_PLL_BYPASS] = imx_clk_hw_mux_flags("video_pll_bypass", base + 0x28, 16, 1, video_pll_bypass_sels, ARRAY_SIZE(video_pll_bypass_sels), CLK_SET_RATE_PARENT);
 	hws[IMX8MM_DRAM_PLL_BYPASS] = imx_clk_hw_mux_flags("dram_pll_bypass", base + 0x50, 16, 1, dram_pll_bypass_sels, ARRAY_SIZE(dram_pll_bypass_sels), CLK_SET_RATE_PARENT);
 	hws[IMX8MM_GPU_PLL_BYPASS] = imx_clk_hw_mux_flags("gpu_pll_bypass", base + 0x64, 28, 1, gpu_pll_bypass_sels, ARRAY_SIZE(gpu_pll_bypass_sels), CLK_SET_RATE_PARENT);
 	hws[IMX8MM_VPU_PLL_BYPASS] = imx_clk_hw_mux_flags("vpu_pll_bypass", base + 0x74, 28, 1, vpu_pll_bypass_sels, ARRAY_SIZE(vpu_pll_bypass_sels), CLK_SET_RATE_PARENT);
@@ -358,7 +358,7 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 	/* PLL out gate */
 	hws[IMX8MM_AUDIO_PLL1_OUT] = imx_clk_hw_gate("audio_pll1_out", "audio_pll1_bypass", base, 13);
 	hws[IMX8MM_AUDIO_PLL2_OUT] = imx_clk_hw_gate("audio_pll2_out", "audio_pll2_bypass", base + 0x14, 13);
-	hws[IMX8MM_VIDEO_PLL1_OUT] = imx_clk_hw_gate("video_pll1_out", "video_pll1_bypass", base + 0x28, 13);
+	hws[IMX8MM_VIDEO_PLL_OUT] = imx_clk_hw_gate("video_pll_out", "video_pll_bypass", base + 0x28, 13);
 	hws[IMX8MM_DRAM_PLL_OUT] = imx_clk_hw_gate("dram_pll_out", "dram_pll_bypass", base + 0x50, 13);
 	hws[IMX8MM_GPU_PLL_OUT] = imx_clk_hw_gate("gpu_pll_out", "gpu_pll_bypass", base + 0x64, 11);
 	hws[IMX8MM_VPU_PLL_OUT] = imx_clk_hw_gate("vpu_pll_out", "vpu_pll_bypass", base + 0x74, 11);
-- 
2.43.0

