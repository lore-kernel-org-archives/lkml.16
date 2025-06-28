Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6D622156A
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 04:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751086253; cv=none; b=j0Wi1JEMugTMIwJgqvl4Wt+9510ZDTqbDls0SdGfhEwwXDHQO0hxehVurvsU0PErGIAseu5FPxw64/UHeD5ixJQnn+6Vvua68+yDRmvwQFcVz5E4AWzZixzrjC7SmrFmvzrR+d3tJ6AAjJsvsSNFeK82PmWFJiMniCAm4Ir8eD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751086253; c=relaxed/simple;
	bh=P8WhQ3O+yjKiV4VpOj5b0RW/o37hKGc8Nx443C7ljNA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=Qc5Uh7pWRvNnebyuc3MsW02FpsJu2lR9y9bisOKuxWgzObD8oTIgsoGUKrRwLEvoFtZbz2jz3xrshars6ETYVOMUmVjYXC77nfaJy6rRZr0RqFfyshyboFzOonVD9lSYgr8l5lemwyDLmKgVPGmGS0qYOltZKe7NZS0s4RF3SV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O24FEBR9; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O24FEBR9"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-315b60c19d4so133624a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 21:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751086251; x=1751691051; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9qZk4Btue5jwbOWFWxrzEldf12I1UnrvpVVyWUncOwg=;
        b=O24FEBR9IfKOTRwtDG+oPXTB3oH3hI6kc9n71NIbNqmtYCK51Gva155Mi7+zTLw8GR
         Je/G7ASKf1f4C4gUfrIioG/dk8zWnS8j7RGW9sghZ61wmL/EX6DHn6bL+tGqwDkLuwWC
         FNgtrw86mpdo1cuhFk9a4nsTA8tXj5mfJOaS2hEXHDJKvYDDThyi8A78mfeTeuegaFUP
         56q0S9FaUupariTCnSbVaKHjhk4Fjrz4AqIvbRsE6TRKPnurRLPleIA5Lm2o+2lvUzrd
         QTHrtBilYODCpeV8cX/n3dFL4A3wOpcURImHcrFBY8VfBhko/q314tY+otXMimAwcO2Q
         r0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751086251; x=1751691051;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9qZk4Btue5jwbOWFWxrzEldf12I1UnrvpVVyWUncOwg=;
        b=DF428iaB8ImFVhBLp55x1OUasqQOh7uCjHK0JIkLZHK9KWBnDDDBWVb+p3t4BuT7Go
         LiSpfc3zcxXAa+joNmrocDz2/e4Qw9aiM/HJH0/YASBrXK0ZDFt+S4XZFQg2AazfuwoU
         mc4FXtEzlM+syZFj80inwi1XwG18vkv3CxI0bwl4F10ZfTmINkX6oSSOynNgLUhNK7lA
         W5S/FpZYIiamxFfF19KtgTM4jiLjESNN6+PpzhAi70O/dnjYsat9xnveJy0kdBIjKGot
         XmJlNo/zPVYUbMxhHA9Nd0dDMVxiN+9lQN3eZAjOJ68auhSwqfoedSVnzrpDFTyUBkDj
         pxzA==
X-Forwarded-Encrypted: i=1; AJvYcCXUTz4uGjvcLXdLYau4Q1t50FgBkIex0LOYX8kQvr6pwYQwQly1DPkqhGD6cdn4D1uGTcMkM+4eTjBg7c0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaHqJzKcUpXIkxY+1CmiI8GpszeUhArUQMwVFOiNZMX8YjcGTm
	Y/XFQjjRxsXGSCizJsxx5KUxm93yc8cPLQ6Jrk17g/j9b2+eyW5WGCJJC+WO2/gILUbxCdkoRQb
	hxK2Kx265vQ==
X-Google-Smtp-Source: AGHT+IF8zox2OkhthAIP2iZtdIzHFXeosJX6E/sU7ow+75Qk3dRz3wexU1bn/w/96/gVPeTamXuSz7DToJiH
X-Received: from pjbpa10.prod.google.com ([2002:a17:90b:264a:b0:313:1c10:3595])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1f89:b0:312:1cd7:b337
 with SMTP id 98e67ed59e1d1-318c911e00dmr7718545a91.5.1751086251431; Fri, 27
 Jun 2025 21:50:51 -0700 (PDT)
Date: Fri, 27 Jun 2025 21:50:01 -0700
In-Reply-To: <20250628045017.1361563-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250628045017.1361563-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250628045017.1361563-8-irogers@google.com>
Subject: [PATCH v5 07/23] perf jitdump: Directly mark the jitdump DSO
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

The DSO being generated was being accessed through a thread's maps,
this is unnecessary as the dso can just be directly found. This avoids
problems with passing a NULL evsel which may be inspected to determine
properties of a callchain when using the buildid DSO marking code.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/jitdump.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/tools/perf/util/jitdump.c b/tools/perf/util/jitdump.c
index 624964f01b5f..b062b1f234b6 100644
--- a/tools/perf/util/jitdump.c
+++ b/tools/perf/util/jitdump.c
@@ -14,9 +14,9 @@
 #include <sys/mman.h>
 #include <linux/stringify.h>
 
-#include "build-id.h"
 #include "event.h"
 #include "debug.h"
+#include "dso.h"
 #include "evlist.h"
 #include "namespaces.h"
 #include "symbol.h"
@@ -531,9 +531,22 @@ static int jit_repipe_code_load(struct jit_buf_desc *jd, union jr_entry *jr)
 	/*
 	 * mark dso as use to generate buildid in the header
 	 */
-	if (!ret)
-		build_id__mark_dso_hit(tool, event, &sample, NULL, jd->machine);
-
+	if (!ret) {
+		struct dso_id dso_id = {
+			{
+				.maj = event->mmap2.maj,
+				.min = event->mmap2.min,
+				.ino = event->mmap2.ino,
+				.ino_generation = event->mmap2.ino_generation,
+			},
+			.mmap2_valid = true,
+			.mmap2_ino_generation_valid = true,
+		};
+		struct dso *dso = machine__findnew_dso_id(jd->machine, filename, &dso_id);
+
+		if (dso)
+			dso__set_hit(dso);
+	}
 out:
 	perf_sample__exit(&sample);
 	free(event);
-- 
2.50.0.727.gbf7dc18ff4-goog

