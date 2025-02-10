Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F0E19CC33
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739186350; cv=none; b=fC88Vtu8B+fKTa+cOlUH9LfJdL+33ao5RwQnZ7mO1LLNBO12tw/KnRAkigEmowVJ06u5iXnITNMXKfNk9/OVswcfR+JgtJLzmln55ObNy6EIbSEgJBx6ig/oplGegmjPRR8kBH7C4EJT1iM6tOYfWhCjF1M2GySSaRJw5Ktl08c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739186350; c=relaxed/simple;
	bh=juUILDNuz+vzUiT9bEhkA2Uw+36itTZA8IbPx+mDCpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7j45QjL6AhdOpsuaLPfXT6dcFRYumUrmFu/HAZJUTQ+G3v9kMSaPbeSKBgUbdRAHwBRUe6h7dxyo56URG6kNEUbfjVp/Hw9HWXSU4o21KNIOXQWIhMdEGinKsL+bDr1BRSYgOFfNdO6G8JS3k5aKqEq54LlWBYA9XNhi5DFwCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TftEeVf+; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TftEeVf+"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso687124566b.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 03:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739186346; x=1739791146; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AOZLct+qV3pNzK/kYdO49CmGouhIq9bQC2J2rxm7uS0=;
        b=TftEeVf+MzPkZT9BSbO6dclgJsYiBrhInGf7/QrL7Q6LeWFItrr/KgiBtP88NFVxTv
         ezlg4XOuBJCZ1nWZM8Zm/R3s3YMAJ3gSP3Caz/Gf/ynUfxjEt7KZbBvs7zYRfg4U1ZuW
         5zfvdfmpgOx8/eNDFrtywt9537U/gyWs+yVgrrpO5MRYLxu+wfhAUPJEUdctMM74wyJ2
         fqFj5aa61nOg8qFU0f2DHxjqP6TxUWUgYv4GvpNIH6h3z5VwwFCPjfmS+meEr6rQxpPU
         eiBxnRR7buuMaCIGH/cDqj1kH83DpU26D6PWULC+OCe1c/p0uqwo8aT3VZ2JekQU/Wgn
         mLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739186346; x=1739791146;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AOZLct+qV3pNzK/kYdO49CmGouhIq9bQC2J2rxm7uS0=;
        b=gWBihiobEh0QiBBUyiVPGRlPOX03dx8hj6r2iVtVDuGEvHe8P/mw9wSayPDequvgsb
         te4MLhV6r6hm9HkSNa2Cx7yrEWjNGXkx9SFlZ1kN6QQ96ld/pwSloo4J84O+9ozrDGPm
         z2/ZX1FPDu0SU7/OlMUwLnltrV+T84nXTEXUqcwzbcEveSWQGWrMGdi4xJlmujNWhyCs
         eX2Hy4fDhk2+Gh+DqjeJpX2Np34inEllBW+zPg00YWcuBeWKbmCH6RnNFmCqubgxZXm+
         y8HspJ1lNge5MDzkJoPBXMIpL+YWUuMWt6+upVX6eN3ouAAheHFSw16hzusu9tOSptLF
         eVxg==
X-Forwarded-Encrypted: i=1; AJvYcCXhxTi3DwILekgv+zKBp7Qbg8pz2lmxCGi1VH3ETiRZxabeS698LGzxZMaR7LvN9nM4Kde7eknXsBXL6rQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGQ9pUFHFXMLWe1cND1OdNKSUTE9EzFZOnlXQdQCFPg1pcbVpb
	oKsKG1mgdMuoJjb0NYN4xGopZ0tmCaxy74o+1p9nYl6iXXPMl7+6LFuQzHn50lpAps6zQQ9iJW8
	W
X-Gm-Gg: ASbGncsm/CPBq3r/1vqZQyn90Gg4kM2qUKa7B2wjrF30MvvBJ/ZgxE1vmUsuKR+vbQz
	13pLDsI6OF3fViZC2ZJZaxHTjt/Jt/vwKhjIpo6QrXHjtjfKsEUFNAkyKsnDKa92w1KTSMWP2XL
	pC9fbHrCqhFPCYBJHi5F5fkB1mgP48sEdK4s+A3JwXTVqvBWpy6eLYtQiIhyBaSupEmkaCa915s
	FZzrHwi5BZ+8XBafhsIWJkIcZE/SAoX1SOhognz/gz2A4vMkJtjy5wVtFUrLpSsJGqIBsDiglc4
	kvbFbBXlhyhEz5b9YBkdni3wm80M
X-Google-Smtp-Source: AGHT+IFAz153X5vcICG8zzXj6wcDOOnjP9Zg1pwaZ/blrVka419ZdJB++ySz04hKJ+rtzkgtRskeAA==
X-Received: by 2002:a17:907:3e17:b0:ab6:f4e7:52f9 with SMTP id a640c23a62f3a-ab789aed845mr1525011766b.25.1739186346349;
        Mon, 10 Feb 2025 03:19:06 -0800 (PST)
Received: from localhost (109-81-84-135.rct.o2.cz. [109.81.84.135])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ab773331db7sm844842566b.127.2025.02.10.03.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 03:19:06 -0800 (PST)
Date: Mon, 10 Feb 2025 12:19:05 +0100
From: Michal Hocko <mhocko@suse.com>
To: Hillf Danton <hdanton@sina.com>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/6 v2] mm: Drain LRUs upon resume to userspace on
 nohz_full CPUs
Message-ID: <Z6ngqT7eLUW6Eeb_@tiehlicka>
References: <20250209223005.11519-1-frederic@kernel.org>
 <20250210105028.2134-1-hdanton@sina.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210105028.2134-1-hdanton@sina.com>

On Mon 10-02-25 18:50:26, Hillf Danton wrote:
> On Sun,  9 Feb 2025 23:30:04 +0100 Frederic Weisbecker <frederic@kernel.org>
> > @@ -769,6 +772,9 @@ static bool cpu_needs_drain(unsigned int cpu)
> >  {
> >  	struct cpu_fbatches *fbatches = &per_cpu(cpu_fbatches, cpu);
> >  
> > +	if (!housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE))
> > +		return false;
> > +
> >  	/* Check these in order of likelihood that they're not zero */
> >  	return folio_batch_count(&fbatches->lru_add) ||
> >  		folio_batch_count(&fbatches->lru_move_tail) ||
> > -- 
> > 2.46.0
> 
> Nit, I'd like to add a debug line to test your assumption that
> isolated tasks are pinned to a single nohz_full CPU.

Why? And why would you like to add a trivial VM_BUG_ON vector to the
kernel?

> --- x/mm/swap.c
> +++ y/mm/swap.c
> @@ -767,9 +767,10 @@ static void lru_add_drain_per_cpu(struct
>  static bool cpu_needs_drain(unsigned int cpu)
>  {
>  	struct cpu_fbatches *fbatches = &per_cpu(cpu_fbatches, cpu);
> +	bool yes;
>  
>  	/* Check these in order of likelihood that they're not zero */
> -	return folio_batch_count(&fbatches->lru_add) ||
> +	yes = folio_batch_count(&fbatches->lru_add) ||
>  		folio_batch_count(&fbatches->lru_move_tail) ||
>  		folio_batch_count(&fbatches->lru_deactivate_file) ||
>  		folio_batch_count(&fbatches->lru_deactivate) ||
> @@ -777,6 +778,12 @@ static bool cpu_needs_drain(unsigned int
>  		folio_batch_count(&fbatches->lru_activate) ||
>  		need_mlock_drain(cpu) ||
>  		has_bh_in_lru(cpu, NULL);
> +
> +	if (!housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE)) {
> +		VM_BUG_ON(yes);
> +		return false;
> +	}
> +	return yes;
>  }
>  
>  /*

-- 
Michal Hocko
SUSE Labs
