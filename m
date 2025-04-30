Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE2927E7D4
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 17:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746035491; cv=none; b=lQEDphdrghVSvmT9WhZvhBMXjOyeDxY6buNsUhw/ZQHqd5yC5NKvBn0+piMV//H8kDpVfjXGWWoUYzEj+5hZeUyNG6XJh6I1q16YEzocjFb91QNd4d2BKbFR2mWQ88je24CPPi4a00fNabheLyhxPAkit5irjLPQCT2HH5IvUhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746035491; c=relaxed/simple;
	bh=PSiOgG7bWFRhRJGZr4xrC9dwLgvQlvIMtzHTDPuKezI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PZb8g0dVASSH3DHAHeDiolbjypfA32Vys29NfOEupEaJf3Q7qmXkbyQNng5cYxKMXEf9Eix2vkJ0lFwLbk3LreM7bg6WFaC7L5zDIZw0O2fVpH4BBfKy4QbYl9jmmIOESoseGBd27RLTZTp0uXa6jZv//n+hsfVJRNvN/TqAl5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=akEgTEzq; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="akEgTEzq"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-22647ff3cf5so922515ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746035486; x=1746640286; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ffqnGj+pBhQ6TrUOmeMPrDQngLLfEb3NGF58IKymfSU=;
        b=akEgTEzq9okNBFygSKv2UXkT6bA8FCS13nHc1c17l9So7P6atcoFNIodatPcndzfzx
         vopUw+ZBPSSqffVuahaLiriLd0xL+wURIhNylHgdveUdnLNKquX7C1ALNSyuABo9AqA8
         Cq13rylt6cb7neGiEEy8OHQg4vf3GNoN8UKHl/Ik+OGBHa1DDn9+8WGxj0X6/ng+xuJ2
         hNOZBpU/alqB6Ee/33V2eBsKKEDpyCbJ8UiW9+41seDzbAqgfkHxyvxu8hmKSkQx0l7L
         I073bcYp2ognHHV+PpkQplsc/eZkCSVMPwGYNF7gAiDfdpve0EbIWTP2h3VvulQBtIJf
         7WQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746035486; x=1746640286;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ffqnGj+pBhQ6TrUOmeMPrDQngLLfEb3NGF58IKymfSU=;
        b=T/MokTavV/8AFHheyt9k3VhMus70ffA5diV1DOQ4H0FAT9RY9RzUdpfyI8CfBUg621
         IqEuk42H3MKsMwmgpePKa6h6x+PqUvYwKLoYjpZrVgNEJjjPiNJgkCwGRT/gSig+aaMG
         73ZIYZzgBwCXeTWVHuJDk7TJwrJXJNyQfBsWdgUOk8F8rSLADoxttVWktNBii52eJ7n1
         K+42c9GqPl67Z5IrrKEhiCPhoxXHIW5oU8xpSkJ9X5TJ5p3rvBmbwSjzMeH3cRWEorEY
         2jgVwJLDtLmKERM7k4lRI0SNwPBwnQSiBpVxzC4/mgGtzGg3Kv9o630lYI1H3V9GX4E3
         UYuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI9Sbcr+B4c/xWij1Q8UorOUtD7HQFzgyU4P1Vgbz1eNOB2RnllXciSKEKiwLByoNmFn3wqGNR0NuHyb8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW6HtswaytIMKYuUSHjJiG88j6H2CB+E8ZAGH9nWBCyG8JI5a5
	+tJxuDTf9LfEgCRCaIvSxqy6dvYEAVGz0wmYc3wD0JPzQ32AcbBCShKBORuzkCrJ30yTC34pMHz
	31o3G3g==
X-Google-Smtp-Source: AGHT+IFoFY/yppOPHW+0sW6SMr0S9TXM/T2GiOtYKIfeG6NYAA5w/aaMGtekGErA65y8/28Sygemm2DdYeVj
X-Received: from pjbrr12.prod.google.com ([2002:a17:90b:2b4c:b0:2ff:4be0:c675])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:da8f:b0:2ff:6bd0:ff26
 with SMTP id 98e67ed59e1d1-30a3336fea3mr4760497a91.34.1746035485584; Wed, 30
 Apr 2025 10:51:25 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:50:02 -0700
In-Reply-To: <20250430175036.184610-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250430175036.184610-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430175036.184610-15-irogers@google.com>
Subject: [PATCH v2 14/47] perf jvmti: Silence -Wshorten-64-to-32 warnings
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
 tools/perf/jvmti/jvmti_agent.c |  6 +++---
 tools/perf/util/genelf.c       |  2 +-
 tools/perf/util/jitdump.c      | 24 +++++++++++++-----------
 3 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/tools/perf/jvmti/jvmti_agent.c b/tools/perf/jvmti/jvmti_agent.c
index 526dcaf9f079..2e2be9d8a118 100644
--- a/tools/perf/jvmti/jvmti_agent.c
+++ b/tools/perf/jvmti/jvmti_agent.c
@@ -377,7 +377,7 @@ jvmti_write_code(void *agent, char const *sym,
 	sym_len = strlen(sym) + 1;
 
 	rec.p.id           = JIT_CODE_LOAD;
-	rec.p.total_size   = sizeof(rec) + sym_len;
+	rec.p.total_size   = (uint32_t)(sizeof(rec) + sym_len);
 	rec.p.timestamp    = perf_get_timestamp();
 
 	rec.code_size  = size;
@@ -400,7 +400,7 @@ jvmti_write_code(void *agent, char const *sym,
 	 */
 	rec.code_index = code_generation++;
 
-	ret = fwrite_unlocked(&rec, sizeof(rec), 1, fp);
+	ret = (int)fwrite_unlocked(&rec, sizeof(rec), 1, fp);
 	fwrite_unlocked(sym, sym_len, 1, fp);
 
 	if (code)
@@ -454,7 +454,7 @@ jvmti_write_debug_info(void *agent, uint64_t code,
 	 */
 	size += nr_lines * sizeof(struct debug_entry);
 	size += flen;
-	rec.p.total_size = size;
+	rec.p.total_size = (uint32_t)size;
 
 	/*
 	 * If JVM is multi-threaded, multiple concurrent calls to agent
diff --git a/tools/perf/util/genelf.c b/tools/perf/util/genelf.c
index cdce7f173d00..6da8f3c53f7d 100644
--- a/tools/perf/util/genelf.c
+++ b/tools/perf/util/genelf.c
@@ -252,7 +252,7 @@ jit_write_elf(int fd, uint64_t load_addr, const char *sym,
 	Elf_Shdr *shdr;
 	uint64_t eh_frame_base_offset;
 	char *strsym = NULL;
-	int symlen;
+	size_t symlen;
 	int retval = -1;
 
 	if (elf_version(EV_CURRENT) == EV_NONE) {
diff --git a/tools/perf/util/jitdump.c b/tools/perf/util/jitdump.c
index 624964f01b5f..874ced77d0a4 100644
--- a/tools/perf/util/jitdump.c
+++ b/tools/perf/util/jitdump.c
@@ -160,7 +160,7 @@ jit_open(struct jit_buf_desc *jd, const char *name)
 	 */
 	flockfile(jd->in);
 
-	ret = fread(buf, sizeof(header), 1, jd->in);
+	ret = (int)fread(buf, sizeof(header), 1, jd->in);
 	if (ret != 1)
 		goto error;
 
@@ -226,7 +226,7 @@ jit_open(struct jit_buf_desc *jd, const char *name)
 		bsz = bs;
 		buf = n;
 		/* read extra we do not know about */
-		ret = fread(buf, bs - bsz, 1, jd->in);
+		ret = (int)fread(buf, bs - bsz, 1, jd->in);
 		if (ret != 1)
 			goto error;
 	}
@@ -274,7 +274,7 @@ jit_get_next_entry(struct jit_buf_desc *jd)
 	/*
 	 * file is still locked at this point
 	 */
-	ret = fread(prefix, sizeof(*prefix), 1, jd->in);
+	ret = (int)fread(prefix, sizeof(*prefix), 1, jd->in);
 	if (ret  != 1)
 		return NULL;
 
@@ -304,7 +304,7 @@ jit_get_next_entry(struct jit_buf_desc *jd)
 
 	addr = ((void *)jd->buf) + sizeof(*prefix);
 
-	ret = fread(addr, bs - sizeof(*prefix), 1, jd->in);
+	ret = (int)fread(addr, bs - sizeof(*prefix), 1, jd->in);
 	if (ret != 1)
 		return NULL;
 
@@ -398,7 +398,7 @@ static uint64_t convert_timestamp(struct jit_buf_desc *jd, uint64_t timestamp)
 		return timestamp;
 
 	tc.time_shift = time_conv->time_shift;
-	tc.time_mult  = time_conv->time_mult;
+	tc.time_mult  = (unsigned int)time_conv->time_mult;
 	tc.time_zero  = time_conv->time_zero;
 
 	/*
@@ -443,8 +443,8 @@ static int jit_repipe_code_load(struct jit_buf_desc *jd, union jr_entry *jr)
 	nspid = jr->load.pid;
 	pid   = jr_entry_pid(jd, jr);
 	tid   = jr_entry_tid(jd, jr);
-	csize = jr->load.code_size;
-	usize = jd->unwinding_mapped_size;
+	csize = (int)jr->load.code_size;
+	usize = (int)jd->unwinding_mapped_size;
 	addr  = jr->load.code_addr;
 	sym   = (void *)((unsigned long)jr + sizeof(jr->load));
 	code  = (unsigned long)jr + jr->load.p.total_size - csize;
@@ -465,8 +465,10 @@ static int jit_repipe_code_load(struct jit_buf_desc *jd, union jr_entry *jr)
 
 	size = PERF_ALIGN(size, sizeof(u64));
 	uaddr = (uintptr_t)code;
-	ret = jit_emit_elf(jd, filename, sym, addr, (const void *)uaddr, csize, jd->debug_data, jd->nr_debug_entries,
-			   jd->unwinding_data, jd->eh_frame_hdr_size, jd->unwinding_size);
+	ret = jit_emit_elf(jd, filename, sym, addr, (const void *)uaddr, csize, jd->debug_data,
+			   (int)jd->nr_debug_entries, jd->unwinding_data,
+			   (uint32_t)jd->eh_frame_hdr_size,
+			   (uint32_t)jd->unwinding_size);
 
 	if (jd->debug_data && jd->nr_debug_entries) {
 		zfree(&jd->debug_data);
@@ -559,8 +561,8 @@ static int jit_repipe_code_move(struct jit_buf_desc *jd, union jr_entry *jr)
 
 	nspid = jr->load.pid;
 	pid   = jr_entry_pid(jd, jr);
-	tid   = jr_entry_tid(jd, jr);
-	usize = jd->unwinding_mapped_size;
+	tid   = (int)jr_entry_tid(jd, jr);
+	usize = (int)jd->unwinding_mapped_size;
 	idr_size = jd->machine->id_hdr_size;
 
 	/*
-- 
2.49.0.906.g1f30a19c02-goog

