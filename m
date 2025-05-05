Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E298494
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 15:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746459245; cv=none; b=VlSO/xcRcT5EndePTznu2iq1bYLB84G0APfjy4cgvChAOa5bwcBU06CYAMl5HzHAuEAeHuUryodI6uyf52Pzh3+IpydosDKh2aKnQM+pXQ96eBqx5RHmEV3/rZw1h01j2lnH64+w8tZuY/PxCI9blkuZBRcm6OW3kN7CzzsGfIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746459245; c=relaxed/simple;
	bh=NX3aO0Wa19hfzrfRoBwdvVMDybLFkeT6eYK03yhF6ew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fR9D/Z+JMOGyIj+WebmMjZgy6Cb4u/eS97ZahiPilzZuC+tVfJFwzZlLBc9s6EqsTlotMcAb1Ct8K9K7rB7Hw1aB5bvaf1gnW5PPDAmtcW/oeazGuC6j8TTT0NlDcztLmzRVp6tVcIZ6YTRbXtbpm6wPl2tfdfCg+ypu+cLsC5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CaRLW3hb; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CaRLW3hb"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-47666573242so603871cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 08:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746459243; x=1747064043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1EEhExze4nGaOSS6h+QkzgoCthF+NFNWdSYTeJVkAHI=;
        b=CaRLW3hbhEgKk5q2By/63dUp3qowQ+d+B+rPZvccKS6bT1CjQ55PrmuBQNnG/H4VP9
         qIU7xUQTCcfzGbUiSlrdd3+jKZb/0nXdiuyNiJaqd2mksZ/WQF1Vkshpat59UWFtPPsW
         b5idABLHkDrs4c8JeFb6gWJBXdKH77ytXWDZgU9plfLarHTpWw9AH7GSbi59RQBXbIek
         3X7nwL9MZ5axPp2DGGY4Jg+iwipnH3MTuJcN8lyikZZNpr1TACgENBz1lLdkXoVKkBdB
         JoRhnsjZGhSEytqR59wDCCjEgf5k924sEDiEgvsC1NN4UzrNbCsEgArd1AiUviEkaF13
         dqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746459243; x=1747064043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1EEhExze4nGaOSS6h+QkzgoCthF+NFNWdSYTeJVkAHI=;
        b=ZaalClfiu0ID7Y2kzgwkcDVM2lbSuZkpW/aiy0AStSR3YNBgCKUYQqpS8jFIGfe9X4
         LtZocDPfu3KN2NzvxGU+UUx/nyidIvqzUO3z6RaYPD/bJ0h6vmGSUwxVqxGCxHW8vgve
         QUhq1a7HZBqPUjrjBU192sYOYSNWyqdNNadpXwlralsiDqNvqpDblDqIHjAc0ojiU37+
         nDVGcPpiSH/bwwefKN2lBnMGYC+H2eZ8Sh8EezQgv4SaOtIn39wx/GDdaRE4rka+Chev
         egWl5Rpq21lMG6kZ44fP4AVMJgFB0stK+beSZFTY49upXSLC1XGSICcmMk4ilRl8jSqf
         9kfw==
X-Forwarded-Encrypted: i=1; AJvYcCXgymLLeg/my/oBqz2aabFpyiBm86fm7xNyVEuJkRQLB1PzriQsVoWdoKqcxnU3cfi9EWfclvbx9NvogNs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsXmsioBhOQu+LI27p9x0LN7oGefhZiPKcUu+9n+PiJe/JiH2Q
	LqC3BEUCDT7eaLrucbJQ4McoWc4Nxkj9pxH9L2A5ij9x9z2bEZQzw8HqXlkEOt4vRu1qq3827un
	cCNam040VpMr7JHBOT6hlFwW9uyOq8TmlTfHo
X-Gm-Gg: ASbGncseJXg6Yl+v+F6RLSPuQ3a0x91S5q5Q6Kxgy+RB/fMVr0n77sTIvwBzILSgeFO
	xt9Tl607iCF1GJNT2p3xw9DNJukVGDVAu7sZbWKXW1lLy56KUnZOUw2DO1p1EMMAODSwp4Mx9+/
	CxIZ24SyMK398KqfIO3LGi
X-Google-Smtp-Source: AGHT+IFHhIf9cc1j7ibR9Zj7OATCdnW6ZfnOERNuEMelmHogh87lFR7IyALw18g/z+7SytACBVCPmtIXHR1kdLTQxV4=
X-Received: by 2002:a05:622a:138b:b0:477:2c12:9253 with SMTP id
 d75a77b69052e-490cc65989amr328131cf.16.1746459242736; Mon, 05 May 2025
 08:34:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250504061923.66914-1-00107082@163.com> <8edbd2be-d495-4bfc-a9f3-6eaae7a66d91@suse.cz>
 <1da43908.3afc.196a0db7dc3.Coremail.00107082@163.com> <0feb4309-431f-4b74-83bf-e16198798c30@suse.cz>
In-Reply-To: <0feb4309-431f-4b74-83bf-e16198798c30@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 5 May 2025 08:33:50 -0700
X-Gm-Features: ATxdqUG3Gu4Xft59TurE808b6GmXzaytjhpOLVL4DZRP8Ri67kZlOt8dfbHX91M
Message-ID: <CAJuCfpHS9obp7yoxRUPoj3Yp8KkkYWCnnoXwtmAOxfynnq8aug@mail.gmail.com>
Subject: Re: [PATCH] mm/codetag: sub in advance when free non-compound high
 order pages
To: Vlastimil Babka <vbabka@suse.cz>
Cc: David Wang <00107082@163.com>, akpm@linux-foundation.org, mhocko@suse.com, 
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 7:55=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wro=
te:
>
> On 5/5/25 16:31, David Wang wrote:
> >
> >
> > At 2025-05-05 21:12:55, "Vlastimil Babka" <vbabka@suse.cz> wrote:
> >>On 5/4/25 08:19, David Wang wrote:
> >>> When page is non-compound, page[0] could be released by other
> >>> thread right after put_page_testzero failed in current thread,
> >>> pgalloc_tag_sub_pages afterwards would manipulate an invalid
> >>> page for accounting remaining pages:
> >>>
> >>> [timeline]   [thread1]                     [thread2]
> >>>   |          alloc_page non-compound
> >>>   V
> >>>   |                                        get_page, rf counter inc
> >>>   V
> >>>   |          in ___free_pages
> >>>   |          put_page_testzero fails
> >>>   V
> >>>   |                                        put_page, page released
> >>>   V
> >>>   |          in ___free_pages,
> >>>   |          pgalloc_tag_sub_pages
> >>>   |          manipulate an invalid page
> >>>   V
> >>>   V
> >>>
> >>> Move the tag page accounting ahead, and only account remaining pages
> >>> for non-compound pages with non-zero order.
> >>>
> >>> Signed-off-by: David Wang <00107082@163.com>

Thanks for reporting!

> >>
> >>Hmm, I think the problem was introduced by 51ff4d7486f0 ("mm: avoid ext=
ra
> >>mem_alloc_profiling_enabled() checks"). Previously we'd get the tag poi=
nter
> >>upfront and avoid the page use-after-free.

Right, sorry I missed that.

> >
> >
> > Oh, you're right. I forgot to check history......
> >
> >
> >>
> >>It would likely be nicer to fix it by going back to that approach for
> >>___free_pages(), while hopefully keeping the optimisations of 51ff4d748=
6f0
> >>for the other call sites where it applies?
> >
> > After checking that commit, I kind of feels the changes in __free_pages=
 are
> >  the major optimization of the commit....
>
> We could have both pgalloc_tag_get() to use in __free_page() as before
> 51ff4d7486f0, and keep __pgalloc_tag_get() to use in pgalloc_tag_split() =
and
> pgalloc_tag_swap().

Yes, we can add back pgalloc_tag_get() which would call
__pgalloc_tag_get() if mem_alloc_profiling_enabled() is true and
change pgalloc_tag_sub_pages() back to use tags instead of pages.
__free_pages() is the only user of that function, so that change
should not affect anything else.

>
> I think __free_page() didn't benefit from the stated purpose of "avoiding
> mem_alloc_profiling_enabled() ... which is often called after that check =
was
> already done"
>
> > What about revert that commit and make optimization by condition checks=
,
> > similar to what this patch did?
>
> The downside of the condition checks is they make the code more complex a=
nd
> might actually increase overhead when mem_alloc_profiling_enabled() is
> false, as those checks add non-static branches outside of the static bran=
ch
> that's mem_alloc_profiling_enabled().
>
> I think __free_pages() before 51ff4d7486f0 was quite ok.
>
> - pgalloc_tag_get() is done unconditionally, but its code is all inside t=
he
> mem_alloc_profiling_enabled() static branch so that's a no-op when profil=
ing
> is not enabled
>
> - pgalloc_tag_sub_pages() is also all behind the static branch inside. Al=
so
> it's a very rare path anyway, most freeing should go through the
> put_page_testzero() being true.

Yeah, the main goal of that change in __free_page() was to make
__pgalloc_tag_get() a local function for alloc_tags and limiting the
direct use of struct alloc_tag in the core mm code. Obviously I
screwed up forgetting why we had to store the tag in the first place.
An additional comment in __free_page() is probably a good idea to
avoid confusion in the future.
Thanks,
Suren.

>
> > David
> >
>
