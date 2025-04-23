Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5443426D4D4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745417420; cv=none; b=SpPOzHv98WR6vG37R4hWhmDHKwTBXmaxPtZPLG+PQO6k1nQjyq3YTV8+axn6BDx9/HBa2t11mzHwUmT1EuoGa4nCImtmcp51Yc4ESCT6agNBq/KUFgZXjJIRTBo/29rBd4MmIT9bfaJkAcTwJZSTY2/PQPHFGErnfXatYhtrmZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745417420; c=relaxed/simple;
	bh=Dz89GFlN2JljQrIc14AWHN1O2IwJFShFDlgptdkGrjs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ALBRDhAHpaNIa50psUekbfVjKQuAsTPj5uENJZ0gaS9TCBYk3IxOvlGQj4sssaFN52qsZrcIvghtqcO9ugXhpq7bHg+H5fS7fH94kHAu/vIdfRnl8EOOtCWixnV72osI+ldeHA44MJf1OpICPdsTIRxZY9XNvVwPl+qjj+Aolok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S+2I8o4R; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S+2I8o4R"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3032f4eca83so5792012a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745417418; x=1746022218; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JRPtkANxs/lxTlYEyf3yKr1v4372m0NJkPrJwTq5HVg=;
        b=S+2I8o4RHeGcNjW/wa0UHw5nIRfngDWFZTdIxsu8rQ4ZaDzsiVvMLcSUaiCVr0jn//
         aH+zQxS8XQgk3EFWI2mUD6YqX9GVK+g9LNzyfxr7LAej19LDYD8FOxzVhdXU6TbALyEC
         n8W1SoSbA6F8WKicjqAbiEcdKRGB3fAHA6BdiUxhwj3wVhWFVFBuV69RJI6EUDpRO6eD
         wTAqlbdF8nWRqtXVvRAvFj+MPZVRIUDk/LwKceL1vNazRSS9D1EN4f2sY+RCdrjO7M80
         A+R12MKTU+mr3UnpyA5dU10GceNj5f6GozPtRjLG3BPNg6Q3Ezr/j1wXKn8y6CoCNUVv
         Tbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745417418; x=1746022218;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JRPtkANxs/lxTlYEyf3yKr1v4372m0NJkPrJwTq5HVg=;
        b=hPgK5OC7JZt9oT8kAV1/iPwzuatTr3JTFWibiu/N6JfGeFo24GO0FVfXvt3Vj+k/pZ
         2iUSiOjM2IgoaMjQdxuxpJVEfheh7G91FjN3WuVZrFysVi7/wcqdZkptCL/rcDb0ldPC
         95AO+3y10N1Hqv+DEyKNy2UqnHiywHp8RjWZIVbYudXkzT03ChhBcKe5ia+JlesGkFQ4
         LDR1JMAXpwX/5rSGDQkB8X36BQHEpPJBgCTiTDLei/bkvEIxQUWIInMal+mMjEvVsTpD
         4GOryJXBrDJZiVtA37Bu+1qPEHvpoeqntVPRA3sH6BDfm3OIymH1zJxlkzAmkuKJEAK6
         m3+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVu69paMTm+ucwt+lMz35BgPaQhZxI/OY3XU3QRSYJWQw4ur9aaCD5EyNuTnzDtVzm/2OhH+q6jEPL3Ut0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGGZQd/86pN+SmfDphRAh8BHVO4m1fSb31Yzx4e+HyHgeP9SPJ
	0J/stDWm1LxiHzCrYXuCbwLwMZUAmFeSzYNUMAu4R+M3e3Q4ogz0w0HxBxI8ns54JpfSujUG0II
	Ngw==
X-Google-Smtp-Source: AGHT+IGP6Lom1BPKavrHj+L/hYk1rz8ce5XJ1ZecFXItOld7t2WKEYU5e7ilQVFK+tWjHPvfJX12j9p9nXY=
X-Received: from pjbqd3.prod.google.com ([2002:a17:90b:3cc3:b0:2ff:6e58:8a0a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3146:b0:2ee:e113:815d
 with SMTP id 98e67ed59e1d1-3087bb5341amr27709612a91.8.1745417418541; Wed, 23
 Apr 2025 07:10:18 -0700 (PDT)
Date: Wed, 23 Apr 2025 07:10:17 -0700
In-Reply-To: <20250423072017.GAaAiUsYzDOdt7cmp2@renoirsky.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250331143710.1686600-2-sashal@kernel.org> <aAKDyGpzNOCdGmN2@duo.ucw.cz>
 <aAKJkrQxp5on46nC@google.com> <20250418173643.GEaAKNq_1Nq9PAYf4_@fat_crate.local>
 <aAKaf1liTsIA81r_@google.com> <20250418191224.GFaAKkGBnb01tGUVhW@fat_crate.local>
 <aAfQbiqp_yIV3OOC@google.com> <20250422173355.GDaAfTA8GqnGBfDk7G@renoirsky.local>
 <aAfynEK3wcfQa1qQ@google.com> <20250423072017.GAaAiUsYzDOdt7cmp2@renoirsky.local>
Message-ID: <aAj0ySpCnHf_SX2J@google.com>
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
> > Eww.  Optimization to lessen the pain of DR7 interception.  It'd be nice to clean
> > this up at some point, especially with things like SEV-ES with DebugSwap, where
> > DR7 is never intercepted.
> >   arch/x86/include/asm/debugreg.h:        if (static_cpu_has(X86_FEATURE_HYPERVISOR) && !hw_breakpoint_active())
> >   arch/x86/kernel/hw_breakpoint.c:                 * When in guest (X86_FEATURE_HYPERVISOR), local_db_save()
> 
> Patch adding it says "Because DRn access is 'difficult' with virt;..."
> so yeah. I guess we need to agree how to do debug exceptions in guests.
> Probably start documenting it and then have guest and host adhere to
> that. I'm talking completely without having looked at what the code does
> but the "handshake" agreement should be something like this and then we
> can start simplifying code...

I don't know that we'll be able to simplify the code.

#DBs in the guest are complex because DR[0-3] aren't context switched by hardware,
and running with active breakpoints is uncommon.  As a result, loading the guest's
DRs into hardware on every VM-Enter is undesirable, because it would add significant
latency (load DRs on entry, save DRs on exit) for a relatively rare situation
(guest has active breakpoints).

KVM (and presumably other hypervisors) intercepts DR accesses so that it can
detect when the guest has active breakpoints (DR7 bits enabled), at which point
KVM does load the guest's DRs into hardware and disables DR interception until
the next VM-Exit.

KVM also allows the host user to utilize hardware breakpoints to debug the guest,
which further adds to the madness, and that's not something the guest can change
or even influence.

So removing the "am I guest logic" entirely probably isn't feasible, because in
the common case where there are no active breakpoints, reading cpu_dr7 instead
of DR7 is a significant performance boost for "normal" VMs.

I mentioned SEV-ES+ DebugSwap because in that case DR7 is effectively guaranteed
to not be intercepted, and so the native behavior of reading DR7 instead of the
per-CPU variable is likely desirable.  I believe TDX has similar functionality
(I forget if it's always on, or opt-in).
