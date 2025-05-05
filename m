Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF14023CE
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 20:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746477174; cv=none; b=kr73hKM5/4aFhafUGANfLXE8n+1vOfyb+SGv/conxGSxVl0KbSe/WM/siXknLRavJAdEHJg97aB/d9ssaxiUQ0YxORWRKHaKGZMKrV7o5tKUcgbq1MVnOz0msie6Z1rTOI2mGz5mlrpyYqY+shuXG1EsB1zyyDQfO7R5Sqf8W44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746477174; c=relaxed/simple;
	bh=hY1k1prRW7IVB4XJjuyNWI1CdFgQTA/mSbJYsekIKOw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OBoMZ7HsEM2WyczXB2iqfzu6MqIXJbvZ1db5zYI9btBp0Zv/wD00snOgwuQTEvM1Q3y/FuDohCrj73Ars1uLO17CgO08qYFcmyxZQ5b/4II0fDTi9wYVNbn9gIdab4jLJm6o/wkZgGVAEGcCIjyiAbY488qws3DBTgdWHUoBjfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W+oa5OZD; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W+oa5OZD"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4774611d40bso97921cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 13:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746477172; x=1747081972; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b60aNM1IIW2gHu1u1BXDFkyrKkhL+q5sIU+nsJ/h7nc=;
        b=W+oa5OZDHjLPJRxWifpDfmKIU98rmqZKsBlSNsQIWeqTxthtI1FvAUNTVvvASkcLEv
         3Ijvxxg2vFGny/0Ys3BCvuSW28b87hHg/ZEaxZ8i6+hCmB4TfRJaVEXu0c6m6lzL5vkC
         Xgh/l3hn/l/rfql5gGgYXh8c/qx85m56zKcyJIRrP1fsJSAEBf9u+O5TKDEAHQfJxFy5
         XbZSqWFtZb0mOU5aFnt2o79LCkDT6S2vCx5FpjW1ENKbU4yBEQGKy7xyZstUsvVjU9iB
         q8BqV2lAh5xzCSIlEMGzj7VYIk7TNUU7bAF4X5UBbVijr7ULUMFi+sE1yziAf7Jcgp4M
         K9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746477172; x=1747081972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b60aNM1IIW2gHu1u1BXDFkyrKkhL+q5sIU+nsJ/h7nc=;
        b=P6r65jz0gpuE6llf9dLb/+a7h9b+/YEpgBbgsn0UBPIwgizO9dY6LMPAq5I0mDZfAD
         FWNkhBzv7YJharlheZcs4r/e41yi29ez+CkWcPTYmrTpzGUEEtwMsxfnxO8akZiMKgVV
         4QQiw5eIv2vjw5En2F0VUArReq7YdbQSct5LhLXbBGqgYw61M0WWTyMIPNxw9bIrFfaF
         kv9zzwgEk4qgpi+3yfFLyJT0F0yb7RC7kjGAt1MW6+OwxHLbPRHJGT9JzTILNInVHtTX
         GVJTtF+ktS3VfUnE98gd/7VPVljJD8zS6F2yWdAFa0+JyioCXTfm3TfEYzaP+k9tKHkw
         9WFA==
X-Forwarded-Encrypted: i=1; AJvYcCXPDm1tuxXnenHYz3zAJ9F2N/O+8ahg+NINmACaIH9Iytvo7u72xjoEJCsPuO1DeBTNu980bIml4I3+kwY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNWKkBtU1OFrqZoqsKSsIVClgmS6AD0OQUgwd6lzPflY06rRjD
	ypvak04ksuT2+T9KPDRbFXwDPsolm3QZHui0rKUlqzbMySuq0b/qRvLafejL0pLFDHQVTgy0ZWu
	VKgsJAZNEXb1inLFrgMGMF78V6YQ0fZlCnWKU
X-Gm-Gg: ASbGncv2F9TnQ68eAzP6Lb7Wa8aC2w80sJZ6c65G8Zl7ek4FX6/bqebvf2v0D2rV37Y
	OAD5l7SmzN9Adfoy/imauNsFTrRNN7dvKtyJ8fs+LBDRqbD1COD+SifADQKTJos4fTafhhzRO7j
	XpfRBCGphg604v8h+aoj2Z
X-Google-Smtp-Source: AGHT+IExD0+D/Gh/tiVJG2j616FTjgtLyRweoYuOWrc3ahMviTXJxn6NhAoONE9V6H0pFC4tZSEH/nxOUU4E7hwnAiU=
X-Received: by 2002:ac8:5f4e:0:b0:489:7ea9:4263 with SMTP id
 d75a77b69052e-490f47299d0mr1248191cf.10.1746477171425; Mon, 05 May 2025
 13:32:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJuCfpHKcDkce=no0Uu3UO2ua2GkgkKMZxnctMuDbOqQNKj_KA@mail.gmail.com>
 <20250505193034.91682-1-00107082@163.com>
In-Reply-To: <20250505193034.91682-1-00107082@163.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 5 May 2025 13:32:40 -0700
X-Gm-Features: ATxdqUEhMlfOZ2E56ONd4kM08PcZfCSALKCQlhEP-XpTwtnndpLMoHYz45yeM5k
Message-ID: <CAJuCfpF223aVoxU=wScKTJt-2JxTnpjJjggKm4UzSUUYHmLi8A@mail.gmail.com>
Subject: Re: [PATCH v3] mm/codetag: move tag retrieval back upfront in __free_pages()
To: David Wang <00107082@163.com>
Cc: akpm@linux-foundation.org, vbabka@suse.cz, mhocko@suse.com, 
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 12:31=E2=80=AFPM David Wang <00107082@163.com> wrote=
:
>
> Commit 51ff4d7486f0 ("mm: avoid extra mem_alloc_profiling_enabled()
>  checks") introduces a possible use-after-free scenario, when page
> is non-compound, page[0] could be released by other thread right
> after put_page_testzero failed in current thread, pgalloc_tag_sub_pages
> afterwards would manipulate an invalid page for accounting remaining
> pages:
>
> [timeline]   [thread1]                     [thread2]
>   |          alloc_page non-compound
>   V
>   |                                        get_page, rf counter inc
>   V
>   |          in ___free_pages
>   |          put_page_testzero fails
>   V
>   |                                        put_page, page released
>   V
>   |          in ___free_pages,
>   |          pgalloc_tag_sub_pages
>   |          manipulate an invalid page
>   V
>
> Restore __free_pages() to its state before, retrieve alloc tag
> beforehand.
>
> Fixes: 51ff4d7486f0 ("mm: avoid extra mem_alloc_profiling_enabled() check=
s")
> Signed-off-by: David Wang <00107082@163.com>

Acked-by: Suren Baghdasaryan <surenb@google.com>

Thanks!


> ---
>  include/linux/pgalloc_tag.h |  8 ++++++++
>  mm/page_alloc.c             | 15 ++++++---------
>  2 files changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/include/linux/pgalloc_tag.h b/include/linux/pgalloc_tag.h
> index c74077977830..8a7f4f802c57 100644
> --- a/include/linux/pgalloc_tag.h
> +++ b/include/linux/pgalloc_tag.h
> @@ -188,6 +188,13 @@ static inline struct alloc_tag *__pgalloc_tag_get(st=
ruct page *page)
>         return tag;
>  }
>
> +static inline struct alloc_tag *pgalloc_tag_get(struct page *page)
> +{
> +       if (mem_alloc_profiling_enabled())
> +               return __pgalloc_tag_get(page);
> +       return NULL;
> +}
> +
>  void pgalloc_tag_split(struct folio *folio, int old_order, int new_order=
);
>  void pgalloc_tag_swap(struct folio *new, struct folio *old);
>
> @@ -199,6 +206,7 @@ static inline void clear_page_tag_ref(struct page *pa=
ge) {}
>  static inline void alloc_tag_sec_init(void) {}
>  static inline void pgalloc_tag_split(struct folio *folio, int old_order,=
 int new_order) {}
>  static inline void pgalloc_tag_swap(struct folio *new, struct folio *old=
) {}
> +static inline struct alloc_tag *pgalloc_tag_get(struct page *page) { ret=
urn NULL; }
>
>  #endif /* CONFIG_MEM_ALLOC_PROFILING */
>
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 5669baf2a6fe..1b00e14a9780 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -1151,14 +1151,9 @@ static inline void pgalloc_tag_sub(struct page *pa=
ge, unsigned int nr)
>                 __pgalloc_tag_sub(page, nr);
>  }
>
> -static inline void pgalloc_tag_sub_pages(struct page *page, unsigned int=
 nr)
> +/* When tag is not NULL, assuming mem_alloc_profiling_enabled */
> +static inline void pgalloc_tag_sub_pages(struct alloc_tag *tag, unsigned=
 int nr)
>  {
> -       struct alloc_tag *tag;
> -
> -       if (!mem_alloc_profiling_enabled())
> -               return;
> -
> -       tag =3D __pgalloc_tag_get(page);
>         if (tag)
>                 this_cpu_sub(tag->counters->bytes, PAGE_SIZE * nr);
>  }
> @@ -1168,7 +1163,7 @@ static inline void pgalloc_tag_sub_pages(struct pag=
e *page, unsigned int nr)
>  static inline void pgalloc_tag_add(struct page *page, struct task_struct=
 *task,
>                                    unsigned int nr) {}
>  static inline void pgalloc_tag_sub(struct page *page, unsigned int nr) {=
}
> -static inline void pgalloc_tag_sub_pages(struct page *page, unsigned int=
 nr) {}
> +static inline void pgalloc_tag_sub_pages(struct alloc_tag *tag, unsigned=
 int nr) {}
>
>  #endif /* CONFIG_MEM_ALLOC_PROFILING */
>
> @@ -5065,11 +5060,13 @@ static void ___free_pages(struct page *page, unsi=
gned int order,
>  {
>         /* get PageHead before we drop reference */
>         int head =3D PageHead(page);
> +       /* get alloc tag in case the page is released by others */
> +       struct alloc_tag *tag =3D pgalloc_tag_get(page);
>
>         if (put_page_testzero(page))
>                 __free_frozen_pages(page, order, fpi_flags);
>         else if (!head) {
> -               pgalloc_tag_sub_pages(page, (1 << order) - 1);
> +               pgalloc_tag_sub_pages(tag, (1 << order) - 1);
>                 while (order-- > 0)
>                         __free_frozen_pages(page + (1 << order), order,
>                                             fpi_flags);
> --
> 2.39.2
>
