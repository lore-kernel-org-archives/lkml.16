Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5B31A83EE
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738866223; cv=none; b=YDKhEqtoXGmAk5iwzwRdg/g5oSv81FUTREwwvEYrW1KtFMKVAW/yrnlacBvheAWdgRQ7FMigQF/pHUhoDWGt6OQ497gSy0iXv87IIkgN7UJ/c0VZi5hbKR8eDHaqZJ93X4AY0yEgPJ0pRLtQVQfOdxkOmzAF2yMRBhV+74rU8SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738866223; c=relaxed/simple;
	bh=iwGsBr2g6cxvTQiv+CdSv6JVIzby3WUkhihdby+aWqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IDseTtY9udKyG8yAsxwH9zK2J3jroTJmIBy6H4xb+869la+shrL0SEKOdCxgLYJZ7KHF67CbeqafKH5QG8DS7LJElUDWZ2vH2bbssDJEP+K7M1Lz21Si2MHscZkBLLBJOMOpS8gDpyKckO/TRjNyLn7FGKoTmffA7c4N/Oo2P4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Eh8CU+mw; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Eh8CU+mw"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43690d4605dso8856825e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738866219; x=1739471019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IzrAhf9bhLsMcYZxqnaKZFagenD94zKJ6aQSvHAU4YU=;
        b=Eh8CU+mwLclfA/J9d0RCK+2WAjGAD5Z4atKqYE1Hq/gAEH+J8c03zxTpw48qZAz+o9
         GWtqq/bLTJIo92JjVEV7iDF/RUpIAqHcCV8A/jUrFLI7BINIUy4t53viHCMjfgQdG89O
         CBbEhjzW9Hn6507f8/Y+pIAH6bocABCM0XUs6HmU6kfEmGg+UiLgCubIkhIcvH4TLUlb
         NL+B4/DUH5KrirLBVpNr29vWakv1q7kzgoNLrzWr5I3hBrMNN8/8aJEkhZPfhmor+kLc
         1BRn8GKHCXSunRfWthX1stLmssf28yU/4CreDzouZHM7RDCddk2vPJDKrcWMHhd9h7vc
         YThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738866219; x=1739471019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IzrAhf9bhLsMcYZxqnaKZFagenD94zKJ6aQSvHAU4YU=;
        b=lLJNIdVfe1hvmbidk90GSZDubw3iKz7mD5Nng25HqmzrnlF4KLVYv6ARAe1WvyHnjN
         wjhyt0T13NcUVReOCgN4dNq/KFLXeBd/ptkWjY6xsrja+/XSra/57IwQyHR+lUIJ8yzX
         7i9WLrG2wgH5Ss7B9kKkXHMii9ORGCnvun10SVpXgbBVWG+4l6Mdr8O0rUA5nAZC5wDS
         unJohFa6OPXjPAU4tXL6wpgVKnyjSaj4z0m0/o+dGN1e4UvJHPdpFNhf7dXzYWi/ANDs
         5hJXKcfOibCWDF6peKh3R+MvExsfuu0HHxSa4lYmcCT0tAtB6cJzo929kySXdShurXVu
         tGWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpAg18/15DSAPXsGXmX0OcsFznx+0sK01EDFvCPrGsHsZqC7ibQWm5jhOI/YwcTv7BEqQqaJ+3zJPwnf8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMsXCT1LA7dCXutteH4eKU9NJo0zH8LKzfnxCbFWCZFBLBDTtK
	gW26D5Vzo45LQaG9FWfjKToo2QTYUuS3G1RSuWBIo4CEyfq4KTXCFWL6ZDFMHJ4=
X-Gm-Gg: ASbGncuROPgkcX9AnnvXyKIK0JE726HDCvzmfQCoIVJ+0tA7DkX6ucprTaZBkVC6IA2
	801KX0VRPmUdT3AA8in8m3dcJGYTmrde1GDNNMerGsI8fTOhsH/uNjbLHZkrWgBHnY2yi4oc2RV
	8pnZ/L2/Zs577VbI7BXsj9NOMvGUVs5E9JW6PTrvdg372xdqWBntoOxlMjRqX50zOF4sQuWcz8r
	pjtQsawePcTF75GqdBx2b0Buv3tqkpOXiv+vpQvhDDMEJLpcyEiRoOPq3EPQMmV3UVXhms09WC0
	QJ92WodM3Awje72Rxg==
X-Google-Smtp-Source: AGHT+IH0pI3yjMNRuyuYQGdsI4Dc7dKyNS8Qo+O2EiouBizXDP2gIDLrgQWKYO2vUb10yudrqpMnig==
X-Received: by 2002:a5d:598d:0:b0:38d:ac2d:6dbc with SMTP id ffacd0b85a97d-38dc8dc1ab0mr35311f8f.17.1738866219499;
        Thu, 06 Feb 2025 10:23:39 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:a0d6:294f:5246:28d4])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4390d94d802sm66111445e9.12.2025.02.06.10.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 10:23:39 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/7] drm/bridge: ti-sn65dsi86: use the auxiliary device creation helper
Date: Thu,  6 Feb 2025 19:23:13 +0100
Message-ID: <20250206-aux-device-create-helper-v2-3-fa6a0f326527@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250206-aux-device-create-helper-v2-0-fa6a0f326527@baylibre.com>
References: <20250206-aux-device-create-helper-v2-0-fa6a0f326527@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4157; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=iwGsBr2g6cxvTQiv+CdSv6JVIzby3WUkhihdby+aWqc=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnpPrLaPQHDp/pYJvF8MlzP5gvjZiSOmfmwJmUz
 +XHDG4G8bmJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ6T6ywAKCRDm/A8cN/La
 ha7FD/9r0ZI8kwyya5pjKDVAkS1rT+bjUz5uHaEitxPt1PJx8/GKN/iw9ZKaRw7ocYJtQCGssR+
 FjzmDHoW5cielXyB/AeX+Bhy+M94AdZAToMBQDCrfkSX+5tBHwd9goHYLqKfqnDEVEDHdTQ3eiy
 AfqcTW28MgIZWNudLGvWbv7z11gIY7cGLOMcJEhacYNFNLnjQzGNUKEpAUF87I5QENsczL4gGAl
 9DbFhoXA7lxL7s0ILUtK6NdGok1pkN4EOZ7t2yihK4+dMYv7LDYfYvjyzLjwT38lQj/pIdunfvI
 iYCX6tozKHdpppuHt+apR6nKPviReDrjPeRIAiTTOXmMaF98JeRmHbVlPvH1AR36oj4D7uEaVPb
 rzzxjAtmXrkXVFq/U3NfnlAIY9qi/XLsajzt+WtJb5GtYdNn8s8u6eI0lcdAXH9XGvdlz482uMb
 tvvAZVnUnekRmp/AnVYgfRLLN8UcbLHTYwijTrRdEa1oTx/In3X+/xUgEV4A/YfSFwXVvEBYd37
 mPkVsS3TkJSG94HrhpN7+9/CmgkGW1T150yUhjx/5Q1S/vHzjH+e3Shc5s2x53+VX9+p6g+/d8j
 Oltt4fXGW/ePFqbxYGwBaWlDJLyOk8rcIwrBVzRT4SSYQ2L4GCUqlXokHaJ/YJSczMXimMi8Vn8 O65anQJVfR7FLEA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Content-Transfer-Encoding: 8bit

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 88 ++++++++++-------------------------
 1 file changed, 24 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index e4d9006b59f1b975cf63e26b221e985206caf867..bd618f497a3f0e1d08e46e98deea3de7d7db8bd5 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -454,62 +454,6 @@ static void ti_sn65dsi86_debugfs_init(struct ti_sn65dsi86 *pdata)
 	debugfs_create_file("status", 0600, debugfs, pdata, &status_fops);
 }
 
-/* -----------------------------------------------------------------------------
- * Auxiliary Devices (*not* AUX)
- */
-
-static void ti_sn65dsi86_uninit_aux(void *data)
-{
-	auxiliary_device_uninit(data);
-}
-
-static void ti_sn65dsi86_delete_aux(void *data)
-{
-	auxiliary_device_delete(data);
-}
-
-static void ti_sn65dsi86_aux_device_release(struct device *dev)
-{
-	struct auxiliary_device *aux = container_of(dev, struct auxiliary_device, dev);
-
-	kfree(aux);
-}
-
-static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
-				       struct auxiliary_device **aux_out,
-				       const char *name)
-{
-	struct device *dev = pdata->dev;
-	struct auxiliary_device *aux;
-	int ret;
-
-	aux = kzalloc(sizeof(*aux), GFP_KERNEL);
-	if (!aux)
-		return -ENOMEM;
-
-	aux->name = name;
-	aux->dev.parent = dev;
-	aux->dev.release = ti_sn65dsi86_aux_device_release;
-	device_set_of_node_from_dev(&aux->dev, dev);
-	ret = auxiliary_device_init(aux);
-	if (ret) {
-		kfree(aux);
-		return ret;
-	}
-	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_uninit_aux, aux);
-	if (ret)
-		return ret;
-
-	ret = auxiliary_device_add(aux);
-	if (ret)
-		return ret;
-	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_delete_aux, aux);
-	if (!ret)
-		*aux_out = aux;
-
-	return ret;
-}
-
 /* -----------------------------------------------------------------------------
  * AUX Adapter
  */
@@ -671,7 +615,13 @@ static int ti_sn_aux_probe(struct auxiliary_device *adev,
 	 * The eDP to MIPI bridge parts don't work until the AUX channel is
 	 * setup so we don't add it in the main driver probe, we add it now.
 	 */
-	return ti_sn65dsi86_add_aux_device(pdata, &pdata->bridge_aux, "bridge");
+	pdata->bridge_aux = devm_auxiliary_device_create(pdata->dev,
+							 KBUILD_MODNAME,
+							 "bridge", NULL, 0);
+	if (IS_ERR(pdata->bridge_aux))
+		return PTR_ERR(pdata->bridge_aux);
+
+	return 0;
 }
 
 static const struct auxiliary_device_id ti_sn_aux_id_table[] = {
@@ -1950,15 +1900,19 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
 	 */
 
 	if (IS_ENABLED(CONFIG_OF_GPIO)) {
-		ret = ti_sn65dsi86_add_aux_device(pdata, &pdata->gpio_aux, "gpio");
-		if (ret)
-			return ret;
+		pdata->gpio_aux = devm_auxiliary_device_create(pdata->dev,
+							       KBUILD_MODNAME,
+							       "gpio", NULL, 0);
+		if (IS_ERR(pdata->gpio_aux))
+			return PTR_ERR(pdata->gpio_aux);
 	}
 
 	if (IS_ENABLED(CONFIG_PWM)) {
-		ret = ti_sn65dsi86_add_aux_device(pdata, &pdata->pwm_aux, "pwm");
-		if (ret)
-			return ret;
+		pdata->pwm_aux = devm_auxiliary_device_create(pdata->dev,
+							      KBUILD_MODNAME,
+							      "pwm", NULL, 0);
+		if (IS_ERR(pdata->pwm_aux))
+			return PTR_ERR(pdata->pwm_aux);
 	}
 
 	/*
@@ -1967,7 +1921,13 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
 	 * AUX channel is there and this is a very simple solution to the
 	 * dependency problem.
 	 */
-	return ti_sn65dsi86_add_aux_device(pdata, &pdata->aux_aux, "aux");
+	pdata->aux_aux = devm_auxiliary_device_create(pdata->dev,
+						      KBUILD_MODNAME,
+						      "aux", NULL, 0);
+	if (IS_ERR(pdata->aux_aux))
+		return PTR_ERR(pdata->aux_aux);
+
+	return 0;
 }
 
 static const struct i2c_device_id ti_sn65dsi86_id[] = {

-- 
2.45.2

