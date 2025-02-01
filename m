Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3C312B73
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 00:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738371054; cv=none; b=VQqpv2oJ+3RxSCfzwZ/VCQe7uzDSzewXAv76ousVYzTAOSbF2BcET6Gbnj39OnJPNrRb91eM0UvCUV/Zh/gDtzUYYvL7OWcwkTmtxHEHQVANfU0lLC3lzPwvzMruEhx89lTmsvQ3WTlusYJB+Fhkkr+ieJ/RT/C+E4I6IefMOqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738371054; c=relaxed/simple;
	bh=8r1IMSgN9S/6dfm6fHWdqJHUa5NHhwmDUjPOyM4evr0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uittHUJUX+LMeP2hRfWo9qtBuMCQuutyuSOPJ3ihhUMkHZE8vsrzSRjVfTCupHNr5L5NROueQEEHR7eB45vkYMTY907zsRBRUNzdkkpe68wq2x4+p2Dhn5+0CkHbwRWNXjabVJGZ9HQE64RkLZjeM01+mXQ6vV7Mpx/Xd0Sea4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zcyRsBr0; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zcyRsBr0"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ef775ec883so4985119a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 16:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738371052; x=1738975852; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=k2K+3ES3yFwMq3HJwtK6RVZhiYj3gk5lp/ZXG2ZzfAM=;
        b=zcyRsBr0SNRq3ekT4ZrY8GDjKr4FK9hIS7uItjluocvQkw/DaRTe7iLAoZizPg4hw6
         2iTQ2+Md8c4R4SoNNCWzfU0HaeND2ltA1WCprES4sQmfTR/WKU0w4XUFRJz3tlFyXmmN
         VwgZdhWzlv9t8ysKH/9fdZULTFwHaaiZ3HMgWfb7vQkj+g3YhD07jSP024ve3L89fOlZ
         hV5IoC2sgm9S2No0oPsciLkx79tO29hs9xX9a3ay6GgPNhnw2jlQGiqNt8Kc5RqWvHyJ
         1aHIhZA6vXSDnUIUHtg3vsB4qHafzfV4QlXUYIfQdClRhyzoIp0bvHtm37VvSbzXdCgR
         apXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738371052; x=1738975852;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k2K+3ES3yFwMq3HJwtK6RVZhiYj3gk5lp/ZXG2ZzfAM=;
        b=wjMmajx+/MXAsV14cHrVq5YdSR3EljDqEDy4JeXnQTHm+FvmAmn2ClMuDK0rMnXYBY
         4nKwdabXnkYuy2iDHBIcZpVbb+uURF5Erl6gtjxOVEKmlERBpEShWoFSgRtfnAhu8o+m
         1GXzgZ/zXfs/D46+D8cOzvGudQ4Z8rKubieVqnaJHLGrFHpiKr9zIkFQmD/ss2OAq6iO
         MUKBovdjcLJd0d9+8j5g/MvNlNyNe5vlPfbRd98YQdTG3Xumz7OLdSam683lMW8hBSfC
         ACznogqKxBI0HSgYYsTrBMYRYAyI78lHpEC/Q8WpbXtmhhL0EcE1W7AMr/6KrV8QA7jP
         tk8Q==
X-Gm-Message-State: AOJu0YwSX7Vq1k760OU/e5PXpkQ3MJoX8pqcXBj/BFXJVGESkiz5MSbQ
	1bfRgQ5AeagIhu1i2aIJSrsloMeHOHrG0Xa13rk2J+mjBffrT5xDF9Uyc7OWU7i+FDAfnV7ywr4
	sYA==
X-Google-Smtp-Source: AGHT+IG2FdkNAipz+7YfRFK37esVegmX9yUIpKPkI5IQki8FVTV9TcslwFm+Z3SMc3yQI05wjkmkJT6td5Y=
X-Received: from pjbov11.prod.google.com ([2002:a17:90b:258b:b0:2ef:7352:9e97])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3a0c:b0:2ee:c9b6:4c42
 with SMTP id 98e67ed59e1d1-2f83abff391mr21670588a91.16.1738371052098; Fri, 31
 Jan 2025 16:50:52 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 16:50:47 -0800
In-Reply-To: <20250201005048.657470-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250201005048.657470-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201005048.657470-2-seanjc@google.com>
Subject: [PATCH 1/2] x86/mtrr: Return success vs. "failure" from guest_force_mtrr_state()
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, Dionna Glaze <dionnaglaze@google.com>, 
	Peter Gonda <pgonda@google.com>, "=?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?=" <jgross@suse.com>, 
	Kirill Shutemov <kirill.shutemov@linux.intel.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, Binbin Wu <binbin.wu@intel.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

When *potentially* forcing MTRRs to a single memory type, return whether
or not MTRRs were indeed overridden so that the caller can take additional
action when necessary.  E.g. KVM-as-a-guest will use the information to
also force the PAT memtype for legacy devices to be WB.

Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/mtrr.h        |  5 +++--
 arch/x86/kernel/cpu/mtrr/generic.c | 11 +++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/mtrr.h b/arch/x86/include/asm/mtrr.h
index c69e269937c5..598753189f19 100644
--- a/arch/x86/include/asm/mtrr.h
+++ b/arch/x86/include/asm/mtrr.h
@@ -58,7 +58,7 @@ struct mtrr_state_type {
  */
 # ifdef CONFIG_MTRR
 void mtrr_bp_init(void);
-void guest_force_mtrr_state(struct mtrr_var_range *var, unsigned int num_var,
+bool guest_force_mtrr_state(struct mtrr_var_range *var, unsigned int num_var,
 			    mtrr_type def_type);
 extern u8 mtrr_type_lookup(u64 addr, u64 end, u8 *uniform);
 extern void mtrr_save_fixed_ranges(void *);
@@ -75,10 +75,11 @@ void mtrr_disable(void);
 void mtrr_enable(void);
 void mtrr_generic_set_state(void);
 #  else
-static inline void guest_force_mtrr_state(struct mtrr_var_range *var,
+static inline bool guest_force_mtrr_state(struct mtrr_var_range *var,
 					  unsigned int num_var,
 					  mtrr_type def_type)
 {
+	return false;
 }
 
 static inline u8 mtrr_type_lookup(u64 addr, u64 end, u8 *uniform)
diff --git a/arch/x86/kernel/cpu/mtrr/generic.c b/arch/x86/kernel/cpu/mtrr/generic.c
index 2fdfda2b60e4..4fd704907dbc 100644
--- a/arch/x86/kernel/cpu/mtrr/generic.c
+++ b/arch/x86/kernel/cpu/mtrr/generic.c
@@ -435,19 +435,21 @@ void __init mtrr_copy_map(void)
  * @var: MTRR variable range array to use
  * @num_var: length of the @var array
  * @def_type: default caching type
+ *
+ * Returns %true if MTRRs were overridden, %false if they were not.
  */
-void guest_force_mtrr_state(struct mtrr_var_range *var, unsigned int num_var,
+bool guest_force_mtrr_state(struct mtrr_var_range *var, unsigned int num_var,
 			    mtrr_type def_type)
 {
 	unsigned int i;
 
 	/* Only allowed to be called once before mtrr_bp_init(). */
 	if (WARN_ON_ONCE(mtrr_state_set))
-		return;
+		return false;
 
 	/* Only allowed when running virtualized. */
 	if (!cpu_feature_enabled(X86_FEATURE_HYPERVISOR))
-		return;
+		return false;
 
 	/*
 	 * Only allowed for special virtualization cases:
@@ -460,7 +462,7 @@ void guest_force_mtrr_state(struct mtrr_var_range *var, unsigned int num_var,
 	    !hv_is_isolation_supported() &&
 	    !cpu_feature_enabled(X86_FEATURE_XENPV) &&
 	    !cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
-		return;
+		return false;
 
 	/* Disable MTRR in order to disable MTRR modifications. */
 	setup_clear_cpu_cap(X86_FEATURE_MTRR);
@@ -480,6 +482,7 @@ void guest_force_mtrr_state(struct mtrr_var_range *var, unsigned int num_var,
 	mtrr_state.enabled |= MTRR_STATE_MTRR_ENABLED;
 
 	mtrr_state_set = 1;
+	return true;
 }
 
 static u8 type_merge(u8 type, u8 new_type, u8 *uniform)
-- 
2.48.1.362.g079036d154-goog

