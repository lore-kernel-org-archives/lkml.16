Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D3B20298D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 20:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745525926; cv=none; b=aVBrW0HLoNm2z0q0a6Kq+zQMontJ4VrECjOpSvZ0z2ohcjAJj4M586cYfpRgKVzyzPXHE8sivLo0GWQcaQcJ3KaiePB+5JpTeZi2BHt8yS0uQ7jl1m81IPK9CLGCn4Cr7nCrml6d0zpqteMoldTt/O/56sY+NynbJ6RNZiVu3Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745525926; c=relaxed/simple;
	bh=uv/JNaP1lcj/xJOM86VibLZoRctuXQTDUgj5IxK5vvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ArGRNd5KA3jNZXobl+Mgo6lb7iIIZE5CBBa4BhtwvN/Ams43zJkLtAlJ/XLgBZKBuJt2l0yyZRktXea7gVswfrCbe8mw26scVYPpVLVlD2vIC7NM0CpnM1+R8qJG5rF4c5vP43fyRK3UTBFekGginOudNtgvm8mS6lvQrOzTGG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=VwO0MKpL; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="VwO0MKpL"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id DB5AD40E01FF;
	Thu, 24 Apr 2025 20:18:40 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 5fz_qO6AO8wK; Thu, 24 Apr 2025 20:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1745525915; bh=KXB9FTTGxt3xsWi1EK7NtqfvQfIZQQ40/Sw/kKVsOQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VwO0MKpLI0ugn1S7vYcdFqmJvQ9swVt86AjTP5O9aztqLmbB1h2BfO8Sx6dVdrzl0
	 sDESGI5p8PpArHv1OnRE012GTd2YnqhJEbEbdTLgBWrfdP9iTzrxdKwg+2FdJ0BbK+
	 RN61WFF7mJcPf59kvmK2thZUqGtItdDM4+mEWijY/yehHIUuLCyHHmWj4q3pnBYy8Z
	 B0d7gBgWwcqv4DfV7DzI8i4f92p3UMavO7gC1b4Q9H+2bf13dPt5aZP+5Xxs1uj4Tb
	 P5jgSEVriIwwQZ8TGQ5t+EbO840LcuS/QTxjkc7PC9HhmjhxSccQIXfaeVfGyR52jh
	 eCJ2Y5dxJP4LcQJruVlQOWr+fRL/syddI3lNqmhaY5rjl3KhliM95fdgMmez05ihLm
	 B3HoyVwrGS/gmpP4fee974I0Zaz3WW+l5NFlzKLMh9uZQTL1tzqkqIxO3ZFpmD3CNO
	 hLN5NN124mHpGmV4JwLhUavO30wb5zgbmi3t346NF2e1ddPjBFhNswKpgVW8jZwkCQ
	 eZ4XUFquBRM/RJxuBAcrO+kErL+zfnS2KADOmSS/R1RkJDHebx/+Xhxw/fFk1d5/JR
	 O2znLlcZJND8YkZ9v25SvMFvSUaEY44BEkBx0QWa7CzRv9vwNB0RhIM481H5cgYGt3
	 CMje04fxe8qR05LAWfUwJf9g=
Received: from rn.tnic (unknown [IPv6:2a02:3031:201:2677:b4a0:48b8:e35c:ca37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 6E1E040E01ED;
	Thu, 24 Apr 2025 20:18:24 +0000 (UTC)
Date: Thu, 24 Apr 2025 22:19:18 +0200
From: Borislav Petkov <bp@alien8.de>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 03/16] x86/bugs: Restructure MMIO mitigation
Message-ID: <20250424201918.GAaAqcxqFV0raTOOKP@renoirsky.local>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
 <20250418161721.1855190-4-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250418161721.1855190-4-david.kaplan@amd.com>

On Fri, Apr 18, 2025 at 11:17:08AM -0500, David Kaplan wrote:
> +static void __init mmio_apply_mitigation(void)
> +{
> +	if (mmio_mitigation == MMIO_MITIGATION_OFF)
> +		return;
>  
>  	/*
> -	 * X86_FEATURE_CLEAR_CPU_BUF could be enabled by other VERW based
> -	 * mitigations, disable KVM-only mitigation in that case.
> +	 * Only enable the VMM mitigation if the CPU buffer clear mitigation is
> +	 * not being used.
>  	 */
> -	if (boot_cpu_has(X86_FEATURE_CLEAR_CPU_BUF))
> +	if (verw_mitigation_selected) {
> +		setup_force_cpu_cap(X86_FEATURE_CLEAR_CPU_BUF);
>  		static_branch_disable(&cpu_buf_vm_clear);
> -	else
> +	} else {
>  		static_branch_enable(&cpu_buf_vm_clear);
> +	}

Sorry, but I'm still not happy about this.

After this patch, we have:

	/*
	 * Enable CPU buffer clear mitigation for host and VMM, if also affected
	 * by MDS or TAA.
	 */
	if (boot_cpu_has_bug(X86_BUG_MDS) || taa_vulnerable())
		verw_mitigation_selected = true;

in the select function.

The comment is wrong. The code does: enable the VERW mitigation for
MMIO if affected by MDS or TAA. verw_mitigation_selected doesn't have
any bearing on whether this should be a host or VMM mitigation - as its
name says, a VERW mitigation has been selected.

Then in the apply function:

	/*
	 * Only enable the VMM mitigation if the CPU buffer clear mitigation is
	 * not being used.
	 */
	if (verw_mitigation_selected) {
		setup_force_cpu_cap(X86_FEATURE_CLEAR_CPU_BUF);
		static_branch_disable(&cpu_buf_vm_clear);
	} else {
		static_branch_enable(&cpu_buf_vm_clear);
	}

Comment is again wrong. verw_mitigation_selected doesn't mean the CPU
buffer clear mitigation is not being used.

Yes yes, it boils down to the same thing in the end but reading it confusing
as hell. verw_mitigation_selected means what its name is: a VERW
mitigation has been selected and nothing else.

Looking at the old code - that you can actually follow:

---
/*
	 * Enable CPU buffer clear mitigation for host and VMM, if also affected
	 * by MDS or TAA. Otherwise, enable mitigation for VMM only.
	 */
	if (boot_cpu_has_bug(X86_BUG_MDS) || (boot_cpu_has_bug(X86_BUG_TAA) &&
					      boot_cpu_has(X86_FEATURE_RTM)))
		setup_force_cpu_cap(X86_FEATURE_CLEAR_CPU_BUF);

	/*
	 * X86_FEATURE_CLEAR_CPU_BUF could be enabled by other VERW based
	 * mitigations, disable KVM-only mitigation in that case.
	 */
	if (boot_cpu_has(X86_FEATURE_CLEAR_CPU_BUF))
		static_branch_disable(&mmio_stale_data_clear);
	else
		static_branch_enable(&mmio_stale_data_clear);
---

because verw_mitigation_selected didn't exist.

And maybe it shouldn't be used here because that variable simply doesn't
fit here with its meaning.

Now, if this variable and the static key were called:

	if (full_verw_mitigation_selected)
	        setup_force_cpu_cap(X86_FEATURE_CLEAR_CPU_BUF);
                static_branch_disable(&clear_cpu_buf_vm);
        } else {
                static_branch_enable(&clear_cpu_buf_vm);
        }

then the code makes total sense all of a sudden.

A full VERW mitigation means CLEAR_CPU_BUF, while the VMM only means,
well, clear_cpu_buf_vm_only.

Renaming the var is probably unnecessary churn but you can fix the
comments and still rename the key:

---
diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index c97ded4d55e5..4a5bd6214508 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -157,8 +157,8 @@ DEFINE_STATIC_KEY_FALSE(switch_mm_cond_l1d_flush);
  * X86_FEATURE_CLEAR_CPU_BUF, and should only be enabled when KVM-only
  * mitigation is required.
  */
-DEFINE_STATIC_KEY_FALSE(cpu_buf_vm_clear);
-EXPORT_SYMBOL_GPL(cpu_buf_vm_clear);
+DEFINE_STATIC_KEY_FALSE(clear_cpu_buf_vm);
+EXPORT_SYMBOL_GPL(clear_cpu_buf_vm);
 
 void __init cpu_select_mitigations(void)
 {
@@ -528,10 +528,7 @@ static void __init mmio_select_mitigation(void)
 	if (mmio_mitigation == MMIO_MITIGATION_OFF)
 		return;
 
-	/*
-	 * Enable CPU buffer clear mitigation for host and VMM, if also affected
-	 * by MDS or TAA.
-	 */
+	/* Enable full VERW mitigation if also affected by MDS or TAA. */
 	if (boot_cpu_has_bug(X86_BUG_MDS) || taa_vulnerable())
 		verw_mitigation_selected = true;
 }
@@ -568,14 +565,14 @@ static void __init mmio_apply_mitigation(void)
 		return;
 
 	/*
-	 * Only enable the VMM mitigation if the CPU buffer clear mitigation is
-	 * not being used.
+	 * Full VERW mitigation selection enables host and VMENTER buffer clearing,
+	 * otherwise buffer clearing only on VMENTER.
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
@@ -681,7 +678,7 @@ static void __init md_clear_update_mitigation(void)
 		taa_select_mitigation();
 	}
 	/*
-	 * MMIO_MITIGATION_OFF is not checked here so that cpu_buf_vm_clear
+	 * MMIO_MITIGATION_OFF is not checked here so that clear_cpu_buf_vm
 	 * gets updated correctly as per X86_FEATURE_CLEAR_CPU_BUF state.
 	 */
 	if (boot_cpu_has_bug(X86_BUG_MMIO_STALE_DATA)) {
---

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
