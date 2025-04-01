Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093CD21D3E6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743524293; cv=none; b=P/9zmoylmbeWBArhJHoMuUTkvDaho0Lu/eli3KdFH6ETCTjgEeqsZRGhhDt2neLUGkFQ8dbXY91sqLfQ/oY6wwka8WM70Rrjbf++PKM5Vhn4dN+m0ek51MBqIJdQwCHrtikkloGcRD0QVN/5KQ0O5/LH3nG36Ter2E6j4ea4g3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743524293; c=relaxed/simple;
	bh=mLQbx1jisqBwOfc+NQxn9P1UAtUaAxPUhi+tPamI/f0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FhWkE5SM6HOLmeKQ0/UDBgrAJw+erT90To6IMnJwSZn7hEarzKrhCVsbTPDpnyjlbIpiNKI+Fh77ZJ9BTiNAp1R5UMGe3c8CiDIyUPnQt9KdXDf2Ft3UgmJgjE1FPO7B9K/41LSbCWj0D7CUtpyO8B8nLq4K9zQ7LKnRPhVX+jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z7ALBBfb; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z7ALBBfb"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff6167e9ccso627578a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743524291; x=1744129091; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=AkBWo9dnQGpjZuqJnrYPda5jwQq6BFGndRJc124YDKs=;
        b=Z7ALBBfb6StDn1ZNvZEWH60T2KoZSvE4cfgpHEs+dmuAb/dvtyKXYPhShtp6RPzWAc
         ynBMXa45BdNaEJJR7lHG9k6uQg5wtYzFJVfMI50q1SUDKHQbIgn8a5QFgv1+f1XisogV
         vTpCwADBxAbgEH7MMD7HsxVHe8vAVhXkaJ2hOSct/OvNPn1q+wQRvc6yvKR3DeX6rJo0
         CZ2xn50Esf8waJz1N2wI/driyiYbFP6qbp41rpYSwtoJQ1Hjhoj6mqoGO/mWCB3TmxDK
         OQWxOIvOqCn2Ep0CBLDSGuITVrOpcknSRq1KXZMGPk3Xq4DGNpEntctxFXWCYKmLY+hn
         UZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743524291; x=1744129091;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AkBWo9dnQGpjZuqJnrYPda5jwQq6BFGndRJc124YDKs=;
        b=dS3fKBSXnl3OklBsEC2GnW7fatloDTXNdX1GSHcP+pNzelAKw1N8JkaEWYj/QjKdsT
         YMhAznWLJMVUtovo/lmhhr0KhWEWHAA0+g55w0XIF+YLCi/8SQdKQUoaTJSplc6s7I0L
         GhoQ7xFJbo1gnS+e488z5yRaj9AOYH+t9DJ4a7Szzc0OEaAOx2wiRphIu+pxy2wjJaEe
         P+i0Fv4b14STK0odE/QXBdFp0tYP6Cu0Xa3o1DhQSSfIDAbDatoepu9yoA2clCXsG6Tq
         Hna3y4qKyAaySs9mM9URHQ3X92yqMumIMrpbbqI4uYUEaEo8J980BrpWVr10eTyc6/9l
         KdZA==
X-Forwarded-Encrypted: i=1; AJvYcCVh382ij604Q5cWNLFQAAlP+xg3wW3ZRl/tr0n5+x/QnXC5KE6Tv/BJGs0o6WL5biKZVBvdCAdbyhLOZws=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4WO6Aiv85Xsg7KHslYjy0jJMtmRuZkEGE2geYA7k0wNppJqu2
	AAnS2e5GrxFaOlfXsTr2R1PjqGAxd8oJuQ2TeTmwlI0DWzyI9Pn/MvN9xGLnwBDhB4qsPmU9HUt
	PUQ==
X-Google-Smtp-Source: AGHT+IEQY+S+Rgi5OwC0yzzxYa5wSGw6iWHC3K9elsEqqknoTddyn8IHbybmZm5I3XA/J0Eutqh8BKIlg2I=
X-Received: from pfbdu10.prod.google.com ([2002:a05:6a00:2b4a:b0:736:ae72:7543])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3950:b0:1f5:7eee:bb10
 with SMTP id adf61e73a8af0-2009f5ba6c0mr21757247637.8.1743524291266; Tue, 01
 Apr 2025 09:18:11 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue,  1 Apr 2025 09:18:04 -0700
In-Reply-To: <20250401161804.842968-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250401161804.842968-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250401161804.842968-4-seanjc@google.com>
Subject: [PATCH v3 3/3] KVM: x86: Add module param to control and enumerate
 device posted IRQs
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a module param to each KVM vendor module to allow disabling device
posted interrupts without having to sacrifice all of APICv/AVIC, and to
also effectively enumerate to userspace whether or not KVM may be
utilizing device posted IRQs.  Disabling device posted interrupts is
very desirable for testing, and can even be desirable for production
environments, e.g. if the host kernel wants to interpose on device
interrupts.

Put the module param in kvm-{amd,intel}.ko instead of kvm.ko to match
the overall APICv/AVIC controls, and to avoid complications with said
controls.  E.g. if the param is in kvm.ko, KVM needs to be snapshot the
original user-defined value to play nice with a vendor module being
reloaded with different enable_apicv settings.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h | 1 +
 arch/x86/kvm/svm/svm.c          | 2 ++
 arch/x86/kvm/vmx/vmx.c          | 2 ++
 arch/x86/kvm/x86.c              | 8 +++++++-
 4 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index a884ab544335..6e8be274c089 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1923,6 +1923,7 @@ struct kvm_arch_async_pf {
 extern u32 __read_mostly kvm_nr_uret_msrs;
 extern bool __read_mostly allow_smaller_maxphyaddr;
 extern bool __read_mostly enable_apicv;
+extern bool __read_mostly enable_device_posted_irqs;
 extern struct kvm_x86_ops kvm_x86_ops;
 
 #define kvm_x86_call(func) static_call(kvm_x86_##func)
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 8abeab91d329..def76e63562d 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -231,6 +231,8 @@ module_param(tsc_scaling, int, 0444);
 static bool avic;
 module_param(avic, bool, 0444);
 
+module_param(enable_device_posted_irqs, bool, 0444);
+
 bool __read_mostly dump_invalid_vmcb;
 module_param(dump_invalid_vmcb, bool, 0644);
 
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index b70ed72c1783..ac7f1df612e8 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -115,6 +115,8 @@ module_param(enable_apicv, bool, 0444);
 bool __read_mostly enable_ipiv = true;
 module_param(enable_ipiv, bool, 0444);
 
+module_param(enable_device_posted_irqs, bool, 0444);
+
 /*
  * If nested=1, nested virtualization is supported, i.e., guests may use
  * VMX and be a hypervisor for its own guests. If nested=0, guests may not
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index a5ea4b4c7036..9211344b20ae 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -227,6 +227,9 @@ EXPORT_SYMBOL_GPL(allow_smaller_maxphyaddr);
 bool __read_mostly enable_apicv = true;
 EXPORT_SYMBOL_GPL(enable_apicv);
 
+bool __read_mostly enable_device_posted_irqs = true;
+EXPORT_SYMBOL_GPL(enable_device_posted_irqs);
+
 const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
 	KVM_GENERIC_VM_STATS(),
 	STATS_DESC_COUNTER(VM, mmu_shadow_zapped),
@@ -9784,6 +9787,9 @@ int kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 	if (r != 0)
 		goto out_mmu_exit;
 
+	enable_device_posted_irqs &= enable_apicv &&
+				     irq_remapping_cap(IRQ_POSTING_CAP);
+
 	kvm_ops_update(ops);
 
 	for_each_online_cpu(cpu) {
@@ -13554,7 +13560,7 @@ EXPORT_SYMBOL_GPL(kvm_arch_has_noncoherent_dma);
 
 bool kvm_arch_has_irq_bypass(void)
 {
-	return enable_apicv && irq_remapping_cap(IRQ_POSTING_CAP);
+	return enable_device_posted_irqs;
 }
 EXPORT_SYMBOL_GPL(kvm_arch_has_irq_bypass);
 
-- 
2.49.0.472.ge94155a9ec-goog

