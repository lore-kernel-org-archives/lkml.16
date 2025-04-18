Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0347621504F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744996738; cv=none; b=KVN1VVSopLH2Am6pk7Gtq/9FvNgkrrVZL4pIZahs7yoebazT+YhyvVaqlxZ737/XQSSddkjTmQYpMBG3QBwMsXa0kiQIIrdRBGcngW1m8jnKxXsPyXhtlRhbidA+TIgF4lWlffND9A5LNLJQ+xYXaXmgdnd9QPX4W0AKr+s9twc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744996738; c=relaxed/simple;
	bh=+a1M5i9PKv67XR80Jx0OMOovmU/sGspbAiljC2qwxuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JP0COKirgOShRwM1rpjWjVoUbTQma8WWfZ+Vpp6rhZIN1JUT3sH4BgSs7pwIOAMo87wwmczZnFn6zv8/K6RxZS4w86FvGHxsaMJVq7mI3Ht1InBo72KpIqbXvk1EhPQhOcsqKSnFilvgBL/GGgizWSKpgnng5/poAqHPTJVT3/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hLERQRAq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hLERQRAq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744996729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gkdw8gsBY7I9in1XRxPqFzuV9M+R9WrhUEzgOn2phl0=;
	b=hLERQRAqsmykt2ZCV2DnQAHUMSVkzyAV0a2YnP3VyDb8WwwAT+PIuQLDL7VyGk96pcUIfE
	vDHUnVt1HuG24q2ZAwAuuyl3gkAQxPhJwLfEt8jSmuZVNp+4iIVzLIpJZlqq7mUG1j2JaP
	4yh+GipQBavM+kNYTC7xgj3C2U3e8SE=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-3YA8FvvTOWu6gqiYyeghdg-1; Fri, 18 Apr 2025 13:18:45 -0400
X-MC-Unique: 3YA8FvvTOWu6gqiYyeghdg-1
X-Mimecast-MFC-AGG-ID: 3YA8FvvTOWu6gqiYyeghdg_1744996723
Received: by mail-yb1-f200.google.com with SMTP id 3f1490d57ef6-e6ddf3f05easo3219399276.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744996723; x=1745601523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkdw8gsBY7I9in1XRxPqFzuV9M+R9WrhUEzgOn2phl0=;
        b=k+2G2ozY/uXyrWamBJxD6yHd3yvxC4U1UC59FJxykBZ0EgFKWK52cXLxYPuMxEhkdP
         9BaAS31wDkdr4SVHr4Kk4428AbVJXtVyHZEIM0CU+ZcM0xccPzhtAdpONhwkelyqOGTH
         UYTd4fzQdUQFj21lfq9rymwjBvWuSfNmsRj1FKfznw2H54E4ab6cX9vDA/hm6DlBeLAO
         fKCrfXzsmb4U5+s+jwtDFvxxTNYtoJi+y6j+WolhhkgJQLa41UKnlzYC9QVwKd2MrEE9
         6c+F0SEtWlEqqBY+JAGbow9vLC1DbNgLyeTkWGC7mfE4K9Y9hNzWEEByrvzbJl3Oqeml
         J/Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUi5bpw/QKNrYAylmhAYeTkbZhSWMh3ogfpw+yDOeVDYM3w4ZwEaCcGjeAZDmunN3VystyZWp87xV5vORg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhXgNZBCrgH7xZojen0BCFkmbbml44MGukJTjcrqAV7WULasSU
	9ew01QOI5mj/Z3CknflbKHvgQtAaVqk4nfdwo7X8OWuUoa60iHak6fTIutXFY4ua24coZeI1tra
	kLOgE/hD1ZwbdM18kWzrgZ9EXBW/LXHU7wGB2bgXvzmx9ZqvW+7Z1cE1le/watU4JIAR5esc4Qk
	apK5pAgahN5dsnw9TZlvi0VzNluWYDUYVxrSS2
X-Gm-Gg: ASbGncuv0s14eWSU6YwsI3w68Kd4gdnxZw6XMRt/eMq3ie2UCgdXGfs+xtrN7gxEIfO
	ZMrgWAjsJkvN/+tvCr55J7WspTCZZBkKrQF84JeAEql0SAlYV5TuWlivN1voreBDfZS5PeKBVam
	qL83xvQBg=
X-Received: by 2002:a05:6902:1685:b0:e6d:eea7:35c3 with SMTP id 3f1490d57ef6-e7297dcb74emr4915471276.11.1744996723385;
        Fri, 18 Apr 2025 10:18:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgO3yGvbKJV4mk2YjiCklYNqNWcRnEs03RKhS2nZ9xH55/2YEz6HN6ctlOeQ69EMUsvvUuE8HxshphvDhfc0s=
X-Received: by 2002:a05:6902:1685:b0:e6d:eea7:35c3 with SMTP id
 3f1490d57ef6-e7297dcb74emr4915431276.11.1744996723007; Fri, 18 Apr 2025
 10:18:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417171758.142745-1-nifan.cxl@gmail.com>
In-Reply-To: <20250417171758.142745-1-nifan.cxl@gmail.com>
From: Nico Pache <npache@redhat.com>
Date: Fri, 18 Apr 2025 11:18:17 -0600
X-Gm-Features: ATxdqUHGLN0lFeajQ8s0PmbZ6wgOIx5rwI7HcqHdz6FT6fADQxCAu1ui4DqSWqY
Message-ID: <CAA1CXcB06JD9Fp4c7GGU3NHEm4W-aV7TS7JW7eWxshJEM4t2_w@mail.gmail.com>
Subject: Re: [PATCH] khugepaged: Refactor trace_mm_collapse_huge_page_isolate()
 to take folio instead of page
To: nifan.cxl@gmail.com
Cc: rostedt@goodmis.org, mhiramat@kernel.org, willy@infradead.org, 
	akpm@linux-foundation.org, david@redhat.com, fan.ni@samsung.com, 
	yang@os.amperecomputing.com, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org, mcgrof@kernel.org, 
	a.manzanares@samsung.com, dave@stgolabs.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 11:18=E2=80=AFAM <nifan.cxl@gmail.com> wrote:
>
> From: Fan Ni <fan.ni@samsung.com>
>
> trace_mm_collapse_huge_page_isolate() is only used in
> __collapse_huge_page_isolate(), which passes in the head page of a
> folio, so refactor it to take folio directly.
>
> Signed-off-by: Fan Ni <fan.ni@samsung.com>
Looks good!

Reviewed-by: Nico Pache <npache@redhat.com>

> ---
>  include/trace/events/huge_memory.h | 6 +++---
>  mm/khugepaged.c                    | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/include/trace/events/huge_memory.h b/include/trace/events/hu=
ge_memory.h
> index 9d5c00b0285c..a73699f000de 100644
> --- a/include/trace/events/huge_memory.h
> +++ b/include/trace/events/huge_memory.h
> @@ -116,10 +116,10 @@ TRACE_EVENT(mm_collapse_huge_page,
>
>  TRACE_EVENT(mm_collapse_huge_page_isolate,
>
> -       TP_PROTO(struct page *page, int none_or_zero,
> +       TP_PROTO(struct folio *folio, int none_or_zero,
>                  int referenced, bool  writable, int status),
>
> -       TP_ARGS(page, none_or_zero, referenced, writable, status),
> +       TP_ARGS(folio, none_or_zero, referenced, writable, status),
>
>         TP_STRUCT__entry(
>                 __field(unsigned long, pfn)
> @@ -130,7 +130,7 @@ TRACE_EVENT(mm_collapse_huge_page_isolate,
>         ),
>
>         TP_fast_assign(
> -               __entry->pfn =3D page ? page_to_pfn(page) : -1;
> +               __entry->pfn =3D folio ? folio_pfn(folio) : -1;
>                 __entry->none_or_zero =3D none_or_zero;
>                 __entry->referenced =3D referenced;
>                 __entry->writable =3D writable;
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index b8838ba8207a..950d147cd95e 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -696,13 +696,13 @@ static int __collapse_huge_page_isolate(struct vm_a=
rea_struct *vma,
>                 result =3D SCAN_LACK_REFERENCED_PAGE;
>         } else {
>                 result =3D SCAN_SUCCEED;
> -               trace_mm_collapse_huge_page_isolate(&folio->page, none_or=
_zero,
> +               trace_mm_collapse_huge_page_isolate(folio, none_or_zero,
>                                                     referenced, writable,=
 result);
>                 return result;
>         }
>  out:
>         release_pte_pages(pte, _pte, compound_pagelist);
> -       trace_mm_collapse_huge_page_isolate(&folio->page, none_or_zero,
> +       trace_mm_collapse_huge_page_isolate(folio, none_or_zero,
>                                             referenced, writable, result)=
;
>         return result;
>  }
> --
> 2.47.2
>

