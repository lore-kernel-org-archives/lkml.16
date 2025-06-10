Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8539F18024
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749554168; cv=none; b=tTgdJKoOSBn671j0byt2//WVMRpx1hicPzIQYKKPkkTIUYc5yD7NIk3wWWRHz7AAt1J8dCjah36QoCCPuRbOYCDs5IbU+4mHMyAWYFML4G3SF/EQQ/8XxBp/Q9Tg+NAOHeTJVRxX9FgZ59Sr4dhG8cy/iWPOsIb/yStXDdEIgLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749554168; c=relaxed/simple;
	bh=fcnHzi6v+9EpbwSnL3E+GkRGFqSn5R8OSCfwlWQf2qA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l7DNuvXhllUZ43NrBp976WofMvyu5mbCu4XS8IHDtvvFUW7uOP+xpqT3F16d4phJQ2qkRfl3Jm1GzZFmFyKvFGiAml7OUeUz2h1hVJrsiH7EfpRnqEBFcEqjQY98MJvDiQzrrh7Nw6wvfuquSWmrczs4Hnu98HKGk55Wsixcj74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com; spf=none smtp.mailfrom=readmodwrite.com; dkim=pass (2048-bit key) header.d=readmodwrite-com.20230601.gappssmtp.com header.i=@readmodwrite-com.20230601.gappssmtp.com header.b=AxGi5WUt; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20230601.gappssmtp.com header.i=@readmodwrite-com.20230601.gappssmtp.com header.b="AxGi5WUt"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a52874d593so5115875f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 04:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20230601.gappssmtp.com; s=20230601; t=1749554165; x=1750158965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uson3EWY6oZN9zMRgcHh8JRxG3AChngoxAGCNiZk/4I=;
        b=AxGi5WUtkATyU9BmcI5zlYZ93LHhHz2tc7kY8EYFGCJsg7TiZys7hWPi2/vkZJaSjp
         ESWv77foAJItRY1fFIcg3pS1Q2jQ0++4urVuVNAO8Gjkeh8iQ0EgGX/bQs0/8L/SSg4H
         ldaLH1QIf2ZmwgntOK6OwlytXaySMFy8fUYSUJj46jQNCX3OHnksh8Wjg1w62ciZwTGv
         0hLVbuI8ET0neWYqUwzHadPl5mpWzcVzf+t/L1kJSvf1sB1u5ZdITP0Z1yVxYWMDLywg
         gyxuyNl3rUJtJk7zEEncaBGblAeuWTFyXnK4m7MY4NUlNcUkr8QQM+Ly3gE6nOlGjn1p
         2vgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749554165; x=1750158965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uson3EWY6oZN9zMRgcHh8JRxG3AChngoxAGCNiZk/4I=;
        b=gQxoZcenBNffv4/t51nMNBnNXA3kbLcuxSQbxHqVgWYqodqt2oWb2RTt1gDHuB8WlK
         HY13K8PDQ0LpWQKjD713EdgYX57EuChtLma1e9QVRW9GGIGlHnGKOTQBKLCKEKg4I9wZ
         P5tbYMEjbmfRuwdLzK+cNwd7LG+h/mqIKkS1EmshdAuWr/Z+U+4dUENskzK3/8IYqsb9
         GwA+jXLDWK/WDSJKiHCdXLoCN8BGNfbsOUsAKyQkYRtW/tYp8dqVcm/5VhXIDt0RnkQj
         UOiVkcDnpkw5NpmtMJcMfSa1b80eaSTOSvLh/1sG33T+AP1PMQE3CVkwKIJUfw6gMyCi
         3s6A==
X-Gm-Message-State: AOJu0YwYGNm6UYZfE8GBjoLtgb2kVR/zglexR0Zseo/Y+4Dj7q0sBf5j
	jdqU0OHEnF4nqyLGdBG8p+8j0npADsJJky1CVH78LeztP/KGhKQZ3mbHFWfx3PNaTPE=
X-Gm-Gg: ASbGnctqIEPsXM9atZKAkLBe/GfeI/sjep11qr+4/L5jAKTiC7CBr+u9tnSrGyHrK1T
	4kucntTXyKG7Dt24fw1VwsNpPOp0s1MNf1Q1knxljPSJKyGuV3+AARYUh4fhlewYh9hNmHWsGFN
	k09jfgixXHHgrfppEGrgpOX1nmoTAhrz1PJtxu9M1ihqY62f8UC8GttuwgV8IsBsjqCcVZDc8ML
	gv0BwJR6iMlT8Krt/eEYDamV03qbTt2oL7nukuzBMh5KxrcCqSI6HfaF84kcyUcBqYuHgKmaBBd
	ETO7JJtLqEKPVL28z+hFotHVgxNV2gbDe6W7r0luhlJCLi9SRMGXxJppyChTcT0=
X-Google-Smtp-Source: AGHT+IEqrJ8jybyGePfvdAq/HBhOFGDbYjHnCHFG0IgFLBEztLZEbR+kXElL0h1hzqiBYJpzdqbUFA==
X-Received: by 2002:a05:6000:2209:b0:3a4:f892:de7f with SMTP id ffacd0b85a97d-3a531ab6db9mr13931569f8f.36.1749554164678;
        Tue, 10 Jun 2025 04:16:04 -0700 (PDT)
Received: from matt-Precision-5490.. ([2a09:bac1:2880:f0::3df:65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45322907546sm851615e9.7.2025.06.10.04.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 04:16:04 -0700 (PDT)
From: Matt Fleming <matt@readmodwrite.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-team@cloudflare.com,
	Marco Elver <elver@google.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Oscar Salvador <osalvador@suse.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Matt Fleming <mfleming@cloudflare.com>
Subject: [PATCH] stackdepot: Make max number of pools build-time configurable
Date: Tue, 10 Jun 2025 12:15:59 +0100
Message-Id: <20250610111559.1667156-1-matt@readmodwrite.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matt Fleming <mfleming@cloudflare.com>

We're hitting the WARN in depot_init_pool() about reaching the stack
depot limit. My assumption is because we have long stacks that don't
dedup very well.

Introduce a new config to allow users to set the number of maximum stack
depot pools at build time. Also, turn the silent capping into a
build-time assert to provide more obvious feedback when users set this
value too high.

Signed-off-by: Matt Fleming <mfleming@cloudflare.com>
---
 lib/Kconfig      | 6 ++++++
 lib/stackdepot.c | 9 ++++-----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/lib/Kconfig b/lib/Kconfig
index b38849af6f13..2c5af89daff9 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -720,6 +720,12 @@ config STACKDEPOT_MAX_FRAMES
 	default 64
 	depends on STACKDEPOT
 
+config STACKDEPOT_MAX_POOLS
+	int "Maximum number of stack depot pools to store stack traces"
+	range 1024 131071
+	default 8192
+	depends on STACKDEPOT
+
 config REF_TRACKER
 	bool
 	depends on STACKTRACE_SUPPORT
diff --git a/lib/stackdepot.c b/lib/stackdepot.c
index 245d5b416699..1c24230b4a37 100644
--- a/lib/stackdepot.c
+++ b/lib/stackdepot.c
@@ -36,11 +36,7 @@
 #include <linux/memblock.h>
 #include <linux/kasan-enabled.h>
 
-#define DEPOT_POOLS_CAP 8192
-/* The pool_index is offset by 1 so the first record does not have a 0 handle. */
-#define DEPOT_MAX_POOLS \
-	(((1LL << (DEPOT_POOL_INDEX_BITS)) - 1 < DEPOT_POOLS_CAP) ? \
-	 (1LL << (DEPOT_POOL_INDEX_BITS)) - 1 : DEPOT_POOLS_CAP)
+#define DEPOT_MAX_POOLS CONFIG_STACKDEPOT_MAX_POOLS
 
 static bool stack_depot_disabled;
 static bool __stack_depot_early_init_requested __initdata = IS_ENABLED(CONFIG_STACKDEPOT_ALWAYS_INIT);
@@ -245,6 +241,9 @@ static bool depot_init_pool(void **prealloc)
 {
 	lockdep_assert_held(&pool_lock);
 
+	/* The pool_index is offset by 1 so the first record does not have a 0 handle. */
+	BUILD_BUG_ON((1LL << (DEPOT_POOL_INDEX_BITS)) - 1 < DEPOT_MAX_POOLS);
+
 	if (unlikely(pools_num >= DEPOT_MAX_POOLS)) {
 		/* Bail out if we reached the pool limit. */
 		WARN_ON_ONCE(pools_num > DEPOT_MAX_POOLS); /* should never happen */
-- 
2.34.1

