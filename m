Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201B328A72A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751875049; cv=none; b=p8jy+wh62qDjrtBUF8ZH2KJytoc5FF60bvQLNdchwTdfOXMvcFF+BJ6FBmShM3hBkVYpsN2J+zJjMBK+08VyTege1NJStjna05X+jVUAaKSNrGIunCFvVYnexXqaql/jq3eropkryqjNsmCG0rWJ2gDdtXHWNIEQobxagfsjyqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751875049; c=relaxed/simple;
	bh=P8HQ9uJ3XyqukKDyIYQMPHz+6q2ZpiD7QwsLElWeJkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C0wiqmY6eYWYPQ90SpWbzwYE298ZHxsa05l6dd0SdLUrTmnamWsE51WpXgAPEDWkkUpU1HDuTZq0s3zGn3OCRIdR7gP1OhCOm5dtCdLpbT87ImrDj4XJCxY61bYG+Fp+g/+OADqR2dwQOwInvthTYdVAsT9sLtJGZ/byLrQatiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=CYU0OuXS; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="CYU0OuXS"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-23c8f179e1bso21173685ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 00:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1751875047; x=1752479847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gizo1Y9JZrUMSmoAMbm1FYjU79aRDOXQASrbUODDlcY=;
        b=CYU0OuXS7sZTck4Vw69mzo5jZxgSuCTp51tA9iVnbwG3Yldh7hZNJBbibb2y7w6Bwe
         OBm/b1S/fVLAMdu3qbJzZT/HjhKvVnUZiVpO+imUcYBRWOA8IXUPsusiV4WF9Fx5KeZg
         AC6XiX9kj9MUrszurds/RwEraCqYxUEXxuR6sTmocdpEOV9z9CXT+jS/PSjt/WuSRP35
         A4xae0c6OvCjoY/mBe73NusDUsU57Ka9Jwcjj64kbpyCA4EpMXbE7nsNe0uczZ8WdOzL
         b4dl5Z+GEl+rHZVeVcoN1pSQM0BxsiQiHd3kxzIfxyEJ6DCZlOjBS9bdyaxhh8VuYdHn
         0i0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751875047; x=1752479847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gizo1Y9JZrUMSmoAMbm1FYjU79aRDOXQASrbUODDlcY=;
        b=pwxpzxBKfVUfdPqslBv6pD2iAKOm3OWr8PBHfzPxOOZEdBNQljSVNOh+Ty2lpxeDFN
         JPKUdHhPTdB3tmDwAbHs5XTpAUb98T6MBL1InY18djCSneRdYK6FPdLpSv3sjmFysfZH
         WiyA9RdlWVBd4ADlDcwIQiQS5wGJos62c069HfHKuaFLfQcTFbNNVeneWIm7aol9qU59
         SYjrNmnHQ4KWEbhMY5CjZfUw3BkgpRYU1OLqfldxUzAWwD+/qBiwXSoL7gEq+oOkzY0I
         JibM5uXifNYuDhBu1QyGucKQ+HYDBxqp0UWoqmqj4CGDovMRdhqyClTYR2Sk5DcW2sr3
         mzBA==
X-Forwarded-Encrypted: i=1; AJvYcCUpex0J3kuD6VdH+qtT8k3OBLTfB7025ww7OeQWatutD+w04Kd6KV2Zs1qolTLovLyv39jZLLkI9b63zs4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8CPlEZTbn0Gvq/KweSzqdpnOQ0lZUGB3oVbs50KYKgO8uUGsY
	L/D4HLVjTkrXebfHhj4Rx2BVic4Djc5liC0aHaeG4wQc53gThXaHc6IBZlbtwQsw1ZA=
X-Gm-Gg: ASbGncvXqMn+RJsX9jd76zKP4HNLsHifJU5sEB4F8S71fzyyECVe31bW6GtIWSOuplH
	BZC8Y0Tc9ZkzXx5DstL6J5PxhAYakHAF/CQHX1QfdVUTlCSuPVp20y/E//+jPnIWigcZUPj7BWX
	nj73uq5htriioZVaWsAIzT82I681rkrNvAiPhSo1kpHY67w0uRTQi8apqUNPm4lUixHYpIR6ntT
	DgaiuWtBwCE9pplYEY1LWfQVR7hqOKpIFICH5KBaNMzqsE6z4m7tBZ9uA83+iNGuLwCQvZ99qbo
	3K37uGYUWDZ3lOW2nQp71A5fznHCdMStTPDWfG/Os6ilvcJR5ldZXtprCzABsPMUikmSahnJlP7
	+KMBbjZtwb+l4RN7B8w==
X-Google-Smtp-Source: AGHT+IH3zTssQXlW4e9+S6k2Gnh2tBpqiBPmGMJFWBwXftXzY2NmSu5YHWb2cBRXSypKAiCuAwySvg==
X-Received: by 2002:a17:902:f792:b0:223:619e:71da with SMTP id d9443c01a7336-23c875da391mr150368325ad.49.1751875047455;
        Mon, 07 Jul 2025 00:57:27 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee62f8bdsm8246476a12.57.2025.07.07.00.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:57:26 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org,
	tejasvipin76@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH 1/3] drm: panel: Replace usage of deprecated MIPI macro
Date: Mon,  7 Jul 2025 01:56:56 -0600
Message-ID: <20250707075659.75810-2-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707075659.75810-1-me@brighamcampbell.com>
References: <20250707075659.75810-1-me@brighamcampbell.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace all usages of the deprecated mipi_dsi_generic_write_seq() with
mipi_dsi_generic_write_seq_multi().

This patch's usage of the mipi_dsi_multi_context struct is not
idiomatic. Rightfully, the struct wasn't designed to cater to the needs
of panels with multiple MIPI DSI interfaces. This panel is an oddity
which requires swapping the dsi pointer between calls to
mipi_dsi_generic_write_seq_multi() in order to preserve the exact
behavior implemented using the non-multi variant of the macro.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
index 5b5082efb282..777a8ab3a397 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
@@ -161,29 +161,35 @@ static int jdi_setup_symmetrical_split(struct mipi_dsi_device *left,
 
 static int jdi_write_dcdc_registers(struct jdi_panel *jdi)
 {
+	struct mipi_dsi_multi_context dsi_ctx;
+
 	/* Clear the manufacturer command access protection */
-	mipi_dsi_generic_write_seq(jdi->link1, MCS_CMD_ACS_PROT,
+	dsi_ctx.dsi = jdi->link1;
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_CMD_ACS_PROT,
 				   MCS_CMD_ACS_PROT_OFF);
-	mipi_dsi_generic_write_seq(jdi->link2, MCS_CMD_ACS_PROT,
+	dsi_ctx.dsi = jdi->link2;
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_CMD_ACS_PROT,
 				   MCS_CMD_ACS_PROT_OFF);
 	/*
-	 * Change the VGH/VGL divide rations to move the noise generated by the
+	 * Change the VGH/VGL divide ratios to move the noise generated by the
 	 * TCONN. This should hopefully avoid interaction with the backlight
 	 * controller.
 	 */
-	mipi_dsi_generic_write_seq(jdi->link1, MCS_PWR_CTRL_FUNC,
+	dsi_ctx.dsi = jdi->link1;
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_PWR_CTRL_FUNC,
 				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
 				   MCS_PWR_CTRL_PARAM1_DEFAULT,
 				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
 				   MCS_PWR_CTRL_PARAM2_DEFAULT);
 
-	mipi_dsi_generic_write_seq(jdi->link2, MCS_PWR_CTRL_FUNC,
+	dsi_ctx.dsi = jdi->link2;
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_PWR_CTRL_FUNC,
 				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
 				   MCS_PWR_CTRL_PARAM1_DEFAULT,
 				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
 				   MCS_PWR_CTRL_PARAM2_DEFAULT);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int jdi_panel_prepare(struct drm_panel *panel)
-- 
2.49.0

