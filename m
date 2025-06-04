Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346501E5B65
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 09:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749028302; cv=none; b=TENaFI3T5xkWgYSVzv2H7AfKl+npGfRFQgaD0GxTSZIBNA7dGGxACGE7UWoKjFt21w2mLcmMBVhA6E1Vi7MN9IRmYs/Vvxtt4aA+zuPgFpWCnkY+sILj5KXUnnFwgtXkIxOId4seEgtIEA6JVtdYbGs/g6G2aLAi+X79oX9vMKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749028302; c=relaxed/simple;
	bh=S5J0+wCJmL+3v7oZHgBsJnC/sXWXQlfUv3BvAqpa7tw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M+dPaU5nfMhRU41Ao1ym0pD7aRw7V7IQmUkjAMInlA+pMHd7C3DImQsG2k4okng0F0vcXGKzyvuSyJ7FH5B+KuzWDsRqNIQ6Tvb/62OlweBLFZfBD6IFSjRoi0c661TQPUKvaxOgOLiLTfzS44kD0zTFsBH3Vb5wYAQAle4vv/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=g0/2RDhm; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="g0/2RDhm"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so623718b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 02:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1749028299; x=1749633099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fN0n5i1QghhWPn2s1AUBF5qT3egTd8+5Ira32SnS9D8=;
        b=g0/2RDhmpyOqoqJifqsPq6WxlJJoTh1jWuAIpk6TG0IlBwXALRLi1WhBXdAetgHpni
         E5vQJLQTlELl7YOtDvIcwybW+ZoMt3eGYmSglxTcB56N260yTpBTKpQIm6fdu/lp0Zzo
         OHIfTFl3GY4yPGRYQdS0H2C+HQf6cAisT450M1vQsF69ZVqj3vvSU6F+xkptIdqevD+g
         SEULYMSBGkmMpOKC0xR1Icq59XECwTxbKXzBi1bwRy11LIXmvWltjI51ofIYEyYz3Tri
         Vtii8nya1MpuLNWfi4bm1NhYri1J1F2ZGAnXELO/YwE//HipiZtkOu4AqTN44uEBNpU4
         0/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749028299; x=1749633099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fN0n5i1QghhWPn2s1AUBF5qT3egTd8+5Ira32SnS9D8=;
        b=NauH8+KVNnLjY+8Wh6kpq9EpZoLxueg52bZ5tGQMNL7YfXOR2BO+Q5Ie1xS3spC3+a
         i2vyUZxIAwRuuO+2gxBPOFHlomQsi+0jAtYeuIJSRVv8bRCDZ8CkMQgRu0ytVE1ZqAQH
         1FRMjB8GDmhh0Ms0ks8uakqj+fmULvo+I4lcCOQbbX6Zwy2nAKSk1LIeJIc+X3SbSZBK
         4xWA4AMzxp0v1ZD4uX5B8hg2DjtDE1Y9rAISwogF+4MBO9YtfWiwm0lOEvUVo0OavLpA
         6F0DPc2eh3+JQJIxZ+NRlDGkfILPDZaBZsIiKroD9JoWj1eWf0bar//Cej/sl3io6iGL
         Kajw==
X-Forwarded-Encrypted: i=1; AJvYcCURol4gaxS5tbSUQly47/y5SNInugCFiSl4Rb57y8noqaM9UTbiB3L/TFEVHghOAYz1mE3W4t8IHU/RZGk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH5zjtxZEATOM/eL/Bc32vtAEQ1zoKmiYrvUBbcy9Jev0f3Bp4
	Bw0DDA4z3w4/9Urs8s4Bm2qz7qyQ/eySnystOjCToAztSfsllgmJMYWBTnNH7UebUUw=
X-Gm-Gg: ASbGncsbB7UKlIyzLyteSzP/ywZ4sl27E6j3nUfpYYj9em483KC8uSUnK4/Hwgm1Qee
	rjXnr5NXeTE2L7H/+Kd9+GLqoJbSUzPDczfQuGsFVq3x4sgmN2HdhAkMNUuroeA71sXp+VupJHN
	WeNRWUlxUkJn8Fl10KLZTAW93uTGS7fNpP8Qgcg8K5lNnFoTRS4o3FXfkDKvLDw47+oxwtG0DVZ
	SLiJQ9T46ZhSR/k9NY3H8FLtKrtiQ908ItkK9tk4FE69RcEyOarEAha4s2uUyliVTbfqg7eFnU6
	/dMUlwXj5rtPxniO+VJAsRdZUqI97NuXOmJdW22BeGjfe7g4IS69AAH8czVGY3eVr22BOGCTjbM
	WgA==
X-Google-Smtp-Source: AGHT+IFVhQyi8RsGNCupYuzWuOGowecUWPJ8BmXqSNZnrhiaDhVw6bNBTaHqqmqqKvibeov1ZyHBDA==
X-Received: by 2002:a05:6a00:b86:b0:736:b400:b58f with SMTP id d2e1a72fcca58-747fde8480dmr7307388b3a.0.1749028299273;
        Wed, 04 Jun 2025 02:11:39 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeab33dsm10642959b3a.41.2025.06.04.02.11.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Jun 2025 02:11:38 -0700 (PDT)
From: lizhe.67@bytedance.com
To: david@redhat.com
Cc: akpm@linux-foundation.org,
	dev.jain@arm.com,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lizhe.67@bytedance.com,
	muchun.song@linux.dev,
	peterx@redhat.com
Subject: Re: [PATCH v2] gup: optimize longterm pin_user_pages() for large folio
Date: Wed,  4 Jun 2025 17:11:31 +0800
Message-ID: <20250604091131.32908-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <5023a912-1ee9-4082-8656-56e004623367@redhat.com>
References: <5023a912-1ee9-4082-8656-56e004623367@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 4 Jun 2025 10:12:00 +0200, david@redhat.com wrote:

> On 04.06.25 05:15, lizhe.67@bytedance.com wrote:
> > From: Li Zhe <lizhe.67@bytedance.com>
> > 
> > In the current implementation of the longterm pin_user_pages() function,
> > we invoke the collect_longterm_unpinnable_folios() function. This function
> > iterates through the list to check whether each folio belongs to the
> > "longterm_unpinnabled" category. The folios in this list essentially
> > correspond to a contiguous region of user-space addresses, with each folio
> > representing a physical address in increments of PAGESIZE. If this
> > user-space address range is mapped with large folio, we can optimize the
> > performance of function pin_user_pages() by reducing the frequency of
> > memory accesses using READ_ONCE. This patch leverages this approach to
> > achieve performance improvements.
> > 
> > The performance test results obtained through the gup_test tool from the
> > kernel source tree are as follows. We achieve an improvement of over 70%
> > for large folio with pagesize=2M. For normal page, we have only observed
> > a very slight degradation in performance.
> > 
> > Without this patch:
> > 
> >      [root@localhost ~] ./gup_test -HL -m 8192 -n 512
> >      TAP version 13
> >      1..1
> >      # PIN_LONGTERM_BENCHMARK: Time: get:13623 put:10799 us#
> >      ok 1 ioctl status 0
> >      # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> >      [root@localhost ~]# ./gup_test -LT -m 8192 -n 512
> >      TAP version 13
> >      1..1
> >      # PIN_LONGTERM_BENCHMARK: Time: get:129733 put:31753 us#
> >      ok 1 ioctl status 0
> >      # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> > 
> > With this patch:
> > 
> >      [root@localhost ~] ./gup_test -HL -m 8192 -n 512
> >      TAP version 13
> >      1..1
> >      # PIN_LONGTERM_BENCHMARK: Time: get:4075 put:10792 us#
> >      ok 1 ioctl status 0
> >      # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> >      [root@localhost ~]# ./gup_test -LT -m 8192 -n 512
> >      TAP version 13
> >      1..1
> >      # PIN_LONGTERM_BENCHMARK: Time: get:130727 put:31763 us#
> >      ok 1 ioctl status 0
> >      # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> > 
> > Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> > ---
> > Changelogs:
> > 
> > v1->v2:
> > - Modify some unreliable code.
> > - Update performance test data.
> > 
> > v1 patch: https://lore.kernel.org/all/20250530092351.32709-1-lizhe.67@bytedance.com/
> > 
> >   mm/gup.c | 37 +++++++++++++++++++++++++++++--------
> >   1 file changed, 29 insertions(+), 8 deletions(-)
> > 
> > diff --git a/mm/gup.c b/mm/gup.c
> > index 84461d384ae2..57fd324473a1 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -2317,6 +2317,31 @@ static void pofs_unpin(struct pages_or_folios *pofs)
> >   		unpin_user_pages(pofs->pages, pofs->nr_entries);
> >   }
> >   
> > +static struct folio *pofs_next_folio(struct folio *folio,
> > +				struct pages_or_folios *pofs, long *index_ptr)
> > +{
> > +	long i = *index_ptr + 1;
> > +
> > +	if (!pofs->has_folios) {
> 
> && folio_test_large(folio)
> 
> To avoid all that for small folios.

Great! This approach will minimize the impact on small folios.

> > +		unsigned long start_pfn = folio_pfn(folio);> +		unsigned long end_pfn = start_pfn + folio_nr_pages(folio);
> 
> I guess both could be const
> 
> > +> +		for (; i < pofs->nr_entries; i++) {
> > +			unsigned long pfn = page_to_pfn(pofs->pages[i]);
> > +
> > +			/* Is this page part of this folio? */
> > +			if ((pfn < start_pfn) || (pfn >= end_pfn))
> 
> No need for the inner ()
> 
> > +				break;
> > +		}
> > +	}
> > +
> > +	if (unlikely(i == pofs->nr_entries))
> > +		return NULL;
> > +	*index_ptr = i;> +
> > +	return pofs_get_folio(pofs, i);
> 
> We're now doing two "pofs->has_folios" checks. Maybe the compiler is
> smart enough to figure that out.

I also hope that the compiler can optimize this logic.

> > +}
> > +
> >   /*>    * Returns the number of collected folios. Return value is always >= 0.
> >    */
> > @@ -2324,16 +2349,12 @@ static void collect_longterm_unpinnable_folios(
> >   		struct list_head *movable_folio_list,
> >   		struct pages_or_folios *pofs)
> >   {
> > -	struct folio *prev_folio = NULL;
> >   	bool drain_allow = true;
> > -	unsigned long i;
> > -
> > -	for (i = 0; i < pofs->nr_entries; i++) {
> > -		struct folio *folio = pofs_get_folio(pofs, i);
> > +	long i = 0;
> > +	struct folio *folio;
> 
> Please keep the reverse christmas tree where we have it. Why
> the change from "unsigned long" -> "long" ?

This is because I want to match the type of pages_or_folios->nr_entries.
I'm not sure if it's necessary.

> >   
> > -		if (folio == prev_folio)
> > -			continue;
> > -		prev_folio = folio;
> > +	for (folio = pofs_get_folio(pofs, 0); folio;
> > +			folio = pofs_next_folio(folio, pofs, &i)) {
> 
> Please indent as
> 
> for (folio = pofs_get_folio(pofs, 0); folio;
>       folio = pofs_next_folio(folio, pofs, &i)) {
> 
> But the usage of "0" and "&i" is a bit suboptimal.
> 
> for (folio = pofs_get_folio(pofs, i); folio;
>       folio = pofs_next_folio(folio, pofs, &i)) {
> 
> Might be better.

Thank you for all your suggestions! I will complete the amendments
as you advised.

Thanks,
Zhe
