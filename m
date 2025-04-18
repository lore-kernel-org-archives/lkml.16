Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16E8224228
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 18:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745001091; cv=none; b=e8q9pYqGs03+QV199jscWqJdocfINAMZigVaXz0k20NFDJYPDKVTfhz/Hdv2MDedXZ0uDWzk1z2r3Kw1ADg492pIAFyRuoU23fYIfOA4Pmy2wuHDxtoBMlX4/3QAXuA1i8gYjFFP13suADdzGSFm2ZecaZiDVDAEPFAdwl5EMJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745001091; c=relaxed/simple;
	bh=2taYhddMq9lQ/8Z3JTMNETe26ib85UWNUSe1GA+eGfo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Zn2Hf+gQLzhbmQfugEyyZ4uNg3/EpQxu9kFRbIIg5i4wGhX8DJbaOLLS/k7eBXwC3i4geMonQHhKWe2fMFVfcn3ZUyFvCnTHZ7I0nI2vfgGSTka15ZNIXLOGEC2V7B9PYzp7nD/H58vmterFXiJq2G6RhNalWjPC9QmeWT35YxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xqiS7Kwe; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xqiS7Kwe"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff6aaa18e8so1895385a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 11:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745001089; x=1745605889; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R7DfmVsirgcNwyXXhOnkR2OGGl5DWqAfaV1SkVbAhuI=;
        b=xqiS7Kwevj1HZKPQdCHxR6AxFzi02GraH7CH3PjQGrWLlxyYpez3TBP9Rt0s3fTDVI
         2oF9eMBi+M3XM4fA5WqH2LkQJvyhhE5fyXfzoZNYf0c7bmIOVwUDKIlvcFQJs02J+lXK
         aTU3V81XS71LVo4+n+24oRxujFUTQT0Fo3p0/ihmzMs1isfBN4Fv8Nx0caY3tMm5s05q
         Xl45VD71MUKr2ns5sKaaTpv/tniFTrsVEsALJPzdkjLShGGnFQD86c5pifaLpoNHem80
         Nqbt7r5zN3jDJkLRoYGslZlkhxX6ReH9g5HBrSw9hV36kOq7gxEbvXHxAGVUDoYdB0ET
         cdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745001089; x=1745605889;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R7DfmVsirgcNwyXXhOnkR2OGGl5DWqAfaV1SkVbAhuI=;
        b=ZmPyfz6B+o8HEHm6mv61eTzJt14rDwvKnqqsf3dK508qcrnqcgiywZscSCOoOBrRGa
         ovAAc3i6/PofZtJVXTVr0PGN54A807kv7zWD8C1qhF35VDVPs2iT418NfZUOv1fN65E5
         IhFhtltrAXeAcAnFM3r7XWRZWLyBR0Do2rqOL1HgVoTYTNVhZC/ebp7NAtESOph/eb9b
         oOyZcxdqU3GUtb70FEYFgGON6DlmQu03YR2VP29VF8BMWvjIRH42Q4zTEQPKRUHKSNMU
         TvY1IBsLUScczItujsc65dLqz7wQARcxuFmyIKxk/+6dS8TvytGByNabjkO+bz1j5AOx
         9Ubw==
X-Forwarded-Encrypted: i=1; AJvYcCUOqIgTeUskfVqEjrRJTQ8hjU/eYkguEv0XBVh2ubdH2P3o3lazuiZJ6Km9wOfd+0nhD5DDZ21QQ3QD7M8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTJduULNRh4MpmC7MEal4v07pA7RkxsF7iK/bGF8OV4xPMZ9B7
	W3VXHyvS+uOWJjxGts36PifRMyN9o/lQll1eMxWNyzSfoRz6LKAqDJLEP0CVE7TnKttgoCi4ywp
	ZTg==
X-Google-Smtp-Source: AGHT+IEpNnwFWShkgziIFpbN6+F14jL/9zInzy8RZBxLo+hx7H5u1bpirdSXSr81pJ98zQK1RP0G511Zo2w=
X-Received: from pjbcz8.prod.google.com ([2002:a17:90a:d448:b0:2fa:15aa:4d1e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:6ce:b0:2f6:dcc9:38e0
 with SMTP id 98e67ed59e1d1-3087ba51b57mr7146208a91.0.1745001089075; Fri, 18
 Apr 2025 11:31:29 -0700 (PDT)
Date: Fri, 18 Apr 2025 11:31:27 -0700
In-Reply-To: <20250418173643.GEaAKNq_1Nq9PAYf4_@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250331143710.1686600-1-sashal@kernel.org> <20250331143710.1686600-2-sashal@kernel.org>
 <aAKDyGpzNOCdGmN2@duo.ucw.cz> <aAKJkrQxp5on46nC@google.com> <20250418173643.GEaAKNq_1Nq9PAYf4_@fat_crate.local>
Message-ID: <aAKaf1liTsIA81r_@google.com>
Subject: Re: [PATCH AUTOSEL 5.10 2/6] x86/cpu: Don't clear X86_FEATURE_LAHF_LM
 flag in init_amd_k8() on AMD when running in a virtual machine
From: Sean Christopherson <seanjc@google.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Pavel Machek <pavel@denx.de>, Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Max Grobecker <max@grobecker.info>, Ingo Molnar <mingo@kernel.org>, 
	tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com, 
	x86@kernel.org, thomas.lendacky@amd.com, perry.yuan@amd.com, 
	mario.limonciello@amd.com, riel@surriel.com, mjguzik@gmail.com, 
	darwi@linutronix.de
Content-Type: text/plain; charset="us-ascii"

On Fri, Apr 18, 2025, Borislav Petkov wrote:
> On Fri, Apr 18, 2025 at 10:19:14AM -0700, Sean Christopherson wrote:
> > Uh, and the hypervisor too?  Why is the hypervisor enumerating an old K8 CPU for
> > what appears to be a modern workload?
> > 
> > > I'd say this is not good stable candidate.
> > 
> > Eh, practically speaking, there's no chance of this causing problems.  The setup
> > is all kinds of weird, but AIUI, K8 CPUs don't support virtualization so there's
> > no chance that the underlying CPU is actually affected by the K8 bug, because the
> > underlying CPU can't be K8.  And no bare metal CPU will ever set the HYPERVISOR
> > bit, so there won't be false positives on that front.
> > 
> > I personally object to the patch itself; it's not the kernel's responsibility to
> > deal with a misconfigured VM.  But unless we revert the commit, I don't see any
> > reason to withhold this from stable@.
> 
> I objected back then but it is some obscure VM migration madness (pasting the
> whole reply here because it didn't land on any ML):
> 
> Date: Tue,  17 Dec 2024 21:32:21 +0100
> From: Max Grobecker <max@grobecker.info>
> To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
>  Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Max Grobecker <max@grobecker.info>, x86@kernel.org
> Subject: Re: [PATCH v2] Don't clear X86_FEATURE_LAHF_LM flag in init_amd_k8()
>  on AMD when running in a virtual machine
> Message-ID: <d77caeea-b922-4bf5-8349-4b5acab4d2eb>
> MIME-Version: 1.0
> Content-Transfer-Encoding: 8bit
> Content-Type: text/plain; charset=utf-8
> 
> Hi,
> 
> sorry for my late response, was hit by a flu last days.
> 
> On Tue, 10 Dec 2024 13:51:50 +0100, Borislav Petkov wrote:
> > Lemme get this straight: you - I don't know who "we" is - are running K8
> > models in guests? Why?
> 
> Oh, I see, I missed to explain that, indeed.
> 
> This error happens, when I start a virtual machine using libvirt/QEMU while 
> not passing through the host CPU. I do this, because I want to be 
> able to live-migrate the VM between hosts, that have slightly different CPUs.
> Migration works, but only if I choose the generic "kvm64" CPU preset to be
> used with QEMU using the "-cpu kvm64" parameter:
>  
>   qemu-system-x86_64 -cpu kvm64
>  
> I also explicitly enabled additional features like SSE4.1 or AXV2 to have as
> most features as I can but still being able to do live-migration between hosts.
>   
> By using this config, the CPU is identified as "Common KVM processor"
> inside the VM:
> 
>   processor       : 0
>   vendor_id       : AuthenticAMD
>   cpu family      : 15
>   model           : 6
>   model name      : Common KVM processor
> 
> Also, the model reads as 0x06, which is set by that kvm64 CPU preset,
> but usually does not pose a problem.

IMO, this is blatantly a QEMU bug (I verified the behavior when using "kvm64" on AMD).
As per QEMU commit d1cd4bf419 ("introduce kvm64 CPU"), the vendor + FMS enumerates
an Intel P4:

        .name = "kvm64",
        .level = 0xd,
        .vendor = CPUID_VENDOR_INTEL,
        .family = 15,
        .model = 6,

Per x86_cpu_load_model(), QEMU overrides the vendor when using KVM (at a glance,
I can't find the code that actually overrides the vendor, gotta love QEMU's object
model):

    /*
     * vendor property is set here but then overloaded with the
     * host cpu vendor for KVM and HVF.
     */
    object_property_set_str(OBJECT(cpu), "vendor", def->vendor, &error_abort);

Overriding the vendor but using Intel's P4 FMS is flat out wrong.  IMO, QEMU
should use the same FMS as qemu64 for kvm64 when running on AMD.

        .name = "qemu64",
        .level = 0xd,
        .vendor = CPUID_VENDOR_AMD,
        .family = 15,
        .model = 107,
        .stepping = 1,

Yeah, scraping FMS information is a bad idea, but what QEMU is doing is arguably
far worse.

> The original vendor id of the host CPU is still visible to the guest, and in
> case the host uses an AMD CPU the combination of "AuthenticAMD" and model 0x06
> triggers the bug and the lahf_lm flag vanishes.
> If the guest is running with the same settings on an Intel CPU and therefore 
> reads "GenuineIntel" as the vendor string, the model is still 0x06, but also 
> the lahf_lm flag is still listed in /proc/cpuinfo.
> 
> The CPU is mistakenly identified to be an AMD K8 model, while, in fact, nearly
> all features a modern Epyc or Xeon CPU is offering, are available.

