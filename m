Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08F3296142
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 17:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746035528; cv=none; b=kGblILox1QtpRnz1ibgJ9Ugq/1ryBwWviHyM6I00ALfw07HEoFX63twWCga5awmIQRjbNH/Yxs4GOL21Uq/uPuvLWty/HD+xvuIk1lwbJNtXKu07k5c7vzqiLi8Vm1/z6srqRSHJwMFn12nsvLnBcnkvc1S600u97q/y1XCLab8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746035528; c=relaxed/simple;
	bh=+JTjjtNzvzvzjuIb761GRkF+EAmPjXbfvmiSeun8Pew=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ldNkvhHh5y1LGd42pneQMZ3hWQiSYljtMxpV/wTRaRF2rtM0k8AvwnsNhhYSNohZxANSfPYyMVdUYpX4OsygT/AwGWo+6dcuYRLMNVYuLRajITph+BjJbpnRGbyeieS0qUE01ybJHUH//40j4ktRAhq97ScV6YzOiJcvIg/ZLWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mSEgpxDt; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mSEgpxDt"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff78dd28ecso160215a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746035526; x=1746640326; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5CMzuyJOwSTighBfuyXClSTO3yXJaJHsRmUmT4e6o/I=;
        b=mSEgpxDtbdlhlUz+xO6vbSngqVIKfpg59MmDCiSi6dGDAqNDYEKZBvuMZ4LDO/XIk9
         xxBeiZNAPk5uFsIVstt5fmbBEvU1fBtU/XNsg+SGk1oq65MIqXJO99qW5ZVhjdPbytUe
         k2GDnncdO5l9JO1w/WV/3nJZzSzC3T+SS+YvWo7rfZANEsF9gmTaPXNuK8nbp7+M58Oh
         +nKrpkXxh8q97hFMog3ZxSIo9l225KnHQMOr7ktGULMI5DYrGy4ca3Ek4aEFT3G6qLbZ
         SQtmlUouZ7uhyFOVXyTRnmgzR+AG2OGHg4MQ1o+GctAbZPntvtg/tjXRX5AKtAxAOHU0
         vj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746035526; x=1746640326;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5CMzuyJOwSTighBfuyXClSTO3yXJaJHsRmUmT4e6o/I=;
        b=BEIfWw2cR8XWXguD+OR6L1gPgTWOZd/e3w9OvdWL/LqYmdAgQOWHQCjLTLEQHtUrpv
         HGWro7FtQNOOBdFNIsp0yJ1WCuX3I1Ep19PPIW/FmOcQjmvR5A0r4wmFWzkI3VBB/OtH
         qr2yR0KuXywl8vmPw0pYzIExk244p9tJo9A1ANsqqDrQeS/wEGp6MWfpezGFp47eUCd3
         sQutcdV8+gubGvxZVqKUb97QpKxVNz2ggDuE9YhDmjzeu8YDW5WMswHSgENQuv2N/3m+
         PTaZOU0cECBKLZ24+oqi6QD/CubxuS2v3fu4FOYyLuEErB5WmIjLWD1NUmUvpj/Ouxl9
         lDyA==
X-Forwarded-Encrypted: i=1; AJvYcCWcikybAtKn7HWSVf5ZHh3v9rl5eqFtTl5xsibYr6HVpQPzFG+bWk9mueemGAlMXoTxfoxasVqUODS5H4o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm7d1ubf8gy99UOmkwAg2M9ZXqxBlQ8/4ImBzMQJV1TJLaBuDB
	ZKXe9akQqkr4HOMXDNKEZSnA2VfUbmICSL7JtOm/P5RpbMeSpqjUD1o3fOoW3X19sDLQB9EeXGz
	rZW0roA==
X-Google-Smtp-Source: AGHT+IEm3OrqUVvQcZRWYpnAOOuCxg3CInyP2zfCYSsxoscAsnu+apEdQ6fIw3eXzJCGStlHLUhpOir1rY0e
X-Received: from pjbsu14.prod.google.com ([2002:a17:90b:534e:b0:308:8654:b634])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3852:b0:2ff:5ed8:83d1
 with SMTP id 98e67ed59e1d1-30a3441ebf7mr4929780a91.19.1746035526256; Wed, 30
 Apr 2025 10:52:06 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:50:22 -0700
In-Reply-To: <20250430175036.184610-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250430175036.184610-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430175036.184610-35-irogers@google.com>
Subject: [PATCH v2 34/47] perf ftrace: Silence -Wshorten-64-to-32 warnings
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Thomas Gleixner <tglx@linutronix.de>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
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
	Li Huafei <lihuafei1@huawei.com>, "Steinar H. Gunderson" <sesse@google.com>, 
	Levi Yun <yeoreum.yun@arm.com>, Weilin Wang <weilin.wang@intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Thomas Richter <tmricht@linux.ibm.com>, 
	Andrew Kreimer <algonell@gmail.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Jean-Philippe Romain <jean-philippe.romain@foss.st.com>, Junhao He <hejunhao3@huawei.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Xu Yang <xu.yang_2@nxp.com>, 
	Steve Clevenger <scclevenger@os.amperecomputing.com>, Zixian Cai <fzczx123@gmail.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Yujie Liu <yujie.liu@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Cc: Ian Rogers <irogers@google.com>
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
2.49.0.906.g1f30a19c02-goog

