Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8459F1E4937
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 11:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738235523; cv=none; b=ZIbdPV1ZUfwcJpUUUDt1anH9I+ghWlrQsAiltOn/sdR++qA2+uzn0jVI6D1INs1UpdduKPEIX2knJYYe/x0DcGcL65muXBsc9qX1gd8UF6/lQcd0s5SSzKi/bAyztArFhjmwCl88V9hI8kE0i/15CQekCLzj9Hgq/udjjqKCFfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738235523; c=relaxed/simple;
	bh=AMmTlK4+xzSvX2PK3siKLSPuSS5pdb3uTdedljhoVtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pWvn4wZWo9sU7+xmcro9HGIZFNtUCCYe/ECMCNP5JZJNK/k3ef79SjonFL8Gxuiqi/amMZh0nWO9el0kRteFOk7fuz+NgtL76Q4IW4yXlWHqmZk4w/fkOE2FIdoz34v32cV65jECfTtKfpTh1e5Dw9RbDSKrvTJg668xzCh98x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CSXFknMk; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CSXFknMk"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2167141dfa1so9630675ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 03:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738235522; x=1738840322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M1+IQlt9pyJwpRT7WcoMT+zWDZRWfxL4uFL06pInV4g=;
        b=CSXFknMkI/HCtyJOssF7j+/RnYHL08/HSi8jDZbYQG2vFOH1zmuHiJAji6xMFi0TWf
         +SHhswnyR5veMKxWqaBX5gZ7/ZiR6Fu6fXT59T6cIPQ7FTP2p6/cxqI/xdvvpv0JQmxO
         dEooiEBD1l/+PTscPnHuWZujcTAwQvo6nl6sE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738235522; x=1738840322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M1+IQlt9pyJwpRT7WcoMT+zWDZRWfxL4uFL06pInV4g=;
        b=QuKUmOCPEWh6ZGNq7pIxY8RtD5xi8RL5aj0HQboNz+zSFAgBmeOnSkd6bQFIhfghFt
         pxFSgDS8eoXDxzp0m2YWUkQ0lFk2EtthOIgGKPa8GLSPMtjjzS1PztEYUn7uKuyL+tfk
         pp8nhx9MQ2FOp/Pi3W7bqd/R6qJEsUMOEn8UAwFfu8ozcpGgBGEnQPgm5sA6QUjYjuLq
         DlIsElbngdnx/jBhp/1Yxvxa3ZYznGX/vi6A7tIFViTgg+BD25w8vQvTdIJXenH7XTHL
         RQmQ3ZGHYVwLCtQLMKu09GbFwdCyqqp08grQGP3WYL4RdqaAbEv9yYblficuwOvo7nf7
         kOWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0R1sZTyV9jZamBYS2G4SDI5efmaglGvLvN4jWZd6ng25WC6Zy4QnJ83SZdAfvV7pBQSlPSWUUfkZkcJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUGfOVZWS34kZm7hEscTO2lg/lrPw6YGIbBw3izteZxq6SuI9X
	ZmkqyhmCGAhY793ZN8HQc5MDIrf2xgVPg7SXBwXEFswW6lz6NzxKGhPNaTmFu8B7nlCYGz5MCPY
	=
X-Gm-Gg: ASbGncsvLEwQ1siBoPUEkd26+IwHaZculG/AIgkKZ7I8s01pZtZquBmGk0K6W294eRk
	VhW6Hak8NVftFepH+y4YXwdtpQJblHuChPhPHyUNg0kjVu0rllrwWgh/CQkIFYA7B8oR9Ls5rpO
	QFfEGih9RilS8tRJytm4kb83VIoCFXSlmrlXHZ4YRIhmYig2ax00I4FI23nN9MrarMlYq1Qp0hB
	kMYu5qxltxUkfxM4XZ5P5GHc66i0Ww6Pr00JZkEZi1LKn4DOPwAd9VZ+exFMmQ+phAtQffxG7QZ
	etzsVwuwBjQRKT6D
X-Google-Smtp-Source: AGHT+IEpCpAng/2jtEa7zxIDkv9KC8ilU6auGAeJO2psWZMa0QEO4BHwp4dFoq3oCn6eJDAqgONEiw==
X-Received: by 2002:a17:903:2284:b0:215:a808:61cf with SMTP id d9443c01a7336-21de19ca626mr48669045ad.25.1738235521983;
        Thu, 30 Jan 2025 03:12:01 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:d4ce:e744:f46b:4fb])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21de3300880sm11526865ad.168.2025.01.30.03.12.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 03:12:01 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 10/11] zram: filter out recomp targets based on priority
Date: Thu, 30 Jan 2025 20:10:55 +0900
Message-ID: <20250130111105.2861324-11-senozhatsky@chromium.org>
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
index 3e91fd1dcfc7..500d6c8b17fc 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1813,7 +1813,7 @@ static int zram_bvec_write(struct zram *zram, struct bio_vec *bvec,
 #define RECOMPRESS_IDLE		(1 << 0)
 #define RECOMPRESS_HUGE		(1 << 1)
 
-static int scan_slots_for_recompress(struct zram *zram, u32 mode,
+static int scan_slots_for_recompress(struct zram *zram, u32 mode, u32 prio_max,
 				     struct zram_pp_ctl *ctl)
 {
 	unsigned long nr_pages = zram->disksize >> PAGE_SHIFT;
@@ -1845,6 +1845,10 @@ static int scan_slots_for_recompress(struct zram *zram, u32 mode,
 		    zram_test_flag(zram, index, ZRAM_INCOMPRESSIBLE))
 			goto next;
 
+		/* Already compressed with same of higher priority */
+		if (zram_get_priority(zram, index) + 1 >= prio_max)
+			goto next;
+
 		pps->index = index;
 		place_pp_slot(zram, ctl, pps);
 		pps = NULL;
@@ -2134,7 +2138,7 @@ static ssize_t recompress_store(struct device *dev,
 		goto release_init_lock;
 	}
 
-	scan_slots_for_recompress(zram, mode, ctl);
+	scan_slots_for_recompress(zram, mode, prio_max, ctl);
 
 	ret = len;
 	while ((pps = select_pp_slot(ctl))) {
-- 
2.48.1.262.g85cc9f2d1e-goog

