Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C212328C5BD
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 15:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751295695; cv=none; b=hJTKoeg48mVuV6gVS1scUxGVPhhHL3Abmb4NZx/xOS+3lbkQh3KS81NTdSys/4uFi3naarRpSi5T7tCZDKvERmFTitpUkocKpLUdWUWbrV9Yp/itgmnm0KtWrDrHzi0uoP54SXBdhCWjUDR5NbtvjVYaZOoL7pwojXLZ0bo6oHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751295695; c=relaxed/simple;
	bh=bA2iVNqi1xBKfeRItYPrF/CNMUgz/auMZ2sX65vERlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o9rLq43UWMN+WINlZNGnsHM+BjdhVCYRcTxy3LDqo6IPBQBw4OO/MyApRoE8p/D5xgzZRvXzbbG1IRsz0Y4yUzPefyUvrnFHoIuPN2qsVhMymHkcETEo9l/w2YL4BSh80oufaJtat4IhU+Qnnc6hSFxGDf2B6RyHqhstocK47p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uCKsBch2; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uCKsBch2"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2eff5d1c7efso1397255fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751295692; x=1751900492; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=15iePih5BC5Jn/3k3dCq80lQGBhxEjm0LI0eUO5reYk=;
        b=uCKsBch2OVUu3+mV617U4c1Rp6E4Cr61unWNVV1P+4IEUxOlw0hZGxQvgVvWEWCQYe
         L3PjlHnR8947/pjnoXfWyNaKLw9UzzHsy29cI70YLQmDyNTUekKz3z+rxVsTp8B6YNIO
         TXm5BBSKjTtLzX9Znr1YXFMVOdcic7gj+P4KHO6+BkpxKTE6UNuv7TqWnVbSXGXClFRt
         dnhEzRd3XXDyC7kTVA/5IVpQzH6YD3XOdCHKUfyO6Art1cLtOI9q35Ax5ylH5XSB/icn
         rOLVhhJcVPyjiZYtvAxYwJj7GLlXeTWBy0q9eqS14c6RJIbPNIuLOPt2oFJ0ZJVbYeOo
         DyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751295692; x=1751900492;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15iePih5BC5Jn/3k3dCq80lQGBhxEjm0LI0eUO5reYk=;
        b=ZqgohsblhSDeArJUxYml0M2bm3R54kAtrAeWMFIbuKfMybgStTl+9UYvWBgAZr0oDk
         ALVUGPeO+Gip5TaIsI3gQtscNhaps3M0pPMMpEESpt8Nha7te33Sqblh0X7Cz9BJHvWg
         dMaWd9GNG0ssN3UeLzhywmP3qKWD1oPRzdtCW1fVK6jXmAT/yHfjDEdGnuDKsVgRMnLW
         NOnHT0DiKNakHY4rzGUlOnNos/0binH93zRX33Ux8ViTi4evEa5/W1LmVw5IeNuU2yp1
         ApWZcUX9BF60p8WHcODutSAa45S3i6FLykP0+6tmoCxd6vua6aQqztH4jI0fKrkm0jKT
         os6w==
X-Forwarded-Encrypted: i=1; AJvYcCVf8uH8bUqrJACpLiPH03ichOEspC2QjZMmEUAYZeeZMl8Jcn4gDd5o4GOIvYTeAJApcc9H72/624rexKI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyghmWNPx5NGJ8nGH3101bgCdVJJ6+HMt1Fq7cus/eJzDcBb0Gy
	XQooYzHLlOXGyR3Z5FauTThtiWf0jr5fvo5BKp7MRB0bIid2MaZKlBMbI8OpGtvy9RBTUBNDp1x
	clXxVcax4yHCu1u3SH5msxjUuARwEhd7om7lSZHBZ9A==
X-Gm-Gg: ASbGnctAV+z77cCkLGNrxkJUl05G6DOz3pK3R6Ip0aaIu5LcFxNzO1Hug4PBJ3O8B2e
	x+Rzqjk1wiLFfzL1X4l/YVAhBE+FXCk7ZUsSzQTDh7uwVakBj1XuxLoS6PNIDytelOALG0gYQ3u
	lDbs7n2jNwMvp2keF5c+RbZhtuxLsgPx4yo8kvQQ+e0P0R
X-Google-Smtp-Source: AGHT+IH39dcYGayERTHKwfkUbm8atj+vg9Buf7IQPXCRI9PooAjIYyvSqsdYej+jsm7V5GylTSqfC6HfkDzqBwhgvgQ=
X-Received: by 2002:a05:6870:a512:b0:2bc:7811:5bb8 with SMTP id
 586e51a60fabf-2efed6aa567mr9175890fac.18.1751295691384; Mon, 30 Jun 2025
 08:01:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627200501.1712389-1-almasrymina@google.com> <20250627200501.1712389-2-almasrymina@google.com>
In-Reply-To: <20250627200501.1712389-2-almasrymina@google.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Mon, 30 Jun 2025 18:00:55 +0300
X-Gm-Features: Ac12FXy1xBEUxoV-RSx5hkK5xW-WOODrAl4t6LxpeZZdNAPeYcO-k0boL2C7b-c
Message-ID: <CAC_iWjLY10NAW7b7-vk5UD3x-Nay=4sfAW5uowq2MKyK_h-6aQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1 2/2] selftests: pp-bench: remove
 page_pool_put_page wrapper
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Jun 2025 at 23:05, Mina Almasry <almasrymina@google.com> wrote:
>
> Minor cleanup: remove the pointless looking _ wrapper around
> page_pool_put_page, and just do the call directly.
>
> Signed-off-by: Mina Almasry <almasrymina@google.com>

Reviewed-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>

> ---
>  .../net/bench/page_pool/bench_page_pool_simple.c     | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/tools/testing/selftests/net/bench/page_pool/bench_page_pool_simple.c b/tools/testing/selftests/net/bench/page_pool/bench_page_pool_simple.c
> index 1cd3157fb6a9..cb6468adbda4 100644
> --- a/tools/testing/selftests/net/bench/page_pool/bench_page_pool_simple.c
> +++ b/tools/testing/selftests/net/bench/page_pool/bench_page_pool_simple.c
> @@ -16,12 +16,6 @@
>  static int verbose = 1;
>  #define MY_POOL_SIZE 1024
>
> -static void _page_pool_put_page(struct page_pool *pool, struct page *page,
> -                               bool allow_direct)
> -{
> -       page_pool_put_page(pool, page, -1, allow_direct);
> -}
> -
>  /* Makes tests selectable. Useful for perf-record to analyze a single test.
>   * Hint: Bash shells support writing binary number like: $((2#101010)
>   *
> @@ -121,7 +115,7 @@ static void pp_fill_ptr_ring(struct page_pool *pp, int elems)
>         for (i = 0; i < elems; i++)
>                 array[i] = page_pool_alloc_pages(pp, gfp_mask);
>         for (i = 0; i < elems; i++)
> -               _page_pool_put_page(pp, array[i], false);
> +               page_pool_put_page(pp, array[i], -1, false);
>
>         kfree(array);
>  }
> @@ -180,14 +174,14 @@ static int time_bench_page_pool(struct time_bench_record *rec, void *data,
>
>                 } else if (type == type_ptr_ring) {
>                         /* Normal return path */
> -                       _page_pool_put_page(pp, page, false);
> +                       page_pool_put_page(pp, page, -1, false);
>
>                 } else if (type == type_page_allocator) {
>                         /* Test if not pages are recycled, but instead
>                          * returned back into systems page allocator
>                          */
>                         get_page(page); /* cause no-recycling */
> -                       _page_pool_put_page(pp, page, false);
> +                       page_pool_put_page(pp, page, -1, false);
>                         put_page(page);
>                 } else {
>                         BUILD_BUG();
> --
> 2.50.0.727.gbf7dc18ff4-goog
>
