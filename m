Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE2F29408;
	Fri,  2 May 2025 21:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746220597; cv=none; b=IuYznNJaMHi1fTTg1/rC4FWsh6TR+4tKR7uob6viDZOqXJ/WfhZO1KjoH5KD8dfJtPDdMP5uP07yvnxxwAr5LRd31UnTBaB1CBSzRBcV5i6HnuO2UptdC8Btivmqb1TEAIWayNFYnY/2Z1beeZxY7UgkaNf8wvwKA6r1mAqNzLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746220597; c=relaxed/simple;
	bh=kzsN5X5daKdANNax1/r/iY9EohjZTKAy76Q08oyT2VE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mr3Bec1ZKiaocqlvqyPxIoTLqEh2lRUfK3eLsgH1iw2lZCTgTRBxhVnPKmr+iCbPSVT7T7sFDzSjl7WT2k+eyVXK7XWu2GKLriEg41VON4L4fwWvAMr69v7F4k0UD9Piv5e9j/EUHkwlhbRnGUOP1q+Ygbd60aicJyvDIl0U0gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GK65252c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GK65252c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78DFEC4CEE4;
	Fri,  2 May 2025 21:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746220597;
	bh=kzsN5X5daKdANNax1/r/iY9EohjZTKAy76Q08oyT2VE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GK65252choMKHsOuLDuV4K7qmKnN7fPQ6tHc/J83IS0AgNj5kQar2z31XQL1Hozvj
	 VZap9E+kzyJhOEaLWv7W/dH0F3IDMpwfL8v75SFOq7GZbntAB2zUga29FgDz7jNkUy
	 HJYg6XHrJPV5Q+PBuUwzmN8lDl6dPHm2M1KWxgTJV3jY1gmxUbmNL48CyPxNoXbxvZ
	 mL4e6BLMHzI43/Fvxz6B/d2Ohkv5EFpwH63gQpqDrKE2aXHw16P7khFZPy/UZa7A/X
	 iX+2EobXIhe0vYOQ8U6EcHv87lemL+O9yJbAa+R/CyquCcAu2DP0WopdD4W6LkR573
	 H/unhCL4q+ijw==
Date: Sat, 3 May 2025 00:16:21 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, anthony.yznaga@oracle.com, arnd@arndb.de,
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de,
	catalin.marinas@arm.com, corbet@lwn.net,
	dave.hansen@linux.intel.com, devicetree@vger.kernel.org,
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com,
	hpa@zytor.com, jgowans@amazon.com, kexec@lists.infradead.org,
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org,
	mark.rutland@arm.com, mingo@redhat.com, pasha.tatashin@soleen.com,
	pbonzini@redhat.com, peterz@infradead.org, ptyadav@amazon.de,
	robh@kernel.org, rostedt@goodmis.org, saravanak@google.com,
	skinsburskii@linux.microsoft.com, tglx@linutronix.de,
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org
Subject: Re: [PATCH v7 14/18] x86/boot: make sure KASLR does not step over
 KHO preserved memory
Message-ID: <aBU2JQRKXjqoFClQ@kernel.org>
References: <20250501225425.635167-1-changyuanl@google.com>
 <20250501225425.635167-15-changyuanl@google.com>
 <c348c507-c06b-4611-87f4-c498e144fa45@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c348c507-c06b-4611-87f4-c498e144fa45@intel.com>

On Fri, May 02, 2025 at 11:48:54AM -0700, Dave Hansen wrote:
> On 5/1/25 15:54, Changyuan Lyu wrote:
> > +/*
> > + * If KHO is active, only process its scratch areas to ensure we are not
> > + * stepping onto preserved memory.
> > + */
> > +#ifdef CONFIG_KEXEC_HANDOVER
> > +static bool process_kho_entries(unsigned long minimum, unsigned long image_size)
> > +{
> 
> I thought we agreed to rework this to unconditionally define the
> kho_scratch structures so the #ifdef can go away?

It's either #ifdef or double casting and my understanding was that your
preference was to get rid of the double casting.
 
> > +	struct kho_scratch *kho_scratch;
> > +	struct setup_data *ptr;
> > +	int i, nr_areas = 0;
> > +
> > +	ptr = (struct setup_data *)boot_params_ptr->hdr.setup_data;
> > +	while (ptr) {
> > +		if (ptr->type == SETUP_KEXEC_KHO) {
> > +			struct kho_data *kho = (struct kho_data *)ptr->data;
> > +
> > +			kho_scratch = (void *)kho->scratch_addr;
> > +			nr_areas = kho->scratch_size / sizeof(*kho_scratch);
> > +
> > +			break;
> > +		}
> > +
> > +		ptr = (struct setup_data *)ptr->next;
> > +	}
> > +
> > +	if (!nr_areas)
> > +		return false;
> > +
> > +	for (i = 0; i < nr_areas; i++) {
> > +		struct kho_scratch *area = &kho_scratch[i];
> > +		struct mem_vector region = {
> > +			.start = area->addr,
> > +			.size = area->size,
> > +		};
> > +
> > +		if (process_mem_region(&region, minimum, image_size))
> > +			break;
> > +	}
> > +
> > +	return true;
> > +}
> > +#else
> > +static inline bool process_kho_entries(unsigned long minimum,
> > +				       unsigned long image_size)
> > +{
> > +	return false;
> > +}
> > +#endif
> > +
> >  static unsigned long find_random_phys_addr(unsigned long minimum,
> >  					   unsigned long image_size)
> >  {
> > @@ -775,7 +824,8 @@ static unsigned long find_random_phys_addr(unsigned long minimum,
> >  		return 0;
> >  	}
> >  
> > -	if (!process_efi_entries(minimum, image_size))
> > +	if (!process_kho_entries(minimum, image_size) &&
> > +	    !process_efi_entries(minimum, image_size))
> >  		process_e820_entries(minimum, image_size);
> >  
> >  	phys_addr = slots_fetch_random();
> 
> I made a comment about this in the last round, making this the second
> thing that I've noticed that was not addressed.
> 
> Could you please go back through the last round of comments before you
> repost these?

I presumed that changelog covers it. We'll add a comment here for the next
posting.
 
> Just to be clear: these are making progress, but they're not OK from the
> x86 side yet.

-- 
Sincerely yours,
Mike.
