Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C17C19B586
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 05:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743659537; cv=none; b=mvvdMEp21hKNduPpAVQxAkhE3u9i3BR6rTnY0WCEvBvOue2xyYZrOEBS8lqpZWJrAa+Loqb3YlKC7WiOXKYKklksc8OKMNDFHxo6NfAVGV3Zh8W9uINbih40fYRgaHy3FTihrVkRdF4mmssC9dfevkojkFVA0V2pFtdjfzJI1kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743659537; c=relaxed/simple;
	bh=gVoy6WCduQRkgG/3KKBACPXiVSY21KM18PUYkLJzIvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CbC72279cRLVnjN53D9ohXyAMf6Fdmeo5k4Q4vSCkY6QChB4f+l/BIc09Sn2OdOqvup9yX1Va/xzbabuXouLIlcSJ8NKUp9ULQ0Qok8pU9/6Rf6DWCcNGy+LcmuzkqOnMOH48nmx36zsSyaMI7JH848C9bTIOxxqHnG298MNk0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpLrLad2; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpLrLad2"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb12so845545a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 22:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743659534; x=1744264334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2Xsn95gZDOG35Cm+QZTKl3yuSSikANGmud/WPdVRhI=;
        b=jpLrLad2pQazxAyXgvf9lt5UCmWv2oX267412tQ4+ygTRuMruP0j6cgx4oQECmZQ4E
         upnOqXgelyAo9iuybL/NFoGz5a/OmwJBLHA4Tkde8VxdW3DNf+w4jvJljpU9ZbvT79Nc
         Duo/z4eBHcLi1kXnwsg+OVAJy/fxNm8nHhtmNEhVYjcrZuCHqM8GqEuUXcwfqGaKoMOK
         CwRl9DgWW9uegVsK2g5R7U79tEKCQ+veF2lwiVWhAZmq93IP+qKkfLoZqXn27/7Nu6UL
         WXdwm7BDdGsuuh0zOyADpw2w7RERvY+PT4U4m2ntCZP5eSI/gxd/f6TdLq410KxuQsdO
         NZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743659534; x=1744264334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2Xsn95gZDOG35Cm+QZTKl3yuSSikANGmud/WPdVRhI=;
        b=d3eeMbMHNGzr089LDMS+BKSIix5NUgBAijZj2XIfqsQl+uvx6Dk74iZuul5RyBhaY6
         8d4vEX8fw+030mXEfKSPl3LKzoFNbSc11NRGn+Exhsfadishj7MwChb9D9HUN1dCu1D6
         mIm/OuDsbNhDVQJhOAwEP2wEr/N1FKcbXePcEbxd0UPlFKhaOjh/SSz4i5dldZ5v5W7B
         fYBWGVCdJ8jsh6fd0oaQ69naZcKhw2ga1Z1DuuY+AzROQcxCKW0Yjnseiard8QEx2TGD
         M4AUgu9QpD/CrKoiqWrluT+Q4nBjL5WmSgToqs9gSI81d/Bxeg+ALJOz2o36hOEFGZ2z
         pkFA==
X-Forwarded-Encrypted: i=1; AJvYcCUYT6qq9BiMlhJvtPmuprBDy3cHDgZno281ME6U720PrcTNx9NW1kuVQSkXksW4aDJVKgwfKGp6v6YyDR0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNGgftMradkVS9XBJuGqF7Hp9Y+SwNGt/88wh82+mAGQmTxpVC
	qDHl+hmyRrfxlYabkO5yhdYmOsSjnrYA6J2v66vo36oIEpbVhxYS
X-Gm-Gg: ASbGncvqpQbe5PcYRzpJWKV30LFb0llzNYSj+VRijmFaplKCOxEBNDsSAQOG2R1MtTA
	xGYb3IhDR6XyT8tCxEROH67hX108Nxt5zSMh8/L3C8PQFGByMqATbVpKvlVdnRF4zMLPA3NlVUw
	bqm8U7uWw/iBbUNnGarJEk+MJnfWDiKmCArVRnTeKIyZYdvvkrJvwzj8JsRbF/Kyr5qyLH+2JYX
	5+1ovnvE5bq+8RpegafY5g1YGMiEJm0AMhcCo/4gREWTrLH20pVI0nyp5wDGH2p75q+1FS3uSQY
	TlA0rt2JuYT7zcZB/JQDr4t+fMIdM993AhPtk0BPI3oVl3EWCL8fKnmttksd9kmgYGjXJ3t2eGT
	2lZGgvFHsYQSzbQUCw0Z0qjJ2hO7/5KDAO1M+kiSHqg==
X-Google-Smtp-Source: AGHT+IGhaJ1nXDxsTQs36HHprHNbaRYD6p+r/EKASCCtnfsEVG7w5Y6wfGcvj7xTLu9oHHGrxOP0lw==
X-Received: by 2002:a05:6402:34c9:b0:5e4:d402:5c20 with SMTP id 4fb4d7f45d1cf-5f086f84cbamr958962a12.0.1743659534359;
        Wed, 02 Apr 2025 22:52:14 -0700 (PDT)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087714e11sm417236a12.6.2025.04.02.22.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 22:52:14 -0700 (PDT)
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
Subject: [PATCH v2 2/3] drm/panfrost: add h616 compatible string
Date: Thu,  3 Apr 2025 07:52:09 +0200
Message-ID: <20250403055210.54486-3-simons.philippe@gmail.com>
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

Tie the Allwinner compatible string to the GPU_PM_RT feature bits that will
toggle the clocks and the reset line whenever the power domain is changing
state.

Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 0f3935556ac7..9470c04c5487 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -776,6 +776,13 @@ static const struct panfrost_compatible default_data = {
 	.pm_domain_names = NULL,
 };
 
+static const struct panfrost_compatible allwinner_h616_data = {
+	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
+	.supply_names = default_supplies,
+	.num_pm_domains = 1,
+	.pm_features = BIT(GPU_PM_RT),
+};
+
 static const struct panfrost_compatible amlogic_data = {
 	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
 	.supply_names = default_supplies,
@@ -859,6 +866,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "mediatek,mt8186-mali", .data = &mediatek_mt8186_data },
 	{ .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8188_data },
 	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
+	{ .compatible = "allwinner,sun50i-h616-mali", .data = &allwinner_h616_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.49.0

