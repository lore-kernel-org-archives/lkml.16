Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFA822D4C8
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 18:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745002139; cv=none; b=CIEuRaaADQXNzczoh330PdOEwEG+6F9A36x61cRjLap1uqeGNSzv8f3bW+V1YG8myemh5PeD/GqmdTi3I9wfJAaXUWhDSBkheEcIyj2RAPeWn1RuYCbgCjrFp8lccXEWZCaQBMwNcwuDItLIMETlVcPMVW8ymEeUJ1EmgO2froI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745002139; c=relaxed/simple;
	bh=3hFHVCH/LSWkX/1hI67EpjUwLrt7a4GRNIrV0jEJhpU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ha8y/hfe2eVSRgoGNulzW8u9AuGuYMRrrQOflY3DYAXzGN/f1L8e9pU5ANEWLhwT9G4Hkx6Iwoe55+DZI4h0aE905pecNMIbvOAHgUqaK/KNCrdyg1Vb1vr0C2P8k0T33dHsCWdKlvF0UltyuWb+rf/F5KHkwdPqBxJupD9QsT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zFKIFTar; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zFKIFTar"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff53a4754aso2954923a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 11:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745002136; x=1745606936; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+x9Lxq3Yb7pPGy5apTwGt4q+FQztFDiQizHj9SEUEtM=;
        b=zFKIFTarroyNeR5WVGhZOFLsMo2iQ/LmJ1VniVCF33qRQ1JC3BqHDNHV6bQs9/a0Ks
         ziuR4UIJDuDcUr1T79H1MdfII05njvZmnUtQpZzkSn5C9g82sRSdU/Te3a4YUJN5zHJw
         D3aCQHqfnr0wRHnsmLQ4oQ1FchmZu+Xeh88/qfhaw6UGIg8mNko5DN8Q0j28+H32K2+8
         62YbEH17IkT2VehlqR5rRXHJCV5oOZ1jIntTLVyOu+1GrlfBumkFqw9QZEUs1AvpCWaF
         pTGWWW+9rlxVv6y0O16MwX8CAzj/3F5wmCFsvDRhiYkSgXo5EbTOIk0pt8U4gYHoEalZ
         X0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745002136; x=1745606936;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+x9Lxq3Yb7pPGy5apTwGt4q+FQztFDiQizHj9SEUEtM=;
        b=cjrmEswTyyd8Te5NHUUqcuJIDOxM+2eV/c7b+ml1MMLdprUz1QxqrLCouACw6rtcNP
         9BBOvHvYkR7dYr5nInawbSSHN0dtIZMDRx9Llq3YUr9JmkT1wvl4DhlqMazz0d9b2/ef
         ZtvHOJGVn39n9r7pjde7LDBXfIcMm8OTBHShoqtj5Flzuz8t/m/NDQ2JppOHmev9InNI
         EL9+zKLAj2ITJUM04BN2GpGzd1zrdQVE5wt8/XZ+pvk2APdh6X/HejPvswC1bikxp7YZ
         4w0SGUsU5BRthjL8cyYZ8DNfMado/M5DZMeWbbqoGQJxZnPgbntZ+jbd6pN5lBapVePg
         CJjA==
X-Forwarded-Encrypted: i=1; AJvYcCWUcTRyM+b5C8LdxhloUSiJ0Cup2P7QlEit40r+hxMfGGeo9wGdbb4T5zjeSe2C/3GF19S+9TWt5U5R6Ew=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy46C4iaWWbjAiSlo8ZML8UzbbaJ2eV3qawRD85tgnC7A3z7cSZ
	EQMeDCs9OaVNVup4HSFdTyxQut52ozDHuzhniV3em/v8oMWUEsygB0orOW1E+nYxzYPIEz26kZI
	0UQ==
X-Google-Smtp-Source: AGHT+IGSyr2LRk6VhnTriDa7+tSPfCLWBhwIYOevbNOyXjtktTdUxdthxm1hNnO/WkoYJSHcy3iTUadsjtQ=
X-Received: from pjuu12.prod.google.com ([2002:a17:90b:586c:b0:2fc:1356:bcc3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:498f:b0:2ee:d193:f3d5
 with SMTP id 98e67ed59e1d1-3087bb39613mr6019007a91.7.1745002136616; Fri, 18
 Apr 2025 11:48:56 -0700 (PDT)
Date: Fri, 18 Apr 2025 11:48:54 -0700
In-Reply-To: <b29b8c22-2fd4-4b5e-b755-9198874157c7@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com> <20250404193923.1413163-65-seanjc@google.com>
 <9b7ceea3-8c47-4383-ad9c-1a9bbdc9044a@oracle.com> <b29b8c22-2fd4-4b5e-b755-9198874157c7@amd.com>
Message-ID: <aAKelotoUX3qCINt@google.com>
Subject: Re: [PATCH 64/67] iommu/amd: KVM: SVM: Allow KVM to control need for
 GA log interrupts
From: Sean Christopherson <seanjc@google.com>
To: Vasant Hegde <vasant.hegde@amd.com>
Cc: Joao Martins <joao.m.martins@oracle.com>, kvm@vger.kernel.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Maxim Levitsky <mlevitsk@redhat.com>, 
	David Matlack <dmatlack@google.com>, Alejandro Jimenez <alejandro.j.jimenez@oracle.com>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Apr 18, 2025, Vasant Hegde wrote:
> On 4/9/2025 5:26 PM, Joao Martins wrote:
> > On 04/04/2025 20:39, Sean Christopherson wrote:
> >> Add plumbing to the AMD IOMMU driver to allow KVM to control whether or
> >> not an IRTE is configured to generate GA log interrupts.  KVM only needs a
> >> notification if the target vCPU is blocking, so the vCPU can be awakened.
> >> If a vCPU is preempted or exits to userspace, KVM clears is_run, but will
> >> set the vCPU back to running when userspace does KVM_RUN and/or the vCPU
> >> task is scheduled back in, i.e. KVM doesn't need a notification.
> >>
> >> Unconditionally pass "true" in all KVM paths to isolate the IOMMU changes
> >> from the KVM changes insofar as possible.
> >>
> >> Opportunistically swap the ordering of parameters for amd_iommu_update_ga()
> >> so that the match amd_iommu_activate_guest_mode().
> > 
> > Unfortunately I think this patch and the next one might be riding on the
> > assumption that amd_iommu_update_ga() is always cheap :( -- see below.
> > 
> > I didn't spot anything else flawed in the series though, just this one. I would
> > suggest holding off on this and the next one, while progressing with the rest of
> > the series.
> > 
> >> diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
> >> index 2e016b98fa1b..27b03e718980 100644
> >> --- a/drivers/iommu/amd/iommu.c
> >> +++ b/drivers/iommu/amd/iommu.c
> >> -static void __amd_iommu_update_ga(struct irte_ga *entry, int cpu)
> >> +static void __amd_iommu_update_ga(struct irte_ga *entry, int cpu,
> >> +				  bool ga_log_intr)
> >>  {
> >>  	if (cpu >= 0) {
> >>  		entry->lo.fields_vapic.destination =
> >> @@ -3783,12 +3784,14 @@ static void __amd_iommu_update_ga(struct irte_ga *entry, int cpu)
> >>  		entry->hi.fields.destination =
> >>  					APICID_TO_IRTE_DEST_HI(cpu);
> >>  		entry->lo.fields_vapic.is_run = true;
> >> +		entry->lo.fields_vapic.ga_log_intr = false;
> >>  	} else {
> >>  		entry->lo.fields_vapic.is_run = false;
> >> +		entry->lo.fields_vapic.ga_log_intr = ga_log_intr;
> >>  	}
> >>  }
> >>
> > 
> > isRun, Destination and GATag are not cached. Quoting the update from a few years
> > back (page 93 of IOMMU spec dated Feb 2025):
> > 
> > | When virtual interrupts are enabled by setting MMIO Offset 0018h[GAEn] and
> > | IRTE[GuestMode=1], IRTE[IsRun], IRTE[Destination], and if present IRTE[GATag],
> > | are not cached by the IOMMU. Modifications to these fields do not require an
> > | invalidation of the Interrupt Remapping Table.
> > 
> > This is the reason we were able to get rid of the IOMMU invalidation in
> > amd_iommu_update_ga() ... which sped up vmexit/vmenter flow with iommu avic.
> > Besides the lock contention that was observed at the time, we were seeing stalls
> > in this path with enough vCPUs IIRC; CCing Alejandro to keep me honest.
> > 
> > Now this change above is incorrect as is and to make it correct: you will need
> > xor with the previous content of the IRTE::ga_log_intr and then if it changes
> > then you re-add back an invalidation command via
> > iommu_flush_irt_and_complete()). The latter is what I am worried will
> > reintroduce these above problem :(
> > 
> > The invalidation command (which has a completion barrier to serialize
> > invalidation execution) takes some time in h/w, and will make all your vcpus
> > content on the irq table lock (as is). Even assuming you somehow move the
> > invalidation outside the lock, you will content on the iommu lock (for the>
> command queue) or best case assuming no locks (which I am not sure it is
> > possible) you will need to wait for the command to complete until you can
> > progress forward with entering/exiting.
> > 
> > Unless the GALogIntr bit is somehow also not cached too which wouldn't need the
> > invalidation command (which would be good news!). Adding Suravee/Vasant here.
> 
> I have checked with HW architects. Its not cached. So we don't need invalidation
> after updating GALogIntr field in IRTE.

Woot!  Better to be lucky than good :-)
