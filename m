Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869432D661B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 20:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749758835; cv=none; b=OIrnvvuSjNZbdjre5p7apH2LzVIBmi473g3h2SScL5p0hoaFc97HWHta+noH3R0oyDvuu1Y+2WA+MYZAfXYNvuI3rFU7ttjLXO7oozsai39tbj8bPIvrh9rtis2KgObXoZvu/eyGAoMVYNllltctiI48BVF1B3sGf+lq58v55zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749758835; c=relaxed/simple;
	bh=MlVnwk4GrJf7DJ+teSMM4MYhbPN4wLp/AfPIQRVr6pI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JLsJIefxx1xN+xCPDPVtX6z5PqSKtXbMXQXVIxQWVrSk3RBflgn29ITPhaLD2YYyhRGukivU5tKysNhRFYIw34dGoTC1jzcTf5COaj8YYU5qEwI72OuIif/ZIu7yrW2xgcycX1AfXPGq1VqqeJ17m5PqKMCepVR+bO0A44cMK7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jBqyeckS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jBqyeckS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C73C4CEEA;
	Thu, 12 Jun 2025 20:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749758835;
	bh=MlVnwk4GrJf7DJ+teSMM4MYhbPN4wLp/AfPIQRVr6pI=;
	h=Date:From:To:Cc:Subject:From;
	b=jBqyeckSlaS0YRvpGwT2pQE0Jc3N7nApDTYYxRNy/YULjhXr7ZhOfnx8fa0Fi0Vy7
	 Ev9NNzlf2i6s8j5J4prkwowmFRmMhX49Rd48pZTiguY/bFW443QpSdgyvtaNq8Ni33
	 sjoR55MpVDao3tWeZih6nU3RcV4zQuUd9SuuGbJ2x4RLY9YlWb+nWZYQwX2g0j8B/j
	 BDSir/QJ3v3BVOAE8fcWfdhAkGUvCdP1/zcwX+LOuxtNKmcP10YBaSzDQyaLhjGQ75
	 hc1nmyajx+3xKtZbC6UBiQBc6wkIQMg5YVSWRTFj2GB1zwbEnC94XLrMoO0I8oGWXH
	 tabwK5zWGb9qw==
Date: Thu, 12 Jun 2025 17:07:11 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	Kan Liang <kan.liang@linux.intel.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Yury Norov <yury.norov@gmail.com>
Subject: [PATCH 1/1 fyi] tools headers: Syncronize linux/build_bug.h with the
 kernel sources
Message-ID: <aEszb7SSIJB6Lp6f@x1>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tldr; Just FYI, I'm carrying this on the perf tools tree.

Full explanation:

There used to be no copies, with tools/ code using kernel headers
directly. From time to time tools/perf/ broke due to legitimate kernel
hacking. At some point Linus complained about such direct usage. Then we
adopted the current model.

See further details at:

 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/include/uapi/README

To pick up the changes in:

  243c90e917f5cfc9 ("build_bug.h: more user friendly error messages in BUILD_BUG_ON_ZERO()")

This also needed to pick the __BUILD_BUG_ON_ZERO_MSG() in
linux/compiler.h, that needed to be polished to avoid hitting old clang
problems with _Static_assert on arrays of structs:

  Debian clang version 11.0.1-2~deb10u1

  Debian clang version 11.0.1-2~deb10u1
  $ make NO_LIBTRACEEVENT=1 ARCH= CROSS_COMPILE= EXTRA_CFLAGS= -C tools/perf O=/tmp/build/perf CC=clang
  <SNIP>
  btf_dump.c:895:18: error: type name does not allow storage class to be specified
          for (i = 0; i < ARRAY_SIZE(pads); i++) {
                          ^
  /git/perf-6.16.0-rc1/tools/include/linux/kernel.h:91:59: note: expanded from macro 'ARRAY_SIZE'
  #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                                            ^
  /git/perf-6.16.0-rc1/tools/include/linux/compiler-gcc.h:26:28: note: expanded from macro '__must_be_array'
  #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
                                  ^
  /git/perf-6.16.0-rc1/tools/include/linux/build_bug.h:17:2: note: expanded from macro 'BUILD_BUG_ON_ZERO'
          __BUILD_BUG_ON_ZERO_MSG(e, ##__VA_ARGS__, #e " is true")
          ^
  /git/perf-6.16.0-rc1/tools/include/linux/compiler.h:248:67: note: expanded from macro '__BUILD_BUG_ON_ZERO_MSG'
  #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
                                                                    ^
  /usr/include/x86_64-linux-gnu/sys/cdefs.h:438:5: note: expanded from macro '_Static_assert'
      extern int (*__Static_assert_function (void)) \
      ^

These also failed:

toolsbuilder@five:~$ grep FAIL dm.log/summary | grep clang
   1    72.87 almalinux:8    : FAIL clang version 19.1.7 ( 19.1.7-2.module_el8.10.0+3990+33d0d926)
  15    73.39 centos:stream  : FAIL clang version 17.0.6 (Red Hat 17.0.6-1.module_el8+767+9fa966b8)
  36    87.14 opensuse:15.4  : FAIL clang version 15.0.7
  37    80.08 opensuse:15.5  : FAIL clang version 15.0.7
  40    72.12 oraclelinux:8  : FAIL clang version 16.0.6 (Red Hat 16.0.6-2.0.1.module+el8.9.0+90129+d3ee8717)
  42    74.12 rockylinux:8   : FAIL clang version 16.0.6 (Red Hat 16.0.6-2.module+el8.9.0+1651+e10a8f6d)
toolsbuilder@five:~$

This addresses this perf build warning:

  Warning: Kernel ABI header differences:
    diff -u tools/include/linux/build_bug.h include/linux/build_bug.h

Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Ian Rogers <irogers@google.com>
Cc: James Clark <james.clark@linaro.org>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Kan Liang <kan.liang@linux.intel.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Yury Norov <yury.norov@gmail.com>
Link: https://lore.kernel.org/r/
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/include/linux/build_bug.h | 10 +++++-----
 tools/include/linux/compiler.h  |  8 ++++++++
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/tools/include/linux/build_bug.h b/tools/include/linux/build_bug.h
index b4898ff085ded5a9..ab2aa97bd8ce441d 100644
--- a/tools/include/linux/build_bug.h
+++ b/tools/include/linux/build_bug.h
@@ -4,17 +4,17 @@
 
 #include <linux/compiler.h>
 
-#ifdef __CHECKER__
-#define BUILD_BUG_ON_ZERO(e) (0)
-#else /* __CHECKER__ */
 /*
  * Force a compilation error if condition is true, but also produce a
  * result (of value 0 and type int), so the expression can be used
  * e.g. in a structure initializer (or where-ever else comma expressions
  * aren't permitted).
+ *
+ * Take an error message as an optional second argument. If omitted,
+ * default to the stringification of the tested expression.
  */
-#define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
-#endif /* __CHECKER__ */
+#define BUILD_BUG_ON_ZERO(e, ...) \
+	__BUILD_BUG_ON_ZERO_MSG(e, ##__VA_ARGS__, #e " is true")
 
 /* Force a compilation error if a constant expression is not a power of 2 */
 #define __BUILD_BUG_ON_NOT_POWER_OF_2(n)	\
diff --git a/tools/include/linux/compiler.h b/tools/include/linux/compiler.h
index d627e66a04a6192e..33411ca0cc90f02b 100644
--- a/tools/include/linux/compiler.h
+++ b/tools/include/linux/compiler.h
@@ -244,6 +244,14 @@ static __always_inline void __write_once_size(volatile void *p, void *res, int s
 	__asm__ ("" : "=r" (var) : "0" (var))
 #endif
 
+#ifndef __BUILD_BUG_ON_ZERO_MSG
+#if defined(__clang__)
+#define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)(sizeof(struct { int:(-!!(e)); })))
+#else
+#define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
+#endif
+#endif
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _TOOLS_LINUX_COMPILER_H */
-- 
2.49.0

