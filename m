Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4152836A2
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750415501; cv=none; b=t1u+vyGicotVpKqsoojl9p3JmtT5r+SEF3hMvMDo6zg28k6cBXzqnCiSnNuywHMoTtJWOEy9+zVDgoHd1qmjbCkeq+eDNC0S1gGMZtK7hEaRRWfX2q5y22SS6BKsiJZpVP0J3qGXL7hgH4A2EEAmIjQwBH4ZAnuhvvvJ1ytMB0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750415501; c=relaxed/simple;
	bh=aUgglQRYn7bTkMkwBI8lk1cjN4alca4VUVFQsxvzbtU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RlRG0JKAu8mdqScdIFqZUrC7pJf6VMkgtlpANh22mHq+QtsAFDz5romc8tV9BPnEKXaKD9JhLtL5jNPHBBSrcq9QGezS+13xNtvfnUInIqpuKoG5Fyx355XspFzNrSVlhXL6NJ7iyldyBMD/i8HsVgVZ/8W1rusuSmd08jjjXl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Ef3hi0+N; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Ef3hi0+N"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-607b59b447bso2728759a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 03:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750415496; x=1751020296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rx+JsSfgW45704ajaCZP3Z6JsbN0dOsJusfnG4fSCwM=;
        b=Ef3hi0+N+Z5WWS/agg0jMBcgMKFfGfwH0xEmeaAAB+F68900rK3SVA8+qHojPbj1vZ
         9kKAA57TBZCuXc9TtEPev9+7udaZt8nVu6WbguIts1TCaqISdirKeEA5df23r0cbDzZG
         wm2mpvCiNeadzcJ9XhEMPqfGFE956uiqRL4P1AMQZCBEXqZ5mlyYU07S2fpMP3a/99a0
         jweoa3yIREfEDV/ARYmJja/4+IcGIATA/+fsBzg62Rzx4F+rV46YXxmJaYj5xKUfbncl
         V+aw5ViNlZ13q67WGo0PXRvSbLKj07mXaH2Q5oqhARu3RnZ00edtuE2oBHYFTGDumtyR
         apVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750415496; x=1751020296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rx+JsSfgW45704ajaCZP3Z6JsbN0dOsJusfnG4fSCwM=;
        b=vZWmiiscm1HljhtZQW7Fd+yf3KpM8eY5rQf6LjXD/za/AUJKDv1cnB2tIUqRoV2tiH
         dI4sJiR0mByb61uQRROrmaYD0PlZgFjDTqxqvOcEvNpSt7XDFRvTyJ2fuqwMJmKXXGcV
         h8sYuQvZSuvW9yJYkO4UHTEBV2u4sX8Y0X6GwY/oMcTI65MI42QgP1Tv3ia9vNTIKIAz
         2ypp4BPe304RaOz4jjwEUHRaOIh5I91or4m2SEOUVxcb9iSBGWCq7pVFJCzjZPN5FkSV
         o5mtl7kDhZh1e9k3kPi713hy7FRSqDB9Cjol5DsIY6NU+H4anGyLfdPLFmVxbxtI8ap0
         +r3A==
X-Forwarded-Encrypted: i=1; AJvYcCWUCtswM+qe965ZdUe+lheOzTn0iD+VFo7EEn4Dsh+BQTP1quwGrdTlzgB8zyX0Us2ci0n5BWpgrWQmHRA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjh70e0TY1jgcf3AM3cneq7WvwSihlKzknYiNHAqQ/iuW3FPPG
	qwPDLU7ONZFgwb6661CUeKiEmM/i3pcOCqmBqZ9+7HiNh4CgzcohQUAsdxdmJaU0QfE=
X-Gm-Gg: ASbGnctPZyv836q5B10piG35QM3mIu8Abjnf0U34P+gGSKlUtP2+xR8m/CKQ1TeEL5l
	2WUS7xk2YS313HJS55veeJl4frGyGmiIgfIAOVxXwUIbFYjelj2hVBtXUHWwy+gVlICBVE/al8Z
	iiUqRFlTo3cMHsD/oNPokjGOKzkMRIf4dlIldmCy2Il33Otlr/nSYGDGlW3r+n9OopVIMM7K4VW
	0CaqYph6oLxorWlu2gcdTY+a6KJcs6brRH2Ff75QLW2ZCwJybqakvLuRIJY3qIKXAYp3qIb439n
	S0I/z9ZYKE5swuF1EJ8mpelV9Nc8SSxa8JK7cdbIZbbt55IqYpwLc/6tX00BvERq7de8jZshhAR
	1wZEBrxbMNXtDUq0PRDZ5SY75scliflmQ
X-Google-Smtp-Source: AGHT+IFojvse3lqX+gqKA0HNP3nkQ76ONpxVInRK6fKU0+nbCKCU4x5vFpvTAQSlT7CHl0bt8sS96g==
X-Received: by 2002:a17:907:3ccb:b0:ad5:4440:23 with SMTP id a640c23a62f3a-ae057f21fcdmr207244766b.50.1750415496144;
        Fri, 20 Jun 2025 03:31:36 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b6f5csm138047366b.122.2025.06.20.03.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 03:31:35 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 20 Jun 2025 12:31:27 +0200
Subject: [PATCH 3/3] fbdev/simplefb: Add support for interconnect paths
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-simple-drm-fb-icc-v1-3-d92142e8f74f@fairphone.com>
References: <20250620-simple-drm-fb-icc-v1-0-d92142e8f74f@fairphone.com>
In-Reply-To: <20250620-simple-drm-fb-icc-v1-0-d92142e8f74f@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750415493; l=3509;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=aUgglQRYn7bTkMkwBI8lk1cjN4alca4VUVFQsxvzbtU=;
 b=q76OcxFnlNqs8zk3v5IaY0TIGBj4kLjAwREPukb0aGjW2/MaP/fIm50kqwa8fh+iuaE1x69fK
 +4EOmwW3pikCwZOl7W1EI5MmfpyvVdzGesSDUA4icHlf9y6PepTL2jt
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Some devices might require keeping an interconnect path alive so that
the framebuffer continues working. Add support for that by setting the
bandwidth requirements appropriately for all provided interconnect
paths.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/video/fbdev/simplefb.c | 83 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index be95fcddce4c8ca794826b805cd7dad2985bd637..ca73e079fd13550ddc779e84db80f7f9b743d074 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -27,6 +27,7 @@
 #include <linux/parser.h>
 #include <linux/pm_domain.h>
 #include <linux/regulator/consumer.h>
+#include <linux/interconnect.h>
 
 static const struct fb_fix_screeninfo simplefb_fix = {
 	.id		= "simple",
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
 
+#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
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

