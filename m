Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C25192B66
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738314464; cv=none; b=k6kBb4ZEOUgChTrMZa8bREcMmhiUpmlJjh77pRGGrPhuixHUXNHBcZ3tUWS1xiINnN9QK5R0HP6aJZI0pLlHQpvuLNJWhZEJjFg5Grx/CMBa+/y08W8xz0/TpF1D/Lgz9o3OZ3RaB96RoQ+NR8BPtp06e2/WBGdnrRwpty+iIxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738314464; c=relaxed/simple;
	bh=7ZGwiL1tXOX3hLxvsu4O7FCgVEDZyaXHlMHsK+0BEyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BrRt3QF+DD3/kJq8ZqfTsGWKDh1PWUNa3ncVfenJnL8h9eBnX5sNWgRV36wlfu5W/D+6Ej2A7wG7tUM1LWwxDYzhoMv6fFhEkUxy4dvBaT9O9+7E//iwh2FmCPeVqONdm1awvtQnsBGtzCuRwtKKt2V77y1gPux3Z5AvveGC4Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HljfGqT5; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HljfGqT5"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ee397a82f6so2987389a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 01:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738314461; x=1738919261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i68glYQZ+E+noE0wy+Y9J0JFMp7tHf3uQmMwsu8iKww=;
        b=HljfGqT5fzaLszMgCsh75lva2gI5nxQnvLyZYY2NIP6wleqxZGrxqPfmZ4JjOBnZY0
         wShkjQy0m8F8mtXu/BBkDl63pHQRe14gu3SsJd97SsJhKrvxfB+qINyMJxWFR0TWLb7w
         SyPyjwz+VAVFHGDcpk57UnV5m7s+j2Kl3lh6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738314461; x=1738919261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i68glYQZ+E+noE0wy+Y9J0JFMp7tHf3uQmMwsu8iKww=;
        b=cUPadZUiSZel16rdILt1g9vHwmwp2GSmF2xo5DIb2dHG2GPe3zlO0Fjp+NKJJiSCzq
         XFvDspeuhSJ9+a0bnsnW/YtBh/jICdWB0Wdhzu8wqgAd340vBh8OGUMfBm6pNCyPSCHb
         UIIoVvLxh7ob0RaJrTvtbIVte35ZA4LBe02sWUzO5fQPA/r4xvQzof1QKDhTnAEaAKAw
         ca7Q5fv6HJkEM1wrX9EVWXjYMxFdrfrB+LAcRGAMWhq4A7++IcpllRDnK71DSTY4Kyxt
         7S4jWNAdLuwCZF6r8PqCUMGAlHJx9vuBNY8wkSdrTDre5ys+kjj7zYDfARP4+ONNB2Pr
         LIhw==
X-Forwarded-Encrypted: i=1; AJvYcCVrnQN6M+Fms4X4L37hFIKvdLdb0Ir0KBzBGpOwAi2NfZ54R0qJhSoGgXsgYbHyFIV4DEse9RGS9j+ZTr0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGrSgS7Jw8UBf2SCTnjI6RhRPhvF3pO/7asCEidotQ94HUd/Yl
	4N6hQrHXM/5+WNgidMSmZyEBPvTvDM1k/rAasCLDFm+USq6KqLzqCB/eAzR38Q==
X-Gm-Gg: ASbGnctZAttAX9npQi4NvC5MwoUpHEasigCtluWTgDFwuyo5raEBcJKKYDGQ4PsGQ2l
	tP3StlmVT88hBb/+WYfbZq0O7QxmxVQZOnnfrj3WILizaYNeBG4n4LJi4YEqtqIMsnroILMyqhS
	jn2vgpF2tPvIDgEda/sBvqjZ9kGGgQHXU7ZYp7zAFqFlQWwyX79HiPmrfceKTapB4fIf8/GOyRz
	PczcIfRbx5j0WqCl4VF9ChD29JmBLKs0HLPG9w4Smo4JJCdhb5AD8RWPhxCwJ3PqBR+hv4BZorC
	gZmW6qCu/it3HsZ4/w==
X-Google-Smtp-Source: AGHT+IEm5A+dR0l39EGWgA22kpqEPsUgTOFh4GGf32kwJ92J5tCR45G0PnUGYdzf2axpCJd9jEM3rw==
X-Received: by 2002:a17:90b:2702:b0:2f4:4003:f3ea with SMTP id 98e67ed59e1d1-2f83ac84706mr17607671a91.33.1738314461307;
        Fri, 31 Jan 2025 01:07:41 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:c752:be9d:3368:16fa])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2f84897a504sm3109092a91.7.2025.01.31.01.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 01:07:40 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv4 09/17] zram: limit max recompress prio to num_active_comps
Date: Fri, 31 Jan 2025 18:06:08 +0900
Message-ID: <20250131090658.3386285-10-senozhatsky@chromium.org>
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

Use the actual number of algorithms zram was configure with
instead of theoretical limit of ZRAM_MAX_COMPS.

Also make sure that min prio is not above max prio.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 35fca4c468a7..c500ace0d02f 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -2009,16 +2009,19 @@ static ssize_t recompress_store(struct device *dev,
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
@@ -2071,7 +2074,7 @@ static ssize_t recompress_store(struct device *dev,
 			if (prio == ZRAM_PRIMARY_COMP)
 				prio = ZRAM_SECONDARY_COMP;
 
-			prio_max = min(prio + 1, ZRAM_MAX_COMPS);
+			prio_max = prio + 1;
 			continue;
 		}
 	}
@@ -2099,7 +2102,7 @@ static ssize_t recompress_store(struct device *dev,
 				continue;
 
 			if (!strcmp(zram->comp_algs[prio], algo)) {
-				prio_max = min(prio + 1, ZRAM_MAX_COMPS);
+				prio_max = prio + 1;
 				found = true;
 				break;
 			}
@@ -2111,6 +2114,12 @@ static ssize_t recompress_store(struct device *dev,
 		}
 	}
 
+	prio_max = min(prio_max, (u32)zram->num_active_comps);
+	if (prio >= prio_max) {
+		ret = -EINVAL;
+		goto release_init_lock;
+	}
+
 	page = alloc_page(GFP_KERNEL);
 	if (!page) {
 		ret = -ENOMEM;
-- 
2.48.1.362.g079036d154-goog

