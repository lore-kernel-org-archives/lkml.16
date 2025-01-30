Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A0284D34
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 11:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738235515; cv=none; b=jTsFqTsPBBNkjJIpy/uC/fjCGwJkkmBZNbD+z+eQ3QnPf3zQ4hk62uDODA8gAE6xRWxcxAZAMIxqhivBPcDnhBO6AVOltmX2jEAPfRwFJMR1UYTRyBGAnRFJwRflzXsRnkU9onBk9yYJRXcbp/RuMnOOJ+rCwdtpRdgWns7VK00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738235515; c=relaxed/simple;
	bh=kRAbWKJJ5y8eaP0OOtOHFcqB8zgDUzcJUDjcrxd/eUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hkHK/GoeXCwae6tW8H4+ufUZ0WQbUbOmjpJqYksxTeoO0aHqxInei4OMwVrD72WnUsJfDKrCnr4LRip5DQi1+mqcGNnBPrc32AF3TCMh1i7HqUwnwTHJMF/p9MZVqGBkUF8nDx1IkdCtiRGGxmvfDtmOENE/Nx6mpG6pg1nmACI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TN3h0kBO; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TN3h0kBO"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21bc1512a63so11318085ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 03:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738235512; x=1738840312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8q0TE8Cfn/ZZzUdNtKaagvke7zTsDMFwn2syZsA7PY=;
        b=TN3h0kBOcDWrdbuEEnW5Re1eTSnlLR+p1WBmyVEUsu4EJB18UOEAmPNKb7GgpdwOF5
         56GCq6+67uALZOOLKXz2GPuSCE5r5lqVltF5DlTZViJrAe05BlBtmbSDriiWHrjxdKum
         xj03hS2QmRkgl7gKWf8bRotnosvcNEDR//6oI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738235512; x=1738840312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j8q0TE8Cfn/ZZzUdNtKaagvke7zTsDMFwn2syZsA7PY=;
        b=FPftV/kRmmr7Nj4agDQAuzqC4HHNnKmWyMOmVu1OZJH3iOVqF5OxjO6VT5FtEZuVpR
         tYIUzUo+0vzaPNnyO1OyBiroMJbbFFhHQuZvq9LNI8C18ZVljcYoRoOVfo4cOOTdYzdT
         Vt2969ZHnlhBrA6zfeGeBdP0MS7kftnDnkImFf3+MghGkfG6cG3GG3R0F1348dnQYngE
         loWEyRY1DZNZXqUReySHOLEwd5sM/QfNttTub4pzIQlAHh08BgHahXSQzlISgEtvrzpi
         EHEP9TeBgZ4Ie5pliMXjcF7xl7ZmRNqKKL2LTssScqjAeCuETFFAw2jgzD2EA4/jv2cf
         hXkA==
X-Forwarded-Encrypted: i=1; AJvYcCW4/BvZZfAJciB4xdrmQ335OUFF+GVq2MFmyHiAsf/Aa0z7dBlAalrjKiDN/x+f88B2PGTJgvMbje8KjiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAK+4QSCFaMrP9sxXVsvwo1DOsWIabQ0XcTcmeGrmAKwBt6lfX
	vnnbD34Kk7Wfvb3JyGl6R09U+6IC7hm3aCSkmZ+3pGM/MO0EGS+LHArJJUeD+A==
X-Gm-Gg: ASbGncsVSSh+vNq4dhRchF0cxDQdNhfIQWNzOFs0ZDAsbL7V8kt1D3F/zCgk41zUOD6
	gqjCx8c6PqulhuSKs46XRLpDmu14xaz0reIhH1XLzTm+4ky3Ir7UoUV5HU0XcTsaT7tF/IhJD4R
	oUtbXuz8k09xOtS5wwcA82hMEXP9ADYHjo1z8YqEkT+TWq7kTek8jFYjraQqncekYz4OmN46S8U
	zyIEB7drp9kSSceLkNWiRUCSRpn1PfkMAWelVoFQS9aCa544psyor0wJxrGuiXjPjWLNl/vSZy3
	n7b9RaQkhKrJDIFt
X-Google-Smtp-Source: AGHT+IERWIfj8pq2Tiil2nncQexj/06z4KXWkO06dhH+74uQD2LlR8gXztf4GGGtlqNiKmWRpbsKLg==
X-Received: by 2002:a17:903:41c3:b0:215:b190:de6 with SMTP id d9443c01a7336-21dd7c49786mr81937115ad.3.1738235512078;
        Thu, 30 Jan 2025 03:11:52 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:d4ce:e744:f46b:4fb])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21de31efba5sm11500615ad.6.2025.01.30.03.11.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 03:11:51 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 08/11] zram: remove writestall zram_stats member
Date: Thu, 30 Jan 2025 20:10:53 +0900
Message-ID: <20250130111105.2861324-9-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
In-Reply-To: <20250130111105.2861324-1-senozhatsky@chromium.org>
References: <20250130111105.2861324-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no zsmalloc handle allocation slow path now and
writestall is not possible any longer.  Remove it from
zram_stats.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 3 +--
 drivers/block/zram/zram_drv.h | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index ac8b4f47a496..af4bce1e5fe1 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1430,9 +1430,8 @@ static ssize_t debug_stat_show(struct device *dev,
 
 	down_read(&zram->init_lock);
 	ret = scnprintf(buf, PAGE_SIZE,
-			"version: %d\n%8llu %8llu\n",
+			"version: %d\n0 %8llu\n",
 			version,
-			(u64)atomic64_read(&zram->stats.writestall),
 			(u64)atomic64_read(&zram->stats.miss_free));
 	up_read(&zram->init_lock);
 
diff --git a/drivers/block/zram/zram_drv.h b/drivers/block/zram/zram_drv.h
index 045032acb22f..b7e250d6fa02 100644
--- a/drivers/block/zram/zram_drv.h
+++ b/drivers/block/zram/zram_drv.h
@@ -78,7 +78,6 @@ struct zram_stats {
 	atomic64_t huge_pages_since;	/* no. of huge pages since zram set up */
 	atomic64_t pages_stored;	/* no. of pages currently stored */
 	atomic_long_t max_used_pages;	/* no. of maximum pages stored */
-	atomic64_t writestall;		/* no. of write slow paths */
 	atomic64_t miss_free;		/* no. of missed free */
 #ifdef	CONFIG_ZRAM_WRITEBACK
 	atomic64_t bd_count;		/* no. of pages in backing device */
-- 
2.48.1.262.g85cc9f2d1e-goog

