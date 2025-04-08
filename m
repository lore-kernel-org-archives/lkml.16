Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E52FA31
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 01:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744075956; cv=none; b=c1KduCg+EfrqiThnndnVi7799zugCc2AEwbgKt5/eU2AH9dBS1sW+pGYS4AIQ7qVp7gRUaYAso8wj2sV3EK64XtHIdVEhBMcySdMRHMDVOgzwgNcVK8fmvCPwodYf6htxH7Kr3U3DGoEsw/HN2FxCaywmaaNL8mHzdUHvaPptns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744075956; c=relaxed/simple;
	bh=xcmuPfOAt5cfMjB/ZFaWH0LcgbNGB8QfJVxHea3Rfro=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FqKSWjwVa/GEPZPR3XiRoxDtOxnnhhq1PgMqmPTLyF1Q8NwdiBc/sFl6lBx3xm5B84Be/fz5ckGExGzZkIX8eAWHNA+AhSuwuUALDGT97j83O+Eq9HecW+tvsZ/iYP9vpc05GIHUn/39AMAC8NefqxfTR2kkByTbiVQRycoU4fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-736ab1c43c4so4769337b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 18:32:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744075950; x=1744680750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IT6EO3uXq7W/DtEevmI6X3jGcRw4tHqVpMI32qli+6k=;
        b=k4RGcn7sDHJSGfYFFwaTMzkn9fElsTTnEIBu13YkVaA0aMKZIXiYpK0GWuo7ktBaG9
         E5SoTYiYZ1+HrH/UJpwB/LTqpHi0m4Rq/N3eLkQHCwv2cs3UnEsGtqivR7vEla2BtXwB
         4gWYgolP//5Y+GkyFsu3JMsg1MTUR3X70xR1iGvl28YU98HYZztqAZ0217GB4TIizAbg
         MtLifkWCWxonN9RbJIvTOzLNHtfaJ07o2Sd/QFlEmteClwByzRDGvUskVrqXJukGaGoF
         xCE1x4N661lrBZWl5GhbRknV/aE05H+mt7RxzmdAz/P55T5vBHkDDKJn+PE0XZlED2y3
         R16g==
X-Forwarded-Encrypted: i=1; AJvYcCVzZBdBxiQaDfpYv90bEfpww3koRuMiMwcQaEseI8K2NAw2so0YVPkvf9+raes/1Oub2bBvwacvfxxrka0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI20ojtZvm42xscRwVKQvqryfFGTcQo01/aBDbDftsgl7ZCxDi
	Ffy3la+0QlFEQfAOBYTUi0eq3XNx83cBrDMUL+g9FtXXjNeAl3HD
X-Gm-Gg: ASbGncs7N29w2jPJHADOwEuJynqQKiHToRW3XmVV5OSRIihghOKwrBuQGVaoK06ZLAS
	PfclgSPI6MTNqeHmqUCuaT+basFYNkiHXtMjriWEQsLR+sG4wxWQlIKWjCE9Cs1fwnFUXfldKaK
	qFAdf0gNtotJPICs+fMUUpSt57Qq6LBfRU/CjOjZVOFyYdisKu0tR3dgFEX4wDsOzCPNR/A/z4Z
	ut+rbkv0onBVI/dce7EOIXWSNqmHRvCWzSwwvgpardRTp56LdTPWkN9u8nNuKpLA4plmBs1yTb/
	POja1h1wMoBxIHaOzPjW2bRTM4drRYdZ9w5IUhouY+mUMBdnC7U5gWi4x3o/
X-Google-Smtp-Source: AGHT+IEzl0nskbxsR96eaqQW/1gJQJ8+1JpvRWHmYANqFKElkG6cxZpJBqxLTJ5cU0yAVVNeQ20Pfw==
X-Received: by 2002:a05:6a00:2186:b0:736:5545:5b84 with SMTP id d2e1a72fcca58-739e48cefd7mr22131846b3a.3.1744075949719;
        Mon, 07 Apr 2025 18:32:29 -0700 (PDT)
Received: from localhost.localdomain ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9ea089csm9243885b3a.111.2025.04.07.18.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 18:32:29 -0700 (PDT)
From: jiangfeng@kylinos.cn
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	rodrigo.vivi@intel.com,
	andrealmeid@igalia.com,
	christian.koenig@amd.com,
	raag.jadav@intel.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Feng Jiang <jiangfeng@kylinos.cn>
Subject: [PATCH] drm: Fix the length of event_string in drm_dev_wedged_event()
Date: Tue,  8 Apr 2025 09:32:19 +0800
Message-Id: <20250408013219.26006-1-jiangfeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Feng Jiang <jiangfeng@kylinos.cn>

The format of the event_string value is `WEDGED=<method1>[,..,<methodN>]`,
so method should be appended after 'WEDGED=' rather than overwriting it.

Fixes: b7cf9f4ac1b8 ("drm: Introduce device wedged event")
Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
---
 drivers/gpu/drm/drm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 17fc5dc708f4..58babdab9e66 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -549,7 +549,8 @@ int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
 		if (drm_WARN_ONCE(dev, !recovery, "invalid recovery method %u\n", opt))
 			break;
 
-		len += scnprintf(event_string + len, sizeof(event_string), "%s,", recovery);
+		len += scnprintf(event_string + len,
+				sizeof(event_string) - len, "%s,", recovery);
 	}
 
 	if (recovery)
-- 
2.25.1

