Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A555285C92
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 12:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751630773; cv=none; b=hTI9017vd3atw4LkU+5NlRtsMQ8/AMt5cAxdXKbGFmxYfVp4Xs4/g5im73v+jFsk5apcOcHVAHoJ5KgkcDyhjw923BDq0MlRHUcPmLA6a9i3ansi8EZrZPiHdInvFdfWMmlPnnQkonOh6cs8Awb8eiw5v9xLp5kPgZjqL0mDfLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751630773; c=relaxed/simple;
	bh=88vvRfhJOqyi4FwzOUNbiVDDBg6T9yqKqZgePmdy1OM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Nv+bH++/08ooHRcedSQ6ljoFpSj8ha81mfuxfuduXtbCCHTdLjrdiqlWRU7zt/IXW8YJ3R/0OtikKvDFgJuruPX8mgkJETFrBYhXWxYQc1PIA7HruXvbC01+i+qSTjP3QSuNT5bofYLu6JIyxqXSH11HGf0KrGgaVyj/GpCQzeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com; spf=none smtp.mailfrom=readmodwrite.com; dkim=pass (2048-bit key) header.d=readmodwrite-com.20230601.gappssmtp.com header.i=@readmodwrite-com.20230601.gappssmtp.com header.b=Hx6gtDbf; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20230601.gappssmtp.com header.i=@readmodwrite-com.20230601.gappssmtp.com header.b="Hx6gtDbf"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-454aaade1fbso9135065e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 05:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20230601.gappssmtp.com; s=20230601; t=1751630769; x=1752235569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=al3WttKSBDg/qGQ4EozkjWlm3XvaEGnMz2wJe851eHk=;
        b=Hx6gtDbfqyZmTTKjsfjSMy/aynK4GhL1UT6YeJOUxxvFjNiHp5Q1VBy+dQC3G2bDCO
         sA6n2FYNSVt1LxV2Ij+TOwr0QbmHVZdVFcBrO3G/B5UnnK3hoAKS9grlDRdRuKZEoz1m
         j7n2o9ANs6NCp83oMDnG0DCePgBKaLY/RkRYDneA9G/Eh/pF8IP1oVwjJd3Dvmo/2YgN
         MrpQf7OUlb+sHrh0FQvAorZxur7jO73MsYW2KfkWIMPUAN8kOVLxh7OfaEdCpK9zaGWb
         gakvb5ijZdzxjq+8/GEwH18i9AvWPRrR8MOoY/euL/eKVszqkQEAeecCyEaHwyoaH2Bv
         NTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751630769; x=1752235569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=al3WttKSBDg/qGQ4EozkjWlm3XvaEGnMz2wJe851eHk=;
        b=nd2Fnf9/c4fxRrdC8D3UEwi46KNxgahdShcPRG9gI/wbQtVsJGi86gdP1mmysMcrGe
         XI+uyfT/twLLjDx592KR9Ez6fG3S9+OqwNqrWEf0dfUeugZLlT6K2IBgXIViYihDjT2K
         fv/Vj/aRt8pj4kxVjbpfKygDBSOrlRbLIwxuyj3n2WfbrHeazdUKqVLZB9KXpmcjsMG2
         J+43whgdgqCHUB0fq1RYkt8RUwGUeHrIV0IFjzKBguw4NtvTrlUT5BVQBrYlcW4hXFYQ
         7V1HkMBGUhBP4HayriW9s2Em4gNYURWMHN903FPev74CkfZ6bSq7oD8sqDtqTteZJCm8
         qHdw==
X-Gm-Message-State: AOJu0YwOald8w13b9P7kROKNjoaDEV+s0uEF5jHCS5u7f6LBwuIxegGz
	feChhFOF4mEGF+BHfk34MHvH9tJDnUHJccAEfYBJK+GmtpZqpLz0FkhH+A3qPQLa2x4=
X-Gm-Gg: ASbGncsGw9PHI34++RWfx5HosxMQ+vgUFezOGCzUchXDRh/J+UkH99LU2+QhbaWDvkQ
	AiVlHM87YS/lo9QvXy01dvf+DZiWwDf867VkWN0ufHimCwJIhfsMSj4Ci1Z5ahrFFJazRBRc5pl
	RiywnajtBu+e6jQUJaI5ZE9o4HRHB864BNdHvQ2hO9AFf7MNT42eJ7k7U4e4fKutrA6WZ5thLMt
	tOSEThyZgqv6ThiCmqrdhYJ2h1+onfpvBaTs6AMwOOgezFStaCO9AbGi2QH9ITrCS/rfhMX4UNd
	7mKb4aDrbPYzSzCENWSO7p2j9sRcj+WuZmJBstHb4zl0wMPZvzfetlHkp3EQTg==
X-Google-Smtp-Source: AGHT+IGq/SUxgMWZZS8IM1PrQ/FMCsgffbV93H8PEjxyP19E3//klO0z4YJFLVgIooJ15NS6fhZOKg==
X-Received: by 2002:a05:600c:8594:b0:450:cf42:7565 with SMTP id 5b1f17b1804b1-454b51126afmr12319705e9.23.1751630768455;
        Fri, 04 Jul 2025 05:06:08 -0700 (PDT)
Received: from matt-Precision-5490.. ([2a09:bac1:2880:f0::3d8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bcebf7sm54967605e9.21.2025.07.04.05.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 05:06:07 -0700 (PDT)
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
Subject: [PATCH v2] stackdepot: Make max number of pools build-time configurable
Date: Fri,  4 Jul 2025 13:06:04 +0100
Message-Id: <20250704120604.2688934-1-matt@readmodwrite.com>
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
depot limit because we have long stacks that don't dedup very well.

Introduce a new config to allow users to set the number of maximum stack
depot pools at build time. Also, turn the silent capping into a
build-time assert to provide more obvious feedback when users set this
value too high.

Signed-off-by: Matt Fleming <mfleming@cloudflare.com>
---

Changes in v2:
 - Replace BUILD_BUG_ON with static_assert()
 - Hide STACKDEPOT_MAX_POOLS behind EXPERT

 lib/Kconfig      | 6 ++++++
 lib/stackdepot.c | 8 ++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/lib/Kconfig b/lib/Kconfig
index b38849af6f13..092a2b69310b 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -720,6 +720,12 @@ config STACKDEPOT_MAX_FRAMES
 	default 64
 	depends on STACKDEPOT
 
+config STACKDEPOT_MAX_POOLS
+	int "Maximum number of stack depot pools to store stack traces" if EXPERT
+	range 1024 131071
+	default 8192
+	depends on STACKDEPOT
+
 config REF_TRACKER
 	bool
 	depends on STACKTRACE_SUPPORT
diff --git a/lib/stackdepot.c b/lib/stackdepot.c
index 245d5b416699..1c25c40f31f9 100644
--- a/lib/stackdepot.c
+++ b/lib/stackdepot.c
@@ -36,11 +36,11 @@
 #include <linux/memblock.h>
 #include <linux/kasan-enabled.h>
 
-#define DEPOT_POOLS_CAP 8192
+#define DEPOT_MAX_POOLS CONFIG_STACKDEPOT_MAX_POOLS
+
 /* The pool_index is offset by 1 so the first record does not have a 0 handle. */
-#define DEPOT_MAX_POOLS \
-	(((1LL << (DEPOT_POOL_INDEX_BITS)) - 1 < DEPOT_POOLS_CAP) ? \
-	 (1LL << (DEPOT_POOL_INDEX_BITS)) - 1 : DEPOT_POOLS_CAP)
+static_assert(DEPOT_MAX_POOLS <= (1LL << (DEPOT_POOL_INDEX_BITS)) - 1);
+
 
 static bool stack_depot_disabled;
 static bool __stack_depot_early_init_requested __initdata = IS_ENABLED(CONFIG_STACKDEPOT_ALWAYS_INIT);
-- 
2.34.1

