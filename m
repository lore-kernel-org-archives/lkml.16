Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847FD7E9
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745463544; cv=none; b=DBsEw4TA84u5hYz0DjqnTiQ7ZrPsnv+HdQhw0p4hcAHKBZcHnkU/14gHshC5dDI1OLwPlhq4bh9KA635cJrElggVGlALmuKNJP33/jNIMTlBpLr2WuufpxISwMoKcjKeSKB9yuyV38aL3rwAgs7X5uxB2fUcsbb27vXyLAkGjWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745463544; c=relaxed/simple;
	bh=sGms0WWK4oa5fpICIpSbc1v28ZbLrbL38cfxN/FjHGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JLmQ/NK868ChvXuKXaHyWrwYrKQJ9N4PKjyL+VlBcv7ksMC0/+XCsvJLLh25rX3AiUjNwZSS86H+P+JBvTfGPbGHxck1/ap8sRCVUbDp5SsU41zZFXCPL/K/Jo9cHo90L/pExHJsKs5YqqYYiwp+H5HGU2zU+F3rWYt8acob9kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=if3J+lkU; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="if3J+lkU"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-223fd89d036so5926625ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 19:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745463542; x=1746068342; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/kDtHEfZOWiEW4MRlsj/MijM5zlmmGBAeNJajP1J6VU=;
        b=if3J+lkU7p9F5DHmh466MiMNJWFL0u87guKeDmj+dLPZcAw1U9iqMJytq7ChlvRG4K
         N2Cvhm02sHwzrBBRhO46vVo96kCytJEFELa4tUW0O0ND2iT9/T1GofU/z41ybsKTIMbF
         F6oypmHRyVb4cvXbXVKx+1JZOkZVAjlRAQ3dE10CFTqZJm/ouhRSV7w5bChRjuXK4uOl
         EkiWwIhwboN8KnC/LPbdlm9+gJxII7epi2FKFz7vQBA/u193x9w63ENQ2cCJVNgPpx55
         BJAB8fuRRAx+MPZBonQ8sslPjC44QzEdsCp5/gpfb2uAJa9KtlkTI6e9nfEvDFI5HKrw
         4dNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745463542; x=1746068342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/kDtHEfZOWiEW4MRlsj/MijM5zlmmGBAeNJajP1J6VU=;
        b=Cj+aGppwCNc8IrhM/EbbHhHWOQ74Ex7lfyhHr+/VzfyCGsUc6JVkW3yRAQ3X+yldW0
         NCVYL6+UqWre8yrBfPjtyNVbETSA7cNn7zTkjw4WSvQVAuHI7Oe+2BUVN3cTVQSREdy0
         ohj9DLlAHixIn9rtmnDMguqE5sFuGyrZ7R/V+RNOEQA9eOYRvPPqW28PYkrCE4N/mLkU
         Jn7iA+hp7fAO3VHdv9A1amrOCNN30MSNpJV9ij3jyDbJpMUQRtQBDD1gF18gsKHyXKvD
         SvRuZpg61ckE+bq6IR81MuLeCHg1SwrBIw1Moay2luaET/6B3+kv8hcJn8BOwS+gzV6J
         g9KA==
X-Forwarded-Encrypted: i=1; AJvYcCVEhmTu8efO+o0SSP7zTZrGFtVZ3Lbi0p0ER/C3TWl8B//5OgtgqrNTU+wVXEq0KFYvrPl27HuR3QT9f9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoKuDiVKpVYxX/CAC5gQqWSn7vBZMLvbgVY4/zs8n45lv4B1eD
	cLLpNvs+44xQbUEYvwM0i5sC5m85+cN0tIUGBERUYoI/MmbSlLUs
X-Gm-Gg: ASbGncsgnxVQsP6WthnRjU6wdrypJhgQ04GiUPBflj/NLOokXVrBlSAZFnw99VJmAxR
	RomKtuTp+e5CwUJZGch8ZsRJDDQjpzkK9QBdrfPjFlyZMmKzi0ZLWH3dQqjQu3wd9OP+1R2NGaf
	b60t3aH8Ri1nN8YyjI96CLYpxxvHUiFtl/fa2WP1Ncq5LtQtBeMLI4tMnnPuQLLGmnkcFzaecrv
	6f1rZxLGyRUlXUetZpBYryDvWpuilwrT2u+3xUo2nm/QJkOKux+fl4Pj8Ljjba1OpsomXTPRJgw
	j6aNva+ym+6MrWR1blf42krIaelxuM0s4alxYrSE
X-Google-Smtp-Source: AGHT+IE8g58lYbzIxi+v1soz9/bzHCeIMiQFFKTqJy5j+WC13t+77YqhHhRu9h37/CXavLtG642Vyw==
X-Received: by 2002:a17:903:1aae:b0:224:1c95:451e with SMTP id d9443c01a7336-22db3d71b46mr11375775ad.33.1745463541572;
        Wed, 23 Apr 2025 19:59:01 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db51021a8sm2080865ad.172.2025.04.23.19.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 19:59:01 -0700 (PDT)
Date: Wed, 23 Apr 2025 22:58:59 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Tony Luck <tony.luck@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] cpumask: add cpumask_{first,next}_andnot() API
Message-ID: <aAmo83SnYBGv7zRu@yury>
References: <20250407153856.133093-1-yury.norov@gmail.com>
 <20250407153856.133093-4-yury.norov@gmail.com>
 <c96bade5-200a-4812-8df6-d6dcf2984a01@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c96bade5-200a-4812-8df6-d6dcf2984a01@intel.com>

On Wed, Apr 23, 2025 at 02:28:38PM -0700, Reinette Chatre wrote:
> Hi Yury,
> 
> On 4/7/25 8:38 AM, Yury Norov wrote:
> 
> ...
> 
> > @@ -284,6 +297,25 @@ unsigned int cpumask_next_and(int n, const struct cpumask *src1p,
> >  		small_cpumask_bits, n + 1);
> >  }
> >  
> > +/**
> > + * cpumask_next_andnot - get the next cpu in *src1p & ~*src2p
> > + * @n: the cpu prior to the place to search (i.e. return will be > @n)
> > + * @src1p: the first cpumask pointer
> > + * @src2p: the second cpumask pointer
> > + *
> > + * Return: >= nr_cpu_ids if no further cpus set in both.
> > + */
> > +static __always_inline
> > +unsigned int cpumask_next_andnot(int n, const struct cpumask *src1p,
> > +				 const struct cpumask *src2p)
> 
> Looks like the custom followed here is to name parameter that can have
> -1 as value "n" and let it have type "int". Should this also apply to
> cpumask_andnot_any_but(), cpumask_any_but(), and cpumask_any_and_but()
> modified/introduced in this series?
> 
> > +{
> > +	/* -1 is a legal arg here. */
> > +	if (n != -1)
> > +		cpumask_check(n);
> > +	return find_next_andnot_bit(cpumask_bits(src1p), cpumask_bits(src2p),
> > +		small_cpumask_bits, n + 1);
> > +}
> > +
> >  /**
> >   * cpumask_next_and_wrap - get the next cpu in *src1p & *src2p, starting from
> >   *			   @n+1. If nothing found, wrap around and start from
> > @@ -458,6 +490,33 @@ unsigned int cpumask_any_and_but(const struct cpumask *mask1,
> >  	return cpumask_next_and(cpu, mask1, mask2);
> >  }
> >  
> > +/**
> > + * cpumask_andnot_any_but - pick an arbitrary cpu from *mask1 & ~*mask2, but not this one.
> > + * @mask1: the first input cpumask
> > + * @mask2: the second input cpumask
> > + * @cpu: the cpu to ignore
> > + *
> > + * If @cpu == -1, the function returns the first matching cpu.
> > + * Returns >= nr_cpu_ids if no cpus set.
> > + */
> > +static __always_inline
> > +unsigned int cpumask_andnot_any_but(const struct cpumask *mask1,
> > +				    const struct cpumask *mask2,
> > +				    unsigned int cpu)
> 
> Since -1 is legal argument I expect "cpu" to be int.

Yes, you're right. I overlooked this. Will fix in v2
