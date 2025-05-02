Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6099622F164
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 09:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746177679; cv=none; b=mayAhsAiunGAIFiUAAskpukUvix+CIpiMdLbEbYJVKpshHyQosHkQ4MHHAGkcL8Bmtg78kKnZgwlLCmSNmDUw6OLYMdriVxKioT/42lN/RM1B47IgMO4XaK9mXzHlr4DXWO9AWGZJzkiNCclYVP5tLCs50QRHRWgTLSoUKunwK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746177679; c=relaxed/simple;
	bh=x3YslSjU5tvUmUt5iGgoju+7VYZR8TyTUN0NvDyd0EU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gx0xav3CRKXqYcK72ZWjBtJNKNrtCC9N8QzpJ1U2S+aBCVdNLN8XD6/QkV+WmvtNUMDf61k2eHR5BVhJDXS9gSjbz3IyRaUz5wUEhNLAgLTspMztly6W23bmyXziP5bGkh/4+kZttn7jPkPQ9U3z/JTb2cxEkaUuvkfs3S9Kuxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=immunant.com; spf=none smtp.mailfrom=immunant.com; dkim=pass (2048-bit key) header.d=immunant-com.20230601.gappssmtp.com header.i=@immunant-com.20230601.gappssmtp.com header.b=VjJ4oWQN; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=immunant.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=immunant.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=immunant-com.20230601.gappssmtp.com header.i=@immunant-com.20230601.gappssmtp.com header.b="VjJ4oWQN"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e7329792c6eso1541287276.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 02:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immunant-com.20230601.gappssmtp.com; s=20230601; t=1746177676; x=1746782476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXTVqSuS6Nru86md+gL/FG45+whJF/sIYExDwh5sAUg=;
        b=VjJ4oWQN8YnS4Lc6nAZRI2HZrvfH4TbnW4kEbE6nujKKlspqKUdAJOj2rdXDvfi7wr
         n2uRr5dOm6TEY/YzetZbx7KhdRpxNlOmdZL6ZPxf1yoQCYoM6d5NHJ5bj5MtAooRoHfn
         x//K1XCrrc4xFulE4rdjqT+oErRihu2B6UfgpQOf9qsA0eHX6WUofnbhoZLgisAF1YHw
         oYGHZNCtlt5z8229P1eRlzNhQtWhVDx5L+PzVuLcCiocLYJhWBm3Udax1MhgJkuyzAHz
         mCvonFrmgSCAMBpzeSyj1KYyCza4v1nFdfhIoxAhVGsqzCEX/1n07OXp5bRIL4FozKnP
         gKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746177676; x=1746782476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXTVqSuS6Nru86md+gL/FG45+whJF/sIYExDwh5sAUg=;
        b=sZsCCqc7wMLTwQMDqLlhIvBdFyVAWszGilV6zZcOA78GTPbq3O5+6BpJHvtJ0cV3s/
         IM1pINRKCPPsk0ohyh5UsaTas94Hu1SRL1MNLsSMWrDNVhsC9Zac5jKVNSRoelu6thrb
         XcThLTOoT6WiGc4DRna+jZ11maz9ZtDd1PBrhCuaEcVJhmySMJEIgxjvdAwmsfea09r2
         GE+TMgNPRvKMpF3s8+tj5lNtDSB/90dA6u0kD9G/fxKZWfNw/OvNI8eGXUH6z+dEBcx8
         16uyEs3zT9Vm6pbJSW68gecC0oa4LgFgjHmwQTLLMDtHdYd7eovYTe1Vh1Y6DrW17Bx4
         5KuA==
X-Gm-Message-State: AOJu0Yzf40Y0KNQfKWzbAPp9FpU1rdSlV1jM1VpGGa/b5Jrwu4sy+sPp
	qkrfBlY0QavuFWRpC8uoCdNEysJ08UDGhwRkRc1yweKL+vwtbnoBkSUZ3an3II0XqZUpRWo3T5x
	ixtk=
X-Gm-Gg: ASbGncuiJl4PZeD+lklSHwBgO6uPz1BqoENTty+hW1+9gGs+nnG9wJ8x6PKudZm1tQB
	NxQ4MYr2ioCujYXtR7fGV2mq+XqMMZDovDjHIGNdin4u7wT6gc4xSH0zafINrqn1+9/ZCgYwAgL
	1QL2zfkbEPv46CQgEPaeyXqlvg8YO4sfaS94EUf0tEaXMhrRlMGZZ213/tX6TxwEZ1e2XBJJ77s
	hvLl47IpOSm9E1Lfb3RlUht78Z8uwFlJkFKRCZ1Np/+Pa0Ax0olAoKv8TAv36uD5iojip9vD7v1
	jXAqgcVdwbyIrvGn+wW4tlATPRPj1XmIa2r/7hS6C77eZTHbMAU9
X-Google-Smtp-Source: AGHT+IGmUl1GdZxfwSb42zKFXUWo6QU+Vhl5qRPmA2BrlGjiHY8SxNw5HgzfPvnfGkzAQOdEnTenqg==
X-Received: by 2002:a05:6902:240c:b0:e75:608f:4da9 with SMTP id 3f1490d57ef6-e756562a337mr2991253276.44.1746177676023;
        Fri, 02 May 2025 02:21:16 -0700 (PDT)
Received: from donna.immunant.com ([12.9.190.3])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e755e7d92d0sm556427276.55.2025.05.02.02.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 02:21:15 -0700 (PDT)
From: Per Larsen <perl@immunant.com>
To: linux-kernel@vger.kernel.org
Cc: sebastianene@google.com,
	catalin.marinas@arm.com,
	james.morse@arm.com,
	jean-philippe@linaro.org,
	kernel-team@android.com,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	lpieralisi@kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	qperret@google.com,
	qwandor@google.com,
	sudeep.holla@arm.com,
	suzuki.poulose@arm.com,
	tabba@google.com,
	will@kernel.org,
	yuzenghui@huawei.com,
	armellel@google.com,
	arve@android.com,
	ahomescu@google.com,
	Per Larsen <perlarsen@google.com>,
	Ayrton Munoz <ayrton@google.com>,
	Per Larsen <perl@immunant.com>
Subject: [PATCH 2/3] KVM: arm64: Bump the supported version of FF-A to 1.2
Date: Fri,  2 May 2025 02:21:07 -0700
Message-ID: <20250502092108.3224341-3-perl@immunant.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502092108.3224341-1-perl@immunant.com>
References: <20250502092108.3224341-1-perl@immunant.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Per Larsen <perlarsen@google.com>

FF-A version 1.2 introduces the DIRECT_REQ2 ABI. Bump the FF-A version
preferred by the hypervisor as a precursor to implementing the 1.2-only
FFA_MSG_SEND_DIRECT_REQ2 and FFA_MSG_SEND_RESP2 messaging interfaces.

We must also use SMCCC 1.2 for 64-bit SMCs if hypervisor negotiated FF-A
1.2, so ffa_set_retval is updated and a new function to call 64-bit smcs
using SMCCC 1.2 with fallback to SMCCC 1.1 is introduced.

Update deny-list in ffa_call_supported to mark FFA_NOTIFICATION_* and
interfaces added in FF-A 1.2 as unsupported lest they get forwarded.

Co-Developed-by: Ayrton Munoz <ayrton@google.com>
Signed-off-by: Per Larsen <perlarsen@google.com>
Signed-off-by: Per Larsen <perl@immunant.com>
---
 arch/arm64/kvm/hyp/nvhe/Makefile |   1 +
 arch/arm64/kvm/hyp/nvhe/ffa.c    | 109 ++++++++++++++++++++++++++-----
 2 files changed, 94 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index b43426a493df..95404ff16dac 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -27,6 +27,7 @@ hyp-obj-y := timer-sr.o sysreg-sr.o debug-sr.o switch.o tlb.o hyp-init.o host.o
 	 cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o
 hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
 	 ../fpsimd.o ../hyp-entry.o ../exception.o ../pgtable.o
+hyp-obj-y += ../../../kernel/smccc-call.o
 hyp-obj-$(CONFIG_LIST_HARDENED) += list_debug.o
 hyp-obj-y += $(lib-objs)
 
diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 10e88207b78e..8102dd6a19f7 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -94,13 +94,57 @@ static void ffa_to_smccc_res(struct arm_smccc_res *res, int ret)
 	ffa_to_smccc_res_prop(res, ret, 0);
 }
 
-static void ffa_set_retval(struct kvm_cpu_context *ctxt,
+static void ffa_set_retval(u64 func_id,
+			   struct kvm_cpu_context *ctxt,
 			   struct arm_smccc_res *res)
 {
 	cpu_reg(ctxt, 0) = res->a0;
 	cpu_reg(ctxt, 1) = res->a1;
 	cpu_reg(ctxt, 2) = res->a2;
 	cpu_reg(ctxt, 3) = res->a3;
+
+	/*
+	 * Other result registers must be zero per DEN0077A but SMC32/HVC32 must
+	 * preserve x8-x30 per DEN0028.
+	 */
+	cpu_reg(ctxt, 4) = 0;
+	cpu_reg(ctxt, 5) = 0;
+	cpu_reg(ctxt, 6) = 0;
+	cpu_reg(ctxt, 7) = 0;
+
+	/* Per DEN0077A v1.2, x8-x17 must be zero for SMC64/HVC64 results*/
+	if (ARM_SMCCC_IS_64(func_id) && hyp_ffa_version >= FFA_VERSION_1_2) {
+		cpu_reg(ctxt, 8) = 0;
+		cpu_reg(ctxt, 9) = 0;
+		cpu_reg(ctxt, 10) = 0;
+		cpu_reg(ctxt, 11) = 0;
+		cpu_reg(ctxt, 12) = 0;
+		cpu_reg(ctxt, 13) = 0;
+		cpu_reg(ctxt, 14) = 0;
+		cpu_reg(ctxt, 15) = 0;
+		cpu_reg(ctxt, 16) = 0;
+		cpu_reg(ctxt, 17) = 0;
+	}
+}
+
+/* Call SMC64 using SMCCC 1.2 if hyp negotiated FF-A 1.2 falling back to 1.1 */
+static void arm_smccc_1_2_smc_fallback(u64 func_id, u64 a1, u64 a2, u64 a3,
+				       u64 a4, u64 a5, u64 a6, u64 a7,
+				       struct arm_smccc_res *res)
+{
+	struct arm_smccc_1_2_regs args, regs;
+
+	/* SMC64 only as SMC32 must preserve x8-x30 per DEN0028 1.6G Sec 2.6 */
+	if (ARM_SMCCC_IS_64(func_id) && hyp_ffa_version >= FFA_VERSION_1_2) {
+		args = (struct arm_smccc_1_2_regs) { func_id, a1, a2, a3, a4,
+						     a5, a6, a7 };
+		arm_smccc_1_2_smc(&args, &regs);
+		*res = (struct arm_smccc_res) { .a0 = regs.a0, .a1 = regs.a1,
+						.a2 = regs.a2, .a3 = regs.a3 };
+		return;
+	}
+
+	arm_smccc_1_1_smc(func_id, a1, a2, a3, a4, a5, a6, a7, res);
 }
 
 static bool is_ffa_call(u64 func_id)
@@ -115,12 +159,12 @@ static int ffa_map_hyp_buffers(u64 ffa_page_count)
 {
 	struct arm_smccc_res res;
 
-	arm_smccc_1_1_smc(FFA_FN64_RXTX_MAP,
-			  hyp_virt_to_phys(hyp_buffers.tx),
-			  hyp_virt_to_phys(hyp_buffers.rx),
-			  ffa_page_count,
-			  0, 0, 0, 0,
-			  &res);
+	arm_smccc_1_2_smc_fallback(FFA_FN64_RXTX_MAP,
+				   hyp_virt_to_phys(hyp_buffers.tx),
+				   hyp_virt_to_phys(hyp_buffers.rx),
+				   ffa_page_count,
+				   0, 0, 0, 0,
+				   &res);
 
 	return res.a0 == FFA_SUCCESS ? FFA_RET_SUCCESS : res.a2;
 }
@@ -174,10 +218,10 @@ static void ffa_mem_reclaim(struct arm_smccc_res *res, u32 handle_lo,
 
 static void ffa_retrieve_req(struct arm_smccc_res *res, u32 len)
 {
-	arm_smccc_1_1_smc(FFA_FN64_MEM_RETRIEVE_REQ,
-			  len, len,
-			  0, 0, 0, 0, 0,
-			  res);
+	arm_smccc_1_2_smc_fallback(FFA_FN64_MEM_RETRIEVE_REQ,
+				   len, len,
+				   0, 0, 0, 0, 0,
+				   res);
 }
 
 static void ffa_rx_release(struct arm_smccc_res *res)
@@ -628,6 +672,37 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_RXTX_MAP:
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
+	/* Optional notification interfaces added in FF-A 1.1 */
+	case FFA_NOTIFICATION_BITMAP_CREATE:
+	case FFA_NOTIFICATION_BITMAP_DESTROY:
+	case FFA_NOTIFICATION_BIND:
+	case FFA_NOTIFICATION_UNBIND:
+	case FFA_NOTIFICATION_SET:
+	case FFA_NOTIFICATION_GET:
+	case FFA_NOTIFICATION_INFO_GET:
+	/* Unimplemented interfaces added in FF-A 1.2 */
+	case FFA_MSG_SEND_DIRECT_REQ2:
+
+	/*
+	 * FFA_MSG_SEND_DIRECT_RESP2 is not meant to be invoked by the host or
+	 * a guest VM because pkvm does not support communication between VMs
+	 * via FF-A. Direct messages can only be sent from a non-secure sender
+	 * endpoint to a secure receiver endpoint. Only receiver endpoints are
+	 * expected to invoke FFA_MSG_SEND_DIRECT_RESP2.
+	 */
+	case FFA_MSG_SEND_DIRECT_RESP2:
+
+	/* Reserved for secure endpoints per DEN0077A 1.2 REL0 Table 13.53. */
+	case FFA_CONSOLE_LOG:
+
+	/*
+	 * Mandatory for secure endpoints per DEN0077A 1.2 REL0 Table 13.1 and
+	 * optional for non-secure endpoints according to Table 13.38.
+	 */
+	case FFA_PARTITION_INFO_GET_REGS:
+
+	/* Reserved for secure endpoints per DEN0077A 1.2 REL0 Table 17.2. */
+	case FFA_EL3_INTR_HANDLE:
 		return false;
 	}
 
@@ -680,7 +755,8 @@ static int hyp_ffa_post_init(void)
 	if (res.a0 != FFA_SUCCESS)
 		return -EOPNOTSUPP;
 
-	switch (res.a2) {
+	/* Bit[0:1] holds minimum buffer size and alignment boundary */
+	switch (res.a2 & 0x3) {
 	case FFA_FEAT_RXTX_MIN_SZ_4K:
 		min_rxtx_sz = SZ_4K;
 		break;
@@ -871,7 +947,7 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 
 	ffa_to_smccc_error(&res, FFA_RET_NOT_SUPPORTED);
 out_handled:
-	ffa_set_retval(host_ctxt, &res);
+	ffa_set_retval(func_id, host_ctxt, &res);
 	return true;
 }
 
@@ -883,7 +959,7 @@ int hyp_ffa_init(void *pages)
 	if (kvm_host_psci_config.smccc_version < ARM_SMCCC_VERSION_1_2)
 		return 0;
 
-	arm_smccc_1_1_smc(FFA_VERSION, FFA_VERSION_1_1, 0, 0, 0, 0, 0, 0, &res);
+	arm_smccc_1_1_smc(FFA_VERSION, FFA_VERSION_1_2, 0, 0, 0, 0, 0, 0, &res);
 	if (res.a0 == FFA_RET_NOT_SUPPORTED)
 		return 0;
 
@@ -903,10 +979,11 @@ int hyp_ffa_init(void *pages)
 	if (FFA_MAJOR_VERSION(res.a0) != 1)
 		return -EOPNOTSUPP;
 
-	if (FFA_MINOR_VERSION(res.a0) < FFA_MINOR_VERSION(FFA_VERSION_1_1))
+	/* See do_ffa_guest_version before bumping maximum supported version. */
+	if (FFA_MINOR_VERSION(res.a0) < FFA_MINOR_VERSION(FFA_VERSION_1_2))
 		hyp_ffa_version = res.a0;
 	else
-		hyp_ffa_version = FFA_VERSION_1_1;
+		hyp_ffa_version = FFA_VERSION_1_2;
 
 	tx = pages;
 	pages += KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE;
-- 
2.49.0

