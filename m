Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D317D1953A1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744379398; cv=none; b=iux8v3NDMSDnsAxw7eLZVNXsBot5ND/lVz1ZDmATQ5HFE1bjDY9SuUOsXIv418ZohCdQvWwHh3Zt6BL+GhTyjQbBOqWTpfSMafphG3o9e7S4VMeQluW/a2Ms9Ap5MO06RWEEcD2LXZOondTiOFlX6yuWPLyPFWz8lBlmXNIQijE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744379398; c=relaxed/simple;
	bh=I56Ww0FL0p3WycuTmoOZOg78vER//umvFNWysezLXBU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aWkJ43Qii3q8s4p/8AJnEve9CR3ea0Obi3cmazCAY89OU3Mzkr3ZxKKZcz8hagJZUXE/BLBa6act2cDGXdeZJ53MWbjK4F0IQl1Bwa1DHjst3XSSccCjmUMFVP7aW//BN65rTyDPx4qljaOwZOVPXrENmSVMaF6Kz5mviVu4cB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gRtnG0S/; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gRtnG0S/"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-736b5f9279cso1809674b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 06:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744379396; x=1744984196; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=npTqIzcflaiGl9UdPw4hvsTt3mABWsyegIi1jVx2GCM=;
        b=gRtnG0S/GquVunJXSGtsm2dEouitECg2lJc1D+WVF8v9ic7i+Xp/I3EojhqvNRWD00
         o5/hgpzHCAMkA8ifR7gBeO1FRHbbkE7+FW9G0kf9Dd4UxE5Y9AYX83wuyVyDq59BA5kd
         Qv1rAInQ/isjYFx1s75SRVwtLVNpfQJ3AnYxY9b2oUcy6Gc/LxXwG5bxNLQsN6T8cbqu
         OWXBO47y8S27WBSg6fFlauMKQiDvpqx18AWPuQ7bJ2JtInYClHroPBHhYEPZb7J0a0AD
         WBg2TVnxgPL3Th6V16Z+rfpUFhzX8fNM5OZHJ1yPoZIYyYabPrT9G0ZFDBOzXL2/NM8s
         9CVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744379396; x=1744984196;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=npTqIzcflaiGl9UdPw4hvsTt3mABWsyegIi1jVx2GCM=;
        b=h4FTgvuaMXhIR5acZtxfd83ExxT2DXwXfvTN0ixJ+BVm5qlJBJ6eeMnFGqupOC8IWN
         UPwuvanilQfUOFBm5tT9hvZU3/96zsof/kYExwk0PNTvO6pvUzHtcoGMd1c+qqUa/QMb
         ghFBDl95QoyktmgLwg7ya+Jv6Jp7gXfo8YOw4hXICgKv+mJJmzOijHbxgm3NlkqWjiC+
         ycjA3XrTxyo4HtwHQ7b+PHyYuOvLVpmk7+VZKxJKN0O5L1TK+YgSvK7qFVQaW7GtYxcG
         UL630f/S2cbpuXpwFKtu16TIkDhXv+KlFLuvYfd8/sik+Y6oqSWkIzSB3qVFyTNDpuAQ
         gr0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXIms9erHJ753eOlQongQMYuHjEUghzPXBPrcbeFkyVI2dYSLvGEMRzrCjL06zzeS06TtEm0BMBY2zImJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMC2xmU20yWTLVTDR3O8edrV1pP13rmFs6if/w7qJSu3Fd0HmY
	/Wap2e1j2QMNEDhwdNaMvPBRaaPWWDnn/QsW12qmzqMIDpcXIBEnNiYkPndJG9k678QLRpNqWUu
	Feg==
X-Google-Smtp-Source: AGHT+IGb9i/RjgaxU2Do5EdMDxGsLuUKqdWEfvBOiP/9SNprmTPZMIPFWsiljfHIcPA5/tG9Kzn3dZaCecg=
X-Received: from pfbfq2.prod.google.com ([2002:a05:6a00:60c2:b0:739:45ba:a49a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:b89:b0:736:34a2:8a20
 with SMTP id d2e1a72fcca58-73bd12c9e39mr4023128b3a.21.1744379396163; Fri, 11
 Apr 2025 06:49:56 -0700 (PDT)
Date: Fri, 11 Apr 2025 06:49:54 -0700
In-Reply-To: <20250411094059.GIZ_jjq0DxLhJOEQ9B@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241204134345.189041-1-davydov-max@yandex-team.ru>
 <20241204134345.189041-2-davydov-max@yandex-team.ru> <20250411094059.GIZ_jjq0DxLhJOEQ9B@fat_crate.local>
Message-ID: <Z_keAsy09KU0kDFj@google.com>
Subject: Re: [PATCH v3 1/2] x86: KVM: Advertise FSRS and FSRC on AMD to userspace
From: Sean Christopherson <seanjc@google.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Maksim Davydov <davydov-max@yandex-team.ru>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, x86@kernel.org, babu.moger@amd.com, 
	mingo@redhat.com, tglx@linutronix.de, dave.hansen@linux.intel.com, 
	hpa@zytor.com, jmattson@google.com, pbonzini@redhat.com
Content-Type: text/plain; charset="us-ascii"

On Fri, Apr 11, 2025, Borislav Petkov wrote:
> On Wed, Dec 04, 2024 at 04:43:44PM +0300, Maksim Davydov wrote:
> > diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
> > index 17b6590748c0..45f87a026bba 100644
> > --- a/arch/x86/include/asm/cpufeatures.h
> > +++ b/arch/x86/include/asm/cpufeatures.h
> > @@ -460,6 +460,8 @@
> >  #define X86_FEATURE_NULL_SEL_CLR_BASE	(20*32+ 6) /* Null Selector Clears Base */
> >  #define X86_FEATURE_AUTOIBRS		(20*32+ 8) /* Automatic IBRS */
> >  #define X86_FEATURE_NO_SMM_CTL_MSR	(20*32+ 9) /* SMM_CTL MSR is not present */
> > +#define X86_FEATURE_AMD_FSRS	        (20*32+10) /* AMD Fast short REP STOSB supported */
> > +#define X86_FEATURE_AMD_FSRC		(20*32+11) /* AMD Fast short REP CMPSB supported */
> 
> Since Intel has the same flags, you should do
> 
> 	if (cpu_has(c, X86_FEATURE_AMD_FSRS))
> 		set_cpu_cap(c, X86_FEATURE_FSRS);
> 
> and the other one too. Probably in init_amd() so that guest userspace doesn't
> need to differentiate between the two and you don't have to do...
> 
> >  #define X86_FEATURE_SBPB		(20*32+27) /* Selective Branch Prediction Barrier */
> >  #define X86_FEATURE_IBPB_BRTYPE		(20*32+28) /* MSR_PRED_CMD[IBPB] flushes all branch type predictions */
> > diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
> > index 097bdc022d0f..7bc095add8ee 100644
> > --- a/arch/x86/kvm/cpuid.c
> > +++ b/arch/x86/kvm/cpuid.c
> > @@ -799,8 +799,8 @@ void kvm_set_cpu_caps(void)
> >  
> >  	kvm_cpu_cap_mask(CPUID_8000_0021_EAX,
> >  		F(NO_NESTED_DATA_BP) | F(LFENCE_RDTSC) | 0 /* SmmPgCfgLock */ |
> > -		F(NULL_SEL_CLR_BASE) | F(AUTOIBRS) | 0 /* PrefetchCtlMsr */ |
> > -		F(WRMSR_XX_BASE_NS)
> > +		F(NULL_SEL_CLR_BASE) | F(AUTOIBRS) | F(AMD_FSRS) |
> > +		F(AMD_FSRC) | 0 /* PrefetchCtlMsr */ | F(WRMSR_XX_BASE_NS)
> 
> ... this.

KVM should still explicitly advertise support for AMD's flavor.  There are KVM
use cases where KVM's advertised CPUID support is used almost verbatim, in which
case not advertising AMD_FSRC would result it the features not be enumerated to
the guest.  Linux might cross-pollinate, but KVM can't rely on all software to do
so.
