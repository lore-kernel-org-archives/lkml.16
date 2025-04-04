Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB90A13B2BB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 20:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743799169; cv=none; b=c6Ytd4zbWXuuYXWRi1Y690f12xIB5LVLdsl8j6V4wKQqcwgUZcDFcpDbn06Sb4lVooJe3NK0uLPvtigo98vXvVaFLdteB4xCkleteCqjjT+Tnq502qRBtnqvP1c9OIF5BEpGehaxAblXQzq3sxNOtmLyLh1LF6e0Az0Co+Lj+98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743799169; c=relaxed/simple;
	bh=9ZsGuyq8HIoTFazNUANlV3gSZN5AL9d/xe3QV6c70HY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vw99V+7YxJQgOmts0g7F+m1xZPk30tcaXZuWUwPsAGnmAoVV7y86f5NAAeCtf4U/pVccjb8EiJu1CjanZHog7yn7rbmOLF83IKvrFzllfnqB6IlK6+nis67gJiHNxvvRwuK3u5+OM7aVke2YlBb+o7IyNaaYBlActU/Cplil4uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=r-ricci.it; spf=pass smtp.mailfrom=r-ricci.it; dkim=pass (2048-bit key) header.d=r-ricci.it header.i=@r-ricci.it header.b=JHzHGY91; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=r-ricci.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=r-ricci.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=r-ricci.it header.i=@r-ricci.it header.b="JHzHGY91"
Date: Fri, 4 Apr 2025 22:39:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=r-ricci.it; s=key1;
	t=1743799154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UwmZQcYi1EXxCwhNIY+HYLc1u5vQgnMlKARAIkaxeao=;
	b=JHzHGY91ox3IAo0IRB+jqoMBGsT6uZCdh1MIkzseecBUO+zjOOjgj3XnVNPTa0P6HfMVBs
	JVWGYnjNMviqmPTnPS9aQsB/8ViM+GaJCk6ZHq034qylvN2VvRPmFh9IN8PLD2rh6rBptK
	d/lqxJzBsILZrY6D2kIv0yromlwIfA4Q5IsdRJTBAG812xqRbnCyV+xpKxUC5neQelP7uM
	kYdAESpN7V1tq1TG0pNFtzsOICDFIyYoQts9factYnBi9AoEla2g2v5d4luFuSdyapo3Dp
	xQE0wczRGHyGPb1vhybRrx9Gog9fDIr5QkpjiOjoiQhJ4QwghaTGPrQunFeHgA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Roberto Ricci <io@r-ricci.it>
To: msizanoen <msizanoen@qtmlabs.xyz>
Cc: ebiederm@xmission.com, rafael@kernel.org, pavel@ucw.cz,
	ytcoode@gmail.com, kexec@lists.infradead.org,
	linux-pm@vger.kernel.org, akpm@linux-foundation.org,
	regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] Kernel booted via kexec fails to resume from
 hibernation
Message-ID: <Z_BDbwmFV6wxDPV1@desktop0a>
References: <Z4WFjBVHpndct7br@desktop0a>
 <Z4WGSMdF6seQm9GV@desktop0a>
 <b9f6ed5a-74b9-47c0-b073-9922dbe6119b@qtmlabs.xyz>
 <Z-8E-LLs1dFWfn6J@desktop0a>
 <691be719-7d4c-4cb1-87d6-cca7834547fe@qtmlabs.xyz>
 <004d85e4-d23d-43af-87ca-8d037abba51d@qtmlabs.xyz>
 <4081fbd9-0a5f-49d6-9553-4f964bf5ef27@qtmlabs.xyz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4081fbd9-0a5f-49d6-9553-4f964bf5ef27@qtmlabs.xyz>
X-Migadu-Flow: FLOW_OUT

On 2025-04-04 12:50 +0700, msizanoen wrote:
> Here's an updated version of the patch that better handles pathological e820
> tables.
> 
> On 4/4/25 11:56, msizanoen wrote:
> > Also, can you reproduce this issue with a target kernel (the kernel
> > being kexec-ed) that has one of the patches attached (select the correct
> > one according to your kernel version) applied, with either kexec_load or
> > kexec_file_load?
> > [snip]
>
> diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
> index 4893d30ce438..5d963df63b7a 100644
> --- a/arch/x86/kernel/e820.c
> +++ b/arch/x86/kernel/e820.c
> @@ -754,22 +754,21 @@ void __init e820__memory_setup_extended(u64 phys_addr, u32 data_len)
>  void __init e820__register_nosave_regions(unsigned long limit_pfn)
>  {
>  	int i;
> -	unsigned long pfn = 0;
> +	u64 last_addr = 0;
>  
>  	for (i = 0; i < e820_table->nr_entries; i++) {
>  		struct e820_entry *entry = &e820_table->entries[i];
>  
> -		if (pfn < PFN_UP(entry->addr))
> -			register_nosave_region(pfn, PFN_UP(entry->addr));
> -
> -		pfn = PFN_DOWN(entry->addr + entry->size);
> -
>  		if (entry->type != E820_TYPE_RAM && entry->type != E820_TYPE_RESERVED_KERN)
> -			register_nosave_region(PFN_UP(entry->addr), pfn);
> +			continue;
>  
> -		if (pfn >= limit_pfn)
> -			break;
> +		if (last_addr < entry->addr)
> +			register_nosave_region(PFN_UP(last_addr), PFN_DOWN(entry->addr));
> +
> +		last_addr = entry->addr + entry->size;
>  	}
> +
> +	register_nosave_region(PFN_UP(last_addr), limit_pfn);
>  }

Your patch applied to v6.14 fixes the issue with kexec_file_load, but
kexec_load keeps not working.

>  #ifdef CONFIG_ACPI
>
> diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
> index 57120f0749cc..656ed7abd28d 100644
> --- a/arch/x86/kernel/e820.c
> +++ b/arch/x86/kernel/e820.c
> @@ -753,22 +753,21 @@ void __init e820__memory_setup_extended(u64 phys_addr, u32 data_len)
>  void __init e820__register_nosave_regions(unsigned long limit_pfn)
>  {
>  	int i;
> -	unsigned long pfn = 0;
> +	u64 last_addr = 0;
>  
>  	for (i = 0; i < e820_table->nr_entries; i++) {
>  		struct e820_entry *entry = &e820_table->entries[i];
>  
> -		if (pfn < PFN_UP(entry->addr))
> -			register_nosave_region(pfn, PFN_UP(entry->addr));
> -
> -		pfn = PFN_DOWN(entry->addr + entry->size);
> -
>  		if (entry->type != E820_TYPE_RAM)
> -			register_nosave_region(PFN_UP(entry->addr), pfn);
> +			continue;
>  
> -		if (pfn >= limit_pfn)
> -			break;
> +		if (last_addr < entry->addr)
> +			register_nosave_region(PFN_UP(last_addr), PFN_DOWN(entry->addr));
> +
> +		last_addr = entry->addr + entry->size;
>  	}
> +
> +	register_nosave_region(PFN_UP(last_addr), limit_pfn);
>  }
>  
>  #ifdef CONFIG_ACPI

On master, kexec_file_load already worked due to the patch series you
mentioned in earlier emails. The kexec_load issue isn't affected by your
patch.
