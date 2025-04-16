Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75B24C91
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811520; cv=none; b=RIOQ9/Pj0QIJJa+vEHDp3jRvDgldPxLdZZLovrVdF5XepSYYemkFqCZI2CfnimGE5/1r6+WieRw81gPWPsTSU6bVSlF/Z1r/VJu5EqLjjzpdSZa8o4tjhVlpRuntRFbSgyKAyccDG2warLLEEJ6VU8ClKIozCVlhrzFz/zurGoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811520; c=relaxed/simple;
	bh=9AcxjVR73Rc5bTouXT9Q3yhnAQoc+ezZQ5HBUcE5KJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MpAR3Wmexr39dYpcIfPs7U75pLkTkO4A+iX1r9EzoitrAY9PYvpdZvMZyHv1ExfTRBXW4c5u+QAeFQhZuLhhnkUNjKci2CUXpQVqVQY+pLZJi5Icovdr/E0xCWRrftVfUsfFQmOpzlqoJN1Weg8URUlUoLTPwGbHyk0X2HQP76I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=IyYYGBRF; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="IyYYGBRF"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6ecfc7ed0c1so55193836d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1744811516; x=1745416316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ygbKH3YK/kUuGcHybi94DI1iP78iOJL69yAdVHR5KY0=;
        b=IyYYGBRFHnrYsH3Kqe5D3q3hv9Q6UpeHeZxJQzTYExPlzfYv92r36E8rwlZ4HAALRQ
         9X8d664qTaXWMJSklpCIQiYgmbEAeqCvwonGk63f2k7xZ+dYXCaT8I9YddiaB9mB54IG
         X930N4hSOhuKDTnpr577W1PNsLQA2LSu/aCltSqdP3WMEhwVLYS4YzZ14t7z67vOmNIR
         P+Zaa6GrfQ9eOa4lBHDHRCji1NyvPMJrNoyBtuIgd3LBx7Gn4VR1o9PE0avNP9zZclEd
         dbKSBQFuEdRv4BC2XzW8Bym6JaJnEb7X58mE408QPpKinjqtT2YtcjRYtJgZfbZlQfOH
         FZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744811516; x=1745416316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ygbKH3YK/kUuGcHybi94DI1iP78iOJL69yAdVHR5KY0=;
        b=Thbl1oDt7Et3PY7aouFkjeX7+X2Og1j6Q1K3t9US6b9HVJSAliMU7Yc4ddGEJeJvMX
         gPIlfLHxRChOlrQL1Vr2tTeDXuEpD9rIbroNXCjk3Ia5DgY0FfC8tw7M92WhfscDUXHT
         vauW5GnB1eOWI3XFF9I/OfNNOP7M7n8k9hbSH6nFgV5TKolImaiV0IyVugeLPqwhvgU1
         tIahLy9Rg0tFikJmFZkad6qk75qFWITanoLzbgOBtmqem47jSY907iF+XQOicqTbVmjh
         mpx4NbSGK/MqtN3GQCZMdUyS//UMas+xnmJ4tjVlcJYKHN3xL+rVs7II01zeRvXia6dZ
         BYkQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3+UcvDdVBXEnQcx5FDBLmznKR53wMK3IEMpeBZXf1nZsneCyGWdF8tGfhtNP4s95bqcMS1ICRWAHhxQo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC71rMvHKIGMvUy5THlLyH0086ClVhvChKY9ai5oez0R3tH1v4
	Pw7bg/TQHXStJOnmCPHQk6tQjGFEX7xykxO8HSUVIvtk9D1SSguVdDXIWLx5XSE=
X-Gm-Gg: ASbGnct48BMnOkpVVuJwq8kdH4DKS+NG/nGSXv7bZY7EQ4yn5oHM2MtqZlmiJJaZmY+
	VGEm7oWpInyHyfjo35lZst2yVEFlwJUB3qv6OWi6tbnprtQczZxWkYj5PCzfbhfmNDhs67RDF4w
	99yedua2mHfR2AMF9Ix8BPXR2j0qkqYCJVHofdd8NxCJbuI0/JzWr8WkJgGxDR/VX54VdVQfqiH
	we+bi+NOHs3cKndtJ0lB75TPZIifTcplM/lzMVsXqa+5NrkY1db5t1IJlGiSc7Ippn7izTRJtuk
	sQYxwicxoAon3+0QpPXv1xZZ01z92bmwOwi63v0PvZLPN7QSEA==
X-Google-Smtp-Source: AGHT+IHu8b/zN0Bedn9rskehIH1b24+7rPIphRwS3idv/xejtxQrBsiOY8GHnLRydQ1etfGbJCF9Lw==
X-Received: by 2002:a05:6214:20a2:b0:6e6:646e:a0f0 with SMTP id 6a1803df08f44-6f2b2f42279mr25909756d6.12.1744811516531;
        Wed, 16 Apr 2025 06:51:56 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f2b04c4ff7sm10478806d6.88.2025.04.16.06.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 06:51:55 -0700 (PDT)
From: Johannes Weiner <hannes@cmpxchg.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>,
	Brendan Jackman <jackmanb@google.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] mm: vmscan: fix kswapd exit condition in defrag_mode
Date: Wed, 16 Apr 2025 09:45:40 -0400
Message-ID: <20250416135142.778933-3-hannes@cmpxchg.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416135142.778933-1-hannes@cmpxchg.org>
References: <20250416135142.778933-1-hannes@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Vlastimil points out an issue with kswapd in defrag_mode not waking up
kcompactd reliably.

Background: When kswapd is woken for any higher-order request, it
initially checks those high-order watermarks to decide if work is
necesary. However, it cannot (efficiently) meet the contiguity goal of
such a request by itself. So once it has reclaimed a compaction gap,
it adjusts the request down to check for free order-0 pages, then
wakes kcompactd to coalesce them into larger blocks.

In defrag_mode, the initial watermark check needs to be analogously
against free pageblocks. However, once kswapd drops the high-order to
hand off contiguity work, it also needs to fall back to base page
watermarks - otherwise it'll keep reclaiming until blocks are freed.

While it appears kcompactd is woken up frequently enough to do most of
the compaction work, kswapd ends up overreclaiming by quite a bit:

                                                     DEFRAGMODE     DEFRAGMODE-thispatch
Hugealloc Time mean                       79381.34 (    +0.00%)    88126.12 (   +11.02%)
Hugealloc Time stddev                     85852.16 (    +0.00%)   135366.75 (   +57.67%)
Kbuild Real time                            249.35 (    +0.00%)      226.71 (    -9.04%)
Kbuild User time                           1249.16 (    +0.00%)     1249.37 (    +0.02%)
Kbuild System time                          171.76 (    +0.00%)      166.93 (    -2.79%)
THP fault alloc                           51666.87 (    +0.00%)    52685.60 (    +1.97%)
THP fault fallback                        16970.00 (    +0.00%)    15951.87 (    -6.00%)
Direct compact fail                         166.53 (    +0.00%)      178.93 (    +7.40%)
Direct compact success                       17.13 (    +0.00%)        4.13 (   -71.69%)
Compact daemon scanned migrate          3095413.33 (    +0.00%)  9231239.53 (  +198.22%)
Compact daemon scanned free             2155966.53 (    +0.00%)  7053692.87 (  +227.17%)
Compact direct scanned migrate           265642.47 (    +0.00%)    68388.33 (   -74.26%)
Compact direct scanned free              130252.60 (    +0.00%)    55634.87 (   -57.29%)
Compact total migrate scanned           3361055.80 (    +0.00%)  9299627.87 (  +176.69%)
Compact total free scanned              2286219.13 (    +0.00%)  7109327.73 (  +210.96%)
Alloc stall                                1890.80 (    +0.00%)     6297.60 (  +232.94%)
Pages kswapd scanned                    9043558.80 (    +0.00%)  5952576.73 (   -34.18%)
Pages kswapd reclaimed                  1891708.67 (    +0.00%)  1030645.00 (   -45.52%)
Pages direct scanned                    1017090.60 (    +0.00%)  2688047.60 (  +164.29%)
Pages direct reclaimed                    92682.60 (    +0.00%)   309770.53 (  +234.22%)
Pages total scanned                    10060649.40 (    +0.00%)  8640624.33 (   -14.11%)
Pages total reclaimed                   1984391.27 (    +0.00%)  1340415.53 (   -32.45%)
Swap out                                 884585.73 (    +0.00%)   417781.93 (   -52.77%)
Swap in                                  287106.27 (    +0.00%)    95589.73 (   -66.71%)
File refaults                            551697.60 (    +0.00%)   426474.80 (   -22.70%)

Reported-by: Vlastimil Babka <vbabka@suse.cz>
Fixes: a211c6550efc ("mm: page_alloc: defrag_mode kswapd/kcompactd watermarks")
Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
---
 mm/vmscan.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index cc422ad830d6..3783e45bfc92 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -6747,8 +6747,14 @@ static bool pgdat_balanced(pg_data_t *pgdat, int order, int highest_zoneidx)
 		/*
 		 * In defrag_mode, watermarks must be met in whole
 		 * blocks to avoid polluting allocator fallbacks.
+		 *
+		 * However, kswapd usually cannot accomplish this on
+		 * its own and needs kcompactd support. Once it's
+		 * reclaimed a compaction gap, and kswapd_shrink_node
+		 * has dropped order, simply ensure there are enough
+		 * base pages for compaction, wake kcompactd & sleep.
 		 */
-		if (defrag_mode)
+		if (defrag_mode && order)
 			item = NR_FREE_PAGES_BLOCKS;
 		else
 			item = NR_FREE_PAGES;
-- 
2.49.0

