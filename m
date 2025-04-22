Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6175E202990
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745315511; cv=none; b=eNtJtVg3l0CvW8C62xfiatvd63F3BzzoHvIC1aV1ZHKSqFYTR4Iaj1fmVCjK9rwEej3BZuEYrZZ4Wn/1J5N3JoYk1g2OEjDmWmGvdom34QUfe4Cz2cIC0yRQ7aHbT/i1LnzfEkfkwkAIltmUbmowPon5e65f0NaUT1RwCGnoen0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745315511; c=relaxed/simple;
	bh=h+BpaAZx7C/3ukXFARKI88HC/x55dJr5Lzyxor4ZJCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTscSr5NmlhjzrMYxe8E6P0bJFttnuzlVGUWcNNCKIqcmue1DY8TH9yFgzWu8c9bdGHixE/i3bb090iLGaUHbKQ4tpldW9IiVTIIJexqsO6k+nK2OdCpwkZC043/FCDzUGSh2IWx72AmvdYn2o46eq7cMYWWiK/iZDi8PXRIBx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UiVeK+Uu; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UiVeK+Uu"
Date: Tue, 22 Apr 2025 02:51:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745315507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yiEsc97xqdbi0dtBg5puMUo67BmWuvKBxMU70MqYLK4=;
	b=UiVeK+UujQjbGjB5kUvsVw2Rd4XJvBuuUcWqkA6dCHp4ukpsUWZOVOYLQtZru7pYs1JlFz
	ETGJvgiJS9RAywIAthGR12lQu0syCI7b7wDzEXV/r0Vb6BsORiLTDoKYtU7FVLq9iYNmzW
	UGPx5Gq4rDjA/beT8QIv9caQb65M/Ps=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jim Mattson <jmattson@google.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Rik van Riel <riel@surriel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>, x86@kernel.org,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 10/24] KVM: SVM: Use a single ASID per VM
Message-ID: <aAdmrsQcmEQeNnXb@Asmaa.>
References: <20250326193619.3714986-1-yosry.ahmed@linux.dev>
 <20250326193619.3714986-11-yosry.ahmed@linux.dev>
 <3d54470accbfdb27b14ec6f0afdb9180ae43d1a6.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d54470accbfdb27b14ec6f0afdb9180ae43d1a6.camel@redhat.com>
X-Migadu-Flow: FLOW_OUT

On Thu, Apr 03, 2025 at 04:05:41PM -0400, Maxim Levitsky wrote:
> On Wed, 2025-03-26 at 19:36 +0000, Yosry Ahmed wrote:
[..]
> > @@ -5481,6 +5498,12 @@ static __init int svm_hardware_setup(void)
> >  			goto err;
> >  	}
> >  
> > +	fallback_asid = kvm_tlb_tags_alloc(&svm_asids);
> > +	WARN_ON_ONCE(!fallback_asid);
> 
> Nitpick: This really can't happen unless there is some very bad bug lurking somewhere.
> And if this happens, nothing will work, since likely that regular ASID allocation
> will fail too.
> 
> So why not to fail svm_hardware_setup instead?

Yeah I can do that.

> 
> 
> > +
> > +	/* Needs to be after svm_cpu_init() initializes the per-CPU xarrays */
> > +	svm_register_asid(fallback_asid);
> > +
> >  	enable_apicv = avic = avic && avic_hardware_setup();
> >  
> >  	if (!enable_apicv) {
> > diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> > index 4929b96d3d700..436b7e83141b9 100644
> > --- a/arch/x86/kvm/svm/svm.h
> > +++ b/arch/x86/kvm/svm/svm.h
> > @@ -117,6 +117,8 @@ struct kvm_sev_info {
> >  struct kvm_svm {
> >  	struct kvm kvm;
> >  
> > +	unsigned int asid;
> > +
> >  	/* Struct members for AVIC */
> >  	u32 avic_vm_id;
> >  	struct page *avic_logical_id_table_page;
> > @@ -132,7 +134,6 @@ struct kvm_vmcb_info {
> >  	struct vmcb *ptr;
> >  	unsigned long pa;
> >  	int cpu;
> > -	uint64_t asid_generation;
> >  };
> >  
> >  struct vmcb_save_area_cached {
> > @@ -247,7 +248,6 @@ struct vcpu_svm {
> >  	struct vmcb *vmcb;
> >  	struct kvm_vmcb_info vmcb01;
> >  	struct kvm_vmcb_info *current_vmcb;
> > -	u32 asid;
> >  	u32 sysenter_esp_hi;
> >  	u32 sysenter_eip_hi;
> >  	uint64_t tsc_aux;
> > @@ -330,11 +330,6 @@ struct vcpu_svm {
> >  };
> >  
> >  struct svm_cpu_data {
> > -	u64 asid_generation;
> > -	u32 max_asid;
> > -	u32 next_asid;
> > -	u32 min_asid;
> > -
> >  	struct vmcb *save_area;
> >  	unsigned long save_area_pa;
> >  
> > @@ -656,6 +651,7 @@ void svm_complete_interrupt_delivery(struct kvm_vcpu *vcpu, int delivery_mode,
> >  				     int trig_mode, int vec);
> >  bool svm_register_asid(unsigned int asid);
> >  void svm_unregister_asid(unsigned int asid);
> > +unsigned int svm_asid(struct kvm *kvm);
> >  
> >  /* nested.c */
> >  
> 
> Overall looks good to me.
> 
> Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Thanks!

> 
> Best regards,
> 	Maxim Levitsky
> 
> 
> 
