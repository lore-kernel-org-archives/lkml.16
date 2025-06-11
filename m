Received: from mail-oo1-f73.google.com (mail-oo1-f73.google.com [209.85.161.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF5F1F4169
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 16:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749657740; cv=none; b=tRqu9soguhBSWZs1jhGmdVTGDdztWdpnmF80aG5JeDSzBgi1JSEOmVLYmTN1DgHr1G/AdeRelTKFkWfM26sPHhmeI7/lHGc44eopzLEbhrVu3mvzGotoYqubsbu+VVs8KQBE3w4awQbUkuemOk4kziyZoQUJWDBoDk20PPFVkH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749657740; c=relaxed/simple;
	bh=d1DekuT4b+RpmHHw8+0cV96WV12ZXy4R3fduBzB7g5w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=GtH1zg3pLaxmHM74ddiz0KieRkiTbnvIJvJpW4HYpK8/O4lqqZMh6iHapEfiRLoyqIPiN3qDwp2jXiX5MMGH3B82g6Ok+lJnKpySVUwJBYhZybNS2vRxCcVWpRRpZw8dI5w8Z7rCeHOMqfImuTiP+kvHCTtoVALn2xajxg+axQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FLnMM/5P; arc=none smtp.client-ip=209.85.161.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FLnMM/5P"
Received: by mail-oo1-f73.google.com with SMTP id 006d021491bc7-60bb414cc3eso63521eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749657738; x=1750262538; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oTVLN6IxdloaWx8kgCQ0wDt7X84NOVop+ZW7Gi+fQHw=;
        b=FLnMM/5PpuUqhOSDx3o5uLHsROaSmsQdKnHY1PxUQutDLsIBBq6ZQgpIDjhA7WN9Nu
         /uwQbLyRpl9spFqdWGf/LdCIt3d1SsmzovFPQDtF4GNX8N0JC6wEVAf6BI5MCWUjRcsl
         4BBKCuJ61oztvtHRdxw1Lvh+LotyNNTjJ4YrPn781x+UToi4UGCEE+wviTucVSA4s18Y
         KeaIMf7TquKj/tecORDQV6oQH1rkiFIzYopNfQoWjrIAkq/c7B3jgc2UCjlRwdwc+oOM
         eKcBmznXcNJmlv2d9TBWOMACq2qaoKqgWTGCvlT+Jol/rTaGtQXmWIWt8ZFbynCreMCD
         REpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749657738; x=1750262538;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oTVLN6IxdloaWx8kgCQ0wDt7X84NOVop+ZW7Gi+fQHw=;
        b=PqwavD3o28t5nDb9DJQEmDCdT1L60s/FZBFVkBpfpBb+cKgJL3zP45xY0xq1PnWXbk
         Pb9r1RHxNdfL3/CqsG5VFCy0n3GzzTttoHSs12jVV5eW5DrmSbxVyIdZmY3R009nMPuB
         LuRbGzwcpKt6J9G449ty7DQSV8YAk/ub7v/ZbEWCzDqpBCafVaNEUnPiuzgm/T8jvIge
         KwOhjR4HhR7u7Ckb5b5dlIlHrAZaYjw56M9xhPe4THYjawc4X053Le1hlaatadETuN91
         GLJ7DfcrOdX0pc7AyqRmo4cwjyyHRdZgQJ6qSzHy0gdREU+ywai/OmkZCjgyJ9FctG/C
         us+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXUBSmaYmG3yGN7kL31a6UBXQXnC9xj0ilUTHmLcydHaJJVGTj5KJPDKTJ+W/ys9N6fsPE68Gh5/R9O39M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx9R8NmCENCd1meuoCemT6Ckcfd/ZKjPKoX3vrK8821gZhQ23P
	IXSEqtVLr/sefcoPUHNyG2E4lYy8tVow370kk9TWXcMAplWXBMif5toNegMcqif+oKc4bokQGvG
	o0053lU2SmQ==
X-Google-Smtp-Source: AGHT+IFoiLMJunKuHfD7BZb5nMY0HFrs6B+9Eaj9hc+LysXTSVMx4Dk2+g+yzQ1Jzg4198wofqrSI0y+5ln7
X-Received: from oabxe18.prod.google.com ([2002:a05:6870:ce92:b0:2c1:64e4:adb9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6871:4309:b0:2bc:716c:4622
 with SMTP id 586e51a60fabf-2ea97039523mr2369204fac.38.1749657737845; Wed, 11
 Jun 2025 09:02:17 -0700 (PDT)
Date: Wed, 11 Jun 2025 09:01:55 -0700
In-Reply-To: <20250611160206.552030-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611160206.552030-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611160206.552030-5-irogers@google.com>
Subject: [PATCH v2 04/15] perf python: Fix thread check in pyrf_evsel__read
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
2.50.0.rc0.642.g800a2b2222-goog

