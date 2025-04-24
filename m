Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB28F1A8405
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 03:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745463680; cv=none; b=pimi2YqwUPkenpCGc9o8KcbkIrkRfv0yjpYdbK9cl6qG3DE5kUcYlTJu6b3ct1qH13bo+aQgBIoLo3REn/mkH1kpwZ+BeHlgG4K/hjUHvURWoXJcvtsdLo7uX6qQUvZRVBGqmWmg9f/nUjG59d9EE3ik3IFQlH+VKPJrRjLZsos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745463680; c=relaxed/simple;
	bh=fWtOsSAny7Tp6FVELiCydQam+M7Lie+/KqWCmlJZFh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LrJbLS+iK8QflFYLxL3JPq5ioyujT3c5goxNbEuquGuz8l+0/NfuVScL0DsiG5615NRnC2ONYYrkEpdRLrsowhIa5Z8A7c7DA2ieTF+Uhid+jvJrkAU/Qx1cXNLrx32fZsBKRK6pISLZaV8pWjfghybpk5LQXyPPlERro1ooX+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nRVczXEM; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRVczXEM"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-227914acd20so14296135ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 20:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745463677; x=1746068477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=azkXgEsVFLWSI8aJLzVYBM31UILAUv5k4h80m5buRqU=;
        b=nRVczXEMIJ+49vwgSPMdXC+1D6hdN3rb1azwU501j/ELMn4AHe44EctsMXQPDX6H3U
         7pgcMVso5aiRY/UQUVtd32zNIAaZZN5P1OiryJwiSp+qtnPrZzkedl4c8SlKka9LLdkE
         mic+4OTCl37KtaOc/3Jo58Djl9er+BYFGabrP6oB7Y7UjaACk2LERN2z2bdv3h5XoNOp
         LdvUc0kE5yV0s24+BGleRu+TGTNEFGjdaHg9HdJMxAN6Tc7Z8YmEJtS8GtNYDAC0TBIF
         hwsJuD+RFJ4+Pcl1KDYPyRA9rufCQ0ZZTwPgs6O81ReAgHwKEbeXKxEkwX86byFqjwar
         lXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745463677; x=1746068477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azkXgEsVFLWSI8aJLzVYBM31UILAUv5k4h80m5buRqU=;
        b=o0tW8h4/nwEmkScSVb3Kcm9JBOqRw4Qtfkbyvh9jHNqefpFwwqcdPpHAKa+GOSjYrX
         UMMWzli862q2b3nYemKbUQPzyLcyrdQirWLhjGNJChyTwWpFOiXldj174k5feo9wjwIT
         4/l4YrNrS99AqrG6PImbCyKvocJdmtrjYljS1z0yJmRb7i24CdaII20NMrR5IrehrVW+
         wYMxRh8mG4CJb+HkzC4TwgXlljbJMLHr9SaGYVYzXlsRvtdCelTZ+Tb9/N4isU/Lny11
         4WjQBBjtOtZin68WBclCxWZZBSu8XlrhUYeP3VmMQX61kFuWMmEzs+ZW6CO6Mj+K/d3w
         casw==
X-Forwarded-Encrypted: i=1; AJvYcCVOc+LJzte6ZcVy++XwlXbxJJZC/9ywCsUiFxV97rFCr6NSUi0aiEeDPMpgu6mWoY3SmHnPUbTmniRPJU0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBbsBliIZTCY6Vwqai2QJSI3lpjexjDytTx0fbsUqfKFwnywxk
	TQQwnaWPnkoZijPsymEXRVEmt7HOdGbz3/0zG3Ktm6D/2dZGoDMy
X-Gm-Gg: ASbGncvxI+w5oZkRcnQtNOpUP1KxgmMnh1KpV0nj1bfjlgOAW45H0yAxfrkcreu0bpw
	TzxpUezF6u1Bt07xCpB8K0U9r0463r1/CxZffcOwrej5aFLgvb1XEO6BX3md4CfGlhe6mx5iaxr
	jYxnUtEGUBbQCs7pQV4segLJLgmuY1gm+sHGGtovomSL8Y0HAn7iD/rJAhuz9ytjFZQ46FHqoTq
	N6XX7XTkrRANXbpp51j2kC1t+aGpqoVnZRUWpovCAl6DbZyY5QF7mvW0rOvwBrhh6cSl6P7Z0CT
	RhHWgrcF9e/T97qvmEeL+ue/rOd6xFZeKfR3Qt8w
X-Google-Smtp-Source: AGHT+IF2Em/MCYUs3WDROUyrwtldGVEo0SUdnLC+EBFxgfmvSGAQeOXoC2PSP7nrARTY9ygJSRSwAA==
X-Received: by 2002:a17:903:14b:b0:223:607c:1d99 with SMTP id d9443c01a7336-22db46a3332mr11049505ad.0.1745463676932;
        Wed, 23 Apr 2025 20:01:16 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db52163d6sm2113865ad.214.2025.04.23.20.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 20:01:16 -0700 (PDT)
Date: Wed, 23 Apr 2025 23:01:14 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Tony Luck <tony.luck@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] x86/resctrl: optimize cpumask_any_housekeeping()
Message-ID: <aAmpeoIQkUTq--tu@yury>
References: <20250407153856.133093-1-yury.norov@gmail.com>
 <20250407153856.133093-5-yury.norov@gmail.com>
 <de0758c8-76d5-4ead-84f2-40db45ff4ed8@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de0758c8-76d5-4ead-84f2-40db45ff4ed8@intel.com>

On Wed, Apr 23, 2025 at 02:29:48PM -0700, Reinette Chatre wrote:
> Hi Yury,
> 
> On 4/7/25 8:38 AM, Yury Norov wrote:
> > From: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> > 
> > With the lack of cpumask_andnot_any_but(), users have to abuse
> > cpumask_nth() functions which are O(N*log(N)), comparing to O(N)
> > for cpumask_any().
> > 
> > This series adds missing cpumask_andnot_any_but() and makes
> > cpumask_any_but() understanding the RESCTRL_PICK_ANY_CPU hint.
> > This simplifies cpumask_any_housekeeping() significantly.
> 
> The "This series ..." language is more appropriate for the cover
> letter. 
> 
> This changelog could be something like:
> 
> 	With the lack of cpumask_andnot_any_but(), cpumask_any_housekeeping()
> 	abused cpumask_nth() functions which are O(N*log(N)), compared to O(N)                
> 	for cpumask_any().                                                              
>                                                                                 
> 	Update cpumask_any_housekeeping() to use the new cpumask_any_but() and          
> 	cpumask_andnot_any_but(). These two functions understand RESCTRL_PICK_ANY_CPU   
> 	and simplifies cpumask_any_housekeeping() significantly.                        
> 
> 
> Also, could you please have the subject of this patch start with an
> upper case: "x86/resctrl: Optimize cpumask_any_housekeeping()"?

Yep, I'll reword.

> > Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> > ---
> >  arch/x86/kernel/cpu/resctrl/internal.h | 28 +++++++-------------------
> >  1 file changed, 7 insertions(+), 21 deletions(-)
> > 
> > diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> > index 20c898f09b7e..1db02bab9743 100644
> > --- a/arch/x86/kernel/cpu/resctrl/internal.h
> > +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> > @@ -71,30 +71,16 @@
> >  static inline unsigned int
> >  cpumask_any_housekeeping(const struct cpumask *mask, int exclude_cpu)
> >  {
> > -	unsigned int cpu, hk_cpu;
> > -
> > -	if (exclude_cpu == RESCTRL_PICK_ANY_CPU)
> > -		cpu = cpumask_any(mask);
> > -	else
> > -		cpu = cpumask_any_but(mask, exclude_cpu);
> > -
> > -	/* Only continue if tick_nohz_full_mask has been initialized. */
> > -	if (!tick_nohz_full_enabled())
> > -		return cpu;
> > -
> > -	/* If the CPU picked isn't marked nohz_full nothing more needs doing. */
> > -	if (cpu < nr_cpu_ids && !tick_nohz_full_cpu(cpu))
> > -		return cpu;
> > +	unsigned int cpu;
> >  
> >  	/* Try to find a CPU that isn't nohz_full to use in preference */
> > -	hk_cpu = cpumask_nth_andnot(0, mask, tick_nohz_full_mask);
> > -	if (hk_cpu == exclude_cpu)
> > -		hk_cpu = cpumask_nth_andnot(1, mask, tick_nohz_full_mask);
> > -
> > -	if (hk_cpu < nr_cpu_ids)
> > -		cpu = hk_cpu;
> > +	if (tick_nohz_full_enabled()) {
> > +		cpu = cpumask_andnot_any_but(mask, tick_nohz_full_mask, exclude_cpu);
> > +		if (cpu < nr_cpu_ids)
> > +			return cpu;
> > +	}
> >  
> > -	return cpu;
> > +	return cpumask_any_but(mask, exclude_cpu);
> >  }
> >  
> >  struct rdt_fs_context {
> 
> This looks good to me. Thank you very much for doing this.

Thanks for the feedback! I'll send v2 before the end of week.

Thanks,
Yury
