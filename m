Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7384A01
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 01:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744163212; cv=none; b=ak2JkT+xUSoeHhQ4dSjxOJLf0umV8yxmFUn5NvUNgU0RIK/Kj0L31yae5LGBOron9mG6BW7GeLS20NpuhYf0KXiJH/pGQ0MukNKbwcHUVoUrTXoPS69/W7pAYjNiRc7Z4uP6TtkF4Z096k2vC78/uteONSWBkqJH9GR6/wNFQD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744163212; c=relaxed/simple;
	bh=8UIHGn2R3beb9kU1ZInBuiP6sZlHEARAbbB/YVCQC2Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YnKMvdlVOF0NBWZH4+LgljidTonUfXxzhu8+bycB8AtbJNoAhENEE85biao93M/s5cBLGIE8u2NmJbUXT9/3arOHv/pNz3URRiIxGejQQF/TzPh7YlHV6GHGc4DDK4KmAUoi+471J+6nxHaPCl4NPxiOQEL7XZqr6Pgw01FpvYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so4803353a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 18:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744163207; x=1744768007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bLtGuwiraT4GJp3N+SDFtn5CnWkUJWXme9NNEqj3IEA=;
        b=enk+dVDtxR2cX9rLNuc+20jDfDcZ9a/zQECqCYULLiOGM236nLDRwge3Mi7GPoYHeX
         Vex02SodkieiU0UV0rWkzkDK1L0rkhTPqcdGa0VaeBvvg1Xw6u1Zrp0LlXqo5P4FAtPr
         ToGG1zg2Mdrielg0lqQoytR+HMHp5QdnWa/AUuwtjR/WN5WXzGsLb1F0uNFrgdBeHZng
         6wDwMb/fqQeTFWvf74csnnX6lKSjOhST4tYTaHhXzPOMp/kxoItzR6WKHxtzbV8OBDC+
         zno5alqxl4TLrQ5vNoovGwd/EOs5dh/VYOGDZ3jDOXfr0RDZRpM+mXb3sSDdC3XUixIz
         yh5w==
X-Forwarded-Encrypted: i=1; AJvYcCVUGC2Gfj+0c+7X++RTQ+jJAMhwOBeBniLuSa2rJWt25BvviiWxh+YgadpNZ1Kdq6dLKcrqEu1SlHhvUTY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4rngijDQEnsewUvrluqjTl8w3Nzs4JyX24Zouh4N1rA8ylFVt
	P5jzxaXRU/Dn3W0e5yNPD5EcycR3/6N6dy0PzmtfmOOdq5n2SE/j
X-Gm-Gg: ASbGncuwiCJJSbs+71f1eOaRTBs+o7Q/SXU02KFpWciH3pAmttb7V6Shg8H/bxGI3DU
	9sOq6qsU0zPwAaG9NPWYzeHUba3OlZyBEsXvsDQ1bY9gei6SkUkUUBAmaCTbD+UkfzOxmr5Guu7
	Ai/zIF9i3dRyJN0ri64X3GoUIMvgGEbD2lhKEpmgYOP2rvJrhcjWtKnTFz90NXCeIzdFGSBQNOl
	FKonbTH6A4yDtNAwK8M6BpTrYz8MvBROG77pU5mOTDS3p6HBAsmmZJWdNUCCHHZ5V+xmpFLRBGb
	oJZmcLDYEqvR9YUesvc1Kx2NDRhuVG6spVvEEOzoxLOVh2Ek/6aFJutzKthm
X-Google-Smtp-Source: AGHT+IFFPzsV9RDMpQcjIusJFdTCbtLRmNV4HteldcsbH7jmzqsUrR/t8F1VZCtOvzPi4nOhwN9xfQ==
X-Received: by 2002:a05:6a20:ce47:b0:1f5:7ba7:69d7 with SMTP id adf61e73a8af0-201591555f0mr1552429637.3.1744163207613;
        Tue, 08 Apr 2025 18:46:47 -0700 (PDT)
Received: from localhost.localdomain ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a11d3b43sm104635a12.39.2025.04.08.18.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 18:46:47 -0700 (PDT)
From: jiangfeng@kylinos.cn
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	rodrigo.vivi@intel.com,
	raag.jadav@intel.com,
	andrealmeid@igalia.com,
	christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Feng Jiang <jiangfeng@kylinos.cn>
Subject: [PATCH v3] drm: Fix potential overflow issue in event_string array
Date: Wed,  9 Apr 2025 09:46:33 +0800
Message-Id: <20250409014633.31303-1-jiangfeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Feng Jiang <jiangfeng@kylinos.cn>

When calling scnprintf() to append recovery method to event_string,
the second argument should be `sizeof(event_string) - len`, otherwise
there is a potential overflow problem.

Fixes: b7cf9f4ac1b8 ("drm: Introduce device wedged event")
Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
---
v3:
- update the subject

v2:
- update commit message
- keep scnprintf() as a single line
---
 drivers/gpu/drm/drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 17fc5dc708f4..60e5ac179c15 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -549,7 +549,7 @@ int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
 		if (drm_WARN_ONCE(dev, !recovery, "invalid recovery method %u\n", opt))
 			break;
 
-		len += scnprintf(event_string + len, sizeof(event_string), "%s,", recovery);
+		len += scnprintf(event_string + len, sizeof(event_string) - len, "%s,", recovery);
 	}
 
 	if (recovery)
-- 
2.25.1

