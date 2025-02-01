Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DF415746B
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 01:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738374937; cv=none; b=E2eGfWgLZft1tT+NeWh9fBJ2f2lAZnTfJhAFoOBXzxzBb/2DT7xZKEgrSPRWyHrrXwJgrtLfbTNmDSl6KYOeTxjRPXCaQWuiZeYr2gzp+umTYx4mV/yIZ7Gg34XYEpR4KEbzUfZyOZfydGRj7TZ+d40DkxhiD3oJJkEWrsWV4mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738374937; c=relaxed/simple;
	bh=9iTUooTz+GzVh7vu6TOu+J68+KiYzSjVIC9jQQLaLOA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HfM16FTHRObVtJxKgnCGBFjBykc9thIdlj6qAKbJoamCJk60xygQnJfhJdd+MK8jkVSXtIQJZj5XNCpKMLG6Wn2cFHei1Fz6l3/ejhWMWNMGZL1Lb7U19asb60smNa89YMcs5TfI9BCXOI8ADmM2D9i8BqP1y3UNVQUW9epp71Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GkxcYgxu; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GkxcYgxu"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ef6ef86607so7000054a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738374935; x=1738979735; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=3XvAvsURv6o+VBrJhyeGBkEYBU2JVuvbJ6IwloO/TZA=;
        b=GkxcYgxu0vHUVBHp9OhoP7jzzjcnUoodKe9oW04kojqnxnyVLvpMRB0CzTr6V70GN5
         G+K/mKCruldubRQGcOZzIBNkpB8CBULmyHPJ6yMKUvFdR4uvf2ceZjBVL50WGQZL3d97
         9w7VQcNJLnOa1RippEhRgNAJoDmKJ1ThW7AhzDcDVkGipMrbNUWzWBRg+B/vqCPlmMNb
         Dt3axv0NOgefFiZ+fp9H+nFMg/y9/Sz0eURfmCwgyK3gpHF1N8VQHvmFSwxrRfYtvuTm
         8zt4obe9/8TrUaGjrAb71tlb3xKz5vzVFtGrpjoUpPrySEHvt7dCObV8jwQUZhqHhosf
         WB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738374935; x=1738979735;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3XvAvsURv6o+VBrJhyeGBkEYBU2JVuvbJ6IwloO/TZA=;
        b=kiGJBgCXo7RlA+RWz7OljdqiePTodKmzpK/ot5xBWknkQEbSVzDGMvBIjUQl5ASNFr
         bgjQcXUKFU+vZbvnGgc715vbn0MHN0XRqncz0pQZV5ByYNLz5uojqWf++ut7uuL1om4F
         A+e485X+CcT1ekrHb+BR3UUazrJD4X/gR9FOMt+SMKQH5jTgv8WRAVWVaRtNEbatfqYL
         +2W7RTAeCR0JhuUsfWTIxO+qvMv54ETo06RYtfYFVUbFdRGLlTLNeIpD8ouLVUqmxmiG
         Z9f0HqI4rqenoumKhsxGjUVbnfggti6tnBcedcZIWklkl9mYP1pjwRWXeYgNImi35fFY
         2qHw==
X-Forwarded-Encrypted: i=1; AJvYcCVucpRZ9CJ98a+rZVbLYT8jG2iQ07kN5J19edmJDfWw8ga4btAJMek/QY65bE0ejDJV/KBO9ExbWe7Vw0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl4C0nYzyAxPL7LNnCtx5CvlpLG8nBD/AiuWWt6K+tZvWvYnUx
	4rq4kE+CWbqPa7gGOwcppeUobKW6W2uiiLO0A1R2En7JQ5l4rp5uR1uqLGkIp+SMRXFrwcjahr/
	51Q==
X-Google-Smtp-Source: AGHT+IGOzvDdQI0HEUYlP00LQniZPDx482XdAtwcGW/8CaLpA5IH2YAm75ndxRKBH6ny5DWYhQDp8G6wGwM=
X-Received: from pjbeu13.prod.google.com ([2002:a17:90a:f94d:b0:2ef:85ba:108f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:568f:b0:2ea:8aac:6ac1
 with SMTP id 98e67ed59e1d1-2f8464056b9mr14855857a91.15.1738374934730; Fri, 31
 Jan 2025 17:55:34 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 17:55:16 -0800
In-Reply-To: <20250201015518.689704-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250201015518.689704-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201015518.689704-10-seanjc@google.com>
Subject: [PATCH v2 09/11] KVM: nVMX: Allow the caller to provide instruction
 length on nested VM-Exit
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Rework the nested VM-Exit helper to take the instruction length as a
parameter, and convert nested_vmx_vmexit() into a "default" wrapper that
grabs the length from vmcs02 as appropriate.  This will allow KVM to set
the correct instruction length when synthesizing a nested VM-Exit when
emulating an instruction that L1 wants to intercept.

No functional change intended, as the path to prepare_vmcs12()'s reading
of vmcs02.VM_EXIT_INSTRUCTION_LEN is gated on the same set of conditions
as the VMREAD in the new nested_vmx_vmexit().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 12 +++++++-----
 arch/x86/kvm/vmx/nested.h | 22 ++++++++++++++++++++--
 2 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index fb4fd96ce0f8..791e00d467df 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -4618,7 +4618,7 @@ static void sync_vmcs02_to_vmcs12(struct kvm_vcpu *vcpu, struct vmcs12 *vmcs12)
  */
 static void prepare_vmcs12(struct kvm_vcpu *vcpu, struct vmcs12 *vmcs12,
 			   u32 vm_exit_reason, u32 exit_intr_info,
-			   unsigned long exit_qualification)
+			   unsigned long exit_qualification, u32 exit_insn_len)
 {
 	/* update exit information fields: */
 	vmcs12->vm_exit_reason = vm_exit_reason;
@@ -4646,7 +4646,7 @@ static void prepare_vmcs12(struct kvm_vcpu *vcpu, struct vmcs12 *vmcs12,
 					  vm_exit_reason, exit_intr_info);
 
 		vmcs12->vm_exit_intr_info = exit_intr_info;
-		vmcs12->vm_exit_instruction_len = vmcs_read32(VM_EXIT_INSTRUCTION_LEN);
+		vmcs12->vm_exit_instruction_len = exit_insn_len;
 		vmcs12->vmx_instruction_info = vmcs_read32(VMX_INSTRUCTION_INFO);
 
 		/*
@@ -4930,8 +4930,9 @@ static void nested_vmx_restore_host_state(struct kvm_vcpu *vcpu)
  * and modify vmcs12 to make it see what it would expect to see there if
  * L2 was its real guest. Must only be called when in L2 (is_guest_mode())
  */
-void nested_vmx_vmexit(struct kvm_vcpu *vcpu, u32 vm_exit_reason,
-		       u32 exit_intr_info, unsigned long exit_qualification)
+void __nested_vmx_vmexit(struct kvm_vcpu *vcpu, u32 vm_exit_reason,
+			 u32 exit_intr_info, unsigned long exit_qualification,
+			 u32 exit_insn_len)
 {
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
 	struct vmcs12 *vmcs12 = get_vmcs12(vcpu);
@@ -4981,7 +4982,8 @@ void nested_vmx_vmexit(struct kvm_vcpu *vcpu, u32 vm_exit_reason,
 
 		if (vm_exit_reason != -1)
 			prepare_vmcs12(vcpu, vmcs12, vm_exit_reason,
-				       exit_intr_info, exit_qualification);
+				       exit_intr_info, exit_qualification,
+				       exit_insn_len);
 
 		/*
 		 * Must happen outside of sync_vmcs02_to_vmcs12() as it will
diff --git a/arch/x86/kvm/vmx/nested.h b/arch/x86/kvm/vmx/nested.h
index 2c296b6abb8c..6eedcfc91070 100644
--- a/arch/x86/kvm/vmx/nested.h
+++ b/arch/x86/kvm/vmx/nested.h
@@ -26,8 +26,26 @@ void nested_vmx_free_vcpu(struct kvm_vcpu *vcpu);
 enum nvmx_vmentry_status nested_vmx_enter_non_root_mode(struct kvm_vcpu *vcpu,
 						     bool from_vmentry);
 bool nested_vmx_reflect_vmexit(struct kvm_vcpu *vcpu);
-void nested_vmx_vmexit(struct kvm_vcpu *vcpu, u32 vm_exit_reason,
-		       u32 exit_intr_info, unsigned long exit_qualification);
+void __nested_vmx_vmexit(struct kvm_vcpu *vcpu, u32 vm_exit_reason,
+			 u32 exit_intr_info, unsigned long exit_qualification,
+			 u32 exit_insn_len);
+
+static inline void nested_vmx_vmexit(struct kvm_vcpu *vcpu, u32 vm_exit_reason,
+				     u32 exit_intr_info,
+				     unsigned long exit_qualification)
+{
+	u32 exit_insn_len;
+
+	if (to_vmx(vcpu)->fail || vm_exit_reason == -1 ||
+	    (vm_exit_reason & VMX_EXIT_REASONS_FAILED_VMENTRY))
+		exit_insn_len = 0;
+	else
+		exit_insn_len = vmcs_read32(VM_EXIT_INSTRUCTION_LEN);
+
+	__nested_vmx_vmexit(vcpu, vm_exit_reason, exit_intr_info,
+			    exit_qualification, exit_insn_len);
+}
+
 void nested_sync_vmcs12_to_shadow(struct kvm_vcpu *vcpu);
 int vmx_set_vmx_msr(struct kvm_vcpu *vcpu, u32 msr_index, u64 data);
 int vmx_get_vmx_msr(struct nested_vmx_msrs *msrs, u32 msr_index, u64 *pdata);
-- 
2.48.1.362.g079036d154-goog

