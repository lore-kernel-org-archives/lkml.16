Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B249171CD
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 00:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750292439; cv=none; b=Bvl0r+TJ+unYr8JOYHjT1ZXhbWzCTgHzySBSxvnJ1BzhN0AroEyADDPeDg5T4R5kxwhMrUyyMXAfPKj0+T5qlA6vW1tZiqsX4u/V//M4szRRqpU7cC36beNfN+Gq22EuEWbjZtrZf5M1ufRtkSYLMk8G7wsjtY2DdJJsgntSlEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750292439; c=relaxed/simple;
	bh=AGPmAlAQR0g0Mmcs/uRlA5H54exkEzkBJEzy8rKw04U=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=udq7S842gejREavCL6v8K9X/cW2HFu+VeJqSseEoSTvCNf8LKjf7xWC7bCvkNE9P9cIADDD+2UWjjIL0Bd6PEVeuRlSdiVKhjoqIuIhYiDFlrcew/AB7MWwBIzf/HDSVVO1mUeE5SQNvtMxbGf7N3Hmt2BbqxQrQ9HRbCqXfo/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vM16Erip; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vM16Erip"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2365ab89b52so2454095ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750292437; x=1750897237; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kugD/a6Oq01nl8GXZYoQNqMpzVqYE6IP/zMN/oH7VXg=;
        b=vM16EriprfbO3pBPzC8gV/wMN6AzEKV5zyUtoUmlgTFdQUNOJsvtIQd8fznCBVPRsP
         SxQy9fRvMdlQelaLr/KQz1JlSMqU7D4zfBcm/yuAaWdqdQGq0NnkoAj0dg4CChW+YAg9
         IMquENmphD/cEpDtKbFt0NU8bUlsH5UKdgBEFUl3RsCu4iun1hli3RNllypFrp2Uvwxi
         kPYP4ywPfpJK9Q/nCGNIjJy+cE4k30FxtFmw5Y30+vMJFsHGca5Z56iYxDINen7n4hEZ
         uX4RKPKfRpNFoBpX7cy8r6aa2WNYT4VyVpn7cKnheus31AMR2SVYdT8dFW1hGhJJZauR
         pPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750292437; x=1750897237;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kugD/a6Oq01nl8GXZYoQNqMpzVqYE6IP/zMN/oH7VXg=;
        b=tgDua6r8mJ2Z41ZmeOW5QtobiBOX7I4hImOPlTc5QMXXBimS6n3XUSja0GFY9xKXQC
         ctjYpEvokeW85L4kbLoQNeA4La+ghWh5GO9A0z1+460u83js0FaON+kUX2Z62k7YrzYv
         12J61L1DVSXxSz1jl/XH+m87GGXUmAeRVUUvOBgCRzrh3F4twkRGP4qgS7HUHyXjBtFp
         edQveDoHHVKB8d3AS+VKbYPv4APbLFLVTHCYFzFb+63bqM1ScO6zgE3svpGUCvXfx8TV
         SHVTTpN+7UIuSouWeDsmiADCfn5uJGqbel85+gjIC1jnph8GgO8BYv2nkntoOZXWbiTA
         JqNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnLPq768WL0cLrF8bxqcu0DE8rZrkG9Y3h2Fn/pRrnS5I5Hk/m0lC4ikTXH9ExCmOs4zIt840wCO3ND1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQyuonGuawjAZ/P+UtlED1g84SY/OVQGif0GLJYkdqJDs7hRER
	JrDfQMx/T6naZHKBOTFUe+vWVfA5OXHhNwfp9DVn9rMKE4f0FLR3GDiIUvhemxodUDJ0u6mvEZD
	kca2n+64LHg==
X-Google-Smtp-Source: AGHT+IGERy6tarH249uCeb/yKQ58f6Hm5kjiwLHJ6bqYeRwQfXtktE4uHhAvK8QAJd7lH/Rs6AjDBVnHwIhp
X-Received: from plfn14.prod.google.com ([2002:a17:902:e54e:b0:234:a0aa:5b34])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce90:b0:234:bc4e:4eb8
 with SMTP id d9443c01a7336-2366b19d9a3mr286204475ad.46.1750292437568; Wed, 18
 Jun 2025 17:20:37 -0700 (PDT)
Date: Wed, 18 Jun 2025 17:20:33 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc2.701.gf1e915cc24-goog
Message-ID: <20250619002034.97007-1-irogers@google.com>
Subject: [PATCH v2 1/2] perf test workload noploop: Name the noploop process
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Name the noploop process "perf-noploop" so that tests can easily check
for its existence.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/workloads/noploop.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/perf/tests/workloads/noploop.c b/tools/perf/tests/workloads/noploop.c
index 940ea5910a84..8b954d466083 100644
--- a/tools/perf/tests/workloads/noploop.c
+++ b/tools/perf/tests/workloads/noploop.c
@@ -2,6 +2,8 @@
 #include <stdlib.h>
 #include <signal.h>
 #include <unistd.h>
+#include <linux/prctl.h>
+#include <sys/prctl.h>
 #include <linux/compiler.h>
 #include "../tests.h"
 
@@ -16,6 +18,7 @@ static int noploop(int argc, const char **argv)
 {
 	int sec = 1;
 
+	prctl(PR_SET_NAME, "perf-noploop");
 	if (argc > 0)
 		sec = atoi(argv[0]);
 
-- 
2.50.0.rc2.701.gf1e915cc24-goog

