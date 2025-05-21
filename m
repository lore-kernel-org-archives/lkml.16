Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B2F1EB5D8
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747846192; cv=none; b=sgUW5Be7TsCzk3cvGm1JfEv/rOUbp/BWInTBYOUjcWLKJUQ1io3mwGAXQUeAVeYCwt0s0GmGj6zbz8spfo1CxdBU66VCC5ISiT7Gh3BjmIa218FbWNjDgGzln+Z8MjvrahOZrugKl+zCixcVVKZgqYRg6Ha5DYhSgOMdYwg+NMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747846192; c=relaxed/simple;
	bh=C1R/H4qpwU6YnvHjgE6ahZCo2psY9zJPh256YCH44ZU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Hwp8WfdA1HWG9dk/ZrP9/ct7Qc1zKu/ey9ElaMEVb3nVQg5k5reKsKnm2XwGyin4Z7K262ftx5m8DQ0T1OBb9x1ztopDvgufMr4GmIznBejkPJfzBtRAe/ZMwo1CsEel9r7bs1zp+9/9vbXSl6A6bWFm/tqxb8DdDL3EZHFP3yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0Jua2VVW; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0Jua2VVW"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30a39fa0765so10713037a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747846190; x=1748450990; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=q5Uk5vAcfNvCgNAh1tvyOQ0ZmW1i9ehfl5tRs44mMSs=;
        b=0Jua2VVWiq/Fam8YHhSC/cZHSJbhdLoDtuyBCgiMuQtSZG8WfnveuA4Y7n8SYkFntt
         gETswD4hB795V73Qu5j2gHAzbQO+MpHZOBmM7p5dQYytNFZpUO7ImnJSYq7rh8T+iqrC
         PCjhuI3uyrN2xVTQE7yz3lN3RQKktCpofsLGyujFwHefmb4l1TBOFcUhp9CNWJL0Sm1n
         ogpLw5RLL14tXQ+skMCwzYuV87GZGXFIyhyKZO9ZdgonmvDJaiYAg8V2dDUTDOaF1HHm
         FCfC3kAsUhyTZJ+7l5/7r8Rzawnb/lwPJPigNip0QqiyJ/Xw16cvrnkN9lZsLxffW6PE
         NBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747846190; x=1748450990;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q5Uk5vAcfNvCgNAh1tvyOQ0ZmW1i9ehfl5tRs44mMSs=;
        b=MtUw+9TC0Tr5stPUPEfW76ojQV4eTCgD9VJJwsNriFuPW2ngYFtBLkJ2g0lBwdCzdQ
         gvHi8ff9v+N8cRU8beDOrFm6m3AO+baIGJsxMYVkIfI/2urb1sS+2vzHcvNxjUtVldMN
         3r5UFWT7wmKTf+g871ANWvz6VJxKF0RIhthRwXbEkhrji94AUYB87Lu/3Fuxaxvvd09a
         qoku7JEOLclt+xrD31tPrtbGU+zDWlEYncx+UWEUhUswBbeotZd0U3MOrrN2pW1VptxU
         0iLS7ow5YSd4cSBcb/jcHDA+HVbF8KbMXiu96Z9vXXkSdOBJXwpta9oeNl5/tqP0M9DC
         SsDA==
X-Forwarded-Encrypted: i=1; AJvYcCU0X9pp4gyvURU3oMqOfPAsRVCM/oKfmktOKyGUtuUtVsxUJdhxC1wQYVxMYW5sxzpQ0keb8u72rCLiRME=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+TJrqKEwdTVyW//MQgfYCmFshu9xz8xlDV4/REbVLIaD85NIB
	SLj8q4Pe3puLO1D8NNMSpJUcy/k3jwTi08iakURSoDAHFeGghsAtg5uRPKosWDE0uQ36R3z9Wlh
	mpgc+tw==
X-Google-Smtp-Source: AGHT+IFvDxzqQO/100iaFPUGFL4AZ9hBcVttkZK+mlSdVUCTlHUv42+QzK1ZVmnI6FfCKup+/RbQqiFE/sU=
X-Received: from pji12.prod.google.com ([2002:a17:90b:3fcc:b0:2f5:63a:4513])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:28c5:b0:2fe:a79e:f56f
 with SMTP id 98e67ed59e1d1-30e7d522165mr31168638a91.13.1747846190263; Wed, 21
 May 2025 09:49:50 -0700 (PDT)
Date: Wed, 21 May 2025 09:49:48 -0700
In-Reply-To: <20250512085735.564475-2-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250512085735.564475-1-chao.gao@intel.com> <20250512085735.564475-2-chao.gao@intel.com>
Message-ID: <aC4ELHF73K4KIY27@google.com>
Subject: Re: [PATCH v7 1/6] x86/fpu/xstate: Differentiate default features for
 host and guest FPUs
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	tglx@linutronix.de, dave.hansen@intel.com, pbonzini@redhat.com, 
	peterz@infradead.org, rick.p.edgecombe@intel.com, weijiang.yang@intel.com, 
	john.allen@amd.com, bp@alien8.de, chang.seok.bae@intel.com, xin3.li@intel.com, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Mitchell Levy <levymitchell0@gmail.com>, Kees Cook <kees@kernel.org>, 
	Stanislav Spassov <stanspas@amazon.de>, Eric Biggers <ebiggers@google.com>, 
	Nikolay Borisov <nik.borisov@suse.com>, Oleg Nesterov <oleg@redhat.com>, 
	Vignesh Balasubramanian <vigbalas@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, May 12, 2025, Chao Gao wrote:
> @@ -772,6 +776,21 @@ static void __init fpu__init_disable_system_xstate(unsigned int legacy_size)
>  	fpstate_reset(x86_task_fpu(current));
>  }
>  
> +static void __init init_default_features(u64 kernel_max_features, u64 user_max_features)
> +{
> +	u64 kfeatures = kernel_max_features;
> +	u64 ufeatures = user_max_features;
> +
> +	/* Default feature sets should not include dynamic xfeatures. */
> +	kfeatures &= ~XFEATURE_MASK_USER_DYNAMIC;
> +	ufeatures &= ~XFEATURE_MASK_USER_DYNAMIC;
> +
> +	fpu_kernel_cfg.default_features = kfeatures;
> +	fpu_user_cfg.default_features   = ufeatures;
> +
> +	guest_default_cfg.features      = kfeatures;
> +}
> +
>  /*
>   * Enable and initialize the xsave feature.
>   * Called once per system bootup.
> @@ -854,12 +873,8 @@ void __init fpu__init_system_xstate(unsigned int legacy_size)
>  	fpu_user_cfg.max_features = fpu_kernel_cfg.max_features;
>  	fpu_user_cfg.max_features &= XFEATURE_MASK_USER_SUPPORTED;
>  
> -	/* Clean out dynamic features from default */
> -	fpu_kernel_cfg.default_features = fpu_kernel_cfg.max_features;
> -	fpu_kernel_cfg.default_features &= ~XFEATURE_MASK_USER_DYNAMIC;
> -
> -	fpu_user_cfg.default_features = fpu_user_cfg.max_features;
> -	fpu_user_cfg.default_features &= ~XFEATURE_MASK_USER_DYNAMIC;
> +	/* Now, given maximum feature set, determine default values */
> +	init_default_features(fpu_kernel_cfg.max_features, fpu_user_cfg.max_features);

Passing in max_features is rather odd.  I assume the intent is to capture the
dependencies, but that falls apart by the end of series as the guest features
are initialized as:

	guest_default_cfg.features      = kfeatures | xfeatures_mask_guest_supervisor();

where xfeatures_mask_guest_supervisor() sneakily consumes fpu_kernel_cfg.max_features,
the very field this patch deliberately avoids consuming directly.

  static inline u64 xfeatures_mask_guest_supervisor(void)
  {
	return fpu_kernel_cfg.max_features & XFEATURE_MASK_GUEST_SUPERVISOR;
  }

Rather than providing a helper to initialize the defaults, what if we provide
helpers to provide the default *masks*?  Then the dependencies on max_features
are super clear.

E.g. spread over multiple patches (completely untested)

diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index be1cdfa9b00d..e52c7517df5f 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -780,27 +780,22 @@ static void __init fpu__init_disable_system_xstate(unsigned int legacy_size)
        fpstate_reset(x86_task_fpu(current));
 }
 
-static void __init init_default_features(u64 kernel_max_features, u64 user_max_features)
+static u64 __init host_default_mask(void)
 {
-       u64 kfeatures = kernel_max_features;
-       u64 ufeatures = user_max_features;
-
        /*
-        * Default feature sets should not include dynamic and guest-only
-        * xfeatures at all.
+        * Exclude dynamic features (require userspace opt-in) and features
+        * that are supported only for KVM guests.
         */
-       kfeatures &= ~(XFEATURE_MASK_USER_DYNAMIC | XFEATURE_MASK_GUEST_SUPERVISOR);
-       ufeatures &= ~XFEATURE_MASK_USER_DYNAMIC;
-
-       fpu_kernel_cfg.default_features = kfeatures;
-       fpu_user_cfg.default_features   = ufeatures;
+       return ~((u64)XFEATURE_MASK_USER_DYNAMIC | XFEATURE_MASK_GUEST_SUPERVISOR);
+}
 
+static u64 __init guest_default_mask(void)
+{
        /*
-        * Ensure VCPU FPU container only reserves a space for guest-only
-        * xfeatures. This distinction can save kernel memory by
-        * maintaining a necessary amount of XSAVE buffer.
+        * Exclude dynamic features, which require userspace opt-in even for
+        * KVM guests.
         */
-       guest_default_cfg.features      = kfeatures | xfeatures_mask_guest_supervisor();
+       return ~(u64)XFEATURE_MASK_USER_DYNAMIC;
 }
 
 /*
@@ -886,7 +881,9 @@ void __init fpu__init_system_xstate(unsigned int legacy_size)
        fpu_user_cfg.max_features &= XFEATURE_MASK_USER_SUPPORTED;
 
        /* Now, given maximum feature set, determine default values */
-       init_default_features(fpu_kernel_cfg.max_features, fpu_user_cfg.max_features);
+       fpu_kernel_cfg.default_features = fpu_kernel_cfg.max_features & host_default_mask();
+       fpu_user_cfg.default_features = fpu_user_cfg.max_features & host_default_mask();
+       guest_default_cfg.features = fpu_kernel_cfg.max_features & guest_default_mask();
 
        /* Store it for paranoia check at the end */
        xfeatures = fpu_kernel_cfg.max_features;
diff --git a/arch/x86/kernel/fpu/xstate.h b/arch/x86/kernel/fpu/xstate.h
index 9e496391b5f0..52ce19289989 100644
--- a/arch/x86/kernel/fpu/xstate.h
+++ b/arch/x86/kernel/fpu/xstate.h
@@ -62,11 +62,6 @@ static inline u64 xfeatures_mask_supervisor(void)
        return fpu_kernel_cfg.max_features & XFEATURE_MASK_SUPERVISOR_SUPPORTED;
 }
 
-static inline u64 xfeatures_mask_guest_supervisor(void)
-{
-       return fpu_kernel_cfg.max_features & XFEATURE_MASK_GUEST_SUPERVISOR;
-}
-
 static inline u64 xfeatures_mask_independent(void)
 {
        if (!cpu_feature_enabled(X86_FEATURE_ARCH_LBR))

