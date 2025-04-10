Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D93012CD88
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 04:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744260347; cv=none; b=j4SJhww2qVvdtFNkxMmFBNNHZGajgJOvUCd5YfogS9n+XFWC4yTe6odcTgbL/M1hlI+1031S0cIL/qM6EhVvGTnipprpVv03y0y6Jgm9Xf6JzYOmd6ObBNsmG6bgKWlc1u9vA/xME4yya+Eed4UnRDVM08fg88IkcV2zTCzKwPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744260347; c=relaxed/simple;
	bh=l2MapbAWPEBH8Qtq9hbgGBPoxnDIQllvf+gDDdA9wLo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=q1zPO/rytqI06TWVWutFyw1+Kk9oPVvva8bPAVybP3hBLqBiCg56rRQbpu3Bh7fT2c8uXSjW1GQ9quzZyROyFwp7tteUAL2pvCy230i1oRvV4T2TdVAZAzXp/UzGP7RJR+2cwTmRL1jSWLJc2zzwY0YbNeEeB+mhfryTrqEUx3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EhFU04o8; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EhFU04o8"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-736bf7eb149so295063b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 21:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744260345; x=1744865145; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ssrQr5jp1XbqeNme6OYBRMcEgvoLcrD6fxGL7PcU8Og=;
        b=EhFU04o8m6SLqLybzGP2eY7ZH8PTu3xFZks/Res2vJD5LebTH3FtQgXrl44pYaXx5w
         o2OUVKSXlCpufPrKiHKRnDhL67+4128rXiQAFWDLmhpXLPCrSyP+czQv/6umAbxvaB9E
         PPrcb5PsXxQibWmJRtiqPlHNvcRnCoyHLN8ssC6skF8/4u7bb1ulq+6JBAKJVtYaLnJZ
         ZkEdAMUuQhOLzjpMx6WyiBZvZINZpmRa5HqvQpgwYwi1G9deBPwTJh7VKl1TgwNTm6Gd
         Yz2RuH8UV2l1Zzsj20S3TeZs82kkR7X1lf0qKft6g7rqmRqRvA2Pd0Z03ohrhAixhLsI
         BE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744260345; x=1744865145;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ssrQr5jp1XbqeNme6OYBRMcEgvoLcrD6fxGL7PcU8Og=;
        b=kQjbalTivO2/HsAAZJ0fnWJw+t9I4vYxN8TwNgvpb5uoOaYDRLJbe1A6U5kDmvVjqN
         MLqGEtrtnTgRpteDN4KDt1PiSClcye0fuxZLV8xde1AFBgwunktF87MPORPYlgsXRSTn
         q3/jZvQyvHHEmQ3JWdvcf13RaBevM6U9wkTwWumuR/tXd7debNZvxwM6meQgO/e+v7LV
         exvdVdp9srXPkj5zhncNCizJ8abTFCTndXFrYj/RcabDgW8MUV9BuYoUt4wSLgQE9ITj
         /y08SWlc1h/cBLNvm1GNJ0AsalvkrAoGIbj0fkvZWskeymELi3xfpEmm6jHV3bszaVrp
         oMyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKF+V7R54q7m4gzrG4ytqV1H5XIdSrHLqLSuyC36QSXs9kFxYLAfVlk8zp/ZKKWxJ+nA3SQp2ZHIT5iAg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzutxeBGLBO1OqEhr6eczqUZoYx6s+JEMVSbN8dx1+diWwXk24g
	1fpxWK860AHMi/Pi/awNj6Q8Exwnte0KtkrdkkMaVM8NZTjAnM9kY9UpwBGkz8KDg3/UBn+S9XN
	J9QdDCw==
X-Google-Smtp-Source: AGHT+IG8qev6jAK3+G7MQEZMOQnUrDNetBN3j7CxzUxCy575TG64NYTf2zoxL2tYpfGXDe7/7oIoWyX73iIT
X-Received: from plgf12.prod.google.com ([2002:a17:902:ce8c:b0:223:f441:fcaa])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f602:b0:224:e2a:9ff5
 with SMTP id d9443c01a7336-22b2eda9814mr20701615ad.9.1744260345479; Wed, 09
 Apr 2025 21:45:45 -0700 (PDT)
Date: Wed,  9 Apr 2025 21:45:29 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250410044532.52017-1-irogers@google.com>
Subject: [PATCH v1 0/3] Metric related performance improvements
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, James Clark <james.clark@linaro.org>, 
	Xu Yang <xu.yang_2@nxp.com>, John Garry <john.g.garry@oracle.com>, 
	Dominique Martinet <asmadeus@codewreck.org>, Thomas Richter <tmricht@linux.ibm.com>, 
	Weilin Wang <weilin.wang@intel.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The "PMU JSON event tests" have been running slowly, these changes
target improving them with an improvement of the test running 8 to 10
times faster.

The first patch changes from searching through all aliases by name in
a list to using a hashmap. Doing a fast hashmap__find means testing
for having an event needn't load from disk if an event is already
present.

The second patch switch the fncache to use a hashmap rather than its
own hashmap with a limited number of buckets. When there are many
filename queries, such as with a test, there are many collisions with
the previous fncache approach leading to linear searching of the
entries.

The final patch adds a find function for metrics. Normally metrics can
match by name and group, however, only name matching happens when one
metric refers to another. As we test every "id" in a metric to see if
it is a metric, the find function can dominate performance as it
linearly searches all metrics. Add a find function for the metrics
table so that a metric can be found by name with a binary search.

Before these changes:
```
$ time perf test -v 10
 10: PMU JSON event tests                                            :
 10.1: PMU event table sanity                                        : Ok
 10.2: PMU event map aliases                                         : Ok
 10.3: Parsing of PMU event table metrics                            : Ok
 10.4: Parsing of PMU event table metrics with fake PMUs             : Ok
 10.5: Parsing of metric thresholds with fake PMUs                   : Ok

real    0m18.499s
user    0m18.150s
sys     0m3.273s
```

After these changes:
```
$ time perf test -v 10
 10: PMU JSON event tests                                            :
 10.1: PMU event table sanity                                        : Ok
 10.2: PMU event map aliases                                         : Ok
 10.3: Parsing of PMU event table metrics                            : Ok
 10.4: Parsing of PMU event table metrics with fake PMUs             : Ok
 10.5: Parsing of metric thresholds with fake PMUs                   : Ok

real    0m2.338s
user    0m1.797s
sys     0m2.186s
```

Ian Rogers (3):
  perf pmu: Change aliases from list to hashmap
  perf fncache: Switch to using hashmap
  perf metricgroup: Binary search when resolving referred to metrics

 tools/perf/builtin-stat.c                |   6 +-
 tools/perf/pmu-events/empty-pmu-events.c |  66 ++++++++-
 tools/perf/pmu-events/jevents.py         |  66 ++++++++-
 tools/perf/pmu-events/pmu-events.h       |  23 +++-
 tools/perf/tests/pmu-events.c            | 129 +++++++++--------
 tools/perf/util/fncache.c                |  69 +++++-----
 tools/perf/util/fncache.h                |   1 -
 tools/perf/util/hwmon_pmu.c              |  43 +++---
 tools/perf/util/metricgroup.c            | 102 ++++++--------
 tools/perf/util/metricgroup.h            |   2 +-
 tools/perf/util/pmu.c                    | 167 +++++++++++++++--------
 tools/perf/util/pmu.h                    |   4 +-
 tools/perf/util/srccode.c                |   4 +-
 tools/perf/util/tool_pmu.c               |  17 +--
 14 files changed, 430 insertions(+), 269 deletions(-)

-- 
2.49.0.504.g3bcea36a83-goog

