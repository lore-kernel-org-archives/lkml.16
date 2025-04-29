Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C8223F413;
	Tue, 29 Apr 2025 15:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745942012; cv=none; b=Z49u7vcgfP3j4OHoA4XI4n5IuFIFIBDnSKneZhBPgdfNfiZXI7udJkZFJK99rG9+WvC54fJ36LYXDikthBlO2jh9gxFopW2eCbkhtlzR4VnNo7erLOSLJS/AZugndy7yfX0kg4wybUGUyFEouI1wNB+3+jUAMjfz6nGQzvOC/bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745942012; c=relaxed/simple;
	bh=KUMxrCWS4kHpmdAy9k+WvcFlk1e7OoIGE+mnAbwsrzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Da8OsU1jDLbRnjeLkIVbSSNJ2AsNcBaT1EZVEH8LhwiVxQZP/y4uRW3xyelp4Aa3U5Kht0Al9VI01xvHEE+d4JtMfwk2dUEUhuiUIW4Hu7SyMqiJJBQ2PnoTLm94bkgAlEAo3q8/8KORhU3EXXDvHIsJAofQwG1mToc5E9qKKwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bodHUhFW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bodHUhFW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FF31C4CEE3;
	Tue, 29 Apr 2025 15:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745942011;
	bh=KUMxrCWS4kHpmdAy9k+WvcFlk1e7OoIGE+mnAbwsrzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bodHUhFWmP8Sz+DwztlGIKQ3DTG0NltdGnsHe7ni+bUP6fEyz2VjB5G4/RO632uxl
	 Ok5eMkAxLDy3ES9iw89J6qsDeCiVWLbFAOl4I7iIfYFK1owb91ueyY3AfuR298JbVI
	 jqUuik7hggNabBfGbkajNmHQQFzZBlSs8lHBfO7Pva49NvgOzont8BnXeZz/tZJqXY
	 ajwCCZIduCGd8lSj7mGgCYRo7ELlsZHcloWt+J+CGNmMn65WUlzciIyiX49vYjsa1A
	 sPAaL+CJ+s/g9wScEi5TRBzemcEql28oquwj8CODrTxymcg1tAYr9dgbCkX0CQU3qz
	 htosilAwBJ0Dg==
Date: Tue, 29 Apr 2025 18:53:15 +0300
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
Subject: Re: [PATCH v6 11/14] x86: add KHO support
Message-ID: <aBD165pVhOIl3_by@kernel.org>
References: <20250411053745.1817356-1-changyuanl@google.com>
 <20250411053745.1817356-12-changyuanl@google.com>
 <35c58191-f774-40cf-8d66-d1e2aaf11a62@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35c58191-f774-40cf-8d66-d1e2aaf11a62@intel.com>

On Mon, Apr 28, 2025 at 03:05:55PM -0700, Dave Hansen wrote:
> On 4/10/25 22:37, Changyuan Lyu wrote:
> > From: Alexander Graf <graf@amazon.com>
> > 
> > +#ifdef CONFIG_KEXEC_HANDOVER
> > +static bool process_kho_entries(unsigned long minimum, unsigned long image_size)
> > +{
> > +	struct kho_scratch *kho_scratch;
> > +	struct setup_data *ptr;
> > +	int i, nr_areas = 0;
> 
> Do these really need actual #ifdefs or will a nice IS_ENABLED() check
> work instead?
> 
> > +	ptr = (struct setup_data *)(unsigned long)boot_params_ptr->hdr.setup_data;
> 
> What's with the double cast?

The double cast is required for this to be compiled on 32 bits (just like
in mem_avoid_overlap). The setup_data is all u64 and to cast it to a
pointer on 32 bit it has to go via unsigned long.

If we keep actual #ifdef we can drop the double cast because KHO depends on
CONFIG_KEXEC_FILE which is only enabled for 64 bits.
 
> > diff --git a/arch/x86/kernel/kexec-bzimage64.c b/arch/x86/kernel/kexec-bzimage64.c
> > index 68530fad05f74..518635cc0876c 100644
> > --- a/arch/x86/kernel/kexec-bzimage64.c
> > +++ b/arch/x86/kernel/kexec-bzimage64.c
> > @@ -233,6 +233,31 @@ setup_ima_state(const struct kimage *image, struct boot_params *params,
> >  #endif /* CONFIG_IMA_KEXEC */
> >  }
> >  
> > +static void setup_kho(const struct kimage *image, struct boot_params *params,
> > +		      unsigned long params_load_addr,
> > +		      unsigned int setup_data_offset)
> > +{
> > +#ifdef CONFIG_KEXEC_HANDOVER
> 
> Can this #ifdef be replaced with IS_ENABLED()?

The KHO structures in kexec image are under #ifdef, so it won't compile
with IS_ENABLED().

> > @@ -312,6 +337,13 @@ setup_boot_parameters(struct kimage *image, struct boot_params *params,
> >  				     sizeof(struct ima_setup_data);
> >  	}
> >  
> > +	if (IS_ENABLED(CONFIG_KEXEC_HANDOVER)) {
> > +		/* Setup space to store preservation metadata */
> > +		setup_kho(image, params, params_load_addr, setup_data_offset);
> > +		setup_data_offset += sizeof(struct setup_data) +
> > +				     sizeof(struct kho_data);
> > +	}
> 
> This is a bit weird that it needs this IS_ENABLED() check and the
> earlier #ifdef. But I guess  it's following the IMA_KEXEC code's pattern
> at least.

And with other #ifdefs as well :)

if (IS_ENABLED()) can be dropped here, but having it makes things more
explicit IMHO.
 
> > diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> > index 766176c4f5ee8..496dae89cf95d 100644
> > --- a/arch/x86/kernel/setup.c
> > +++ b/arch/x86/kernel/setup.c
> > @@ -451,6 +451,28 @@ int __init ima_get_kexec_buffer(void **addr, size_t *size)
> >  }
> >  #endif
> >  
> > +static void __init add_kho(u64 phys_addr, u32 data_len)
> > +{
> > +#ifdef CONFIG_KEXEC_HANDOVER
> > +	struct kho_data *kho;
> > +	u64 addr = phys_addr + sizeof(struct setup_data);
> > +	u64 size = data_len - sizeof(struct setup_data);
> > +
> > +	kho = early_memremap(addr, size);
> > +	if (!kho) {
> > +		pr_warn("setup: failed to memremap kho data (0x%llx, 0x%llx)\n",
> > +			addr, size);
> > +		return;
> > +	}
> > +
> > +	kho_populate(kho->fdt_addr, kho->fdt_size, kho->scratch_addr, kho->scratch_size);
> > +
> > +	early_memunmap(kho, size);
> > +#else
> > +	pr_warn("Passed KHO data, but CONFIG_KEXEC_HANDOVER not set. Ignoring.\n");
> > +#endif
> > +}
> 
> Please axe the #ifdef in the .c file if at all possible, just like the
> others.

This one follows IMA, but it's easy to make it IS_ENABLED(). It's really up
to x86 folks preference.

-- 
Sincerely yours,
Mike.
