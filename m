Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708D520AF98
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 19:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746128162; cv=none; b=to5pVYoCmnifHufUD7ek+Td2sw1Mi6BWZ2BXG/WT0YPB/z8GtBg5KEpXsWfRGaQIY75skPAhTjUNpWFYNWRsJM5kIEzXneLbA/+ek99h8CFxLL60VAFyBoneLmkE2hUfBgpjIy02fDP5nMeHkEHOVfk64mJ7gUr7Rx+GA+LKUNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746128162; c=relaxed/simple;
	bh=+y2uosMS/kcekQl09dzDlE19poeZSAlRR9XO7mfTdws=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Kn+H6SFGTyZNllIkUFNF1usXFAV/PY83BBUvkK+NiKTSWzIzP3tH14k/fjA9RnJTE1Wj67jLi1bNlWwKLZUKUz3TutDBJTbZYXOoY3RhSamGKOe2/ZYiZQMaYBluHUB5xQgXWSj4nTkLNYGCg3//B5MzhUrL1bkjOJI60XwbT5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WJUeCeq1; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WJUeCeq1"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b16fc7aa649so943878a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 12:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746128160; x=1746732960; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LEDtKxpB5q8jrgOwnlyi/GDCV0Qp38aBfvEzIFJZGh4=;
        b=WJUeCeq1wGYxlNTlUWRncURVr0Bc0NJ/BJgJDO2sgpDXaESCfHxWzrFQLXSQ8C0per
         9NoPdk3iJ7XcKHg+KSz9jOkubX/QODypnDGronBeaecE4NS6jYCbxycyjw3QIX10FAD0
         Aek4028zSd9Z6gUJPUfCCBwiK0ACT7HtYr0US28K+DyeTk2dCjJjSRIXyQhN1tDDFtbN
         NiBNmW4t0/4eP4iB5n2Y5hCJrx6AFichuJTS+Gp4uZYwq0TGXlhcP/MzriRxalq08DOd
         WeL/geSB8w0f39iFsf4ZkzYUY3cEYZTAG2O8V8XQGz9+g8PYS6z7RprixdVN+xRm0wfo
         S/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746128160; x=1746732960;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LEDtKxpB5q8jrgOwnlyi/GDCV0Qp38aBfvEzIFJZGh4=;
        b=o7FSsuvC3Kzzz6Q2sDrKDaXiLbgrmtBNhlUxuOUoVxzYEpKAURCwQx52AVreVOl1UU
         Q56IK0wnAA6i06ahxZBY3jDj+aE1y7anq4PB2+Fbo56/Lzxxw9sXUKNzFL46MZFqbW/1
         BP+OMQdWW+RzrMJOdN8Z6foVIyNa5krkpwQTkF6kBf9MikDG6Td5SDeURJxSPcfBp3bY
         06q/FT8qCy0EinU3bCi/SfCf3WXihi8zXJn1e0u0atgXxhjTwmdSfTePyfWZexsQzeDS
         fe757xpVWFOZBf+lskN0/hemrM57nXeJdLCDSFzbQ2Vhe25bSctrUGBwu4xv7yRgwifR
         45SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPanHOE6bGnvEof8PmEN+1WyZUH4kBjVLNm+g3upIwHAXmTvXB+9ueEEve/2wFRcIXInVbXlLw6K8nCZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi5p4prFSTxVHJjxbz0DaAGb5mttm3zPb//95rqkGK2q7rtNUz
	L4jDB+aVB8A2zkOnWqanHsebdMxIOCfKTUkbqPSBvKyLGg1SiZwYhnHulI+Ae2XUDKeqifE0LgU
	J
X-Google-Smtp-Source: AGHT+IE6wxJc/MynCTvLfWmZg8sc0YNfmkiks/SPQUXxNJhz+FsSIYN9ja9GZU1NwfD/74dVeQ/ByWfKWww=
X-Received: from plhl18.prod.google.com ([2002:a17:903:1212:b0:22d:e49c:3cb])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3d07:b0:21f:2e:4e4e
 with SMTP id d9443c01a7336-22e1001e505mr6441495ad.5.1746128159641; Thu, 01
 May 2025 12:35:59 -0700 (PDT)
Date: Thu,  1 May 2025 12:35:56 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250501193556.23473-1-yabinc@google.com>
Subject: [PATCH v3] perf: Allocate non-contiguous AUX pages by default
From: Yabin Cui <yabinc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Liang Kan <kan.liang@linux.intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"

perf always allocates contiguous AUX pages based on aux_watermark.
However, this contiguous allocation doesn't benefit all PMUs. For
instance, ARM SPE and TRBE operate with virtual pages, and Coresight
ETR allocates a separate buffer. For these PMUs, allocating contiguous
AUX pages unnecessarily exacerbates memory fragmentation. This
fragmentation can prevent their use on long-running devices.

This patch modifies the perf driver to be memory-friendly by default,
by allocating non-contiguous AUX pages. For PMUs requiring contiguous
pages (Intel BTS and some Intel PT), the existing
PERF_PMU_CAP_AUX_NO_SG capability can be used. For PMUs that don't
require but can benefit from contiguous pages (some Intel PT), a new
capability, PERF_PMU_CAP_AUX_PREFER_LARGE, is added to maintain their
existing behavior.

Signed-off-by: Yabin Cui <yabinc@google.com>
---
Changes since v2:
Let NO_SG imply PREFER_LARGE. So PMUs don't need to set both flags.
Then the only place needing PREFER_LARGE is intel/pt.c.

Changes since v1:
In v1, default is preferring contiguous pages, and add a flag to
allocate non-contiguous pages. In v2, default is allocating
non-contiguous pages, and add a flag to prefer contiguous pages.

v1 patchset:
perf,coresight: Reduce fragmentation with non-contiguous AUX pages for
cs_etm

 arch/x86/events/intel/pt.c  |  2 ++
 include/linux/perf_event.h  |  1 +
 kernel/events/ring_buffer.c | 20 +++++++++++++-------
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/arch/x86/events/intel/pt.c b/arch/x86/events/intel/pt.c
index fa37565f6418..25ead919fc48 100644
--- a/arch/x86/events/intel/pt.c
+++ b/arch/x86/events/intel/pt.c
@@ -1863,6 +1863,8 @@ static __init int pt_init(void)
 
 	if (!intel_pt_validate_hw_cap(PT_CAP_topa_multiple_entries))
 		pt_pmu.pmu.capabilities = PERF_PMU_CAP_AUX_NO_SG;
+	else
+		pt_pmu.pmu.capabilities = PERF_PMU_CAP_AUX_PREFER_LARGE;
 
 	pt_pmu.pmu.capabilities		|= PERF_PMU_CAP_EXCLUSIVE |
 					   PERF_PMU_CAP_ITRACE |
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 0069ba6866a4..56d77348c511 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -301,6 +301,7 @@ struct perf_event_pmu_context;
 #define PERF_PMU_CAP_AUX_OUTPUT			0x0080
 #define PERF_PMU_CAP_EXTENDED_HW_TYPE		0x0100
 #define PERF_PMU_CAP_AUX_PAUSE			0x0200
+#define PERF_PMU_CAP_AUX_PREFER_LARGE		0x0400
 
 /**
  * pmu::scope
diff --git a/kernel/events/ring_buffer.c b/kernel/events/ring_buffer.c
index 5130b119d0ae..4d2f1c95673e 100644
--- a/kernel/events/ring_buffer.c
+++ b/kernel/events/ring_buffer.c
@@ -679,7 +679,7 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
 {
 	bool overwrite = !(flags & RING_BUFFER_WRITABLE);
 	int node = (event->cpu == -1) ? -1 : cpu_to_node(event->cpu);
-	int ret = -ENOMEM, max_order;
+	int ret = -ENOMEM, max_order = 0;
 
 	if (!has_aux(event))
 		return -EOPNOTSUPP;
@@ -689,8 +689,8 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
 
 	if (!overwrite) {
 		/*
-		 * Watermark defaults to half the buffer, and so does the
-		 * max_order, to aid PMU drivers in double buffering.
+		 * Watermark defaults to half the buffer, to aid PMU drivers
+		 * in double buffering.
 		 */
 		if (!watermark)
 			watermark = min_t(unsigned long,
@@ -698,16 +698,22 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
 					  (unsigned long)nr_pages << (PAGE_SHIFT - 1));
 
 		/*
-		 * Use aux_watermark as the basis for chunking to
+		 * For PMUs that need or prefer large contiguous buffers,
+		 * use aux_watermark as the basis for chunking to
 		 * help PMU drivers honor the watermark.
 		 */
-		max_order = get_order(watermark);
+		if (event->pmu->capabilities & (PERF_PMU_CAP_AUX_NO_SG |
+						PERF_PMU_CAP_AUX_PREFER_LARGE))
+			max_order = get_order(watermark);
 	} else {
 		/*
-		 * We need to start with the max_order that fits in nr_pages,
+		 * For PMUs that need or prefer large contiguous buffers,
+		 * we need to start with the max_order that fits in nr_pages,
 		 * not the other way around, hence ilog2() and not get_order.
 		 */
-		max_order = ilog2(nr_pages);
+		if (event->pmu->capabilities & (PERF_PMU_CAP_AUX_NO_SG |
+						PERF_PMU_CAP_AUX_PREFER_LARGE))
+			max_order = ilog2(nr_pages);
 		watermark = 0;
 	}
 
-- 
2.49.0.967.g6a0df3ecc3-goog

