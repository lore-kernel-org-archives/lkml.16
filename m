Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900F018FC86
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 19:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745522334; cv=none; b=rzlaVkHabtO8pXDn9OM5VQHpqgd+cc8Qlfqn8VdU81tmFX466czHgVVtjCdt63v+4iXYGrzylngL4qCcDp3ikv/KNWtwyYNvjFGDuaLxfaz3ANZ0MWu/K0SjyN1qvFfXvESu0pmGQuHKdVX43KnxIthtHJqUScENBUeezK5KXmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745522334; c=relaxed/simple;
	bh=CNqJAhaPW3biEFXxsysRoh2Kl5MnjeIup+Zj4mxMEr0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PK0cXfDy7Op6jS7MNI0WUVll9Bpd5/e3+sh5Fc+ZmoiT6HKwbdSL79zX/WfztmEn3lMarodElx8qnZSvV4BI7WqiUtP6Kpx7fsyo6uY5VQCdwIkkm5cir52CQRIuVmMe8P0LA3ae2WtroeljZmuSaH8dSI12LQJ7EDgFn4tj/RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uXg1sazt; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uXg1sazt"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-306b51e30ffso1245703a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745522332; x=1746127132; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=70v12mDUmlFvJZJFlpkmDmUBkvzpwiKi4qrZR0uczEU=;
        b=uXg1sazt9+2xbjAZ2Hr1ytV4srDzdmc8OnwqWgBAflsVcChqzzO3i+qn6eOztuuOmF
         J/6fNd+nXq7XT58oVrUzj43ZSoMQ+OP6w/lggmXrlpjFRm7SlvH21jR/bFfR2dxT2ou7
         Ia8FGyOTEvCJjli+jMlIgMxl99vC5OkyjZhkC/Tl2fkCXmCBiZf13EYz+gVtoRprLosa
         t8xicuGRL3YY1XikwszAUNfvsaxMmLcYvIfe4W1lhxq5WoZ91cqxc/D9draz0rmMbTck
         SoKgIr2MEJc8hEoYRFa/HiTHJHSdqepdBYZTMZeClXans7jF7m4jXMP6wHB8fxOAwKi9
         H05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745522332; x=1746127132;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=70v12mDUmlFvJZJFlpkmDmUBkvzpwiKi4qrZR0uczEU=;
        b=Sztq/33tc2Yt17EIZSVXRGDEfhyu10Ub9aVq4g5AOCcRV6jPwksQbhQqv7GjbrGNub
         jm6MpdHERHiU5gmq4Lc9qHz13BSnKrcF/F0odyWSRbckyZyFy/JHCgqf00ZoLAoA/3xm
         6MpUlaNAk/Kr229Prm2aDkuA5OC/fOOuY/g5+shjKPBiaAjBbn451PYCbuW+tuHiBDk5
         gZhPzO/JHWCUhvBU++iaGZ8z8ZOmB2BVfc20a8bPvlJIJdSXcYtqPeben9eqHR+zmAqy
         4yHqoIKj5BLQjKYfMcCCqc0jIYQ2m6rfwoh+7bUef0mv3LmR1Y2tsZTo/sdOJpX2f0b8
         bwOg==
X-Forwarded-Encrypted: i=1; AJvYcCUnIq1Nuao9+5b9IMMcx5lfH4kt6jWJ/eCZ5Uq9N2lIAVXQYPwsPkLpnq4BLnENt1aDYUBWC90foDKGLao=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHAusr1Lq2O0N3B/sdC3dm9ypHQK41LZYzylemz5G/UcXxRTAU
	zO7I+B6BvVoDF2vUK10Iub7yf425HTuYBiLwIMX4RQ2elRI6NeYuwMwctsP2f1uYAXlSgKlzdxu
	Xmw==
X-Google-Smtp-Source: AGHT+IFt+KQNer0HsT1+wyzNJuRXokrit8ZoX5QLwZzULjrNKOxXmFCFh9efFkgrYlVR68PULGJxjztoj4U=
X-Received: from pjtu6.prod.google.com ([2002:a17:90a:c886:b0:2ef:d283:5089])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:50cf:b0:2ff:6e72:b8e9
 with SMTP id 98e67ed59e1d1-309f56b55cfmr1082807a91.25.1745522331596; Thu, 24
 Apr 2025 12:18:51 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:18:50 -0700
In-Reply-To: <20250423184326.GCaAk0zinljkNHa_M7@renoirsky.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aAKJkrQxp5on46nC@google.com> <20250418173643.GEaAKNq_1Nq9PAYf4_@fat_crate.local>
 <aAKaf1liTsIA81r_@google.com> <20250418191224.GFaAKkGBnb01tGUVhW@fat_crate.local>
 <aAfQbiqp_yIV3OOC@google.com> <20250422173355.GDaAfTA8GqnGBfDk7G@renoirsky.local>
 <aAfynEK3wcfQa1qQ@google.com> <20250423072017.GAaAiUsYzDOdt7cmp2@renoirsky.local>
 <aAj0ySpCnHf_SX2J@google.com> <20250423184326.GCaAk0zinljkNHa_M7@renoirsky.local>
Message-ID: <aAqOmjQ_bNy8NhDh@google.com>
Subject: Re: CONFIG_X86_HYPERVISOR (was: Re: [PATCH AUTOSEL 5.10 2/6] x86/cpu:
 Don't clear X86_FEATURE_LAHF_LM flag in init_amd_k8() on AMD when running in
 a virtual machine)
From: Sean Christopherson <seanjc@google.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Pavel Machek <pavel@denx.de>, Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Max Grobecker <max@grobecker.info>, Ingo Molnar <mingo@kernel.org>, 
	tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com, 
	x86@kernel.org, thomas.lendacky@amd.com, perry.yuan@amd.com, 
	mario.limonciello@amd.com, riel@surriel.com, mjguzik@gmail.com, 
	darwi@linutronix.de, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Apr 23, 2025, Borislav Petkov wrote:
> On Wed, Apr 23, 2025 at 07:10:17AM -0700, Sean Christopherson wrote:
> > On Wed, Apr 23, 2025, Borislav Petkov wrote:
> > > > Eww.  Optimization to lessen the pain of DR7 interception.  It'd be nice to clean
> > > > this up at some point, especially with things like SEV-ES with DebugSwap, where
> > > > DR7 is never intercepted.
> > > >   arch/x86/include/asm/debugreg.h:        if (static_cpu_has(X86_FEATURE_HYPERVISOR) && !hw_breakpoint_active())
> > > >   arch/x86/kernel/hw_breakpoint.c:                 * When in guest (X86_FEATURE_HYPERVISOR), local_db_save()
> > > 
> > > Patch adding it says "Because DRn access is 'difficult' with virt;..."
> > > so yeah. I guess we need to agree how to do debug exceptions in guests.
> > > Probably start documenting it and then have guest and host adhere to
> > > that. I'm talking completely without having looked at what the code does
> > > but the "handshake" agreement should be something like this and then we
> > > can start simplifying code...
> > 
> > I don't know that we'll be able to simplify the code.
> > 
> > #DBs in the guest are complex because DR[0-3] aren't context switched by hardware,
> > and running with active breakpoints is uncommon.  As a result, loading the guest's
> > DRs into hardware on every VM-Enter is undesirable, because it would add significant
> > latency (load DRs on entry, save DRs on exit) for a relatively rare situation
> > (guest has active breakpoints).
> > 
> > KVM (and presumably other hypervisors) intercepts DR accesses so that it can
> > detect when the guest has active breakpoints (DR7 bits enabled), at which point
> > KVM does load the guest's DRs into hardware and disables DR interception until
> > the next VM-Exit.
> > 
> > KVM also allows the host user to utilize hardware breakpoints to debug the guest,
> > which further adds to the madness, and that's not something the guest can change
> > or even influence.
> > 
> > So removing the "am I guest logic" entirely probably isn't feasible, because in
> > the common case where there are no active breakpoints, reading cpu_dr7 instead
> > of DR7 is a significant performance boost for "normal" VMs.
> 
> So I see three modes:
> 
> - default off - the usual case
> 
> - host debugs the guest
> 
> - guests are allowed to do breakpoints

Not quite.  KVM supports all of those seamlessly, with some caveats.  E.g. if
host userspace and guest kernel are trying to use the same DRx, the guest will
"lose" and not get its #DBs.

> So depending on what is enabled, the code can behave properly - it just
> needs logic which tells the relevant code - guest or host - which of the
> debugging mode is enabled. And then everything adheres to that and DTRT.
> 
> But before any of that, the even more important question is: do we even
> care to beef it up that much?
> 
> I get the feeling that we don't so it likely is a "whatever's the
> easiest" game.

Definitely not.  All I was thinking was something like:

diff --git a/arch/x86/include/asm/debugreg.h b/arch/x86/include/asm/debugreg.h
index fdbbbfec745a..a218c5170ecd 100644
--- a/arch/x86/include/asm/debugreg.h
+++ b/arch/x86/include/asm/debugreg.h
@@ -121,7 +121,7 @@ static __always_inline unsigned long local_db_save(void)
 {
        unsigned long dr7;
 
-       if (static_cpu_has(X86_FEATURE_HYPERVISOR) && !hw_breakpoint_active())
+       if (static_cpu_has(X86_FEATURE_DRS_MAY_VMEXIT) && !hw_breakpoint_active())
                return 0;
 
        get_debugreg(dr7, 7);

Where X86_FEATURE_DRS_MAY_VMEXIT is set if HYPERVISOR is detected, but then
cleared by SEV-ES+ and TDX guests with guaranteed access to DRs.  That said,
even that much infrastructure probably isn't worth the marginal benefits.
