Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A741E5205
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 21:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744235098; cv=none; b=W+NTD/ogctO8UFSVznoRHMnyEUEyW/N1nWG80uPPyhBTrifm5Dc+/EzEb3VmYxJWRyy996rYpx5gr9fq0u6zHIUQEb90hkFn5Zjfw2Zmwgr46PmRTWwNQ7GLAAIGng8Sejmvs0IivBDwXXDa4gm2Ut8l7BcKvl0GHQRfRGk/qbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744235098; c=relaxed/simple;
	bh=6iqL8W6yJs776wMoRvc3oR3Mo1hXqNmC4a70jGdwqgk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rAvH5V3r75YZGeunJSkCYyhxG4BKJKuRcB0ptLLrB2T+hy/IE4GGDU7dTTciy+SG+F1il+dZACe7opDVD4q52WvFxzZpiJTsqKMUoU8+2tVaGCAe/xJgbFjUvXxROFQjNZxxUlJeM3aleXEe9srv92wCg0OJpU1ec0RhwY99WSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Z25FdTwc; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Z25FdTwc"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-abbb12bea54so26898166b.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 14:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1744235095; x=1744839895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3NPai227aDJvUuV8kWoPsqKGMzOpGvfzdkovhg7o0R8=;
        b=Z25FdTwce21M9Ur2+4aqEcYPS0w/Wem3ia0J52AjPTgUsEk82jOl7iIcsl/WZy/dKU
         GXzwnihx/Fl3KxZnRu/EEMGm6qQJ49UHiwZtbAOEokKP7JxEgbVEK3kkeHNvAmPA3Bol
         YDU26IAlSVYF8pFpP7zeNsnsVBsnUikIMLbK8fqcmRa8hLKPC9hUTBarODlvVNuhCW+T
         FxxNWrOq0BgpgXW3Q05pPPWW6JYeUBoYi5F6DKHcFAGAM/ymlafiULMTiqEyCaegCh/g
         9dLiMpw6QTsIeZVeI160lHDEVYEiyFw8AHcLWJ2YIb0AlfEcQios0rzpqseJPFQQ8wuR
         2YEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744235095; x=1744839895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3NPai227aDJvUuV8kWoPsqKGMzOpGvfzdkovhg7o0R8=;
        b=kdh7jB4APl7xr6IxFpvmtPOok6OL+joSl6zl8s0chJa2eGYZ/eT8tmNkuTOAJmEv07
         MN1tdPwha7nhuuyzOFeCda2J9m7CXaezYsIWVYp1U2mcGSxfJFo/j6BZd7AGC6Nq9Pfb
         LE+1nlqhXgmkHeNtSAjGEpZjyMnGUnbjWqIQg+/DwvNw+LjE4nVU33lF2jITBFROJekE
         ZMj9xLwAWO3+4qeWLfYwqitszHwCtRpSa6REAU9HOd/A+ur2iBoAVt5W2JAIMGfY5R9u
         89IR2LwVQZWDJKJeLYImhqWpmqAloWLuZh3m8qupXjwkVHHv4/M4s3DFfESCY0hT9uOc
         rK1g==
X-Gm-Message-State: AOJu0YwxAR4unrYPXow2Qr++vQtO2pIBIy0fxS+T5dB1hMA779iiE83v
	wy3KKyoPbknM2kOGYlaDnT3A0DdXfrqLiHMkcVA2fNQus32FcpoC
X-Gm-Gg: ASbGnctNXxYQGfhsfbf4o2YmGAQKrRM56V7hF0ko0ySv+xsYnwD5gi1uUywy4hUT1u5
	uMec3ztkJCaPR5H5VpjVQKDaISUFudcFT7bMNodCfimlBeyoPAka/SPgKgt5mUO58dz2tg3eBav
	jjF7l5PgkTWnKlSL/fhCZMSShriOlCBwxOV4fJaIRw8MTkrmH3rp8F1QBR7Gy3rlQKbyb89XuCv
	ZHVPiaxZD3Mp0KrbTERvHmZdSflT7Wq0Gq8ja9Ugh0XxETFR/3H2HBQAo4vfgREQDOzynnxGXvn
	teQMamKh8cY6PyhJn4CaXbDXAgogsP1DyjH4/TMXEq66bvbshPwakg3BmG2ewRA+NjBb00OwQqs
	PGjoaZB6kiz89Qul4nIgQ1++7iXeBStTV9lbF2FQA3r3Tu7YMDZG/piX7u7nXJOiSVQ==
X-Google-Smtp-Source: AGHT+IGgAEroUeLQh0oYmzC+aJfi7NMR07UxELr9MmrtZo+ueWdUduUVZpBbInA6JPzZpHd/qY/X8w==
X-Received: by 2002:a17:907:868c:b0:ac3:3f11:b49d with SMTP id a640c23a62f3a-acabcb2f4b5mr27658666b.0.1744235094553;
        Wed, 09 Apr 2025 14:44:54 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b3fc-b700-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:b3fc:b700::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-acaa1be9152sm153577866b.42.2025.04.09.14.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 14:44:53 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Furkan Kardame <f.kardame@manjaro.org>
Subject: [PATCH] drm/meson: fix resource cleanup in meson_drv_bind_master() on error
Date: Wed,  9 Apr 2025 23:44:22 +0200
Message-ID: <20250409214422.1751825-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

meson_drv_bind_master() does not free resources in the order they are
allocated. This can lead to crashes such as:
    Unable to handle kernel NULL pointer dereference at virtual address 00000000000000c8
    [...]
    Hardware name: Beelink GT-King Pro (DT)
    pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
    pc : meson_dw_hdmi_unbind+0x10/0x24 [meson_dw_hdmi]
    lr : component_unbind+0x38/0x60
    [...]
    Call trace:
     meson_dw_hdmi_unbind+0x10/0x24 [meson_dw_hdmi]
     component_unbind+0x38/0x60
     component_unbind_all+0xb8/0xc4
     meson_drv_bind_master+0x1ec/0x514 [meson_drm]
     meson_drv_bind+0x14/0x20 [meson_drm]
     try_to_bring_up_aggregate_device+0xa8/0x160
     __component_add+0xb8/0x1a8
     component_add+0x14/0x20
     meson_dw_hdmi_probe+0x1c/0x28 [meson_dw_hdmi]
     platform_probe+0x68/0xdc
     really_probe+0xc0/0x39c
     __driver_probe_device+0x7c/0x14c
     driver_probe_device+0x3c/0x120
     __driver_attach+0xc4/0x200
     bus_for_each_dev+0x78/0xd8
     driver_attach+0x24/0x30
     bus_add_driver+0x110/0x240
     driver_register+0x68/0x124
     __platform_driver_register+0x24/0x30
     meson_dw_hdmi_platform_driver_init+0x20/0x1000 [meson_dw_hdmi]
     do_one_initcall+0x50/0x1bc
     do_init_module+0x54/0x1fc
     load_module+0x788/0x884
     init_module_from_file+0x88/0xd4
     __arm64_sys_finit_module+0x248/0x340
     invoke_syscall+0x48/0x104
     el0_svc_common.constprop.0+0x40/0xe0
     do_el0_svc+0x1c/0x28
     el0_svc+0x30/0xcc
     el0t_64_sync_handler+0x120/0x12c
     el0t_64_sync+0x190/0x194

Clean up resources in the error path in the same order and under the
same conditions as they were allocated to fix this.

Reported-by: Furkan Kardame <f.kardame@manjaro.org>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
This issue was reported off-list so I'm unable to provide a link to the
report.

I'm not sure which Fixes tag fits best. My preference so far is
Fixes: 6a044642988b ("drm/meson: fix unbind path if HDMI fails to bind")
but I'll happily take other suggestions as well.


 drivers/gpu/drm/meson/meson_drv.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 81d2ee37e773..031686fd4104 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -314,35 +314,35 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 			dev_err(drm->dev, "Couldn't bind all components\n");
 			/* Do not try to unbind */
 			has_components = false;
-			goto exit_afbcd;
+			goto cvbs_encoder_remove;
 		}
 	}
 
 	ret = meson_encoder_hdmi_probe(priv);
 	if (ret)
-		goto exit_afbcd;
+		goto unbind_components;
 
 	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
 		ret = meson_encoder_dsi_probe(priv);
 		if (ret)
-			goto exit_afbcd;
+			goto hdmi_encoder_remove;
 	}
 
 	ret = meson_plane_create(priv);
 	if (ret)
-		goto exit_afbcd;
+		goto dsi_encoder_remove;
 
 	ret = meson_overlay_create(priv);
 	if (ret)
-		goto exit_afbcd;
+		goto dsi_encoder_remove;
 
 	ret = meson_crtc_create(priv);
 	if (ret)
-		goto exit_afbcd;
+		goto dsi_encoder_remove;
 
 	ret = request_irq(priv->vsync_irq, meson_irq, 0, drm->driver->name, drm);
 	if (ret)
-		goto exit_afbcd;
+		goto dsi_encoder_remove;
 
 	drm_mode_config_reset(drm);
 
@@ -360,6 +360,16 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 
 uninstall_irq:
 	free_irq(priv->vsync_irq, drm);
+dsi_encoder_remove:
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
+		meson_encoder_dsi_remove(priv);
+hdmi_encoder_remove:
+	meson_encoder_hdmi_remove(priv);
+unbind_components:
+	if (has_components)
+		component_unbind_all(dev, drm);
+cvbs_encoder_remove:
+	meson_encoder_cvbs_remove(priv);
 exit_afbcd:
 	if (priv->afbcd.ops)
 		priv->afbcd.ops->exit(priv);
@@ -374,13 +384,6 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 free_drm:
 	drm_dev_put(drm);
 
-	meson_encoder_dsi_remove(priv);
-	meson_encoder_hdmi_remove(priv);
-	meson_encoder_cvbs_remove(priv);
-
-	if (has_components)
-		component_unbind_all(dev, drm);
-
 	return ret;
 }
 
-- 
2.49.0

