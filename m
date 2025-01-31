Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443281B6CEB
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738314467; cv=none; b=HQYUhLY7utQo07pZYYPHoXUANINQCWj9uKJ4Hii9MOaB12OL9XkzE6fq9fyQVYTHROzYMnIYRPdssF8z90l+EnBakByzASPlnB8mNnWQysw3YTYFpUS+W0jAk1DuyXkh6OoBpcx6QPmG+2L26UnFx4cUwCRGnQgBlPjEr7sSnks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738314467; c=relaxed/simple;
	bh=eKg6mm6l3aKoooXk3pWhI6SIgefA7dd1PtfT5tLmj5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bsqEoBFuOINZBSIJQa6JDssRE+QVMcHUbsxOpkReID2vEAS1MMHvl0y4UIsNh175k0nR5VRp3smn7wyy3rmuUP2zc/JmxJ+cZVzZ3OEaDfwlf3Hl90kHYvifWQt0VsykE8XjrT4hFZeZlU77TfOHkCVn69gIqnf/RmOfPuLtTm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CIHYp6aO; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CIHYp6aO"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-215770613dbso22353865ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 01:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738314465; x=1738919265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4r0pcOBNOcRsnBO2Q2AoDymvU1L0RHp2karwxkPTEA0=;
        b=CIHYp6aOyl03BdQiF+ba2gtq6osaQPKCF4cmMkNdLQO2tBJb1f6ykgidyaWBVBbIpb
         NvodFN5rzimgMglMyL2+DPTSdHGSNN9sIFEev7GeJsVciBKFcWCZnacSpETs4o+jyH0Z
         MQ9oDXkfTO+qHCTqRh6z0VG6ZckOI/ob++RdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738314465; x=1738919265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4r0pcOBNOcRsnBO2Q2AoDymvU1L0RHp2karwxkPTEA0=;
        b=JYn9TFKoEiapPfL/DQWJs0EUDOB9nap8nc01AwV4eJZ9Y1VFFwmg15FaRPCUptNp13
         t3AYY0Y0x09ddl04v+1/iqjxt5g9e2p7FlHdQEvy/xPAVBaCCv/3o49Tqc12L8y69BjN
         iXa4F5IS6umW8YbC88ZDe1KfdGZ9aiXa11NY5XaluKLhtWFcbS1FGyqbNoHpq/iefi0t
         8i5Hfnzr9DevqihL8ePozEPHIm5JCU76vSmxrDHj7i2jXBRh9use80IyCHzTyoUK0YAW
         I0FDBJrbiCVSc9vRBEK3E+UTsYc/KCWsIHsxU2js6WcSepM+LuxJNPnKjeQ4jP/ziErT
         0Y1g==
X-Forwarded-Encrypted: i=1; AJvYcCWusIlWcLRmuCi3eCZ4XzpieJ+vmkwXFRy6wM8QDtO8/6Jel4BprBz/3W+8Mo2krqiCO76Qad9tGYX9fn8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcmxjiu023y8aUhu3fK524ftk20Yna5QzkntP4HKxIjh4Re/wK
	4pcepBJPG6RhHKQuO/GgfFxDy/wKA+apxABwSbGt8lQYj1KeX4T+KIuRyeZFVA==
X-Gm-Gg: ASbGnct9Ng4EZmQgKxdxPYAPC5iFBsvP4em0gQdPlplhaUvPUME/uTltMmksTrFz5Yh
	WE44yruvcUZK6kGlRcFfrYWtP5T6isBrAFOe1B2MufErMuhoHmHqAf5lGAC8WGOGkNOhCBTCKH2
	hjntzuznikdn7pFOtqLfXuTR3LpcyX4cJpX7zTluP5WiB8nbnDjRr+rfBHaT982+unhcIj37rX5
	CtzBM510GZAIMVicJn16dN4XrJ5y3u3ZuBMKpcdZfnl+adWuFj3ehmnEVZ0LOkRFjLieJHI1TpX
	n8GNrDlTnUAxjZUhkA==
X-Google-Smtp-Source: AGHT+IFVF6qQXP7j68CfVjgHMYTUsYqMzGDzrbpNfx9vlhjUIvaCbiwn0ENvclvQGAhdyEYDWrJB0Q==
X-Received: by 2002:a05:6a20:2d06:b0:1e6:8f30:df53 with SMTP id adf61e73a8af0-1ed7a4dcd34mr15160965637.16.1738314465661;
        Fri, 31 Jan 2025 01:07:45 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:c752:be9d:3368:16fa])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72fe69cd801sm2784910b3a.123.2025.01.31.01.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 01:07:45 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv4 10/17] zram: filter out recomp targets based on priority
Date: Fri, 31 Jan 2025 18:06:09 +0900
Message-ID: <20250131090658.3386285-11-senozhatsky@chromium.org>
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

Do no select for post processing slots that are already
compressed with same or higher priority compression
algorithm.

This should save some memory, as previously we would still
put those entries into corresponding post-processing buckets
and filter them out later in recompress_slot().

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index c500ace0d02f..256439361367 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1811,7 +1811,7 @@ static int zram_bvec_write(struct zram *zram, struct bio_vec *bvec,
 #define RECOMPRESS_IDLE		(1 << 0)
 #define RECOMPRESS_HUGE		(1 << 1)
 
-static int scan_slots_for_recompress(struct zram *zram, u32 mode,
+static int scan_slots_for_recompress(struct zram *zram, u32 mode, u32 prio_max,
 				     struct zram_pp_ctl *ctl)
 {
 	unsigned long nr_pages = zram->disksize >> PAGE_SHIFT;
@@ -1843,6 +1843,10 @@ static int scan_slots_for_recompress(struct zram *zram, u32 mode,
 		    zram_test_flag(zram, index, ZRAM_INCOMPRESSIBLE))
 			goto next;
 
+		/* Already compressed with same of higher priority */
+		if (zram_get_priority(zram, index) + 1 >= prio_max)
+			goto next;
+
 		pps->index = index;
 		place_pp_slot(zram, ctl, pps);
 		pps = NULL;
@@ -2132,7 +2136,7 @@ static ssize_t recompress_store(struct device *dev,
 		goto release_init_lock;
 	}
 
-	scan_slots_for_recompress(zram, mode, ctl);
+	scan_slots_for_recompress(zram, mode, prio_max, ctl);
 
 	ret = len;
 	while ((pps = select_pp_slot(ctl))) {
-- 
2.48.1.362.g079036d154-goog

