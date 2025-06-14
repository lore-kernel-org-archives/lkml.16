Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F64C1DA21
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 00:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749861676; cv=none; b=XGgPNKFYM/o1cWeXwCCxmsoxPMzjY9xazbHGm08IjcsPQ61oZZlzUa3yJxc4VqZ4yLrQSv6PwzB3EDZrNJDbuIPvHE+t/q0wTLGU5MaFnQlcKEIlsFo+5I7D/NFSK0HaunMuvQb++WEwP6T6/lWiQKsoheON3tTAdQxTFEonxnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749861676; c=relaxed/simple;
	bh=xTOdQaDFHDOLDoGnodTGxcVryRqHweiuzzowdYYZ+/s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=gLXrwhrH+BQ+YGlRDGd3L4BD7Bf+fDn69jdE74icNK3DE9Yx8vNKuvHK7hZzZsjfL5AHQWb4rAccKbJdkwqmwSTMO59spuIHkxWzpDlWQtWfIojdhh7P9Ju60+HRhJU4oVvO4/r1hkwIaVfMr/rhx7M51d9cxp4WymXFFWoEJ4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GM7DtP/S; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GM7DtP/S"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b2fb347b3e6so2516631a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 17:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749861673; x=1750466473; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G6wqE2DwPYgnf73taxRicYtVZNEYSfB+JsxDjsylyec=;
        b=GM7DtP/SghpfBJmqiCZuTZrKuQBf9dYfPa8EDvNda8cPQLPiqz16y0C0ghCN/0GpSE
         dz2T4tTkVPfnY1B8ZRHiy/YbC9O8hX135/y2/aWvlrO9DOfjoIK/fZtLsVRw51/pu8YN
         +JI2f5u1FEKlbBdFmSmho1D2erZxW13JdBgRWUv66QKGsIDjls9AOqxAHBWkGKotSWMc
         17QlayX3iPDNel+D7EMYUJK7K2hck/IVXiiVtnGSuQ4CtTAU4hJn5WVkCCByeGGQuQUo
         6g6evQsJFXmG74p10x8+6f4ETzUcoI40SFO88fH9wilIU/yNIQdMOzy8vCGQtqFXOysT
         uqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749861673; x=1750466473;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G6wqE2DwPYgnf73taxRicYtVZNEYSfB+JsxDjsylyec=;
        b=rfECiMPUTvMX01s1J/XbHdCV3w6XGGrE3U1WHjd/0U7uIoNvceGbbTg80EhGefLr5a
         z6pQzR4o0SXMzJfI/iZXt8w0meCU1xEOZ4MckY8LIEEOJEWrs/iZwxfJq7wY2GVgMPTw
         Eh89/v07HDKfzxDFtn7fgorkRSelPVRELFlByAVoprPCtxVUaTuld0kinvBnQgIcKcT7
         JWkq7WDBYhEXFlfL4Hb6Z+OoczAEH6d1OaBRvxzpwPVQD0ryWxQQMq2/zc3FOS5183LF
         d5qiPX9JgqQnxdUgYb5hcvnJ5BeAH3cslVm2du+jl7IzLLcTo1Al+c8WKFw2njalc3p4
         eTBg==
X-Forwarded-Encrypted: i=1; AJvYcCWnymQ9+rT+pZHQ2Zmv5jCvkkOOrdROEPfKyr0/zKA3gpRciNlFVvF7J+7d+/1C+jDRSwQKRbZ2GCM2Hjg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZVbzNe3F5w9yWEyiqk2PgKBM2SGc/Z66isYpULMrgP9/gsElL
	q6y10zA4GmiJzQ7JRHpnlZ7fwwBwsA0IiIbK0BREhDf58ZvcYhaRimXOQiOXtgLvjaIG2Pu5vtL
	KCArV4BIahA==
X-Google-Smtp-Source: AGHT+IEkT8Zxs0LgIgAOV0H9rBTm0bmbA4vzTW6yXlwBYc8wizWTaaBCJ/voFHQYtmqqVTAIXKbK9D8DA9Ik
X-Received: from pjbmf6.prod.google.com ([2002:a17:90b:1846:b0:313:d6cf:4fa0])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2f8b:b0:312:51a9:5d44
 with SMTP id 98e67ed59e1d1-313f1bef890mr2129572a91.5.1749861673306; Fri, 13
 Jun 2025 17:41:13 -0700 (PDT)
Date: Fri, 13 Jun 2025 17:41:05 -0700
In-Reply-To: <20250614004108.1650988-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250614004108.1650988-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250614004108.1650988-2-irogers@google.com>
Subject: [PATCH v1 2/4] perf evsel: Missed close when probing hybrid core PMUs
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Michael Petlan <mpetlan@redhat.com>, 
	Andi Kleen <ak@linux.intel.com>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add missing close to avoid leaking perf events. In past perfs this
mattered little as the function was just used by perf list. As the
function is now used to detect hybrid PMUs leaking the perf event is
somewhat more painful.

Fixes: b41f1cec91c3 ("perf list: Skip unsupported events")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/print-events.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/perf/util/print-events.c b/tools/perf/util/print-events.c
index a786cbfb0ff5..83aaf7cda635 100644
--- a/tools/perf/util/print-events.c
+++ b/tools/perf/util/print-events.c
@@ -268,6 +268,7 @@ bool is_event_supported(u8 type, u64 config)
 			ret = evsel__open(evsel, NULL, tmap) >= 0;
 		}
 
+		evsel__close(evsel);
 		evsel__delete(evsel);
 	}
 
-- 
2.50.0.rc1.591.g9c95f17f64-goog

