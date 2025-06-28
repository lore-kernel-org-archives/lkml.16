Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F4A22FE10
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 04:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751086286; cv=none; b=az584d2mVUMtxZKsIyYS5jvHtR0Qp2kAfR5j52vH/UnU/dBHuX1W7FmMkCY0JBjlKIvgecRjaKmF122Qycd4kPHqAtR/+BPDn6txmVZ5jd/ieAPFDJSpGzpViYwD7XmmCa3axYPITUsHphaqLdcXJ+2h+m1jWnLt9leKXn7XjXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751086286; c=relaxed/simple;
	bh=1mrcw1eUzyK9YbP9S7+x5wWLBu9678+qgj//bB2V2FY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=XmFTr1w9VJsGPWl37MQo+ogGitlxnNYOrqCuQsGkTtlBCZ4rPF87fuwJXgnR0YQp3A17k0+fq4IOlhx/kskp3ELs8QO9Kvr0mIYn2TNjMIAPoIbIFXilthSPFP6RB8KUH2yU8TMi1GriiPVKwpXKowdWs1tNvg0fV+S4gHi0GpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xfm84ihi; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xfm84ihi"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-748f30d56d1so1500058b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 21:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751086283; x=1751691083; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sF4qV4DgtjiQLBphxxTlw2wew86VLfxLJVROJefkN+o=;
        b=xfm84ihibwnBJ4eTE4fu7t36JUgWpfdR1498ZK1lZ5CGfE/0Ti9HMipbLEj2/qI60H
         Jv75/pPOrnGnlc5VkkarQAaIwd02sjR8darU6AGykMGPVzKOwow91c0xiQKVnjh1jLeD
         Z91GGaPZtnlr+Up5vf8mhgcaXbvsl6OT46PWQTROhGbY5rnqBfl2ROEy41TibNB9sCUP
         KSBU41nMeVVKAzk0jkqOgrIAXCpZrv65it4oWNvBf5wOj4AVIp8nbt+CEli24v8fiB0h
         aJj40Lg+5reNDpHnCHys4DQ0hHwhkj8XJEgx5/gsgt+r4xUG6hXFFME+JPqxJUAnSvvB
         K+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751086283; x=1751691083;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sF4qV4DgtjiQLBphxxTlw2wew86VLfxLJVROJefkN+o=;
        b=wx4wnGkuLdeFvwuJJUxRpfT3T1HWun672PpNdllzkl1AoFM1ROP6eiu/WRG4CPgn4Z
         jZBz71YMdgLB0bigEurRLZrOBopQPsDfyWACTQMHyDOo+OveBdGuPxzy8Ze/Wi4Hl/pb
         DDPgbGRFtYrXtnlBDVmyJEhKH42vIvkuZE5AaOOMLlYVus0CYUxM8xQqrg13bwRUQwOh
         uQnA750yV2IVRIj/K4ByUKjuee1qXfDHpJzvV3eaUXp813+0b5sssOUl2j91aRAsg6pz
         pNuPGSloIP3qNp35d8RrCQ2721m03SI6PctkybNE8jYDc2Wsqqv3ut3L/WIeGKGiyztP
         2DkQ==
X-Forwarded-Encrypted: i=1; AJvYcCULl8v3bXHooaSt3ashc51es36wqjfhE46SLsnrAn32Qwz9ea0rX4/XUnzBaMz+iHsRrX6BSBVedJkQ0DY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSD23qLNvCZV93ni0ai+ooskQwrdfmsag9xfQ1v5anYRt4JjRb
	jGR9WEjbYLxkwo0AqMSv813qKNN8sDapf0bcrfYCJr2E9G75vgOG/7TxkU7amw9ayPHyfWO6Yyr
	QPg5lh6QWTQ==
X-Google-Smtp-Source: AGHT+IHN3BGfXu1/P6gldvYF17eMS9Ry+qQuwL6y5uQS3sgX4NqfOXWImYMrFh5fAFdCo1+ETJBjX/9l5Anx
X-Received: from pgcc24.prod.google.com ([2002:a63:1c18:0:b0:b34:c32a:5da8])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:72a6:b0:21c:faa4:9ab8
 with SMTP id adf61e73a8af0-220a12d167emr8525541637.10.1751086283101; Fri, 27
 Jun 2025 21:51:23 -0700 (PDT)
Date: Fri, 27 Jun 2025 21:50:14 -0700
In-Reply-To: <20250628045017.1361563-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250628045017.1361563-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250628045017.1361563-21-irogers@google.com>
Subject: [PATCH v5 20/23] perf env: Remove global perf_env
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Colin Ian King <colin.i.king@gmail.com>, 
	Andi Kleen <ak@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Graham Woodward <graham.woodward@arm.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, 
	Zhongqiu Han <quic_zhonhan@quicinc.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, 
	Li Huafei <lihuafei1@huawei.com>, "Steinar H. Gunderson" <sesse@google.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Chun-Tse Shao <ctshao@google.com>, 
	Yujie Liu <yujie.liu@intel.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, Levi Yun <yeoreum.yun@arm.com>, 
	Howard Chu <howardchu95@gmail.com>, Weilin Wang <weilin.wang@intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Matt Fleming <matt@readmodwrite.com>, 
	Veronika Molnarova <vmolnaro@redhat.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, Zixian Cai <fzczx123@gmail.com>, 
	Steve Clevenger <scclevenger@os.amperecomputing.com>, Ben Gainey <ben.gainey@arm.com>, 
	Chaitanya S Prakash <chaitanyas.prakash@arm.com>, Martin Liska <martin.liska@hey.com>, 
	"=?UTF-8?q?Martin=20Li=C5=A1ka?=" <m.liska@foxlink.cz>, Song Liu <song@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

The global perf_env was used for the host, but if a perf_env wasn't
easy to come by it was used in a lot of places where potentially
recorded and host data could be confused. Remove the global variable
as now the majority of accesses retrieve the perf_env for the host
from the session.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/perf.c           | 3 ---
 tools/perf/util/bpf-event.c | 2 +-
 tools/perf/util/env.c       | 2 --
 tools/perf/util/env.h       | 2 --
 tools/perf/util/evsel.c     | 2 +-
 tools/perf/util/session.c   | 3 ++-
 6 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/tools/perf/perf.c b/tools/perf/perf.c
index f0617cc41f5f..88c60ecf3395 100644
--- a/tools/perf/perf.c
+++ b/tools/perf/perf.c
@@ -346,12 +346,9 @@ static int run_builtin(struct cmd_struct *p, int argc, const char **argv)
 		use_pager = 1;
 	commit_pager_choice();
 
-	perf_env__init(&perf_env);
-	perf_env__set_cmdline(&perf_env, argc, argv);
 	status = p->fn(argc, argv);
 	perf_config__exit();
 	exit_browser(status);
-	perf_env__exit(&perf_env);
 
 	if (status)
 		return status & 0xff;
diff --git a/tools/perf/util/bpf-event.c b/tools/perf/util/bpf-event.c
index 664f361ef8c1..5b6d3e899e11 100644
--- a/tools/perf/util/bpf-event.c
+++ b/tools/perf/util/bpf-event.c
@@ -549,7 +549,7 @@ static int perf_event__synthesize_one_bpf_prog(struct perf_session *session,
 	 * for perf-record and perf-report use header.env;
 	 * otherwise, use global perf_env.
 	 */
-	env = session->data ? perf_session__env(session) : &perf_env;
+	env = perf_session__env(session);
 
 	arrays = 1UL << PERF_BPIL_JITED_KSYMS;
 	arrays |= 1UL << PERF_BPIL_JITED_FUNC_LENS;
diff --git a/tools/perf/util/env.c b/tools/perf/util/env.c
index 887a6fb7104e..6f1611eb4694 100644
--- a/tools/perf/util/env.c
+++ b/tools/perf/util/env.c
@@ -19,8 +19,6 @@
 #include "strbuf.h"
 #include "trace/beauty/beauty.h"
 
-struct perf_env perf_env;
-
 #ifdef HAVE_LIBBPF_SUPPORT
 #include "bpf-event.h"
 #include "bpf-utils.h"
diff --git a/tools/perf/util/env.h b/tools/perf/util/env.h
index c90c1d717e73..ce0ad14535a3 100644
--- a/tools/perf/util/env.h
+++ b/tools/perf/util/env.h
@@ -150,8 +150,6 @@ enum perf_compress_type {
 struct bpf_prog_info_node;
 struct btf_node;
 
-extern struct perf_env perf_env;
-
 void perf_env__exit(struct perf_env *env);
 
 int perf_env__kernel_is_64_bit(struct perf_env *env);
diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index 24c93ea5ba0a..988fe5c4137a 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -3849,7 +3849,7 @@ struct perf_env *evsel__env(struct evsel *evsel)
 {
 	struct perf_session *session = evsel__session(evsel);
 
-	return session ? perf_session__env(session) : &perf_env;
+	return session ? perf_session__env(session) : NULL;
 }
 
 static int store_evsel_ids(struct evsel *evsel, struct evlist *evlist)
diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
index 39da4ab768a5..df03743ac2bf 100644
--- a/tools/perf/util/session.c
+++ b/tools/perf/util/session.c
@@ -193,7 +193,8 @@ struct perf_session *__perf_session__new(struct perf_data *data,
 				symbol_conf.kallsyms_name = perf_data__kallsyms_name(data);
 		}
 	} else  {
-		session->machines.host.env = host_env ?: &perf_env;
+		assert(host_env != NULL);
+		session->machines.host.env = host_env;
 	}
 	if (session->evlist)
 		session->evlist->session = session;
-- 
2.50.0.727.gbf7dc18ff4-goog

