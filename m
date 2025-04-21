Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FF021ADAE
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 21:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745272709; cv=none; b=j7rAqK6M9SDX2rp2dhtigNQO0I9kghRHwpnNx457C15ipuHZZ8jKk6B4OjrRqlhqceFK9SKvvJnX3wTX/0c2TvYJ2gSlM8gKngwjtyJFUQCztZtty0c0zWqkD2UGmvhBkwK+dWzJT6N21xWAQJi/sJWKE2yfWkJIij/p2HJlzdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745272709; c=relaxed/simple;
	bh=hS1o3wNFKx2vnmveTMX3eCOlsgwQBYcrENQJm+49WtU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TKprhkaGlkqPrXPW3qSFYdoF0MrA7+AX8OiUpLjcDv7KsV5axysJPxIhYkb1wOffZl5dL9S2l+8GyUCI6gC+3yoZiAWR5uzmdoQhS0Z8qynvaRYEAPwXtqDAzD6xkq5of2EcQuZ1KkErIPpBp4gGSuWXwHMf5K06crAq0Zt8hVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IJJRQavT; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IJJRQavT"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-896c1845cb9so3995691a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 14:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745272707; x=1745877507; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ppEhzGTJ1895vVIrd/yxk1GkqcslORwV/iBHx5nBBw0=;
        b=IJJRQavTTaWcA4u71k/5b+Sv5G+y/pC/QpGYF59x38bP9aSfNSd6Sbxey6g6O7Drsk
         jHpwvJt9mVPB1ClRtUKfA7OTzX3a/cbsx1y4XJdSVRNVV6hh2wkXxCp4dV0Ve60tGGqu
         we2rFn7bOpKSCVDzd4CmPv3RHihMt+l0ZS/42xuL9kvd/+hc83BMpzreqtZA+UafCUaj
         Pru82iBeDE+0BGL6jMigR6B6MvQTs4FgZIMapo6j99n/864PEDcwGp5tt5M4yQPs0MRP
         wdx6SAACdbbb0WLoyGyoLkukfdGmv3V7cVOa4XvLlT65p7zunJwZI3kuYDn/5AKWCkCU
         ikVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745272707; x=1745877507;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ppEhzGTJ1895vVIrd/yxk1GkqcslORwV/iBHx5nBBw0=;
        b=sJN4FNJF/uEO8vdFTMtUkEIdxlZiqh+nCjJYFEDQoR2NsTCg0zEWqz1K4O+niTrmBL
         0eA/gmwPc2fGYzz1/Crdf2tkS8fH1lL1Pb6/TR41dDyK+Z2il6CMWPgzLlaBpmN+zX1b
         XYCi1oBlVwMSy3DGL7/mLU2VQBbcey2zPcbVlewgUHozsIt6vaYaCDaOwqNvr0i2/GWA
         fiUuc5/b41ajLXoB4adE545JRQH++Mtee3yd7CJNLkDjhJ3Rp5WpMSEDZusQIObaEGpi
         CU+SFxT21Za9Houcn9lV8HO0B98p54Io9WVl2/1KOUtx867jKfsOvbRtYfpRAysP95sB
         MR3A==
X-Forwarded-Encrypted: i=1; AJvYcCV/4csvFs8B2BJ+8GXet0m8RvdjXgNkzQkP/+ChxzdRCWyFR+qqAAkmk5ddf6ZUSji9ffP6Ql396trZEyw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3IRLS4bZoGCHrJyKPpmS3UydRgM8qbbSHJrSFsBM6z91ufKHL
	VPvc5+5OKZbSgJrZInFr6P3F4a1lqJ6fU0+Q4te6xZlHhoLT3VjMsYU2hN8tGMLxqgHLs/G5LJK
	z
X-Google-Smtp-Source: AGHT+IEUjbbR7dOsTbPRk4tKnHc0lJD5Lp9uelQGasXEqv+mLjMNCHnAVBHz9WrQmMThkR2ExG51pC8JdTg=
X-Received: from pjbnb11.prod.google.com ([2002:a17:90b:35cb:b0:2fc:201d:6026])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5826:b0:2fe:93be:7c9d
 with SMTP id 98e67ed59e1d1-3087c2ca5a2mr18673508a91.7.1745272707042; Mon, 21
 Apr 2025 14:58:27 -0700 (PDT)
Date: Mon, 21 Apr 2025 14:58:17 -0700
In-Reply-To: <20250421215818.3800081-1-yabinc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250421215818.3800081-1-yabinc@google.com>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250421215818.3800081-2-yabinc@google.com>
Subject: [PATCH 1/2] perf: Allow non-contiguous AUX buffer pages via PMU capability
From: Yabin Cui <yabinc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Liang Kan <kan.liang@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"

For PMUs like ARM ETM/ETE, contiguous AUX buffers are unnecessary
and increase memory fragmentation.

This patch introduces PERF_PMU_CAP_AUX_NON_CONTIGUOUS_PAGES, allowing
PMUs to request non-contiguous pages for their AUX buffers.

Signed-off-by: Yabin Cui <yabinc@google.com>
---
 include/linux/perf_event.h  | 1 +
 kernel/events/ring_buffer.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 0069ba6866a4..26ca35d6a9f2 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -301,6 +301,7 @@ struct perf_event_pmu_context;
 #define PERF_PMU_CAP_AUX_OUTPUT			0x0080
 #define PERF_PMU_CAP_EXTENDED_HW_TYPE		0x0100
 #define PERF_PMU_CAP_AUX_PAUSE			0x0200
+#define PERF_PMU_CAP_AUX_NON_CONTIGUOUS_PAGES	0x0400
 
 /**
  * pmu::scope
diff --git a/kernel/events/ring_buffer.c b/kernel/events/ring_buffer.c
index 5130b119d0ae..87f42f4e8edc 100644
--- a/kernel/events/ring_buffer.c
+++ b/kernel/events/ring_buffer.c
@@ -710,6 +710,12 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
 		max_order = ilog2(nr_pages);
 		watermark = 0;
 	}
+	/*
+	 * When the PMU doesn't prefer contiguous AUX buffer pages, favor
+	 * low-order allocations to reduce memory fragmentation.
+	 */
+	if (event->pmu->capabilities & PERF_PMU_CAP_AUX_NON_CONTIGUOUS_PAGES)
+		max_order = 0;
 
 	/*
 	 * kcalloc_node() is unable to allocate buffer if the size is larger
-- 
2.49.0.805.g082f7c87e0-goog

