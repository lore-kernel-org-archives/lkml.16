Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8767C2571C6
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 04:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748493625; cv=none; b=ZoYZkLn/SYdZoiNb1TlOkb9iXexZF7X+AAyJEPsIaD3AYJchwDC9JmxW8AeTmvuywb8SNjV/cQrPkR1Pi85pakZrH4fJ35TnvWNf058+JvrwJJGsTpWltW+5DhOHl+9oHbx2yOH5EGpx97bXZpdgnVXHF44XyFYRpu47PSb47R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748493625; c=relaxed/simple;
	bh=jsmqbC1vJZbprPguR7zwDCDHxB4zTIIrDoxTqEFx1LE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=C560GgjamqMMXbkdLAi1AMjbsZ7aSOBWP83JaPhbcDceZVuOuj6aItIQ1mLSNPVj94dH7rgBD6AAuW+S4rQPdLSItybie527gze/C+u5aeg4bw4YHqEa1/P0+dbhEKhzDJZL1R6poRbLXWFcjyE4/c8r01C77NNuxAw5VTVAfE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IKZ74dQb; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IKZ74dQb"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-747a9ef52a4so605339b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 21:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748493623; x=1749098423; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5JPEQx1UgA1kK0W1Kyi7k61uvOJ0V0RbXR9RGxgMDm8=;
        b=IKZ74dQbqtQhtAx25lDdHPwJTlggU2wkcLgJclnBJQ0EA3Qa2+RcHIN4Qj3Jf+AzSg
         0y0GX14mzJL8qzW8tko9HSCj1r7ZuogfSVf5EZK69MxZp0hnMaU1s4JBjPYzAY68wMmt
         5hP0SCAb3bbVTn1msWzfusUa8AX38cuxGj/p59NgplppR2DIHCmx3mc3QQLt/0P1KeYJ
         Dtn/A6shrzS6ReFS1ZJw+au002BhkRMdEqWdPK/FVVx6IViB90t7ySkhwkOOnX+T2NSL
         pRnh8NUEZnoIsjhx3sInOlrCnZiSMFHcHfapBi8lBe7Ijj1qyfzMpXBxXEupQJiCxnaj
         L0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748493623; x=1749098423;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5JPEQx1UgA1kK0W1Kyi7k61uvOJ0V0RbXR9RGxgMDm8=;
        b=EAyCVcyF3ClIKUWdJ6FZEozcIWQL1uHJqKe/GBGgy1IDLaPZksPboA7GM3QZVpVG3a
         AsZDu8oDwmKbhRmujrSQMAiqk05lQfdeL0fO8SZqGvfoo5I4zY7AKBd7vdfOSf+O5x3o
         EMM6bECrggmZGICnlxK+b2ojLZFYgjts1p4RSqurFB47JgT4H4b0t0+PqlHkkOFR+36E
         rKZZ3ee9kwtad0ycJEZ+/OseAEACqUm4Ev1O+UaTyr3wgv4d3IpSl5akrXzAX7CNuEnK
         q819v3Zz4GXCdL9yntkycw5ZMZa8QxdCwMjefw2CuK/Hr/pSJTJ5kV8VA2dS9swYRegA
         5HYw==
X-Forwarded-Encrypted: i=1; AJvYcCWyJ8EcSIYMWQrq07yVrJ671AnNfiQhtDQpU4I3dXectypnQCJs9/BORJdSbDGR8uzRPTtJYVdXoF93R6I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtcKgzTzpB89pa46FA92HeIDOiN+oLuwkD2wrIuHqJQjhz14Oi
	rzO9rAqdMJGtyT0xe+0TdkQ+mbJUAq5ir8dUG/qECYcdOIN4qNh98C1kmLgCk2giTjQ842iDVQp
	vHOANnUtUeg==
X-Google-Smtp-Source: AGHT+IFW4ud+zMcCHcIRcWhv614Og93PmqbrPfMTEVygcvH8Yldeies4S+HKGdGovs+R0RbQObY2hlDVTQ72
X-Received: from pgbcp3.prod.google.com ([2002:a05:6a02:4003:b0:b2c:4287:b413])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9984:b0:215:de13:e212
 with SMTP id adf61e73a8af0-2188c2406a3mr30902424637.15.1748493622489; Wed, 28
 May 2025 21:40:22 -0700 (PDT)
Date: Wed, 28 May 2025 21:39:44 -0700
In-Reply-To: <20250529044000.759937-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250529044000.759937-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529044000.759937-9-irogers@google.com>
Subject: [PATCH v4 08/24] perf jitdump: Directly mark the jitdump DSO
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
2.49.0.1204.g71687c7c1d-goog

