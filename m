Received: from mail-oa1-f74.google.com (mail-oa1-f74.google.com [209.85.160.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DA921348
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 00:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749861677; cv=none; b=KPgTU+lwS/nEejoH879o5P/AyCPrvnrSn1dNplVEffuvMj2BM5hFd38r+X96Hh2Kx9z7PpSI39Oy9bLaBkFG3NJYhQUv1kVmFFncor9bWZ6P7VDgMIo/h4pkslzw6AIuPCpI8dj1PteEDuVqVSJ6bSfLsyGUUg8mTGVuU2qmIbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749861677; c=relaxed/simple;
	bh=oN3BYIv1X3S/u1Mo6YTEtbt/BDcHUYpHqNKZWnMpRxE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=KA+expHy/eEQm1XEmaFNoEkJZyzWvdh+vQ0MNUslofnPW6KKfT4AgYffEX75ZzHWxsrorq13wHXTOJrlgliNLciU0hPf017OiKSvfWc9AOVkR2NPv+/AiiuTK90cMZA24jnTPxBK2h5l9AUOO5Sn2RYME4n7F00SNQTi6nYzziA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KXEmh/pC; arc=none smtp.client-ip=209.85.160.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KXEmh/pC"
Received: by mail-oa1-f74.google.com with SMTP id 586e51a60fabf-2e95bf2f61dso2066704fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 17:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749861675; x=1750466475; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iIS7VuzJ57xapf7f7yFC0ISYZ4tym+nwEbWhw3lcqKw=;
        b=KXEmh/pCQqgR/9gPg0ngePiFcpFoIl3JR05EbK5z5ZRz3J42BeIVtAUpVCbpqzbAcZ
         Ok4SZNAJOKm3qE4foDoGbTOLaoPLQg8oXXZlJ31+eM01n9hhDxf7ePps0awtHCmiVZBI
         mzOIzMyqDU5SN60XEYnHQPlqfvwnRWDiRgJEIe1/8prl4GIJ+T9TivV2rGictddXffPI
         MMV/UeFnDVVnmJulTV+vV7JSe47AV0zwq4GgdLikx6raArs9yh9Jw2OTe5ypHwFB3T1D
         fCs56lPKdsMEsqKWHmad3i8Cef6ZBgewCUt/JWuwK/k8FOURJOxppQYU+HKogqMr771S
         5FVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749861675; x=1750466475;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iIS7VuzJ57xapf7f7yFC0ISYZ4tym+nwEbWhw3lcqKw=;
        b=SYFripzifly4tKFCXhWySa7kxmuAR/LYvTX+JM6LWYkprBcOh9W6vE9rBPivp4nE1J
         /Q95FvAjQ5aFLI3n6rLBr5MTc0qDNaTqNTh30s6v3SprgNemZPPVMk4doD/4H/KSjeIG
         5G1CyW6jpRQ46kABRvs25YRBAgUlv+Aowv0VPOk0ICE02W/wD+8QX0MlvFd7u0f1uQq5
         iPjPugNYDSr5W3A0Lmo+gwfLdFPbIPucIq8cEHnFXCrCd8MT9XNMDiBfror4GPx36cmP
         6hZpjmiWhZP/4/xuqHZJWypRv0+LXgpIa+etjGxfJE5w+AF9y6+Fg+nGJGTf40lpdC1B
         znjw==
X-Forwarded-Encrypted: i=1; AJvYcCXSuWM4YhG+H12ho8uX9xiOJHVZofWzLxU49ALet2JR8MMhBYSmZ0I/3z3qpPLJlvapawgydXyM+DVncc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwobfnUrZgrUnMS9hR72RkeLEOTYvZb/h45drwIUoIH40zzY1eM
	75doSIMbTPWEfBmZ3dW+vmgYlVBmgTA0OBiurpGrQ4lT7GLt8pMMN6/AKTS6DKv1Q/RXEoj7bzq
	lnBNPbihyMA==
X-Google-Smtp-Source: AGHT+IEkR+VxlvZKAv3aQOYK6PDsZQNMN4JyVSg8Cy2Rg3MCcgHrM2sojs7CgZIizz2tDc+Jew6e07LhSzCb
X-Received: from oabgh10.prod.google.com ([2002:a05:6870:3b0a:b0:2c1:6d20:7b92])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:d1c5:b0:2d4:e101:13f1
 with SMTP id 586e51a60fabf-2eaf0a147b1mr1068527fac.13.1749861675136; Fri, 13
 Jun 2025 17:41:15 -0700 (PDT)
Date: Fri, 13 Jun 2025 17:41:06 -0700
In-Reply-To: <20250614004108.1650988-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250614004108.1650988-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250614004108.1650988-3-irogers@google.com>
Subject: [PATCH v1 3/4] perf trace: Add missed freeing of ordered events and thread
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

Caught by leak sanitizer running "perf trace BTF general tests".

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-trace.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
index bf9b5d0630d3..39b6a13ca862 100644
--- a/tools/perf/builtin-trace.c
+++ b/tools/perf/builtin-trace.c
@@ -5359,6 +5359,7 @@ static int trace__config(const char *var, const char *value, void *arg)
 
 static void trace__exit(struct trace *trace)
 {
+	thread__zput(trace->current);
 	strlist__delete(trace->ev_qualifier);
 	zfree(&trace->ev_qualifier_ids.entries);
 	if (trace->syscalls.table) {
@@ -5369,6 +5370,7 @@ static void trace__exit(struct trace *trace)
 	zfree(&trace->perfconfig_events);
 	evlist__delete(trace->evlist);
 	trace->evlist = NULL;
+	ordered_events__free(&trace->oe.data);
 #ifdef HAVE_LIBBPF_SUPPORT
 	btf__free(trace->btf);
 	trace->btf = NULL;
-- 
2.50.0.rc1.591.g9c95f17f64-goog

