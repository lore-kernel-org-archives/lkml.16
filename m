Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78DE2ECE97
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 19:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751052279; cv=none; b=G6aLMo/+kimi+DpO0Wiya5D/1bPdgOP9ObRZI8w5vF27IT/yFjJ5pmEA9vS4E63KB61b8GI80iPrB6IcKvoodxZ272YRBwtO/1WuzdqgZVRSo6ZiPI1wJ8Usalt+Gv7MrL4WQQNljjeVgvTX2oaOT3QCJ3e4xT+2Z5YfjZkQ1rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751052279; c=relaxed/simple;
	bh=W/Bgi88P7ofhS46Nff6nKg74LxXfuxahRJerKgQn9dE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=MHMoVzLhAS/qT8swwqLJQl3LgetL9inAgQMNSyZPiivNmKlxlDM4/XddsPalhnFNrIKcj0vMA6Y5SMQaYLac62sXL3mpokeLHTQ2Rj+eGwG5LSHwULqvaKF6ieiLcANa5LfKNHCOsWPIQHTv7LvDjXCdj6mIcpKKCpoW7qPvJWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1KbZQtfn; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1KbZQtfn"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b26e33ae9d5so359173a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751052277; x=1751657077; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8wGh4hX39HaAnm9ZkRFU2LxfzpD4g1EXGGa3gXUj2fU=;
        b=1KbZQtfn53TgxgwD7EYZ/Tq2rUHaR8SHVWvdInGNQXD4ycOwUkjLI5cERb8uRzSe+U
         JQ8/baFUqQPbhIy69TEcrbC3AXfaIWcZ3qcQSiP1ZJ/RVG3Ts/2TydBCZ5dKQFenzqkn
         TBQ4NCGxrjzrexYehYBn57Ps5unlNFXB9aMu7DIut0koz2LRjcM7PkM8qdiTUqL8bDPd
         Pyt/qtNfrc47Juw7f1jfiq7afmRsWV0lsEueVqX5VHzWndxnkmDpnNvNp7S+weWXArtS
         7hwyGBN0+wEn9U5sfvRM2ZkGaCyXXbrd0Lov6o5/xbrhu4iiqQtCHPtiJGL/aVebFYMr
         nrnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751052277; x=1751657077;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8wGh4hX39HaAnm9ZkRFU2LxfzpD4g1EXGGa3gXUj2fU=;
        b=tkGHfeDcRVwxXyeqlo1Fhw4TnnOVZomJt9lAQAPc5zA+Slydo0hEmawxCN7ZqY1Fw6
         2v2cPRmOfR+g1XpsGsAKrp5taVW7cqMMEhOWcKv426zK41cEd1DJHCXPw8FFPOo8hTaM
         0jy6nEgYcEbx9q2BqhicWM+prkulAwCwHAjZqkomwUdlSMWydLdIUNNN740TWdstrJJh
         yZFQgz+91nA/iwpK3B6xRXhJlkF9KUnarxj9DH6AR9O5uFhLEwFpieNf7UkDoaRIC0ZH
         fVbSico6+M45+ituEoKPMztP/imlk1QhlFhSDz5+tWJ0jSqsI4fLiEJR2qLETzAG8HKV
         Plkw==
X-Forwarded-Encrypted: i=1; AJvYcCX6IIcWngxZtfP0OoqmUgwp3xqkVCdePs9AiHgKJQJYOpwxqgUrMl+2A0d3bFk/hrKptLCS70D32jDOVtU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEXzYXHkJyX6JDB2AI77MwK9KYRmjlCuk36Y1fMtx70uuoHtmJ
	6yGap9lYf+ta0mz5XZi5gJEv10ReHRQGF2Qy9Uu8cz7VODZLPkfMe3kntmgoBLo1VylNv08EjT4
	HFXhMTeZNEw==
X-Google-Smtp-Source: AGHT+IEZpbwsDnk4xblx0rI3Vgl53NcXt0AkOZrWxv3lkOu/3ULvVG1OsFbztyxBw/CpwMw10ECrUDqJtF6b
X-Received: from pjbsg10.prod.google.com ([2002:a17:90b:520a:b0:30a:31eb:ec8e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d0d:b0:311:df4b:4b94
 with SMTP id 98e67ed59e1d1-318c8eccfd1mr5463074a91.4.1751052277148; Fri, 27
 Jun 2025 12:24:37 -0700 (PDT)
Date: Fri, 27 Jun 2025 12:24:13 -0700
In-Reply-To: <20250627192417.1157736-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250627192417.1157736-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250627192417.1157736-9-irogers@google.com>
Subject: [PATCH v1 08/12] perf evsel: Use libperf perf_evsel__exit
From: Ian Rogers <irogers@google.com>
To: Thomas Falcon <thomas.falcon@intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Ben Gainey <ben.gainey@arm.com>, 
	James Clark <james.clark@linaro.org>, Howard Chu <howardchu95@gmail.com>, 
	Weilin Wang <weilin.wang@intel.com>, Levi Yun <yeoreum.yun@arm.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	Blake Jones <blakejones@google.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	Anubhav Shelat <ashelat@redhat.com>, Thomas Richter <tmricht@linux.ibm.com>, 
	Jean-Philippe Romain <jean-philippe.romain@foss.st.com>, Song Liu <song@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Avoid the duplicated code and better enable perf_evsel to change.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/evsel.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index 8caee925bd4c..1169aa60c5fc 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -1669,9 +1669,7 @@ void evsel__exit(struct evsel *evsel)
 	perf_evsel__free_id(&evsel->core);
 	evsel__free_config_terms(evsel);
 	cgroup__put(evsel->cgrp);
-	perf_cpu_map__put(evsel->core.cpus);
-	perf_cpu_map__put(evsel->core.pmu_cpus);
-	perf_thread_map__put(evsel->core.threads);
+	perf_evsel__exit(&evsel->core);
 	zfree(&evsel->group_name);
 	zfree(&evsel->name);
 #ifdef HAVE_LIBTRACEEVENT
-- 
2.50.0.727.gbf7dc18ff4-goog

