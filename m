Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D4E13AA27
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 12:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748262771; cv=none; b=Jun0GywJZ/hViVNKtc1PdNKSXd2lyMoxicbg0/m8itc/jyizExxVVUafLqRLvUipQ9trryDVXDPOlTprwH1dBmTihKV0GSRwsvqSNmjEvE16wudL9x383okgIENp7Me9fDAglH58FI0bv42JDjYZPtyRebfLdLqU2KA8HaxcgLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748262771; c=relaxed/simple;
	bh=LyJ+ndHdNNArdfM2pwhYm9icCIe3xNaf4LRyeL/e41U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYNVCBzsroU0ASKNK9aJWunjPvGHZzokkIt4NIF7zbZsfW9tu9jYjvKPY/anyqNlY5QQJF7VoriZth1uh3cyCY0reX8fpoMFrYCol5LrF7v+wXhf+Iu2X9mg2wRUehZgu9kGje/ARZ63FNRjdbPLaG6W2RPlPm2LYEK3ms+tOW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fi6jto6A; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fi6jto6A"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-441d1ed82faso16871635e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 05:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748262766; x=1748867566; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cX5NeMJ07Z7hPjhpKLdgFWf1Bt2nqdKYkwaeZMAZl5w=;
        b=Fi6jto6AjI4YFbesIlgD4J8miZ0u2BDdsWR51ML0bPkhBSCvuD/FY1dokYfZi3IYhc
         fKMPuc4vPN8Vvzu8BO7Woxu6EE99t3S78PQrZLJkhmZxs+nq5TMN1yWR8UKhxMtymDS1
         uPqOKMUtgABCe68bQu+jsXbpVxVs3mIgn0TGgk4OWC2Y6nZ3uY/PjjkcFbx3qQXPKwh7
         L3Xzkaih1JVCxkd265YxUUdQ12+kU+dFY4RCYitr1b+59xtWRsfJgC5PzK3sLMGixFE0
         4Z+8166pn10lYwmoLwK9mF1sNSjQRpy+ka04YYFKqfvS1i6A0V/m4/019ivi22lW51sl
         EnoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748262766; x=1748867566;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cX5NeMJ07Z7hPjhpKLdgFWf1Bt2nqdKYkwaeZMAZl5w=;
        b=CZklMTrI9tLswmoiuynob4E7bF/XTW0YmbaQLBqCvEaFuONozdD0lrpexUyxaGn7Ez
         aRXL8q7F5OoSnDqg7fnrcvAIvcLc62E6zMwngNRitenQQ3uPBERcX3KFt8gKc7Iap4qN
         wFasA6IOE8FOFkEA5bWY/f/nrq35X4vlni9O0pJkETWKK4O4bxeQ8Pb022Hk8zFveccx
         5NacflKLg9ZMWvE7jebYuTRboIGYkQvamzv30N1pClWs2UjmMGaSCtVeF+ClcDj7VrAs
         1fpeps3ikux9kUAg4vDY0jTKoVGiaflJCipNytREWysuXtzzoYjU10celqsiYQA9vCik
         v7OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcUMst+SCUS/cxZEWI1hBDZ06Y6DqkaphHjDK8trs6DWiCyhTwRjP1qTg43/ftjZJYAWhD4QnXTaaqIo0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEJx19s0sFkMMI7jW22H0kgG6CNAHfTLCSS7IjeU7ghWTZN/wL
	yuN8OR/q0MT4Jz53wdsdI2UpKUu7x5qj1ZIDVQm/MUKJUx1QRjei2Fau3xMBVNaSuO+gfa98kWh
	hiWCE
X-Gm-Gg: ASbGnctB996D8GtrbOTcnakaNWUuXoClYzEnHLFiy6xhamGDhKWheLTtWUYPoqxc2Sn
	fpgnn8fxJ5ynZ4ypJwYjHb86E44ESds7YYaquuj4866b5dk23UsJ0St5kNczHLAdphGDdSzKgIC
	WdjSByk3D1PLTP0ZYW5e5bwz5YUVfT95jiSjA3VAxN4iN8/y9goMzh3Wp/YDDFDRLBxpMpsZuK1
	hQ94e9rcblZqlU450mqtq72GBYy13RoJitfgKm+gT8ZOfz8KuZbkI4qpM9sfEhF3ed7q4SVs0ps
	b0M2WaFL1MCk0B4zI8wFDKlnH9fVKeUbcxMV93FM+Nk7PmPokyYlelyq
X-Google-Smtp-Source: AGHT+IF6jnHUeJLMem7dFDtWplrd9BhhtwxXTTdVE3bJLYOHTU+Nm8qMT01la8e5pMTT4rhXoGFI1w==
X-Received: by 2002:a05:600c:4e4d:b0:43c:f3e4:d6f6 with SMTP id 5b1f17b1804b1-44c94c2a5famr86772495e9.31.1748262766419;
        Mon, 26 May 2025 05:32:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4dc7e69c8sm1707374f8f.95.2025.05.26.05.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 05:32:46 -0700 (PDT)
Date: Mon, 26 May 2025 15:32:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild@lists.linux.dev, Yu Zhao <yuzhao@google.com>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: mm/vmscan.c:3504 walk_pte_range() error: uninitialized symbol
 'dirty'.
Message-ID: <aDRfak8sX1Pf53Pg@stanley.mountain>
References: <202505152339.fBOfDPsi-lkp@intel.com>
 <20250523152705.2ecae09e834c66e1327d6748@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523152705.2ecae09e834c66e1327d6748@linux-foundation.org>

On Fri, May 23, 2025 at 03:27:05PM -0700, Andrew Morton wrote:
> On Fri, 23 May 2025 13:47:54 +0300 Dan Carpenter <dan.carpenter@linaro.org> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   088d13246a4672bc03aec664675138e3f5bff68c
> > commit: a52dcec56c5b96250f15efbd7de3d3ea6ce863d9 mm/mglru: fix PTE-mapped large folios
> > config: sparc-randconfig-r073-20250515 (https://download.01.org/0day-ci/archive/20250515/202505152339.fBOfDPsi-lkp@intel.com/config)
> > compiler: sparc64-linux-gcc (GCC) 8.5.0
> > 
> > smatch warnings:
> > mm/vmscan.c:3504 walk_pte_range() error: uninitialized symbol 'dirty'.
> > mm/vmscan.c:3595 walk_pmd_range_locked() error: uninitialized symbol 'dirty'.
> > mm/vmscan.c:4215 lru_gen_look_around() error: uninitialized symbol 'dirty'.
> > 
> > ...
> >
> > bd74fdaea14602 Yu Zhao        2022-09-18  3484  	for (i = pte_index(start), addr = start; addr != end; i++, addr += PAGE_SIZE) {
> > bd74fdaea14602 Yu Zhao        2022-09-18  3485  		unsigned long pfn;
> > bd74fdaea14602 Yu Zhao        2022-09-18  3486  		struct folio *folio;
> > c33c794828f212 Ryan Roberts   2023-06-12  3487  		pte_t ptent = ptep_get(pte + i);
> > bd74fdaea14602 Yu Zhao        2022-09-18  3488  
> > bd74fdaea14602 Yu Zhao        2022-09-18  3489  		total++;
> > bd74fdaea14602 Yu Zhao        2022-09-18  3490  		walk->mm_stats[MM_LEAF_TOTAL]++;
> > bd74fdaea14602 Yu Zhao        2022-09-18  3491  
> > 1d4832becdc2cd Yu Zhao        2024-10-19  3492  		pfn = get_pte_pfn(ptent, args->vma, addr, pgdat);
> > bd74fdaea14602 Yu Zhao        2022-09-18  3493  		if (pfn == -1)
> > bd74fdaea14602 Yu Zhao        2022-09-18  3494  			continue;
> > bd74fdaea14602 Yu Zhao        2022-09-18  3495  
> > 798c0330c2ca07 Yu Zhao        2024-12-30  3496  		folio = get_pfn_folio(pfn, memcg, pgdat);
> > bd74fdaea14602 Yu Zhao        2022-09-18  3497  		if (!folio)
> > bd74fdaea14602 Yu Zhao        2022-09-18  3498  			continue;
> > bd74fdaea14602 Yu Zhao        2022-09-18  3499  
> > 1d4832becdc2cd Yu Zhao        2024-10-19  3500  		if (!ptep_clear_young_notify(args->vma, addr, pte + i))
> > 1d4832becdc2cd Yu Zhao        2024-10-19  3501  			continue;
> > bd74fdaea14602 Yu Zhao        2022-09-18  3502  
> > a52dcec56c5b96 Yu Zhao        2024-12-30  3503  		if (last != folio) {
> > a52dcec56c5b96 Yu Zhao        2024-12-30 @3504  			walk_update_folio(walk, last, gen, dirty);
> 
> Seems to be notabug because last==NULL on the first loop and in this
> case walk_update_folio() will immediately return without touching
> `dirty'.   But gee, I can't blame smatch from getting fooled by this.

That's true, but if walk_update_folio() we not inlined then we would
still consider this a bug.  It's undefined behavior in the C standard
to pass uninitialized variables to a function call and also the UBSan
checker will detected it as a read at runtime.

In production systems the compiler is going to set
"bool dirty = false;" at the start of the function because everyone
runs with CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y.  Should I send a patch
which does that explicitly?

regards,
dan carpenter

