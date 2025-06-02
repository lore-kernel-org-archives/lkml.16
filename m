Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92C44400
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 21:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748899864; cv=none; b=XXeXJj8kehbrTonHpJuxul8NO7Spn4JMZ56gwaqZySI5nq2I+C7CaJ8xHtvH8bvccPcFQi3D1HK7ZoHiZrDWfu7rKCzVos4OjJkTOtyy0fbYgNY8hLnsOhM4UiGj6HynHLSSSBa9Ie28o9fKIWwMwfL8wQw+9r0w6iHJTXQ8u2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748899864; c=relaxed/simple;
	bh=SSMbopKdp83sL0iMJwLXDKr+F2TgFKwKOa12iyixvdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h8xKcLdKFF2u+L9mBF4TOD95NAr4Y+hpwv9JkjO/hF4uqDbchWUEMMExake3NhkrjkM2GfuiDxq0S7rdRKrNDVckBCJeXWr8lveX2Ims5JvDvyv1RPBQ9D0k3opp+C6tLdb5U+ByfLlXeM5A5iPr65onhcQtGNUp54d3+hZ/M98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPUsLVkI; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPUsLVkI"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4e5a1a4e4aaso1636932137.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 14:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748899861; x=1749504661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahwjcQM1awKzAxWaWisDny1M/9KlXEjHJVY9Fy+4wRo=;
        b=BPUsLVkIvKacbaLUosXpuqZDUUWDrRIbjGpHBmSh4J903Lkf6SvztnxEFkZTfwCxSb
         /QPCTvZr40X0SXfJCZ77UMbHEDLmyWdDPZ0gGLGaIX5apPcaOLLcjqo7ZbZ2EOjw4+6r
         2YBGd+qBg664tUx8mQO/x6h0Y5Tem77PfUylOasqird/iqidsbzVgNLimZ+BMxtWe/Pv
         vp97wsWOH09cafWqHO34nYU6U7/KLxZ532pLfId9tBXPM693MNeEWWHJtSv5zrDrLDVj
         0cfK2pX1lyRmrJI5Y22ayibledFSh1/qgbXKCCSMFmhO1T/fd6gvFhebvwD4gBQiGH7x
         zUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748899861; x=1749504661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ahwjcQM1awKzAxWaWisDny1M/9KlXEjHJVY9Fy+4wRo=;
        b=uW8HTYoTU7snK/OKENZBXOjBY434z7Kpvd8VUzuLd473at318V2XU3cOIHTlWmPFnJ
         wRn5Je0NqiKfqQCTEp/dTM/M7T4/crASEHaTWnO49EQ6+zqJrnH7uyszch0Hcg+yrcaw
         5ajrFlUE/ZlDHXlibxTzEpWmX+cSFjXbBD/0rBbiE4m/9shteAStOZyVN+IR/bFEbjE+
         FhF3CnaGtYjg5vXAREj8sMsAYI14ZC7aMwZpcXCcmtsyHhXHxNEfnpdEbiqX91OFuyEx
         kM9QUWOAqMEcjbXBIsRf3Mcqwku9Vuru3X7c0ZQbel4O4MRzgOx6grFNZEpjO1lPMry+
         LdCw==
X-Forwarded-Encrypted: i=1; AJvYcCX7hzNd5qgKTSisD3LgMV3zYMld+qjZ0/CX4Ql4PzEzly/4bih7BAeW8pEa79rIlTH3Q3PiwjDe3gkmnIk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmvEmPG3tEnj0TMxZ5RqJEFprT17GqH2PFgfdSqe+hNRXQBoNE
	Wh+rceSFyBKgrgee6TW+eUEQZJDZA5zgUYOtGpGWRp+z9TzsBgk8uWHDetfOOtPzsg9tQWC5j1c
	NcqBojMvC9qR0OGV5J/GBxKEzaAkEzDg=
X-Gm-Gg: ASbGnctHxvU+Ui/frEIRnVEDjRbIl7ImqyDLH6u6PEoPPK+9N2xh9pO6rj0Il4cWNEF
	illwpFQ76KIq/KHUQO/XvBQRkSIAza55WdcSq5CAeUUPtYnvUf98Od6n2Fm9oubdoZkl1e0cwfk
	VthfZ8RhZ1JhlVyyjGnRvM7OKK0LlYXGUOPw==
X-Google-Smtp-Source: AGHT+IFcYQpK199UwsjK58+BDiGchMTWvJ49tAMAqutY/Ui7dGVhZg+9q4IYfYLjmQELRaZ+uL53F4JPe2DguPnSajo=
X-Received: by 2002:a05:6102:e10:b0:4da:e6e1:c33c with SMTP id
 ada2fe7eead31-4e6ecd2bed0mr11892260137.3.1748899861449; Mon, 02 Jun 2025
 14:31:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602174926.1074-1-sj@kernel.org>
In-Reply-To: <20250602174926.1074-1-sj@kernel.org>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 3 Jun 2025 09:30:50 +1200
X-Gm-Features: AX0GCFvFwZVRqbrtMbtZ-QPYvwODjaTEY5PF5GpMrHhJXk4O3imOsscHXdOUxiY
Message-ID: <CAGsJ_4yu1zXt9FReDqcQxrbuiksFJKHgjHVtutwO3MWkJjixPA@mail.gmail.com>
Subject: Re: [PATCH] mm/madvise: handle madvise_lock() failure during race unwinding
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Jann Horn <jannh@google.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 5:49=E2=80=AFAM SeongJae Park <sj@kernel.org> wrote:
>
> When unwinding race on -ERESTARTNOINTR handling of process_madvise(),
> madvise_lock() failure is ignored.  Check the failure and abort
> remaining works in the case.
>
> Fixes: 4000e3d0a367 ("mm/madvise: remove redundant mmap_lock operations f=
rom process_madvise()")
> Cc: stable@kernel.org
> Reported-by: Barry Song <21cnbao@gmail.com>
> Closes: https://lore.kernel.org/CAGsJ_4xJXXO0G+4BizhohSZ4yDteziPw43_uF8nP=
XPWxUVChzw@mail.gmail.com
> Signed-off-by: SeongJae Park <sj@kernel.org>

LGTM, thanks!

Reviewed-by: Barry Song <baohua@kernel.org>

> ---
>  mm/madvise.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 8433ac9b27e0..5f7a66a1617e 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -1881,7 +1881,9 @@ static ssize_t vector_madvise(struct mm_struct *mm,=
 struct iov_iter *iter,
>                         /* Drop and reacquire lock to unwind race. */
>                         madvise_finish_tlb(&madv_behavior);
>                         madvise_unlock(mm, behavior);
> -                       madvise_lock(mm, behavior);
> +                       ret =3D madvise_lock(mm, behavior);
> +                       if (ret)
> +                               goto out;
>                         madvise_init_tlb(&madv_behavior, mm);
>                         continue;
>                 }
> @@ -1892,6 +1894,7 @@ static ssize_t vector_madvise(struct mm_struct *mm,=
 struct iov_iter *iter,
>         madvise_finish_tlb(&madv_behavior);
>         madvise_unlock(mm, behavior);
>
> +out:
>         ret =3D (total_len - iov_iter_count(iter)) ? : ret;
>
>         return ret;
>
> base-commit: d85ea9175e4147e15ff6e3c0e02c6c447ef473c8
> --
> 2.39.5
