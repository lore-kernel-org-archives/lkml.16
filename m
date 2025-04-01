Received: from mail-ot1-f73.google.com (mail-ot1-f73.google.com [209.85.210.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BB92253BB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 18:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743531949; cv=none; b=McXzhLTwcL6ce5IgsaBPCoijpAmpkY6h7nM/M+VMBwKw0V5tvkUlkbF00ijNrAy36PKSSoIF1gUHoJc9jSx+hjpLxyFDjHDf6+9/PfpVWGb2qWwklQJ8rFzNohNgQdszpiD0Mw4LoE3rJvQGLlgt+BYadcusf8VdT/t20IXoB/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743531949; c=relaxed/simple;
	bh=MBDOAj0hPKHpQkoNjahydiN73L9NoaCbnaJXUshhGm0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=DLmBXHgZd8BW/bc70E+NJtza19cECYPEYpYBEQd7/ZfJbLXc9JEpuHA8BoOdpTrE7M3daUjxBZtiYf90La5SDh2ohvNe+sqZm3J3VXpDh2KlPLvMvQP1N5KRGkulJcKqjVeVigXZJ4QESeuCTGVc8uwuv+rCOMd5dqoHytj11EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VwMQQoLO; arc=none smtp.client-ip=209.85.210.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VwMQQoLO"
Received: by mail-ot1-f73.google.com with SMTP id 46e09a7af769-72c7d6a53easo1194544a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 11:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743531947; x=1744136747; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3UTRp4Jp4MSvHARTmLwq2lUMY2ZfT8GOaVYNdpU6sCg=;
        b=VwMQQoLOCiK34fXTO48lRQp1juvyeRbOL6g3Y3c8gvO4pWgWf23MwRbMXtn8kmSafT
         dUIsYj97rpePpTKuP6RWRSTjcJ/MQb3kY0ChFrllqq04WzrHe4E54l7+LxZatHfAMgLs
         JxO1uWSFgv3MvjvNFNPXs9kT4HsS8mZAjpoFGaHjtJRTIjeYB6eCu1pSU92oyu5oZJnW
         XeJmR8KPruKHoldfVhKz/ZAz2BzSa19TLvQg7MioeG4OKe76p+z8TuTZlrTlIdHlXgkc
         rkL7s0cEq60gBv+mIvxLptCDQjbgNXxH3tjeELOkSk4LcN/Y2AcFE9B2nzuQhyrCv+gO
         VfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743531947; x=1744136747;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3UTRp4Jp4MSvHARTmLwq2lUMY2ZfT8GOaVYNdpU6sCg=;
        b=UOsQEAKIRb3YG2KAS0C70XBmeTQiVpkorw+Puw6po51iplDBB8BXcJFLXZTMN33mOW
         bNcDhpFFVbTbCp3ZpHpZpRpcbWD8mm63xCeWjVMVg3kuhKsXrzrkISTfw3814ozeHIsq
         yhHBbbpNWukjLZ6WH9nLdGQ9ABkAgpo5AKN062mKZ2Fo/O49sgeLvCMiOCHAkAvpk/Fp
         7is7g8Rny+bReJMTqRfU6YUYHKHsBb8l/93HLNBO32v3o0NjlT5Bw5hjcnQChJ3DOrhq
         3Eexjx29kJUQA3tlr2AT0gsVeqWmzBBZsD5nAtiAZYRWl2SoHrmdyHTu1cgIvOV9qte2
         /kuw==
X-Forwarded-Encrypted: i=1; AJvYcCW9FsgeblXBbOZNXMpHaJvQZnYp82qSP5BPpG5DIqtif73rTO5ycIAxKQFXHzUYlnCqc89MK+broNnHlPs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQdAVRXKyReqhHHfbztJCMWhIUE043qwITyHQ+Rd3vMGqxUOxI
	cVQdp5Ffecf6/qXXRKLCgrtuOxJpJdzuotpyFsYRB7NojzoNfI6brcmxYuVeizBK6m0yCVR2QDd
	kdyXV3w==
X-Google-Smtp-Source: AGHT+IEsrz/KaBMv5972/PnVFS75LSjTuIhiZlIKgw8UI1qwxDb1rR4a1EvTReYHhxsnFHQO/ofbC87XKrhm
X-Received: from oabfr13.prod.google.com ([2002:a05:6870:f80d:b0:2c2:5d77:108f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6830:698a:b0:72b:946e:ccc7
 with SMTP id 46e09a7af769-72c6366fefdmr8680020a34.0.1743531946761; Tue, 01
 Apr 2025 11:25:46 -0700 (PDT)
Date: Tue,  1 Apr 2025 11:23:33 -0700
In-Reply-To: <20250401182347.3422199-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250401182347.3422199-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250401182347.3422199-36-irogers@google.com>
Subject: [PATCH v1 35/48] perf ftrace: Silence -Wshorten-64-to-32 warnings
From: Ian Rogers <irogers@google.com>
To: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Yicong Yang <yangyicong@hisilicon.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Kyle Meyer <kyle.meyer@hpe.com>, 
	Ben Gainey <ben.gainey@arm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Kajol Jain <kjain@linux.ibm.com>, Aditya Gupta <adityag@linux.ibm.com>, 
	Eder Zulian <ezulian@redhat.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Kuan-Wei Chiu <visitorckw@gmail.com>, He Zhe <zhe.he@windriver.com>, 
	Dirk Gouders <dirk@gouders.net>, Brian Geffon <bgeffon@google.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Howard Chu <howardchu95@gmail.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Colin Ian King <colin.i.king@gmail.com>, 
	Dominique Martinet <asmadeus@codewreck.org>, Jann Horn <jannh@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Yang Jihong <yangjihong@bytedance.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andi Kleen <ak@linux.intel.com>, Graham Woodward <graham.woodward@arm.com>, 
	Ilkka Koskinen <ilkka@os.amperecomputing.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	Hao Ge <gehao@kylinos.cn>, Tengda Wu <wutengda@huaweicloud.com>, 
	Gabriele Monaco <gmonaco@redhat.com>, Chun-Tse Shao <ctshao@google.com>, 
	Casey Chen <cachen@purestorage.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Li Huafei <lihuafei1@huawei.com>, "Steinar H. Gunderson" <sesse@google.com>, Levi Yun <yeoreum.yun@arm.com>, 
	Weilin Wang <weilin.wang@intel.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, Andrew Kreimer <algonell@gmail.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Jean-Philippe Romain <jean-philippe.romain@foss.st.com>, Junhao He <hejunhao3@huawei.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Xu Yang <xu.yang_2@nxp.com>, 
	Steve Clevenger <scclevenger@os.amperecomputing.com>, Zixian Cai <fzczx123@gmail.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Yujie Liu <yujie.liu@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

The clang warning -Wshorten-64-to-32 can be useful to catch
inadvertent truncation. In some instances this truncation can lead to
changing the sign of a result, for example, truncation to return an
int to fit a sort routine. Silence the warning by making the implicit
truncation explicit.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-ftrace.c  | 17 +++++++++++------
 tools/perf/util/bpf_ftrace.c |  4 ++--
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/tools/perf/builtin-ftrace.c b/tools/perf/builtin-ftrace.c
index 7caa18d5ffc3..1484d798de40 100644
--- a/tools/perf/builtin-ftrace.c
+++ b/tools/perf/builtin-ftrace.c
@@ -182,7 +182,8 @@ static int read_tracing_file_to_stdout(const char *name)
 
 	/* read contents to stdout */
 	while (true) {
-		int n = read(fd, buf, sizeof(buf));
+		ssize_t n = read(fd, buf, sizeof(buf));
+
 		if (n == 0)
 			break;
 		else if (n < 0)
@@ -449,7 +450,7 @@ static int set_tracing_percpu_buffer_size(struct perf_ftrace *ftrace)
 		return 0;
 
 	ret = write_tracing_file_int("buffer_size_kb",
-				     ftrace->percpu_buffer_size / 1024);
+				     (int)(ftrace->percpu_buffer_size / 1024));
 	if (ret < 0)
 		return ret;
 
@@ -691,7 +692,8 @@ static int __cmd_ftrace(struct perf_ftrace *ftrace)
 			break;
 
 		if (pollfd.revents & POLLIN) {
-			int n = read(trace_fd, buf, sizeof(buf));
+			ssize_t n = read(trace_fd, buf, sizeof(buf));
+
 			if (n < 0)
 				break;
 			if (fwrite(buf, n, 1, stdout) != 1)
@@ -713,7 +715,8 @@ static int __cmd_ftrace(struct perf_ftrace *ftrace)
 
 	/* read remaining buffer contents */
 	while (true) {
-		int n = read(trace_fd, buf, sizeof(buf));
+		ssize_t n = read(trace_fd, buf, sizeof(buf));
+
 		if (n <= 0)
 			break;
 		if (fwrite(buf, n, 1, stdout) != 1)
@@ -1031,7 +1034,8 @@ static int __cmd_latency(struct perf_ftrace *ftrace)
 			break;
 
 		if (pollfd.revents & POLLIN) {
-			int n = read(trace_fd, buf, sizeof(buf) - 1);
+			ssize_t n = read(trace_fd, buf, sizeof(buf) - 1);
+
 			if (n < 0)
 				break;
 
@@ -1049,7 +1053,8 @@ static int __cmd_latency(struct perf_ftrace *ftrace)
 
 	/* read remaining buffer contents */
 	while (!ftrace->target.use_bpf) {
-		int n = read(trace_fd, buf, sizeof(buf) - 1);
+		ssize_t n = read(trace_fd, buf, sizeof(buf) - 1);
+
 		if (n <= 0)
 			break;
 		make_histogram(ftrace, buckets, buf, n, line);
diff --git a/tools/perf/util/bpf_ftrace.c b/tools/perf/util/bpf_ftrace.c
index 7324668cc83e..c4b3bb4e5922 100644
--- a/tools/perf/util/bpf_ftrace.c
+++ b/tools/perf/util/bpf_ftrace.c
@@ -97,7 +97,7 @@ int perf_ftrace__latency_prepare_bpf(struct perf_ftrace *ftrace)
 							    false, func->name);
 	if (IS_ERR(skel->links.func_begin)) {
 		pr_err("Failed to attach fentry program\n");
-		err = PTR_ERR(skel->links.func_begin);
+		err = (int)PTR_ERR(skel->links.func_begin);
 		goto out;
 	}
 
@@ -105,7 +105,7 @@ int perf_ftrace__latency_prepare_bpf(struct perf_ftrace *ftrace)
 							  true, func->name);
 	if (IS_ERR(skel->links.func_end)) {
 		pr_err("Failed to attach fexit program\n");
-		err = PTR_ERR(skel->links.func_end);
+		err = (int)PTR_ERR(skel->links.func_end);
 		goto out;
 	}
 
-- 
2.49.0.504.g3bcea36a83-goog

