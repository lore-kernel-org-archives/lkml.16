Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CABA18CC1D
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738314458; cv=none; b=DUcgCxI++hIl+QBKnv7PRN49vOA+iOFd5EnegrA5pNq43tbdY6Zcd5m32WWcmAdkdUYOnIXJNaKQx7BJ2W2uW8huVZDr62u1a+hj9kJO7jZ0c8qw3+ehW2peeEQG2SyfxfTpdj9+xEP89pbhdsEtvgeRaS+aetl7oaT63s7AH0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738314458; c=relaxed/simple;
	bh=eYElRTtxdEwu20akPtpsJLzQq/4V058HHKoMVhHbTXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qPVEAqWin8s2vprXiJrhgOYXjSri55RV4IA0SG3IWvQOEeqRXxzjXEpK3PpXdPAe5bPTB8hYZfZhukkIHJkBl+/ylkhe46w3xZ7TRVXwJy6dAecg0OS8R6HKVOhtKC/9JK6JZEUH1tGSvcRnYL3Z1krykPk0YvPCFe3ge9gr/F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PTQnPOlq; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PTQnPOlq"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-216728b1836so30036365ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 01:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738314456; x=1738919256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oU99tlqEx3VP4Fr6vsoC6pVJUm4rK42GNNjPkPWz9Uo=;
        b=PTQnPOlqcWCNfBZv51PKRvkCzMlxlWHY6N4F8+NMBHlbBwjGxyaoD5GClzy4XQF+1Z
         AzWkOrKfQ8SuSTHb+0ixKmIYZ+LzBuPnyg2tv16ae90CjPrLtK1vwb8/1bcOaisoK6o7
         4RI02xKaeQupOQJuBNGMVBaVmtsLc7gGFqs6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738314456; x=1738919256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oU99tlqEx3VP4Fr6vsoC6pVJUm4rK42GNNjPkPWz9Uo=;
        b=N4jdKliq/MgUxo+kaefTUZ30RS6oRCep0DQ0HYmM4sAN/ivvh9ZcXpPDVDzqUW/o7L
         A0zac4wYJYnoYagi2OSbMi03686GUrgc/jVnpnLJ5Ff9QMnv8py4g4RCEVjBmOGAH27h
         vyy33pEUF2Wrc8QZ9husoPvuvjh+5LWVjeYPWvSJmza6GdW2boxJfK17PnP51zcy8AcK
         0trqTzuiGl6F57uC7m58zueKXONlJuVK3im+CmW3ohRM0t+PukVZ1vy8bgmCoKawwIOB
         fyaGWgDR/gYmFcVkHS3xNKvvCYH3EtB33QcNYg4E4YACn4tUIZFCpQgk5yJ5FKqP9RP6
         E0Sg==
X-Forwarded-Encrypted: i=1; AJvYcCXxkzxMrToFlBU21ZKCuCUNV2fm6797AaSJm8oBjh6yO1tsTCGE6zQOfjPAbGLS35MwE16w9wg3KZ1mgEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE4FFexM5h5yd8ZgyLI9cTEQtvq7JzGEez96gND8Y++Gh75Rs6
	dQDQ8hVg+gt1Bmu7RYRzrf6hFFgfyn5dIqOrFCJdzr13wtl8Ejm/mDpCOvaoxQ==
X-Gm-Gg: ASbGnctVoK2IofbUXdN6AKhBRS3kSzaL31SH4/wf5vbq3wgU6YAm3ySrsz50SynTYr1
	KqanYSN2h1OkdY2ZOjhmbbl286i/kA0UUDMmDks+Bl9INUnclPXowRm0LVTvZn9Iz+Pvv21au1k
	jzkisdkwRuVEfOACqWr8cH9QPUv3e7Qu94OZxH9zDQLgZRpGtYSk7D+HwZO8nSUFSXC0ItZRFzj
	oRMuyUBc2tJU4zYkUt/hmYNxdBEec3BB6NxiPuU8eWzezSxLXDAOdz0RxQFsTN0WrdLDInoaGLx
	S064kMCc5O9X7rHNcQ==
X-Google-Smtp-Source: AGHT+IGQyeOJINoq+3olFAJs8BwSF3tpMesiAuDGnBGSVFEb9/qgBFf2sNzJkKESZdssbJAVfH6Lfg==
X-Received: by 2002:a05:6a21:33a8:b0:1db:915b:ab11 with SMTP id adf61e73a8af0-1ed7a640d42mr17388523637.24.1738314456497;
        Fri, 31 Jan 2025 01:07:36 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:c752:be9d:3368:16fa])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72fe6a1a74esm2745081b3a.159.2025.01.31.01.07.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 01:07:36 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv4 08/17] zram: remove writestall zram_stats member
Date: Fri, 31 Jan 2025 18:06:07 +0900
Message-ID: <20250131090658.3386285-9-senozhatsky@chromium.org>
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

There is no zsmalloc handle allocation slow path now and
writestall is not possible any longer.  Remove it from
zram_stats.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 3 +--
 drivers/block/zram/zram_drv.h | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 33a7bfa53861..35fca4c468a7 100644
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
index 3ae2988090b3..219d405fc26e 100644
--- a/drivers/block/zram/zram_drv.h
+++ b/drivers/block/zram/zram_drv.h
@@ -79,7 +79,6 @@ struct zram_stats {
 	atomic64_t huge_pages_since;	/* no. of huge pages since zram set up */
 	atomic64_t pages_stored;	/* no. of pages currently stored */
 	atomic_long_t max_used_pages;	/* no. of maximum pages stored */
-	atomic64_t writestall;		/* no. of write slow paths */
 	atomic64_t miss_free;		/* no. of missed free */
 #ifdef	CONFIG_ZRAM_WRITEBACK
 	atomic64_t bd_count;		/* no. of pages in backing device */
-- 
2.48.1.362.g079036d154-goog

