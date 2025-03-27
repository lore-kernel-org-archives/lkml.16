Received: from mail-oa1-f73.google.com (mail-oa1-f73.google.com [209.85.160.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF731DF251
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 22:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743116220; cv=none; b=fVQVCHOrJuknwWmklxlnZ47PcwWYfCGlF5gE0I2hs9OBBfawTh48u+dMalA2dNo/Wj6QVECMeAJGHKWjcJ75H1tabrk4I1m0ATl8nKQ+2dxflqrAKvfzUdFPfZeRmwCOsqb36yAtyE5BfIwqlGpa5XYlBpWE+uce6GcU2dQ0aq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743116220; c=relaxed/simple;
	bh=SLz+W6uqIIUombjG7nhdCclPvQQRJe0SAOAeUo7r47A=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Q7T/13quYp+TpIK/Mjad/lR/FlO0Fzu46y/ee1smTd8u/dDLtkTORg7azG9ue2/Zukgoty+AuVWnA2jcnhoP+dhHaFAVEG/1talw8m7Nx1rz38l6Y/Lg0bCwIvIGV2jVWhnbY/Sms4Z2cjmkuw3jOODfrzCZUo28spWnf87FJZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ctshao.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BKi4KeIT; arc=none smtp.client-ip=209.85.160.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ctshao.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BKi4KeIT"
Received: by mail-oa1-f73.google.com with SMTP id 586e51a60fabf-2c2b8a293fcso1304434fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743116218; x=1743721018; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ObXR7mkJHJOL5nEwyKzns8s+SG8eVE/VxcSShHG1hSs=;
        b=BKi4KeITo1PznlYxD+vIRYjGZunVdx+1oFYkXYmhjfPtHElP6ilEGnaDnvytL6qg7n
         r9ZLF4ZRWiV06adQ8sZB9xZO5C8TTL8rHIQGnzGm2+C+kyj9SKPjwUW0wyvO+SSGyDbk
         cF2KXCwG7JBfrPVYTLz3o+Tf4pMvMAE7kMAcCS0e+EPr8K3//kdUcV7xG5YglV/xjiN3
         I4860Od6MPr3XsTGmqRunEEyu5NU9SzitwOZiIWabYouNfF7BkPRYFgfWzXYJ7DV3jDH
         9qgNJWYn7Gh8sTaNiKGj90zQvYbThz64sp4lg0pUwldCroZt+1X+xqu6jDnD68ERIv90
         ssgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743116218; x=1743721018;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ObXR7mkJHJOL5nEwyKzns8s+SG8eVE/VxcSShHG1hSs=;
        b=a47JDo2CMPvT1IsIKkg5x+l10zuGPfPZnXa52LAZzlhb4DtLIaBJliYCUDc365hfQZ
         GWp01mPlT3JHV9dexLEZT+UmIvA8OvGa5KKhr3jyA2vBHzkyp1gUxCGu7859ftf9lew4
         rdaiDHaH5U/mIRHt2v+1kgDsm+olPQKD5H1OHJSQRx69P6VSjJR2rnal2h5C84aTlstC
         W6l3z6xxpDMjLHEXBVEnaXPYRDCQpViOqsNp7UmILsiSxaBPFQp+agQtY7rG3/MQ4g3E
         q1FC+TI0UHS661b1MCrx2MPM+8LDhl6IO5fCYltwEXQSz6jrQLT1McBlTawq8YZUC+2O
         EBow==
X-Gm-Message-State: AOJu0YwCjgj0GCObQVPNtTKjk+tVjgzRtpJfPQgVrhwBM6oShnei3+11
	JWQIrgXAGyt+ZX7wzFT96md0/ubyYC3QO4jD+AiG9r6+dy3NEhIj7vmWSM6is7/rnlfShSqojrH
	nDSgf2/Iz0H+TRNeD7oGx1SqsJ27M0HsHc1Jkjg66RadZG8CoRAfk0thj1RpyNZxRPTra1OlKc5
	8A6Zi33mQLCacCrUe+44fATuRm9ZYyY+BpjUZ+P7Si
X-Google-Smtp-Source: AGHT+IEWmO1kbNKoCJvnHgVvpoXm22W2J76YpJPTGsisF8SFpIegQCXJF9YBMNTb6ffsmINMFcwTBGQWfw8=
X-Received: from oabrl17.prod.google.com ([2002:a05:6871:6511:b0:29e:6524:e13e])
 (user=ctshao job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:3482:b0:2c2:4d73:ec43
 with SMTP id 586e51a60fabf-2c870e30b70mr425309fac.15.1743116217722; Thu, 27
 Mar 2025 15:56:57 -0700 (PDT)
Date: Thu, 27 Mar 2025 15:48:15 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250327225651.642965-1-ctshao@google.com>
Subject: [PATCH v2 0/3] Fix incorrect counts when count the same uncore event
 multiple times
From: Chun-Tse Shao <ctshao@google.com>
To: linux-kernel@vger.kernel.org
Cc: Chun-Tse Shao <ctshao@google.com>, peterz@infradead.org, mingo@redhat.com, 
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
	adrian.hunter@intel.com, kan.liang@linux.intel.com, james.clark@linaro.org, 
	howardchu95@gmail.com, yeoreum.yun@arm.com, linux@treblig.org, 
	ak@linux.intel.com, weilin.wang@intel.com, asmadeus@codewreck.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Let's take a look an example, the machine is SKX with 6 IMC devices.

  perf stat -e clockticks,clockticks -I 1000
  #           time             counts unit events
       1.001127430      6,901,503,174      uncore_imc_0/clockticks/
       1.001127430      3,940,896,301      uncore_imc_0/clockticks/
       2.002649722        988,376,876      uncore_imc_0/clockticks/
       2.002649722        988,376,141      uncore_imc_0/clockticks/
       3.004071319      1,000,292,675      uncore_imc_0/clockticks/
       3.004071319      1,000,294,160      uncore_imc_0/clockticks/

1) The events name should not be uniquified.
2) The initial count for the first `clockticks` is doubled.
3) Subsequent count only report for the first IMC device.

The first patch fixes 1) and 3), and the second patch fixes 2).

After these fix:

  perf stat -e clockticks,clockticks -I 1000
  #           time             counts unit events
       1.001127586      4,126,938,857      clockticks
       1.001127586      4,121,564,277      clockticks
       2.001686014      3,953,806,350      clockticks
       2.001686014      3,953,809,541      clockticks
       3.003121403      4,137,750,252      clockticks
       3.003121403      4,137,749,048      clockticks

I also tested `-A`, `--per-socket`, `--per-die` and `--per-core`, all
looks good.

Ian tested `hybrid-merge` and `hwmon`, all looks good as well.

Chun-Tse Shao (1):
  perf test: Add stat uniquifying test

Ian Rogers (2):
  perf evlist: Make uniquifying counter names consistent
  perf parse-events: Use wildcard processing to set an event to merge
    into

 tools/perf/builtin-record.c                   |   7 +-
 tools/perf/builtin-top.c                      |   7 +-
 .../tests/shell/stat+event_uniquifying.sh     |  69 ++++++++
 tools/perf/util/evlist.c                      |  66 +++++---
 tools/perf/util/evlist.h                      |   3 +-
 tools/perf/util/evsel.c                       | 119 ++++++++++++-
 tools/perf/util/evsel.h                       |  11 +-
 tools/perf/util/parse-events.c                |  86 +++++++---
 tools/perf/util/stat-display.c                | 160 ++----------------
 tools/perf/util/stat.c                        |  40 +----
 10 files changed, 329 insertions(+), 239 deletions(-)
 create mode 100755 tools/perf/tests/shell/stat+event_uniquifying.sh

--
v2:
  - Fixes for `hwmon` and `--hybrid-merge`.
  - Add a test for event uniquifying.

v1: lore.kernel.org/20250326234758.480431-1-ctshao@google.com
2.49.0.472.ge94155a9ec-goog

