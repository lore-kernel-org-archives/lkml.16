Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7D41448E0
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747835711; cv=none; b=E13JlI9jnNZSWp0Yos6Y2zCzSGg/PrGh0pfbrKc8kXuY0zSgztKaVR2FH391yRcEYQHuM0V4uz5tHxLgeoLtYB0+kgcAZVQgBk+4lp5veqLmCQozVxhs97I3+FUq6DH1h1EjpARkKI5nqxP7jQOrrZYAQrRAS7Jh6vvaCCQNygU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747835711; c=relaxed/simple;
	bh=rVbYGqc6uu4pi52v0t9cDGdujwUq54fjcCy4+b7uFP0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=szDYDPtqAHCOvzK+tZP/EQF+nxDlxfod4oLrYn+SwobQAUA2WRn2KcwmKPfo290KdOrQumM5/OusEgNZdqVCP9jj/TVtFpk9Hlickc3Zpms0sxv4I+PpndIu23NNilO8CzOJMpJZrYaTIIirVpKLCRjNp8stwXRXqw2F+pM0F7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IHo8HMX4; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IHo8HMX4"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b26e0fee53eso4031689a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747835709; x=1748440509; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SHwjOM67YtRFALWcy9t4h9R2idl0QlF9QCqJIzMXRTo=;
        b=IHo8HMX4MXA9szEpMTE1W1z2G1JMJ7wgYiRQF78un/R3rTGjcsPZ6IkdZovrtHP1MK
         WA22N15JSpulO7CcClB805erZEVdrs0SOPLrhIQ6gfkUYVV9LBywxWNPXgUTi0sv/KMl
         yce4OvyL3iaj9EccQWePHCI1vjpRv1/TYfRetYiN9uPTJyrCwn8JXqnsKUbzZaeLcDsV
         vxQtxbXKRVfO3hhe+anj25VJwWYOovyboKy619qP+QNKL9LfLPYvtH7KIA0AbnNHDAoh
         YGQqYifHxPwW/2j0zKGINFjvo5k/960h6oQI5LPEl9xXMzFJCg4GlIeHHTiUC7keIPl/
         rytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747835709; x=1748440509;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SHwjOM67YtRFALWcy9t4h9R2idl0QlF9QCqJIzMXRTo=;
        b=P2I6doxF0yR2MmvgJhFxXB/767CPz8SkpenM80wkxYK2D+oEvVjeockc7XbX0CPkCi
         ittxKplOsu//Ow63tEJjF+7prZ2vWGDIA6K18boQyiRRpeyG3OOFosj71OFsGCgFvcBY
         Aoakf55NYr3wlwCP3PB05inep2UGtdwTEOTDm2wSjTLkIu7wgxZ1JjcslP3yG0Hyfj0+
         epKfgLZwDG82NMnXno39z4RjzmYWu3fTJFavtJ8rqWv5ADxyFBBdFa6RHqsa/mkK4Pb2
         ZKKydLK593+UglJU9pmNq/tutZMcu1QDeKoa3PVluvWJ1EOOzCEpZOVyh17RbqrYOz7u
         sQmw==
X-Forwarded-Encrypted: i=1; AJvYcCXBU07lftz0NHsCfomM5sI9tCwqhCjfaj1a3yJlF6ifayEg48kAZ09FJqJ9f+/qH0bT4zFs5+y0vOWQhqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQXd4atgjYG8WrUdnfGqtIpYLPTDInZ5M0s1nY+q+BRzDNIo2Z
	3Ns79ViAH/YOKYedKhcxCrkBHcLcqGErS3tM+1y86HLAim8xkhexW0QL9U1HQvUqvfFQ+sDEa/t
	14Pt36dBE9A==
X-Google-Smtp-Source: AGHT+IHTn5eMvpTptVNuhPDlyaiSK8pVVa+lYEtgEB6cPWQHj9df6/bmr0Y1r1JqU5RVWuD5LV6s5tEQuM51
X-Received: from pgah25.prod.google.com ([2002:a05:6a02:4e99:b0:b26:8f51:5788])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:695:b0:1f5:8cc8:9cbe
 with SMTP id adf61e73a8af0-2170cb07de7mr27159029637.5.1747835709039; Wed, 21
 May 2025 06:55:09 -0700 (PDT)
Date: Wed, 21 May 2025 06:54:56 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250521135500.677508-1-irogers@google.com>
Subject: [PATCH v2 0/3] Generic weight struct, use env for sort key and header
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, James Clark <james.clark@linaro.org>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Ravi Bangoria <ravi.bangoria@amd.com>, Leo Yan <leo.yan@arm.com>, 
	Yujie Liu <yujie.liu@intel.com>, Graham Woodward <graham.woodward@arm.com>, 
	Howard Chu <howardchu95@gmail.com>, Weilin Wang <weilin.wang@intel.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andi Kleen <ak@linux.intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Matt Fleming <matt@readmodwrite.com>, 
	Chun-Tse Shao <ctshao@google.com>, Ben Gainey <ben.gainey@arm.com>, Song Liu <song@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The arch directory is a barrier to cross-platform development as files
and behaviors within it are inherently platform specific. Sample
parsing should be generic but the PERF_SAMPLE_WEIGHT_STRUCT handling
was only present if building for x86 or powerpc. The sort key and
headers should be specific to the session that is being executed and
not to the machine perf is being run upon. These patches clean this
and associated code up.

v2: Avoid changes to include/perf/perf_dlfilter.h as suggested by
    Adrian Hunter.

Ian Rogers (3):
  perf sample: Remove arch notion of sample parsing
  perf test: Move PERF_SAMPLE_WEIGHT_STRUCT parsing to common test
  perf sort: Use perf_env to set arch sort keys and header

 tools/perf/arch/powerpc/util/Build         |   1 -
 tools/perf/arch/powerpc/util/event.c       |  60 ----------
 tools/perf/arch/x86/include/arch-tests.h   |   1 -
 tools/perf/arch/x86/tests/Build            |   1 -
 tools/perf/arch/x86/tests/arch-tests.c     |   2 -
 tools/perf/arch/x86/tests/sample-parsing.c | 125 ---------------------
 tools/perf/arch/x86/util/event.c           |  46 --------
 tools/perf/builtin-annotate.c              |   2 +-
 tools/perf/builtin-c2c.c                   |  53 +++++----
 tools/perf/builtin-diff.c                  |   2 +-
 tools/perf/builtin-report.c                |   2 +-
 tools/perf/builtin-script.c                |   2 +-
 tools/perf/builtin-top.c                   |  16 +--
 tools/perf/tests/hists_cumulate.c          |   8 +-
 tools/perf/tests/hists_filter.c            |   8 +-
 tools/perf/tests/hists_link.c              |   8 +-
 tools/perf/tests/hists_output.c            |  10 +-
 tools/perf/tests/sample-parsing.c          |  14 +++
 tools/perf/util/dlfilter.c                 |   2 +-
 tools/perf/util/event.h                    |   5 -
 tools/perf/util/evsel.c                    |  17 ++-
 tools/perf/util/hist.c                     |   4 +-
 tools/perf/util/hist.h                     |   2 +-
 tools/perf/util/intel-tpebs.c              |   4 +-
 tools/perf/util/sample.h                   |   5 +-
 tools/perf/util/session.c                  |   2 +-
 tools/perf/util/sort.c                     |  67 +++++++----
 tools/perf/util/sort.h                     |   5 +-
 tools/perf/util/synthetic-events.c         |  10 +-
 29 files changed, 150 insertions(+), 334 deletions(-)
 delete mode 100644 tools/perf/arch/powerpc/util/event.c
 delete mode 100644 tools/perf/arch/x86/tests/sample-parsing.c

-- 
2.49.0.1112.g889b7c5bd8-goog

