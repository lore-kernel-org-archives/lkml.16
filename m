Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2F614293
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 04:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738212345; cv=none; b=OUshBSDF8f7aIv57iteGjmiCv9kn//WwtcSDq5vAgqGFl6w4zCPz2Hs3azrQVKp4V0ljZ0MQkM9jBHarM4jU4hNSl4KPYTE9It+Hp0jT7e/v4bKoplzYQvw0wgXJNaQ1i/jHZf5UAU5blNV22qRyKVAGHPhhOhfC/ed88uPUo1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738212345; c=relaxed/simple;
	bh=kQOe19FMRhzWZQFPSQJ2h1HjTwoC6pXZ4Qv7RQgvqrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OFQ/dNtxEvy7CrEYWQbrSCkcm7eMZ5lKFgN5RYQGRHZ2uEkqaFDsDJETVvulb08NqT4TSnCnwKp9ZDWgk3ALrvapBQcu62VTlRxEe5ld0veI0SXStHoEz3CTBu9GdrtJdcT2O/TqA0YaaXSp1W58Iw+H7cv19+YD9vPmtzXS57I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F+eTlotq; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F+eTlotq"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ee8aa26415so576718a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 20:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738212342; x=1738817142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LjUByDm3ba8JrZJ2xgEVKiM3B6T3dmGtNNYJyOcrU3Y=;
        b=F+eTlotquju/yGzTNB3Z3pmZsr3B/m8cjhRR9eMEhn4SHaN8LrN0xpBlHOd/3Wfzms
         eQH3KIUbqluO/chKooONiXu3FPoK25N0FHYaXw7S6x8hx3QcZSGBTfkv8XDjjiLoimEJ
         IJ9CmwH33yAwDIbtLTqcjdCNIjNDYoih37q+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738212342; x=1738817142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LjUByDm3ba8JrZJ2xgEVKiM3B6T3dmGtNNYJyOcrU3Y=;
        b=aftu54CCAtTBiaz3rPHzwMoP/AIWurcyUvsteCvC0QgueDIUUqW4xvKLGDBUNe7APM
         cy8u8lU9VBtPqAryPLRdKBdGHbj+/1z/MkjVUFO1h6603mnUw02nlSiE3qlwb8jZoVtw
         ojwF2opgRppT8UcwFVPMie4m+W7CwGbObj77Eyw2ddDCcukJKJCtSa0rmO6kb7+9NFSc
         KlGogLdFsTsGXZF+fEoGlZ9VKgDguJWBpu/VNvtQ6hoIIWIMvcqL6qmneHlfrM1lAudC
         9t/7ekcHW+8PQjcMXa4gioT/Rgh3KBvgBQovZptomNPcRc14LY5mcPZdOf+lSNlUzItj
         TWLQ==
X-Forwarded-Encrypted: i=1; AJvYcCV42sfZC8y8VkO6845wIVXBQxxkAWxlqxDzjPzPszwuHvWRg4nzCxxGH8cv7X8gyAPchhE1rplHKQcf2ZI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt3Jk5Ii4GG/AkW8vKrpyh+/eSxlCCUI2GMssSJYwhGX/pcYMa
	CsaJFJzFURX46djZI0YUrCgaQttaEE++qvBu+cXftHIjqCAav5eY2m/P/hN4Fg==
X-Gm-Gg: ASbGncvhTRZY2YXK43q4jG+gZoLhpDz+LN8zOyo1F8j7wBvTUuH4Vej8p0/gdGiln/W
	gegeKRC6B9RytNNO9N5sGP6JQfhq9upD0DsCmPSXxPZNrybMCegUX7gtqDvRTFbFONqc/NOAIGC
	9K7odilpxE3xkCol1x4zq440vJNHLtQUb/PYKljBIVbHB/ZY3Ak+WDVJHX66hYzKML5agFj1GZS
	yXxPvmMzm0nC6CacohazqxCAfyE4BSZ26KNhLPe3ElaYWbnooyN/iHHnPYkuI2TAJeBZv8KJtly
	vmSkt9pl8+PZj7/gEQ==
X-Google-Smtp-Source: AGHT+IGkGP9NGStcdcyDxCKvmSx/umN39Bj6YAsUZh4NBQvKyyiQWE/6vXXCCD2x2gkOQQ39AR/qSQ==
X-Received: by 2002:a17:90b:288a:b0:2ee:d35c:3996 with SMTP id 98e67ed59e1d1-2f83ac8371amr8132916a91.31.1738212342552;
        Wed, 29 Jan 2025 20:45:42 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:d794:9e7a:5186:857e])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2f83a194a0csm2205072a91.1.2025.01.29.20.45.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 20:45:42 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Minchan Kim <minchan@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Uros Bizjak <ubizjak@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv2 7/7] zram: add might_sleep to zcomp API
Date: Thu, 30 Jan 2025 13:42:50 +0900
Message-ID: <20250130044455.2642465-8-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
In-Reply-To: <20250130044455.2642465-1-senozhatsky@chromium.org>
References: <20250130044455.2642465-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Explicitly state that zcomp compress/decompress must be
called from non-atomic context.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zcomp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/block/zram/zcomp.c b/drivers/block/zram/zcomp.c
index 675f2a51ad5f..f4235735787b 100644
--- a/drivers/block/zram/zcomp.c
+++ b/drivers/block/zram/zcomp.c
@@ -185,6 +185,7 @@ int zcomp_compress(struct zcomp *comp, struct zcomp_strm *zstrm,
 	};
 	int ret;
 
+	might_sleep();
 	ret = comp->ops->compress(comp->params, &zstrm->ctx, &req);
 	if (!ret)
 		*dst_len = req.dst_len;
@@ -201,6 +202,7 @@ int zcomp_decompress(struct zcomp *comp, struct zcomp_strm *zstrm,
 		.dst_len = PAGE_SIZE,
 	};
 
+	might_sleep();
 	return comp->ops->decompress(comp->params, &zstrm->ctx, &req);
 }
 
-- 
2.48.1.262.g85cc9f2d1e-goog

