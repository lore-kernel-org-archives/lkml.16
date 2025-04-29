Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213581EB5CE;
	Tue, 29 Apr 2025 16:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745944507; cv=none; b=VYbNNP5HLSqrRNCt8KPOvrdA/nlGEoM/9qqqH66YvjNXoFXItjsvQh4J85iKYmsZu7z/VXjN9RNi1uWT4ptIfqo2nKX/Rp86V4lklLoSdNzgrmifg9c5Ceb/+A/1l9rh348Cfn43lOCEBOcAEjkaI/vbcJ9LJDUERg+PkB+YZKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745944507; c=relaxed/simple;
	bh=+UGyRtEyWANVYEtyHHifh4EloDW/BOB+dVBrXx8R5aE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZXfK2uyondqImB4nCu7pjFWPzXgJ7Np6dHk/1It3UtNyF2KGCtyMO3cwwWtKjtEQWGzAZ8OBekrwAut85HoUGE7AOHE93HaoqYbMVqbAj+dUgrGiS4N6xCTwZ8dGYD3OAu7ZswTdCXuRNYzZmKD9Icj4QQmbSZjqoPMtMPIH6S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hv4+V9oE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hv4+V9oE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C094CC4CEE3;
	Tue, 29 Apr 2025 16:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745944506;
	bh=+UGyRtEyWANVYEtyHHifh4EloDW/BOB+dVBrXx8R5aE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hv4+V9oEHFFoqPKi4JJC4Rggve0BsZAvaDzvh4SEQuECW785vJ5yPZ4AatV4KqWu6
	 wuF2qFRqPfjjSeYHDw7enNzhmN+iUgUUbapSZvr+Dz1qVv8qFyUfXoil/gPujvw11w
	 qoFYOIY78wNSefF32YipQjxSwHAcW3XOmHqgg1S2VM0PWb8PBDGDdDJRkMRAooSKa4
	 dtKpsbh7N+d9YIvzbEGIi3+RyayqE2xFI+WA5HeWOtGFHWzSkmRs90NjfbDCTTecMx
	 dcRb1imHHNN+d2crW1PnDFXSnrtBlXapjqWlicbZjIMRypxWwu/J1ycGlUtEr3CMqd
	 0B2+9D5ZaXxeQ==
Date: Tue, 29 Apr 2025 19:34:52 +0300
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
Message-ID: <aBD_rOvMPk5_iT9J@kernel.org>
References: <20250411053745.1817356-1-changyuanl@google.com>
 <20250411053745.1817356-12-changyuanl@google.com>
 <35c58191-f774-40cf-8d66-d1e2aaf11a62@intel.com>
 <aBD165pVhOIl3_by@kernel.org>
 <e90b81a4-a912-4174-b6e9-46a6ddd92ee3@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e90b81a4-a912-4174-b6e9-46a6ddd92ee3@intel.com>

On Tue, Apr 29, 2025 at 09:05:02AM -0700, Dave Hansen wrote:
> On 4/29/25 08:53, Mike Rapoport wrote:
> > On Mon, Apr 28, 2025 at 03:05:55PM -0700, Dave Hansen wrote:
> >> On 4/10/25 22:37, Changyuan Lyu wrote:
> >>> From: Alexander Graf <graf@amazon.com>
> >>>
> >>> +#ifdef CONFIG_KEXEC_HANDOVER
> >>> +static bool process_kho_entries(unsigned long minimum, unsigned long image_size)
> >>> +{
> >>> +	struct kho_scratch *kho_scratch;
> >>> +	struct setup_data *ptr;
> >>> +	int i, nr_areas = 0;
> >>
> >> Do these really need actual #ifdefs or will a nice IS_ENABLED() check
> >> work instead?
> >>
> >>> +	ptr = (struct setup_data *)(unsigned long)boot_params_ptr->hdr.setup_data;
> >>
> >> What's with the double cast?
> > 
> > The double cast is required for this to be compiled on 32 bits (just like
> > in mem_avoid_overlap). The setup_data is all u64 and to cast it to a
> > pointer on 32 bit it has to go via unsigned long.
> 
> Let's just make KHO depend on 64BIT, at least on x86.
 
Ok, so we are keeping #ifdef and dropping double cast here.

> >>> diff --git a/arch/x86/kernel/kexec-bzimage64.c b/arch/x86/kernel/kexec-bzimage64.c
> >>> index 68530fad05f74..518635cc0876c 100644
> >>> --- a/arch/x86/kernel/kexec-bzimage64.c
> >>> +++ b/arch/x86/kernel/kexec-bzimage64.c
> >>> @@ -233,6 +233,31 @@ setup_ima_state(const struct kimage *image, struct boot_params *params,
> >>>  #endif /* CONFIG_IMA_KEXEC */
> >>>  }
> >>>  
> >>> +static void setup_kho(const struct kimage *image, struct boot_params *params,
> >>> +		      unsigned long params_load_addr,
> >>> +		      unsigned int setup_data_offset)
> >>> +{
> >>> +#ifdef CONFIG_KEXEC_HANDOVER
> >>
> >> Can this #ifdef be replaced with IS_ENABLED()?
> > 
> > The KHO structures in kexec image are under #ifdef, so it won't compile
> > with IS_ENABLED().
> 
> They shouldn't be. Define them unconditionally, please.
> 
> ...
> >> Please axe the #ifdef in the .c file if at all possible, just like the
> >> others.
> > 
> > This one follows IMA, but it's easy to make it IS_ENABLED(). It's really up
> > to x86 folks preference.
> 
> Last I checked, I'm listed under the big M: for "X86 ARCHITECTURE". ;)

I remember :)

-- 
Sincerely yours,
Mike.
