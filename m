Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458E9A41
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 08:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749198674; cv=none; b=vB5/SlmsaFPK/ewDzjSuQlZ4wfKVDsDo5M44YN07tj4uOy8StAmo0UZQdbO75FmADA6MiFn+tahSUJW/xAj+Td+NX9eIdRBIMlghuJIcwcSXPQ5W/AMNjXFAz0dIWnFhzofCfnzFhOVdZ+GyCoRzxU9xovjXcUOcqvB6M3GSCP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749198674; c=relaxed/simple;
	bh=W0dPASltukqqgpvXL3ndZtpF9lzvYyOGck4shgpi4rI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mObmzqMSzrfQ92nafZ9Sp+TEmYC7CP2mNmaymplu9TBN6RcYoW/3HTCtBv1+vZ/1r4kZCCj6SWyiRxGF3VvBo517KOyw2ZuvVEM79Qg2Rbnp7oxUG1LdqD6JegDIWgQ0v1JAjYdbRH5vTOay2C4gRacuw4Rj3XJjLvEx0/uGX9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=S54X6s67; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="S54X6s67"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a375888297so1182533f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 01:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749198669; x=1749803469; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qYieY4lInWZq9QdI1taw9gd0hMVkfJQ+4I1ApVM6Qgk=;
        b=S54X6s67DCQ+R/ica8IggS6UJDyPtulH6/+RryCn0qZSKatFDOVWk0yvuHw4f5F4Dd
         +EEEcFNydzZrhff/Q1lx4dII5eW05j0iA8UWYKshTP5Anvi9Bp6TMJJ36Mgf5zzStZv/
         eGhvu8vcOz3LL0Od3ZnqReGHxJ8Enb/xzAhFXPQ15/TioHgccMQbtdoaWslIRG1tkBW4
         as8eMzNCVWkWNtXJg3Rtc5TZRlsx5LWdPy5/THUSAQhXq8m/IA6EGB5+NU6uBNHpelFH
         cGEmBkEDVtkNomGo+ZWK5S5eB+6EKXVGCV3n3X/6DwG0PhPjJ4W2xaBZrzzhn2f6kQV8
         926w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749198669; x=1749803469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYieY4lInWZq9QdI1taw9gd0hMVkfJQ+4I1ApVM6Qgk=;
        b=mRr8qZpRhLXpnr2SgafUcMIxk5rM6zbZ7k3eLyxDwSN/4R9NfBSqrNOHzlyyHznGD5
         E87Lw558JS5Zxl1NgdEjDhuNhwu4a0Dv+12mrFqWXbfYAo0ISJ+NWInNBsmy0qI5zbEt
         W9uiBrkQ1Qw8hsgZYwRHyBxk9prA9YOeG9rhrPvSG1eYD8xcQfrSs4KG+b2JICjAKOP+
         06t1daH3122Pc3gPqwRq/xFUkSL/mMtTODHZdn3+uCe+SYiR2Bf14cQ2zWykkeaX7U46
         +8HDfMbyKPbY8RUFCWCHXCyEOPUXnLjriySGGfMMMAgBo2uKQ4qkqs3P9nSO11pkjmj2
         RbRw==
X-Gm-Message-State: AOJu0Yy4G6Tfa/Q850sz8jvygG//x9WhZHcLyImI2Igdq8HLw9lzxyWR
	OPeh//SgLCL6HE1Jaw4/97/Jm1L7omXuQvJIo9RbnArdK6R424/xhmn/ZP/WDfHNaL4=
X-Gm-Gg: ASbGncucTKjn6e0Bxf9IpvyGAwQY4UH8rSoMNnL8+g/sJHhlVx9rrb7qsYo/2DO5pCJ
	qouZANJHpUZYMeP5SZGE+O+b3TQO3V33ijd+FPWqaYAbQtdDMQyqLU+umchllbcgn+7fxiBAujM
	kY61eIBMVq0D40UF67u0nxLkBRry8/1IVKtaFUQDaPq4QautJkZnpvNDOWdY5qTw+vvUEoamlVG
	8sfpk+PkJW6FbJIa2DRB+dOrHSXao/RqZ4gQagqLZxjHXY4Ms4Wgmz1s+g9lpZHsrTIaAfdlScr
	xyXpsQ5Jsth+rlVY2iRgKAxk+oBrHBa0hr72TlvOQ/vX2y33WRVS0A12YyQPQVTV
X-Google-Smtp-Source: AGHT+IGuXhVMkjZYWAnukrSJQreEhdk2NYQVPbB5PfaHi1nXUEKZ/69yyHXplK7ArfVdwh3ZYP03Vg==
X-Received: by 2002:a05:6000:4202:b0:3a4:e63d:2f2d with SMTP id ffacd0b85a97d-3a5313155d0mr2420403f8f.6.1749198669407;
        Fri, 06 Jun 2025 01:31:09 -0700 (PDT)
Received: from localhost (109-81-91-107.rct.o2.cz. [109.81.91.107])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a53244fceasm1163645f8f.82.2025.06.06.01.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 01:31:08 -0700 (PDT)
Date: Fri, 6 Jun 2025 10:31:07 +0200
From: Michal Hocko <mhocko@suse.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
Message-ID: <aEKnSxHG8_BGj7zQ@tiehlicka>
References: <20250604140544.688711-1-david@redhat.com>
 <aEFC_12om2UHFGbu@tiehlicka>
 <1a65d0e6-6088-4a15-9c19-537203fe655c@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a65d0e6-6088-4a15-9c19-537203fe655c@redhat.com>

On Fri 06-06-25 10:10:14, David Hildenbrand wrote:
> On 05.06.25 09:10, Michal Hocko wrote:
> > On Wed 04-06-25 16:05:44, David Hildenbrand wrote:
> > > Especially once we hit one of the assertions in
> > > sanity_check_pinned_pages(), observing follow-up assertions failing
> > > in other code can give good clues about what went wrong, so use
> > > VM_WARN_ON_ONCE instead.
> > > 
> > > While at it, let's just convert all VM_BUG_ON to VM_WARN_ON_ONCE as
> > > well. Add one comment for the pfn_valid() check.
> > > 
> > > We have to introduce VM_WARN_ON_ONCE_VMA() to make that fly.
> > > 
> > > Drop the BUG_ON after mmap_read_lock_killable(), if that ever returns
> > > something > 0 we're in bigger trouble. Convert the other BUG_ON's into
> > > VM_WARN_ON_ONCE as well, they are in a similar domain "should never
> > > happen", but more reasonable to check for during early testing.
> > 
> > The patch itself makes sense and I think it is good time to revisit old
> > discussion [1] and finally drop VM_BUG_ON altogether and replace it by
> > VM_WARN_ON which could be still a useful debugging aid.
> 
> Yes. I think we should check all cases if they are really relevant (and are
> clear), and also handle BUG_ON on the way.

There are more than 600 VM_BUG_ON instances. I am not sure it is
feasible to review single one of them. Turning them into VM_WARN_ON
should be reasonably safe as they are not enabled in production
environment anyway so we cannot really rely on those. Having them in
WARN form would be still useful for debugging and those that really need
a crash dump while debugging can achieve the same result.

So while I agree that many of them could be dropped or made more clear
those could be dealt with after a mass move. An advantage of this would
be that we can drop VM_BUG_ON* and stop new instances from being added.

Just my 2cents
-- 
Michal Hocko
SUSE Labs
