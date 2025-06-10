Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB652874EA
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749596265; cv=none; b=QCZKubKC90q1h7iWake7k8SUA57d6YIJoLEsxRf+9Kh1BKo+DjCcaOvk90knX2YSdr/wC5BF0/DzLc78o6V5lsigoIZUQfyhCo3KRPThUWhAaPTj0n/yR4Owxu8m7bOmaoaiWs9IKJZszJZyFyvMk6VZDjyUosLAxEW4tpyMg7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749596265; c=relaxed/simple;
	bh=tTEXLUd/zXDDLNY3MmnlVb5Gbwhb1Oifynpm05TtVX0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QDQOhLw3JDKo4tZgX+4gVBAXL/cNuYuAh3lKHIP90zeONE0ip4+V2M4xm5B/8Jm598DrZ9P/k5ndkF0tKIAHgSAJ/MD3wtCibIjBL1i/gaw7zfGMu0kZ+ExGHDMAKz01/b+Oey9b0MQRIKWV49pJRslOQ7+oZKecfSKH+NhVt5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C9BRlTPM; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C9BRlTPM"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-311f4f2e761so6377463a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749596263; x=1750201063; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=LtGhffg+4qUCmhXz2Gv6Fzz7TJfhsSuBXbr9dL/TWnM=;
        b=C9BRlTPM2S8QfPSLCg+AIVcHrhapeIJpxk8axTJxfEgvP9SsdD0VwDWGkzT1AsfkYV
         Sd2vGpC+ZmoURI/vdvfAi/27hzejh7ls6VZ4jA6rvASzDxfwy6qZnGC3FXw//QKaVTTF
         ochVrpQHqu1ipy4PUEHNU0vDubm/iZRqXD/Kn1W5IMcZZ5Zy3BrhHKs9K7OsDxZnLzok
         NasXJfJWoUc1T82mL+zthkilBCqZmHVt7ZHX7QJ9NW0wdxZc2rnKkLYOEJFbX9mTYnXK
         Uk7kfnx0IncNZyUlncZwHf+J8xKTOrhPLIrJE2bUuum3H2mgJ1t3GBwoh8c+V9ETxplq
         ETgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749596263; x=1750201063;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LtGhffg+4qUCmhXz2Gv6Fzz7TJfhsSuBXbr9dL/TWnM=;
        b=N7lmwAi7UWHxCD582ZgroIUMRUv5BmgHt2bd3n6wiV3jG9GXk7VkfWAg5rL2yfnoQ1
         z2e2ZEnoelVpyXoLYKhhXGPeN1m5aZndOn+Vk00LIDNGITsK304LW5jN/tJoqa+hOVFY
         hLwmocPVg8+WrKamEyE8vHBFH4VbU0K/1Zp8ONIjg1zgQePPrikq1Lv4nDuMYG6Dn6hL
         A21faWiY6qLqg6PRtMy0Sci0+u9lYoUDiaFQiDlt6o93HRrxjZ2IypqD6/OI7cdd2cpg
         O6maxRcDTp02G4WMFXN1LGhnyOJ8K2G89/9Fvp8tEpdIRgjfGd932RQ4xUZrN/PMza3K
         +Iig==
X-Forwarded-Encrypted: i=1; AJvYcCXQdwP4Tcg1wZsrfoz7plnSwSk0A2UbjN07LXJJibEVWS61VtMSAP53FPlsI/42A2WwFEizP0rlZ8pUE9g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY3TCneruS7kYmbnQxc84MTNaH/itmk/gEGEfJpmuzRZMaSIdk
	KZE+nSg3xpYcCOVCCp83saXYITxLHtMePYoVB5Uf53rUaim8NXWIFj+glnj6HZLR15asexzJmwM
	/HN4x6w==
X-Google-Smtp-Source: AGHT+IGRgtC4yLWdb8Itbiy3X/aS2mIMT2QE2jBxKl1uV/cOtKkRKfJGAlO+SD96Q9qtuFg+lfuRp8EUej4=
X-Received: from pjb7.prod.google.com ([2002:a17:90b:2f07:b0:2fa:1803:2f9f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5404:b0:311:a623:676c
 with SMTP id 98e67ed59e1d1-313af243c3bmr1739474a91.27.1749596263290; Tue, 10
 Jun 2025 15:57:43 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 10 Jun 2025 15:57:06 -0700
In-Reply-To: <20250610225737.156318-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250610225737.156318-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250610225737.156318-2-seanjc@google.com>
Subject: [PATCH v2 01/32] KVM: SVM: Disable interception of SPEC_CTRL iff the
 MSR exists for the guest
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chao Gao <chao.gao@intel.com>, Borislav Petkov <bp@alien8.de>, Xin Li <xin@zytor.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Francesco Lavra <francescolavra.fl@gmail.com>, 
	Manali Shukla <Manali.Shukla@amd.com>
Content-Type: text/plain; charset="UTF-8"

Disable interception of SPEC_CTRL when the CPU virtualizes (i.e. context
switches) SPEC_CTRL if and only if the MSR exists according to the vCPU's
CPUID model.  Letting the guest access SPEC_CTRL is generally benign, but
the guest would see inconsistent behavior if KVM happened to emulate an
access to the MSR.

Fixes: d00b99c514b3 ("KVM: SVM: Add support for Virtual SPEC_CTRL")
Reported-by: Chao Gao <chao.gao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/svm.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 0ad1a6d4fb6d..21e745acebc3 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -1362,11 +1362,14 @@ static void init_vmcb(struct kvm_vcpu *vcpu)
 	svm_recalc_instruction_intercepts(vcpu, svm);
 
 	/*
-	 * If the host supports V_SPEC_CTRL then disable the interception
-	 * of MSR_IA32_SPEC_CTRL.
+	 * If the CPU virtualizes MSR_IA32_SPEC_CTRL, i.e. KVM doesn't need to
+	 * manually context switch the MSR, immediately configure interception
+	 * of SPEC_CTRL, without waiting for the guest to access the MSR.
 	 */
 	if (boot_cpu_has(X86_FEATURE_V_SPEC_CTRL))
-		set_msr_interception(vcpu, svm->msrpm, MSR_IA32_SPEC_CTRL, 1, 1);
+		set_msr_interception(vcpu, svm->msrpm, MSR_IA32_SPEC_CTRL,
+				     guest_has_spec_ctrl_msr(vcpu),
+				     guest_has_spec_ctrl_msr(vcpu));
 
 	if (kvm_vcpu_apicv_active(vcpu))
 		avic_init_vmcb(svm, vmcb);
-- 
2.50.0.rc0.642.g800a2b2222-goog

