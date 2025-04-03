Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F3C19885F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 05:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743659539; cv=none; b=gHQJtvq+7uwrJcxccVSH0SPaV15uez1Lce2zPxp4NTH2hlTqMsNtcYGec1pI6182EoUWDxtEo454ecP3mT5NHN919GRQxaQmKoQHNQ7ytLm63jvU80VtTKK649nxsQVAVHlHjwe+jnSB7TF9ZK7AUicfum8Jzb+AkXdfkVHHaow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743659539; c=relaxed/simple;
	bh=bOtOmwaf+d85oYpjpBLSTKA6Cj+ZdsJofatkPjD22No=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T9KxuOe5jqRaREhGLC2WhoFl58vENJDjkwz+Q9ls5HIeEQOtTcTCfQ92Duc6o0EwskJMy3MDcmKDsH8j50CAtKicafcRPcDW9KyvUmcv3416Fbv0BXC77fkZUJKabRKoIk1cEHtZx8OAXw49WatOlRIHrIk/BkimTIEfueUo/4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TzuoTGQU; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TzuoTGQU"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e673822f76so901609a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 22:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743659536; x=1744264336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKTRZmv77HTmpqOJnfj99p0xYiAgz1IADbNWkm67q0w=;
        b=TzuoTGQUJ4hQGA476HNjL+RQfguPgxs0O4gvKBWBwqdgbJgCBMinOngbUjg30AAxKj
         HMBb5JxKkaWarrgwEPhs4PIDUZfeNpgwmMvAFaCue7I2Qgn2QrGwv+f2Dsi5tEXpstwO
         GHuc66HlxMmfqM2iGL/mzsZed/NHFC8GrEAFCuja8Qyf6LjZ0IB5qng+/59J3Tw3bWpm
         xxRbPoeIEP6AfOjLIjF0WCuruT9eSnVv7+v5YND5BnHJTefRPvzhTYerAtBy0vtoWpnu
         Ba80vCEcW/BWqJyFQ5+mP4pRpNUco8hJcHmX6vgUP8GmF6hQbtNEVPsLRWiuep7VikLP
         kfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743659536; x=1744264336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AKTRZmv77HTmpqOJnfj99p0xYiAgz1IADbNWkm67q0w=;
        b=o5SVdpyXPAh438PUKp7LXIs/hsvILcPNyhyE4YsfyC8wNB3See2O65KcXM9YDw3NCg
         t8SCN1GtYZ1p0fWkGgZUb4zQWHW8qg5eU9QmGHx6TegAduJfUr+oMw8pbal543knq10B
         nI49q6cekj4AsuQ/9Fc4zyT6wIZ6WGGkz6nfhJct8gkcsy9UOexqdc6tpVgYecvDXJK9
         XC0BeWjd0d4BheZd1QeWGw2Pt39l4dwlC6/29mntOYeZHOVb+qYG3jhyl6pye8xGwJR3
         eqBKoQ+ONn1dZYtfiaePNmj4dsRXiWnmpZIv1OzTXIZNhmK/yN+RNqaFejxqBU1WpK8B
         eUeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYsYIBq6dN8jwtOKYSwY1Ery9ObuMrW6b+h04aSXSFxJHyWMYktBS0JgH402Nkfn4iiE7cGDurBhWSIA4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwntDS2mYj9PhnwDfOvW04wjmTXGBOSit1quqIevgRNRNKa+Wvb
	nsuDhp/V5ucwV/m0vAjBygpnpUefRqUg0Rcul1LO6WLhXtGax17y
X-Gm-Gg: ASbGncs8dKDZx72ArTDWZ+FI7as4KhUK5fbJtbX27r9Y6aD6If/o/UhnKkH0KAF0exM
	qepbvxEBx9ZOtYVXUVrzLIsvW+DigaVD9PnWgoR95SFOuhDctGwNraFlcR6QQV2f2fi2JWVp1l8
	c8IV9dqZknrQ15OgaMtFhBtGchi2rTBtYCI49WhSme6MpvZPqMB9OZMhEYSqVLb7odBPN5o3gQN
	VO1GdJTG9sHXVr3+PvTE9ubKdSkXGuxc8We3hXWpw0msDObZv1WfmGelSn5f053HZpBePLxweXs
	7n9ogp6V38KqjEs9Qv/UjVc4tshvDI0er7BITHyId8plh6NB6YNLwVNwuExjlUN1/bDN/XmSkzJ
	56xIWZFru0pJDa6aGbixD9wAXdKqr7M0=
X-Google-Smtp-Source: AGHT+IErNtuWo09KLUdY+qpohmLzPpx+EJwT2QrMD64lmhMArDMJQJ6Z7Gp9MWYxCImCbb3JWo9XhQ==
X-Received: by 2002:a05:6402:510a:b0:5e7:97d2:6d10 with SMTP id 4fb4d7f45d1cf-5edfdf190cdmr16383892a12.28.1743659535771;
        Wed, 02 Apr 2025 22:52:15 -0700 (PDT)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087714e11sm417236a12.6.2025.04.02.22.52.14
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
Subject: [PATCH v2 3/3] drm/panfrost: reorder pd/clk/rst sequence
Date: Thu,  3 Apr 2025 07:52:10 +0200
Message-ID: <20250403055210.54486-4-simons.philippe@gmail.com>
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

According to Mali manuals, the powerup sequence should be
enable pd, asserting the reset then enabling the clock and
the reverse for powerdown.

Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 38 +++++++++++-----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 93d48e97ce10..5d35076b2e6d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -209,10 +209,20 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 
 	spin_lock_init(&pfdev->cycle_counter.lock);
 
+	err = panfrost_pm_domain_init(pfdev);
+	if (err)
+		return err;
+
+	err = panfrost_reset_init(pfdev);
+	if (err) {
+		dev_err(pfdev->dev, "reset init failed %d\n", err);
+		goto out_pm_domain;
+	}
+
 	err = panfrost_clk_init(pfdev);
 	if (err) {
 		dev_err(pfdev->dev, "clk init failed %d\n", err);
-		return err;
+		goto out_reset;
 	}
 
 	err = panfrost_devfreq_init(pfdev);
@@ -229,25 +239,15 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 			goto out_devfreq;
 	}
 
-	err = panfrost_reset_init(pfdev);
-	if (err) {
-		dev_err(pfdev->dev, "reset init failed %d\n", err);
-		goto out_regulator;
-	}
-
-	err = panfrost_pm_domain_init(pfdev);
-	if (err)
-		goto out_reset;
-
 	pfdev->iomem = devm_platform_ioremap_resource(pfdev->pdev, 0);
 	if (IS_ERR(pfdev->iomem)) {
 		err = PTR_ERR(pfdev->iomem);
-		goto out_pm_domain;
+		goto out_regulator;
 	}
 
 	err = panfrost_gpu_init(pfdev);
 	if (err)
-		goto out_pm_domain;
+		goto out_regulator;
 
 	err = panfrost_mmu_init(pfdev);
 	if (err)
@@ -268,16 +268,16 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 	panfrost_mmu_fini(pfdev);
 out_gpu:
 	panfrost_gpu_fini(pfdev);
-out_pm_domain:
-	panfrost_pm_domain_fini(pfdev);
-out_reset:
-	panfrost_reset_fini(pfdev);
 out_regulator:
 	panfrost_regulator_fini(pfdev);
 out_devfreq:
 	panfrost_devfreq_fini(pfdev);
 out_clk:
 	panfrost_clk_fini(pfdev);
+out_reset:
+	panfrost_reset_fini(pfdev);
+out_pm_domain:
+	panfrost_pm_domain_fini(pfdev);
 	return err;
 }
 
@@ -287,11 +287,11 @@ void panfrost_device_fini(struct panfrost_device *pfdev)
 	panfrost_job_fini(pfdev);
 	panfrost_mmu_fini(pfdev);
 	panfrost_gpu_fini(pfdev);
-	panfrost_pm_domain_fini(pfdev);
-	panfrost_reset_fini(pfdev);
 	panfrost_devfreq_fini(pfdev);
 	panfrost_regulator_fini(pfdev);
 	panfrost_clk_fini(pfdev);
+	panfrost_reset_fini(pfdev);
+	panfrost_pm_domain_fini(pfdev);
 }
 
 #define PANFROST_EXCEPTION(id) \
-- 
2.49.0

