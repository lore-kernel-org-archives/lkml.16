Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890162BF3F9
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749742320; cv=none; b=awsf+kOZg6Ul9NXMsFtEbG0+C0Xg5ulfsdNHoe5TcRZKekhsJQesAhoAgM/TUps4DlcnsZSgDwTIafgrVg5rUluhaBX7xYG9PuYUAdlZnEiCGfmxAlTSCbK/8GPdlrBe/Bmwpkp3o65JAFQXSWqHyo3eu4XldWRd4/6Mu7YsE5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749742320; c=relaxed/simple;
	bh=12r9Jt7Zc49xVa89FPaLynTHzQ9vlngeyga+2amFiRA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YaamKGGTcl2wRLG191o661103wt2S7sNAiad/TPUXGi/4ilBcrg184QDanQjfhkkPPAdR8psb17N7jU4qPqPUtPMGwMqqiH2tnaHheSCgw5Rg30tCKAQo0SRx5UR3ygzPEZa3zLs0JX74xTJDF3xzkUwN4iNKXxxwI/fSqmTayo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sM7AclF2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sM7AclF2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA73C4CEEA;
	Thu, 12 Jun 2025 15:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749742320;
	bh=12r9Jt7Zc49xVa89FPaLynTHzQ9vlngeyga+2amFiRA=;
	h=Date:From:To:Cc:Subject:From;
	b=sM7AclF27rpj4ndYJVSKFJTgFmfZxyIixlQovmhcXEIb/NPScLuiIImX4cJqUEoo6
	 Ugr78XNfNu4shW4AXavqMesY6p7zf9sjAf0uTFQHSpnWQoSqFN6/Yd7kgUQ7xbF44Y
	 /Jozq6SEl5iGK08BEDCpwnFoGiNQaR1QInSlLly6Fxgs9efuZ+ZlrMFkRRpWn+K9Ki
	 0FtXO843gScBhzVlqUE+VSL3AIsDq3VAI7aaCosDbd8sNk0KJ1F/vun7R1ozS05P95
	 btmXvDyR9MMBe+K6GM26hC7snImtg4QduaI2Dol1mE1bAooypOqvQf6rqS503PA8+W
	 R8K4UZU+9aH+g==
Date: Thu, 12 Jun 2025 12:31:56 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>, Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@kernel.org>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	Kan Liang <kan.liang@linux.intel.com>,
	Namhyung Kim <namhyung@kernel.org>
Subject: [PATCH 1/1 fyi] tools headers: Update the copy of x86's
 mem{cpy,set}_64.S used in 'perf bench'
Message-ID: <aEry7L3fibwIG5au@x1>
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

Also add SYM_PIC_ALIAS() to tools/perf/util/include/linux/linkage.h.

This is to get the changes from:

  419cbaf6a56a6e4b ("x86/boot: Add a bunch of PIC aliases")

That addresses these perf tools build warning:

  Warning: Kernel ABI header differences:
    diff -u tools/arch/x86/lib/memcpy_64.S arch/x86/lib/memcpy_64.S
    diff -u tools/arch/x86/lib/memset_64.S arch/x86/lib/memset_64.S

Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Ian Rogers <irogers@google.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: James Clark <james.clark@linaro.org>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Kan Liang <kan.liang@linux.intel.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Link: https://lore.kernel.org/r/
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/arch/x86/lib/memcpy_64.S          | 1 +
 tools/arch/x86/lib/memset_64.S          | 1 +
 tools/perf/util/include/linux/linkage.h | 4 ++++
 3 files changed, 6 insertions(+)

diff --git a/tools/arch/x86/lib/memcpy_64.S b/tools/arch/x86/lib/memcpy_64.S
index 59cf6f9065aa84d8..ccc3d923fc1e0fd4 100644
--- a/tools/arch/x86/lib/memcpy_64.S
+++ b/tools/arch/x86/lib/memcpy_64.S
@@ -40,6 +40,7 @@ SYM_FUNC_END(__memcpy)
 EXPORT_SYMBOL(__memcpy)
 
 SYM_FUNC_ALIAS_MEMFUNC(memcpy, __memcpy)
+SYM_PIC_ALIAS(memcpy)
 EXPORT_SYMBOL(memcpy)
 
 SYM_FUNC_START_LOCAL(memcpy_orig)
diff --git a/tools/arch/x86/lib/memset_64.S b/tools/arch/x86/lib/memset_64.S
index d66b710d628f8865..fb5a03cf5ab7e5e4 100644
--- a/tools/arch/x86/lib/memset_64.S
+++ b/tools/arch/x86/lib/memset_64.S
@@ -42,6 +42,7 @@ SYM_FUNC_END(__memset)
 EXPORT_SYMBOL(__memset)
 
 SYM_FUNC_ALIAS_MEMFUNC(memset, __memset)
+SYM_PIC_ALIAS(memset)
 EXPORT_SYMBOL(memset)
 
 SYM_FUNC_START_LOCAL(memset_orig)
diff --git a/tools/perf/util/include/linux/linkage.h b/tools/perf/util/include/linux/linkage.h
index 178b00205fe6a7b2..89979ca23c3f1cfb 100644
--- a/tools/perf/util/include/linux/linkage.h
+++ b/tools/perf/util/include/linux/linkage.h
@@ -132,4 +132,8 @@
         SYM_TYPED_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)
 #endif
 
+#ifndef SYM_PIC_ALIAS
+#define SYM_PIC_ALIAS(sym)	SYM_ALIAS(__pi_ ## sym, sym, SYM_T_FUNC, SYM_L_GLOBAL)
+#endif
+
 #endif	/* PERF_LINUX_LINKAGE_H_ */
-- 
2.49.0

