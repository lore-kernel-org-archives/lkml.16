Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B362EE28C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750257220; cv=none; b=MRCEb8CXxQFw0qkbymY7QnZqSEy5McSOfhNgKMyPrxlT96bM6tb2qPwKM+wEWgm4qHVi6oWRX7QyeeaQuJ+2Mierw+a4Pel/7hVEfaETn/F9TB5ME89WuHjB/H7fTd8jdLZp4UWYO5CRwXu9BhKbK8zYM81Qn3rDxWy7lckuQ+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750257220; c=relaxed/simple;
	bh=B37GRMruOX+ZSyC96p19lfWnZVPySg5VUvTqpflIprM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g1/+cOGiHyS2WT3JuZTuuiJqWoap02twtLdXSH9k2mDIAmruKHmaDyeFNKvDWJyzOXvK6XAq4DHv7JmQeurzmWTFTIp19cZvcw7ZVGWXBK9stb3WDiR3nkc0trNLn2/oWxNz8do9ZXHaYgNUYr5zpPyvklk3Fu4LsyGesev1reA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WMZO8D31; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WMZO8D31"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad5767b448aso87531766b.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 07:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750257216; x=1750862016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n82J7xKXmpUjRKj7zBCcVyEW4JwAUsZ8BkHyrQ3/GMg=;
        b=WMZO8D31D9ZHPO0GT2ZAUjL9WP7wKYJ7uORfICXl4fQSEAJ4wBRiZJndnk33XyEYFn
         VlFoMrU8ZSQOVDE+de45OsRD4nR61ieD4Z1zpKFJyWvDIngOdPP27gtt515l+LUF5TDJ
         duXLg213al5oD1udIlYsFM3QZUy1j1pKpttHqaCx+qsXPn5jJgKnMUKl1+EAyfvbn2s6
         kzsBgMbB62OTV+0CphW3AeYf/3Y5fYDxbIloLOZ3hKx+1MpFjNnnAumJVt2b8lIwIPVi
         orYloddY8DdULXejUmNLI/FEH4SM+wBDrc+eyh3uTxy9EHjjzwCpAFt+CRl26eeU1Tpz
         j/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750257216; x=1750862016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n82J7xKXmpUjRKj7zBCcVyEW4JwAUsZ8BkHyrQ3/GMg=;
        b=nxb3znA5HJ8h+TKaz1drQqA3ppfAGcGeJL2iBYLkUT5HkeCMCsHA7FQyyvR5EJXnJB
         XmwKEQm3lwW5WS9M0nfSQQBHHMklK0r6aif1OMERws8MeUoeScSZnkt93pZe5PNH0VcX
         KDKtWRzSdt1j1CfuJCOzoqg2ceEd2r4AOPEl6FhRu0udSpEnQPwqe5q3hTaMY7M0kZkq
         CBDlOIkVvXdonPFiGguSa/7Bzia65uO3TK/heQjh9CHL3TVPOkU23sX3PjST9xpVSZnL
         JT5aRDBulVQ5q1wCKxgcBtCe4vspNT3sHhvtQ3Rkb5xzZ37nqVWIqjyGpQfyMk+Y1bZu
         /gUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUardQn6y4EydoEm9X0bBYFoXJeYMukalV7uOAnJ1/SijEUeB8u/Q6fvjUtilaSr8jWXGQhCX4ZydQaAXA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx0m02+pt5Gc6DcG4OimdJw0NAQ3pfUdN1rMrAtER10mtF1Lh/
	lQsvivfZyFCULjthC7YD0O8dWfRz5Azlt9fGEGpIwrFA5NZrHjLZM6jx978sW2k6sVQ=
X-Gm-Gg: ASbGncvzvFMf4fh2hFjVwGFALeV/mETcyXapz5ph7Pd9GtzgDVLCjD7zbAga7wbKGEq
	DPBKkprD/ci97qPgTofT/ESK/g9/60F75C3Y3OTRWgnnxQ0LvbEwz03m/S2/E9XrynaNThXiJZP
	jGJW/DwT/ruix8V+lx89C5T3CPNy/pqgkWEsAvGU5unR60BU+H3aEw3kxa8MiDEWCALNTyehLwG
	mfwp7LzUXkM//PzoWAjKajvnIjfRwN74hOqjCTtZj42bn2XrGkayjKQl07kBx6apEeZNeM74HHh
	WOSjk187Jx16VimSPYzxbReHT4rMXfSVoTOKfNcAXfcnikiy6km2wYtl3q5vloXEvHNA1HG12uA
	8mBb9YGY=
X-Google-Smtp-Source: AGHT+IFyH36GRnsiJLc/i7NiTvQDPuVB3LJSBqEkgLZlbpChYlfEfQCsSEAvYEZXEceaQcIDNQWHQA==
X-Received: by 2002:a17:907:7f89:b0:ad8:9b93:8579 with SMTP id a640c23a62f3a-adfad01eb84mr568241466b.0.1750257216346;
        Wed, 18 Jun 2025 07:33:36 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81c0135sm1052257566b.47.2025.06.18.07.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 07:33:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 18 Jun 2025 16:32:39 +0200
Subject: [PATCH v7 10/13] drm/msm/dpu: Implement 10-bit color alpha for
 v12.0 DPU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-b4-sm8750-display-v7-10-a591c609743d@linaro.org>
References: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
In-Reply-To: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7947;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=B37GRMruOX+ZSyC96p19lfWnZVPySg5VUvTqpflIprM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoUs4i+dVGR7M/N+gLZcNJgYmbPwkDX/c+Evk7F
 L1YG0gFBj+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaFLOIgAKCRDBN2bmhouD
 11IRD/0R8mcfv5w08dGZck81Xbp3NcSvfkb2ZbkzerJP5savTDGKresTlcRW63SAeYv4Mpy7AP4
 aSD8N19kvVnCkg8StUlY5VPuRonNl9Z01wWpst2Ji9wL8JG6t7P/okuSQre0DjBvKoZgoiNHZyS
 qn42WSzLyssH3GYY1ZdvQ3K4Rzswp46eaNTsFVffTpN8YeuS+Vmteihfdn/yV7320U+C0kNXwed
 98+ZmX0U1kHoBXuTOiuMfY3jq3AoHGJ34KaVVih0LACCtdop6HyDj5ZKaoUDtptr8fXfXemKS3a
 huW1+lx5PHoaqspQqU5IETECH0rcw8SlsemANom8W97eZ3sKUil/MAEJzsuTq3++0Bv0SzdD1D3
 +jJ0naVn6DzpWTzwp0uePwRxQIkSNbstOrLhBPgjfHGB7vGlQg9BwC8qezxeThVeUfVFcVFa5Z0
 keh61GteFTp3F7jwnLGAn07SQNQKcdmph3EFmL44vvccsYwS8OjcFGV+M+2Ifj/5XlUN8coxkmt
 8eyhCYbz+n1Ch/r1ne6dAiZyybruw4KsV+a/yCJEVuv7mARAlINzM+KIiTy0hxPM6feoC9lt7ku
 WveBLw9bclzCHll3bqVYWJcFHFAd7KWl++VPSJmebndSQcTmXaYr383WbTnkxTRFXilzZKNo5Z1
 n/sya/q4IcRGkeA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

v12.0 DPU on SM8750 comes with 10-bit color alpha.  Add register
differences and new implementations of setup_alpha_out(),
setup_border_color() and setup_blend_config().

Notable changes in v6:
Correct fg_alpha shift on new DPU, pointed out by Abel Vesas.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v6:
1. Checkpatch: CHECK: Prefer kernel type 'u32' over 'uint32_t'
2. Fix for fg_alpha shift (Abel Vesa).

Changes in v4:
1. Lowercase hex, use spaces for define indentation
2. _dpu_crtc_setup_blend_cfg(): pass mdss_ver instead of ctl

Changes in v3:
1. New patch, split from previous big DPU v12.0.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 23 ++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 84 +++++++++++++++++++++++++++++--
 2 files changed, 97 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 92f6c39eee3dc090bd957239e58793e5b0437548..5e986640c8ce5b49d0ce2f91cc47f677a2e3f061 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -320,14 +320,22 @@ static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
 }
 
 static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
-		struct dpu_plane_state *pstate, const struct msm_format *format)
+				      struct dpu_plane_state *pstate,
+				      const struct msm_format *format,
+				      const struct dpu_mdss_version *mdss_ver)
 {
 	struct dpu_hw_mixer *lm = mixer->hw_lm;
 	u32 blend_op;
-	u32 fg_alpha, bg_alpha;
+	u32 fg_alpha, bg_alpha, max_alpha;
 
-	fg_alpha = pstate->base.alpha >> 8;
-	bg_alpha = 0xff - fg_alpha;
+	if (mdss_ver->core_major_ver < 12) {
+		max_alpha = 0xff;
+		fg_alpha = pstate->base.alpha >> 8;
+	} else {
+		max_alpha = 0x3ff;
+		fg_alpha = pstate->base.alpha >> 6;
+	}
+	bg_alpha = max_alpha - fg_alpha;
 
 	/* default to opaque blending */
 	if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
@@ -337,7 +345,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 	} else if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI) {
 		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
 			DPU_BLEND_BG_ALPHA_FG_PIXEL;
-		if (fg_alpha != 0xff) {
+		if (fg_alpha != max_alpha) {
 			bg_alpha = fg_alpha;
 			blend_op |= DPU_BLEND_BG_MOD_ALPHA |
 				    DPU_BLEND_BG_INV_MOD_ALPHA;
@@ -348,7 +356,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 		/* coverage blending */
 		blend_op = DPU_BLEND_FG_ALPHA_FG_PIXEL |
 			DPU_BLEND_BG_ALPHA_FG_PIXEL;
-		if (fg_alpha != 0xff) {
+		if (fg_alpha != max_alpha) {
 			bg_alpha = fg_alpha;
 			blend_op |= DPU_BLEND_FG_MOD_ALPHA |
 				    DPU_BLEND_FG_INV_MOD_ALPHA |
@@ -481,7 +489,8 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 
 		/* blend config update */
 		for (lm_idx = 0; lm_idx < cstate->num_mixers; lm_idx++) {
-			_dpu_crtc_setup_blend_cfg(mixer + lm_idx, pstate, format);
+			_dpu_crtc_setup_blend_cfg(mixer + lm_idx, pstate, format,
+						  ctl->mdss_ver);
 
 			if (bg_alpha_enable && !format->alpha_enable)
 				mixer[lm_idx].mixer_op_mode = 0;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 3bfb61cb83672dca4236bdbbbfb1e442223576d2..f220a68e138cb9e7c88194e53e47391de7ed04f7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -19,12 +19,20 @@
 
 /* These register are offset to mixer base + stage base */
 #define LM_BLEND0_OP                     0x00
+
+/* <v12 DPU with offset to mixer base + stage base */
 #define LM_BLEND0_CONST_ALPHA            0x04
 #define LM_FG_COLOR_FILL_COLOR_0         0x08
 #define LM_FG_COLOR_FILL_COLOR_1         0x0C
 #define LM_FG_COLOR_FILL_SIZE            0x10
 #define LM_FG_COLOR_FILL_XY              0x14
 
+/* >= v12 DPU */
+#define LM_BORDER_COLOR_0_V12            0x1c
+#define LM_BORDER_COLOR_1_V12            0x20
+
+/* >= v12 DPU with offset to mixer base + stage base */
+#define LM_BLEND0_CONST_ALPHA_V12        0x08
 #define LM_BLEND0_FG_ALPHA               0x04
 #define LM_BLEND0_BG_ALPHA               0x08
 
@@ -83,6 +91,22 @@ static void dpu_hw_lm_setup_border_color(struct dpu_hw_mixer *ctx,
 	}
 }
 
+static void dpu_hw_lm_setup_border_color_v12(struct dpu_hw_mixer *ctx,
+					     struct dpu_mdss_color *color,
+					     u8 border_en)
+{
+	struct dpu_hw_blk_reg_map *c = &ctx->hw;
+
+	if (border_en) {
+		DPU_REG_WRITE(c, LM_BORDER_COLOR_0_V12,
+			      (color->color_0 & 0x3ff) |
+			      ((color->color_1 & 0x3ff) << 16));
+		DPU_REG_WRITE(c, LM_BORDER_COLOR_1_V12,
+			      (color->color_2 & 0x3ff) |
+			      ((color->color_3 & 0x3ff) << 16));
+	}
+}
+
 static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx)
 {
 	dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, 0x0);
@@ -112,6 +136,27 @@ static void dpu_hw_lm_setup_blend_config_combined_alpha(struct dpu_hw_mixer *ctx
 	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
 }
 
+static void
+dpu_hw_lm_setup_blend_config_combined_alpha_v12(struct dpu_hw_mixer *ctx,
+						u32 stage, u32 fg_alpha,
+						u32 bg_alpha, u32 blend_op)
+{
+	struct dpu_hw_blk_reg_map *c = &ctx->hw;
+	int stage_off;
+	u32 const_alpha;
+
+	if (stage == DPU_STAGE_BASE)
+		return;
+
+	stage_off = _stage_offset(ctx, stage);
+	if (WARN_ON(stage_off < 0))
+		return;
+
+	const_alpha = (bg_alpha & 0x3ff) | ((fg_alpha & 0x3ff) << 16);
+	DPU_REG_WRITE(c, LM_BLEND0_CONST_ALPHA_V12 + stage_off, const_alpha);
+	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
+}
+
 static void dpu_hw_lm_setup_blend_config(struct dpu_hw_mixer *ctx,
 	u32 stage, u32 fg_alpha, u32 bg_alpha, u32 blend_op)
 {
@@ -144,6 +189,32 @@ static void dpu_hw_lm_setup_color3(struct dpu_hw_mixer *ctx,
 	DPU_REG_WRITE(c, LM_OP_MODE, op_mode);
 }
 
+static void dpu_hw_lm_setup_color3_v12(struct dpu_hw_mixer *ctx,
+				       uint32_t mixer_op_mode)
+{
+	struct dpu_hw_blk_reg_map *c = &ctx->hw;
+	int op_mode, stages, stage_off, i;
+
+	stages = ctx->cap->sblk->maxblendstages;
+	if (stages <= 0)
+		return;
+
+	for (i = DPU_STAGE_0; i <= stages; i++) {
+		stage_off = _stage_offset(ctx, i);
+		if (WARN_ON(stage_off < 0))
+			return;
+
+		/* set color_out3 bit in blend0_op when enabled in mixer_op_mode */
+		op_mode = DPU_REG_READ(c, LM_BLEND0_OP + stage_off);
+		if (mixer_op_mode & BIT(i))
+			op_mode |= BIT(30);
+		else
+			op_mode &= ~BIT(30);
+
+		DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, op_mode);
+	}
+}
+
 /**
  * dpu_hw_lm_init() - Initializes the mixer hw driver object.
  * should be called once before accessing every mixer.
@@ -175,12 +246,19 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
 	c->idx = cfg->id;
 	c->cap = cfg;
 	c->ops.setup_mixer_out = dpu_hw_lm_setup_out;
-	if (mdss_ver->core_major_ver >= 4)
+	if (mdss_ver->core_major_ver >= 12)
+		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha_v12;
+	else if (mdss_ver->core_major_ver >= 4)
 		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
 	else
 		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config;
-	c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
-	c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
+	if (mdss_ver->core_major_ver < 12) {
+		c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
+		c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
+	} else {
+		c->ops.setup_alpha_out = dpu_hw_lm_setup_color3_v12;
+		c->ops.setup_border_color = dpu_hw_lm_setup_border_color_v12;
+	}
 	c->ops.setup_misr = dpu_hw_lm_setup_misr;
 	c->ops.collect_misr = dpu_hw_lm_collect_misr;
 

-- 
2.45.2

