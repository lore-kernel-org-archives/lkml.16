Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F1D2750E2
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749741140; cv=none; b=rvdrd9zw2VRBt2v/l8T8eIgahLGIODOeoMxps2L7MvFC9mq1TqsjcDFdq5OA0MAsZ/JSbrklKaLgfSX2SONlSvh2OvbZUlSkzhWf6v3gqHe6fAPe/gjH4s4ufnCp18ZxFfNB7viPAhwoohNOWf9lmrgnxrj1EAMuM1A+2+sTbro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749741140; c=relaxed/simple;
	bh=gVpZmMQgKJtYfrWM/e7aYAP6uUksRo42yTWl/e04428=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DocXeTwCIcu3Pt/chUN3zu5CouFAMc0ktA3VjjHEbsBHbsyt8YpPecFTGKC3SnSn9OK+hP1IjEh30q76QLAls7NQllqOseM7UdqKD37akBkOxcZcMsu85VW3QA5KVQ8zZV75Ozcb8KQHvDEi3on37KiTnwWxFly9fpPqgh/CXaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TCdBjcaZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TCdBjcaZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C364C4CEEA;
	Thu, 12 Jun 2025 15:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749741140;
	bh=gVpZmMQgKJtYfrWM/e7aYAP6uUksRo42yTWl/e04428=;
	h=Date:From:To:Cc:Subject:From;
	b=TCdBjcaZgU4Dqp79jfBcf34hF6oJp1CWHlivB/UPCYomLABnBGjr/ri3H4YIJh3+2
	 fcjeJIVPi0jASxZztu+3iL5f2dyz9G4KOZY57Pvehg2+ZgZDWT/tFbpeSAbeKwk+VV
	 8J6jlZ29pFb2i4XGbbfA1X7nIWHlBe+araV9oKKplbooLB5GDpWPHsyVicEUrcK7dg
	 eIH4KMgyMQeC1Ijde+vVwnVOo1nXjlPZxwH4w9owAth+mm+NgL1d4ddYxXtSmAoOzE
	 n/dm1XceeWA09w2OKn1Rnbe/+JJmkNYCj9co/zr6m+XeWR5Rm/5R/7UJNqkRGwFn9m
	 FNWf+v7xprNeg==
Date: Thu, 12 Jun 2025 12:12:17 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Anup Patel <anup@brainfault.org>,
	Binbin Wu <binbin.wu@linux.intel.com>,
	Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	Kan Liang <kan.liang@linux.intel.com>,
	Marc Zyngier <maz@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Subject: [PATCH 1/1 fyi] tools headers UAPI: Sync linux/kvm.h with the kernel
 sources
Message-ID: <aEruUUJvR0bfCg7_@x1>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tldr; Just FYI, I'm carrying this on the perf tools tree.

Full explanation:

There used to be no copies, with tools/ code using kernel headers
directly. From time to time tools/perf/ broke due to legitimate kernel
hacking. At some point Linus complained about such direct usage. Then we
adopted the current model.

See further details at:

 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/include/uapi/README

To pick the changes in:

  5b9db9c16f428ada ("RISC-V: KVM: add KVM_CAP_RISCV_MP_STATE_RESET")
  a7484c80e5ca1ae0 ("KVM: arm64: Allow userspace to request KVM_ARM_VCPU_EL2*")
  79462faa2b2aa89d ("KVM: TDX: Handle TDG.VP.VMCALL<ReportFatalError>")

That just rebuilds perf, as these patches don't add any new KVM ioctl to
be harvested for the the 'perf trace' ioctl syscall argument
beautifiers.

This addresses this perf build warning:

  Warning: Kernel ABI header differences:
    diff -u tools/include/uapi/linux/kvm.h include/uapi/linux/kvm.h

Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Anup Patel <anup@brainfault.org>
Cc: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Ian Rogers <irogers@google.com>
Cc: James Clark <james.clark@linaro.org>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Kan Liang <kan.liang@linux.intel.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Radim Krčmář <rkrcmar@ventanamicro.com>
Link: https://lore.kernel.org/r/
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/include/uapi/linux/kvm.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/include/uapi/linux/kvm.h b/tools/include/uapi/linux/kvm.h
index b6ae8ad8934b52c7..d00b85cb168c30f7 100644
--- a/tools/include/uapi/linux/kvm.h
+++ b/tools/include/uapi/linux/kvm.h
@@ -375,6 +375,7 @@ struct kvm_run {
 #define KVM_SYSTEM_EVENT_WAKEUP         4
 #define KVM_SYSTEM_EVENT_SUSPEND        5
 #define KVM_SYSTEM_EVENT_SEV_TERM       6
+#define KVM_SYSTEM_EVENT_TDX_FATAL      7
 			__u32 type;
 			__u32 ndata;
 			union {
@@ -930,6 +931,9 @@ struct kvm_enable_cap {
 #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
 #define KVM_CAP_X86_GUEST_MODE 238
 #define KVM_CAP_ARM_WRITABLE_IMP_ID_REGS 239
+#define KVM_CAP_ARM_EL2 240
+#define KVM_CAP_ARM_EL2_E2H0 241
+#define KVM_CAP_RISCV_MP_STATE_RESET 242
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
-- 
2.49.0

