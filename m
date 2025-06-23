Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706F71E834B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750661102; cv=none; b=TWMT7ViKG5fWKNeRn37dG5yzdMrUxPVeV1qzp/t1VClZ9Oe0gBEQkxO2KieEosw/3307eB5TOGtzvjb8W10IDteOWoZhE1BiWhJK2zi/cC6etTEkGgni29HvfDYuSw13bO+RazfKsMGVOGaccq9RGlJxhlSsdVcNbgZY+1poOZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750661102; c=relaxed/simple;
	bh=WFGg8eJbYpqqu4c1SsExqGZhg0kBCQL20U67P0aKA3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nj90M3krFRzD7QytFIpzSAmfUtjJZJjHHPsYuROiuoKob680IuJmM1LfV2+rhXCYGNEmSQXCKerNrF42wfV7UJALiF4hj9KDAlc2aKQd+njHQLWw1vusWo30tNIU2mgKGlQFi0R5f3I0yObpiSpEpw4rdn9SvCJ+Zl5Blha4XE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Bsjuqx3j; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Bsjuqx3j"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-adfb562266cso684972966b.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 23:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750661099; x=1751265899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uTpIpbsJT9oUXdYXUp1B/jgdIiWHQ6mEsslmG5LurCE=;
        b=Bsjuqx3jum8oP5iT0t8fOWb99ofC0hhCl+eoDrmXznEAHRLSqzv1cYu2YSrEwEK66T
         ZVx6Jc12n6EKwnHi4/8AkQQneFafn8iAVXDwDsR6LgE1N8gdw3QlG3W4oRPx34K0Mpv7
         3UDKrYU/l60nGSsoL5NkBxAQGDAKaxyPWh5PUFUUVfKoyOPdFDugzXDBqZ8Qi9DUjrN1
         OlbapX0uBGFZoVQQbbrmwm81PVqYtyYKOEUXBMMy/EvRvniaVA8eOeUTWH1wW9naYAjs
         2B6m98W1YfPSHqEWo87nBH9BCoE/x/jlAvRcH4mp7Zk9NiRGOm4kChfYnm4sVkhgv8JP
         zUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750661099; x=1751265899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTpIpbsJT9oUXdYXUp1B/jgdIiWHQ6mEsslmG5LurCE=;
        b=V4X5wl69N3uo1RsP4JS+6kmvRhqNUWmn8dG1L6tpp1hlPds40loP+Bi8AdPhloSAvd
         TJRV46JUMVTdoN+TGNDCuXTpdPAwuQGkVrTVHCmpb1pB1nantybe9KdbkWK8ATsCx17F
         iJf4Fs0+b/N5hBnD0nAkT3G1IpaxGJSGULeAXGU4sISSJXI9UP11GsKpD4s+ohOiKczY
         DmBtNB8B1uLPdVySGtVu6nmHfx1ghtiAys5BgzsXlT3EBOwjjviVjMbZ4thjAeU+PVEN
         l/VbE0q2DpIbYkFAhQtoUrJdaFURjb/g+HbrAY+eIKhXPkTITEswQ2HbpcOcqrks3PHr
         ARNA==
X-Forwarded-Encrypted: i=1; AJvYcCXz2/baJ59jh16eKFnjj2HwVF0q1soJYbQHtpykeSlRVfoShjP0bm5o0bg6tOhltpSnDwklfl17H+Vu6Sg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3mv/Y6KfqoGvpsJsvE6LxrDtOxi3c94rpwDidxBNByAtmM+tA
	5f1trWtLDpkzaX1XS0DrrPPDN4srwhcvT3BHe7+3ibawWEa/JW4RXuewwtR0WbYtkn+wf1sK0zq
	DWbHe
X-Gm-Gg: ASbGncstzXazPaMQzfiDowJlErGrL35lTTlm8BXsY8sROy2Tv3uVGrwD23qCzsMeTjU
	g4matwutlYiSa36AgkfyYvogq7pGzCgaJes4685Sy1txiimR6EpXAYVtIgESK2iSTneIgByQ/Yi
	AcphZnS6fpoMVCNg4lrseAPLVIqwRXzz/d2c8CidOZcXf0M7JnAxXllJOhRDsBhx/MuDMMuE5oD
	UdFY1F4OL34+riZcsewutigMqTO+NOAsKeLDGySTF2Rgsmndwwq+KUq+EE81M8DRQfCUbnmOZUu
	mkYTiylqMO2PXU6BmvikLIMlUsV9dtvbuZt9zY3nzukkbXxyNHjxFFvFY42dmP6B4xM6KTDYSBi
	4/KH9z81SPk3/MTKF9uhY0xtZnIuJGs3A
X-Google-Smtp-Source: AGHT+IFz7kDahVsqdTj+a5KcPoxkKtMDN2hTfcr/X8jn9acL7zz5DDVx99WzLXxoM8vxkoixi21RhQ==
X-Received: by 2002:a17:907:3f85:b0:ae0:6620:7f with SMTP id a640c23a62f3a-ae066200670mr917673166b.44.1750661098692;
        Sun, 22 Jun 2025 23:44:58 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ee4ce9sm659258266b.69.2025.06.22.23.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 23:44:58 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 23 Jun 2025 08:44:47 +0200
Subject: [PATCH v2 3/5] drm/sysfb: simpledrm: Add support for interconnect
 paths
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-simple-drm-fb-icc-v2-3-f69b86cd3d7d@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750661095; l=3575;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=WFGg8eJbYpqqu4c1SsExqGZhg0kBCQL20U67P0aKA3M=;
 b=KSAo2uksGIm/+/BS8fjSyT+6mi+LRF2bl6GllAefMrpSwVVulFaiF5Qh5JwSjHsRXFQF/0C8X
 JOy9miznMoGB8qCL+OMaXK0deqERRAc76ov+tdX6Ihv+2jk92C4Abk6
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Some devices might require keeping an interconnect path alive so that
the framebuffer continues working. Add support for that by setting the
bandwidth requirements appropriately for all provided interconnect
paths.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/gpu/drm/sysfb/simpledrm.c | 83 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index 349219330314e3421a6bb26ad5cf39a679a5cb7a..47d213e20cab1dd1e19528674a95edea00f4bb30 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -2,6 +2,7 @@
 
 #include <linux/aperture.h>
 #include <linux/clk.h>
+#include <linux/interconnect.h>
 #include <linux/minmax.h>
 #include <linux/of_address.h>
 #include <linux/of_clk.h>
@@ -225,6 +226,10 @@ struct simpledrm_device {
 	struct device **pwr_dom_devs;
 	struct device_link **pwr_dom_links;
 #endif
+#if defined CONFIG_OF && defined CONFIG_INTERCONNECT
+	unsigned int icc_count;
+	struct icc_path **icc_paths;
+#endif
 
 	/* modesetting */
 	u32 formats[DRM_SYSFB_PLANE_NFORMATS(1)];
@@ -547,6 +552,81 @@ static int simpledrm_device_attach_genpd(struct simpledrm_device *sdev)
 }
 #endif
 
+#if defined CONFIG_OF && defined CONFIG_INTERCONNECT
+/*
+ * Generic interconnect path handling code.
+ */
+static void simpledrm_device_detach_icc(void *res)
+{
+	struct simpledrm_device *sdev = res;
+	int i;
+
+	for (i = sdev->icc_count - 1; i >= 0; i--) {
+		if (!IS_ERR_OR_NULL(sdev->icc_paths[i]))
+			icc_put(sdev->icc_paths[i]);
+	}
+}
+
+static int simpledrm_device_attach_icc(struct simpledrm_device *sdev)
+{
+	struct device *dev = sdev->sysfb.dev.dev;
+	int ret, count, i;
+
+	count = of_count_phandle_with_args(dev->of_node, "interconnects",
+							 "#interconnect-cells");
+	if (count < 0)
+		return 0;
+
+	/* An interconnect path consists of two elements */
+	if (count % 2) {
+		drm_err(&sdev->sysfb.dev,
+			"invalid interconnects value\n");
+		return -EINVAL;
+	}
+	sdev->icc_count = count / 2;
+
+	sdev->icc_paths = devm_kcalloc(dev, sdev->icc_count,
+					       sizeof(*sdev->icc_paths),
+					       GFP_KERNEL);
+	if (!sdev->icc_paths)
+		return -ENOMEM;
+
+	for (i = 0; i < sdev->icc_count; i++) {
+		sdev->icc_paths[i] = of_icc_get_by_index(dev, i);
+		if (IS_ERR_OR_NULL(sdev->icc_paths[i])) {
+			ret = PTR_ERR(sdev->icc_paths[i]);
+			if (ret == -EPROBE_DEFER)
+				goto err;
+			drm_err(&sdev->sysfb.dev, "failed to get interconnect path %u: %d\n",
+				i, ret);
+			continue;
+		}
+
+		ret = icc_set_bw(sdev->icc_paths[i], 0, UINT_MAX);
+		if (ret) {
+			drm_err(&sdev->sysfb.dev, "failed to set interconnect bandwidth %u: %d\n",
+				i, ret);
+			continue;
+		}
+	}
+
+	return devm_add_action_or_reset(dev, simpledrm_device_detach_icc, sdev);
+
+err:
+	while (i) {
+		--i;
+		if (!IS_ERR_OR_NULL(sdev->icc_paths[i]))
+			icc_put(sdev->icc_paths[i]);
+	}
+	return ret;
+}
+#else
+static int simpledrm_device_attach_icc(struct simpledrm_device *sdev)
+{
+	return 0;
+}
+#endif
+
 /*
  * Modesetting
  */
@@ -633,6 +713,9 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	if (ret)
 		return ERR_PTR(ret);
 	ret = simpledrm_device_attach_genpd(sdev);
+	if (ret)
+		return ERR_PTR(ret);
+	ret = simpledrm_device_attach_icc(sdev);
 	if (ret)
 		return ERR_PTR(ret);
 

-- 
2.50.0

