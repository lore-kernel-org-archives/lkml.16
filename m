Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE35F23C516
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749736594; cv=none; b=THM6fQYfANeY+3eVHxxYQye+oNt0HkyFDsW1JKXy2/RSFBHw8BGgV2eG384gWTinsHalNpXZeGO1s6TrHMfCzA5NTfaHfIT/kpRBN6oyqCDZLwNTDvqXeAwaODSDMqIpHJN5FPdi7xdp6NdRTkbsH9aSUrN4P0fV+lCOd1TUaGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749736594; c=relaxed/simple;
	bh=WxMzIaZy423sDZIpi9KE0Tvfc7JKlMGJWRWMOOxFmHw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nkYo4fHkrcx1pOr8rDUcs4wJz92VPn0oqs38aXVFy8tdzdtc3YzDAnXJbrOmaIe8m4CqurdMHRcPlTlPmcPtcXZtqVt8QWoleAWbQ3RqyUADBy5wx0qvQ67Sba8G7bXK1RI9lpdPEVFhMlGT8TA4e/KAmKishWE2wXwYQqKacmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EGPN1uFs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EGPN1uFs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36678C4CEEA;
	Thu, 12 Jun 2025 13:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749736593;
	bh=WxMzIaZy423sDZIpi9KE0Tvfc7JKlMGJWRWMOOxFmHw=;
	h=Date:From:To:Cc:Subject:From;
	b=EGPN1uFsB7Gp8Gg3O8/87vCP0sU0gTcHSNGSEGA8FSPJ129gA456eN68+UtFJHfNT
	 9J43jIC3Anbm0D6b7cnyxhIxt2raxubu+WMLL+MPH5U8QAhEjwE5dmgc/72Kh3MPPD
	 MPetWzSlSjo53jhTRH2z7ARPEF5nduHLpuo4GAqt4gGi1j/jw01gIF8rUCtcsTG2Fi
	 o+KUTFWZ8QBOSBTP+0GUnQNTXxhiclH5gwYkrK7VlzsquR4xSQL8kHzUWdmNHdpXp7
	 G5OrW1YcMbLxHrM6GKwhXrZt/Oj29Jvz11u2JLS+QwUAuOYfX8n5GGS9m4ZfAFXOq/
	 4Ze3wFmHFL8qQ==
Date: Thu, 12 Jun 2025 10:56:30 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	Kan Liang <kan.liang@linux.intel.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Nikunj A Dadhania <nikunj@amd.com>,
	Sean Christopherson <seanjc@google.com>
Subject: [PATCH 1/1 fyi] tools headers x86 svm: Sync svm headers with the
 kernel sources
Message-ID: <aErcjuTTCVEZ-8Nb@x1>
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

  827547bc3a2a2af6 ("KVM: SVM: Add architectural definitions/assets for Bus Lock Threshold")

That triggers:

  CC      /tmp/build/perf-tools/arch/x86/util/kvm-stat.o
  LD      /tmp/build/perf-tools/arch/x86/util/perf-util-in.o
  LD      /tmp/build/perf-tools/arch/x86/perf-util-in.o
  LD      /tmp/build/perf-tools/arch/perf-util-in.o
  LD      /tmp/build/perf-tools/perf-util-in.o
  AR      /tmp/build/perf-tools/libperf-util.a
  LINK    /tmp/build/perf-tools/perf

The SVM_EXIT_BUS_LOCK exit reason was added to SVM_EXIT_REASONS, used in
kvm-stat.c.

This addresses this perf build warning:

 Warning: Kernel ABI header differences:
  diff -u tools/arch/x86/include/uapi/asm/svm.h arch/x86/include/uapi/asm/svm.h

Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Ian Rogers <irogers@google.com>
Cc: James Clark <james.clark@linaro.org>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Kan Liang <kan.liang@linux.intel.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Nikunj A Dadhania <nikunj@amd.com>
Cc: Sean Christopherson <seanjc@google.com>
Link: https://lore.kernel.org/r/
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/arch/x86/include/uapi/asm/svm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/arch/x86/include/uapi/asm/svm.h b/tools/arch/x86/include/uapi/asm/svm.h
index ec1321248dac2ab5..9c640a521a67006d 100644
--- a/tools/arch/x86/include/uapi/asm/svm.h
+++ b/tools/arch/x86/include/uapi/asm/svm.h
@@ -95,6 +95,7 @@
 #define SVM_EXIT_CR14_WRITE_TRAP		0x09e
 #define SVM_EXIT_CR15_WRITE_TRAP		0x09f
 #define SVM_EXIT_INVPCID       0x0a2
+#define SVM_EXIT_BUS_LOCK			0x0a5
 #define SVM_EXIT_IDLE_HLT      0x0a6
 #define SVM_EXIT_NPF           0x400
 #define SVM_EXIT_AVIC_INCOMPLETE_IPI		0x401
@@ -225,6 +226,7 @@
 	{ SVM_EXIT_CR4_WRITE_TRAP,	"write_cr4_trap" }, \
 	{ SVM_EXIT_CR8_WRITE_TRAP,	"write_cr8_trap" }, \
 	{ SVM_EXIT_INVPCID,     "invpcid" }, \
+	{ SVM_EXIT_BUS_LOCK,     "buslock" }, \
 	{ SVM_EXIT_IDLE_HLT,     "idle-halt" }, \
 	{ SVM_EXIT_NPF,         "npf" }, \
 	{ SVM_EXIT_AVIC_INCOMPLETE_IPI,		"avic_incomplete_ipi" }, \
-- 
2.49.0

