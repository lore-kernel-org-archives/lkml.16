Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759F32641DB
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 10:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745230414; cv=none; b=HrQVCDAxjMzqk1DbsNqYO/4iWOMkV+7cSKiYC4o30O6tMfMD2Z3KO1eOce6gVf+/k24C8xTWJ9B2l/0aNyWTPh1dLbpQGFGbXE0CKzKOx6mZ1cuQHTUhbiywp/2WNTmmcSU54M/TYiggHMCjF0uSz0E/dhqltoaImv7jZQfoYf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745230414; c=relaxed/simple;
	bh=Pz2EbCAhTSbi3s1n0uikdRPmeNKPOIEQOu+qX+8XfSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jymL/5AXZAI4rjjMxImDqPs0xGR8gCgpKCk96H1G9kNQOExWdaayx47f957E3dt8qmDxyRsE0/zzQtDGjZ9tKq7oGmAiSR/yWLwxv/vgkZ4a5/G/eRGdRl/cH+GpcKKRxPWH6/b0t03V5HIUxjcjfMOjrqAp3bVPb0VExn7mw+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Uq0J0tNU; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Uq0J0tNU"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2240b4de12bso55715545ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 03:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230411; x=1745835211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JlRUONHPgdRG0yBjPS5/nMKjk95rCFAaXubE+yQQ9K0=;
        b=Uq0J0tNUMXMRSwnV4897lUxgzT3P0xngZoRg/eWiM6OnZ0DGA0zliAwCai/oDgOAIe
         T6j8+aLgluv1ZTjs5xLZRez6n26sss2fjxgy3zjrIGBZvhFjwODQGlnVWJTSYttyPXeu
         CMTwETZAL9HW4AO7MBzI00Ohf/8Z43r4yqC2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230411; x=1745835211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JlRUONHPgdRG0yBjPS5/nMKjk95rCFAaXubE+yQQ9K0=;
        b=DuM23RqX4IMd14rZzpGhzzIkTeEWpj71s+rSliBkPZ/Yv6/Nb6MYV2AR5Nl8yV5SyR
         aEPyckNWgAfLfeqjLVwvYcsnhtul5wfx5MZ4h9dIQmFyqNjvnKhPpGkKRzOJXgxExoCN
         pf9CFG/3EdZmk/2PlSzgKxtoVWBpkIXmos46b0O7Ari1eoGJ7rl9VlfrbdbJYcAMMi3l
         jR7CvZxPNTA0FZOlmeaCdbTf5PojDbLc0aivevG/uSjBnoE5AUrhSGHQm88du2n8qdKB
         5GaJ31FibuP5V5oGBoy4ReB3Ng3iBNQwaqA2k3SUfDwGZXiYFLv2J5TCFwR74r0PwC5r
         f2KA==
X-Forwarded-Encrypted: i=1; AJvYcCX2CVBHHYFp6Kt9kBgzvaEYvnMlFa4JQemoGbi0ZkK4tf6lAWQCfNIfSyrgxUcyh8SNiK2VRROcMcMM/+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yztr+6r84PovxuLmyigrOz55FLQDkK0DXmWZ1GB//VCbTCyaFWm
	1SBVEZzt3bk6F0rc+qJFbGMnVsz4/8IW1t2/MmSG+u/xPbwyLHjzvMieXT+kIg==
X-Gm-Gg: ASbGnct1TdJDZ/AP2R4OLuqC90MbgNfCpdTfsnItScpB3zUzYUnUkXS1aWxtTQlhLy8
	aqbvnQL0Pe1CDOCC+WFT7YhDMuyNOa+OBX7mqFlCUDGe7ND/IoCaEY8tOJ66QeG7tZCWeNn6WWE
	ODI1YnGunTUNtdnVh9alm2HG8KJygMludrqzi7tvQ3XHzjT2TnGom9oDB4CrysX80+5zb9aL+jD
	Jydq3RTjl5w895CZE2egZ+HLyQOqbwB5HsqrOypfWb69l4YQn/6Jn/YOIIYPvxsWgkgjyk0fr98
	9d6ciR4Gnrsw/YAeYwPDx77lMaAbpnn4Th/OTEASYX6yVIiNQv1EZ8EFMUQ=
X-Google-Smtp-Source: AGHT+IGaSj2NjUkLJYtvrXbaniU4ZUkVXBRJQywqY5KHy1I4U9ywfY/tOoiirvNsMeMMe1Zel8Bsug==
X-Received: by 2002:a17:902:ce86:b0:220:c143:90a0 with SMTP id d9443c01a7336-22c535a7254mr159468475ad.24.1745230410702;
        Mon, 21 Apr 2025 03:13:30 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:30 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 8/8] platform/chrome: of_hw_prober: Support touchscreen probing on Squirtle
Date: Mon, 21 Apr 2025 18:12:46 +0800
Message-ID: <20250421101248.426929-9-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250421101248.426929-1-wenst@chromium.org>
References: <20250421101248.426929-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MT8186 Squirtle Chromebook is built with one of two possible
touchscreens. Let the prober probe for them.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/platform/chrome/chromeos_of_hw_prober.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
index 10dbaede0541..f3cd612e5584 100644
--- a/drivers/platform/chrome/chromeos_of_hw_prober.c
+++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
@@ -59,6 +59,7 @@ static int chromeos_i2c_component_prober(struct device *dev, const void *_data)
 DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(touchscreen);
 DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(trackpad);
 
+DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(touchscreen);
 DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(trackpad);
 
 static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trackpad = {
@@ -76,6 +77,17 @@ static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trackpad = {
 	},
 };
 
+static const struct chromeos_i2c_probe_data chromeos_i2c_probe_squirtle_touchscreen = {
+	.cfg = &chromeos_i2c_probe_simple_touchscreen_cfg,
+	.opts = &(const struct i2c_of_probe_simple_opts) {
+		.res_node_compatible = "elan,ekth6a12nay",
+		.supply_name = "vcc33",
+		.gpio_name = "reset",
+		.post_power_on_delay_ms = 10,
+		.post_gpio_config_delay_ms = 300,
+	},
+};
+
 static const struct hw_prober_entry hw_prober_platforms[] = {
 	{
 		.compatible = "google,hana",
@@ -93,6 +105,10 @@ static const struct hw_prober_entry hw_prober_platforms[] = {
 		.compatible = "google,squirtle",
 		.prober = chromeos_i2c_component_prober,
 		.data = &chromeos_i2c_probe_dumb_trackpad,
+	}, {
+		.compatible = "google,squirtle",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_squirtle_touchscreen,
 	}, {
 		.compatible = "google,steelix",
 		.prober = chromeos_i2c_component_prober,
-- 
2.49.0.805.g082f7c87e0-goog

