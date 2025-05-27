Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1917B202C5D
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 06:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748328140; cv=none; b=m8cdB9DAr6eI4TN9XoUiqofuIjj7etTgPq5VSpS++6B027/+F4Yogi2egbEDPys/qjxhN9NbTqik7JGLVKcvU3IQe/nzRQ4KTNX+6uILoWqLT33FMYVO7Qy0nwyEL7g40A7sA27soOs2yOujzzm9JQMB3RCRiVFiPUZ/8YcUwls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748328140; c=relaxed/simple;
	bh=Lk3DRYGD+SHY8MhJeChpSoSm5juJjk9zmN2YQ0n2PfE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=O3VpO1wYaEo7a0ogFXYxA7B4RGrfP1t1Cax+BMFsNjOBGpzXw3DlcQfjtdS/ix81txoPgx3Az2xoixp1uQcEzAoeisQIQPMZaSr+7SNsuTn6eQa3NmeXTuFk0abOfRK/uYKZtOUTr0juA8H3Q3wf759BduJwMAuaXsxKUTqaIEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ju6n2L4J; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ju6n2L4J"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-31171a736b2so2376592a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 23:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748328137; x=1748932937; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EQf+Z2part0hsdtY7//u4THJS4IDXYFor1XjnfmY5gg=;
        b=Ju6n2L4J20KAC9sgf78Ugd8Yl98oMoR0nR/OGKZsTFC+hOBE9ULc6xM6gY8r9sOStl
         ZJ8rfrL+gSlVEefICXc6poTKqePftIc6p0p9zE7Zsrib/kS3ixg/wd3qFEcogJAtVDFB
         b+Bf0iblK3kCfPgihxSdtZRt680sfwEwvufg8lckEDnfr3uHjgva65Hto8Fhj2L9fd6v
         XkM1rQ0/5T/3hOkKLyEpN46vudUWKtBT63415zMA/uZbQ/hn401pca6YFknLKTfxjDYJ
         hUjrDI6R/ZGEzNCL2RndhbUP0TPuLaaNzZd8GtLBG5JYldOPdlHEZ2lpDS5V4lQ96aa8
         1RPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748328137; x=1748932937;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EQf+Z2part0hsdtY7//u4THJS4IDXYFor1XjnfmY5gg=;
        b=kx5zC/dnEibXp5wYG/NRPAtMZ5i60TNNOL1FjkuYo4ggiAJXEC0NoNpbsht0pyhCkS
         B198FjGPlJeBJXmdif8v92rgjovx7JkTq+ZkqUwd0O5FXq6pSoEmyBHkwxEpCKVspYx1
         yndiUvRFBmUMt3mOwEtTWIZ19t9fjiEqJ5Im1NhflUjUpn47R+CQgpFO4KaTTBSfKvCn
         LqTII1SdsNupJoYvdk40VU9rbNfeCpwmjLOLKDC8tcOcqdOxwatYzJSRXYXoaYn0U19E
         X9nm7fgNZPvvV2pF69c5ycVzhZ2nymomYJN7dVYZAZKtkgPhIBG/br3ZQBBIhYH6iEM4
         lCCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHcN9p9Mi3X1/6XGDfxhmEJuL5yXiNasTOF9YKtcNLszSwtNyNopwG8dgOoegEyf1eWi/CPDNZ0V0vhV4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxirnSvJ8V2ivDVk3P524a0JEVSAUpF47ePWixjmyeYJ1yDX7+9
	zkt0yYarOuI+pwfZBCyyDYBOXqb0dweCPN7Ee3TVSQcislxv9aewtJyL8bbVf8Q5sgdaNCDVkrS
	89gxy33rFSg==
X-Google-Smtp-Source: AGHT+IH63nXw7pXDu0b2FYWDPpqXAyJ0WhvWKd5PccXZpsPz9a+Wx6sv15yS8l2Bt2yFk1APhDR1qWujVQuT
X-Received: from pjbpq14.prod.google.com ([2002:a17:90b:3d8e:b0:311:2c1f:b0d8])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3f0d:b0:309:f407:5ad1
 with SMTP id 98e67ed59e1d1-311108a1d6amr22190394a91.14.1748328137381; Mon, 26
 May 2025 23:42:17 -0700 (PDT)
Date: Mon, 26 May 2025 23:41:48 -0700
In-Reply-To: <20250527064153.149939-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250527064153.149939-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250527064153.149939-7-irogers@google.com>
Subject: [PATCH v1 06/11] perf top: Make perf_env locally scoped
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Charlie Jenkins <charlie@rivosinc.com>, Colin Ian King <colin.i.king@gmail.com>, 
	Andi Kleen <ak@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Graham Woodward <graham.woodward@arm.com>, 
	Ilkka Koskinen <ilkka@os.amperecomputing.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Howard Chu <howardchu95@gmail.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Levi Yun <yeoreum.yun@arm.com>, 
	Weilin Wang <weilin.wang@intel.com>, Michael Petlan <mpetlan@redhat.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Chun-Tse Shao <ctshao@google.com>, Ben Gainey <ben.gainey@arm.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

The use of the global host perf_env variable is potentially
inconsistent within the code. Switch perf top to using a locally
scoped variable that is generally accessed through the session.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-top.c | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/tools/perf/builtin-top.c b/tools/perf/builtin-top.c
index 3c89568dd6d0..9ca0617047fd 100644
--- a/tools/perf/builtin-top.c
+++ b/tools/perf/builtin-top.c
@@ -1301,7 +1301,7 @@ static int __cmd_top(struct perf_top *top)
 	perf_set_multithreaded();
 
 	if (perf_hpp_list.socket) {
-		ret = perf_env__read_cpu_topology_map(&perf_env);
+		ret = perf_env__read_cpu_topology_map(perf_session__env(top->session));
 		if (ret < 0) {
 			char errbuf[BUFSIZ];
 			const char *err = str_error_r(-ret, errbuf, sizeof(errbuf));
@@ -1624,6 +1624,7 @@ int cmd_top(int argc, const char **argv)
 		NULL
 	};
 	int status = hists__init();
+	struct perf_env host_env;
 
 	if (status < 0)
 		return status;
@@ -1639,12 +1640,17 @@ int cmd_top(int argc, const char **argv)
 
 	status = perf_config(perf_top_config, &top);
 	if (status)
-		return status;
+		goto out_delete_evlist;
 	/*
 	 * Since the per arch annotation init routine may need the cpuid, read
 	 * it here, since we are not getting this from the perf.data header.
 	 */
-	status = perf_env__read_cpuid(&perf_env);
+	perf_env__init(&host_env);
+	status = perf_env__set_cmdline(&host_env, argc, argv);
+	if (status)
+		goto out_delete_evlist;
+
+	status = perf_env__read_cpuid(&host_env);
 	if (status) {
 		/*
 		 * Some arches do not provide a get_cpuid(), so just use pr_debug, otherwise
@@ -1661,18 +1667,24 @@ int cmd_top(int argc, const char **argv)
 
 	if (disassembler_style) {
 		annotate_opts.disassembler_style = strdup(disassembler_style);
-		if (!annotate_opts.disassembler_style)
-			return -ENOMEM;
+		if (!annotate_opts.disassembler_style) {
+			status = -ENOMEM;
+			goto out_delete_evlist;
+		}
 	}
 	if (objdump_path) {
 		annotate_opts.objdump_path = strdup(objdump_path);
-		if (!annotate_opts.objdump_path)
-			return -ENOMEM;
+		if (!annotate_opts.objdump_path) {
+			status = -ENOMEM;
+			goto out_delete_evlist;
+		}
 	}
 	if (addr2line_path) {
 		symbol_conf.addr2line_path = strdup(addr2line_path);
-		if (!symbol_conf.addr2line_path)
-			return -ENOMEM;
+		if (!symbol_conf.addr2line_path) {
+			status = -ENOMEM;
+			goto out_delete_evlist;
+		}
 	}
 
 	status = symbol__validate_sym_arguments();
@@ -1826,7 +1838,7 @@ int cmd_top(int argc, const char **argv)
 		top.session = NULL;
 		goto out_delete_evlist;
 	}
-	top.session->env = &perf_env;
+	top.session->env = &host_env;
 
 	if (!evlist__needs_bpf_sb_event(top.evlist))
 		top.record_opts.no_bpf_event = true;
@@ -1841,7 +1853,7 @@ int cmd_top(int argc, const char **argv)
 			goto out_delete_evlist;
 		}
 
-		if (evlist__add_bpf_sb_event(top.sb_evlist, &perf_env)) {
+		if (evlist__add_bpf_sb_event(top.sb_evlist, &host_env)) {
 			pr_err("Couldn't ask for PERF_RECORD_BPF_EVENT side band events.\n.");
 			status = -EINVAL;
 			goto out_delete_evlist;
@@ -1863,6 +1875,7 @@ int cmd_top(int argc, const char **argv)
 	evlist__delete(top.evlist);
 	perf_session__delete(top.session);
 	annotation_options__exit();
+	perf_env__exit(&host_env);
 
 	return status;
 }
-- 
2.49.0.1151.ga128411c76-goog

