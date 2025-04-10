Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884D91E5B62
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 21:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744320354; cv=none; b=dRvwHBXAGdA17LwW89KnkHzJ1Q3Sn7eWEydiwgECFgm9TFpZz7tc/bcHNVByiJRoCsfHTFhIxpmWlefiBH89dsw922jJWKbgDL5mXCiPtEh7ceISuS2cYda/ENtoMeytkcklNCy6+DbLosDADPGGX6O0wARsklAnpBAqo6epGy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744320354; c=relaxed/simple;
	bh=6aymnWMfN6OxWBckI/Vq7AYsk6eDPkRWIr221kL6BzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XHNNvcHRdAI3u/qHfRXDMOCzUadXiKQcizT8v5OsUp2C/ZDwCR73oj2ZCTcWN2DkwnwM//bQ5Uoqnm72U2DE9hPJ/ZA4LKScuhd8/b6t2O38SuJs7VlwLo19xeQw+cjh/JgvJ7eCVFeZEOP0RoNId4V7Bqt/0CMbXbAaRMwxezs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R22st+ZM; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R22st+ZM"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-52403e39a23so1026182e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744320351; x=1744925151; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EiGG8q8Ypx/hjnGEBryYxRlKkl1JEhEiUgVdwoleck=;
        b=R22st+ZMa7Za4FXGzo+t20N3m76QntBpW0zezFNdoUBJIS91uS8SrSY7DC5xnhpaM9
         CahNqXeiiOs5P7uvUWUS/iMMc6Vy9g5pQpg1zp/JhO3Pwp/lMK5I01ONrBx+bZJVCXVa
         sGfMLZhiqx7J2L1/A8MBmPVy+S3f8cEe9K1+1nf07UlbLNmn7RYUCsd/erhvYHT8GSr2
         k1WyLyV92cAtAkrJswnOhawIjQLnaPVHWSJ7jFGgeeo/HOznsCkkCT70FTQwVzEFUbl9
         1EIOIvI28WthNGz41Dq/CUqZnQ5f4hvRRk6wA8RFvH/k+pkFFY+yFJWmggiPar4jtQmO
         QL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744320351; x=1744925151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/EiGG8q8Ypx/hjnGEBryYxRlKkl1JEhEiUgVdwoleck=;
        b=EDOMCG9Ga2dxQW3nihPXTth/F5U8raJKRzI0haKf8SkdT9fL7xSBNwpWTbCpVHNr7W
         fb2UVZ9eGX5l1l+maZ3A3fS0oHloMuBvxzai797XLq1faIq8YB5QUuRalW59McHUxk3u
         tRrSOfZhsD1PDIzeUm3MltMRh0Qz7j7MJmHRhOHMmeWLi3uAojkbkk9MFcHnDnixpj5D
         Dqk8pGmihPYX2HmpGsypIMBUnyxt21LBYCPNQx1OvUK4FOdGZZ7dd+FUIB3qy1FEVaoW
         zqqLbze2jL1vJJjjyox3qUbPXemlGZ/AGzUCmCCP95UyYVxKtCJJzMFA/+vHs9pY62nX
         VBng==
X-Forwarded-Encrypted: i=1; AJvYcCVz0UsWypHCCPd5HT0R4TSmoDdRl8buuEGYzsyW+RNjXL7FaafN8cvhxgQb9+H9gmklvKqfiUEZT77bqEQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxs7WgGrKfhfNU2sRhZdx4KJ3ZujdMIFMKYzPx5/80zQJJZ0KA
	4F1JZ/udjGwF4ps/LTcwul05B/kw/Zh+bmroO2Lp+ymZ4g76JiF0UsM82i/S65idPujbGD/kl26
	+32AXkG7KfbTPEYvVLBWTJaFlASA=
X-Gm-Gg: ASbGncslpi3lCcTPOK+8ASLI2nZh5tD7jXyrNNb1ALwDQFRTrElhCJ2MiAHKEiO7mE3
	N0nCywQRW/TU9/26u7e812ut1MChd8evW516sEiUhfcht7iPEI8XbS915s/f+VyOVNEtaHc2Q0O
	oC3r64zhr84DAC3IMB6XxtPQ==
X-Google-Smtp-Source: AGHT+IEfzYZgK9rqI0AZQud+O+0HlkwA6VIS/f8C6bC/2AhXMWCcqKze/Dn/RUKa7DKwsgxGidzJ0RV9Q+CYQbY8IUM=
X-Received: by 2002:a05:6102:5794:b0:4bb:e14a:9451 with SMTP id
 ada2fe7eead31-4c9e4ffeed0mr130766137.20.1744320351320; Thu, 10 Apr 2025
 14:25:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407092243.2207837-1-xavier_qy@163.com>
In-Reply-To: <20250407092243.2207837-1-xavier_qy@163.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 11 Apr 2025 09:25:39 +1200
X-Gm-Features: ATxdqUH9N-t9OCDB_pg-Pg6mX6VUE1BGbgJLAvFu-pe7UQ0ejkz_VnYeEs6P1hE
Message-ID: <CAGsJ_4wsW+urp6gbp+yDG40fZw9Bszny2iJVsV_AzzGqgQy+4g@mail.gmail.com>
Subject: Re: [PATCH v1] mm/contpte: Optimize loop to reduce redundant operations
To: Xavier <xavier_qy@163.com>
Cc: catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org, 
	ryan.roberts@arm.com, ioworker0@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:23=E2=80=AFPM Xavier <xavier_qy@163.com> wrote:
>
> This commit optimizes the contpte_ptep_get function by adding early
>  termination logic. It checks if the dirty and young bits of orig_pte
>  are already set and skips redundant bit-setting operations during
>  the loop. This reduces unnecessary iterations and improves performance.
>
> Signed-off-by: Xavier <xavier_qy@163.com>
> ---
>  arch/arm64/mm/contpte.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> index bcac4f55f9c1..ca15d8f52d14 100644
> --- a/arch/arm64/mm/contpte.c
> +++ b/arch/arm64/mm/contpte.c
> @@ -163,17 +163,26 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>
>         pte_t pte;
>         int i;
> +       bool dirty =3D false;
> +       bool young =3D false;
>
>         ptep =3D contpte_align_down(ptep);
>
>         for (i =3D 0; i < CONT_PTES; i++, ptep++) {
>                 pte =3D __ptep_get(ptep);
>
> -               if (pte_dirty(pte))
> +               if (!dirty && pte_dirty(pte)) {
> +                       dirty =3D true;
>                         orig_pte =3D pte_mkdirty(orig_pte);
> +               }
>
> -               if (pte_young(pte))
> +               if (!young && pte_young(pte)) {
> +                       young =3D true;
>                         orig_pte =3D pte_mkyoung(orig_pte);
> +               }
> +
> +               if (dirty && young)
> +                       break;

This kind of optimization is always tricky. Dev previously tried a similar
approach to reduce the loop count, but it ended up causing performance
degradation:
https://lore.kernel.org/linux-mm/20240913091902.1160520-1-dev.jain@arm.com/

So we may need actual data to validate this idea.

>         }
>
>         return orig_pte;
> --
> 2.34.1
>

Thanks
Barry
