Received: from mail-oa1-f73.google.com (mail-oa1-f73.google.com [209.85.160.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E6B246BD5
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750791814; cv=none; b=EJGHWdsu1KdJ1d35odnPywa+tYp8cmtw1yGlt3RslBBJoUcgTt6gfbYSzk+z8LXV92IZmCI1JGoZnnWT6HG9sDyxPrWRTbzvggk/leWhyWpjXqR6AfY8G57HZrtadVR1tSoqpjr5aFEGEvt8dYh6NNRxK8Dqz1s8IiKgUPLm3p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750791814; c=relaxed/simple;
	bh=/d23ywHfcUan7UtbzKVQ/S1GTCmQbW3G9hmSJrAOtco=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=DZkNrxlQgcI5ebfJxDLWIIEINX4nf2uooqLedutaPK6cplTv+CIXLmhxXaZyDsBI/zm7qfcNF3VK8dp1JSvt8H7QN6zDoc1hLM/l3/i30b0sAhsYYLX9IDBZbCRAErZmAd5cI96WXhfn/OtABVxuiqDsCUe+OwCBXl2fEU2dWQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gbiCcc8P; arc=none smtp.client-ip=209.85.160.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gbiCcc8P"
Received: by mail-oa1-f73.google.com with SMTP id 586e51a60fabf-2e8e969090aso718102fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750791812; x=1751396612; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q2qPXmUwMcTn/QFsidbTHkUm8odPwzO3HSooJaMxC2I=;
        b=gbiCcc8PiENj8syFi+4YhegHzBmCkyua9uTvYEbmCoj+vNsComc8r6TUlMvK3UMe/u
         r00EOEokerq/hhptF0lEZ1tcpAKiIbodMzAWnSf1CmgGmK13ktKLMl68xVYkG92tBZQf
         h8ACe8tqQG6F8bm130S6r5/W+YBC9u024swJ72o2z8ur64Hj2jwwDP4iSDWc6EHFNavo
         iK+gOQBofG+yZkXTj5eNt+L52OPU0ZoV7bpDlFydqHiTMctP8pCFbDO3as1MacClHXhS
         EXV5GuxY2ePnaMmLAII7X8Ryf7GRDqtCMGoj1NWWLXZF2rGruR2DSq8imoRbL7U7O3VN
         VVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750791812; x=1751396612;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q2qPXmUwMcTn/QFsidbTHkUm8odPwzO3HSooJaMxC2I=;
        b=JdwOsopygPy1aUz1eJ9pF63f2g4Saa3zF19D7RulNRFcPPBXFx6gW7AuQX7hVBXYFy
         3kATRDlfHTv0QaySiE9At7w1OXwKwEoaS6P7nKdDmIw3AFSPEl69I52crixzmq/AA0gZ
         Qkgte86+J1rmNi4eGULIJuELpvFPhm8r7CdIITRjJF+Tye0g8XLI9ULdtedEv74LlkGh
         bzXY31aWVYMklvqcOlKKK0JfyXRc1SHvTa7Pw+4MEcay8mUbCp+xEEPWPoOVqIkm3V8X
         C/+GT56uVQ0ZC1iy30kgn96U+v/a0jDxuuIMBSxc1xieqCzX80IkXJj0YzrnK9jIgHNG
         Ac3g==
X-Forwarded-Encrypted: i=1; AJvYcCW2gimITNLXYNdPURNSheLErhMtpEIhWLopZD42wvzWOuACa3AmJu9+poayKRQJlQeS0IuuIDm0LaogtiE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbWsYsGhbBSwSZA7FyZVd/q4MVDFkcr7gMLESfjeeL6DOYhHTa
	ctWJsrEONyQO9lCbDzl+fSYF1Kcxy7KTzsuFjn73V2UarBPZ4+xXpmooEIEeZgHpbgNrY9jsbRI
	gk70LPYnRkw==
X-Google-Smtp-Source: AGHT+IHutS72xAleEuv7XRMMzqYDSDcNU9hXAz/588k8XeDd+ZaGQViK5p9pUQLMVyc5wpzkiwAmNl3xdRYZ
X-Received: from oabwc17.prod.google.com ([2002:a05:6871:a511:b0:2e9:54dd:50d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:71d6:b0:2d6:49df:a649
 with SMTP id 586e51a60fabf-2efb28b6dcdmr343091fac.31.1750791812310; Tue, 24
 Jun 2025 12:03:32 -0700 (PDT)
Date: Tue, 24 Jun 2025 12:03:21 -0700
In-Reply-To: <20250624190326.2038704-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250624190326.2038704-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250624190326.2038704-2-irogers@google.com>
Subject: [PATCH v1 1/5] perf dso: Add missed dso__put to dso__load_kcore
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, James Clark <james.clark@linaro.org>, 
	Howard Chu <howardchu95@gmail.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Jean-Philippe Romain <jean-philippe.romain@foss.st.com>, Junhao He <hejunhao3@huawei.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Dmitry Vyukov <dvyukov@google.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The kcore loading creates a set of list nodes that have reference
counted references to maps of the kcore. The list node freeing in the
success path wasn't releasing the maps, add the missing puts. It is
unclear why this leak was being missed by leak sanitizer.

Fixes: 83720209961f ("perf map: Move map list node into symbol")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/symbol.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
index 8b30c6f16a9e..fd4583718eab 100644
--- a/tools/perf/util/symbol.c
+++ b/tools/perf/util/symbol.c
@@ -1422,6 +1422,7 @@ static int dso__load_kcore(struct dso *dso, struct map *map,
 				goto out_err;
 			}
 		}
+		map__zput(new_node->map);
 		free(new_node);
 	}
 
-- 
2.50.0.714.g196bf9f422-goog

