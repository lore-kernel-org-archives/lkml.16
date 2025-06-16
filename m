Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EB41BE238
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750050936; cv=none; b=pqLBekxjE74jED7G3Ka+ewF6IYVykkDNKFaSoZuCaYF7epAWFnAA+jEDCT4gpWQWH5JLtCa0X69sUXIOe62uLKDXz0ZnOOicCoIvDEL369bghCADRM8LvQFl3Q2nKwfLC+6lLh2WDV/J2+U7ah2JQNdwmPqHAOBZV9cc2Z5Ymco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750050936; c=relaxed/simple;
	bh=7wfzPfloqPFtdu8appty5yDqvoo3d+FnbjSk3uLpwNw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=A9RMF8vrxaYSUoehtiVh24Eai67Fai6BaJFXPJV0vDtBSo5kHO/SiFnr8aAvGNVnbjBOFn4ZN8LV+A3NRKbWK7dP5ak47kv10obV69Xe+BCbDM6LsD2JRDUketZcEo70mhJNGQMJinPCePIMobfHIev3lf72sFjbt4GbyIP2auA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yXrcD+b6; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yXrcD+b6"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-742c03c0272so4988657b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 22:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750050935; x=1750655735; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZhNmVeczvFZi2XQh4klX/GK/kqpwRZijs1pAh8xoIM0=;
        b=yXrcD+b6r+L/oNpAqMIQ5KTbzAaWu8D4vsqRpRQf1NmTbbl5K+LdP9SRKJwxNysa+E
         E3F41oyf1r+3UqY964XxX+9FYHR2bZQVtjnQjJMDnX2GBpwDwk9VteI+DvmzpA6QIGT3
         qfBvVaevcJ/aWOYffKYFMwdhCeHQcupV57GLcM8L8QqWEhqBK6p2hh6GnGqGUdb/KVqR
         YEOs4sD8C2Q+a0YmDqnJYmIoE0Yh9PFcP/62gcIrgOief2tthWt0PHHkWRq35qIAhdki
         JOBRwLq7nwzfTLM9Zhx6nnHk7/zkgY25T2M7rjflXrwsG4XLkkCDiyFhJaqY5qbhxojc
         lBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750050935; x=1750655735;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhNmVeczvFZi2XQh4klX/GK/kqpwRZijs1pAh8xoIM0=;
        b=hd8j0VYdJx2K2ZB5hAM24sIm8q74T2U+XiLcrgs3S5Z6CO03Bx1ZSJOnjTnqQu27Fp
         EPS9fA49TOPBxT0oY3IIzbuCeADQ1wD6h/kGruSYXYiAAd3CmHOrbyeSrQUz/OTnGe9V
         734pjyDTfz5qO911fLYoqyd/ynHbYOFvip5ZXAdHngVAeffBzz93BE7ggi0NK8EEcN2F
         lL0ACjGKSc14AAcWceUcKhSH+Tw8rXqqIPXF5gXXVyiqw6KwcCdI/jnTXbXSNx7CVo8p
         OV+lyucBm1pKptJARAePtGNxq49cGpo2/Z1QSA+GnW7dLy5pQtKYIpaOn64D1O+/ZjM2
         8Njg==
X-Forwarded-Encrypted: i=1; AJvYcCXoTEbXJhEiNi1PTQI5bGN4O66/9OrIIF/syjieT9c691BbA3SS/neAQ/r4Ajo1/tfgTHFRWSBz1VhAC14=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0gnr4rRU++W4+vX0IZytNK7wggfDMSsu/zPSU19zOuOGfzI3H
	FYK3WoSv7QtE+CfW8Y7pDj+H3H/I/8aCIDqozmOzxpJctBGvF+tB+/B83tHsbSFcHaNLMma++f4
	zXASyw6sK0Q==
X-Google-Smtp-Source: AGHT+IH9k5VTNRbgPa2VljKzH6sK8cPg3DFKfBqECGQifwLWqC6iC7aOAmiRVZnwKongPp6lSNxKHZzhIvmP
X-Received: from pfbho10.prod.google.com ([2002:a05:6a00:880a:b0:746:2897:67e3])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3e10:b0:72d:9cbc:730d
 with SMTP id d2e1a72fcca58-7489cffbf39mr10049316b3a.11.1750050934692; Sun, 15
 Jun 2025 22:15:34 -0700 (PDT)
Date: Sun, 15 Jun 2025 22:14:49 -0700
In-Reply-To: <20250616051500.1047173-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250616051500.1047173-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250616051500.1047173-5-irogers@google.com>
Subject: [PATCH v3 04/15] perf python: Fix thread check in pyrf_evsel__read
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, James Clark <james.clark@linaro.org>, 
	Xu Yang <xu.yang_2@nxp.com>, John Garry <john.g.garry@oracle.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Howard Chu <howardchu95@gmail.com>, 
	Weilin Wang <weilin.wang@intel.com>, Thomas Richter <tmricht@linux.ibm.com>, 
	Andi Kleen <ak@linux.intel.com>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Gautam Menghani <gautam@linux.ibm.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The CPU index is incorrectly checked rather than the thread index.

Fixes: 739621f65702 ("perf python: Add evsel read method")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/python.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index 49e1db3feb87..b724478fe34a 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -909,7 +909,7 @@ static PyObject *pyrf_evsel__read(struct pyrf_evsel *pevsel,
 		return NULL;
 	}
 	thread_idx = perf_thread_map__idx(evsel->core.threads, thread);
-	if (cpu_idx < 0) {
+	if (thread_idx < 0) {
 		PyErr_Format(PyExc_TypeError, "Thread %d is not part of evsel's threads",
 			     thread);
 		return NULL;
-- 
2.50.0.rc2.696.g1fc2a0284f-goog

