Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA3C201269;
	Tue, 22 Apr 2025 10:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317596; cv=none; b=UnFKQZkKRyIDD41QrlmKMY+uYPB430XeAW1vwkYkXqI8HYRBW+XaI4InPuPiNwFtW/PiM/EvX8NI8+CEsfSOtGqFWlTTpLWg/LBaNTXRrJf0aN1YyUJCQGd7vTQObgji5G7sDiyNGagTSgeCSGtZDUZnQFmBoem1hk/No6URtTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317596; c=relaxed/simple;
	bh=btBzp+xYQxHrCHa5D6AUqBm9PwFyuEjXykYSmRONzTM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=obrYCU5M3KxH3F5d2+Nlxyy/ubMM0VJVWLE3+0uQaCIN8D3YDAdUcFpacoLAFC3zfIAgjbbiFgzNlUsgS2hB5PQGxIsNtpyBH4Y5MP1GYPMgEX+jNOKCB7WoifuH01EF839x2rkX4y8g0IEoZ86IfemsxnpaJaKWO7XVyho1Nec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a17yDEH+; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a17yDEH+"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso36237975e9.0;
        Tue, 22 Apr 2025 03:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745317593; x=1745922393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g7SxF5DbGT5htrrk5YgOA+scpYjVb9Z25iQ9Uytxx0w=;
        b=a17yDEH+yoaouNZ3wuohHcljK0zCccPt9KgL6oifXlKjCiH0F1GSSqWf1hVK/ySxap
         Bd+nE3pnGa1f8tjU//+HURVqFtCANb+N1nShWUB5JpUY2IuDf0I5cYvCnSky8o55xWjN
         zr4VrldLCjqBK6NFahxVJWoUMkbdeq3h+P8CnEHAOYqIN+Ngm4PTq4c1nYiXwL0ay2dt
         3dAVMGzlH8+3HpZCiaVHjY/WQcLF+PqQWSC8MmYt41oXAveZgPvQBVvr0YBPTlYTdJQn
         Hj7yFCfr57I4/m/97Tn1+Isw3mQdUnniG17a4ORLaGcBukZh2+PRIxhuvaLzH5T9++sR
         +vFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745317593; x=1745922393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g7SxF5DbGT5htrrk5YgOA+scpYjVb9Z25iQ9Uytxx0w=;
        b=UhSEe/FH3csRXbfrQyfmz8drIhXJq7AXUF6hyjRFZJNkOW8wXH2SZ0drbDY5D/6K7d
         wkOCkNZ8DiN1kWKKi+zrun9RCVTafBUk5bGYzYa60owXf2rHKoV/hrJAyyXpzOFbCi+B
         nx3LsH0I9rj0Z3oEySrptFiAHcb/z3gl9oSgTINMZDpuI+bishIH8+KLtPc1E171Je2L
         bWQMNHH3aqkZnUeHarPMdtgir/LplciIfwMwFVz7bAnE8iH8gFYz6wL1BF9oMg0qGRqI
         5LlBCzsUWSkXfiURQCzvd6JgIacD0eoFUFXddSMFhIEhyOA9ak+r9p3wcEHSjLJdQ2Ve
         n2gA==
X-Forwarded-Encrypted: i=1; AJvYcCWN3mP59fixzRDBB11w27DG1J/AWc0TsOvcZI+FqXgeEKslGoV7b8d1RdclMvmkLcRNCNxvnV4G6bDKNHo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbh4Ji0fD4VD7puRElaXw5t6xr7znTvnz6WcMY2ZOEOSvmP9TW
	h/WeZt0WMDmhD0snE0JefY4e6Lw8WsS5GEOlpZqdCfW+RrhSHgJSMAZMTvjMTZM=
X-Gm-Gg: ASbGncvgPQnnJNk7yv4vGnf2E96Buasip4qRCljFasDMcp0dLZahGKN3DFJXsHD+69A
	H4PjfNqq+OCsQDN9rSddZgAy/Cq/8JMNr3QAjYrG/tJ7AEFKbZna/vM7L2CigmTDfhdrprU7cHg
	TRITT5XpNzz7wCiw+5qUgMJvNfM11ApjIi3Jhzt6NzICkbkn/azVSVEpoJAyz4s/qCRKWdi5ldl
	oJXzvzzpCMx4KqcGd7wodXBUCyTsNbWlmmdDw8aVNL1Iw2V6fngzdOGruZTuCjfrUD6xpxd72jv
	/uJXB+TyjJ4QV7b/1JFrbyIVV510UuOTOOWiqYT15g==
X-Google-Smtp-Source: AGHT+IGlq5aQo6biEBoKrYltKM02BlS5tU2XYCn2QzFs14ArIDjnApRfpVJZzbfhnaPVk4Nsu5WREQ==
X-Received: by 2002:a05:600c:4ecc:b0:43d:db5:7af8 with SMTP id 5b1f17b1804b1-4406ac0f3c0mr111465995e9.21.1745317592548;
        Tue, 22 Apr 2025 03:26:32 -0700 (PDT)
Received: from localhost ([194.120.133.58])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4406d5acccdsm165855825e9.11.2025.04.22.03.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 03:26:32 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amdgpu: Fix spelling mistake "rounter" -> "rounter"
Date: Tue, 22 Apr 2025 11:26:26 +0100
Message-ID: <20250422102626.29965-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake with the array utcl2_rounter_str, it
appears it should be utcl2_router_str. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c
index d81449f9d822..c48cd47b531f 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c
@@ -1547,7 +1547,7 @@ static void gfx_v9_4_2_log_utc_edc_count(struct amdgpu_device *adev,
 {
 	uint32_t bank, way, mem;
 	static const char * const vml2_way_str[] = { "BIGK", "4K" };
-	static const char * const utcl2_rounter_str[] = { "VMC", "APT" };
+	static const char * const utcl2_router_str[] = { "VMC", "APT" };
 
 	mem = instance % blk->num_mem_blocks;
 	way = (instance / blk->num_mem_blocks) % blk->num_ways;
@@ -1568,7 +1568,7 @@ static void gfx_v9_4_2_log_utc_edc_count(struct amdgpu_device *adev,
 		dev_info(
 			adev->dev,
 			"GFX SubBlock UTCL2_ROUTER_IFIF%d_GROUP0_%s, SED %d, DED %d\n",
-			bank, utcl2_rounter_str[mem], sec_cnt, ded_cnt);
+			bank, utcl2_router_str[mem], sec_cnt, ded_cnt);
 		break;
 	case ATC_L2_CACHE_2M:
 		dev_info(
-- 
2.49.0

