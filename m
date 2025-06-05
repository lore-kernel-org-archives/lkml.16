Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7553134CB
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 08:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749111795; cv=none; b=llD3MxJF4KFmnQYYfCbKhGPB9wL5+0bQOBmsaLtt4zI/QiSvDhgaxCQ5Y+w+PQM4yplDFccpp4bVDsI6y1IzRVT5YqkYlBDxdL0zECl3JgqRjUPTlmasujWron4z+28Yaky3U6OSb+v6s6XKFqGQFXfrNJOAGiOB69lzF3aSSlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749111795; c=relaxed/simple;
	bh=B4ysrMxEsk9Rh5gAtJvCAmde43xe4sHeZk8GusInAP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AVCPRdDcdczQ5fuX3h0+RICDYp5VF4V96LT7W8fnnlXIvFZIhbGT0mGi0udmJrCL7Fy9MojiCjdD78xfZ42nFekA0STYBy825gFIJENTO96DCn1IVj9Txx2u61pqM6LYlGwTyCx+cAf0SFaCQ16y4Y+lBNbT535SHYyZfVPn/kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=PQcAVCr2; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="PQcAVCr2"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23228b9d684so7505885ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 01:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1749111793; x=1749716593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnhYVXyPNED7aSa+QtVGAu9aQawWwPe0ExGu8cnyfFA=;
        b=PQcAVCr22l9JX1ymj11wpK+4C2xAqF+A9Dr+zrijij43GFsuEpcAD8PQcaYOa64HgS
         3/FWFgiIWEjgBdw6IwsaVzyaPDOBxBM3yS0CaUIpSz5qH9YyOHp6rimxdxiJH/0uB+CW
         0XxBjUp++TTuBI9/6ZpxP8tC85JySCLWjqTNXl6akWbmvpxtzfHuvhjM82U1ZLQsi/ze
         E9cuGB7mwz6VAsPaByJQtUlZHlh/eg6wxCpGPkXQE2nsK9diY9sCvy7N7gwf3S1cWLjU
         SkEj2DMMr57XdHPGd8Uau0k++H3bpzom5yEEm2TTuE4HV2qyEbNiEWhtZYds+N9MxrL0
         V7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749111793; x=1749716593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XnhYVXyPNED7aSa+QtVGAu9aQawWwPe0ExGu8cnyfFA=;
        b=emYRCR85xl+che6kTNEUfP8UuMI493KNBKSTabKmZPspw9eN0kWXIma3oBC0MUWVTo
         O/UfRxcXPpVps2uTHCKjBTRarznzg/R9WwDTpFr9OgdrVhQoNfUvkpTMbhPlxmlbr89b
         OH/u0BR+PrI58chTL4T2gjcIOtL8qJXwqveE1Z/+yupceZiRKI45rwunKqGu5aCG0Ue4
         3JkQRNLik34DhnTW4BQ3T505Wl/d0fdVWaopYmnyZ4y9FEDqq+Fz3GC2PlHvJGGHaFV3
         SFM7zJ776+JwBJUcuVUU8sb/hE2gtvMdnNTmdBSw1H+cQLejOWTUWytXD+x/d0k19Q0Y
         fKfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxCIJGD1jJKn9MECcu8zChaZ6JSMLFRpMX1kmsfs7C0SKVlpCFq/gqdslVDsJYGmCLdtbwoRYeL4UAiac=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzOVWaY73W5W7Y7X5tYdEpEocsoiAL7oxweB11Yyz+uY/VQWqo
	QfyaJtOytRT8ZT66FoD8XnA7fM8HtT7ZIqCAjxmKRqIimVsbqgNHlsjDFeHpZ9FFHA0=
X-Gm-Gg: ASbGncsWUepI68MxbU8T+D/k8eIMf1iEv4Me2xSJ77nYzd4n6Rj5IbGEv5lOQdiWGG/
	uSPcPCewVku+LG1O+yMVeoCteUZ6vqryWGMQzB1FRcO2FzAe0V/n4UsBPLhNWqSkYDM3K7+sLeo
	9Wgo0CV3c5ehuN/exZIzHV3n8ZcJUjwX+RBvx5ae410LN8bYMjjm45sQT+A0G0/Vrjp6JOr6neb
	wq93u+6DZ0AD/69bas8cD/fTLxqt2pbqOvKxIaWKhlXztIekgTccdI66IeRO5jOuE88WLOCZ53Y
	2U4Oh9v0VQgIrbDi1I6W6g5hxdcUjIyG9wj8/xC2fnGLVRhtdR7jkqRxR/4MqpPRcBfwl180TU3
	ii+E=
X-Google-Smtp-Source: AGHT+IH/uXMpO9vPlvwO5HE6KiJ+VbwN8EwnVeB/4PqiwC40qukfCsjqe5p4aL0wGoWKyJb7NE1+9Q==
X-Received: by 2002:a17:902:d510:b0:234:bef7:e227 with SMTP id d9443c01a7336-235e1150935mr73488875ad.18.1749111793100;
        Thu, 05 Jun 2025 01:23:13 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc8695sm115300815ad.34.2025.06.05.01.23.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Jun 2025 01:23:12 -0700 (PDT)
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
Subject: Re: [PATCH v3] gup: optimize longterm pin_user_pages() for large folio
Date: Thu,  5 Jun 2025 16:23:05 +0800
Message-ID: <20250605082305.5280-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <9b04871b-33fb-42cb-840b-88fdb6b93c48@redhat.com>
References: <9b04871b-33fb-42cb-840b-88fdb6b93c48@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 5 Jun 2025 09:51:06 +0200, david@redhat.com wrote:

> On 05.06.25 05:34, lizhe.67@bytedance.com wrote:
> > From: Li Zhe <lizhe.67@bytedance.com>
> > 
> > In the current implementation of the longterm pin_user_pages() function,
> > we invoke the collect_longterm_unpinnable_folios() function. This function
> > iterates through the list to check whether each folio belongs to the
> > "longterm_unpinnabled" category. The folios in this list essentially
> > correspond to a contiguous region of user-space addresses, with each folio
> > representing a physical address in increments of PAGESIZE. If this
> > user-space address range is mapped with large folio, we can optimize the
> > performance of function collect_longterm_unpinnable_folios() by reducing
> > the using of READ_ONCE() invoked in
> > pofs_get_folio()->page_folio()->_compound_head(). Also, we can simplify
> > the logic of collect_longterm_unpinnable_folios(). Instead of comparing
> > with prev_folio after calling pofs_get_folio(), we can check whether the
> > next page is within the same folio.
> > 
> > The performance test results, based on v6.15, obtained through the
> > gup_test tool from the kernel source tree are as follows. We achieve an
> > improvement of over 66% for large folio with pagesize=2M. For small folio,
> > we have only observed a very slight degradation in performance.
> > 
> > Without this patch:
> > 
> >      [root@localhost ~] ./gup_test -HL -m 8192 -n 512
> >      TAP version 13
> >      1..1
> >      # PIN_LONGTERM_BENCHMARK: Time: get:14391 put:10858 us#
> >      ok 1 ioctl status 0
> >      # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> >      [root@localhost ~]# ./gup_test -LT -m 8192 -n 512
> >      TAP version 13
> >      1..1
> >      # PIN_LONGTERM_BENCHMARK: Time: get:130538 put:31676 us#
> >      ok 1 ioctl status 0
> >      # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> > 
> > With this patch:
> > 
> >      [root@localhost ~] ./gup_test -HL -m 8192 -n 512
> >      TAP version 13
> >      1..1
> >      # PIN_LONGTERM_BENCHMARK: Time: get:4867 put:10516 us#
> >      ok 1 ioctl status 0
> >      # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> >      [root@localhost ~]# ./gup_test -LT -m 8192 -n 512
> >      TAP version 13
> >      1..1
> >      # PIN_LONGTERM_BENCHMARK: Time: get:131798 put:31328 us#
> >      ok 1 ioctl status 0
> >      # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> > 
> > Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> > ---
> > Changelogs:
> > 
> > v2->v3:
> > - Update performance test data based on v6.15.
> > - Refine the description of the optimization approach in commit message.
> > - Fix some issues of code formatting.
> > - Fine-tune the conditions for entering the optimization path.
> > 
> > v1->v2:
> > - Modify some unreliable code.
> > - Update performance test data.
> > 
> > v2 patch: https://lore.kernel.org/all/20250604031536.9053-1-lizhe.67@bytedance.com/
> > v1 patch: https://lore.kernel.org/all/20250530092351.32709-1-lizhe.67@bytedance.com/
> > 
> >   mm/gup.c | 37 +++++++++++++++++++++++++++++--------
> >   1 file changed, 29 insertions(+), 8 deletions(-)
> > 
> > diff --git a/mm/gup.c b/mm/gup.c
> > index 84461d384ae2..9fbe3592b5fc 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -2317,6 +2317,31 @@ static void pofs_unpin(struct pages_or_folios *pofs)
> >   		unpin_user_pages(pofs->pages, pofs->nr_entries);
> >   }
> >   
> > +static struct folio *pofs_next_folio(struct folio *folio,
> > +				struct pages_or_folios *pofs, long *index_ptr)
> 
> ^ use two tabs here
> 
> > +{
> > +	long i = *index_ptr + 1;
> > +
> > +	if (!pofs->has_folios && folio_test_large(folio)) {
> > +		const unsigned long start_pfn = folio_pfn(folio);
> > +		const unsigned long end_pfn = start_pfn + folio_nr_pages(folio);
> > +
> > +		for (; i < pofs->nr_entries; i++) {
> > +			unsigned long pfn = page_to_pfn(pofs->pages[i]);
> > +
> > +			/* Is this page part of this folio? */
> > +			if (pfn < start_pfn || pfn >= end_pfn)
> > +				break;
> > +		}
> > +	}
> > +
> > +	if (unlikely(i == pofs->nr_entries))
> > +		return NULL;
> > +	*index_ptr = i;
> > +
> > +	return pofs_get_folio(pofs, i);
> > +}
> > +
> >   /*
> >    * Returns the number of collected folios. Return value is always >= 0.
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
> > +	struct folio *folio;
> > +	long i = 0;
> >   
> > -		if (folio == prev_folio)
> > -			continue;
> > -		prev_folio = folio;
> > +	for (folio = pofs_get_folio(pofs, i); folio;
> > +			folio = pofs_next_folio(folio, pofs, &i)) {
> 
> As discussed, align both "folios" (using tabs and then spaces)
> 
> Acked-by: David Hildenbrand <david@redhat.com>

Thank you very much for your review. I will fix the issue in v4 patch.

Thanks,
Zhe
