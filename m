Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0111B043A
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 09:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747302182; cv=none; b=eDhX5AXgZ3wYSjfUNAnXwrrYJxdH3A4/S5XMGTlDs+apeMqvixy51aNkwZXvEKpWR1X/269cXUU0UnnCVOzmWiXKvq2kR1O8B2uIbdYAdnTApw9XkjtJwyh5083q66guWqgt37OjAw+Wr4CLtkDu0jDX+E2G9lYyH6Ik4yPLyDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747302182; c=relaxed/simple;
	bh=xOgl5f6hWKj/HHODvNZYShFSiloL6d2fazX4+7M3G7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dc7Z1XTpRL+yydC1LS1HRvQ2O8CxUajgsMu0eCSq84KLTcoNc+iBMgILdNkS2pGn/5wvHN7J6YcVmZx+ucDZ5qajHMSR/PQ0WdVRFhcpPMNzH+tXdZql4eNtPXKXtCwH3kP+RQLDuCn0ss/TxXSQEyldKq1Ib50n5df7pZzsD/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S6afS2X5; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6afS2X5"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-326c1f3655eso6568211fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 02:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747302179; x=1747906979; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSoJsMMID/Gsu+/PBfKDktnH99/TWY47+ywS73Ttvts=;
        b=S6afS2X59DrLm2cPHWKY6NUJhBD+PI9cNqvCuKBEEyxzuhB1IPOEUpj1jfvk/dlirc
         /dg89QY+Ztro+ZJ9/8VGlypJ8i7WWII2sJKEBS0CQTNml6AGlbxEWs18N8USYdPKw5P+
         cLuzuhOghNtRbz99OQlgAhWPBPS2m1XTM2fj82PBsZA7XJQx1ZuY5dx5ELJDFpf9SnM5
         z6hOCGi3GOkUZlIr9rIGCIFjayraDTVTHn+d5sLRAyGVAIHykA6UxnQKn5VHg52rgdE7
         vN/wHlOIggvFEf9bumeWF0pg0JixWatlZi3ZRXxvoDgOi3mqEBS1xz/iLy2vuyID+Fx8
         hmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747302179; x=1747906979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSoJsMMID/Gsu+/PBfKDktnH99/TWY47+ywS73Ttvts=;
        b=jRHHw1fhFq4l5WVraqFb0CoSgc23Y1O+GYRTMXD4GmvOlDonEfTuj9I/BcXkQomsAG
         GtG3AhjdhPWa/pfIuO6Pbyrzr9ErVHdWT0eVTVqZ1O7UNPn0sUdSGNY9PTA1k/OylsRm
         5k5GLtdF8w9Uh872prpLht8sZIawxKRgZwezinM6v/qJdmXzQvQdbU+yUOqahyIdZZJh
         M7Bbjm/RGg7IYY3bfTjn0BpRwnnguhePDI+lHHnaqGMrrWJeRTgqxhcZZ031aoKpFOIz
         bAlJtNhco6WTiPWF27V8R7Qc14l5UgSmo+8DSuMOeXcfXpI5DSbikurmhJEvKN0EF33r
         mdmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqxcq6E46dO/v66vnJf0zcZ/sZpZubAgHwzuMm0PicTGRSM1tqR6SAryFM7LJ/bmuo3c3fLZSlgCvNgYM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2nhkwQxt+OSHTlosTe+K2ABjROyJw3oGgKwwGKz6CES3jKlTG
	Ec20kNCnVj3VWdPRGnA0dZfHcciWMPQpKB1kI+B4+Ry1Ss75iFKKmkXXvfPngFQT+5k2NFCT+ew
	PwMFFIv6GkCTItrhNet2PlMMjRRg=
X-Gm-Gg: ASbGncsGi/bE9eahOeS7qyqXFNmgT33uQe1krXkJpm7RNMw9MoVFZYE8FzwcZlpIb1U
	Fmq9frNsBF8ycewvaheDqzECPS1JSDAUXPHxn9++3DMgAJ9bxOm52AIT8wRQsOdsicQWnGw+/L4
	gDqzLtHJEvdGC9No66m8F0u31MqFCSi2hv566onwr31e8=
X-Google-Smtp-Source: AGHT+IFK6XC+Qi7dUXMS8rDolWdRj0H43CP7C7piezecVYmK8iet2iB7VFXlmNpgTHx/sSukM84LJzaWKtyq0HYQpWw=
X-Received: by 2002:a2e:bcc8:0:b0:30b:fe19:b07a with SMTP id
 38308e7fff4ca-327fac54739mr8347941fa.25.1747302178967; Thu, 15 May 2025
 02:42:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515154758.956521-1-shikemeng@huaweicloud.com> <20250515154758.956521-2-shikemeng@huaweicloud.com>
In-Reply-To: <20250515154758.956521-2-shikemeng@huaweicloud.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 15 May 2025 17:42:41 +0800
X-Gm-Features: AX0GCFupifVW6_5jV2E2V3n__1ogNC4pGxj3zt4_KgzPvFwv1ii2wBMkZy_qoV0
Message-ID: <CAMgjq7As2A9jEvY11Bp0+MApHmS16ocdoFwBNuubJwBD34Hjsg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] mm: shmem: avoid unpaired folio_unlock() in shmem_swapin_folio()
To: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: hughd@google.com, baolin.wang@linux.alibaba.com, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 2:54=E2=80=AFPM Kemeng Shi <shikemeng@huaweicloud.c=
om> wrote:
>
> If we get a folio from swap_cache_get_folio() successfully but encounter
> a failure before the folio is locked, we will unlock the folio which was
> not previously locked.
> Put the folio and set it to NULL when a failure occurs before the folio
> is locked to fix the issue.
>
> Fixes: 058313515d5aa ("mm: shmem: fix potential data corruption during sh=
mem swapin")
> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  mm/shmem.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 99327c30507c..980fa15f393e 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -2335,6 +2335,8 @@ static int shmem_swapin_folio(struct inode *inode, =
pgoff_t index,
>                  */
>                 split_order =3D shmem_split_large_entry(inode, index, swa=
p, gfp);
>                 if (split_order < 0) {
> +                       folio_put(folio);
> +                       folio =3D NULL;
>                         error =3D split_order;
>                         goto failed;
>                 }

Nice fix, I also noticed this and included the same fix in the swap
table series and forgot to split that out. We should merge this clean
fix first:

Reviewed-by: Kairui Song <kasong@tencent.com>
