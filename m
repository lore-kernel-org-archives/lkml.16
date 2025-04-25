Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA569232395
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745568551; cv=none; b=u/O7CzgKM8D9n370zZ9gTIRuA4r0aq2VuLYXSzmoCRnYOS8LKjxzVZVUv0GNheN6UE3/FuLW6UCoLULwsWC24nOOHs2pN/FRts9uAQEJZsUyWABpw/KspCNNuNZzKbahoZqogVMCWoiusHlyfssHNwpQwm4V5/DFTjoZRnHNnFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745568551; c=relaxed/simple;
	bh=uV+M8bT8/WTU3UpAR/zqlgawiZzlVMGM//Dmcew26YY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sHbIopz4DucfUZeWue/8MbbFf/9jSgR6Jn6cinahtVqzNlKdpdXMvojnHDpRvr+z4GubxhGVopV9tAWN970ip8HtR/SALQACRezZe+u81hf/a2tjxPh6JqhgIiQOi1tRLPH/XgpFZ715EimarEJeLI/iDYobZXzmoBIv3gVY4uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=asZ/b4Xh; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="asZ/b4Xh"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 26B2840E0219;
	Fri, 25 Apr 2025 08:09:04 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 6JVJfyeM5Fja; Fri, 25 Apr 2025 08:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1745568540; bh=zXhwC7YeMGV+aK7UtH0f8XjRw/ijgyValH5K5YgF6FY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=asZ/b4Xhqncz9S+loXvvywPEXAa64nSr6PNVAGdUHV97Ru3UWRgQX7999DM3Nanyd
	 hJAE3oniZjPENlZw4j3SfZuFDi0d6F8Wh36FToUZnSCYkncK7ThZthseTFxWbIPizc
	 gshzPGrkC+kb/vyPutsggrBuhJPlpyC8IrlpRQ1aXZftvMcuvw9DmGzH7QTv2L+gic
	 G0SczbXKHUMSfcCrsc3u51jjIRJOlAVLv3kt2SBXHGzQd0PjQCnmZu1rGIrjMJ5xSZ
	 nwCCGqiAZa5V9+nGjGpFsDQecDz8MXyYDDkPwcJ1O+HCiArc5LYXx4Cj2yx4x+2nbj
	 asD4L1uDL+dxsYST3tP1bDf2GhFUTIhxcxwP0qZUyqY9VtU1jXjC+XTbYzy025ymIz
	 QJ+otl9Z8shpP3ijxntilNQBFxqAO0baNJ0sVKinJ2v2J6J3Ggm13H7Gk8fkAACpp1
	 o84AGl1E8L5mDgl42nZecO+XxcG3vWmmiJvOCeLTHNUxPUNx1acV2NiFoL6oAX3wpy
	 4lCgOSBJasqYtDDKFDcaQpBQAU4JMxZE/nqDh2fihCMS3oeEhaTqt+0JZAyhB87f/S
	 Eur+3ftgKnmhVubyI072Ukm4vIkQj4RMBpJ6uBbIsUeqPiKqHpKZr7KgA0F5A4qRSJ
	 AlZTAwBTCb0gXEiIYLjyxItY=
Received: from rn.tnic (unknown [IPv6:2a02:3037:314:824e:66db:8d18:159d:f3d9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 0E4C940E021B;
	Fri, 25 Apr 2025 08:08:49 +0000 (UTC)
Date: Fri, 25 Apr 2025 10:09:46 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Kaplan, David" <David.Kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 03/16] x86/bugs: Restructure MMIO mitigation
Message-ID: <20250425080946.GBaAtDShGzNQqi30vr@renoirsky.local>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
 <20250418161721.1855190-4-david.kaplan@amd.com>
 <20250424201918.GAaAqcxqFV0raTOOKP@renoirsky.local>
 <LV3PR12MB9265795E7CF35195B7FE02A594852@LV3PR12MB9265.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <LV3PR12MB9265795E7CF35195B7FE02A594852@LV3PR12MB9265.namprd12.prod.outlook.com>

On Thu, Apr 24, 2025 at 08:31:25PM +0000, Kaplan, David wrote:
> verw_mitigation_selected implies that X86_FEATURE_CLEAR_CPU_BUF will
> be enabled, which does a VERW on kernel/vmm exits.

Does it imply that though? As explained, it simply says that *a* VERW
mitigation has been selected.

And only in the MMIO case which mandates that both spots - kernel entry and
VMENTER - should be mitigated, it basically says that this
CLEAR_CPU_BUFFERS macro should be active. And that macro does VERW on
kernel entry and right before VMLAUNCH.

And when the machine is not affected by MDS+TAA, then it enables this
cpu_buf_vm_clear thing which does VERW in C code, a bit earlier before
VMLAUNCH.

> So I'm not sure the comment is really wrong, but it can be rephrased.

Yes please.

> But it kind of does.  !verw_mitigation_selected means that the
> X86_FEATURE bit there isn't set.  So the VMM-based mitigation (the
> static branch) is only used if the broader X86_FEATURE_CLEAR_CPU_BUF
> is not being used.

Right, except that implication is not fully clear, I think.

> I'm ok with this patch, as long as 'full VERW mitigation' is
> considered a clear enough term.  I think the updated comment in the
> apply function does explain what that means, so if that's good enough
> I'm ok.

Right.

So, I did beef up the comments some and renamed the key. Diff ontop of
yours below. How does that look?

---
diff --git a/arch/x86/include/asm/nospec-branch.h b/arch/x86/include/asm/nospec-branch.h
index 51a677fe9a8d..8bb5740eba7a 100644
--- a/arch/x86/include/asm/nospec-branch.h
+++ b/arch/x86/include/asm/nospec-branch.h
@@ -561,7 +561,7 @@ DECLARE_STATIC_KEY_FALSE(mds_idle_clear);
 
 DECLARE_STATIC_KEY_FALSE(switch_mm_cond_l1d_flush);
 
-DECLARE_STATIC_KEY_FALSE(cpu_buf_vm_clear);
+DECLARE_STATIC_KEY_FALSE(clear_cpu_buf_vm);
 
 extern u16 mds_verw_sel;
 
diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index c97ded4d55e5..75eddf4f77d8 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -154,11 +154,11 @@ DEFINE_STATIC_KEY_FALSE(switch_mm_cond_l1d_flush);
 
 /*
  * Controls CPU Fill buffer clear before VMenter. This is a subset of
- * X86_FEATURE_CLEAR_CPU_BUF, and should only be enabled when KVM-only
+ * X86_FEATURE_CLEAR_CPU_BUF, and should only be enabled when VM-only
  * mitigation is required.
  */
-DEFINE_STATIC_KEY_FALSE(cpu_buf_vm_clear);
-EXPORT_SYMBOL_GPL(cpu_buf_vm_clear);
+DEFINE_STATIC_KEY_FALSE(clear_cpu_buf_vm);
+EXPORT_SYMBOL_GPL(clear_cpu_buf_vm);
 
 void __init cpu_select_mitigations(void)
 {
@@ -529,8 +529,11 @@ static void __init mmio_select_mitigation(void)
 		return;
 
 	/*
-	 * Enable CPU buffer clear mitigation for host and VMM, if also affected
-	 * by MDS or TAA.
+	 * Enable full VERW mitigation if also affected by MDS or TAA.
+	 * Full VERW mitigation in the context of the MMIO vuln means
+	 * that the X86_FEATURE_CLEAR_CPU_BUF flag enables the VERW
+	 * clearing in CLEAR_CPU_BUFFERS both on kernel and also on
+	 * guest entry.
 	 */
 	if (boot_cpu_has_bug(X86_BUG_MDS) || taa_vulnerable())
 		verw_mitigation_selected = true;
@@ -568,14 +571,15 @@ static void __init mmio_apply_mitigation(void)
 		return;
 
 	/*
-	 * Only enable the VMM mitigation if the CPU buffer clear mitigation is
-	 * not being used.
+	 * Full VERW mitigation selection enables host and guest entry
+	 * buffer clearing, otherwise buffer clearing only on guest
+	 * entry is needed.
 	 */
 	if (verw_mitigation_selected) {
 		setup_force_cpu_cap(X86_FEATURE_CLEAR_CPU_BUF);
-		static_branch_disable(&cpu_buf_vm_clear);
+		static_branch_disable(&clear_cpu_buf_vm);
 	} else {
-		static_branch_enable(&cpu_buf_vm_clear);
+		static_branch_enable(&clear_cpu_buf_vm);
 	}
 
 	/*
@@ -681,7 +685,7 @@ static void __init md_clear_update_mitigation(void)
 		taa_select_mitigation();
 	}
 	/*
-	 * MMIO_MITIGATION_OFF is not checked here so that cpu_buf_vm_clear
+	 * MMIO_MITIGATION_OFF is not checked here so that clear_cpu_buf_vm
 	 * gets updated correctly as per X86_FEATURE_CLEAR_CPU_BUF state.
 	 */
 	if (boot_cpu_has_bug(X86_BUG_MMIO_STALE_DATA)) {
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 1547bfacd40f..16bb5ed1e6cf 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7359,13 +7359,13 @@ static noinstr void vmx_vcpu_enter_exit(struct kvm_vcpu *vcpu,
 	 * executed in spite of L1D Flush. This is because an extra VERW
 	 * should not matter much after the big hammer L1D Flush.
 	 *
-	 * cpu_buf_vm_clear is used when system is not vulnerable to MDS/TAA,
-	 * and is affected by MMIO Stale Data. In such cases mitigation in only
+	 * clear_cpu_buf_vm is used when system is not vulnerable to MDS/TAA,
+	 * and is affected by MMIO Stale Data. In such cases mitigation is only
 	 * needed against an MMIO capable guest.
 	 */
 	if (static_branch_unlikely(&vmx_l1d_should_flush))
 		vmx_l1d_flush(vcpu);
-	else if (static_branch_unlikely(&cpu_buf_vm_clear) &&
+	else if (static_branch_unlikely(&clear_cpu_buf_vm) &&
 		 kvm_arch_has_assigned_device(vcpu->kvm))
 		mds_clear_cpu_buffers();
 

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
