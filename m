Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B703E21B9F0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 21:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745272713; cv=none; b=NnRBzq+RfldJc9Mt1i2W3e3pQsAISyPvxKCJuHlWH33AlzmrF8fT5JXRB2ftynR/LzB2HkdOt99/nt3+SssHuJQEqR1UKhVRUt0OiAUgaAMbI9WWs87tNMQgPCap4tB2TAE5EyQQ50WHeaDAy21FTwUmhIGX6SdMmUpSRQ8HQ8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745272713; c=relaxed/simple;
	bh=nMgu5glmK3F7QNbIg1QfyS3VbDIbwgjVcwChkm+gctQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=En4V6mjL3puhYifGLJtWI9YFCyt7Uo6gVrkkQB2tZYS9iv/2ht5FOB7vjMIs2zoFh1nO7JkcL+lmSd3QNyPE/VrlUSNUNhU898btVxF8xRW0yM5ehBGwA0CQlNOmJjyL5cK3+5RvEV2u1P+Eft4Wl4KXMiGyOIRLBvenk/3Q+gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M6uXK9wq; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M6uXK9wq"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-af98c8021b5so4461655a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 14:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745272711; x=1745877511; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EcpcuD7anqMhhZmchi1Jj15ct5OGdKXSmJ/UTKESh3w=;
        b=M6uXK9wqqNfx8zKsUY4mjCLKP5aUKmT/hawDTTKj3/diZcsikN1kXlUFxHLKNsrNr6
         kk6rF5zWUZzDZIl7vCbSASDNtOu5xqmQWgRCQamKnLLyDEhaEbmLrc+lS785ZyFIHQ14
         42mYE7AFg2VLJ+RuJiqzSnf0fgkujYp9Fve7WTs5OMmMyO41jjoi4IIJjbwGehaGMKpR
         tuFPfNoYZzeR+TTvO2ikWACA6yHYBhlxWvxeWhSA3Ft2nXIgBgg1rIG4SjJ4Z7tOjyz0
         L5JJ3SiyYHQ5RxqRTJEWjjgBMdpb/7Pigh/x6XkMJ+3J5TI7x5Qvkvms3q9fErVF1S3H
         wYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745272711; x=1745877511;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EcpcuD7anqMhhZmchi1Jj15ct5OGdKXSmJ/UTKESh3w=;
        b=VA4HPui9fr+Qs2ytUbMrHh2JCFypFhwnW45T8plmqAcn/sG9FeLBO5wf6wkyskl8wQ
         sY49P9e0RoS45Jvbuc34a21z2LXVssn0tu9K+kP0+8FlyGV8BZZKcV/gUOEFrg3LjPPV
         sNDq3M7o3bSYPjfz63C3Adgt//73f/RZBcKrCFTd10ADeo6wSgWc3Pl++lviBTFm1qQZ
         WtDnEkp2rT2i92Uh0KwDJWc6lef25JyqQSl9CxDKLqo55ZO+Ztejb0u7Owgrbxmxn1PN
         ndYQQfQyTxvVf05lKic2wO4RFg3f375AMH9cOQTiYxxLqW+HLJYV/p95MghgS6qfm0EB
         re1A==
X-Forwarded-Encrypted: i=1; AJvYcCXfQmKeWweUYezTd6iUfFgHEIUs2GwM20MGZ/6Ql3l3E/70p0eJ1lEzGcNyVM7fvhxqProZmAGJyhldJgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGOZakXSdOnr9CZA6semjhpWUhO0zPaWAuydjnSxfQVW8hqalr
	nyOB1Gml9oOTi+Qtq3+5m3k6EDZ/NDrzAs8p0btXzKUi2dna/cK2JVM+ktQUj+qaj6TvfjiT+iS
	G
X-Google-Smtp-Source: AGHT+IHXIs/Ogd7Xy1uFo5InHHYWM0p69glnRQCeqAR959OOyLerqEP0Pnb8KTz0VXSe5vCiUYWbcDZdU/s=
X-Received: from plsr14.prod.google.com ([2002:a17:902:be0e:b0:223:8233:a96c])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce84:b0:224:24d3:6103
 with SMTP id d9443c01a7336-22c5361988bmr204811505ad.35.1745272711001; Mon, 21
 Apr 2025 14:58:31 -0700 (PDT)
Date: Mon, 21 Apr 2025 14:58:18 -0700
In-Reply-To: <20250421215818.3800081-1-yabinc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250421215818.3800081-1-yabinc@google.com>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250421215818.3800081-3-yabinc@google.com>
Subject: [PATCH 2/2] coresight: etm-perf: Add AUX_NON_CONTIGUOUS_PAGES to
 cs_etm PMU
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

The cs_etm PMU, regardless of the underlying trace sink (ETF, ETR or
TRBE), doesn't require contiguous pages for its AUX buffer.

This patch adds the PERF_PMU_CAP_AUX_NON_CONTIGUOUS_PAGES capability
to the cs_etm PMU. This allows the kernel to allocate non-contiguous
pages for the AUX buffer, reducing memory fragmentation when using
cs_etm.

Signed-off-by: Yabin Cui <yabinc@google.com>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index f4cccd68e625..c98646eca7f8 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -899,7 +899,8 @@ int __init etm_perf_init(void)
 	int ret;
 
 	etm_pmu.capabilities		= (PERF_PMU_CAP_EXCLUSIVE |
-					   PERF_PMU_CAP_ITRACE);
+					   PERF_PMU_CAP_ITRACE |
+					   PERF_PMU_CAP_AUX_NON_CONTIGUOUS_PAGES);
 
 	etm_pmu.attr_groups		= etm_pmu_attr_groups;
 	etm_pmu.task_ctx_nr		= perf_sw_context;
-- 
2.49.0.805.g082f7c87e0-goog

