Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95EC522F
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 21:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744581169; cv=none; b=KaIcqYZP73CQiOc0ElvePTH5yp228cv+bb1WWvn3UUYAETQYMUSrvfEUECcklkRxiLF1EM6jHkiB9ARKrxntzG11RSRnDKfuWMoqS3E8hfAQ3RjVmn87bn4/snnpWLprBz+ljI5YWAdslFbaOjhudyW4cKlrbunSrBVfJv9VN4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744581169; c=relaxed/simple;
	bh=KHm8vcRAUY242LnE47nTTtBC+8/anitDSKeEbWY1YsI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aWvR5qh4MlWxZIy2xNZ493sM0xf5b8FpFjd7RYbOu/rZTFl1R+vBnNm1Ik3f3VFr7zHCwdcPH0uU9g3yGt1jhVsty7BcSHwQsq9mgSFxJF86j7h99oHOhMXQU31FIQNbNOfWQr3cWyo0vcuW0aFl8mEJl789sVGWSqyKjqpW+pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtAdsouY; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtAdsouY"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-52413efd0d3so1534178e0c.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 14:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744581166; x=1745185966; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdckprofwx7J6++yuwlKM5RZmEqP0SzggfNYMDxxHmU=;
        b=FtAdsouYtSsgKqFm7BKtjFC1eD2dOhOJRfAJ1mBV0K/uWC9JaM9vgWidQmAqVjqjeT
         c3Hpiz+ig3EIO4KgMK/IVehER/IsjgtDPYkHKsyk+LIWIInY506oaZnAJWIeAx3BNgte
         ZeNgBEjwhiV0QRA72qmg3o23X2zztenIlaexR9cp81W3CiyYn75UGNpbe0G6sB83nMLU
         ke9IByzPzZB9c09XJSPUJpX4Yqjz0eWKuBSJh31wnO6KPL4LKyUnnP6xQgqvJ7cNX7a6
         m+qE7o6CGj3O70HOPHvcFHO/hFUtHV0AmWC+UmR5EQfSvMnF77RaX90Ed9aqlpU/T0iI
         wH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744581166; x=1745185966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hdckprofwx7J6++yuwlKM5RZmEqP0SzggfNYMDxxHmU=;
        b=EQs5k1t6Pu9s3kB1wqVx3C8kUKy2mCHJ47NmKPev68MjIU1F+RV9s0ZeSf1MXuJOWl
         aZWw5XYNjQTiJy2hUdWeBtHeK0dDB++jPeEQv/kwyvrYcWPVmkm3WhR/dIZYt6AG1K9a
         9TlggQOTOGivSJGLxMzTMkLicqLPjws9oKRhuXa87RXOvsFR9r3ljb/q8R2aAv5MBijZ
         wu4dSd6fMuRms1PL0FewBidC72aJk/k8VGd4aG5BbfHc8AtPjCc1altj+tkMfGowZDxV
         fSTptq/sm1RFnNfEn8iqoXZEQ4UDu2FDDZz+yaoyEN/svf5HnXgdwKCm6t8zuEXfYlgI
         6tLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzJZyR6s1UlxawH7/sQjKApnFKneNZa1gx0UKMPyB7ZbrRCd+T7vrRZWmhBpU3NssoF2/1AV4oSEeZ58I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5ySLHmdEziry9cXymA7tH/9MbPIvfkuefMjUs++GBHlAJll2C
	JwGnNIqtzfWwqCqQTLwvt0mWEcr7Dj4OEHpi+r+KE5NXMlWuJPxdCTdT8d7WVb14Pt2ACZ8NW2s
	BXC7CiVXBeSFx8Qxi2ZwggBu4Mjo=
X-Gm-Gg: ASbGncviHXqt6Or6WN6O01NlPbcvqVkStFuRT24BE6KVTFd2TK9z64PSQt7QaNCJwrb
	pAPmTUciByjMyME5izcv3tBCqPBjUaDvJNYG/ralNFIo9brNvLlB/pjEVGaP9Lo0oHeGnPqWqoi
	adWG9VbHNlC2S4d8Jku0Dh3Q==
X-Google-Smtp-Source: AGHT+IF52wloyZlpGGZzMtS1CxjhKrzNf2GC3dbnLxwOmoivfW7+D5MgvX3rXoagYBIDkXYrYQvzwPGf8p19IwJoxLQ=
X-Received: by 2002:a05:6122:2090:b0:526:7f3:16e0 with SMTP id
 71dfb90a1353d-527c346661bmr5862667e0c.1.1744581166291; Sun, 13 Apr 2025
 14:52:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d92eeff74f7a4578a14ac777cfe3603a@honor.com>
In-Reply-To: <d92eeff74f7a4578a14ac777cfe3603a@honor.com>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 14 Apr 2025 09:52:35 +1200
X-Gm-Features: ATxdqUGgqiBW2HmNSCl2Ko_fAMUAoorMu__CYtK8LcuF3vaCwcRHTKyJoWDSR0Q
Message-ID: <CAGsJ_4yX9-WPBfrmTSiHka5-=TZ2dyAH3zTAuSt-+P_UFJ5NkA@mail.gmail.com>
Subject: Re: [PATCH] mm: add nr_free_highatomic in show_free_areas
To: gaoxu <gaoxu2@honor.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	"surenb@google.com" <surenb@google.com>, Yu Zhao <yuzhao@google.com>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, yipengxiang <yipengxiang@honor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2025 at 9:27=E2=80=AFPM gaoxu <gaoxu2@honor.com> wrote:
>
> The commit c928807f6f6b6("mm/page_alloc: keep track of free highatomic")
> adds a new variable nr_free_highatomic, which is useful for analyzing low
> mem issues. add nr_free_highatomic in show_free_areas.
>
> Signed-off-by: gao xu <gaoxu2@honor.com>

Reviewed-by: Barry Song <baohua@kernel.org>

> ---
>  mm/show_mem.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/mm/show_mem.c b/mm/show_mem.c
> index ad373b4b6..03e8d968f 100644
> --- a/mm/show_mem.c
> +++ b/mm/show_mem.c
> @@ -305,6 +305,7 @@ static void show_free_areas(unsigned int filter, node=
mask_t *nodemask, int max_z
>                         " low:%lukB"
>                         " high:%lukB"
>                         " reserved_highatomic:%luKB"
> +                       " free_highatomic:%luKB"
>                         " active_anon:%lukB"
>                         " inactive_anon:%lukB"
>                         " active_file:%lukB"
> @@ -326,6 +327,7 @@ static void show_free_areas(unsigned int filter, node=
mask_t *nodemask, int max_z
>                         K(low_wmark_pages(zone)),
>                         K(high_wmark_pages(zone)),
>                         K(zone->nr_reserved_highatomic),
> +                       K(zone->nr_free_highatomic),
>                         K(zone_page_state(zone, NR_ZONE_ACTIVE_ANON)),
>                         K(zone_page_state(zone, NR_ZONE_INACTIVE_ANON)),
>                         K(zone_page_state(zone, NR_ZONE_ACTIVE_FILE)),
> --
> 2.17.1
