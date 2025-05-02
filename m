Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1247517A31B
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 03:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746158070; cv=none; b=k8+iqzw6VkjH/QzWpLMALft4T3GXaaZA8sbLXTI6NZZ1pbjCpFCmVzx8ALNS5UHMVAQfUdftSjy3unrUhdN3ZOrNyUoSFK5f640qFfnUyfc08NCjLNH8Z6waocWXjvGX+z3bbp4KT7IJvi0fgcSgYHrTQYrr3l+9RtGhkx1cXyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746158070; c=relaxed/simple;
	bh=D0goL705369gnd2SNiU0BR8Dl5RBlSwNtMK8ZLn5FB8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=MXLFUrYl8PfBO09G0QJRK3ZypUXZWtbSlFcMuxS+/7rJ2zSFSoMN9v6cVyF9cGGvxPyQ8OnknQedFzGDvycOLC8FbDkQTszOozZ3ASEcSBtv9GtmQzFotBSWHZOgtznpQxvis6RedTkcQtohxq1L8ZCloGX6pUYdnSdsHws2qik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=immunant.com; spf=none smtp.mailfrom=immunant.com; dkim=pass (2048-bit key) header.d=immunant-com.20230601.gappssmtp.com header.i=@immunant-com.20230601.gappssmtp.com header.b=snkzmEHP; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=immunant.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=immunant.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=immunant-com.20230601.gappssmtp.com header.i=@immunant-com.20230601.gappssmtp.com header.b="snkzmEHP"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6060a70ba80so848565eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 20:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immunant-com.20230601.gappssmtp.com; s=20230601; t=1746158068; x=1746762868; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IPH5x3OkyPZV5JxMQZ1zGZ5oaQgdw1gt8lYnvIM/Z/8=;
        b=snkzmEHPKnT+5mVz60oLucsMWE1Kw8IICCAd5JixyKb0vWX13kbq+dIg6aDjsZ/ncX
         llr1u3wIcrAqD91SE8CRCaZFUYZHzmhAy2dqP4pZVMnlCbjlZcU+UzxZpZB/kkKv4e6u
         Ro2h6/quwKzrSFQ/jX4dQ0A+q92yGil5rPGaZlD5GPEFuFi3lWVRw9+WFtV0C2DC2lJo
         6SLJnL7UHthyNQs2lbjfualS6N0vxfwMW+DX9jGKaCsSLzUEk0eGpof8s+As9YG+DP5b
         Ui+cLZPqEU/gM1R438CFYNFs19DoT96u8HCtnOooKxjaudAXd/27kjDcfjyCwQRbPAk7
         oHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746158068; x=1746762868;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IPH5x3OkyPZV5JxMQZ1zGZ5oaQgdw1gt8lYnvIM/Z/8=;
        b=gL/HdQparzkPyPn4RuxQ7U92SEgUd+0INzOKHhMjDulOhoYDpYBGgJcFRHN2+bNfpP
         6fQiQa3AChQA5VguSd1K49HAtoJR/vOd3u0JEP66c96F+cUsQ2A4cx/79rCUJqdgWoWz
         F4vgFYDmbG1XQ2XPBk6Srji9g2NGAyHWPdTIeIkxChmAiVu4yk5GLDkvFT+qkhiIwTWR
         AI12zgFy5QYlBK7tIV3eYsV9kOnNGDGmKDmbcmeoB8qU7NeR84+GtbYTvs8zDKAz1hac
         Qdjn4UraPa/KbfMbccY4Q2j9eYFlNWKVHbxvcAvEmtPexxe9ijLc0kitxO7vGGM37s8Q
         aGew==
X-Gm-Message-State: AOJu0Yx/7DLezUDwibLuxwuBMRuDUQ8GOtgUpCa8e8sgWhDzUg9l8kge
	iB4eq9/1YWBbgo+vkqVHXOoMWoyZF8R5alLAJ95cpjiTYe7S9/wP7lJH9uDZam4C1mCRbOe3Lhl
	PRpKevJCrXvqdmCaCpPymLh5r2GDQ+r/f0DJMCHLiLO52BGbPqAjoiw==
X-Gm-Gg: ASbGncuvhotH/Pnk9b3BbxrKrwK1+UA1DQ+GVfF+lpsyrEuCKxycRRnYoANGcPkkhHR
	dfj9gQ2MzgWKyikoQdeQX42da6LoQsXgy5NvAtXOf3zMeyff9ocQ7SKW1IP9Uys+QytPnbn1UKi
	/cE1d0YpEhmrty6FBWJg==
X-Google-Smtp-Source: AGHT+IH27De/KlkUS225DL+1jgi7Bd45jH2QB+ILdykfKHFbVgyIbVq309EIhsVL+dp7LgArF4VChK/YVgS1o4ebkzs=
X-Received: by 2002:a05:6820:1a07:b0:603:f973:1b6 with SMTP id
 006d021491bc7-607ee83e61dmr822909eaf.5.1746158067878; Thu, 01 May 2025
 20:54:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Per Larsen <perl@immunant.com>
Date: Thu, 1 May 2025 20:53:51 -0700
X-Gm-Features: ATxdqUH-IuiVkS5CcFJu2VXAk3UFa8dz8SV54Ue9gA4hiVXVNFX6PW6OPRnevKk
Message-ID: <CA+AY4XfcDKiSpN-UbrfGdqshQvw+LhY59SSuUmB6XQRYh9m0sw@mail.gmail.com>
Subject: [PATCH 2/3] KVM: arm64: Bump the supported version of FF-A to 1.2
To: linux-kernel@vger.kernel.org
Cc: "qperret@google.com" <qperret@google.com>, "sebastianene@google.com" <sebastianene@google.com>, kernel-team@android.com, 
	"will@kernel.org" <will@kernel.org>, maz@kernel.org, 
	"sudeep.holla@arm.com" <sudeep.holla@arm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, yuzenghui@huawei.com, 
	Armelle Laine <armellel@google.com>, arve@android.org
Content-Type: text/plain; charset="UTF-8"

FF-A version 1.2 introduces the DIRECT_REQ2 ABI. Bump the FF-A version
preferred by the hypervisor as a precursor to implementing the 1.2-only
FFA_MSG_SEND_DIRECT_REQ2 and FFA_MSG_SEND_RESP2 messaging interfaces.

We must also use SMCCC 1.2 for 64-bit SMCs if hypervisor negotiated FF-A
1.2, so ffa_set_retval is updated and a new function to call 64-bit smcs
using SMCCC 1.2 with fallback to SMCCC 1.1 is introduced.

Update deny-list in ffa_call_supported to mark FFA_NOTIFICATION_* and
interfaces added in FF-A 1.2 as unsupported lest they get forwarded.

Signed-off-by: Ayrton Munoz <ayrton@google.com>
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
@@ -27,6 +27,7 @@ hyp-obj-y := timer-sr.o sysreg-sr.o debug-sr.o
switch.o tlb.o hyp-init.o host.o
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
@@ -94,13 +94,57 @@ static void ffa_to_smccc_res(struct arm_smccc_res
*res, int ret)
  ffa_to_smccc_res_prop(res, ret, 0);
 }

-static void ffa_set_retval(struct kvm_cpu_context *ctxt,
+static void ffa_set_retval(u64 func_id,
+    struct kvm_cpu_context *ctxt,
     struct arm_smccc_res *res)
 {
  cpu_reg(ctxt, 0) = res->a0;
  cpu_reg(ctxt, 1) = res->a1;
  cpu_reg(ctxt, 2) = res->a2;
  cpu_reg(ctxt, 3) = res->a3;
+
+ /*
+ * Other result registers must be zero per DEN0077A but SMC32/HVC32 must
+ * preserve x8-x30 per DEN0028.
+ */
+ cpu_reg(ctxt, 4) = 0;
+ cpu_reg(ctxt, 5) = 0;
+ cpu_reg(ctxt, 6) = 0;
+ cpu_reg(ctxt, 7) = 0;
+
+ /* Per DEN0077A v1.2, x8-x17 must be zero for SMC64/HVC64 results*/
+ if (ARM_SMCCC_IS_64(func_id) && hyp_ffa_version >= FFA_VERSION_1_2) {
+ cpu_reg(ctxt, 8) = 0;
+ cpu_reg(ctxt, 9) = 0;
+ cpu_reg(ctxt, 10) = 0;
+ cpu_reg(ctxt, 11) = 0;
+ cpu_reg(ctxt, 12) = 0;
+ cpu_reg(ctxt, 13) = 0;
+ cpu_reg(ctxt, 14) = 0;
+ cpu_reg(ctxt, 15) = 0;
+ cpu_reg(ctxt, 16) = 0;
+ cpu_reg(ctxt, 17) = 0;
+ }
+}
+
+/* Call SMC64 using SMCCC 1.2 if hyp negotiated FF-A 1.2 falling back to 1.1 */
+static void arm_smccc_1_2_smc_fallback(u64 func_id, u64 a1, u64 a2, u64 a3,
+        u64 a4, u64 a5, u64 a6, u64 a7,
+        struct arm_smccc_res *res)
+{
+ struct arm_smccc_1_2_regs args, regs;
+
+ /* SMC64 only as SMC32 must preserve x8-x30 per DEN0028 1.6G Sec 2.6 */
+ if (ARM_SMCCC_IS_64(func_id) && hyp_ffa_version >= FFA_VERSION_1_2) {
+ args = (struct arm_smccc_1_2_regs) { func_id, a1, a2, a3, a4,
+      a5, a6, a7 };
+ arm_smccc_1_2_smc(&args, &regs);
+ *res = (struct arm_smccc_res) { .a0 = regs.a0, .a1 = regs.a1,
+ .a2 = regs.a2, .a3 = regs.a3 };
+ return;
+ }
+
+ arm_smccc_1_1_smc(func_id, a1, a2, a3, a4, a5, a6, a7, res);
 }

 static bool is_ffa_call(u64 func_id)
@@ -115,12 +159,12 @@ static int ffa_map_hyp_buffers(u64 ffa_page_count)
 {
  struct arm_smccc_res res;

- arm_smccc_1_1_smc(FFA_FN64_RXTX_MAP,
-   hyp_virt_to_phys(hyp_buffers.tx),
-   hyp_virt_to_phys(hyp_buffers.rx),
-   ffa_page_count,
-   0, 0, 0, 0,
-   &res);
+ arm_smccc_1_2_smc_fallback(FFA_FN64_RXTX_MAP,
+    hyp_virt_to_phys(hyp_buffers.tx),
+    hyp_virt_to_phys(hyp_buffers.rx),
+    ffa_page_count,
+    0, 0, 0, 0,
+    &res);

  return res.a0 == FFA_SUCCESS ? FFA_RET_SUCCESS : res.a2;
 }
@@ -174,10 +218,10 @@ static void ffa_mem_reclaim(struct arm_smccc_res
*res, u32 handle_lo,

 static void ffa_retrieve_req(struct arm_smccc_res *res, u32 len)
 {
- arm_smccc_1_1_smc(FFA_FN64_MEM_RETRIEVE_REQ,
-   len, len,
-   0, 0, 0, 0, 0,
-   res);
+ arm_smccc_1_2_smc_fallback(FFA_FN64_MEM_RETRIEVE_REQ,
+    len, len,
+    0, 0, 0, 0, 0,
+    res);
 }

 static void ffa_rx_release(struct arm_smccc_res *res)
@@ -628,6 +672,37 @@ static bool ffa_call_supported(u64 func_id)
  case FFA_RXTX_MAP:
  case FFA_MEM_DONATE:
  case FFA_MEM_RETRIEVE_REQ:
+ /* Optional notification interfaces added in FF-A 1.1 */
+ case FFA_NOTIFICATION_BITMAP_CREATE:
+ case FFA_NOTIFICATION_BITMAP_DESTROY:
+ case FFA_NOTIFICATION_BIND:
+ case FFA_NOTIFICATION_UNBIND:
+ case FFA_NOTIFICATION_SET:
+ case FFA_NOTIFICATION_GET:
+ case FFA_NOTIFICATION_INFO_GET:
+ /* Unimplemented interfaces added in FF-A 1.2 */
+ case FFA_MSG_SEND_DIRECT_REQ2:
+
+ /*
+ * FFA_MSG_SEND_DIRECT_RESP2 is not meant to be invoked by the host or
+ * a guest VM because pkvm does not support communication between VMs
+ * via FF-A. Direct messages can only be sent from a non-secure sender
+ * endpoint to a secure receiver endpoint. Only receiver endpoints are
+ * expected to invoke FFA_MSG_SEND_DIRECT_RESP2.
+ */
+ case FFA_MSG_SEND_DIRECT_RESP2:
+
+ /* Reserved for secure endpoints per DEN0077A 1.2 REL0 Table 13.53. */
+ case FFA_CONSOLE_LOG:
+
+ /*
+ * Mandatory for secure endpoints per DEN0077A 1.2 REL0 Table 13.1 and
+ * optional for non-secure endpoints according to Table 13.38.
+ */
+ case FFA_PARTITION_INFO_GET_REGS:
+
+ /* Reserved for secure endpoints per DEN0077A 1.2 REL0 Table 17.2. */
+ case FFA_EL3_INTR_HANDLE:
  return false;
  }

@@ -680,7 +755,8 @@ static int hyp_ffa_post_init(void)
  if (res.a0 != FFA_SUCCESS)
  return -EOPNOTSUPP;

- switch (res.a2) {
+ /* Bit[0:1] holds minimum buffer size and alignment boundary */
+ switch (res.a2 & 0x3) {
  case FFA_FEAT_RXTX_MIN_SZ_4K:
  min_rxtx_sz = SZ_4K;
  break;
@@ -871,7 +947,7 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context
*host_ctxt, u32 func_id)

  ffa_to_smccc_error(&res, FFA_RET_NOT_SUPPORTED);
 out_handled:
- ffa_set_retval(host_ctxt, &res);
+ ffa_set_retval(func_id, host_ctxt, &res);
  return true;
 }

@@ -883,7 +959,7 @@ int hyp_ffa_init(void *pages)
  if (kvm_host_psci_config.smccc_version < ARM_SMCCC_VERSION_1_2)
  return 0;

- arm_smccc_1_1_smc(FFA_VERSION, FFA_VERSION_1_1, 0, 0, 0, 0, 0, 0, &res);
+ arm_smccc_1_1_smc(FFA_VERSION, FFA_VERSION_1_2, 0, 0, 0, 0, 0, 0, &res);
  if (res.a0 == FFA_RET_NOT_SUPPORTED)
  return 0;

@@ -903,10 +979,11 @@ int hyp_ffa_init(void *pages)
  if (FFA_MAJOR_VERSION(res.a0) != 1)
  return -EOPNOTSUPP;

- if (FFA_MINOR_VERSION(res.a0) < FFA_MINOR_VERSION(FFA_VERSION_1_1))
+ /* See do_ffa_guest_version before bumping maximum supported version. */
+ if (FFA_MINOR_VERSION(res.a0) < FFA_MINOR_VERSION(FFA_VERSION_1_2))
  hyp_ffa_version = res.a0;
  else
- hyp_ffa_version = FFA_VERSION_1_1;
+ hyp_ffa_version = FFA_VERSION_1_2;

  tx = pages;
  pages += KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE;
-- 
2.49.0.906.g1f30a19c02-goog
