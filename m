Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AF41AF0BB
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738314454; cv=none; b=nG7jtXnJALcmJuFwbutf2wxA9lA0uS1YFzN4ljLyUDlBmjN2BO8lscgeP89uKbZi0jbiAYDvYIMnXz0dfBclJ1KILhLgMM7nqY9YJ90HKeqyIZktR3GreGW/daun/vt59HNU8fceJXaYWv/6jNPn8sy+NVPDPXltZfqajEld7N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738314454; c=relaxed/simple;
	bh=CXhCh51ip+KADorGgBF7on/wwxCRKVCWCcm6nJuZ0l8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NJVDZjJdYuIBxdvSq6RIl/kIgydYSucMAPO0+mmibdAxNw5kPI9hJ2/1r2wzWBykWtK3LFucTMA7Usy1cWMMvAp+JaMDxbpF4cTO+nnB6YRx0IPfzHQqHZ1jeuPUfyErAaHH9C6rkvUpWhdWRoRiIKyOOYluFWLhALA7bP00Mek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ye5Apf6u; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ye5Apf6u"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21644aca3a0so39627115ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 01:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738314453; x=1738919253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIS0Akli6K3ICDNolLXeCGhuZ0MDBrb+zo33V4R+vJw=;
        b=Ye5Apf6uMCUfVApfV/D6C78izOmXFDhxHH57Y44IaOwbwl3hz4ihNBUxKgX4dT0XSl
         f2e/ihqwZvGVf5zONIQrPCw2JJULtH77d1dX+4BTualwDkQewfYZlr5840GhNIhHT7nv
         T9x6Rtbh9zWI3dEwmlSDgWsToXPVyPCZlziF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738314453; x=1738919253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIS0Akli6K3ICDNolLXeCGhuZ0MDBrb+zo33V4R+vJw=;
        b=B+v4fch/WBvapaI7vva2nuQXM32fD/gQNv2Wdhm/xVusb0v34nwfw4iAovp3CrkrEb
         wQsgyhPb+Ie2cp8i7Ut7D4EyBrKQW5jGSRZ8HIeKJeXwuNo+oCfBoi3hwjmbc6GSXUY7
         B6SE8jG+wJS0bXupwXLWPzH1BY1FEL5UHcQ+fd32cG0M0FvRBH5VsdCJE38AZqVCpo0r
         2HD1vpYYXc4EUVbwaQZ8WWjlvFCcgIMLmthanAaqtoQXTEOmK6xvMjeBo3EmAWREOVWN
         XdMMbvXqpstxdYqFlebO82tGq2Xy2UItPq6lmlmFexrSTl1Fx6iWrezNCVmWWzVkEXEf
         qW/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUk0WHmY11KFJEPU/U37QDLYUY3UUwI4EE2gw8xaS/aBdxYhVkZbKCSnF/ox50M46xHW9DCd9WhnucmDXM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWEk/lD7akNdTaSWzXqZ67rsKxshZbWpAoMmAizGLl0fQGm7nq
	43e2TS9loWEHUYrVclI4WraOtU1K9g5tXBm1xLnFpMde1iSs9zXt8OL3sy9OUg==
X-Gm-Gg: ASbGncuAit5Tn6uyMbRykKCjF/MoHQdXEMSvNW9ojnFN+z0eUD8/hx1DyZ7Xzpekhjq
	rn1y1yEIseUm+B6qGxB24WOfU8JpZVtl7v9+ReXOgSX2kMKLJCJBaQF1lYfEmJrPFqQshD0etLc
	iqsfSHgFauBnGY85w10AofC4LQmdULhPW9H0jcNWeaF2ck5kVYTz9YYiVhfRYxG5AberqmvXlV3
	eT31IUV1HHcvDFeF+CPT3REXktsSeNKTTik4XbKcIwRDeJK+/fb2t70UEmWRqxjij3K8PKDm04D
	oEDI5xeb5w0p0cICVQ==
X-Google-Smtp-Source: AGHT+IGDstI0UvROyDnrpX/fcD3zobh8n0WWgBv7PtyE0EXq8xnCiPT08ZRIDCaJlns/HLlSY9XhVw==
X-Received: by 2002:a05:6a20:3d86:b0:1e1:bf32:7d3a with SMTP id adf61e73a8af0-1ed7a6c8c72mr16361840637.26.1738314452868;
        Fri, 31 Jan 2025 01:07:32 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:c752:be9d:3368:16fa])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72fe6a1a75bsm2781771b3a.167.2025.01.31.01.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 01:07:32 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv4 07/17] zram: permit reclaim in recompression handle allocation
Date: Fri, 31 Jan 2025 18:06:06 +0900
Message-ID: <20250131090658.3386285-8-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
In-Reply-To: <20250131090658.3386285-1-senozhatsky@chromium.org>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recompression path can now permit direct reclaim during
new zs_handle allocation, because it's not atomic anymore.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 0404f5e35cb4..33a7bfa53861 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1979,17 +1979,11 @@ static int recompress_slot(struct zram *zram, u32 index, struct page *page,
 		return 0;
 
 	/*
-	 * No direct reclaim (slow path) for handle allocation and no
-	 * re-compression attempt (unlike in zram_write_bvec()) since
-	 * we already have stored that object in zsmalloc. If we cannot
-	 * alloc memory for recompressed object then we bail out and
-	 * simply keep the old (existing) object in zsmalloc.
+	 * If we cannot alloc memory for recompressed object then we bail out
+	 * and simply keep the old (existing) object in zsmalloc.
 	 */
 	handle_new = zs_malloc(zram->mem_pool, comp_len_new,
-			       __GFP_KSWAPD_RECLAIM |
-			       __GFP_NOWARN |
-			       __GFP_HIGHMEM |
-			       __GFP_MOVABLE);
+			       GFP_NOIO | __GFP_HIGHMEM | __GFP_MOVABLE);
 	if (IS_ERR_VALUE(handle_new)) {
 		zcomp_stream_put(zram->comps[prio], zstrm);
 		return PTR_ERR((void *)handle_new);
-- 
2.48.1.362.g079036d154-goog

