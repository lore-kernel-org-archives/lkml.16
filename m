Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EF5292911
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 19:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745524719; cv=none; b=OERWPiaNFEqzQPMQ9/zKgg2foTUCrICHzDj4DyHtBUFxNmjVc+JA4laA4EVulVfrWD/FjFbX3g+CsKZUzB3/TLaCxGd49IPHdfp97Pw2uB7Y1M/uoKFJT3sW+brTnuBkiay1XXgUTRzW1I7gPz9FC5DEqL4l7TB22oR+zrLUCNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745524719; c=relaxed/simple;
	bh=ob+vXbABBfhrdypjS1HSeY991+kz1LnzmwQMh3Kc2b4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=VjkBVjSLnH73QLxatFMjspAt4/CjziysOojrlLNbx3KfDh8ktu+/00h2K1w7Wutzth3pj5YfyVpR7vA7A0x1JuMs1TNkxQNJD/QX++LrLkyX2kua5pZjKdIB5IfxMWrsNIjsoYkxeBJVsdzQkYtLwSkfCSr5SgsyfDJyaYdyL8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rnm2tn9m; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rnm2tn9m"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3032f4eca83so1396108a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745524717; x=1746129517; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MNKAqqBiOSqd4vHBoC37W60RbEBy/zjFFL7hnjZJfH0=;
        b=Rnm2tn9m55If0b+g4zZpNVAYgKbIZpuqZCzjQ3B2xIV1uG1qiAIyL2b9YLDE/myu1g
         iV6C9XL23t6L3/Ecuv3hfdMkB+w1YAniWcNp1FsDJ7B+bX8tbR+3g3/Lz/NwrV3WEzIm
         c6ijVDPD2JT+3mn5oBdptZDOrOBPcstkIcOPe+t87Wyxb1uhGNAY9MHEtYFJsOdR11Il
         ccponj3Dxc6gSQG2hNZSaESX5lR4TWhevjAxTb7uCiGz7vEuh8gb80KhG8Fqdl0yz3Zp
         c5Kwl02eWd1EJ+uCvB69K3l8qBS4pSZpbLIXezXZjUTpZ88xrh7DhfZftuKQwKVUhV1h
         K5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745524717; x=1746129517;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MNKAqqBiOSqd4vHBoC37W60RbEBy/zjFFL7hnjZJfH0=;
        b=CHdj8irmWhjVO8y6iLm7N5b1FXYhv0lY8ynQmGtufV+RDuZWsPwID5MYEyn+a4UKLf
         I6B6Xe3uJsZ6AodVdSCM8JqWw4xCpQSGz03VyG/cTF2xsZRsN3Gkqial5BYEnHc/PL/y
         nX794cUv0x2kBHecmCyQDuZm7U3ti8mOlVcKfy3+D4nr/ybMt3mM80qUAo3PriEH984W
         nXqE+KhqDddDHkKh7od4Rz0GrjoE5EC+e/4B0R/LNEp/VKeuPnEhcV8zVR9MTBvy05u5
         /5ZhrqTl5BIb++tbCSyAM4GEjhlT8+VRby7eFQcbd/Fh8Rfdr2bwVUq7QAOrzSrqnjys
         fPPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW67dZ1B+0GQ7LJ5WAUNWG+WmzIgh7M0ieQFDgQieZMyZ3706fTCPi/d4aazsE03L6bYpb9OCI8yRqWBI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8UCJjZh9nrO2tJW+q8Ov4Oq0or4jEzYEa4MKXca5F1fewL3RK
	s5Bh/EwgkjODIja/CTNkdhKzM8huS2CXdlxbIMjS+xlgrYc79A++R8C6U7KEMZ0jxHAazUHovFi
	dsFs5hw==
X-Google-Smtp-Source: AGHT+IHfiZUcwKsYvkHpGq/KBVlYIbJaMYYoxJQdeAugMt3sVxDTytgOHhfXbnbxKTbar8Cp+xAAA1aorH1i
X-Received: from pjbqj3.prod.google.com ([2002:a17:90b:28c3:b0:305:2d68:2be6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4ec3:b0:2fa:1e3e:9be5
 with SMTP id 98e67ed59e1d1-309f547d239mr1626676a91.0.1745524717216; Thu, 24
 Apr 2025 12:58:37 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:58:24 -0700
In-Reply-To: <20250424195831.1767457-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250424195831.1767457-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.850.g28803427d3-goog
Message-ID: <20250424195831.1767457-2-irogers@google.com>
Subject: [PATCH v2 1/8] perf callchain: Always populate the addr_location map
 when adding IP
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Athira Rajeev <atrajeev@linux.ibm.com>, 
	Kajol Jain <kjain@linux.ibm.com>, Li Huafei <lihuafei1@huawei.com>, 
	"Steinar H. Gunderson" <sesse@google.com>, James Clark <james.clark@linaro.org>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Andi Kleen <ak@linux.intel.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Zixian Cai <fzczx123@gmail.com>, 
	Steve Clevenger <scclevenger@os.amperecomputing.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Martin Liska <martin.liska@hey.com>, 
	"=?UTF-8?q?Martin=20Li=C5=A1ka?=" <m.liska@foxlink.cz>, Song Liu <song@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dropping symbols also meant the callchain maps wasn't populated, but
the callchain map is needed to find the DSO. Plumb the symbols option
better, falling back to thread__find_map rather than
thread__find_symbol when symbols are disabled.

Fixes: 02b2705017d2 ("perf callchain: Allow symbols to be optional when resolving a callchain")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/machine.c | 6 ++++--
 tools/perf/util/thread.c  | 8 ++++++--
 tools/perf/util/thread.h  | 2 +-
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index 2531b373f2cf..b048165b10c1 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -1976,7 +1976,7 @@ static void ip__resolve_ams(struct thread *thread,
 	 * Thus, we have to try consecutively until we find a match
 	 * or else, the symbol is unknown
 	 */
-	thread__find_cpumode_addr_location(thread, ip, &al);
+	thread__find_cpumode_addr_location(thread, ip, /*symbols=*/true, &al);
 
 	ams->addr = ip;
 	ams->al_addr = al.addr;
@@ -2078,7 +2078,7 @@ static int add_callchain_ip(struct thread *thread,
 	al.sym = NULL;
 	al.srcline = NULL;
 	if (!cpumode) {
-		thread__find_cpumode_addr_location(thread, ip, &al);
+		thread__find_cpumode_addr_location(thread, ip, symbols, &al);
 	} else {
 		if (ip >= PERF_CONTEXT_MAX) {
 			switch (ip) {
@@ -2106,6 +2106,8 @@ static int add_callchain_ip(struct thread *thread,
 		}
 		if (symbols)
 			thread__find_symbol(thread, *cpumode, ip, &al);
+		else
+			thread__find_map(thread, *cpumode, ip, &al);
 	}
 
 	if (al.sym != NULL) {
diff --git a/tools/perf/util/thread.c b/tools/perf/util/thread.c
index 89585f53c1d5..10a01f8fbd40 100644
--- a/tools/perf/util/thread.c
+++ b/tools/perf/util/thread.c
@@ -410,7 +410,7 @@ int thread__fork(struct thread *thread, struct thread *parent, u64 timestamp, bo
 }
 
 void thread__find_cpumode_addr_location(struct thread *thread, u64 addr,
-					struct addr_location *al)
+					bool symbols, struct addr_location *al)
 {
 	size_t i;
 	const u8 cpumodes[] = {
@@ -421,7 +421,11 @@ void thread__find_cpumode_addr_location(struct thread *thread, u64 addr,
 	};
 
 	for (i = 0; i < ARRAY_SIZE(cpumodes); i++) {
-		thread__find_symbol(thread, cpumodes[i], addr, al);
+		if (symbols)
+			thread__find_symbol(thread, cpumodes[i], addr, al);
+		else
+			thread__find_map(thread, cpumodes[i], addr, al);
+
 		if (al->map)
 			break;
 	}
diff --git a/tools/perf/util/thread.h b/tools/perf/util/thread.h
index cd574a896418..2b90bbed7a61 100644
--- a/tools/perf/util/thread.h
+++ b/tools/perf/util/thread.h
@@ -126,7 +126,7 @@ struct symbol *thread__find_symbol_fb(struct thread *thread, u8 cpumode,
 				      u64 addr, struct addr_location *al);
 
 void thread__find_cpumode_addr_location(struct thread *thread, u64 addr,
-					struct addr_location *al);
+					bool symbols, struct addr_location *al);
 
 int thread__memcpy(struct thread *thread, struct machine *machine,
 		   void *buf, u64 ip, int len, bool *is64bit);
-- 
2.49.0.850.g28803427d3-goog

