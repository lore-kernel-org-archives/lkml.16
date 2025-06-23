Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754161EF394
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750661104; cv=none; b=fsoxygw95o2WvHZmEN0gygSqTUON9pDxNxdwF9goUQ8vFNOqyxUjjL1Tko3dplCxuwBcYBTTVdA8Dwx5peeoeUsr2Z8NGmyuui5YuG6BjXrROlkajjI57BQ47wPv3W2PJeIKaWGaKIUdi5JslbQR5obrz2f/fzqVmSt9341217k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750661104; c=relaxed/simple;
	bh=dQKTaoJFbvazyp9Q1oPhqhjuJEvK2SxhdOtUQkhZwj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PquDkYxNxiiPY22IMuZtrzlxhqG1qpPCXKdQLw5BPLZ0FXQ07UU5OGWlgmE7RGbQFpy8jkv7bkFaUwTCAQXkdwFE3CPCdiDpGgtgvwIBz8SNzkTs4xaYytpDOK/9E62lTy9wWZcSK/5p10UgmWS1nQqqZ//AC22nV1ud7rgxdd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=PHZY3hmZ; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="PHZY3hmZ"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad8a8da2376so594782966b.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 23:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750661101; x=1751265901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pA+Rs4BuhZMiD1TZXkrsma5mRVhifaFNd7IRaZKnnaY=;
        b=PHZY3hmZQn71mQMQSJ2zBh6tgGFCeqIjhjvYBbBSlEknVYr7q3ZBRlViv9fl3hIFrZ
         AVMlgjTLwtuOtF/TfNWcH+ys9izx8EcFh5+Sf76wmezjhZe/VcaWndiP3o9dzs1ll3/Y
         i4b5l09UVs+ESttsJgy5tS6+1XJcvrownNcR2MvH9vtfjJpL30Zs6b2jI9apEE9P/vkW
         YKH0540Yg1QbLbgNB+cULzriOrZaeWBXYzM2qalYG1+iptNu9QGTWPcsxWgQdU4iQb12
         1f2QejLzVDjfYN3jQxCjWIwk6aa5IBvuJm6UbHdUpaXxG446x/Kz22skauoyivsnt9+n
         5afg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750661101; x=1751265901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pA+Rs4BuhZMiD1TZXkrsma5mRVhifaFNd7IRaZKnnaY=;
        b=wWo54QESBokmaOf7yGKvvhnihyw4XC8I8vTI/H9tzc45tuJHpRJq2uG5It9m9LbaFH
         dInSp0R2MocuknbHr0aqCxhN8vAWOto/XWC2IxUM0qpL4d+4hlzqFW1Ts5hEiVfgML8u
         xfnM0eGME6Sa+GfhnrYCHV29sh4RxxO2T200Zlcdtn9zxdxG2gUKqId64mUQMEIIgSXF
         nm8060FydhOUOysILyanw1aWVLn0kVAS8MqYhvo3bQ4hVDWHXuKLwM0CPb3fRsuwQEns
         OuJVgy0uvhMJGdBJQrewO2v1YJUScZiSXW3utItDfX8IFYhKWv30k4fAZqlm+Y9YgH72
         FO1g==
X-Forwarded-Encrypted: i=1; AJvYcCXNw+bO346Ng/iBcwki1W/u9ZqIw0AUJXDkWrhTVMWlxpnoxCzPRK/TC07TqqjMa39xlzujst5S2FhovGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWjKmRBWT1OHDuXuQdGbrnuW2iaawxyuISUG2m50pFLSg1G4n/
	9WEv5PZ3nYgcAkq2ciXCuB+VgrwHNbjZhpcWGRDGfQuPhEwVgqt9sd0dU2htMl6/ZpY=
X-Gm-Gg: ASbGncsh0+Vb3M4X+ZfXrDbeLpeZcA4ofjQqBt5MhWrk8fkMkyA5puqSLzPkr6hBihp
	QxlZsrwdTWbJcvkuEcidajs2dwUzZmvV/y5vmjvmqndhU/P2QShVV6Fxqq5CZyVz+CeHv7kwVQJ
	gCvWvallMuLXlrp4fSsY57mbzSrFFePoB10f12e8JsP14EB/iVJ3moMR0y+a8ZXqqw+lLwL9wCF
	wJrQj3QT16/i9wl4rkjQ/WkD9y23RiJavf5Kfay726JEZ3CMAhZGmkn4MkSDoo8cxFg5kK5Oax5
	nvIYCI5DAujt38wfnlqWHFDI266OcSaNlWaQn3Fk4aV3QvjI4lzj9Q5Jo/s+JlW56BYQLtsMsez
	3BPp6oTds7KCX/BzurlxrCdd8tGYjxMEU
X-Google-Smtp-Source: AGHT+IEfG/ia8MXFZvWV63xW+2WDm+wmIGfKUT095APiD93iFktsSDhtmQlj2MFUGu0vl47bkbkh1w==
X-Received: by 2002:a17:906:6a17:b0:adb:23e0:9297 with SMTP id a640c23a62f3a-ae057a51258mr1096084666b.17.1750661100690;
        Sun, 22 Jun 2025 23:45:00 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ee4ce9sm659258266b.69.2025.06.22.23.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 23:45:00 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 23 Jun 2025 08:44:49 +0200
Subject: [PATCH v2 5/5] fbdev/simplefb: Add support for interconnect paths
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-simple-drm-fb-icc-v2-5-f69b86cd3d7d@fairphone.com>
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
In-Reply-To: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750661095; l=3530;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=dQKTaoJFbvazyp9Q1oPhqhjuJEvK2SxhdOtUQkhZwj0=;
 b=wtrWkFVrQxjznBKN4+vCIM0v5OnZoKSUD8HoOPwct17rZ2GLmAHgCNrxQRvIjIg0dfn6SBO3p
 fX8nbdxIEsCBstf3uSct7cS/lYQd1s5Ww4P7FLDYTDBXJ1Mt6boZXXC
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Some devices might require keeping an interconnect path alive so that
the framebuffer continues working. Add support for that by setting the
bandwidth requirements appropriately for all provided interconnect
paths.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/video/fbdev/simplefb.c | 83 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index db27d51046af5cc3c46a0bc81ad9d9ed9a0783cc..b7e2f2374e3149866fd6f1803931e7f34dbbd75f 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -16,6 +16,7 @@
 #include <linux/clk.h>
 #include <linux/errno.h>
 #include <linux/fb.h>
+#include <linux/interconnect.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -89,6 +90,10 @@ struct simplefb_par {
 	u32 regulator_count;
 	struct regulator **regulators;
 #endif
+#if defined CONFIG_OF && defined CONFIG_INTERCONNECT
+	unsigned int icc_count;
+	struct icc_path **icc_paths;
+#endif
 };
 
 static void simplefb_clocks_destroy(struct simplefb_par *par);
@@ -525,6 +530,80 @@ static int simplefb_attach_genpds(struct simplefb_par *par,
 }
 #endif
 
+#if defined CONFIG_OF && defined CONFIG_INTERCONNECT
+/*
+ * Generic interconnect path handling code.
+ */
+static void simplefb_detach_icc(void *res)
+{
+	struct simplefb_par *par = res;
+	int i;
+
+	for (i = par->icc_count - 1; i >= 0; i--) {
+		if (!IS_ERR_OR_NULL(par->icc_paths[i]))
+			icc_put(par->icc_paths[i]);
+	}
+}
+
+static int simplefb_attach_icc(struct simplefb_par *par,
+			       struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int ret, count, i;
+
+	count = of_count_phandle_with_args(dev->of_node, "interconnects",
+							 "#interconnect-cells");
+	if (count < 0)
+		return 0;
+
+	/* An interconnect path consists of two elements */
+	if (count % 2) {
+		dev_err(dev, "invalid interconnects value\n");
+		return -EINVAL;
+	}
+	par->icc_count = count / 2;
+
+	par->icc_paths = devm_kcalloc(dev, par->icc_count,
+				      sizeof(*par->icc_paths),
+				      GFP_KERNEL);
+	if (!par->icc_paths)
+		return -ENOMEM;
+
+	for (i = 0; i < par->icc_count; i++) {
+		par->icc_paths[i] = of_icc_get_by_index(dev, i);
+		if (IS_ERR_OR_NULL(par->icc_paths[i])) {
+			ret = PTR_ERR(par->icc_paths[i]);
+			if (ret == -EPROBE_DEFER)
+				goto err;
+			dev_err(dev, "failed to get interconnect path %u: %d\n", i, ret);
+			continue;
+		}
+
+		ret = icc_set_bw(par->icc_paths[i], 0, UINT_MAX);
+		if (ret) {
+			dev_err(dev, "failed to set interconnect bandwidth %u: %d\n", i, ret);
+			continue;
+		}
+	}
+
+	return devm_add_action_or_reset(dev, simplefb_detach_icc, par);
+
+err:
+	while (i) {
+		--i;
+		if (!IS_ERR_OR_NULL(par->icc_paths[i]))
+			icc_put(par->icc_paths[i]);
+	}
+	return ret;
+}
+#else
+static int simplefb_attach_icc(struct simplefb_par *par,
+			       struct platform_device *pdev)
+{
+	return 0;
+}
+#endif
+
 static int simplefb_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -615,6 +694,10 @@ static int simplefb_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto error_regulators;
 
+	ret = simplefb_attach_icc(par, pdev);
+	if (ret < 0)
+		goto error_regulators;
+
 	simplefb_clocks_enable(par, pdev);
 	simplefb_regulators_enable(par, pdev);
 

-- 
2.50.0

