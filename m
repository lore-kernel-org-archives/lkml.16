Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BC4220F2A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749736539; cv=none; b=fl+bGl346jT8GhuAUxjoorRSUU6UJsgRdGMAJ8/cWdE89n4V2Foe60fSD4Z/Q6EDrxSW/55Algf2kBrn6Q7p1AVVfq3u4a7L/j55ZNwqvxvdsQZBabbAzABREmsTZOXL6uMy9RS1azYF/ApZgf8x+Q2dl8Lz23h4kU4tcaB/TZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749736539; c=relaxed/simple;
	bh=VWDpjyEwYWKBY0W4CnF9s+kB7l3/hqfNXUApEh884yE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O5eIqqBjSjVhoeg6AtK6K4RxUqqts+jKxXTjVbwv+QWPatYLJdZmjTmivQAN3LYnYHJfaxgBMCgFuA/I+zwhfxTKs9m2CV6bI5iEFaqI5cGSz7mqlh2WJsdGQHEYpz5dZhpRiCElQOxg39wkbgEwtQA7kuwu11CAZnQvB3ZyjQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A6P1k5gD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A6P1k5gD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79090C4CEEA;
	Thu, 12 Jun 2025 13:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749736537;
	bh=VWDpjyEwYWKBY0W4CnF9s+kB7l3/hqfNXUApEh884yE=;
	h=Date:From:To:Cc:Subject:From;
	b=A6P1k5gD6OGmRjrQMNiRt5KqNiE/VyrZ2vZjkkVb5b+8G02lVxkojsjmCIq0Pqtq+
	 7B+sZxal3GRiVEQzMFe1iq4fg/bzRMrA9uD4Dqxl2ewik03Ucyo+DsyNt8emvLYXvf
	 ACNHH6NxhwDqvdoNJ8c8aBDkHTOsz4htzBPCjWLRAoLzohqD/8BoZ6Qx1HgelRD+LJ
	 SqT7JsB0lnbSb38lD25OgVOvNncFlN6KdbjXZtNhM/oPO0obs6Qj/Tw1/7T4+8kj09
	 los18PjhCiEJ7QB53DlFZhD8WNinXvcsov7qqQJPM/wK5d2XqrNY6ROsOaQfBECy6U
	 OTZMJ8zm+OT5A==
Date: Thu, 12 Jun 2025 10:55:34 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Ian Rogers <irogers@google.com>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	Kan Liang <kan.liang@linux.intel.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 1/1 fyi] tools headers UAPI: Sync KVM's vmx.h header with the
 kernel sources
Message-ID: <aErcVn_4plQyODR1@x1>
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

To pick the changes in:

  6c441e4d6e729616 ("KVM: TDX: Handle EXIT_REASON_OTHER_SMI")
  c42856af8f70d983 ("KVM: TDX: Add a place holder for handler of TDX hypercalls (TDG.VP.VMCALL)")

That makes 'perf kvm-stat' aware of this new TDCALL exit reason, thus
addressing the following perf build warning:

  Warning: Kernel ABI header differences:
    diff -u tools/arch/x86/include/uapi/asm/vmx.h arch/x86/include/uapi/asm/vmx.h

Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Ian Rogers <irogers@google.com>
Cc: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: James Clark <james.clark@linaro.org>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Kan Liang <kan.liang@linux.intel.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Link: https://lore.kernel.org/r/
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/arch/x86/include/uapi/asm/vmx.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/arch/x86/include/uapi/asm/vmx.h b/tools/arch/x86/include/uapi/asm/vmx.h
index a5faf6d88f1bf614..f0f4a4cf84a7244e 100644
--- a/tools/arch/x86/include/uapi/asm/vmx.h
+++ b/tools/arch/x86/include/uapi/asm/vmx.h
@@ -34,6 +34,7 @@
 #define EXIT_REASON_TRIPLE_FAULT        2
 #define EXIT_REASON_INIT_SIGNAL			3
 #define EXIT_REASON_SIPI_SIGNAL         4
+#define EXIT_REASON_OTHER_SMI           6
 
 #define EXIT_REASON_INTERRUPT_WINDOW    7
 #define EXIT_REASON_NMI_WINDOW          8
@@ -92,6 +93,7 @@
 #define EXIT_REASON_TPAUSE              68
 #define EXIT_REASON_BUS_LOCK            74
 #define EXIT_REASON_NOTIFY              75
+#define EXIT_REASON_TDCALL              77
 
 #define VMX_EXIT_REASONS \
 	{ EXIT_REASON_EXCEPTION_NMI,         "EXCEPTION_NMI" }, \
@@ -155,7 +157,8 @@
 	{ EXIT_REASON_UMWAIT,                "UMWAIT" }, \
 	{ EXIT_REASON_TPAUSE,                "TPAUSE" }, \
 	{ EXIT_REASON_BUS_LOCK,              "BUS_LOCK" }, \
-	{ EXIT_REASON_NOTIFY,                "NOTIFY" }
+	{ EXIT_REASON_NOTIFY,                "NOTIFY" }, \
+	{ EXIT_REASON_TDCALL,                "TDCALL" }
 
 #define VMX_EXIT_REASON_FLAGS \
 	{ VMX_EXIT_REASONS_FAILED_VMENTRY,	"FAILED_VMENTRY" }
-- 
2.49.0

