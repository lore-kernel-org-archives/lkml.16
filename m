Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE80B1F3B98
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 21:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749762703; cv=none; b=Qck+L1DEttDPhpdy9/Uu0shhvDNCKxCmP3A70Jrh98L9O3niQG5kLNaD4DWOB2xD7xDQtDJur60bBuFHwvPKRCiDfdAtmfFmt15DaEdy4AWZtXk3ssaOMZpjt1V1LEB8nOLpE+zrdGGHf4mfoxsnpyAZg0mDWKHMtpHYh0ITtjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749762703; c=relaxed/simple;
	bh=RYhgVuBwkxCCORdcPFri3JdkYY6G+dbGOSc+RXkyBjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ssYKAn/PL172kYtjlB7Q03dEzqoPq+T99TAVz9D0PU2bpafWlgcLLW0S46z5l5M40JkMJKWqrZRRYajHsA7I0IXgEw9iWsYPNqDHsGvnlQqRGdrQ1PGBugWhj/p69WcBnbGBrY4wZ+o7+bLL8kCYyols8GiCamU7Wq97XV3ZAno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vhjy/h4b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vhjy/h4b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 234C6C4CEEA;
	Thu, 12 Jun 2025 21:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749762702;
	bh=RYhgVuBwkxCCORdcPFri3JdkYY6G+dbGOSc+RXkyBjQ=;
	h=Date:From:To:Cc:Subject:From;
	b=Vhjy/h4bNXcQstA8JpwtDec8hIUWHWkCKq+QHH0F42PfwL0hEB6gqNDpXnS32kogM
	 kN0iHaj+9+7Byw+yobOCKOdGy+B73LRg01ipk+AvP1KIuElp805e+rzjPZZJeFMz6e
	 pVk8/g0aKJqqEmXuBvmLYYHfILH8hkEK77nVVDa2O0jrlzsBXwl2BCMyNdG0ePKLoE
	 ks7j4/R0tHtPzpoGDTRLrr+OwaA/Ai/PgLeplh41WhmQynyhlTE4+Gon4wtNfd7tKt
	 uacqfx+W1xpFs1TB6xsBv37Bi5rRWOVD2BOc9BMCAEV4gxBLePCzK//JaLgNCYJzEC
	 TSOONku/Jc6Sg==
Date: Thu, 12 Jun 2025 18:11:39 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Ian Rogers <irogers@google.com>, Ingo Molnar <mingo@kernel.org>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	Kan Liang <kan.liang@linux.intel.com>
Subject: [PATCH 1/1 fyi] tools arch amd ibs: Sync ibs.h with the kernel
 sources
Message-ID: <aEtCi0pup5FEwnzn@x1>
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

To pick up the changes from:

  861c6b1185fbb2e3 ("x86/platform/amd: Add standard header guards to <asm/amd/ibs.h>")

That don't result in any changes in the tools, just address this perf
build warning:

Warning: Kernel ABI header differences:
  diff -u tools/arch/x86/include/asm/amd/ibs.h arch/x86/include/asm/amd/ibs.h

Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Ian Rogers <irogers@google.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: James Clark <james.clark@linaro.org>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Kan Liang <kan.liang@linux.intel.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Link: https://lore.kernel.org/r/
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/arch/x86/include/asm/amd/ibs.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/arch/x86/include/asm/amd/ibs.h b/tools/arch/x86/include/asm/amd/ibs.h
index 300b6e0765b2e1e2..3ee5903982c287c8 100644
--- a/tools/arch/x86/include/asm/amd/ibs.h
+++ b/tools/arch/x86/include/asm/amd/ibs.h
@@ -1,10 +1,13 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_X86_AMD_IBS_H
+#define _ASM_X86_AMD_IBS_H
+
 /*
  * From PPR Vol 1 for AMD Family 19h Model 01h B1
  * 55898 Rev 0.35 - Feb 5, 2021
  */
 
-#include "../msr-index.h"
+#include <asm/msr-index.h>
 
 /* IBS_OP_DATA2 DataSrc */
 #define IBS_DATA_SRC_LOC_CACHE			 2
@@ -151,3 +154,5 @@ struct perf_ibs_data {
 	};
 	u64		regs[MSR_AMD64_IBS_REG_COUNT_MAX];
 };
+
+#endif /* _ASM_X86_AMD_IBS_H */
-- 
2.49.0

