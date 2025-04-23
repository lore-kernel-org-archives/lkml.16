Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D57266B6A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745388186; cv=none; b=PO5kufe1p0UDzWRQBsrM1FL7N+JsRJcf/5StZT8Uq5MN2r6qPLW7IfoYnz/btA5un7ieiACVWQo1ZYx6ccNFOyMTU+Q03Q0TTkdjI6uYQq3cqCX3vgAQbg0RISE6e4Drb+VZf+4yGPS55wGkFDDlHCJlas2hxP8GDEM8ky+R10I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745388186; c=relaxed/simple;
	bh=1Doo1dsby+5Gyrz8126ndskiDjJwTGbGBalfBmCsFkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CEFMno0p7dirVFdoTjsvYb+iwaQZK5iuuMU79XMIr/38f9EcFwW6Hml0ZuQ2H2zhecV0FLyF7/J22rBhdZgrcJ3p1aWFjMZwl8dnB66L4L1/MYQk+ijiBeq5isXNkfDD0xHbx/GtU5+JNOrE0tq8p1b5M8Y9CvDheoRcKqq18v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=fl/JV2B/; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="fl/JV2B/"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so973771866b.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 23:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388182; x=1745992982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFKN3RQTlY9l20uk30DcVbm//EznOxmDgzxrBQHei2g=;
        b=fl/JV2B/R9GAosxdZGe3S5QkwSd7t47dWs16DPMVsvP411aIGiXNMA5DAajjy2TFYG
         KKFTae1IneBEBT8V93p6RGUa1vFcrWQ7lnF8JBL6lgrQoei/NgXjVOe4TJtX4kufZfq7
         8NDHbE517ZqN05I6GxvBmqgrevr5TyqvbUQqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388182; x=1745992982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFKN3RQTlY9l20uk30DcVbm//EznOxmDgzxrBQHei2g=;
        b=dHumcNUFSjeb6CQ86c5zmtvadJRqAa586Y9mxBQ4aXT5lTU6eOqaqMrnmion9etjpj
         3vuY1omddVmUl71gJB4P7rOiEhiOqgOiB3r044G4JDQqUzuiiNo5taUtW1Pco7JIRsHn
         OuwDWywDu/xRTVd/kIf75lGCSnbrJn/CJYfmFB8n5OZxMONButUfiL50voLIFexi/R5c
         54oHs9BDT8lTY3MUmv+6Cl1LD9kaHIla7+j2QkZaI4k2d+L4+APnXJLkv3tURjqVTM5Y
         pJvX4Xtpwh1a5pOQ+AZcdJXYVa/8daFFHHGZRkfUZEJm/PIFASwxd9NIv769jo+do8YF
         OTug==
X-Gm-Message-State: AOJu0Yz6CJE1TPK6pgMhqCL9k12XwdqzRDdcy6mBM89YkBVTTVTVFr/R
	Ll6ZeTDF6H/rBjrMz116lrZqMRm+Vc5Q2J54sKgdvXFL2c7CCyZYRYMv/jFKDT9i60T7fmUE176
	g
X-Gm-Gg: ASbGncspP2JvpnrVofEUo76Hl6QMNl+DFfgS2tQCsZ7uqZPVT1KO7tiY7pwlOkGAofr
	DclRrpGM7SHDIycXjlJ/vmnYASYTSdKNdZVEYO4N7ZS/PNN9sWeC4WfNDTHKl3x26y0sYv6iUvX
	jCg0Ze3qRF1e2lPanAOAkeS3dtP6BHH/FtyeLqMV6VFTgUAIk+TT57Mkw+tkxA3CfzM+1ShgGlo
	vL8LsXmaHFiYqoHu0m+COW0d86VfvZfIyLq0TOPnbDsKcGIva48X3jKLBQzqfvRaiUjyMy7ozjJ
	zcOascHMu0KtHP/lTyL16ol9DJ73UzdceXfZnLRGB2/EVsyl0oyXDHkOIpe5f7ClJKg5mvbkWHv
	UcU+z
X-Google-Smtp-Source: AGHT+IGpvg5PsjEM985g9KMZQPOaYLpYqeJpmzn8FaYEVR6f554hZ/A6ntHs+ycalmgmapBmlv0+tg==
X-Received: by 2002:a17:907:743:b0:ac3:853e:4345 with SMTP id a640c23a62f3a-acb74d65b18mr1464416666b.45.1745388181980;
        Tue, 22 Apr 2025 23:03:01 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:01 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v11 04/18] clk: imx8mp: rename video_pll1 to video_pll
Date: Wed, 23 Apr 2025 08:02:21 +0200
Message-ID: <20250423060241.95521-5-dario.binacchi@amarulasolutions.com>
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

 drivers/clk/imx/clk-imx8mp.c | 118 +++++++++++++++++------------------
 1 file changed, 59 insertions(+), 59 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index fe6dac70f1a1..99cac3d5e5b0 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -24,7 +24,7 @@ static u32 share_count_audio;
 static const char * const pll_ref_sels[] = { "osc_24m", "dummy", "dummy", "dummy", };
 static const char * const audio_pll1_bypass_sels[] = {"audio_pll1", "audio_pll1_ref_sel", };
 static const char * const audio_pll2_bypass_sels[] = {"audio_pll2", "audio_pll2_ref_sel", };
-static const char * const video_pll1_bypass_sels[] = {"video_pll1", "video_pll1_ref_sel", };
+static const char * const video_pll_bypass_sels[] = {"video_pll", "video_pll_ref_sel", };
 static const char * const dram_pll_bypass_sels[] = {"dram_pll", "dram_pll_ref_sel", };
 static const char * const gpu_pll_bypass_sels[] = {"gpu_pll", "gpu_pll_ref_sel", };
 static const char * const vpu_pll_bypass_sels[] = {"vpu_pll", "vpu_pll_ref_sel", };
@@ -41,27 +41,27 @@ static const char * const imx8mp_a53_core_sels[] = {"arm_a53_div", "arm_pll_out"
 
 static const char * const imx8mp_m7_sels[] = {"osc_24m", "sys_pll2_200m", "sys_pll2_250m",
 					      "vpu_pll_out", "sys_pll1_800m", "audio_pll1_out",
-					      "video_pll1_out", "sys_pll3_out", };
+					      "video_pll_out", "sys_pll3_out", };
 
 static const char * const imx8mp_ml_sels[] = {"osc_24m", "gpu_pll_out", "sys_pll1_800m",
 					      "sys_pll3_out", "sys_pll2_1000m", "audio_pll1_out",
-					      "video_pll1_out", "audio_pll2_out", };
+					      "video_pll_out", "audio_pll2_out", };
 
 static const char * const imx8mp_gpu3d_core_sels[] = {"osc_24m", "gpu_pll_out", "sys_pll1_800m",
 						      "sys_pll3_out", "sys_pll2_1000m", "audio_pll1_out",
-						      "video_pll1_out", "audio_pll2_out", };
+						      "video_pll_out", "audio_pll2_out", };
 
 static const char * const imx8mp_gpu3d_shader_sels[] = {"osc_24m", "gpu_pll_out", "sys_pll1_800m",
 							"sys_pll3_out", "sys_pll2_1000m", "audio_pll1_out",
-							"video_pll1_out", "audio_pll2_out", };
+							"video_pll_out", "audio_pll2_out", };
 
 static const char * const imx8mp_gpu2d_sels[] = {"osc_24m", "gpu_pll_out", "sys_pll1_800m",
 						 "sys_pll3_out", "sys_pll2_1000m", "audio_pll1_out",
-						 "video_pll1_out", "audio_pll2_out", };
+						 "video_pll_out", "audio_pll2_out", };
 
 static const char * const imx8mp_audio_axi_sels[] = {"osc_24m", "gpu_pll_out", "sys_pll1_800m",
 						     "sys_pll3_out", "sys_pll2_1000m", "audio_pll1_out",
-						     "video_pll1_out", "audio_pll2_out", };
+						     "video_pll_out", "audio_pll2_out", };
 
 static const char * const imx8mp_hsio_axi_sels[] = {"osc_24m", "sys_pll2_500m", "sys_pll1_800m",
 						    "sys_pll2_100m", "sys_pll2_200m", "clk_ext2",
@@ -73,11 +73,11 @@ static const char * const imx8mp_media_isp_sels[] = {"osc_24m", "sys_pll2_1000m"
 
 static const char * const imx8mp_main_axi_sels[] = {"osc_24m", "sys_pll2_333m", "sys_pll1_800m",
 						    "sys_pll2_250m", "sys_pll2_1000m", "audio_pll1_out",
-						    "video_pll1_out", "sys_pll1_100m",};
+						    "video_pll_out", "sys_pll1_100m",};
 
 static const char * const imx8mp_enet_axi_sels[] = {"osc_24m", "sys_pll1_266m", "sys_pll1_800m",
 						    "sys_pll2_250m", "sys_pll2_200m", "audio_pll1_out",
-						    "video_pll1_out", "sys_pll3_out", };
+						    "video_pll_out", "sys_pll3_out", };
 
 static const char * const imx8mp_nand_usdhc_sels[] = {"osc_24m", "sys_pll1_266m", "sys_pll1_800m",
 						      "sys_pll2_200m", "sys_pll1_133m", "sys_pll3_out",
@@ -97,35 +97,35 @@ static const char * const imx8mp_media_apb_sels[] = {"osc_24m", "sys_pll2_125m",
 
 static const char * const imx8mp_gpu_axi_sels[] = {"osc_24m", "sys_pll1_800m", "gpu_pll_out",
 						   "sys_pll3_out", "sys_pll2_1000m", "audio_pll1_out",
-						   "video_pll1_out", "audio_pll2_out", };
+						   "video_pll_out", "audio_pll2_out", };
 
 static const char * const imx8mp_gpu_ahb_sels[] = {"osc_24m", "sys_pll1_800m", "gpu_pll_out",
 						   "sys_pll3_out", "sys_pll2_1000m", "audio_pll1_out",
-						   "video_pll1_out", "audio_pll2_out", };
+						   "video_pll_out", "audio_pll2_out", };
 
 static const char * const imx8mp_noc_sels[] = {"osc_24m", "sys_pll1_800m", "sys_pll3_out",
 					       "sys_pll2_1000m", "sys_pll2_500m", "audio_pll1_out",
-					       "video_pll1_out", "audio_pll2_out", };
+					       "video_pll_out", "audio_pll2_out", };
 
 static const char * const imx8mp_noc_io_sels[] = {"osc_24m", "sys_pll1_800m", "sys_pll3_out",
 						  "sys_pll2_1000m", "sys_pll2_500m", "audio_pll1_out",
-						  "video_pll1_out", "audio_pll2_out", };
+						  "video_pll_out", "audio_pll2_out", };
 
 static const char * const imx8mp_ml_axi_sels[] = {"osc_24m", "sys_pll1_800m", "gpu_pll_out",
 						  "sys_pll3_out", "sys_pll2_1000m", "audio_pll1_out",
-						  "video_pll1_out", "audio_pll2_out", };
+						  "video_pll_out", "audio_pll2_out", };
 
 static const char * const imx8mp_ml_ahb_sels[] = {"osc_24m", "sys_pll1_800m", "gpu_pll_out",
 						  "sys_pll3_out", "sys_pll2_1000m", "audio_pll1_out",
-						  "video_pll1_out", "audio_pll2_out", };
+						  "video_pll_out", "audio_pll2_out", };
 
 static const char * const imx8mp_ahb_sels[] = {"osc_24m", "sys_pll1_133m", "sys_pll1_800m",
 					       "sys_pll1_400m", "sys_pll2_125m", "sys_pll3_out",
-					       "audio_pll1_out", "video_pll1_out", };
+					       "audio_pll1_out", "video_pll_out", };
 
 static const char * const imx8mp_audio_ahb_sels[] = {"osc_24m", "sys_pll2_500m", "sys_pll1_800m",
 						     "sys_pll2_1000m", "sys_pll2_166m", "sys_pll3_out",
-						     "audio_pll1_out", "video_pll1_out", };
+						     "audio_pll1_out", "video_pll_out", };
 
 static const char * const imx8mp_mipi_dsi_esc_rx_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_80m",
 							   "sys_pll1_800m", "sys_pll2_1000m",
@@ -160,56 +160,56 @@ static const char * const imx8mp_pcie_aux_sels[] = {"osc_24m", "sys_pll2_200m",
 						    "sys_pll1_160m", "sys_pll1_200m", };
 
 static const char * const imx8mp_i2c5_sels[] = {"osc_24m", "sys_pll1_160m", "sys_pll2_50m",
-						"sys_pll3_out", "audio_pll1_out", "video_pll1_out",
+						"sys_pll3_out", "audio_pll1_out", "video_pll_out",
 						"audio_pll2_out", "sys_pll1_133m", };
 
 static const char * const imx8mp_i2c6_sels[] = {"osc_24m", "sys_pll1_160m", "sys_pll2_50m",
-						"sys_pll3_out", "audio_pll1_out", "video_pll1_out",
+						"sys_pll3_out", "audio_pll1_out", "video_pll_out",
 						"audio_pll2_out", "sys_pll1_133m", };
 
 static const char * const imx8mp_sai1_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out",
-						"video_pll1_out", "sys_pll1_133m", "osc_hdmi",
+						"video_pll_out", "sys_pll1_133m", "osc_hdmi",
 						"clk_ext1", "clk_ext2", };
 
 static const char * const imx8mp_sai2_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out",
-						"video_pll1_out", "sys_pll1_133m", "osc_hdmi",
+						"video_pll_out", "sys_pll1_133m", "osc_hdmi",
 						"clk_ext2", "clk_ext3", };
 
 static const char * const imx8mp_sai3_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out",
-						"video_pll1_out", "sys_pll1_133m", "osc_hdmi",
+						"video_pll_out", "sys_pll1_133m", "osc_hdmi",
 						"clk_ext3", "clk_ext4", };
 
 static const char * const imx8mp_sai5_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out",
-						"video_pll1_out", "sys_pll1_133m", "osc_hdmi",
+						"video_pll_out", "sys_pll1_133m", "osc_hdmi",
 						"clk_ext2", "clk_ext3", };
 
 static const char * const imx8mp_sai6_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out",
-						"video_pll1_out", "sys_pll1_133m", "osc_hdmi",
+						"video_pll_out", "sys_pll1_133m", "osc_hdmi",
 						"clk_ext3", "clk_ext4", };
 
 static const char * const imx8mp_enet_qos_sels[] = {"osc_24m", "sys_pll2_125m", "sys_pll2_50m",
 						    "sys_pll2_100m", "sys_pll1_160m", "audio_pll1_out",
-						    "video_pll1_out", "clk_ext4", };
+						    "video_pll_out", "clk_ext4", };
 
 static const char * const imx8mp_enet_qos_timer_sels[] = {"osc_24m", "sys_pll2_100m", "audio_pll1_out",
 							  "clk_ext1", "clk_ext2", "clk_ext3",
-							  "clk_ext4", "video_pll1_out", };
+							  "clk_ext4", "video_pll_out", };
 
 static const char * const imx8mp_enet_ref_sels[] = {"osc_24m", "sys_pll2_125m", "sys_pll2_50m",
 						    "sys_pll2_100m", "sys_pll1_160m", "audio_pll1_out",
-						    "video_pll1_out", "clk_ext4", };
+						    "video_pll_out", "clk_ext4", };
 
 static const char * const imx8mp_enet_timer_sels[] = {"osc_24m", "sys_pll2_100m", "audio_pll1_out",
 						      "clk_ext1", "clk_ext2", "clk_ext3",
-						      "clk_ext4", "video_pll1_out", };
+						      "clk_ext4", "video_pll_out", };
 
 static const char * const imx8mp_enet_phy_ref_sels[] = {"osc_24m", "sys_pll2_50m", "sys_pll2_125m",
 							"sys_pll2_200m", "sys_pll2_500m", "audio_pll1_out",
-							"video_pll1_out", "audio_pll2_out", };
+							"video_pll_out", "audio_pll2_out", };
 
 static const char * const imx8mp_nand_sels[] = {"osc_24m", "sys_pll2_500m", "audio_pll1_out",
 						"sys_pll1_400m", "audio_pll2_out", "sys_pll3_out",
-						"sys_pll2_250m", "video_pll1_out", };
+						"sys_pll2_250m", "video_pll_out", };
 
 static const char * const imx8mp_qspi_sels[] = {"osc_24m", "sys_pll1_400m", "sys_pll2_333m",
 						"sys_pll2_500m", "audio_pll2_out", "sys_pll1_266m",
@@ -224,19 +224,19 @@ static const char * const imx8mp_usdhc2_sels[] = {"osc_24m", "sys_pll1_400m", "s
 						  "audio_pll2_out", "sys_pll1_100m", };
 
 static const char * const imx8mp_i2c1_sels[] = {"osc_24m", "sys_pll1_160m", "sys_pll2_50m",
-						"sys_pll3_out", "audio_pll1_out", "video_pll1_out",
+						"sys_pll3_out", "audio_pll1_out", "video_pll_out",
 						"audio_pll2_out", "sys_pll1_133m", };
 
 static const char * const imx8mp_i2c2_sels[] = {"osc_24m", "sys_pll1_160m", "sys_pll2_50m",
-						"sys_pll3_out", "audio_pll1_out", "video_pll1_out",
+						"sys_pll3_out", "audio_pll1_out", "video_pll_out",
 						"audio_pll2_out", "sys_pll1_133m", };
 
 static const char * const imx8mp_i2c3_sels[] = {"osc_24m", "sys_pll1_160m", "sys_pll2_50m",
-						"sys_pll3_out", "audio_pll1_out", "video_pll1_out",
+						"sys_pll3_out", "audio_pll1_out", "video_pll_out",
 						"audio_pll2_out", "sys_pll1_133m", };
 
 static const char * const imx8mp_i2c4_sels[] = {"osc_24m", "sys_pll1_160m", "sys_pll2_50m",
-						"sys_pll3_out", "audio_pll1_out", "video_pll1_out",
+						"sys_pll3_out", "audio_pll1_out", "video_pll_out",
 						"audio_pll2_out", "sys_pll1_133m", };
 
 static const char * const imx8mp_uart1_sels[] = {"osc_24m", "sys_pll1_80m", "sys_pll2_200m",
@@ -277,42 +277,42 @@ static const char * const imx8mp_ecspi2_sels[] = {"osc_24m", "sys_pll2_200m", "s
 
 static const char * const imx8mp_pwm1_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_160m",
 						"sys_pll1_40m", "sys_pll3_out", "clk_ext1",
-						"sys_pll1_80m", "video_pll1_out", };
+						"sys_pll1_80m", "video_pll_out", };
 
 static const char * const imx8mp_pwm2_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_160m",
 						"sys_pll1_40m", "sys_pll3_out", "clk_ext1",
-						"sys_pll1_80m", "video_pll1_out", };
+						"sys_pll1_80m", "video_pll_out", };
 
 static const char * const imx8mp_pwm3_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_160m",
 						"sys_pll1_40m", "sys_pll3_out", "clk_ext2",
-						"sys_pll1_80m", "video_pll1_out", };
+						"sys_pll1_80m", "video_pll_out", };
 
 static const char * const imx8mp_pwm4_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_160m",
 						"sys_pll1_40m", "sys_pll3_out", "clk_ext2",
-						"sys_pll1_80m", "video_pll1_out", };
+						"sys_pll1_80m", "video_pll_out", };
 
 static const char * const imx8mp_gpt1_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_400m",
-						"sys_pll1_40m", "video_pll1_out", "sys_pll1_80m",
+						"sys_pll1_40m", "video_pll_out", "sys_pll1_80m",
 						"audio_pll1_out", "clk_ext1" };
 
 static const char * const imx8mp_gpt2_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_400m",
-						"sys_pll1_40m", "video_pll1_out", "sys_pll1_80m",
+						"sys_pll1_40m", "video_pll_out", "sys_pll1_80m",
 						"audio_pll1_out", "clk_ext2" };
 
 static const char * const imx8mp_gpt3_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_400m",
-						"sys_pll1_40m", "video_pll1_out", "sys_pll1_80m",
+						"sys_pll1_40m", "video_pll_out", "sys_pll1_80m",
 						"audio_pll1_out", "clk_ext3" };
 
 static const char * const imx8mp_gpt4_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_400m",
-						"sys_pll1_40m", "video_pll1_out", "sys_pll1_80m",
+						"sys_pll1_40m", "video_pll_out", "sys_pll1_80m",
 						"audio_pll1_out", "clk_ext1" };
 
 static const char * const imx8mp_gpt5_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_400m",
-						"sys_pll1_40m", "video_pll1_out", "sys_pll1_80m",
+						"sys_pll1_40m", "video_pll_out", "sys_pll1_80m",
 						"audio_pll1_out", "clk_ext2" };
 
 static const char * const imx8mp_gpt6_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_400m",
-						"sys_pll1_40m", "video_pll1_out", "sys_pll1_80m",
+						"sys_pll1_40m", "video_pll_out", "sys_pll1_80m",
 						"audio_pll1_out", "clk_ext3" };
 
 static const char * const imx8mp_wdog_sels[] = {"osc_24m", "sys_pll1_133m", "sys_pll1_160m",
@@ -329,19 +329,19 @@ static const char * const imx8mp_ipp_do_clko1_sels[] = {"osc_24m", "sys_pll1_800
 
 static const char * const imx8mp_ipp_do_clko2_sels[] = {"osc_24m", "sys_pll2_200m", "sys_pll1_400m",
 							"sys_pll1_166m", "sys_pll3_out", "audio_pll1_out",
-							"video_pll1_out", "osc_32k" };
+							"video_pll_out", "osc_32k" };
 
 static const char * const imx8mp_hdmi_fdcc_tst_sels[] = {"osc_24m", "sys_pll1_266m", "sys_pll2_250m",
 							 "sys_pll1_800m", "sys_pll2_1000m", "sys_pll3_out",
-							 "audio_pll2_out", "video_pll1_out", };
+							 "audio_pll2_out", "video_pll_out", };
 
 static const char * const imx8mp_hdmi_24m_sels[] = {"osc_24m", "sys_pll1_160m", "sys_pll2_50m",
-						    "sys_pll3_out", "audio_pll1_out", "video_pll1_out",
+						    "sys_pll3_out", "audio_pll1_out", "video_pll_out",
 						    "audio_pll2_out", "sys_pll1_133m", };
 
 static const char * const imx8mp_hdmi_ref_266m_sels[] = {"osc_24m", "sys_pll1_400m", "sys_pll3_out",
 							 "sys_pll2_333m", "sys_pll1_266m", "sys_pll2_200m",
-							 "audio_pll1_out", "video_pll1_out", };
+							 "audio_pll1_out", "video_pll_out", };
 
 static const char * const imx8mp_usdhc3_sels[] = {"osc_24m", "sys_pll1_400m", "sys_pll1_800m",
 						  "sys_pll2_500m", "sys_pll3_out", "sys_pll1_266m",
@@ -350,26 +350,26 @@ static const char * const imx8mp_usdhc3_sels[] = {"osc_24m", "sys_pll1_400m", "s
 static const char * const imx8mp_media_cam1_pix_sels[] = {"osc_24m", "sys_pll1_266m", "sys_pll2_250m",
 							  "sys_pll1_800m", "sys_pll2_1000m",
 							  "sys_pll3_out", "audio_pll2_out",
-							  "video_pll1_out", };
+							  "video_pll_out", };
 
 static const char * const imx8mp_media_mipi_phy1_ref_sels[] = {"osc_24m", "sys_pll2_333m", "sys_pll2_100m",
 							       "sys_pll1_800m", "sys_pll2_1000m",
 							       "clk_ext2", "audio_pll2_out",
-							       "video_pll1_out", };
+							       "video_pll_out", };
 
-static const char * const imx8mp_media_disp_pix_sels[] = {"osc_24m", "video_pll1_out", "audio_pll2_out",
+static const char * const imx8mp_media_disp_pix_sels[] = {"osc_24m", "video_pll_out", "audio_pll2_out",
 							   "audio_pll1_out", "sys_pll1_800m",
 							   "sys_pll2_1000m", "sys_pll3_out", "clk_ext4", };
 
 static const char * const imx8mp_media_cam2_pix_sels[] = {"osc_24m", "sys_pll1_266m", "sys_pll2_250m",
 							  "sys_pll1_800m", "sys_pll2_1000m",
 							  "sys_pll3_out", "audio_pll2_out",
-							  "video_pll1_out", };
+							  "video_pll_out", };
 
 static const char * const imx8mp_media_ldb_sels[] = {"osc_24m", "sys_pll2_333m", "sys_pll2_100m",
 						     "sys_pll1_800m", "sys_pll2_1000m",
 						     "clk_ext2", "audio_pll2_out",
-						     "video_pll1_out", };
+						     "video_pll_out", };
 
 static const char * const imx8mp_memrepair_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_80m",
 							"sys_pll1_800m", "sys_pll2_1000m", "sys_pll3_out",
@@ -393,12 +393,12 @@ static const char * const imx8mp_vpu_vc8000e_sels[] = {"osc_24m", "vpu_pll_out",
 						       "sys_pll3_out", "audio_pll1_out", };
 
 static const char * const imx8mp_sai7_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out",
-						"video_pll1_out", "sys_pll1_133m", "osc_hdmi",
+						"video_pll_out", "sys_pll1_133m", "osc_hdmi",
 						"clk_ext3", "clk_ext4", };
 
 static const char * const imx8mp_dram_core_sels[] = {"dram_pll_out", "dram_alt_root", };
 
-static const char * const imx8mp_clkout_sels[] = {"audio_pll1_out", "audio_pll2_out", "video_pll1_out",
+static const char * const imx8mp_clkout_sels[] = {"audio_pll1_out", "audio_pll2_out", "video_pll_out",
 						  "dummy", "dummy", "gpu_pll_out", "vpu_pll_out",
 						  "arm_pll_out", "sys_pll1_out", "sys_pll2_out",
 						  "sys_pll3_out", "dummy", "dummy", "osc_24m",
@@ -582,7 +582,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 
 	hws[IMX8MP_AUDIO_PLL1_REF_SEL] = imx_clk_hw_mux("audio_pll1_ref_sel", anatop_base + 0x0, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 	hws[IMX8MP_AUDIO_PLL2_REF_SEL] = imx_clk_hw_mux("audio_pll2_ref_sel", anatop_base + 0x14, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MP_VIDEO_PLL1_REF_SEL] = imx_clk_hw_mux("video_pll1_ref_sel", anatop_base + 0x28, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MP_VIDEO_PLL_REF_SEL] = imx_clk_hw_mux("video_pll_ref_sel", anatop_base + 0x28, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 	hws[IMX8MP_DRAM_PLL_REF_SEL] = imx_clk_hw_mux("dram_pll_ref_sel", anatop_base + 0x50, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 	hws[IMX8MP_GPU_PLL_REF_SEL] = imx_clk_hw_mux("gpu_pll_ref_sel", anatop_base + 0x64, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 	hws[IMX8MP_VPU_PLL_REF_SEL] = imx_clk_hw_mux("vpu_pll_ref_sel", anatop_base + 0x74, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
@@ -593,7 +593,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 
 	hws[IMX8MP_AUDIO_PLL1] = imx_clk_hw_pll14xx("audio_pll1", "audio_pll1_ref_sel", anatop_base, &imx_1443x_pll);
 	hws[IMX8MP_AUDIO_PLL2] = imx_clk_hw_pll14xx("audio_pll2", "audio_pll2_ref_sel", anatop_base + 0x14, &imx_1443x_pll);
-	hws[IMX8MP_VIDEO_PLL1] = imx_clk_hw_pll14xx("video_pll1", "video_pll1_ref_sel", anatop_base + 0x28, &imx_1443x_pll);
+	hws[IMX8MP_VIDEO_PLL] = imx_clk_hw_pll14xx("video_pll", "video_pll_ref_sel", anatop_base + 0x28, &imx_1443x_pll);
 	hws[IMX8MP_DRAM_PLL] = imx_clk_hw_pll14xx("dram_pll", "dram_pll_ref_sel", anatop_base + 0x50, &imx_1443x_dram_pll);
 	hws[IMX8MP_GPU_PLL] = imx_clk_hw_pll14xx("gpu_pll", "gpu_pll_ref_sel", anatop_base + 0x64, &imx_1416x_pll);
 	hws[IMX8MP_VPU_PLL] = imx_clk_hw_pll14xx("vpu_pll", "vpu_pll_ref_sel", anatop_base + 0x74, &imx_1416x_pll);
@@ -604,7 +604,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 
 	hws[IMX8MP_AUDIO_PLL1_BYPASS] = imx_clk_hw_mux_flags("audio_pll1_bypass", anatop_base, 16, 1, audio_pll1_bypass_sels, ARRAY_SIZE(audio_pll1_bypass_sels), CLK_SET_RATE_PARENT);
 	hws[IMX8MP_AUDIO_PLL2_BYPASS] = imx_clk_hw_mux_flags("audio_pll2_bypass", anatop_base + 0x14, 16, 1, audio_pll2_bypass_sels, ARRAY_SIZE(audio_pll2_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MP_VIDEO_PLL1_BYPASS] = imx_clk_hw_mux_flags("video_pll1_bypass", anatop_base + 0x28, 16, 1, video_pll1_bypass_sels, ARRAY_SIZE(video_pll1_bypass_sels), CLK_SET_RATE_PARENT);
+	hws[IMX8MP_VIDEO_PLL_BYPASS] = imx_clk_hw_mux_flags("video_pll_bypass", anatop_base + 0x28, 16, 1, video_pll_bypass_sels, ARRAY_SIZE(video_pll_bypass_sels), CLK_SET_RATE_PARENT);
 	hws[IMX8MP_DRAM_PLL_BYPASS] = imx_clk_hw_mux_flags("dram_pll_bypass", anatop_base + 0x50, 16, 1, dram_pll_bypass_sels, ARRAY_SIZE(dram_pll_bypass_sels), CLK_SET_RATE_PARENT);
 	hws[IMX8MP_GPU_PLL_BYPASS] = imx_clk_hw_mux_flags("gpu_pll_bypass", anatop_base + 0x64, 28, 1, gpu_pll_bypass_sels, ARRAY_SIZE(gpu_pll_bypass_sels), CLK_SET_RATE_PARENT);
 	hws[IMX8MP_VPU_PLL_BYPASS] = imx_clk_hw_mux_flags("vpu_pll_bypass", anatop_base + 0x74, 28, 1, vpu_pll_bypass_sels, ARRAY_SIZE(vpu_pll_bypass_sels), CLK_SET_RATE_PARENT);
@@ -615,7 +615,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 
 	hws[IMX8MP_AUDIO_PLL1_OUT] = imx_clk_hw_gate("audio_pll1_out", "audio_pll1_bypass", anatop_base, 13);
 	hws[IMX8MP_AUDIO_PLL2_OUT] = imx_clk_hw_gate("audio_pll2_out", "audio_pll2_bypass", anatop_base + 0x14, 13);
-	hws[IMX8MP_VIDEO_PLL1_OUT] = imx_clk_hw_gate("video_pll1_out", "video_pll1_bypass", anatop_base + 0x28, 13);
+	hws[IMX8MP_VIDEO_PLL_OUT] = imx_clk_hw_gate("video_pll_out", "video_pll_bypass", anatop_base + 0x28, 13);
 	hws[IMX8MP_DRAM_PLL_OUT] = imx_clk_hw_gate("dram_pll_out", "dram_pll_bypass", anatop_base + 0x50, 13);
 	hws[IMX8MP_GPU_PLL_OUT] = imx_clk_hw_gate("gpu_pll_out", "gpu_pll_bypass", anatop_base + 0x64, 11);
 	hws[IMX8MP_VPU_PLL_OUT] = imx_clk_hw_gate("vpu_pll_out", "vpu_pll_bypass", anatop_base + 0x74, 11);
-- 
2.43.0

