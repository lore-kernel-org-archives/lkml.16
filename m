Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3332722AE4E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 23:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744931302; cv=none; b=dbXkQf+TWkUJ20b70w3lux3y9Yh/3JPSdLBJouqf8THjZwQmPWW4eWFsn2zYxmMYMllcHvcyY0H0/hrOuDTR8wqTFD7vn2v7GSI8mZk1YXvH8QkX5ZfwKk/nLOtFDNcI4n3wpQ91FOsRVGpFHX8QW/FP8o1nJ0vkZQPNVZh/WFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744931302; c=relaxed/simple;
	bh=r/o/FTdC44ei+b0RvMj4m3YZsDqShIjlMhUtWnKQGP0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=ABAXEC2IOnzr8j6I7HapbHzBfGT3LzngMJS1VTQlqAJv87KTWgus/9Z1xLS5yxeoWDIAvp/v4mc1O4ou9rGQCpDz2S69f4PfKhzgIlpJgp6fhsI2WN+YDHegrDeTdFXsiFj38PZNDYyZAjJzwG+xAhteB8NY3INOFXaPOgFMNts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j1r67Gc1; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j1r67Gc1"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3086107d023so1287667a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 16:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744931299; x=1745536099; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EHDpsk8SNrUR44AfS89J23CqH741UDdp/AyDnz+ulKM=;
        b=j1r67Gc1Jzt+ERQ5lTOFPuYRllOZJgSLfD97cO7RV6tCEqj8ZFoQhHYdmqSB8GvaU6
         SawuumxS1mlhaYIRowIrRNjsRuRCceNmGP9CXQ/+cDDq5O8kqOSqzd5/eUJOrwl8C445
         4drKxsGvlenA4I1TV+DoEWEelmqafEZiSG3n7763ZNAPt4kNcLPyLaPADe//jIQlVj6o
         VLFSW2LfVfq75mdyvE9nxgDO8r5VAXGKMMtDD1P4eUcxXXRCA/BP+TKc8+Rwnhzm1WfS
         Ut62JPwQifTd4HHE8EdEX0t9ZGM0jXqDqwHltgg2CAMSuReJDfuQoJmVxykYbTUJZxvS
         Ag6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744931299; x=1745536099;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EHDpsk8SNrUR44AfS89J23CqH741UDdp/AyDnz+ulKM=;
        b=PvA783diDSrugnSgRtQPwU9RnNJfKzkCwqjEQ4uyYw5p4UY9izDKIuAn7pdOcMwMri
         xBfEWaeQI+0K0uVDqtlGIKDJW5828RbwSA6mNJfdEL2gp/4kUeotnKi/JuKSqkzxPNYS
         /LPfrldBkdmrIHKqsADGWBGXzeA6G8t7bIC6vIr+X1xCX5MnEfSTKuZPeFVGEHAI1DfL
         ZnasawUHzjebwVmWgiDCCPhMYuICB3PU0jZ3zwHOFxzHJ976VU3ccuSECuDGHpA2pV//
         HkUiiklGw+zmuEakkkwOuaFYxmo4/i4uSFdhUnqUwvqnC68K9si0SSsDzw94II9JMA7J
         x3kg==
X-Forwarded-Encrypted: i=1; AJvYcCVVo5lAZZ3PvYwlX7tlHHJm5jsmo0Y6PefeVnth/0OBTy61W+YsYSvYrwq2DjF+21u+oayBPhavNkUXEWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBo8eilWDnGXc11HECrYsLTe6GMgn95rV+xqeDFD9rApvxU+ho
	GvhkoL8S3VAxxjwoNWczumIBAq0ku0lbpJFxAQ0Y3iy6uJSyau9G/NS4xnL1okGMSuKAPYM2tpd
	mLTYqvQ==
X-Google-Smtp-Source: AGHT+IFYwuA7D18/EJ4yrdKqcla6KAmqMKe4gcSykzoeeKn1WlVOiGHm924Np2e3rbawCT909KQILgiK9qYN
X-Received: from pjx16.prod.google.com ([2002:a17:90b:5690:b0:2ff:852c:ceb8])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3b8d:b0:2ee:aed2:c15c
 with SMTP id 98e67ed59e1d1-3087bbaeb98mr890482a91.28.1744931299447; Thu, 17
 Apr 2025 16:08:19 -0700 (PDT)
Date: Thu, 17 Apr 2025 16:07:33 -0700
In-Reply-To: <20250417230740.86048-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250417230740.86048-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250417230740.86048-13-irogers@google.com>
Subject: [PATCH v4 12/19] perf dso: Clean up read_symbol error handling
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Aditya Gupta <adityag@linux.ibm.com>, 
	"Steinar H. Gunderson" <sesse@google.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Changbin Du <changbin.du@huawei.com>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
	James Clark <james.clark@linaro.org>, Kajol Jain <kjain@linux.ibm.com>, 
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Li Huafei <lihuafei1@huawei.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andi Kleen <ak@linux.intel.com>, 
	Chaitanya S Prakash <chaitanyas.prakash@arm.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, 
	Song Liu <song@kernel.org>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Ensure errno is set and return to caller for error handling. Unusually
for perf the value isn't negated as expected by
symbol__strerror_disassemble.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/capstone.c |  3 ++-
 tools/perf/util/dso.c      | 14 ++++++++++++--
 tools/perf/util/llvm.c     |  3 ++-
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/tools/perf/util/capstone.c b/tools/perf/util/capstone.c
index f103988184c8..032548828925 100644
--- a/tools/perf/util/capstone.c
+++ b/tools/perf/util/capstone.c
@@ -12,6 +12,7 @@
 #include "symbol.h"
 #include "thread.h"
 #include <dlfcn.h>
+#include <errno.h>
 #include <fcntl.h>
 #include <inttypes.h>
 #include <string.h>
@@ -463,7 +464,7 @@ int symbol__disassemble_capstone(const char *filename __maybe_unused,
 	buf = dso__read_symbol(dso, filename, map, sym,
 			       &code_buf, &buf_len, &is_64bit);
 	if (buf == NULL)
-		return -1;
+		return errno;
 
 	/* add the function address and name */
 	scnprintf(disasm_buf, sizeof(disasm_buf), "%#"PRIx64" <%s>:",
diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index d08e2a1f49c1..243fc33cc449 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -1809,6 +1809,7 @@ const u8 *dso__read_symbol(struct dso *dso, const char *symfs_filename,
 
 	if (dso__binary_type(dso) == DSO_BINARY_TYPE__BPF_IMAGE) {
 		pr_debug("No BPF image disassembly support\n");
+		errno = EOPNOTSUPP;
 		return NULL;
 	} else if (dso__binary_type(dso) == DSO_BINARY_TYPE__BPF_PROG_INFO) {
 #ifdef HAVE_LIBBPF_SUPPORT
@@ -1827,6 +1828,7 @@ const u8 *dso__read_symbol(struct dso *dso, const char *symfs_filename,
 		assert(len <= info_linear->info.jited_prog_len);
 #else
 		pr_debug("No BPF program disassembly support\n");
+		errno = EOPNOTSUPP;
 		return NULL;
 #endif
 	} else {
@@ -1837,26 +1839,34 @@ const u8 *dso__read_symbol(struct dso *dso, const char *symfs_filename,
 			.ip = start,
 		};
 		u8 *code_buf = NULL;
+		int saved_errno;
 
 		nsinfo__mountns_enter(dso__nsinfo(dso), &nsc);
 		fd = open(symfs_filename, O_RDONLY);
+		saved_errno = errno;
 		nsinfo__mountns_exit(&nsc);
-		if (fd < 0)
+		if (fd < 0) {
+			errno = saved_errno;
 			return NULL;
+		}
 
-		if (file__read_maps(fd, /*exe=*/true, find_file_offset, &data, is_64bit) == 0) {
+		if (file__read_maps(fd, /*exe=*/true, find_file_offset, &data, is_64bit) <= 0) {
 			close(fd);
+			errno = ENOENT;
 			return NULL;
 		}
 		buf = code_buf = malloc(len);
 		if (buf == NULL) {
 			close(fd);
+			errno = ENOMEM;
 			return NULL;
 		}
 		count = pread(fd, code_buf, len, data.offset);
+		saved_errno = errno;
 		close(fd);
 		if ((u64)count != len) {
 			free(code_buf);
+			errno = saved_errno;
 			return NULL;
 		}
 		*out_buf = code_buf;
diff --git a/tools/perf/util/llvm.c b/tools/perf/util/llvm.c
index a28f130c8951..1607364ee736 100644
--- a/tools/perf/util/llvm.c
+++ b/tools/perf/util/llvm.c
@@ -9,6 +9,7 @@
 #include "srcline.h"
 #include "symbol.h"
 #include <dlfcn.h>
+#include <errno.h>
 #include <fcntl.h>
 #include <inttypes.h>
 #include <unistd.h>
@@ -365,7 +366,7 @@ int symbol__disassemble_llvm(const char *filename, struct symbol *sym,
 	buf = dso__read_symbol(dso, filename, map, sym,
 			       &code_buf, &buf_len, &is_64bit);
 	if (buf == NULL)
-		return -1;
+		return errno;
 
 	init_llvm();
 	if (arch__is(args->arch, "x86")) {
-- 
2.49.0.805.g082f7c87e0-goog

