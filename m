Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121C4258CDC
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 19:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743709436; cv=none; b=XtvyTqUjV3CSPag5aL21uSXOYe0qgHaWnb+gCUYMZD0JndZ9CgtqJJ2prwtlqp/nGBaL9e8v1gv5pvLKqd/95FDXsYTS+Vw1efTN07UOEy3iHmpTlwhILrPgcDiTWN4ljx0IsUBZYtNGXC52WuWgxWp8gB888GDJzZ++lKySTNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743709436; c=relaxed/simple;
	bh=ru7u7pKXS/EaVzSTBdHYNt3QsjMHV+QaLj4tONySshs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=eM8lsiVSjd9v14uOLF5hply4i3g2nlBKQzWxPe9ZU3WedkihV6ro1bGbO/dSyla4xEIHfoKHnkAoaAcZArEG26mus4OybEMD+VoUHq/gtDcCmiMWqG4Kqv2uk6OSTXk2mmBd5ENZn4BA07IkGsRDl8dPlVuwRWzQr76qhddxwXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t6yYlCgz; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t6yYlCgz"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff7aecba07so1252557a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 12:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743709434; x=1744314234; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I5Pfi1jEe5jcwyGvVBhtjGFb4NLTmTQnKdr17Cg5Kpc=;
        b=t6yYlCgzn6riXEF4+vmNxtH5wvqkcfcT0wG2qcpL7zBgbWajHv+VpeJ9fcYroKZpLx
         JqeK9RO8HOONjc0f3E9MsMzQk0RGxgWd5gCyk2y+YyxP0CDU/LM8r+AZu63zEBwtJ1tX
         psPo1zT6NCLPt3u6lD4E3af+PRMZV+vq+Gxy39e2iOjDoFrFS7XuFULAP69bjyfuguht
         1i4W6tFyS7/b/dZzT017yE1L0B22kVY86BTisYdIPDNnLMOYy2480uUE4mDvRjgQ1TjS
         E8IxG/JplHpqbpX9WaXzWo4ejSzvumPlHPLv2DU2vgFLQbR3A6RPaH6bo1cYk/veTO4E
         P6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743709434; x=1744314234;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I5Pfi1jEe5jcwyGvVBhtjGFb4NLTmTQnKdr17Cg5Kpc=;
        b=bnotUC3KILNtk4vQfyUu9c34K1mPip3ZwkcmZ26v1DchdFgvuPJD3O+NgrxBzrEG2F
         zMv+fl9KdbSxtUOl3Nhnn7eGtAGK/xvxzNValfhf1lMY97iY3s3T8X3nbLj7fr6PNMSr
         +obFYw5KPgd5mSVTqDQZVsKUuCvi8z5W6zAJOoGSfPQ+atknWbH9h9pLXkkO1k2IgLa6
         OHeYUEUNQceSPX/cS7Ig/R10S1m12T1tLL6n/4xIBUkV3CRN7wgvvCjg5+iJlYsc8CmD
         bnzLnWOcV3qUmQFV+kNSaxFMQHCjPbVAN62bk7KDOhOdAX74HsYMSJ3lxcMxPHd1RgT1
         G9Vg==
X-Forwarded-Encrypted: i=1; AJvYcCXIT/+0Ynhl96OOY2F5vAfrn23x7zWxRklqWhiPKLxwmfxOBci1qy9qK1vflnbrq6IpV9jWcKujl9hfL98=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhjpZvWFFLS50qDYcgoXSpcwQ3cwnEsGs5wQLT2I6RqfEWwuVM
	RUzIeuxh0YuH5rTNGy2qkhFPba0VVvvRj/lgb0BoQTjCjgzjHdWxO1+FPhNA6m/RJEjJM/bbDJx
	fw7jwFg==
X-Google-Smtp-Source: AGHT+IG1CI93Af9+RSqQ2ONFXYqX+CMo0v2Jgy+naLqDvO/26ArW4PrhUNUcnhD4A9oMbqfEqoZvzEkKAVbf
X-Received: from pjx14.prod.google.com ([2002:a17:90b:568e:b0:2fa:1481:81f5])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1f86:b0:2f9:c144:9d13
 with SMTP id 98e67ed59e1d1-306a4908a75mr1034365a91.24.1743709434338; Thu, 03
 Apr 2025 12:43:54 -0700 (PDT)
Date: Thu,  3 Apr 2025 12:43:34 -0700
In-Reply-To: <20250403194337.40202-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250403194337.40202-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250403194337.40202-2-irogers@google.com>
Subject: [PATCH v6 1/4] libperf cpumap: Add ability to create CPU from a
 single CPU number
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Leo Yan <leo.yan@arm.com>, 
	James Clark <james.clark@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Weilin Wang <weilin.wang@intel.com>, Andi Kleen <ak@linux.intel.com>, 
	Dominique Martinet <asmadeus@codewreck.org>, Yicong Yang <yangyicong@hisilicon.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add perf_cpu_map__new_int so that a CPU map can be created from a
single integer.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/lib/perf/cpumap.c              | 10 ++++++++++
 tools/lib/perf/include/perf/cpumap.h |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/tools/lib/perf/cpumap.c b/tools/lib/perf/cpumap.c
index 4454a5987570..b20a5280f2b3 100644
--- a/tools/lib/perf/cpumap.c
+++ b/tools/lib/perf/cpumap.c
@@ -242,6 +242,16 @@ struct perf_cpu_map *perf_cpu_map__new(const char *cpu_list)
 	return cpus;
 }
 
+struct perf_cpu_map *perf_cpu_map__new_int(int cpu)
+{
+	struct perf_cpu_map *cpus = perf_cpu_map__alloc(1);
+
+	if (cpus)
+		RC_CHK_ACCESS(cpus)->map[0].cpu = cpu;
+
+	return cpus;
+}
+
 static int __perf_cpu_map__nr(const struct perf_cpu_map *cpus)
 {
 	return RC_CHK_ACCESS(cpus)->nr;
diff --git a/tools/lib/perf/include/perf/cpumap.h b/tools/lib/perf/include/perf/cpumap.h
index 8c1ab0f9194e..58cc5c5fa47c 100644
--- a/tools/lib/perf/include/perf/cpumap.h
+++ b/tools/lib/perf/include/perf/cpumap.h
@@ -37,6 +37,8 @@ LIBPERF_API struct perf_cpu_map *perf_cpu_map__new_online_cpus(void);
  *                     perf_cpu_map__new_online_cpus is returned.
  */
 LIBPERF_API struct perf_cpu_map *perf_cpu_map__new(const char *cpu_list);
+/** perf_cpu_map__new_int - create a map with the one given cpu. */
+LIBPERF_API struct perf_cpu_map *perf_cpu_map__new_int(int cpu);
 LIBPERF_API struct perf_cpu_map *perf_cpu_map__get(struct perf_cpu_map *map);
 LIBPERF_API int perf_cpu_map__merge(struct perf_cpu_map **orig,
 				    struct perf_cpu_map *other);
-- 
2.49.0.504.g3bcea36a83-goog

