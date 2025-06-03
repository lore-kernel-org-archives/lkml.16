Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A924F5E0
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 08:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748940438; cv=none; b=T1tjJbEolAOs6WWKWBD7OYydCF/gJiLvWNov380IkQp+22X6WCVrtEWfTKvckMRXxBrrDAGu4xPZakJ+ANO6wjfZiyyjZ62I1LyDi20o7k7bobPMmaa1vlz7JKAnp4wjVp40u+XXKQUIiZo7/eWDBmUeKuPoASri8VxOxlme3Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748940438; c=relaxed/simple;
	bh=CrdM34Wj6mwAr8dYjpc2mymoBl0WOeXIaweW1AxylC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JNJxuiiOjUKGce4Skt6uNR5MwNYgO7u0WUeYMJ0SaHP1XbwT5bk0vBYhVQh1aH2NdsFMChc0Xe0NX0xC+cckOQlrVsb1mQWMb4+QiABrqDeKbuz65wdtVtNF4MxHcXhw9emHmvMwy/9eYb72G4XvKpQyDCLSv0L/NNpJvftb/FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7KVkiGq; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7KVkiGq"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4e7004fa2c0so973988137.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 01:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748940435; x=1749545235; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=reK2EDrij9u9D1X1eWD4tVD+OLpKJcK0SjBwwERO1fk=;
        b=k7KVkiGq+cOBSceuVHhLgR8ANhJkIUgatH0fCgMQ3UdM9ENQLU7EiWw+7FlRYctAz7
         M71ZHeiLJae38TGifAkQUSQGETTVtaqIg09YZHtJULDV/Os3/kedDy4xbEKbwQ4IU5de
         x/J2rkd4Sky2aL/TdJZ1BQL/d4L/lDPdR3Y/Hthb+lNCww3EBOfYt/7ry4MoDATTRRa2
         Wew1HABEeln609jfDr1Sy0o1B3v7YIVNqXQgaKis9nbosqC1tXS++jQYMpyKTcQcPHBn
         adY+dzMEMrTQB36sqz6torT5UtTVcUf4BAdBp1eClRmjmE+s6F70e3Nci+H0VnE2jorO
         nBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748940436; x=1749545236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=reK2EDrij9u9D1X1eWD4tVD+OLpKJcK0SjBwwERO1fk=;
        b=wf4RanM74PawpnKX4Oedvk2ybIKS09OXW1n9EdfF1sSqwiIGWcd1hj+KiFqlLyCeZH
         YF6RafWbScL3KlPorZHfCkPLCLTXmL4CyQiFYpgQ18cwbjN854U4NdLIHWeCSdB8snrg
         HOruL0eXBrWfVi9BAcnnYh1gwTOR/5PutbsDU8hWEkBpYe2WUgIjD0eQ8PkEA9tvpYz7
         Zw3PvdICBuTtbr73TW88l+4MEPq6pb6b/CnFiAC0d09Ywj8vI+K/jtxQw5S4cmqAeaCh
         S0pNnKMrJkQG2AAwm8o9+QhRD1IhgbzPBAQAbKmjvjpDVNexwBb1YCVw/SDxDw0KlgMK
         tsrg==
X-Forwarded-Encrypted: i=1; AJvYcCW19tHzWxOXTl/2Ff0snYguVGPSk3sM4tdd02ODVVcCI8OVEdSLT1vvefbnoExXj9js2lGUKkolKgW0A0E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw92hamwDij+O/QdUKNjhUhODBvFVYvRIJXSv1kyHmvZl81kbAz
	0Iq/BzK8MSj0vg+mSGRK/7qlzZEJUZbLb0yvB4IEkEKVn57w3b+3SUKiGJCu/FIvJW3iER2K24q
	VrnZUagD+tQci81miDrw6lznYSOyaIXA=
X-Gm-Gg: ASbGnctxgD8hO2iz6ZWNLPtIqIBnMxz363ZTW+KRfcPpJE4/Z6Q53P8w6Q4aUBD9pWX
	Rf0ePwaeST1InM2UuB7YVKqRpzA/qyJ2/p9WwDYR+iDFK9xsisP4RiP5mS+Z390jziKZsHJasNw
	plOmUszVOUDJIEV1wFPSeGZBe3PYGGB7coCUdr/aZmOZFq
X-Google-Smtp-Source: AGHT+IEZ31ddxS8xv3IgGacP1h0TAoQtOr1yeIacfQiXFf12XbWrRK8adpEoJaO3KRN4lrgTzrS9ZXmjDh9O0Ang1ow=
X-Received: by 2002:a05:6102:50a6:b0:4e5:9227:eb2e with SMTP id
 ada2fe7eead31-4e6ecd69631mr11249497137.10.1748940435631; Tue, 03 Jun 2025
 01:47:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603013154.5905-1-21cnbao@gmail.com> <7bd57eba-42a0-4bf3-8632-b91c401b7316@arm.com>
In-Reply-To: <7bd57eba-42a0-4bf3-8632-b91c401b7316@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 3 Jun 2025 20:47:04 +1200
X-Gm-Features: AX0GCFvsybCckVS8gqFdpycHWOKap9SG3IdwnVPISeQCp-mWGOkRBSx-LYNt5ko
Message-ID: <CAGsJ_4y3zWS_rHY4=WWuA9BANYwR=r-j9nrfiX2TAQwuo11JdA@mail.gmail.com>
Subject: Re: [PATCH RFC] mm: madvise: use walk_page_range_vma() for madvise_free_single_vma()
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Lokesh Gidra <lokeshgidra@google.com>, 
	Tangquan Zheng <zhengtangquan@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 6:11=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
>
>
> On 03/06/25 7:01 am, Barry Song wrote:
> > From: Barry Song <v-songbaohua@oppo.com>
> >
> > We've already found the VMA before calling madvise_free_single_vma(),
> > so calling walk_page_range() and doing find_vma() again seems
> > unnecessary. It also prevents potential optimizations for MADV_FREE
> > to use a per-VMA lock.
> >
> > Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Cc: David Hildenbrand <david@redhat.com>
> > Cc: Vlastimil Babka <vbabka@suse.cz>
> > Cc: Jann Horn <jannh@google.com>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Lokesh Gidra <lokeshgidra@google.com>
> > Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > ---
> >   mm/madvise.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/mm/madvise.c b/mm/madvise.c
> > index d408ffa404b3..c6a28a2d3ff8 100644
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -826,7 +826,7 @@ static int madvise_free_single_vma(struct madvise_b=
ehavior *madv_behavior,
> >
> >       mmu_notifier_invalidate_range_start(&range);
> >       tlb_start_vma(tlb, vma);
> > -     walk_page_range(vma->vm_mm, range.start, range.end,
> > +     walk_page_range_vma(vma, range.start, range.end,
> >                       &madvise_free_walk_ops, tlb);
> >       tlb_end_vma(tlb, vma);
> >       mmu_notifier_invalidate_range_end(&range);
>
> Can similar optimizations be made in madvise_willneed(), madvise_cold_pag=
e_range(), etc?

Yes, I think the same code flow applies to madvise_willneed,
madvise_cold_page_range, and similar functions, though my current
interest is more on madvise_free.

Let me prepare a v2 that includes those as well.

>

Thanks
Barry
