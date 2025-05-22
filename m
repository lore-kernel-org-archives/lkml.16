Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CF61632D7
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 03:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747886122; cv=none; b=ZD2X6zHV0+eEBX8rLBLgGR7jIrg/aBcz1KQYW7V8DUe0kOrSshK16IKFiXqqls/PAz31Gx5lGXvq6Cank8+dUOpB32TH06eowYuXzIflqJ33IFTftNss/Jz/bSVxyAcyJEqHad8okRlsZhc/EwPbP1Z/i9SFoCvVOvntulnAWdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747886122; c=relaxed/simple;
	bh=dMIDSkq9lmjK0BifziLCbD4QsCIC2QelupxfG7aKLxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dkYvnbnC3KVyATjFvy3WEK87XvMPXeBm13javW/WLlagj7CXyVT+j43VdEXJRcvpAIK2S+7KRTZFEBjNvpQOrB5JFMpKDbFPiaXEhCyji3oyiiS47C6b1HDlQjpLsK2QZm+KVn+iaY8krVVLQs8VP3PgNEQAkfGLto1JT4fSJtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oe36kf2M; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oe36kf2M"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-310447fe59aso76483431fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 20:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747886119; x=1748490919; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTy2y9sRpy5Yh47JQdxXy3Q2jyCv/CJLaY/dGfWuzIU=;
        b=Oe36kf2MqGUtcP3FLTkyd1SNro3UBqlzqPs2Fjkq277gAZaX3emVbFQ8GBZvy7y9v8
         Jfu1U8tsPtWTK7DrByswuPg4PcGCVFpJxII1J0/m8akKrRQrexpd8ozFgIxUgFBIw55M
         XskRz0vYJVqt+e2qOTILbsF8EkpxJTsZqJVMLu+uYHszC2nSAGwsolkRm9fTi5soRF7M
         s1OEBcRqp5fDoz3zp+le3bH9uv+EEUaXoAbEXon7VrwtLL3UD1w9GnFFuKXh/dejCiRS
         DyBsmCnHraw+F+nt3xDA7et09Xw7nbLtHSWDz3otB/MzLoirKghN34HK0gBvU/5XUFeC
         z2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747886119; x=1748490919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OTy2y9sRpy5Yh47JQdxXy3Q2jyCv/CJLaY/dGfWuzIU=;
        b=bTzMusFZA5xHeMsx6LJuKVRVbzV16EmakirA4KSs6gaSbpKtJkHnNQqrlQUj6gz/tP
         yAg2A37mPNCb4hsYK5UfSnoflOJW6UcEAKtPuz7jAjDSRd30x87JI6Qmj61zgcBvX/nk
         25KLbkgCbvqbY1FFF78kSC0fnlUWmV0HCyGKtrbrfa3YR6mT8Rs5kG0rCmAiQwDlAfZN
         jf84zR/JFNvYjSzM11kWHsa1/ZWg4lBfBX9Vyk6UhEzlBf8E7emZEKzw0tgeE0iRPX+s
         NsaTvqa02ELaNnPz9iCwpBu+cVWQloEQs1vZ+y2M06h8yGco2oZleDPaVYxwgdnIbTY7
         pAdQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2bhCuRFToLiNsuMllJC2z8q2OFZcqRzD9jQrzI6kBlwHslnxDp8lzl13sA3AfeexCmqB+HHHp7HH+ZV8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr7PUqC0uPB7Z5hfHUkDaKg5DyVztlhoYJIDcI0a3Dt73Jwyuo
	yID2tyxeqMB/sGQPxjP5vyKvF44qRUpeM7LFnJbDIZ8YZY/ZW+TTz8EWCGy4XgUXhvJyGn5ya+y
	cC+Rpg9Px2sxq/2DXFigPE7FhOlWgZpZ1OHFa3Ko=
X-Gm-Gg: ASbGnctqn0MSiFwyjdmKBiIyYhjT3r1x/3oIoqt87u6VS/bkiKayB5tgt3TxmaiwC8g
	R6E5SSPmrjw0xThBzCAaBBt4LF4Xbx6Xj1mbzedc77ewFSLuWIuMCc+DiFOx9Ccwz9z+v4NUaLq
	McDzt1+HU8O7wGTJ/xIbAIbxeiwsH0MikbcdTw7JopiMI=
X-Google-Smtp-Source: AGHT+IGdF3FSVZD5Fi7wP3dVo0YI2cmNqGZYNAOM3JBWdYgK0ARd5VLl/zUPmWQRkQXA5cuMhwSjnkaS20tEJ9ouZdQ=
X-Received: by 2002:a05:651c:40cd:b0:328:1163:e86a with SMTP id
 38308e7fff4ca-3281163eac5mr55777271fa.22.1747886118295; Wed, 21 May 2025
 20:55:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522122554.12209-1-shikemeng@huaweicloud.com> <20250522122554.12209-2-shikemeng@huaweicloud.com>
In-Reply-To: <20250522122554.12209-2-shikemeng@huaweicloud.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 22 May 2025 11:55:01 +0800
X-Gm-Features: AX0GCFvtYmu3WgITSY2-7KAJSRWbqDXUSJnIAKwATmT-2qsQdK2T3QzMWj7FmTY
Message-ID: <CAMgjq7A9mwtsdpPOPA0KHpr-ZaOm01r7V0a6NPb1DqhJprB0yg@mail.gmail.com>
Subject: Re: [PATCH 1/4] mm: swap: move nr_swap_pages counter decrement from
 folio_alloc_swap() to swap_range_alloc()
To: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: akpm@linux-foundation.org, bhe@redhat.com, hannes@cmpxchg.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 11:32=E2=80=AFAM Kemeng Shi <shikemeng@huaweicloud.=
com> wrote:
>
> When folio_alloc_swap() encounters a failure in either
> mem_cgroup_try_charge_swap() or add_to_swap_cache(), nr_swap_pages counte=
r
> is not decremented for allocated entry. However, the following
> put_swap_folio() will increase nr_swap_pages counter unpairly and lead to
> an imbalance.
>
> Move nr_swap_pages decrement from folio_alloc_swap() to swap_range_alloc(=
)
> to pair the nr_swap_pages counting.
>
> Fixes: 0ff67f990bd45 ("mm, swap: remove swap slot cache")
> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
> ---
>  mm/swapfile.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 026090bf3efe..75b69213c2e7 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -1115,6 +1115,7 @@ static void swap_range_alloc(struct swap_info_struc=
t *si,
>                 if (vm_swap_full())
>                         schedule_work(&si->reclaim_work);
>         }
> +       atomic_long_sub(nr_entries, &nr_swap_pages);
>  }
>
>  static void swap_range_free(struct swap_info_struct *si, unsigned long o=
ffset,
> @@ -1313,7 +1314,6 @@ int folio_alloc_swap(struct folio *folio, gfp_t gfp=
)
>         if (add_to_swap_cache(folio, entry, gfp | __GFP_NOMEMALLOC, NULL)=
)
>                 goto out_free;
>
> -       atomic_long_sub(size, &nr_swap_pages);
>         return 0;
>
>  out_free:
> --
> 2.30.0

Good catch! Moving the counter update to swap_range_alloc makes the
logic much easier to follow.

Reviewed-by: Kairui Song <kasong@tencent.com>
