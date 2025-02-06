Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC271ACEC7
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738866227; cv=none; b=temKCCJwVffwWLSYIIKZ6wJnTu4DXHYB3GY/vTJY+5TDRfpLcX7J2WocYpEU4PY/V+SyEoSFBy1nV4F7+fE0PXRRZ9F0YR6JxnjIXkrZ2TPj44QcRf0Dm/AVy10UpT6jz08p6zSvLwPfBJV/elR6ZiSGzaKjDxrUcSb6MhrvyJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738866227; c=relaxed/simple;
	bh=Udk5nT3zOhzUhLBcSwJhGyb7zx4j6w6RjAkkkWx25oY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VymCpgiONHAHItF7HqzfjL6P6lj3mFxtP2TXDIPM0OS1HTVOqbgpVDMAtXtrHIjhCVdcrhCU0I5APiSAf/vZF8/dMjLA8WFOBV3LOr0WLrJ5qtx344T/mIUmGLgjU2UigOKDrj5SkzygEQxjDa4UhvaKwC8xY37IPr3TKwb2MBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=TJUBwIve; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="TJUBwIve"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43634b570c1so8979195e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738866223; x=1739471023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dr7K//uyab/fqg59KO812BXRhGQFW8v0mYDCcCd2z4=;
        b=TJUBwIveWjxeREuZYhw6miA/NsDNFzOKVwockNeDWvhdZHp0Vq88bBhjSTKk4M4adq
         nSbeeGie0o/RBcUP8xuKkx2HfYDoVJGZU2H6tc3mPkeyJ2b5wf62ViJxVdHAL5R27Yh0
         MDoXccsvpNGUtXDg5ZE7BRemAd/1dV1TNWazTjNnRN2l3NBGay95Sm332MExZjRd5iUW
         NecZxKQxpH68fLKOsEUTRPOQcL2TtPvPWjjPRnKd5IJbbrnXvnhbk7ZDxBFgp13i5xKm
         XQs3DV+lecu5OkZyhX5srHEqj+NSQ4XdbE8uizcEFeGPR8imUGlY2wOiWoww0pxgKw9d
         Qsmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738866223; x=1739471023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0dr7K//uyab/fqg59KO812BXRhGQFW8v0mYDCcCd2z4=;
        b=JpPvyjzJVvCg5hSJJH3WPE0fCFQ9uLiVjuoLhASb/FvHGPfmT6TbovqAoeY8ILW5SX
         Nvp5pU5Sj1BHU7yqfYmDjYnThtT17FoTbCNtBlH1s1r7pfIwJT8jVmHwknLpe7J3PVZa
         BoDr3BJwu1iGUbuJecAppJ+syQxl4k4K6EMzfTbatFF0kOt6qczkVQM8HgSNjMZyTP+M
         w461FFfu8sKSnrNGn/5a4NxSbsfrBck3XIxY2UH5z7lTB7KAPqgx/No+cTu1M2oL09uS
         GeQBvY1WNd215mPOEaqltbDk95WczxALNSAfotVgVFilNMIHEy3Gs0it/4g7D3ks9QOF
         MOQw==
X-Forwarded-Encrypted: i=1; AJvYcCVGqJlBum7zm8P5qkb1FkRNgxXPYcI1oZ2do/A1CghVqggehyOQHcNRJ7zYHCyBtKzcmT9+k9lv9SwP01w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI9b5aC7uKNyxYbOu0ZKgvtgiokf/GJxhwxgZ2Fcy5ZqDyK0gZ
	iWSvfhHOXBE9ktS0xDFyescm3jDtZSgSEYtJsgpJQ/+/thD9dQdFTRef0zd6nVM=
X-Gm-Gg: ASbGncva7k/L7CudLJuvLLUz5GrFDoY8YAlZ1opIsI/TJi8pm6zf1WiSmkIx9WUHPOd
	Jj7P9ACgkx167KoH++L4p9fCgmUZzh9JTR0ulnGEbLWoilKLj3lNBS4QN8s0QjLm63GwduRJNCq
	m2Um7epM3008vLgSF7nCmUfSWsTq0VyJdGv8omB02SrUEVXr8asX/If5HT/7BHnK1MYAbZCnV4T
	VtUt1SMGOf5CkENBD27ZX4px+IGFT4/WmN7EEug7PBTs0tIL5EOKyrB9OUOhXTYjSWjlN5upXKb
	cpdxCRckTwrTA5RgRg==
X-Google-Smtp-Source: AGHT+IHY++qgicgfSLoTd3fT03vxs7G/UPa+gyYqgZhlWCnDCydfaxDIJRCfQ4ZOWUZDrqb2mXRchQ==
X-Received: by 2002:a05:600c:4703:b0:431:547e:81d0 with SMTP id 5b1f17b1804b1-43924988c5amr5024875e9.11.1738866223273;
        Thu, 06 Feb 2025 10:23:43 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:a0d6:294f:5246:28d4])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4390d94d802sm66111445e9.12.2025.02.06.10.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 10:23:42 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] clk: clk-imx8mp-audiomix: use the auxiliary device creation helper
Date: Thu,  6 Feb 2025 19:23:16 +0100
Message-ID: <20250206-aux-device-create-helper-v2-6-fa6a0f326527@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2872; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Udk5nT3zOhzUhLBcSwJhGyb7zx4j6w6RjAkkkWx25oY=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnpPrOX157nQq0f4MJRtXrV9MVQgvmMHfv+22/x
 TtnUaZigpqJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ6T6zgAKCRDm/A8cN/La
 hdApEACvlY8EgS1iQjIlxfMdHCxrZoQiZCQD+uvhkOr1wEBpepiLPFgsyMFbh1IrgUJ2422mp/7
 i5rlWSU7gcb1Wr1DOE35AYkNRwNGhqRqfKz3oUxB9E9RJX3OYFZDbgRAxo+ajCiaO0DSQIaWSuR
 WOj+K8d4gvNEspjj2x5XdFwbNVx9+n+jlk8ztamRmd7ZtQrt6uD8oWFq4ACJ9+uQphQIj66twOr
 kdeY9MJUOPVFOKgHA1cQ3DlvedHRKGOsiep+dXeiAMb/1ukJiYfy7wYXBhFXhDDiMhdbm2Zkz/i
 B/cxoKUzPLztHIFz/FCpRnsRMkLeCPRtIB9lGslasT/HcCMTaSsQ/pGNWccGtkUMOwz9i0LzFtz
 65F8Jx1E2rBFGzvZM/bjDj4BrvRtMbd2c8dN6lqY8lhzw+8gqAjuV2DyDKdYNeJ7GjpevxGNMau
 m0WZ/Td+yPRWQ6KpH2DJtnb/qS0r+9jIp77Hd3fnx8c7wmA5EmwV3jFjt0E9ZPsuH+v2eq4D0i5
 ciTQmXjYehnqocnxzqTDMKIiybEA2XRwg9TGcmjXBb+K5NJKIlSWbcG8EBTb5uI09Sj5euSjJVv
 t994jsqs1GzpPEjjzrjl6xDmBzCcXYvprkRT8l3/oU4lKrllG8N7/6oVN4tibYhSEKWhl974NGg 0KbVFwJwKjys3qw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Content-Transfer-Encoding: 8bit

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/imx/clk-imx8mp-audiomix.c | 57 +++++------------------------------
 1 file changed, 7 insertions(+), 50 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
index c409fc7e061869988f83c7df3ef7860500426323..90e69e253ad5a30cd2a3cb3b63ebe85be1e6b059 100644
--- a/drivers/clk/imx/clk-imx8mp-audiomix.c
+++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
@@ -228,64 +228,21 @@ struct clk_imx8mp_audiomix_priv {
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
+	adev = devm_auxiliary_device_create(dev, KBUILD_MODNAME,
+					    "reset", NULL, 0);
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
@@ -408,7 +365,7 @@ static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clk_register;
 
-	ret = clk_imx8mp_audiomix_reset_controller_register(dev, priv);
+	ret = clk_imx8mp_audiomix_reset_controller_register(dev);
 	if (ret)
 		goto err_clk_register;
 

-- 
2.45.2

