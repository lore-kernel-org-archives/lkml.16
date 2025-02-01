Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B70A170A2C
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 01:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738374938; cv=none; b=XJDPocROY6/3nkLLW63eP32gA1WrXAOc0+l5ytMWju03xirx6slYU1fxp0SmKdzk2YgnI/OeBWPMx4ct/j2/tYY1C/f45YRCj1OAuDviCi8szBn5OMh8ztZe9dj90r2nhzlC+Py3KkJz3KUjmSVn8Yo1PZ5BfxFyqzwBWJAxOwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738374938; c=relaxed/simple;
	bh=fM1n6FDclVKHXlvkcF8mqpqAtx9unY5xnqToGnbHTSI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HykbCDXjanwjbTjiGgTrRGIAKuN369KEuDEhLDfja182e2wGydXqLUxoIYRziEUPRgK9zF0YL1LOve8hP5CgVxidiRX9cVOHnkVsJR8jEyB2sgwjmD7v17xONIrG+FnQ+XVqImO9lmvIFBy6i3DU2n9MMoZeXRJTxggfgzmccvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WZC8sR7k; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WZC8sR7k"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ef114d8346so5067772a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738374936; x=1738979736; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=3rffIwZzBf9w84td9LkYxb8GhDME9X7gCVMSc0UnAfs=;
        b=WZC8sR7k5BetvDrfTeU1Q4m0g6YPFGcOY/l+Hnzl6Vqr0Q0wLiUltxdw5n4TONAreX
         11hcStpGpCR9A9jBIIuaFomY9BfYoUUX/WlK47R994X4D0sL72xD12a39+/Ir1ts4lmN
         YoxJu7AFkkpmKq00QT1i3gf5HAJAjZvFLx1DZJc7Sa2f4hpqZOpVqJVvFBcBFisb6fqn
         Vxv1qwY4mFH6WbLr5rDRGj8cv8k2Sr6wU9dIqyPw0N4K8Hvzog1raXGDfE5IktH4VOsF
         Oj92rxUfHQPSFitYYgXVuXzQMvbnouLM5gta9S8oh2VR6J/7hctiFbV0d5uUXx4BvRWK
         VY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738374936; x=1738979736;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3rffIwZzBf9w84td9LkYxb8GhDME9X7gCVMSc0UnAfs=;
        b=TNH9PC2ZDST43O+bO2RABHu08R0jYZ8DdyyzoAz1bHnOLmSDGWT89HQBDntyjQgpOt
         J2dPSeepEqZVYO3SdXkUKoN/NxGtnMEaawFy6srS9FbIyGc18DFehXYQVRiBIGkV+kOf
         peNYYt502i7Z6NuGTv/1bC2vJ9WnnmcHoTXXznZO9wwnW7c5MfOK833GVuz0/fZjQKoo
         46QV2HdFBJuhNlqLaaZCF2JR11Or+TAL4sC2P+8Rx1ktUNXyqamT+TkLhQXSzBiaPQxz
         4hGQ1hgxYbTLHcaZZhd/dYRl33q5epnUVjWYxbD6+z1Olx7HjpSC02hgrsUW77W+tZuF
         tZpw==
X-Forwarded-Encrypted: i=1; AJvYcCUbAQU9jIgtIo1UW6vpkyszo5cWI6Y5vW1Bn4MzRCez7xXLO0CUbenqW7cVVHOzl9oK2RasGUTtx8kqSFY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3hSuy3Lx8O5dCgJx3WuXJTx9OBR5c09iikgTTYiGATXNGoNRc
	2H8ZeL41xUqNq22gHsIofO776+fDlOw2n+GvKsZaD5axP7MHgz0jYrj1BqLdxIOa9NRN5LP4AG3
	i8w==
X-Google-Smtp-Source: AGHT+IGBrZrpg8PhfwimecksOm2WshEEHhnGVFTAyj8Gg4iqO42wRkXAmfH9Cuj7cPTKzFEH7NV75D/W+ME=
X-Received: from pjbqi9.prod.google.com ([2002:a17:90b:2749:b0:2ee:4679:4a6b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2709:b0:2ee:693e:ed7c
 with SMTP id 98e67ed59e1d1-2f83acb10c6mr22641043a91.33.1738374936503; Fri, 31
 Jan 2025 17:55:36 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 17:55:17 -0800
In-Reply-To: <20250201015518.689704-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250201015518.689704-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201015518.689704-11-seanjc@google.com>
Subject: [PATCH v2 10/11] KVM: nVMX: Synthesize nested VM-Exit for supported
 emulation intercepts
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When emulating an instruction on behalf of L2 that L1 wants to intercept,
generate a nested VM-Exit instead of injecting a #UD into L2.  Now that
(most of) the necessary information is available, synthesizing a VM-Exit
isn't terribly difficult.

Punt on decoding the ModR/M for descriptor table exits for now.  There is
no evidence that any hypervisor intercepts descriptor table accesses *and*
uses the EXIT_QUALIFICATION to expedite emulation, i.e. it's not worth
delaying basic support for.

To avoid doing more harm than good, e.g. by putting L2 into an infinite
or effectively corrupting its code stream, inject #UD if the instruction
length is nonsensical.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 70 +++++++++++++++++++++++++++++++++---------
 1 file changed, 56 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index dba22536eea3..7b2a6921f156 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -8008,20 +8008,13 @@ static __init void vmx_set_cpu_caps(void)
 }
 
 static bool vmx_is_io_intercepted(struct kvm_vcpu *vcpu,
-				  struct x86_instruction_info *info)
+				  struct x86_instruction_info *info,
+				  unsigned long *exit_qualification)
 {
 	struct vmcs12 *vmcs12 = get_vmcs12(vcpu);
 	unsigned short port;
 	int size;
-
-	if (info->intercept == x86_intercept_in ||
-	    info->intercept == x86_intercept_ins) {
-		port = info->src_val;
-		size = info->dst_bytes;
-	} else {
-		port = info->dst_val;
-		size = info->src_bytes;
-	}
+	bool imm;
 
 	/*
 	 * If the 'use IO bitmaps' VM-execution control is 0, IO instruction
@@ -8033,6 +8026,30 @@ static bool vmx_is_io_intercepted(struct kvm_vcpu *vcpu,
 	if (!nested_cpu_has(vmcs12, CPU_BASED_USE_IO_BITMAPS))
 		return nested_cpu_has(vmcs12, CPU_BASED_UNCOND_IO_EXITING);
 
+	if (info->intercept == x86_intercept_in ||
+	    info->intercept == x86_intercept_ins) {
+		port = info->src_val;
+		size = info->dst_bytes;
+		imm  = info->src_type == OP_IMM;
+	} else {
+		port = info->dst_val;
+		size = info->src_bytes;
+		imm  = info->dst_type == OP_IMM;
+	}
+
+
+	*exit_qualification = ((unsigned long)port << 16) | (size - 1);
+
+	if (info->intercept == x86_intercept_ins ||
+	    info->intercept == x86_intercept_outs)
+		*exit_qualification |= BIT(4);
+
+	if (info->rep_prefix)
+		*exit_qualification |= BIT(5);
+
+	if (imm)
+		*exit_qualification |= BIT(6);
+
 	return nested_vmx_check_io_bitmaps(vcpu, port, size);
 }
 
@@ -8042,6 +8059,9 @@ int vmx_check_intercept(struct kvm_vcpu *vcpu,
 			struct x86_exception *exception)
 {
 	struct vmcs12 *vmcs12 = get_vmcs12(vcpu);
+	unsigned long exit_qualification = 0;
+	u32 vm_exit_reason;
+	u64 exit_insn_len;
 
 	switch (info->intercept) {
 	case x86_intercept_rdpid:
@@ -8062,8 +8082,10 @@ int vmx_check_intercept(struct kvm_vcpu *vcpu,
 	case x86_intercept_ins:
 	case x86_intercept_out:
 	case x86_intercept_outs:
-		if (!vmx_is_io_intercepted(vcpu, info))
+		if (!vmx_is_io_intercepted(vcpu, info, &exit_qualification))
 			return X86EMUL_CONTINUE;
+
+		vm_exit_reason = EXIT_REASON_IO_INSTRUCTION;
 		break;
 
 	case x86_intercept_lgdt:
@@ -8076,11 +8098,25 @@ int vmx_check_intercept(struct kvm_vcpu *vcpu,
 	case x86_intercept_str:
 		if (!nested_cpu_has2(vmcs12, SECONDARY_EXEC_DESC))
 			return X86EMUL_CONTINUE;
+
+		if (info->intercept == x86_intercept_lldt ||
+		    info->intercept == x86_intercept_ltr ||
+		    info->intercept == x86_intercept_sldt ||
+		    info->intercept == x86_intercept_str)
+			vm_exit_reason = EXIT_REASON_LDTR_TR;
+		else
+			vm_exit_reason = EXIT_REASON_GDTR_IDTR;
+		/*
+		 * FIXME: Decode the ModR/M to generate the correct exit
+		 *        qualification for memory operands.
+		 */
 		break;
 
 	case x86_intercept_hlt:
 		if (!nested_cpu_has(vmcs12, CPU_BASED_HLT_EXITING))
 			return X86EMUL_CONTINUE;
+
+		vm_exit_reason = EXIT_REASON_HLT;
 		break;
 
 	case x86_intercept_pause:
@@ -8096,15 +8132,21 @@ int vmx_check_intercept(struct kvm_vcpu *vcpu,
 		    !nested_cpu_has(vmcs12, CPU_BASED_PAUSE_EXITING))
 			return X86EMUL_CONTINUE;
 
+		vm_exit_reason = EXIT_REASON_PAUSE_INSTRUCTION;
 		break;
 
 	/* TODO: check more intercepts... */
 	default:
-		break;
+		return X86EMUL_UNHANDLEABLE;
 	}
 
-	/* FIXME: produce nested vmexit and return X86EMUL_INTERCEPTED.  */
-	return X86EMUL_UNHANDLEABLE;
+	exit_insn_len = abs_diff((s64)info->next_rip, (s64)info->rip);
+	if (!exit_insn_len || exit_insn_len > X86_MAX_INSTRUCTION_LENGTH)
+		return X86EMUL_UNHANDLEABLE;
+
+	__nested_vmx_vmexit(vcpu, vm_exit_reason, 0, exit_qualification,
+			    exit_insn_len);
+	return X86EMUL_INTERCEPTED;
 }
 
 #ifdef CONFIG_X86_64
-- 
2.48.1.362.g079036d154-goog

