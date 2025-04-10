Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A018E1EB9E8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744299952; cv=none; b=J2M54IQtHN3Xe4B9eFL04U5Lq8R1zFEYlCyBO21KYbyMCbhzDaAcFvDNcWUD+vrsPpSHbft4v6bIWOVtczdIapTTISDdH7BdC2bmmyT4yhyzl0BPu1NdgGgUgpRU/FFE8Zp5BHp7jPmeP0/YynLg0EJN7CM2nZx2euV4ZknUFl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744299952; c=relaxed/simple;
	bh=hLbfVy6MGSyYSuQDq4K6wAOKO0lEFzAf3CuTzYRU6rY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=D7PYJwgyt9tNYjJOnyQKSbWFKkFWsVgheOXP8CVNuc8xqz7EUx40PhMw72Oee9DXErTiw15/QQrxaRshRirPEuC21qxXM5gXbuAKXerdeJCmox+rSZbip0xFzaRKzJ+QDLz4w/5p/h0AYIkrh1xFAknY2xfakLVZNOyAFalE608=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zqX1/xpU; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zqX1/xpU"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff605a7a43so1249615a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744299950; x=1744904750; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mJmeJjTQ0N1mLS0S8FtWMDsHRzNfkH/EIVPnKYJbkdE=;
        b=zqX1/xpULW5UVpXrfLj1IJS6JNni5Mj1eLmhohcBQgL5bRSSKq8MoIwGvDxdSP/Vq2
         K8rA+3sEpsOmoIh00b2Nb3l1k7LVsHLxGQ/bds9Fv/VGu8AexCvv5X3Vp0+2uDC8wX0c
         0LDi03iF4HQRzij7U05pKyNkf3vnfKZDotSvjQ2Rx8sbaRQp11TaZoN3KQEShCYlis9R
         Lbuim/k6XTFcReZJQKFGCFUZiJl04kG4nKc1W/NlHj+Fr5FZRxgBwK7SCiIiS5t3KtxF
         0sjDgRyrzW73d4hhnZP9GL3xgr0bZZM9uhrnY4BPBugWuj87/OIhT4JJ+KFXc4sMB7Wl
         3dmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744299950; x=1744904750;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mJmeJjTQ0N1mLS0S8FtWMDsHRzNfkH/EIVPnKYJbkdE=;
        b=rm4nIU92CDmVJSoV2QtxguDsaOdy5jsnH56TvXLs9eJU50ibYUKCGF7N8Z5GWUkZ2m
         J6CR4fT5m/UpoHsk5O8p0bXaMVRZwH2NeWsbjVuZ1q5dagJvlHpfREyrRnRj3xvFjzdA
         O+4VkHDOAtHq7fTgBEePUKdHEof5Jw1liTXXtxcXwgQzlkMOq17jagezKwbMif7lRuFb
         l4nV/CU3L5Rv4Au32Vp6VSe+aS20LGQXFNMWkW3QR1xRLWPtsrT98ryVWGiOlkir7x8Y
         zzr/7O/zwbTfww43aEh0GzU5Z25OfyrOSBbwOXGaod0iunR3Vk4ZDM+vcyS/q511NYD5
         MJdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSWx/j6oPY12Oz3Pa40IqCwsQcCNjGyLfrDouHD1ILqpQwCyAE1LdNkLV8Eh0wAxHe2kjrhF1DyzEkbIw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPV6taHwHHsW/WqXSu4GEOAq+x20VA1Orvl6UmiF+PRkN6yljp
	xv62bszdUsXUbFuHxNULCdnl718vSHRKEiQSdQn1PNPDUKNH1mP1PFA1MJnclrNprCHTMVV4LXa
	aTA==
X-Google-Smtp-Source: AGHT+IFZ8WC+GSwj6Q6htW5cg/5bqXMTsujFZ73t+Q6ijGyOQ52YfigVgDbVZDUVXqIuS8GOZzkMgi1gkXg=
X-Received: from pjbta11.prod.google.com ([2002:a17:90b:4ecb:b0:2fc:c98:ea47])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:6c6:b0:2ee:7411:ca99
 with SMTP id 98e67ed59e1d1-30718b64bb2mr4620267a91.1.1744299949966; Thu, 10
 Apr 2025 08:45:49 -0700 (PDT)
Date: Thu, 10 Apr 2025 08:45:48 -0700
In-Reply-To: <9b7ceea3-8c47-4383-ad9c-1a9bbdc9044a@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com> <20250404193923.1413163-65-seanjc@google.com>
 <9b7ceea3-8c47-4383-ad9c-1a9bbdc9044a@oracle.com>
Message-ID: <Z_fnrP4e77mKjdX9@google.com>
Subject: Re: [PATCH 64/67] iommu/amd: KVM: SVM: Allow KVM to control need for
 GA log interrupts
From: Sean Christopherson <seanjc@google.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, David Matlack <dmatlack@google.com>, 
	Alejandro Jimenez <alejandro.j.jimenez@oracle.com>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Apr 09, 2025, Joao Martins wrote:
> On 04/04/2025 20:39, Sean Christopherson wrote:
> I would suggest holding off on this and the next one, while progressing with
> the rest of the series.

Agreed, though I think there's a "pure win" alternative that can be safely
implemented (but it definitely should be done separately).

If HLT-exiting is disabled for the VM, and the VM doesn't have access to the
various paravirtual features that can put it into a synthetic HLT state (PV async
#PF and/or Xen support), then I'm pretty sure GALogIntr can be disabled entirely,
i.e. disabled during the initial irq_set_vcpu_affinity() and never enabled.  KVM
doesn't emulate HLT via its full emulator for AMD (just non-unrestricted Intel
guests), so I'm pretty sure there would be no need for KVM to ever wake a vCPU in
response to a device interrupt.

> > diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
> > index 2e016b98fa1b..27b03e718980 100644
> > --- a/drivers/iommu/amd/iommu.c
> > +++ b/drivers/iommu/amd/iommu.c
> > -static void __amd_iommu_update_ga(struct irte_ga *entry, int cpu)
> > +static void __amd_iommu_update_ga(struct irte_ga *entry, int cpu,
> > +				  bool ga_log_intr)
> >  {
> >  	if (cpu >= 0) {
> >  		entry->lo.fields_vapic.destination =
> > @@ -3783,12 +3784,14 @@ static void __amd_iommu_update_ga(struct irte_ga *entry, int cpu)
> >  		entry->hi.fields.destination =
> >  					APICID_TO_IRTE_DEST_HI(cpu);
> >  		entry->lo.fields_vapic.is_run = true;
> > +		entry->lo.fields_vapic.ga_log_intr = false;
> >  	} else {
> >  		entry->lo.fields_vapic.is_run = false;
> > +		entry->lo.fields_vapic.ga_log_intr = ga_log_intr;
> >  	}
> >  }
> >
> 
> isRun, Destination and GATag are not cached. Quoting the update from a few years
> back (page 93 of IOMMU spec dated Feb 2025):
> 
> | When virtual interrupts are enabled by setting MMIO Offset 0018h[GAEn] and
> | IRTE[GuestMode=1], IRTE[IsRun], IRTE[Destination], and if present IRTE[GATag],
> | are not cached by the IOMMU. Modifications to these fields do not require an
> | invalidation of the Interrupt Remapping Table.

Ooh, that's super helpful info.  Any objections to me adding verbose comments to
explain the effective rules for amd_iommu_update_ga()?

> This is the reason we were able to get rid of the IOMMU invalidation in
> amd_iommu_update_ga() ... which sped up vmexit/vmenter flow with iommu avic.
> Besides the lock contention that was observed at the time, we were seeing stalls
> in this path with enough vCPUs IIRC; CCing Alejandro to keep me honest.
> 
> Now this change above is incorrect as is and to make it correct: you will need
> xor with the previous content of the IRTE::ga_log_intr and then if it changes
> then you re-add back an invalidation command via
> iommu_flush_irt_and_complete()). The latter is what I am worried will
> reintroduce these above problem :(

Ya, the need to flush definitely changes things.

> The invalidation command (which has a completion barrier to serialize
> invalidation execution) takes some time in h/w, and will make all your vcpus
> content on the irq table lock (as is). Even assuming you somehow move the
> invalidation outside the lock, you will content on the iommu lock (for the
> command queue) or best case assuming no locks (which I am not sure it is
> possible) you will need to wait for the command to complete until you can
> progress forward with entering/exiting.
> 
> Unless the GALogIntr bit is somehow also not cached too which wouldn't need the
> invalidation command (which would be good news!). Adding Suravee/Vasant here.
> 
> It's a nice trick how you would leverage this in SVM, but do you have
> measurements that corroborate its introduction? How many unnecessary GALog
> entries were you able to avoid with this trick say on a workload that would
> exercise this (like netperf 1byte RR test that sleeps and wakes up a lot) ?

I didn't do any measurements; I assumed the opportunistic toggling of GALogIntr
would be "free".

There might be optimizations that could be done, but I think the better solution
is to simply disable GALogIntr when it's not needed.  That'd limit the benefits
to select setups, but trying to optimize IRQ bypass for VMs that are CPU-overcommited,
i.e. can't do native HLT, seems rather pointless.

> I should also mention that there's a different logic that is alternative to
> GALog (in Genoa or more recent), which is GAPPI support whereby an entry is
> generated but a more rare condition. Quoting the an excerpts below:
> 
> | This mode is enabled by setting MMIO Offset 0018h[GAPPIEn]=1. Under this
> | mode, guest interrupts (IRTE[GuestMode]=1) update the vAPIC backing page IRR
> | status as normal.
> 
> | In GAPPI mode, a GAPPI interrupt is generated if all of the guest IRR bits
> | were previously clear prior to the last IRR update. This indicates the new
> | interrupt is the first pending interrupt to the
> | vCPU. The GAPPI interrupt is used to signal Hypervisor software to schedule
> | one or more vCPUs to execute pending interrupts.
> 
> | Implementations may not be able to perfectly determine if all of the IRR bits
> | were previously clear prior to updating the vAPIC backing page to set IRR.
> | Spurious interrupts may be generated as a
> | result. Software must be designed to handle this possibility

I saw this as well.  I'm curious if enabling GAPPI mode affects IOMMU interrupt
delivery latency/throughput due to having to scrape the entire IRR.

> Page 99, "2.2.5.5 Guest APIC Physical Processor Interrupt",
> https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/specifications/48882_IOMMU.pdf
