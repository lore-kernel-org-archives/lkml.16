Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC0628EA
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 07:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747381609; cv=none; b=m4dfqKdtM4bCMEtyOsfpxUJ7t0O/udgN51z1Jgp2NEeQ+/iOzfxUyEXpZ5qL1YVtqCC79yjaqncVeN/ooszpaDvfx23kyD0JvOmsbvHX1gIOdYyRTkTdw60BrpbwHF9HpL25f2WxBOjn2RoMXdFQfyAxcw66t4ngcUpTcNrJ7xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747381609; c=relaxed/simple;
	bh=GEYIlKlMp+i18kzl7F0m7LOj9Pe2X7DdZ/CvVc++v6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cvIhxyen9CIlZzDgz8xdoUr5tf+bZL+15DtLmM24iOAh8FBHc4a46P4AvOLOGLT90KUjf/VR2f0HQOtLchWoMXWOIekz63p0qRX137ZvTQ9g6DsAWwfFNoXjTiR0e83fOvaHbAB876a8UQXlnyFdCXeyuc/Ygw0V69zc0n58J1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IaokmHvX; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IaokmHvX"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-327fa3cece6so18244141fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 00:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747381606; x=1747986406; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kdUlLM4OYNNB+Q0de2cnvvKMDgt8mSfzLyhZz7lCl0=;
        b=IaokmHvXg/M8EKyRT4aTZgCye9ihKC1v+VyflcIPr/bYr/a8KAkrdnkgLPnp0JkwU9
         UcevXiCOam0PSAlWeT+tfkXr89IfaNg5QbQYnq9NaoYt1e1zaXWFdWqiv0CUTdYYGR9R
         ojFG4iV5MwTFPhEfvI5tC8m/6CJiqUAnMHfmNSDD2fV/aqBvcZkxEHLXyn4MfQUwcpy+
         G7yzjbRQbF3B67NdVXgL8xdz5CIqYZJNuc5l+8kEGHDPwsmauUgG9+s6L64PClQKSR/5
         szNkCcYezWCCQiL2odKFGrmA6j5B/W1023/JJYZ9cF0xiqmscR5znw9GLWkNZix1vTMj
         StgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747381606; x=1747986406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8kdUlLM4OYNNB+Q0de2cnvvKMDgt8mSfzLyhZz7lCl0=;
        b=mjvngEHolxupsKKa5K3ZaLYy3WyP6eAUDFH8uiKi2VivaXbx0Jtkcf+MEa2q0a4q0M
         UPYOY5K1IpMvvG5ixWJmEt5cufy3lzwY2x0bdxnuSzExsHWgKLNYn0DEHV8J2iOPG4Pm
         CXzFF0S34q2V+sfWxL+raJd7JR85BVwBFKJ+jTfOrdHs2mWIzat7RcVXymZYI/P8oSNM
         NP8XLHPlTS+A1+CZnPDFa30PaaSGT0X+LQ0pW64unmoiQ4/z3fH+gSEEiIAbatG0twKz
         yEWKg7Z2est0tBccIor86RQfzgRqCeItYMPK9zozAEw4on+H8bm1oh4nVEj0reow7POB
         3+Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWYF/kClt5Tw1CB7vbl60NMh79ba5htI5/cD8MuMXgBCcSJC5huzYDIy4jCE2bCwLHQ4n/2jtPLftQGeyw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRSyBgP9Bssg+USEYCsP606Tp6XVXUSdSvQrZZ2L37VCIhxTOg
	/Xv27upNh3IOUutfYF/6Sw2xvGrFz9oJ+ASJhLcKuSNnO2TXSmJjMOaSdR56m12GbQwMLpAiGsf
	CRuHwreHOkvos7enjTngYDxKQHJmRTLE=
X-Gm-Gg: ASbGnculGYY1cxxs6osGLmGYBVGUl3giFhlQvkTxg2LJwcDicN5J7IFuVryXNEXTfO9
	bYUomr7iLa3BWQoi/b/BkT3I/LmqyfK6wnYLM/VAImxiCzs+vweqEkqjV2tl/n0qh57lU1oy4Nt
	1m9l0xrsE5gAknYVO9GANMw72eGqSD+9o=
X-Google-Smtp-Source: AGHT+IE0nZaa3lywKJSrgzWbIetlfeVMzdRmmjkY/d0XayLLEiTTB9cmkGwxjeXUr02SfCgSNK6ym+FkT+4dGdwCjMw=
X-Received: by 2002:a05:651c:31c1:b0:30c:7a7:e874 with SMTP id
 38308e7fff4ca-328076fc715mr6880841fa.11.1747381605779; Fri, 16 May 2025
 00:46:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515154758.956521-1-shikemeng@huaweicloud.com> <20250515154758.956521-5-shikemeng@huaweicloud.com>
In-Reply-To: <20250515154758.956521-5-shikemeng@huaweicloud.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 16 May 2025 15:46:27 +0800
X-Gm-Features: AX0GCFucgXOLWqWrUYIUDY5MmST7FhaJWcYgxZ6Ec7i5QmXonwQswSAvi2mWs_s
Message-ID: <CAMgjq7Dz3yvZdMCr86OmxSUo2Xjd+ZG0-D4jBiLGXmYKcZZSTQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] mm: shmem: only remove inode from swaplist when
 it's swapped page count is 0
To: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: hughd@google.com, baolin.wang@linux.alibaba.com, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 2:54=E2=80=AFPM Kemeng Shi <shikemeng@huaweicloud.c=
om> wrote:
>
> Even if we fail to allocate a swap entry, the inode might have previously
> allocated entry and we might take inode containing swap entry off swaplis=
t.
> As a result, try_to_unuse() may enter a potential dead loop to repeatedly
> look for inode and clean it's swap entry.
> Only take inode off swaplist when it's swapped page count is 0 to fix the
> issue.
>
> Fixes: b487a2da3575b ("mm, swap: simplify folio swap allocation")
> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
> ---
>  mm/shmem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/mm/shmem.c b/mm/shmem.c
> index aeeddf612baa..07b8e1400c67 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -1651,8 +1651,8 @@ static int shmem_writepage(struct page *page, struc=
t writeback_control *wbc)
>                 BUG_ON(folio_mapped(folio));
>                 return swap_writepage(&folio->page, wbc);
>         }
> -
> -       list_del_init(&info->swaplist);
> +       if (!info->swapped)
> +               list_del_init(&info->swaplist);
>         mutex_unlock(&shmem_swaplist_mutex);
>         if (nr_pages > 1)
>                 goto try_split;
> --
> 2.30.0
>
>

Thanks for the fix!

Reviewed-by: Kairui Song <kasong@tencent.com>
