Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A727E26FD9C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 17:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746035491; cv=none; b=lNiwkMwVmqxYlfTNVhUrXWRAc1L1u7M+KnA0iUOv3nF2IoXj93pS5FQ4CQ8/ZwLkFW8vYltkhhR776DBoSF0755eRRw7T5MWmt12kl57/qIyyZP5dZWCBawCwF7o/1j5Vnt3TqKWqzsO23xY+ic8ITPEOkS69bPGoRby3jVh8UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746035491; c=relaxed/simple;
	bh=fBONA3uIlmAjZ4yMhUPk4a2yW0//Co8RC/NrTAeAagw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BVtDp3cnmBeHe9EUlzKmx8TIgbHqQaOO8S/Qom+cg0izLXkdMcHt3f30qR1z2YiwwoEQvQXDoKD7VpuJby8G3ZxOCDrdwLIW4qb7fQDBP+aav1MGnmM9VDxxDKAPdWbtKiQD0zKGZt6JhQDrPuW5GgVd8UAt3FP0mnhj6juMIJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LaUzqnFC; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LaUzqnFC"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-af5156fbe79so109701a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746035488; x=1746640288; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oCcMOkMJ6nVRY+G559CvBPXmkx4KPAiCuoG+6vArkCs=;
        b=LaUzqnFCo5uOET8UQYSVZzxPiYjJuGV9Slk/UJ8+xWq9qQQ7I7rEK0Ju7Ro3kB3V/I
         NoJJdSgE4RsV4oA7dLImnN9w3aqQGtsGMbDtsH3JyT/8xHT2V8MIYkKhBg6td12W6qs7
         J+tnS6lExbnnOxUVoW5AqgGh38/sqTwo/ELZ9o+TKY6z2vwJVzTO1g/ccu4ISxhlyzUW
         4jUGG15Vf4xDufWtc2t2vY//YBIK6GkghyDsA/RHZixS6cb0/3uuFcBRIf2IdMbLNljm
         F95PJJI2eBN5MN/lalIXJ73NNzFFRsDjE8K5aa8VGA9yd998zFQsdtUxwoR7PNmN0rb/
         FqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746035488; x=1746640288;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oCcMOkMJ6nVRY+G559CvBPXmkx4KPAiCuoG+6vArkCs=;
        b=JmNzLK0wzjfRFOjD2yUarIjHC0hliW6LCsYjjhB/MEWp1oPfdm7zDr1gwLUnam4KMH
         FTvNhlUAcQpiKwIIkTt6ulFkJE/xX/MGr5G8HQ+yHvmF6fzNNxuF/1I57s9vIH5C4Dul
         Z+W2+yHs+06lHBN1DcDBv82Gx2UX+0MaKkHJMNFIeZ9rraN9pqxJ69h0W2Y1n8UehwBc
         Bt0H3sZRadh1oYhJQWq9EJ+MsEeHAvC4lP3uRcMvMxsaCRZSGUwX0lGIWM9PzUQiNHpw
         sU4D5lzzMJaRbVLBBekNhLvjUVcNtXreXU2g5Zak48Ioafgpe3TTr5zdMeb/F0MVgPPd
         tA8w==
X-Forwarded-Encrypted: i=1; AJvYcCVAFCoSKnp5vjkSh2s0UbMjBxQmNpaUPUWBolxKyYq7gytcvWpilbfpy8l5GKiRi3N4fF67jiv/W2WPukI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCooIkMUoM1Lws5ygzbkhAZGz9c90lKwf8cpWs7P5Eiown4C6K
	Xt9S4zEqYyf5Qoqhc0yVhJni+XAdI0vyQ2/mjDUCGCyYps+x21kPCSF2K6PJxJibO8eaWJKdAsw
	Foj4j3A==
X-Google-Smtp-Source: AGHT+IEZUQuh6O8cqIu2sdaa1zcv62a+B5jkQCmIGT9u8q4uK0EvgjUV0foEedm6TafaS4MGEDz7NL4QC540
X-Received: from pjm4.prod.google.com ([2002:a17:90b:2fc4:b0:305:2d68:2be6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c40f:b0:229:1717:8812
 with SMTP id d9443c01a7336-22df56afa5emr51435105ad.0.1746035487474; Wed, 30
 Apr 2025 10:51:27 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:50:03 -0700
In-Reply-To: <20250430175036.184610-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250430175036.184610-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430175036.184610-16-irogers@google.com>
Subject: [PATCH v2 15/47] perf pmu: Silence -Wshorten-64-to-32 warnings
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
 tools/perf/util/hwmon_pmu.c |  8 ++++----
 tools/perf/util/pmu.c       |  9 ++++-----
 tools/perf/util/pmus.c      | 16 ++++++++--------
 tools/perf/util/tool_pmu.c  |  2 +-
 4 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/tools/perf/util/hwmon_pmu.c b/tools/perf/util/hwmon_pmu.c
index 3cce77fc8004..6245eeb593c9 100644
--- a/tools/perf/util/hwmon_pmu.c
+++ b/tools/perf/util/hwmon_pmu.c
@@ -170,7 +170,7 @@ bool parse_hwmon_filename(const char *filename,
 	for (size_t i = 0; fn_type[i] != '\0'; i++) {
 		if (fn_type[i] >= '0' && fn_type[i] <= '9') {
 			fn_type[i] = '\0';
-			*number = strtoul(&filename[i], (char **)&fn_item, 10);
+			*number = (int)strtoul(&filename[i], (char **)&fn_item, 10);
 			if (*fn_item == '_')
 				fn_item++;
 			break;
@@ -194,7 +194,7 @@ bool parse_hwmon_filename(const char *filename,
 		return false;
 	}
 
-	*type = elem - &hwmon_type_strs[0];
+	*type = (enum hwmon_type)(elem - &hwmon_type_strs[0]);
 	if (!item)
 		return true;
 
@@ -213,7 +213,7 @@ bool parse_hwmon_filename(const char *filename,
 			 fn_item, filename);
 		return false;
 	}
-	*item = elem - &hwmon_item_strs[0];
+	*item = (enum hwmon_item)(elem - &hwmon_item_strs[0]);
 	return true;
 }
 
@@ -352,7 +352,7 @@ struct perf_pmu *hwmon_pmu__new(struct list_head *pmus, int hwmon_dir, const cha
 		return NULL;
 
 	hwm->hwmon_dir_fd = hwmon_dir;
-	hwm->pmu.type = PERF_PMU_TYPE_HWMON_START + strtoul(sysfs_name + 5, NULL, 10);
+	hwm->pmu.type = PERF_PMU_TYPE_HWMON_START + (int)strtoul(sysfs_name + 5, NULL, 10);
 	if (hwm->pmu.type > PERF_PMU_TYPE_HWMON_END) {
 		pr_err("Unable to encode hwmon type from %s in valid PMU type\n", sysfs_name);
 		goto err_out;
diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index bbb906bb2159..0a3c9e5eb527 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -1310,7 +1310,7 @@ __u64 perf_pmu__format_bits(struct perf_pmu *pmu, const char *name)
 {
 	struct perf_pmu_format *format = pmu_find_format(&pmu->format, name);
 	__u64 bits = 0;
-	int fbit;
+	size_t fbit;
 
 	if (!format)
 		return 0;
@@ -1355,9 +1355,8 @@ static void pmu_format_value(unsigned long *format, __u64 value, __u64 *v,
 
 static __u64 pmu_format_max_value(const unsigned long *format)
 {
-	int w;
+	size_t w = bitmap_weight(format, PERF_PMU_FORMAT_BITS);
 
-	w = bitmap_weight(format, PERF_PMU_FORMAT_BITS);
 	if (!w)
 		return 0;
 	if (w < 64)
@@ -1872,7 +1871,7 @@ int perf_pmu__for_each_format(struct perf_pmu *pmu, void *state, pmu_format_call
 	if (!pmu->is_core)
 		return 0;
 
-	for (size_t i = 0; i < ARRAY_SIZE(terms); i++) {
+	for (int i = 0; i < (int)ARRAY_SIZE(terms); i++) {
 		int config = PERF_PMU_FORMAT_VALUE_CONFIG;
 
 		if (i < PERF_PMU_FORMAT_VALUE_CONFIG_END)
@@ -2329,7 +2328,7 @@ static void perf_pmu__compute_config_masks(struct perf_pmu *pmu)
 		return;
 
 	list_for_each_entry(format, &pmu->format, list)	{
-		unsigned int i;
+		size_t i;
 		__u64 *mask;
 
 		if (format->value >= PERF_PMU_FORMAT_VALUE_CONFIG_END)
diff --git a/tools/perf/util/pmus.c b/tools/perf/util/pmus.c
index b99292de7669..0b9071219376 100644
--- a/tools/perf/util/pmus.c
+++ b/tools/perf/util/pmus.c
@@ -59,7 +59,7 @@ static void pmu_read_sysfs(unsigned int to_read_pmus);
 
 size_t pmu_name_len_no_suffix(const char *str)
 {
-	int orig_len, len;
+	size_t orig_len, len;
 	bool has_hex_digits = false;
 
 	orig_len = len = strlen(str);
@@ -353,7 +353,7 @@ struct perf_pmu *perf_pmus__scan_core(struct perf_pmu *pmu)
 static struct perf_pmu *perf_pmus__scan_skip_duplicates(struct perf_pmu *pmu)
 {
 	bool use_core_pmus = !pmu || pmu->is_core;
-	int last_pmu_name_len = 0;
+	size_t last_pmu_name_len = 0;
 	const char *last_pmu_name = (pmu && pmu->name) ? pmu->name : "";
 
 	if (!pmu) {
@@ -364,7 +364,7 @@ static struct perf_pmu *perf_pmus__scan_skip_duplicates(struct perf_pmu *pmu)
 
 	if (use_core_pmus) {
 		list_for_each_entry_continue(pmu, &core_pmus, list) {
-			int pmu_name_len = pmu_name_len_no_suffix(pmu->name ?: "");
+			size_t pmu_name_len = pmu_name_len_no_suffix(pmu->name ?: "");
 
 			if (last_pmu_name_len == pmu_name_len &&
 			    !strncmp(last_pmu_name, pmu->name ?: "", pmu_name_len))
@@ -376,7 +376,7 @@ static struct perf_pmu *perf_pmus__scan_skip_duplicates(struct perf_pmu *pmu)
 		pmu = list_prepare_entry(pmu, &other_pmus, list);
 	}
 	list_for_each_entry_continue(pmu, &other_pmus, list) {
-		int pmu_name_len = pmu_name_len_no_suffix(pmu->name ?: "");
+		size_t pmu_name_len = pmu_name_len_no_suffix(pmu->name ?: "");
 
 		if (last_pmu_name_len == pmu_name_len &&
 		    !strncmp(last_pmu_name, pmu->name ?: "", pmu_name_len))
@@ -581,7 +581,7 @@ static int build_format_string(void *state, const char *name, int config,
 			       const unsigned long *bits)
 {
 	struct build_format_string_args *args = state;
-	unsigned int num_bits;
+	size_t num_bits;
 	int ret1, ret2 = 0;
 
 	(void)config;
@@ -631,14 +631,14 @@ void perf_pmus__print_raw_pmu_events(const struct print_callbacks *print_cb, voi
 			.long_string = STRBUF_INIT,
 			.num_formats = 0,
 		};
-		int len = pmu_name_len_no_suffix(pmu->name);
+		size_t len = pmu_name_len_no_suffix(pmu->name);
 		const char *desc = "(see 'man perf-list' or 'man perf-record' on how to encode it)";
 
 		if (!pmu->is_core)
 			desc = NULL;
 
-		strbuf_addf(&format_args.short_string, "%.*s/", len, pmu->name);
-		strbuf_addf(&format_args.long_string, "%.*s/", len, pmu->name);
+		strbuf_addf(&format_args.short_string, "%.*s/", (int)len, pmu->name);
+		strbuf_addf(&format_args.long_string, "%.*s/", (int)len, pmu->name);
 		perf_pmu__for_each_format(pmu, &format_args, build_format_string);
 
 		if (format_args.num_formats > 3)
diff --git a/tools/perf/util/tool_pmu.c b/tools/perf/util/tool_pmu.c
index 727a10e3f990..3f9367424440 100644
--- a/tools/perf/util/tool_pmu.c
+++ b/tools/perf/util/tool_pmu.c
@@ -103,7 +103,7 @@ enum tool_pmu_event evsel__tool_event(const struct evsel *evsel)
 
 const char *evsel__tool_pmu_event_name(const struct evsel *evsel)
 {
-	return tool_pmu__event_to_str(evsel->core.attr.config);
+	return tool_pmu__event_to_str((enum tool_pmu_event)evsel->core.attr.config);
 }
 
 static bool read_until_char(struct io *io, char e)
-- 
2.49.0.906.g1f30a19c02-goog

