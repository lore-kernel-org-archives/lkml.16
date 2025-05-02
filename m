Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC14417A31B
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 03:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746158140; cv=none; b=p3+OYAmu8LdqOatqXfcd2/xuFqTVx2+eFKXdiiOpWI5Q0asWfz2k+5fCRUUcEU79BtczQkm2hX34ds4TermD19FpeSKVWWZzj+MMb37cbOEg8izyNAUeIYtvy1qmSTLPpILzoaB8TDA3VLciLxlfaziZ1zp4AZ06D4/h3QnM4yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746158140; c=relaxed/simple;
	bh=SV6kDskcD8vX3e+V8hJrPJ/AP7JSHOtflGY5z+lLqP8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Ycna+Kqg8jNycSyQDh53iX0Dmlx8UgekNEITfj5s9PpHxP5iEKejx2aiu7a6hw/RCqMK6N7YB7kUTwnqk0r1G8VF9dX0rH3VUAGC6GUTBXv2qfqYYcMKJQYsYEr5uuFlhzd8RdAWlMGSPtYBXFnxhB3MOQlDG+V28NdaTjRVS0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=immunant.com; spf=none smtp.mailfrom=immunant.com; dkim=pass (2048-bit key) header.d=immunant-com.20230601.gappssmtp.com header.i=@immunant-com.20230601.gappssmtp.com header.b=Rij5F85O; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=immunant.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=immunant.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=immunant-com.20230601.gappssmtp.com header.i=@immunant-com.20230601.gappssmtp.com header.b="Rij5F85O"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7301c227512so1112955a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 20:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immunant-com.20230601.gappssmtp.com; s=20230601; t=1746158137; x=1746762937; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Im2wn77ObSMGvD0IVWpoY+rJ8u2j14mJFBlYt2WH2+o=;
        b=Rij5F85O13Q4Q9jgY3YsVcawQYNcsXXTV65ETN/Msd2hDOaPbEx6p+uFLrRoU3qz4S
         lSuqxKyfHmA96kueboj7mM7pLtlm3Tx8eqpHrJArz7UdkKtvg4bJDbPmTBpuhEW+ik8A
         sPS1hHcjBw+eXMwFL/Vu3fJLSugwX3YY/bG3KU11MGSZmx8a5lH7Fu+rfEhYOcTY79YJ
         IZGYz/OaFUAYUzyqvZTyos3v3ZkKKmmFoZrYvhKK1Z52taiddlnohphfuZdkFEQBHlR3
         AeiShmv/mCr3pNHJ50FKjbaXCX3HlOyiUdieX3BYSMtMhQRxlCqhA5ygRyVjU+OvKKue
         qR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746158137; x=1746762937;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Im2wn77ObSMGvD0IVWpoY+rJ8u2j14mJFBlYt2WH2+o=;
        b=Sga4fgFuPPPUOKoV/f9fIYZnGNFKh/mpKd57L/+/QjV/g+7l2AWuD7duFTfGMdjQAy
         Q2yN3D/WUi3IZimYK7hnGGjphWMo7w/BBvYCV2am+m790gFATb6QHm10zJtW0VjwyNfq
         IpR16m97myl20feD4tcfgZ//hiV1Pq33m25xXa0v36LhtE/2YoJ7tMNOVzMk2MOJV1p5
         GKvkAysiUQUbhu0xX0ImMnXnIwpeEKnzhC6CD+uX9tVL8Rrx3ef2lA6RjPknpwASq3el
         +1VE/s5sDeJ3Mhoq7QRIA2GcOr1unjW+eslDUDIkeqah323ivDPbGh+fMUCSizKjeZ9F
         8vyQ==
X-Gm-Message-State: AOJu0YxMCQF1x0xrXzjXbpnF2j3yDsMLy95KA9GSttjVnOgozak8+vzT
	WbJtOmU7hbd/FTpd4E0a3jP/39SCgzS4eKePm01GpduiC3jKmJHBngCUMfulMdy7qrvCr7aI99t
	iX+TopPCcTnCKBWE7BJl7i05rmq7OcCKELIyLYVMthC6ZZou6Wnq5aw==
X-Gm-Gg: ASbGncuEwqWwFSC5EqAkfXyqBfedlTdglpiYlvrIoVF0HXilhT3AKu65SK/EJ+t6nHX
	mQS11Lt7Us4MSPDixWeAJJo5xFPV9CDegHqr33GIjL9LMjM0tFnQPeKPlY7hyJLACx6FlN2z6Xl
	NQ2FOIGE0Y0fb7Xf/RRw==
X-Google-Smtp-Source: AGHT+IFXJBMRQbIPo5upk/R/ynSAAL3AnaaJ66tAq0jNpRLvOIklKis2IE27LIZ/YWgQwFB71nAgw3pr/a9+o43Ab5A=
X-Received: by 2002:a05:6808:398d:b0:403:31f8:44c6 with SMTP id
 5614622812f47-4034146849amr923236b6e.26.1746158137659; Thu, 01 May 2025
 20:55:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Per Larsen <perl@immunant.com>
Date: Thu, 1 May 2025 20:55:01 -0700
X-Gm-Features: ATxdqUETGCaB026jgU5kFDUTuyNNtcaXNdvxmW6ZQm2ObrvQa8lUVjqiXD5HINw
Message-ID: <CA+AY4Xd64AuJvfFujtm-MSDNFoHo77Co5+kzzV-fb928J6QaLg@mail.gmail.com>
Subject: [PATCH 3/3] KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ2 in host handler
To: linux-kernel@vger.kernel.org
Cc: "qperret@google.com" <qperret@google.com>, "sebastianene@google.com" <sebastianene@google.com>, kernel-team@android.com, 
	"will@kernel.org" <will@kernel.org>, maz@kernel.org, 
	"sudeep.holla@arm.com" <sudeep.holla@arm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, yuzenghui@huawei.com, 
	Armelle Laine <armellel@google.com>, arve@android.org
Content-Type: text/plain; charset="UTF-8"

FF-A 1.2 adds the DIRECT_REQ2 messaging interface which is similar to
the existing FFA_MSG_SEND_DIRECT_{REQ,RESP} functions except that it
uses the SMC calling convention v1.2 which allows calls to use x4-x17 as
argument and return registers. Add support for FFA_MSG_SEND_DIRECT_REQ2
in the host ffa handler.

Signed-off-by: Per Larsen <perlarsen@google.com>
Signed-off-by: Per Larsen <perl@immunant.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 111 +++++++++++++++++++++++++++++++++-
 include/linux/arm_ffa.h       |   2 +
 2 files changed, 111 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 8102dd6a19f7..d8c066f3c5c9 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -79,6 +79,14 @@ static void ffa_to_smccc_error(struct arm_smccc_res
*res, u64 ffa_errno)
  };
 }

+static void ffa_to_smccc_1_2_error(struct arm_smccc_1_2_regs *regs,
u64 ffa_errno)
+{
+ *regs = (struct arm_smccc_1_2_regs) {
+ .a0 = FFA_ERROR,
+ .a2 = ffa_errno,
+ };
+}
+
 static void ffa_to_smccc_res_prop(struct arm_smccc_res *res, int ret, u64 prop)
 {
  if (ret == FFA_RET_SUCCESS) {
@@ -89,11 +97,26 @@ static void ffa_to_smccc_res_prop(struct
arm_smccc_res *res, int ret, u64 prop)
  }
 }

+static void ffa_to_smccc_1_2_regs_prop(struct arm_smccc_1_2_regs
*regs, int ret, u64 prop)
+{
+ if (ret == FFA_RET_SUCCESS) {
+ *regs = (struct arm_smccc_1_2_regs) { .a0 = FFA_SUCCESS,
+ .a2 = prop };
+ } else {
+ ffa_to_smccc_1_2_error(regs, ret);
+ }
+}
+
 static void ffa_to_smccc_res(struct arm_smccc_res *res, int ret)
 {
  ffa_to_smccc_res_prop(res, ret, 0);
 }

+static void ffa_to_smccc_1_2_regs(struct arm_smccc_1_2_regs *regs, int ret)
+{
+ ffa_to_smccc_1_2_regs_prop(regs, ret, 0);
+}
+
 static void ffa_set_retval(u64 func_id,
     struct kvm_cpu_context *ctxt,
     struct arm_smccc_res *res)
@@ -127,6 +150,29 @@ static void ffa_set_retval(u64 func_id,
  }
 }

+static void ffa_set_retval_smccc_1_2(struct kvm_cpu_context *ctxt,
+    struct arm_smccc_1_2_regs *regs)
+{
+ cpu_reg(ctxt, 0) = regs->a0;
+ cpu_reg(ctxt, 1) = regs->a1;
+ cpu_reg(ctxt, 2) = regs->a2;
+ cpu_reg(ctxt, 3) = regs->a3;
+ cpu_reg(ctxt, 4) = regs->a4;
+ cpu_reg(ctxt, 5) = regs->a5;
+ cpu_reg(ctxt, 6) = regs->a6;
+ cpu_reg(ctxt, 7) = regs->a7;
+ cpu_reg(ctxt, 8) = regs->a8;
+ cpu_reg(ctxt, 9) = regs->a9;
+ cpu_reg(ctxt, 10) = regs->a10;
+ cpu_reg(ctxt, 11) = regs->a11;
+ cpu_reg(ctxt, 12) = regs->a12;
+ cpu_reg(ctxt, 13) = regs->a13;
+ cpu_reg(ctxt, 14) = regs->a14;
+ cpu_reg(ctxt, 15) = regs->a15;
+ cpu_reg(ctxt, 16) = regs->a16;
+ cpu_reg(ctxt, 17) = regs->a17;
+}
+
 /* Call SMC64 using SMCCC 1.2 if hyp negotiated FF-A 1.2 falling back to 1.1 */
 static void arm_smccc_1_2_smc_fallback(u64 func_id, u64 a1, u64 a2, u64 a3,
         u64 a4, u64 a5, u64 a6, u64 a7,
@@ -681,7 +727,6 @@ static bool ffa_call_supported(u64 func_id)
  case FFA_NOTIFICATION_GET:
  case FFA_NOTIFICATION_INFO_GET:
  /* Unimplemented interfaces added in FF-A 1.2 */
- case FFA_MSG_SEND_DIRECT_REQ2:

  /*
  * FFA_MSG_SEND_DIRECT_RESP2 is not meant to be invoked by the host or
@@ -709,6 +754,20 @@ static bool ffa_call_supported(u64 func_id)
  return true;
 }

+/*
+ * Must a given FFA function use the SMC calling convention v1.2?
+ */
+static bool ffa_call_needs_smccc_1_2(u64 func_id)
+{
+ switch (func_id) {
+ case FFA_MSG_SEND_DIRECT_REQ2:
+ case FFA_MSG_SEND_DIRECT_RESP2:
+ return true;
+ }
+
+ return false;
+}
+
 static bool do_ffa_features(struct arm_smccc_res *res,
      struct kvm_cpu_context *ctxt)
 {
@@ -882,9 +941,47 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
  hyp_spin_unlock(&host_buffers.lock);
 }

+static void do_ffa_direct_msg2(struct arm_smccc_1_2_regs *regs,
+       struct kvm_cpu_context *ctxt,
+       u64 vm_handle)
+{
+ DECLARE_REG(u32, func_id, ctxt, 0);
+ DECLARE_REG(u32, endp, ctxt, 1);
+ DECLARE_REG(u64, uuid_lo, ctxt, 2);
+ DECLARE_REG(u64, uuid_hi, ctxt, 3);
+ DECLARE_REG(u64, x4, ctxt, 4);
+ DECLARE_REG(u64, x5, ctxt, 5);
+ DECLARE_REG(u64, x6, ctxt, 6);
+ DECLARE_REG(u64, x7, ctxt, 7);
+ DECLARE_REG(u64, x8, ctxt, 8);
+ DECLARE_REG(u64, x9, ctxt, 9);
+ DECLARE_REG(u64, x10, ctxt, 10);
+ DECLARE_REG(u64, x11, ctxt, 11);
+ DECLARE_REG(u64, x12, ctxt, 12);
+ DECLARE_REG(u64, x13, ctxt, 13);
+ DECLARE_REG(u64, x14, ctxt, 14);
+ DECLARE_REG(u64, x15, ctxt, 15);
+ DECLARE_REG(u64, x16, ctxt, 16);
+ DECLARE_REG(u64, x17, ctxt, 17);
+
+ if (FIELD_GET(FFA_SRC_ENDPOINT_MASK, endp) != vm_handle) {
+ ffa_to_smccc_1_2_regs(regs, FFA_RET_INVALID_PARAMETERS);
+ return;
+ }
+
+ struct arm_smccc_1_2_regs args = {
+ func_id, endp, uuid_lo, uuid_hi,
+ x4,  x5,  x6,  x7,  x8,  x9, x10,
+ x11, x12, x13, x14, x15, x16, x17
+ };
+
+ arm_smccc_1_2_smc(&args, regs);
+}
+
 bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 {
  struct arm_smccc_res res;
+ struct arm_smccc_1_2_regs regs;

  /*
  * There's no way we can tell what a non-standard SMC call might
@@ -940,14 +1037,24 @@ bool kvm_host_ffa_handler(struct
kvm_cpu_context *host_ctxt, u32 func_id)
  case FFA_PARTITION_INFO_GET:
  do_ffa_part_get(&res, host_ctxt);
  goto out_handled;
+ case FFA_MSG_SEND_DIRECT_REQ2:
+ if (hyp_ffa_version >= FFA_VERSION_1_2) {
+ do_ffa_direct_msg2(&regs, host_ctxt, HOST_FFA_ID);
+ goto out_handled;
+ }
+ goto out_not_supported;
  }

  if (ffa_call_supported(func_id))
  return false; /* Pass through */

+out_not_supported:
  ffa_to_smccc_error(&res, FFA_RET_NOT_SUPPORTED);
 out_handled:
- ffa_set_retval(func_id, host_ctxt, &res);
+ if (ffa_call_needs_smccc_1_2(func_id))
+ ffa_set_retval_smccc_1_2(host_ctxt, &regs);
+ else
+ ffa_set_retval(func_id, host_ctxt, &res);
  return true;
 }

diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index 5bded24dc24f..4d541cf12ceb 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -268,6 +268,8 @@ bool ffa_partition_check_property(struct
ffa_device *dev, u32 property)
  (ffa_partition_check_property(dev, FFA_PARTITION_DIRECT_REQ2_RECV) && \
  !dev->mode_32bit)

+#define FFA_SRC_ENDPOINT_MASK GENMASK(31, 16)
+
 /* For use with FFA_MSG_SEND_DIRECT_{REQ,RESP} which pass data via registers */
 struct ffa_send_direct_data {
  unsigned long data0; /* w3/x3 */
-- 
2.49.0.906.g1f30a19c02-goog
