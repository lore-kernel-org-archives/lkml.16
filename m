Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2240022F141
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 13:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738847603; cv=none; b=uIHu/HfYTwm1uX6aSGSGB0Yrm6UwTjmn5knzWj35fiNHjNij14nb63dH2dUT3uIe1RCUx+PGj08DOsJZ+QQlgdrSkBSLrcKgomNYyUaQQtqAAVMbvYayRUrENLZZI1pcAlsiQKfJ4+LH3E6iVwUl/+JqRFgkrtKE854PexiULuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738847603; c=relaxed/simple;
	bh=IlSeAVuOn+5eSu5u1MtrG/+GgMVa1Kbx2Vbowshsy+s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QZKpiOBfK2BOvMzIg+WvvV569H2SuaQiGKwYi6HeX1xWsdFQhxJ43gUIJft2FN3UQtM5oaqF8QaKQ+wTNC9oqDJtNRm5CEULfDo6dLpGa49RFo2Dkc1NpsrZ6l1BqzdOkHCZWTp0p4SsPasJH7Mwvvcm52Nj9zWnyQB+4z1I7hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=tjS0oVaS; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="tjS0oVaS"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21f2339dcfdso12976375ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 05:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1738847600; x=1739452400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GdfCBoc4GWVpHZF4nYGf4TiZnJ1DUCioOYo7wOpOZY=;
        b=tjS0oVaSlpyEyL/OuWqi93tVxmxT+RI8Aofj2jP3M6a4JqRSayMhB37n9aLYBhExMW
         pWW7Ytbnij1/T9LCuJD312JYA++AotLctD7nlqxLpaIp7xpODDgSbxycUS76rG2N+9LU
         xzn35Oof1jmf8dd67Yjxfb2n9U6GcTbAKSOghub2Hf2d+lv/jYK+8RX5s/lhxRlQP/74
         8PINrAAx2nqBJDo/yQ0jtt9Wqrbl96BILBhyzImrgPWCfvlSbDS+PBsgcAKFYdnxuyy8
         /ce1Hcj0MByOP/n4LU3813e26TvnvWfrcuVVaxxaJ2IrjjEZucYwxoxuopfjl1jKBQsb
         NUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738847600; x=1739452400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GdfCBoc4GWVpHZF4nYGf4TiZnJ1DUCioOYo7wOpOZY=;
        b=ASjQokVbzGGSkOA/W0UDQ284O2DXASxT10COcF8w9Rd3YIkIMYzudFeYPPqAOVnowR
         O3r3pNDqoCuxPiHXtqyB9qxeSHjCSkAmJsEUH/CoX9QGAYoPul1KioHeXpUjBcgonqqO
         0eej3Heo24j+TA8AshhkF5oHi9ZigbLvOeYuBjckRdmpTdXMNaFGtk8UABzDoOLrbXUf
         B6kYcYUFfD+0k44UYtOQqxB5J6wuqqHa1O+FUbHFMupnFTtCRrIIGpiy79ZHwagzAB9s
         dWxMuffFvC1kJTGbsDwDQYUaOySkBN0zaRzBchCKqdkPiaU64ik/gXGFUkhyeDbO0Tjk
         iSGw==
X-Forwarded-Encrypted: i=1; AJvYcCVJDYNk49/LUwn8/c48XnthVLL5gibpaBRTSCpkQfDx0NsdkOUV1OlsDlNU51W1uPm7PnJl2qmURESypvU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4uFxpPkko9lAsNSxoFjdyVt0sjKSM5f1k8L37RGeMeprac9In
	bEp9+XJgwnJuWnFp95CAs8xK3TqWt8qLc3jnRKYJik0YVOw7hdLpGQz+IHdvNgI=
X-Gm-Gg: ASbGnctNH+mDhrk6bEQIXKbce8AoR7jfCpmp96hWHBP+eE2uBxD2Xa+ptCj0QVeGOEa
	nKP0SnEUJFLBdsuJ5iE7S8J1AmGyQNsFt43qcQSdiccquatPSALMDCkx04lBYwcBgVarM9Mf/AC
	QMjGtxbEci5zi51tPRWCjOzdrrVSKojQltpHUnWMqxhqEyQMPHk2lMaVJV0Lq5S9uJsyFSFxUOJ
	VkcBv+pMqVoYq9GN9eemGOKwBy8v+2YjwDsSJ+gGHuuLanvo2+I0PApex1vGiwYA5PXujKLt2KB
	qsyXOjxEeJO9ljJ5LLY/C85r+0cwpZrTwBYlo0IWT5u/DN4aHkDDp4cdsCTlAMQ=
X-Google-Smtp-Source: AGHT+IE9H1bpRdEntqqbH6MIaeTy9mrtiAgOFBRV831HHWJQMJLIAW3ZrkPOjRN9d58DpxmtTF7JzQ==
X-Received: by 2002:a17:903:2f8a:b0:215:a303:24e9 with SMTP id d9443c01a7336-21f2f1452ddmr62574205ad.3.1738847600279;
        Thu, 06 Feb 2025 05:13:20 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653afc2sm12237925ad.62.2025.02.06.05.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 05:13:19 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v2 3/3] drm/panel: panel-himax-hx83102: support for csot-pna957qt1-1 MIPI-DSI panel
Date: Thu,  6 Feb 2025 21:13:00 +0800
Message-Id: <20250206131300.1295111-4-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206131300.1295111-1-yelangyan@huaqin.corp-partner.google.com>
References: <20250206131300.1295111-1-yelangyan@huaqin.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The csot-pna957qt1-1 is a 10.95" TFT panel. The MIPI controller on this
panel is the same as the other panels here, so add this panel to this
driver.

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-himax-hx83102.c | 123 ++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
index 8b48bba18131..ba5e5b7df5fc 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
@@ -43,6 +43,7 @@
 #define HX83102_SETGIP1		0xd5
 #define HX83102_SETGIP2		0xd6
 #define HX83102_SETGIP3		0xd8
+#define HX83102_UNKNOWN_D9	0xd9
 #define HX83102_SETGMA		0xe0
 #define HX83102_UNKNOWN_E1	0xe1
 #define HX83102_SETTP1		0xe7
@@ -291,6 +292,103 @@ static int boe_nv110wum_init(struct hx83102 *ctx)
 	return dsi_ctx.accum_err;
 };
 
+static int csot_pna957qt1_1_init(struct hx83102 *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	msleep(60);
+
+	hx83102_enable_extended_cmds(&dsi_ctx, true);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_D9, 0xd2);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x2c, 0xb3, 0xb3, 0x31, 0xf1, 0x33,
+				     0xe0, 0x54, 0x36, 0x36, 0x3a, 0x3a, 0x32, 0x8b, 0x11, 0xe5,
+				     0x98);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xd9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x8b, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDISP, 0x00, 0x47, 0xb0, 0x80, 0x00, 0x2c,
+				     0x80, 0x3c, 0x9f, 0x22, 0x20, 0x00, 0x00, 0x98, 0x51);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x41, 0x41, 0x41, 0x41, 0x64, 0x64,
+				     0x40, 0x84, 0x64, 0x84, 0x01, 0x9d, 0x01, 0x02, 0x01, 0x00,
+				     0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETVDC, 0x1b, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_BE, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPTBA, 0xfc, 0xc4, 0x80, 0x9c, 0x36, 0x00,
+				     0x0d, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSTBA, 0x32, 0x32, 0x22, 0x11, 0x22, 0xa0,
+				     0x31, 0x08, 0xf5, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xcc);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTCON, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETRAMDMY, 0x97);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPWM, 0x00, 0x1e, 0x13, 0x88, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x08, 0x13, 0x07, 0x00, 0x0f,
+				     0x36);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPANEL, 0x02, 0x03, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPCTRL, 0x07, 0x06, 0x00, 0x02, 0x04, 0x2c,
+				     0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0, 0x06, 0x00, 0x00, 0x00, 0x40, 0x04,
+				     0x08, 0x04, 0x08, 0x37, 0x07, 0x44, 0x37, 0x2b, 0x2b, 0x03,
+				     0x03, 0x32, 0x10, 0x22, 0x00, 0x25, 0x32, 0x10, 0x29, 0x00,
+				     0x29, 0x32, 0x10, 0x08, 0x00, 0x08, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP1, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x07, 0x06, 0x07, 0x06, 0x05, 0x04,
+				     0x05, 0x04, 0x03, 0x02, 0x03, 0x02, 0x01, 0x00, 0x01, 0x00,
+				     0x18, 0x18, 0x25, 0x24, 0x25, 0x24, 0x1f, 0x1f, 0x1f, 0x1f,
+				     0x1e, 0x1e, 0x1e, 0x1e, 0x20, 0x20, 0x20, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0x0a, 0x2a, 0xaa, 0x8a, 0xaa, 0xa0,
+				     0x0a, 0x2a, 0xaa, 0x8a, 0xaa, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGMA, 0x0a, 0x0e, 0x1a, 0x21, 0x28, 0x46,
+				     0x5c, 0x61, 0x63, 0x5e, 0x78, 0x7d, 0x80, 0x8e, 0x89, 0x90,
+				     0x98, 0xaa, 0xa8, 0x52, 0x59, 0x60, 0x6f, 0x06, 0x0a, 0x16,
+				     0x1d, 0x24, 0x46, 0x5c, 0x61, 0x6b, 0x66, 0x7c, 0x7d, 0x80,
+				     0x8e, 0x89, 0x90, 0x98, 0xaa, 0xa8, 0x52, 0x59, 0x60, 0x6f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0xe0, 0x10, 0x10, 0x0d, 0x1e, 0x9d,
+				     0x02, 0x52, 0x9d, 0x14, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x01, 0x7f, 0x11, 0xfd);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x4f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x86);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_D2, 0x64);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0x0a, 0x2a, 0xaa, 0x8a, 0xaa, 0xa0,
+				     0x0a, 0x2a, 0xaa, 0x8a, 0xaa, 0xa0, 0x05, 0x15, 0x55, 0x45,
+				     0x55, 0x50, 0x05, 0x15, 0x55, 0x45, 0x55, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0x02, 0x00, 0x24, 0x01, 0x7e, 0x0f,
+				     0x7c, 0x10, 0xa0, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x03, 0x07, 0x00, 0x10, 0x7b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0x0f, 0x3f, 0xff, 0xcf, 0xff, 0xf0,
+				     0x0f, 0x3f, 0xff, 0xcf, 0xff, 0xf0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0xfe, 0x01, 0xfe, 0x01, 0xfe, 0x01,
+				     0x00, 0x00, 0x00, 0x23, 0x00, 0x23, 0x81, 0x02, 0x40, 0x00,
+				     0x20, 0x9d, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x01, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDISP, 0x66, 0x81);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x03, 0xff, 0xf8);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0x0a, 0x2a, 0xaa, 0x8a, 0xaa, 0xa0,
+				     0x0a, 0x2a, 0xaa, 0x8a, 0xaa, 0xa0, 0x0f, 0x2a, 0xaa, 0x8a,
+				     0xaa, 0xf0, 0x0f, 0x2a, 0xaa, 0x8a, 0xaa, 0xf0, 0x0a, 0x2a,
+				     0xaa, 0x8a, 0xaa, 0xa0, 0x0a, 0x2a, 0xaa, 0x8a, 0xaa, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
+	hx83102_enable_extended_cmds(&dsi_ctx, false);
+
+	mipi_dsi_msleep(&dsi_ctx, 60);
+
+	return dsi_ctx.accum_err;
+};
+
 static int ivo_t109nw41_init(struct hx83102 *ctx)
 {
 	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
@@ -440,6 +538,28 @@ static const struct hx83102_panel_desc boe_nv110wum_desc = {
 	.init = boe_nv110wum_init,
 };
 
+static const struct drm_display_mode csot_pna957qt1_1_default_mode = {
+	.clock = 177958,
+	.hdisplay = 1200,
+	.hsync_start = 1200 + 124,
+	.hsync_end = 1200 + 124 + 80,
+	.htotal = 1200 + 124 + 80 + 40,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 88,
+	.vsync_end = 1920 + 88 + 8,
+	.vtotal = 1920 + 88 + 8 + 38,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct hx83102_panel_desc csot_pna957qt1_1_desc = {
+	.modes = &csot_pna957qt1_1_default_mode,
+	.size = {
+		.width_mm = 147,
+		.height_mm = 235,
+	},
+	.init = csot_pna957qt1_1_init,
+};
+
 static const struct drm_display_mode ivo_t109nw41_default_mode = {
 	.clock = 167700,
 	.hdisplay = 1200,
@@ -681,6 +801,9 @@ static const struct of_device_id hx83102_of_match[] = {
 	{ .compatible = "boe,nv110wum-l60",
 	.data = &boe_nv110wum_desc
 	},
+	{ .compatible = "csot,pna957qt1-1",
+	  .data = &csot_pna957qt1_1_desc
+	},
 	{ .compatible = "ivo,t109nw41",
 	  .data = &ivo_t109nw41_desc
 	},
-- 
2.34.1

