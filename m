Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9182433A8
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749740079; cv=none; b=JTDlFR9bV1bWX+JMnov08hL2FBi6ww2s6EBspsLPuQU+dIqo40AoBDZ7t7eAGUnZccvlxsMjH78IsqbpBRPDHzZhootwZOJUmDuK/GpWt6NhARG5Zp9gudztbi2M74WT8L4Thni/ncl8Js6BdiMTshM9bXxayBnZ4v/A40wNpLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749740079; c=relaxed/simple;
	bh=qBCMHDmwQJjZxqnvACj2gHQ4jMzZ95B+hSQ4raHiMik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BVR3KW2LD9Dpz1fikIAfpk7S3H7XLPFS/3w6G+F1z1C2HMPNRWDc75ojW8K2PuRxLjceXzo9gdFSNGLkOz/v4AzYkqQ8HjxsIya7F7KNgu2QUkBVwIL8zj6Bl7nL5iIajoaA73nMyo2yRTtNsLXlS6btgcn2ZDZdbMFL6GUAffk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oaMxrsV6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oaMxrsV6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB6EC4CEEA;
	Thu, 12 Jun 2025 14:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749740079;
	bh=qBCMHDmwQJjZxqnvACj2gHQ4jMzZ95B+hSQ4raHiMik=;
	h=Date:From:To:Cc:Subject:From;
	b=oaMxrsV6Mj/YWwf3JxTD1VTOVhLcI65VdVkzfeJuvOYvT04BVmaS8qp8GMhNFyQWB
	 Bat6V8a3v1QzStRXuh5KaNNY1eCqqPSourIgf9a+O4j79AgmStoTlpodHZu5wMYdik
	 yvBfi2rEdF4F1XPPe2bVmhgYsTr48YSfddClAcwcxF/OwvPu7owfe3B25MT2xenmS3
	 HHC5ccczAuJRxTEnnJaYRcwT2K1Mt6o/KBC0ys6XC1hiGLozCQvrOsDVbFWVySna49
	 nbqdy3NTA6XlzRngyIME1rBEJHV2SuX3l//cRpp0k2g5NA3i1y79ytaxkiCW1pbsTM
	 dg/jj1TN4nSIw==
Date: Thu, 12 Jun 2025 11:54:36 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Ian Rogers <irogers@google.com>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	Kan Liang <kan.liang@linux.intel.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Xiaoyao Li <xiaoyao.li@intel.com>, Yan Zhao <yan.y.zhao@intel.com>
Subject: [PATCH 1/1 fyi] tools headers UAPI: Sync kvm header with the kernel
 sources
Message-ID: <aErqLPktXIzGyS-m@x1>
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

  c9c1e20b4c7d60fa ("KVM: x86: Introduce Intel specific quirk KVM_X86_QUIRK_IGNORE_GUEST_PAT")
  012426d6f59cab21 ("KVM: TDX: Finalize VM initialization")
  c846b451d3c5d4ba ("KVM: TDX: Add an ioctl to create initial guest memory")
  488808e682e72bdb ("KVM: x86: Introduce KVM_TDX_GET_CPUID")
  a50f673f25e0ba2b ("KVM: TDX: Do TDX specific vcpu initialization")
  0186dd29a251866d ("KVM: TDX: add ioctl to initialize VM with TDX specific parameters")
  61bb28279623b636 ("KVM: TDX: Get system-wide info about TDX module on initialization")
  b2aaf38ced6905b8 ("KVM: TDX: Add place holder for TDX VM specific mem_enc_op ioctl")

This addresses these perf build warnings:

  Warning: Kernel ABI header differences:
    diff -u tools/arch/x86/include/uapi/asm/kvm.h arch/x86/include/uapi/asm/kvm.h

Please see tools/include/uapi/README for further details.

Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Ian Rogers <irogers@google.com>
Cc: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: James Clark <james.clark@linaro.org>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Kan Liang <kan.liang@linux.intel.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Yan Zhao <yan.y.zhao@intel.com>
Link: https://lore.kernel.org/r/
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/arch/x86/include/uapi/asm/kvm.h | 71 +++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/tools/arch/x86/include/uapi/asm/kvm.h b/tools/arch/x86/include/uapi/asm/kvm.h
index b663d916f162df4c..6f3499507c5efb56 100644
--- a/tools/arch/x86/include/uapi/asm/kvm.h
+++ b/tools/arch/x86/include/uapi/asm/kvm.h
@@ -441,6 +441,7 @@ struct kvm_sync_regs {
 #define KVM_X86_QUIRK_MWAIT_NEVER_UD_FAULTS	(1 << 6)
 #define KVM_X86_QUIRK_SLOT_ZAP_ALL		(1 << 7)
 #define KVM_X86_QUIRK_STUFF_FEATURE_MSRS	(1 << 8)
+#define KVM_X86_QUIRK_IGNORE_GUEST_PAT		(1 << 9)
 
 #define KVM_STATE_NESTED_FORMAT_VMX	0
 #define KVM_STATE_NESTED_FORMAT_SVM	1
@@ -931,4 +932,74 @@ struct kvm_hyperv_eventfd {
 #define KVM_X86_SNP_VM		4
 #define KVM_X86_TDX_VM		5
 
+/* Trust Domain eXtension sub-ioctl() commands. */
+enum kvm_tdx_cmd_id {
+	KVM_TDX_CAPABILITIES = 0,
+	KVM_TDX_INIT_VM,
+	KVM_TDX_INIT_VCPU,
+	KVM_TDX_INIT_MEM_REGION,
+	KVM_TDX_FINALIZE_VM,
+	KVM_TDX_GET_CPUID,
+
+	KVM_TDX_CMD_NR_MAX,
+};
+
+struct kvm_tdx_cmd {
+	/* enum kvm_tdx_cmd_id */
+	__u32 id;
+	/* flags for sub-commend. If sub-command doesn't use this, set zero. */
+	__u32 flags;
+	/*
+	 * data for each sub-command. An immediate or a pointer to the actual
+	 * data in process virtual address.  If sub-command doesn't use it,
+	 * set zero.
+	 */
+	__u64 data;
+	/*
+	 * Auxiliary error code.  The sub-command may return TDX SEAMCALL
+	 * status code in addition to -Exxx.
+	 */
+	__u64 hw_error;
+};
+
+struct kvm_tdx_capabilities {
+	__u64 supported_attrs;
+	__u64 supported_xfam;
+	__u64 reserved[254];
+
+	/* Configurable CPUID bits for userspace */
+	struct kvm_cpuid2 cpuid;
+};
+
+struct kvm_tdx_init_vm {
+	__u64 attributes;
+	__u64 xfam;
+	__u64 mrconfigid[6];	/* sha384 digest */
+	__u64 mrowner[6];	/* sha384 digest */
+	__u64 mrownerconfig[6];	/* sha384 digest */
+
+	/* The total space for TD_PARAMS before the CPUIDs is 256 bytes */
+	__u64 reserved[12];
+
+	/*
+	 * Call KVM_TDX_INIT_VM before vcpu creation, thus before
+	 * KVM_SET_CPUID2.
+	 * This configuration supersedes KVM_SET_CPUID2s for VCPUs because the
+	 * TDX module directly virtualizes those CPUIDs without VMM.  The user
+	 * space VMM, e.g. qemu, should make KVM_SET_CPUID2 consistent with
+	 * those values.  If it doesn't, KVM may have wrong idea of vCPUIDs of
+	 * the guest, and KVM may wrongly emulate CPUIDs or MSRs that the TDX
+	 * module doesn't virtualize.
+	 */
+	struct kvm_cpuid2 cpuid;
+};
+
+#define KVM_TDX_MEASURE_MEMORY_REGION   _BITULL(0)
+
+struct kvm_tdx_init_mem_region {
+	__u64 source_addr;
+	__u64 gpa;
+	__u64 nr_pages;
+};
+
 #endif /* _ASM_X86_KVM_H */
-- 
2.49.0

