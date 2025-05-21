Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE901DC988
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 22:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747865736; cv=none; b=e6zU+AV5DeRwwjZUL6rqEI4o/+qm8JwmahTnY9TiLrg9etDCyIY5eUCC6p2cdvrrAwG+q7klD9WXoppqTQ7oXuQE+Q0JA1uK3fM2yCt4NBKseGfFMHcQxkKKkhX2Mn1ulEuFYr+kD1M9TQDyZZApsMpVfE5JCWB3FkcGq3wBggs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747865736; c=relaxed/simple;
	bh=/QBCaCG/8El+2dB05ILIwFosYVxWVy7qGAlEP4EII6E=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=BiGpoAhB3j3zvGqJdyyU4lGJnS9EeeeiCOPCYDQe4PAyllielkH0c5iFiAucC6JLlMM378gD0sPIGTbsp6LTbYFNMYZRBJxTjRsO9QgTVrvsMIU3h0lXEPxwry3HAky5y0Y/bqp925o69dodZUM8/yPowDlxIdohVz7f0gfJEmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hIXEKo40; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hIXEKo40"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-742c7227d7dso3216427b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747865734; x=1748470534; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e4ZpfuiTEZt0CfgeRbSqqrk8V3pIAUapaeXfiNOnyQs=;
        b=hIXEKo40M/1aS9aX74Q5EGRacY3+J+6TX94m93j29Bd75LVqqzO9HEC5Jqe6gOOZ3I
         9HT3trSw7C7V78MFiBTxcz+YZ3x2OmVPRZ8SHuRS1ocqW1mVaipiPojQc97C79LuB2ba
         0FjUaYuB6uCHt6UoGNaTyVAlt7pvD1vIXzyzeFccGgp3X/q9WU0On0szs2T6CNMEkn/P
         upwgvAPRDGcPOPfHvdDy03bPaeW6c6eetY0pUUUx15YCfTKELtSG8sRp9Cxhfz70k3bm
         kgCHUNqC7ebI7THoTa7h+64hx18lTRMb9zc59Mf0/AJtlFYjq+FeIxttw5Z+F+ZNHske
         65lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747865734; x=1748470534;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e4ZpfuiTEZt0CfgeRbSqqrk8V3pIAUapaeXfiNOnyQs=;
        b=KrA4JFHJk4F6iXsRQ1f/APdETtIRhFCXuixOiDBIbTnjNfmIkmqJa3DtZE4bjV0ZMP
         juRPVkAw9aVbx6kQ8vJ+r6E5fmixtbsELmV+LOuk8DPbKOPJXtmsEbdZfDKo7EWAPOxJ
         FZtZuw1ORU2fnVlz5L+C1PFanY2X/XYHaNizOCrUAdLn59Ylu4IWXCl5ibq05Q/5ESg6
         r/1Ny9F5nuDjoGfvsiqA47rY99y6LPJalapTeMt/4thuW4Bsd7SA3TgDhRvqdrI3IcM1
         iO0H79+IKJXcahFIY1Np4/B3CPLv8nZQT47jrAYLxs+AMiNpI3nQ+f62jMgMk0vn78BP
         2dBg==
X-Forwarded-Encrypted: i=1; AJvYcCWP5wOv9TlF31c5pwsV1DYn2ry8VDlNxgb3QEi8wrIQ0al/UF+lm2btwR8in5Izu/mlvR/cTEeEJjAy9wY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOi21PLJnvow2mkoNhZ9kGr7bSCkhYPHb3/A2eVlFrvLgAzvlI
	lK9ywUeb1FMuAO9kDRUxLM5AVyOoNGJKaqfKE/BHTBXpjb+pO6N9jZNA2DY5fP4NNFmiUtg/AJA
	QQfQrgmV3/g==
X-Google-Smtp-Source: AGHT+IEWwnhOejaFeo0ypyJpxUb8D2287GijVV620aA6q8Ndq1BcCrUvYzzPRe/3/z0zlu/Kk8DrwA0aeqnB
X-Received: from pfblc16.prod.google.com ([2002:a05:6a00:4f50:b0:740:b061:1007])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3a27:b0:736:6ecd:8e34
 with SMTP id d2e1a72fcca58-742acd5071emr30096935b3a.18.1747865734397; Wed, 21
 May 2025 15:15:34 -0700 (PDT)
Date: Wed, 21 May 2025 15:15:28 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250521221529.2547099-1-irogers@google.com>
Subject: [PATCH v1] perf: Fix PERF_RECORD_SAMPLE comment
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Aux data for PERF_SAMPLE_AUX appears last. PERF_SAMPLE_CGROUP is
missing from the comment. This makes the perf_event.h comment match
that in the perf_event_open man page.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 include/uapi/linux/perf_event.h       | 5 +++--
 tools/include/uapi/linux/perf_event.h | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index 5fc753c23734..b2722dae6f1e 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -1035,10 +1035,11 @@ enum perf_event_type {
 	 *	{ u64			abi; # enum perf_sample_regs_abi
 	 *	  u64			regs[weight(mask)]; } && PERF_SAMPLE_REGS_INTR
 	 *	{ u64			phys_addr;} && PERF_SAMPLE_PHYS_ADDR
-	 *	{ u64			size;
-	 *	  char			data[size]; } && PERF_SAMPLE_AUX
+	 *	{ u64			cgroup;} && PERF_SAMPLE_CGROUP
 	 *	{ u64			data_page_size;} && PERF_SAMPLE_DATA_PAGE_SIZE
 	 *	{ u64			code_page_size;} && PERF_SAMPLE_CODE_PAGE_SIZE
+	 *	{ u64			size;
+	 *	  char			data[size]; } && PERF_SAMPLE_AUX
 	 * };
 	 */
 	PERF_RECORD_SAMPLE			= 9,
diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
index 5fc753c23734..b2722dae6f1e 100644
--- a/tools/include/uapi/linux/perf_event.h
+++ b/tools/include/uapi/linux/perf_event.h
@@ -1035,10 +1035,11 @@ enum perf_event_type {
 	 *	{ u64			abi; # enum perf_sample_regs_abi
 	 *	  u64			regs[weight(mask)]; } && PERF_SAMPLE_REGS_INTR
 	 *	{ u64			phys_addr;} && PERF_SAMPLE_PHYS_ADDR
-	 *	{ u64			size;
-	 *	  char			data[size]; } && PERF_SAMPLE_AUX
+	 *	{ u64			cgroup;} && PERF_SAMPLE_CGROUP
 	 *	{ u64			data_page_size;} && PERF_SAMPLE_DATA_PAGE_SIZE
 	 *	{ u64			code_page_size;} && PERF_SAMPLE_CODE_PAGE_SIZE
+	 *	{ u64			size;
+	 *	  char			data[size]; } && PERF_SAMPLE_AUX
 	 * };
 	 */
 	PERF_RECORD_SAMPLE			= 9,
-- 
2.49.0.1151.ga128411c76-goog

