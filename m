Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A658F6B
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 18:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748198709; cv=none; b=po7eUh+3acjtE6Vq4buxDw/PJvqsha0w9XLvm+17lVFv6FxJpNQ/lLaPBgsxhtjSnoHr+bf2+7/dG4o2YoRPqyianVs4VDicreA+c8KDqrXdyqn/xypImVyn55nR39wvp/pHQlv1E1+OY0wnTU5HybrOXA90hf5FdMljfTZg42s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748198709; c=relaxed/simple;
	bh=u9GJY5Dd32G+pPeVm6bgx7/QVdprOpjyJWVsr2dt3Es=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AAOp6EsopRg+nAN6Mdk7FlkezQ8/kNlwujlQ05NB0XcXminkq+Va1t1yEo3x0nKO2cbGTJe6AhYQdp/LSlmKuw1waTzTPpMft6APCsVZVesXr6xQl/2mTDUoOVnvpVfLu0Dy3G9K82IdGnoWtdZ7Qtsh7Jf1m0OEQTZMb4wntw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UnbjgrUh; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UnbjgrUh"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-72ec926e828so316538a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 11:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748198707; x=1748803507; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zlZFRhPE/eFCl215/JCvK2SWRrEZJvnFdKymxEp1wtc=;
        b=UnbjgrUhkJI+0VcYe5tZK9f3k6ADxNoAzOig9wD974ypKxKG5L0FkSoYMP19yNz3es
         SralZjhfe4lLB/+6mS9BDxFCfQhlxuoXYyCd6tT/XPx8ytaebm6Hidjur9hzJ6WVZlmb
         PPfrAIaG9tE67+N8byB8yYmPKL7jOHz6XimDWmRUm6qCWGfvyMF2xEmdUj4vfdAyupqq
         r28r39xsgWuPXPhYyJzekXHRxN9zhu2zq1gV6EGFJV9IHBM0UPiKfYjBHk5mTfrKDkZZ
         MMqlxnUV9TwFhO+YmDKLifcl9w9KsVVTqC05DYj3oYwJ2btVgHkN21TAsF+oJS2yH8c3
         Cqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748198707; x=1748803507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zlZFRhPE/eFCl215/JCvK2SWRrEZJvnFdKymxEp1wtc=;
        b=IxP8MDu8hCjHcznfBqTaikoMZcCT1frZCvt1sCkRBOAhYx9F449uUZPxlGm85dh2fO
         1CQZ9UJ9P11tfhvv88F+XvCR3CiX/78/mFMEE/tzfxuY/bGTRvZ8Y602Z/XGt8d2lkQl
         SWyOQ3QwGGbInRROPOpa5mIHlaNSBy/b1xh8r5CGZ01xEQl3ZnRmMq8EXeijgw/XOIZA
         z2SOBUdsUb6zzqPY1Fn1XbH4ux4xqqwTquV8WnDVljYrDlOZLehpFqEHk0Clk11wfxfP
         NHAcpIfyYAxjhiJxnq9L0Hb2cVjkdIH/UoYWEiVc8mxdkiDPy5lcihjVVLfekKvL1pjk
         C5cA==
X-Forwarded-Encrypted: i=1; AJvYcCUFPG59yhxj/r+LJ/egn+ZhMUYnpXGm1tJ3q59l6QRAipivPlfcqKKeCP81CyVao5f2KV9cE4o8sDXTY/k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjbJFvk5Ca/4FTFd7z2KxCxf9YwomdAMqQ8fWwicReATQq6iXK
	buQZi5htlfctaXtx/ZyRQN6MkULuNrBOsxgKPEulwJFFcV2i0PJsoY4M9mcLzzzvlLxxglh4HuM
	k83yGZ3zWHYkz7Hz0uI4IX3ET0l3lidA=
X-Gm-Gg: ASbGncsFsGLuxx3qRxJwpoOnrJ2GTrc2VG6OFerufnBQhHkCE7KSFPdX7fNAtNjJq0a
	w8xvJLEXRcLQclC8e1Ne1Ea4XZhaGSt8L0geSKDPl4UiUKOMSvUb5H2Q3r6SyxdohGvtk2u184U
	e9brXS4v0EThZ8NKWcMWSP/B3dgaCh0J0w
X-Google-Smtp-Source: AGHT+IHDfTFdcBH/l37Le5WRDbeB3Misl7yxPPTRta05DvYdNwiRM3ITTTaCDvRLinRpF5oGY7zXsSu7NyLQCXH4h/Y=
X-Received: by 2002:a05:6808:4448:b0:403:25bd:ca71 with SMTP id
 5614622812f47-406468431ebmr3410931b6e.15.1748198706976; Sun, 25 May 2025
 11:45:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522122554.12209-1-shikemeng@huaweicloud.com> <20250522122554.12209-4-shikemeng@huaweicloud.com>
In-Reply-To: <20250522122554.12209-4-shikemeng@huaweicloud.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 26 May 2025 02:44:48 +0800
X-Gm-Features: AX0GCFubxZByYqpvGsq5c_LFRl1oMErG28xwsGlkRLdiAGNdLQs1v0jRUu0pFy0
Message-ID: <CAMgjq7BHzid81f2cBDwQqN6enfJOh8XLjzOS6e+kiu6TMuu0ZA@mail.gmail.com>
Subject: Re: [PATCH 3/4] mm: swap: fix potensial buffer overflow in setup_clusters()
To: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: akpm@linux-foundation.org, bhe@redhat.com, hannes@cmpxchg.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 11:32=E2=80=AFAM Kemeng Shi <shikemeng@huaweicloud.=
com> wrote:
>
> In setup_swap_map(), we only ensure badpages are in range (0, last_page].
> As maxpages might be < last_page, setup_clusters() will encounter a
> buffer overflow when a badpage is >=3D maxpages.
> Only call inc_cluster_info_page() for badpage which is < maxpages to
> fix the issue.
>
> Fixes: b843786b0bd01 ("mm: swapfile: fix SSD detection with swapfile on b=
trfs")
> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
> ---
>  mm/swapfile.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index a82f4ebefca3..63ab9f14b2c6 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -3208,9 +3208,13 @@ static struct swap_cluster_info *setup_clusters(st=
ruct swap_info_struct *si,
>          * and the EOF part of the last cluster.
>          */
>         inc_cluster_info_page(si, cluster_info, 0);
> -       for (i =3D 0; i < swap_header->info.nr_badpages; i++)
> -               inc_cluster_info_page(si, cluster_info,
> -                                     swap_header->info.badpages[i]);
> +       for (i =3D 0; i < swap_header->info.nr_badpages; i++) {
> +               unsigned int page_nr =3D swap_header->info.badpages[i];
> +
> +               if (page_nr >=3D maxpages)
> +                       continue;
> +               inc_cluster_info_page(si, cluster_info, page_nr);

I think we might need a pr_err or pr_warn here, this means mkswap
marked the wrong region as a bad block? Or some fs side things went
wrong.


> +       }
>         for (i =3D maxpages; i < round_up(maxpages, SWAPFILE_CLUSTER); i+=
+)
>                 inc_cluster_info_page(si, cluster_info, i);
>
> --
> 2.30.0
>
>
