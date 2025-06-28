Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64EE21FF42
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 04:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751086268; cv=none; b=MkA+DkMkXA3bbO7Rvi4C9nPh1Y9akuASf/wyzSAUsesdzBwzQAd2xRlhq3fRN99ik1nBZjPvBnUXfC25Lb3xU+yifwkfSBiXAOvqiIEXkhp9YXXy+K8ZI5mZWG0CfRsh489C/KastNom1HtiyhOAlM5CIUtxdLtvuQkh+0KVuHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751086268; c=relaxed/simple;
	bh=Wqv10aBltPBXUHLr9USn9Z7UE0yIqyWqu3PrwUYHbiI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=Kn6DFLdBWpRH/NR+kXSIr37Ciz2wlHez/r0jDdvI4KeHoJpUCPChkRnpJVY7p7LcbiuKNadph0cyfZ63YSiL1+ta9TW7yrH9xj1ugRyQLXW2x6lMaewFMPn851HmfbcaW/iWsYAFlPX8BZiVhyXHDZmm5Zh1pmspAYx8M70K9BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cFUaKxYT; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cFUaKxYT"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2356ce55d33so34958615ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 21:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751086266; x=1751691066; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TT9zT2536gJjOZ4EIQ6l60zD2zdNSDXQaYMi8NYa5Ek=;
        b=cFUaKxYTHEx3hZHRPpKyPcw8MTjoVpaX/9uri5VU8ktfSe1BEVpsqJ3VE39pTsaIGI
         3gjP8Po8pxXgWqXObXR+y85IEoMWcdJp0gPozq5y9XwsnTsr6ZA999o5+oY5oEgkFaXu
         gXOa3MUcnad0u8udH2Dkk+VxjSlXOqxnlbNC2ElHYWx1Pb3OLJEIbepTYnPUxWgEZnEN
         48fqRr63uJ3RTb4xglZ2z4RqmQOsk29UvsLZdvkW1vHG6rDHsL9f4QLbMv8vNsX7M6jf
         VSxz8Iv5QkUEyyxQ+CutTqGhe0VvYfRT53M4btsKrL/phkO/rJnlx3RD1f2gupVPK4fD
         wBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751086266; x=1751691066;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TT9zT2536gJjOZ4EIQ6l60zD2zdNSDXQaYMi8NYa5Ek=;
        b=txoodLD+9zI9A6LlU7jXyYBtdulk1tUusprIVrNOZnHI3FZZtu7phgLSW+LO+ZSQXs
         44HL6dOV8OTo0OxdoXMV1qwxHfEaTQ73C6PCuhS8NyrMedGuVBHHgf5hin2XApE0t5SN
         urM5AwRflbMLzj8dfGf1m7WF+t3YP+YvqTni5sbF9AgJUAqG2ur8nNeRhmjI0T/nfIeH
         MJkmuox1EaX1d3HGGWMv5nShjpuvYVYcfLEW5KofCHPBnwk7rOxcgB/WAedaz8IYA5sc
         Ij/TsKraIBOEhk1IGo1VrEGNRKiPTmcvMCwzhvFf1g6Wlw4i+/nyaOj1jPwdKAwECBQk
         S9TA==
X-Forwarded-Encrypted: i=1; AJvYcCX3CdeiedVJyuNsJ6RM/hbQRNtwHZIbPFphk5sLLhmrsd8PEqCLlw6JM0UcxoN5HWPS9fPzoCLZ/FZTv5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIAzPeCJW+Khy5SNUP8cK5P4XPGkuhK3LbFH1iCCuYx+nEik44
	Z3yQi0HRVIyZ5DKdrH8YM6I5O7ZA1v5jzFej86+0Gmn0asCYGPA542TLkKUx6NQeMAq+IUx/qJt
	HDfXLZ5H2ug==
X-Google-Smtp-Source: AGHT+IH+KbSHYBqzmLEU1hrbmakGCU2JwYO5D/JSKx+kk6D+KFS8VGHUVFIV2JLOJ7PQwIr4Gzdzdb8sHtJc
X-Received: from pjbeu16.prod.google.com ([2002:a17:90a:f950:b0:311:6040:2c7a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a8c:b0:237:f76f:ce34
 with SMTP id d9443c01a7336-23ac40e02a2mr85189075ad.15.1751086266211; Fri, 27
 Jun 2025 21:51:06 -0700 (PDT)
Date: Fri, 27 Jun 2025 21:50:07 -0700
In-Reply-To: <20250628045017.1361563-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250628045017.1361563-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250628045017.1361563-14-irogers@google.com>
Subject: [PATCH v5 13/23] perf test: Avoid use perf_env
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

The perf_env global variable holds the host perf_env data but its use
is hit and miss. Switch to using local perf_env variables and ensure
scoped perf_env__init and perf_env__exit. This loses command line
setting of the perf_env, but this doesn't matter for tests. So the
perf_env is fully initialized, clear it with memset in perf_env__init.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/code-reading.c  |  5 +++-
 tools/perf/tests/dlfilter-test.c | 50 ++++++++++++++++++--------------
 tools/perf/util/env.c            |  1 +
 3 files changed, 33 insertions(+), 23 deletions(-)

diff --git a/tools/perf/tests/code-reading.c b/tools/perf/tests/code-reading.c
index cf6edbe697b2..4b2461e93b2b 100644
--- a/tools/perf/tests/code-reading.c
+++ b/tools/perf/tests/code-reading.c
@@ -651,11 +651,13 @@ static int do_test_code_reading(bool try_kcore)
 	struct dso *dso;
 	const char *events[] = { "cycles", "cycles:u", "cpu-clock", "cpu-clock:u", NULL };
 	int evidx = 0;
+	struct perf_env host_env;
 
 	pid = getpid();
 
 	machine = machine__new_host();
-	machine->env = &perf_env;
+	perf_env__init(&host_env);
+	machine->env = &host_env;
 
 	ret = machine__create_kernel_maps(machine);
 	if (ret < 0) {
@@ -798,6 +800,7 @@ static int do_test_code_reading(bool try_kcore)
 	perf_cpu_map__put(cpus);
 	perf_thread_map__put(threads);
 	machine__delete(machine);
+	perf_env__exit(&host_env);
 
 	return err;
 }
diff --git a/tools/perf/tests/dlfilter-test.c b/tools/perf/tests/dlfilter-test.c
index 54f59d1246bc..6427e3382711 100644
--- a/tools/perf/tests/dlfilter-test.c
+++ b/tools/perf/tests/dlfilter-test.c
@@ -319,11 +319,12 @@ static int run_perf_script(struct test_data *td)
 
 static int test__dlfilter_test(struct test_data *td)
 {
+	struct perf_env host_env;
 	u64 sample_type = TEST_SAMPLE_TYPE;
 	pid_t pid = 12345;
 	pid_t tid = 12346;
 	u64 id = 99;
-	int err;
+	int err = TEST_OK;
 
 	if (get_dlfilters_path(td->name, td->dlfilters, PATH_MAX))
 		return test_result("dlfilters not found", TEST_SKIP);
@@ -353,37 +354,42 @@ static int test__dlfilter_test(struct test_data *td)
 
 	pr_debug("Creating new host machine structure\n");
 	td->machine = machine__new_host();
-	td->machine->env = &perf_env;
+	perf_env__init(&host_env);
+	td->machine->env = &host_env;
 
 	td->fd = creat(td->perf_data_file_name, 0644);
 	if (td->fd < 0)
 		return test_result("Failed to create test perf.data file", TEST_FAIL);
 
 	err = perf_header__write_pipe(td->fd);
-	if (err < 0)
-		return test_result("perf_header__write_pipe() failed", TEST_FAIL);
-
+	if (err < 0) {
+		err = test_result("perf_header__write_pipe() failed", TEST_FAIL);
+		goto out;
+	}
 	err = write_attr(td, sample_type, &id);
-	if (err)
-		return test_result("perf_event__synthesize_attr() failed", TEST_FAIL);
-
-	if (write_comm(td->fd, pid, tid, "test-prog"))
-		return TEST_FAIL;
-
-	if (write_mmap(td->fd, pid, tid, MAP_START, 0x10000, 0, td->prog_file_name))
-		return TEST_FAIL;
-
-	if (write_sample(td, sample_type, id, pid, tid) != TEST_OK)
-		return TEST_FAIL;
-
+	if (err) {
+		err = test_result("perf_event__synthesize_attr() failed", TEST_FAIL);
+		goto out;
+	}
+	if (write_comm(td->fd, pid, tid, "test-prog")) {
+		err = TEST_FAIL;
+		goto out;
+	}
+	if (write_mmap(td->fd, pid, tid, MAP_START, 0x10000, 0, td->prog_file_name)) {
+		err = TEST_FAIL;
+		goto out;
+	}
+	if (write_sample(td, sample_type, id, pid, tid) != TEST_OK) {
+		err = TEST_FAIL;
+		goto out;
+	}
 	if (verbose > 1)
 		system_cmd("%s script -i %s -D", td->perf, td->perf_data_file_name);
 
-	err = run_perf_script(td);
-	if (err)
-		return TEST_FAIL;
-
-	return TEST_OK;
+	err = run_perf_script(td) ? TEST_FAIL : TEST_OK;
+out:
+	perf_env__exit(&host_env);
+	return err;
 }
 
 static void unlink_path(const char *path)
diff --git a/tools/perf/util/env.c b/tools/perf/util/env.c
index 05a4f2657d72..887a6fb7104e 100644
--- a/tools/perf/util/env.c
+++ b/tools/perf/util/env.c
@@ -271,6 +271,7 @@ void perf_env__exit(struct perf_env *env)
 
 void perf_env__init(struct perf_env *env)
 {
+	memset(env, 0, sizeof(*env));
 #ifdef HAVE_LIBBPF_SUPPORT
 	env->bpf_progs.infos = RB_ROOT;
 	env->bpf_progs.btfs = RB_ROOT;
-- 
2.50.0.727.gbf7dc18ff4-goog

