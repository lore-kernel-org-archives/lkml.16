Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD43198A11
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 05:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743659537; cv=none; b=i1/yx+S1laXIBm0oawPErmii+opAwUNxWVuwDSlL0TyIZvx872kfFbd7f7/UDEosO7dFIa11fB9jzDbybh2fpNT+MS20hmvTqXlPplSD+4pRu2RAM7wHAG3TQjXGiOhm2zFdwdR1zputi7qQZxxBvz2m+Fvv6RYBat0JI1GnKdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743659537; c=relaxed/simple;
	bh=xqaWFB2eEfyjUN2xMOM8m6X3PZ0qLCEaxIqtF51PdEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J5U2p4S9+l/EzXPsDdhX8ZXlLhFogcljJT4gyVv/x8Q40HlukFdwh45bwHNkpS4JoUwUvUaQJseSYSdt4NFBf1ep/D9AuGl9Jt+5V+RU+DmWLvdDK+aeIhMv9ZTVVSIuVctxHY9BCXwC5gew3/1DxDZQuFCNA6rmqUSrwCjQGsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCF9smLe; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCF9smLe"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e60cfef9cfso809683a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 22:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743659534; x=1744264334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41S4es1vorl5OsNJysl7iKCyKcDv122Tfjuk/+jgW1g=;
        b=RCF9smLeN/UOLs/VYICefaKYl9tYm347V9/Zx5aj9X3LhOeuA2tY19c273aijd3E7d
         2+++yoL6G/rrb8mOe16Kfhbp/QW6IKQ2xDb/FSk7x21LEWXap7gEPPTNkjWVPj1gbkFm
         3vdGyUtwYUrFzGx+Z2zzIfvwBznDWDGOg1VoavGkoNNSgC4PW94k02VdPIC/BHkD1WGa
         Jila11vlOBcpeimMjDLZIUptRm+gY1iw0f4E98eU2tsRVmEQCZAuSMKm04iqgH240QDs
         n7E4NHCN0CB2Bw9MhsPVlAlxmD+tlDBYYWBrSv5qz3pm/BxFfsjBzCUYlS+ifKpHduGu
         Fxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743659534; x=1744264334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41S4es1vorl5OsNJysl7iKCyKcDv122Tfjuk/+jgW1g=;
        b=ejqGLKAwei1bF+l+Tm8ydQqyqAbUWyHHBy/Meua5NK35YdPbLzwxUjZqRHfrzLuB3i
         iSdr9t2DkMoj9964uuJi5VmTpZOsC2i6RgYbV0BtFRzKdPJuT5KzccaQbAgzBCapnW/Q
         6e9pjrSuUSVATvqBUprqK51cckUkGXXkvSi2wQpvfWqtawnnzufgEQEHkQCyHSjNspbI
         tzccMhaK8vF1u6xmGH8XwE4p75ktCHdHXrZwFrfMwZl0tlfbO2qIeCyFjff9kZq8cIHT
         EOsp0LOgLKJmxeXj5w5Y0lMcB/GNSGznCSoj1TbABNNsBgiqGmmUPRchITgE5KzW6nJ4
         TEiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWthzBtNsE+amzFDCUzUBOQU+osk7x8+zQBJnh26bEwE7Ff6XZYWaBuQ87fjLXk7OM3Kb18nADGZyWMdQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOm+BzuTEhOmFRwRZwH9vh9jy6ZV2T9e0f59qsYfVOwRURJ+U1
	SEvoPPLaDQJRQ3GFU4WHJFNyeVCCMy+Y0nKs1ZouQ71vJl2Df+/B
X-Gm-Gg: ASbGncvsrVEKkElEvUYdMzlG68kV5Z1bcUe0RIWL5bdxYIL9jLTsI/XR0//D/AKXg4y
	hhH5+MQEe+0FcwHcn8rAqZObugrRxATLLbsEtW2Lx+xhkrc/bAtgx0pKmPGa6XtlHmKRrwDNamp
	CV7+e4Y2Cpa8R224gqntbgJzrsMbphMlth//dvg7DXRPsQTd31/xFq6R9sbUOlxTtRs3cb+Hp19
	llm6eSrgnmpqev5i6D5C3dIn8eYKuRgvqzmBlxNIRbsgR1YuFa5NmV4IHCOYliDljr9XERLHZWC
	DCA0ypwYPBJUUdGm1j7NY0i52nnwiWg5sMYELChpoETR9OnKXA5CGfuGzbfalDN7ViAb8Ht5Gde
	N+QvCL4OookbkuNalGun7KL7KpRbeovTwXv8Uum+miA==
X-Google-Smtp-Source: AGHT+IGvOCvIqvOLzLo5rKC+/GzFkobXsM4xMWpa8Y6+du0CrzHRHpNOACAws2OZUfVAnczPiZyASw==
X-Received: by 2002:a05:6402:42c5:b0:5ed:6192:3759 with SMTP id 4fb4d7f45d1cf-5f04e6df712mr3822253a12.0.1743659533634;
        Wed, 02 Apr 2025 22:52:13 -0700 (PDT)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087714e11sm417236a12.6.2025.04.02.22.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 22:52:12 -0700 (PDT)
From: Philippe Simons <simons.philippe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	=?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: [PATCH v2 1/3] drm/panfrost: Add PM runtime flag
Date: Thu,  3 Apr 2025 07:52:08 +0200
Message-ID: <20250403055210.54486-2-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403055210.54486-1-simons.philippe@gmail.com>
References: <20250403055210.54486-1-simons.philippe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the GPU is the only device attached to a single power domain,
core genpd disable and enable it when gpu enter and leave runtime suspend.

Some power-domain requires a sequence before disabled,
and the reverse when enabled.

Add GPU_PM_RT flag, and implement in
panfrost_device_runtime_suspend/resume.

Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 33 ++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_device.h |  3 ++
 2 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index a45e4addcc19..93d48e97ce10 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -406,11 +406,36 @@ void panfrost_device_reset(struct panfrost_device *pfdev)
 static int panfrost_device_runtime_resume(struct device *dev)
 {
 	struct panfrost_device *pfdev = dev_get_drvdata(dev);
+	int ret;
+
+	if (pfdev->comp->pm_features & BIT(GPU_PM_RT)) {
+		ret = reset_control_deassert(pfdev->rstc);
+		if (ret)
+			return ret;
+
+		ret = clk_enable(pfdev->clock);
+		if (ret)
+			goto err_clk;
+
+		if (pfdev->bus_clock) {
+			ret = clk_enable(pfdev->bus_clock);
+			if (ret)
+				goto err_bus_clk;
+		}
+	}
 
 	panfrost_device_reset(pfdev);
 	panfrost_devfreq_resume(pfdev);
 
 	return 0;
+
+err_bus_clk:
+	if (pfdev->comp->pm_features & BIT(GPU_PM_RT))
+		clk_disable(pfdev->clock);
+err_clk:
+	if (pfdev->comp->pm_features & BIT(GPU_PM_RT))
+		reset_control_assert(pfdev->rstc);
+	return ret;
 }
 
 static int panfrost_device_runtime_suspend(struct device *dev)
@@ -426,6 +451,14 @@ static int panfrost_device_runtime_suspend(struct device *dev)
 	panfrost_gpu_suspend_irq(pfdev);
 	panfrost_gpu_power_off(pfdev);
 
+	if (pfdev->comp->pm_features & BIT(GPU_PM_RT)) {
+		if (pfdev->bus_clock)
+			clk_disable(pfdev->bus_clock);
+
+		clk_disable(pfdev->clock);
+		reset_control_assert(pfdev->rstc);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index cffcb0ac7c11..861555ceea65 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -36,10 +36,13 @@ enum panfrost_drv_comp_bits {
  * enum panfrost_gpu_pm - Supported kernel power management features
  * @GPU_PM_CLK_DIS:  Allow disabling clocks during system suspend
  * @GPU_PM_VREG_OFF: Allow turning off regulators during system suspend
+ * @GPU_PM_RT: Allow disabling clocks and asserting the reset control during
+ *  system runtime suspend
  */
 enum panfrost_gpu_pm {
 	GPU_PM_CLK_DIS,
 	GPU_PM_VREG_OFF,
+	GPU_PM_RT
 };
 
 struct panfrost_features {
-- 
2.49.0

