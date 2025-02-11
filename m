Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDA7267B6D
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 17:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739294923; cv=none; b=n6+17JIzw2Vmh/aV3awaPScQPHpvuVk1NiCQipmqQ02LU7B1aq9pZLQDw3IUvzDNgxvji323q1Vyv+6x/VjvjyBFXBpm+FQ5yN+hEPlW7E8XSqLtdVR9LVvVSMgONMkc0wVOlUZz8pMGpVnksV6aZF6hEZyiqwguj6iiDB8y+RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739294923; c=relaxed/simple;
	bh=yh1X3NdDCdUsA9BLxtXchkn9/M7vIhxyVwRqzsjlThI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Re4t1m3QPunPDPq+/dvoy3rNU82ScH+g14sevn2F1JD+PUNGo6SW8+HEXAHi38juyyiG5mEw8AO+65bWbXT5ZsPebECQN5xqEI952V6o/oAiGG1eYRWr4f5vNb+6Cb+w0R+O7G+6JdU6tpKqwZKah5CzcxRzEszP58bpjjSXwqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=pmeYh9uc; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pmeYh9uc"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38dd935a267so2392422f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739294919; x=1739899719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YiUH4lqEkZUY+Ysux6Yiqp87vOhypZIO5pd5GZP5Rxo=;
        b=pmeYh9uchp8yX2jMeFdpbUwqUjaBVVWOjCLw1EuEcUpkPssllSMiZvn+MKEWW8GUth
         e/dmIBaHjqw0Qi7I7XCFudMl7N8j0cB7dBZoMrQ/m/uDJaywbKE2ziJFt4gM6BYktOsw
         nSTcRmnqtiT6jFQBZ9q3vsKdHWWCyCQkQD3vCHvA9Rgufxw/SCxVnp07go8eRCM6Ka3E
         vw8/t5URK58CyTPNlbnnOA2rFhktA2pQHx85CaJ7JpTbp2GFMQxjcx8Dx0N4znhYbijA
         6uh6fLifTfFmj2C8SxeC63EaTIqptF8wmdHNnoN0tjqQbezzVYhRyh41w817z2TbgvcQ
         bVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739294919; x=1739899719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YiUH4lqEkZUY+Ysux6Yiqp87vOhypZIO5pd5GZP5Rxo=;
        b=XSw9K+RfbzgiBXsTNb/qiP93ZqPMUQVGV/vJCFIHaVrhrTqo4UD9NTCL2+is/4j8ee
         8B228lBFdq5xwbvLl4S8DWGDJ050bVzRHYzNQaKne3iNwF3hRdt53JcZJxXpuQ2YKGR5
         9z3tMHBDWVzhY+AIEhBmjrdwhN4sq59IPo50elYuBMm4JR0eDAJm6cX+m9LealV0oyx8
         5awgyksRneUlXJ1+01tHSkmEQlqMfaBvVC4GXpDmiDex+o+BVYSeYFiKZqXFZ+RVPDwC
         qvG9bDm10jZq8xY2FSRLRiSViI+ai6vUz39QiTSxvT2ARAseZNj6MuuL60SHwAgx8W6y
         /WFg==
X-Forwarded-Encrypted: i=1; AJvYcCUnahn+YIAtooJFa+usGdyzHCHBLBG4gOCDvgd78MGSwOKXB3066QowngTOA2uGKyrV87rw1+jxsNcQ3bQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYAZFnDEZCjEfdG9jeAX3Wd3qb/uAKZDLoHO3aS2obAm1jfvv7
	JVtGFhOQ092arDMsswnKa7yI0x+Pd3/XdnRQN4ERy5Edk0A8mHqE2dz+wtMx2cA=
X-Gm-Gg: ASbGncuD8SBDQuWXYAnwekpGEaXyM6emvnAO5fO+kytNrgo7niDrlz5FdewBVcttwzb
	ssWKVXit6UY7iMMHXwCw2enyMJldYjoYv9by9SGptssm60EPV+k0xrumxTX918Ew04nR1c2Tv2G
	ZO5Uj6ocuZ2J4I5S8T/7e+9l9f4wKSvgEzw4fn3e+DdnZlT6wfYImSFfZUJ+WcPWMo4J3Xl+/1l
	+ihK9mKZVYiFjX4SOKbiLQL8cp2F18AvcM929Zy1LUtuq1sA66aIjIPexI5KdHm3g23zuv7ZxHi
	e1fJKfC4iZx44HVv1w==
X-Google-Smtp-Source: AGHT+IGWxF7f1yWAujS2u+KdxRxs6BCZ2vWSSXW9ul24NRbBrNVcf/bzFVrq/LcbH1iHWIudtU2p/Q==
X-Received: by 2002:a5d:5f42:0:b0:38d:e250:d962 with SMTP id ffacd0b85a97d-38de937cef8mr592405f8f.30.1739294919069;
        Tue, 11 Feb 2025 09:28:39 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fc0c:6c04:7ae0:c5c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dc6c80df2sm13691082f8f.18.2025.02.11.09.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 09:28:38 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Hans de Goede <hdegoede@redhat.com>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v3 6/7] clk: clk-imx8mp-audiomix: use the auxiliary device creation helper
Date: Tue, 11 Feb 2025 18:28:03 +0100
Message-ID: <20250211-aux-device-create-helper-v3-6-7edb50524909@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2845; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=yh1X3NdDCdUsA9BLxtXchkn9/M7vIhxyVwRqzsjlThI=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnq4g60PKNni6dfU5BjvUnV/GlJm8Z/Gp+nsWrU
 9ZnwgOS2NiJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ6uIOgAKCRDm/A8cN/La
 hbC0EACdDyfv4ruNFNCmp9zrJN9GhUKhduy0uDZfmX9xFwkj19yNB791PVovwlCxBtsVN+6iC4q
 rwLI3P4vdZ1EwlqCmVrmNdGoLnghwRNHwHALo5QxefOPT4NljAxW1vZtixroQfv2C49vYyO6W4P
 kJzYPrSQ5gCAhV9vK40Lrk3hKz6idlpK6fP6E452DnIlVkMEuBRhoWIYcW3UYiHeM8GZVGnhBCD
 gSJilnljJ5OTQH+GOh4JJ+ljp3eDNfLB8W4KHF0CAyQTUEMe8AcjK03WlL/wYkVKOkgcGkEcQp9
 BIY3F82Fe2CRnNyNNI0avHJK4Dow3qn7iDNJJpC3ovn48iYglF/d0jXmcEMhXhQpSbeKMeTqa7J
 fP6G9puoFGrvGncXPPVDyslRM/0C+t+9jrKuXcFKpUC6JEFDzD6J5ZEVwY4UiSURMnLq30q2O/b
 Ji2uLCAtXuMOhYX2lnsQA5d17uDRDdwUJp8XCH4Oz6Dnb2S55Fsz9tvBGlSUODkUiKV8l+xyrVc
 1dbrvgTF+WDlDaLoybOYZRNVsuxR6nnuPg843dEMXQ4KBAAvubECmtqd3Rp4YaM5ppqsxBeoFzV
 cuZaX5kv0Po8QUX3SAVM7K3Fpx7ZYg1fo5142KlYv+iDGalSNmwxlsLmgMTIAr8JL2LCqw+Y9jn uIY7Dp1qPMaPorQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Content-Transfer-Encoding: 8bit

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/imx/clk-imx8mp-audiomix.c | 56 ++++-------------------------------
 1 file changed, 6 insertions(+), 50 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
index c409fc7e061869988f83c7df3ef7860500426323..988a5fffeb4e0e481ec57038d9d1f1b43432fc98 100644
--- a/drivers/clk/imx/clk-imx8mp-audiomix.c
+++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
@@ -228,64 +228,20 @@ struct clk_imx8mp_audiomix_priv {
 	struct clk_hw_onecell_data clk_data;
 };
 
-#if IS_ENABLED(CONFIG_RESET_CONTROLLER)
-
-static void clk_imx8mp_audiomix_reset_unregister_adev(void *_adev)
-{
-	struct auxiliary_device *adev = _adev;
-
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
-}
-
-static void clk_imx8mp_audiomix_reset_adev_release(struct device *dev)
+static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev)
 {
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	kfree(adev);
-}
-
-static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
-							 struct clk_imx8mp_audiomix_priv *priv)
-{
-	struct auxiliary_device *adev __free(kfree) = NULL;
-	int ret;
+	struct auxiliary_device *adev;
 
 	if (!of_property_present(dev->of_node, "#reset-cells"))
 		return 0;
 
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
-	if (!adev)
-		return -ENOMEM;
-
-	adev->name = "reset";
-	adev->dev.parent = dev;
-	adev->dev.release = clk_imx8mp_audiomix_reset_adev_release;
-
-	ret = auxiliary_device_init(adev);
-	if (ret)
-		return ret;
-
-	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
-
-	return devm_add_action_or_reset(dev, clk_imx8mp_audiomix_reset_unregister_adev,
-					no_free_ptr(adev));
-}
-
-#else /* !CONFIG_RESET_CONTROLLER */
+	adev = devm_auxiliary_device_create(dev, "reset", NULL, 0);
+	if (IS_ERR_OR_NULL(adev))
+		return PTR_ERR(adev);
 
-static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
-							 struct clk_imx8mp_audiomix_priv *priv)
-{
 	return 0;
 }
 
-#endif /* !CONFIG_RESET_CONTROLLER */
-
 static void clk_imx8mp_audiomix_save_restore(struct device *dev, bool save)
 {
 	struct clk_imx8mp_audiomix_priv *priv = dev_get_drvdata(dev);
@@ -408,7 +364,7 @@ static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clk_register;
 
-	ret = clk_imx8mp_audiomix_reset_controller_register(dev, priv);
+	ret = clk_imx8mp_audiomix_reset_controller_register(dev);
 	if (ret)
 		goto err_clk_register;
 

-- 
2.45.2

