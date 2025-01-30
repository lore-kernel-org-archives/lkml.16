Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5EF1E412A
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 11:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738235519; cv=none; b=rrlBhLjcOXeIvyI3VMlbmb2hxEjHImRm3TDD0z8duoabGTPWU57oYoZIYeubf2H3sAav1mLwrX7+4uwiVDkaqK0G1m0pAaf1p1ZaWeiQtKE2I1wxDdlzEwLwC++uSNVlOC+u5uNKH0Iqcxz/c9pZguRXDu+zI9eqxdb7r1U8sww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738235519; c=relaxed/simple;
	bh=mDnXt5ij7Tos2MO2avtGUyUVgMTFEnOrPvFNbYuMx3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OBKOZdsULhNdPy1ZWyLkpqvmDDq5g1aTrdKDE7HqUkJwDczHUdDdWIxLu0wX5Xy9sSFw2q8Vn9N38WfDCiR4n8gI69Y0xLrPtYzTWRruXkZPPxNb9NyeYxunlmvzcZVtKwS2wMWiy+DdL+mos057DOldzd/XfwS7WXp1VCcZjcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R46+FyN/; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R46+FyN/"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ee50ffcf14so2748360a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 03:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738235517; x=1738840317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQgITLXPodNhhg8f+6QVX/YiryNImYUIb8lIo2kz1cc=;
        b=R46+FyN/ZNzWiPkDbXVxDeYtxDmEoAkqnVmeOf0zytlaiQ9R1yVzfZlmPuH2rpL3ce
         4xCT3sZA3r5KV7SMqZ9kaoLzeJ2yZcnG/2aUz9rKtZt35dLdsPUvYvvospgdTh9sLiVo
         9fklCzWF2lrQj/w5ledP060Y1fHZXPjNX7EH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738235517; x=1738840317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQgITLXPodNhhg8f+6QVX/YiryNImYUIb8lIo2kz1cc=;
        b=FiiEsqw78IjC/WMnE7MaC/+IIJr620XKYTJl6d3A0FAlIgCXiMbJespRnayfqsdnWo
         zbWSd4yplDm3bMdrLkVHMJZwu5FhBzVEaaoEdpscl1ZDVwY2XYbH/eZ8h+5sR7qJoJ1t
         jZlz8UdrCSXWuYwH9S1fiaSSmeRsRzRGF8b/B1563Hx3dcUuv3ccT9+dekH2P22fW2z0
         mrpe5wL4RltxEWZsQqRpmsY7h4/MgBd4VydW1UNNHf6X8U3FwdItUp0LOOCjpRxNQ+fT
         ERO00fYCchdHAjoNeWpH9xKeU6YR30LeHgzkM1VecIcjy2h/eUnXpezRlaZr3n2DoHey
         fQiw==
X-Forwarded-Encrypted: i=1; AJvYcCUfSUAyxc7nElfpdrc5+X4r5+cBKzNBPE5Eh5mf6oND/Ok7+V9AC9EkBLbwFh8IxKrCthTbac7Ar0c67+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJyDwPTDKhgdTTmza3NjJv0zRWejv0UJNAaBbSgnNjBrv9LD8+
	n3BfJYSHQMlX5HcQHLjGsC/OHYRNszDh8ulwsQlss+K7jWh+0b83oCrjbe6X3A==
X-Gm-Gg: ASbGncvInC0QUkNbrV0tcP9/HGu4DFXLNJOwxcwV0ullIjw6At1E+bBIX9gQUYkc+qn
	JLfdehCs3LPgh/EWcn17s+jMC4ISzFU+sUiI8bsLdy1vwL3m8bhq/gIAwhYuYLxcqSVPs6MTO44
	SM9pfw3rVbDFySyxmdiZlkOg7jkIUH9YZVNjYGQZvjOmRTJInCqerY/oHMlm57wXG6sXi9pA3uz
	S4VSxF7CquIeiWaBhrZyrOtRBrjODpkLkoMsbQm/fU84c43KpWwx/WA2kaOw49p+xF+UzCe/FYY
	z8ANzACEstj2TTrU
X-Google-Smtp-Source: AGHT+IHdIqAq1Ip7rjsfMeTr4P2qYVZikb+j/nc93lXmG1/0trH7vosRiIP+YWEpphAlbCSobUlWtw==
X-Received: by 2002:aa7:86d6:0:b0:729:425:fde4 with SMTP id d2e1a72fcca58-72fe2dbbf37mr4157189b3a.11.1738235517164;
        Thu, 30 Jan 2025 03:11:57 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:d4ce:e744:f46b:4fb])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72fe69bba21sm1144810b3a.114.2025.01.30.03.11.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 03:11:56 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 09/11] zram: limit max recompress prio to num_active_comps
Date: Thu, 30 Jan 2025 20:10:54 +0900
Message-ID: <20250130111105.2861324-10-senozhatsky@chromium.org>
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

Use the actual number of algorithms zram was configure with
instead of theoretical limit of ZRAM_MAX_COMPS.

Also make sure that min prio is not above max prio.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index af4bce1e5fe1..3e91fd1dcfc7 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -2011,16 +2011,19 @@ static ssize_t recompress_store(struct device *dev,
 				struct device_attribute *attr,
 				const char *buf, size_t len)
 {
-	u32 prio = ZRAM_SECONDARY_COMP, prio_max = ZRAM_MAX_COMPS;
 	struct zram *zram = dev_to_zram(dev);
 	char *args, *param, *val, *algo = NULL;
 	u64 num_recomp_pages = ULLONG_MAX;
 	struct zram_pp_ctl *ctl = NULL;
 	struct zram_pp_slot *pps;
 	u32 mode = 0, threshold = 0;
+	u32 prio, prio_max;
 	struct page *page;
 	ssize_t ret;
 
+	prio = ZRAM_SECONDARY_COMP;
+	prio_max = zram->num_active_comps;
+
 	args = skip_spaces(buf);
 	while (*args) {
 		args = next_arg(args, &param, &val);
@@ -2073,7 +2076,7 @@ static ssize_t recompress_store(struct device *dev,
 			if (prio == ZRAM_PRIMARY_COMP)
 				prio = ZRAM_SECONDARY_COMP;
 
-			prio_max = min(prio + 1, ZRAM_MAX_COMPS);
+			prio_max = prio + 1;
 			continue;
 		}
 	}
@@ -2087,6 +2090,12 @@ static ssize_t recompress_store(struct device *dev,
 		goto release_init_lock;
 	}
 
+	prio_max = min(prio_max, (u32)zram->num_active_comps);
+	if (prio >= prio_max) {
+		ret = -EINVAL;
+		goto release_init_lock;
+	}
+
 	/* Do not permit concurrent post-processing actions. */
 	if (atomic_xchg(&zram->pp_in_progress, 1)) {
 		up_read(&zram->init_lock);
@@ -2101,7 +2110,7 @@ static ssize_t recompress_store(struct device *dev,
 				continue;
 
 			if (!strcmp(zram->comp_algs[prio], algo)) {
-				prio_max = min(prio + 1, ZRAM_MAX_COMPS);
+				prio_max = prio + 1;
 				found = true;
 				break;
 			}
-- 
2.48.1.262.g85cc9f2d1e-goog

