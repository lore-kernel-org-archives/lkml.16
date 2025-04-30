Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0E015C140
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 18:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746036927; cv=none; b=Yj8I2O+FiAaBBPbr+xXdhYbsx4ccpRVXgP8hQbSxIAlpyrttEBke8uLBc+7NaEzwB4Z21lLF6lte281KopxD8pKcmT33L3FOphFpYl+EH09jhxUlYWQcnecDPWFClGoYHAsMGU68ZLVIw0H+Qr046yCDg4YEnBA8mDT+sFHyTl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746036927; c=relaxed/simple;
	bh=2egahgrtnpwU0lnvD4WMa/SMsHhsr6yE+MDT32L21ZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dzqhf5hvko9G8lcMtia1OmdCulReLOCWsPq1zu4ItG/SMFRfffnXcMQI0U9xQuFU/S1qhNRC28rh3GvuCn154FUGIbEwWyWbBvqwEY3Ma+qoysQhtnodWOyxUMLnmfx1/yq6QIWh+owstyQklRliDJKhrxSpbOd20kDApCHHMNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mg4PP0d0; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mg4PP0d0"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-548409cd2a8so201993e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746036924; x=1746641724; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gbcY59sHcKVQbAR+nbma8JoUOaJ4sk1ICn9Mjml/5s=;
        b=Mg4PP0d0DsqWljMArPogKXtnsGwfn9ruh1JgsomvLOuzGR1bAN0cBsKEZONku60mcO
         GaqHEW4rhLnKif7mgQh9+Vh/sZHOzsWfhUovsv+EdPOqCn2L+tnMAv31PAhQQliIhIro
         u4vYtRdKY1HT4Gygfk97S4F9q0ClyC2NvpIkc1l/IX/acnotHSzXaWC92AqILvcWyMF7
         OCO9T9Epvmq788/9+zCUbNGC+DwX8PbDxv9JWEnML7hwETnoovxcCivjw1h/le/64zbn
         AWC5e4FsR9JAd0KxYtikBP3xtM6vMMqOEBZi2UEpmS1cBBs0RRIQV5qliJvrTikWUV/b
         ntSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746036924; x=1746641724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8gbcY59sHcKVQbAR+nbma8JoUOaJ4sk1ICn9Mjml/5s=;
        b=RtsJnU4k1HBmZslCqE0WWY3Eow/e5CCNc/t3cqF7Kc2NkKp+OWguiyghXBaBddLNBI
         x+JAfM8IMNOECTf4n03VB5mpIdtdt4g17dOpeD/gRti4IDNMD7PWcvEyWuk9wSzS/uQY
         DsOJ/angdxae8C9QvqIjLgirKB6KMS4Z2dg/Hd6Pr8Gy/cB2Y4c375De31iG1l2OtZZA
         44hbNcxaS3/2BvMEwYZj0cqSdE5OFeaZ+1DhpncAuKI9WXi/BKcW2WRoMYrsI+kQj67s
         dMgJs5F96zkOlDAFKnSOQog8UGLQtxYG49KTo96pwPbdYmN5vy4E6u825PBUEEZElkns
         q3+g==
X-Forwarded-Encrypted: i=1; AJvYcCX2MR59J+ef+jD4dQRRwozAgbErGhKHQOcBX1HO2eshSaHG8ncTNmPWWV1cOnzT8CHSvO2sFfkFmbZszlo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaC+9ABduMjgkSuPurZpDRV+EriSq4YfEuhqYwzixzC/LjpKEN
	reAVmSnfZcg0UDVirCyhcg04XmCAmXiqqEshifVzAzlY6OdTymVZ61JeBgxO3Lkl9oYo4UzA82r
	E17dt9g7qETssUuylJhINdnqEzB90pTlNQ7nsqA==
X-Gm-Gg: ASbGncsN9bsOSjTjcrFExaEBXACa1d7Ed4Zz4yLdhDtbfg7cSK1eJxRi66LmU/REm4Z
	o/jjjCCWynFBYTRozLlvpdngqcICmRa/i8RjkOE/hD6EAg/5EUD9IrU14YHrSx+eCQnzXEKYdLJ
	UmVvLH4fXNN/Tdja4RRDDmaQ==
X-Google-Smtp-Source: AGHT+IGb2GLRIyr9grOdOWSKjK5OHsJGK3nf19lpAtYvji3v2YcFT+CGj5Ryjcw42Sy//Z7RhQ4tjh9as/OtLIacrOw=
X-Received: by 2002:a05:651c:50f:b0:30c:aae:6d61 with SMTP id
 38308e7fff4ca-31f950cc529mr302311fa.30.1746036923645; Wed, 30 Apr 2025
 11:15:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430181052.55698-1-ryncsn@gmail.com> <20250430181052.55698-5-ryncsn@gmail.com>
In-Reply-To: <20250430181052.55698-5-ryncsn@gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 1 May 2025 02:15:06 +0800
X-Gm-Features: ATxdqUFkfhYcI-xu2JK_XpeN5Mtxg3WBPHGYn_pVC1uNsqLT6ryrqzsJgPa2fY4
Message-ID: <CAMgjq7B_frEwFhUcosPL13hySk7otjThh-aOKOPALfpvUPJWLA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] filemap: do not use folio_contains for swap cache folios
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, 
	Hugh Dickins <hughd@google.com>, Chris Li <chrisl@kernel.org>, 
	David Hildenbrand <david@redhat.com>, Yosry Ahmed <yosryahmed@google.com>, 
	"Huang, Ying" <ying.huang@linux.alibaba.com>, Nhat Pham <nphamcs@gmail.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 2:11=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wrote=
:
>
> From: Kairui Song <kasong@tencent.com>
>
> Currently, none of the folio_contains callers should encounter swap
> cache folios.
>
> For fs/ callers, swap cache folios are never part of their workflow.
>
> For filemap and truncate, folio_contains is only used for sanity
> checks to verify the folio index matches the expected
> lookup / invalidation target.
>
> The swap cache does not utilize filemap or truncate helpers in ways
> that would trigger these checks, as it mostly implements its own
> cache management.
>
> Shmem won't trigger these sanity checks either unless thing went
> wrong, as it would directly trigger a BUG because swap cache index are
> unrelated and almost never matches shmem index. Shmem have to handle
> mixed values of folios, shadows, and swap entries, so it has its own
> way of handling the mapping.
>
> While some filemap helpers works for swap cache space, the swap cache
> is different from the page cache in many ways. So this particular helper
> will unlikely to work in a helpful way for swap cache folios.
>
> So make it explicit here that folio_contains should not be used for
> swap cache folios. This helps to avoid misuse, make swap cache less
> exposed and remove the folio_index usage here.
>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> ---
>  include/linux/pagemap.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index af25fb640463..0c9aff5ec77f 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -935,14 +935,14 @@ static inline struct page *folio_file_page(struct f=
olio *folio, pgoff_t index)
>   * @folio: The folio.
>   * @index: The page index within the file.
>   *
> - * Context: The caller should have the page locked in order to prevent
> - * (eg) shmem from moving the page between the page cache and swap cache
> - * and changing its index in the middle of the operation.
> + * Context: The caller should have the folio locked and ensure
> + * e.g., shmem did not move this folio to the swap cache.
>   * Return: true or false.
>   */
>  static inline bool folio_contains(struct folio *folio, pgoff_t index)
>  {
> -       return index - folio_index(folio) < folio_nr_pages(folio);
> +       VM_WARN_ON_FOLIO(folio_test_swapcache(folio), folio);

Ah, my bad, it will be better to be VM_WARN_ON_ONCE_FOLIO here as
suggested by David, other than this this series should be good.

> +       return index - folio->index < folio_nr_pages(folio);
>  }
>
>  unsigned filemap_get_folios(struct address_space *mapping, pgoff_t *star=
t,
> --
> 2.49.0
>
