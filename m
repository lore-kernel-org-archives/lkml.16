Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179CA293C7C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750927191; cv=none; b=plIsTG5Ht+Agbn94g8s0KHQyz6YVUMLZfxhkG2EHBm6aGR/mapvlyy2NhbAHq9C0a/3dWyeynLu0GeVaco/+NSR10eFE2ZI+VtSsQL4dGubaeWCdO5Ailc5n6Gid0FAX7RyD7EUp4ybcAW2Ez5qwP4pS1vFp0QWGy8TMAps/cvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750927191; c=relaxed/simple;
	bh=WUU7H5N5bg4FTysBPqopoztkT9yebyoBSgc2tc9QetA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IHQVffrfomHsTwP662rlmlaPonXwMV0pLdm6Nubaet27/6ZSkgiSO8upF/3D2KXkxedjd9X6urBv8eRCHDAYK62CdyvlzzrbAchHsikXDFwgfM+66uhslHh/lp+8rkw8HAtkPHt8bgmj1kRkjZ6GNyXn/pGRdFXAeL4ANhQiTog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-87f234ba1abso161134241.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 01:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750927188; x=1751531988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4CXXrh6q12709fq3ouPkXeXw0fUYo3PeMNTc+UDJCbM=;
        b=oq8JYHyN9EyOTbgCeavG4AFWaiVh3DnKFNStl9VVbvz0H6JX/963sgugH9eqoyhOGI
         Iqn72Zd5nzBqli5LjZdR9ImqkaQFAHconccd2VxgbzBTj9MKk5JIdIa/bhIa1NSuHueu
         nt+LSAi44iPMxoR5p8cPyX4K49J4t17OHgAAJT0w4lm5XS9IcA6IyQu9OP9rU51sE3+H
         8lgeFpHvQuDpPRAaepEb63ULnycpc3OlfnMCKII4TLypyNYG7WbNLhw0OOlscj69Esij
         bqMP4KFO/usW/9qchSOpkB+ij1aSoZN+fGYf/2PqgxwDCIXlu7n0/lSxR70VHCjJ7deM
         WTvw==
X-Forwarded-Encrypted: i=1; AJvYcCXINX/0zlU7k0a4RoXK9WiYLu+lGwgMKS3ABRZI8Gs7QDhxQLx+vOgqWQm18QlQoLAmMQ0ckgZFMO151hA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4P8p9hhTYHPHOBNIzvEmfSAcO2DNv5sJ3h83g/6mh4zZVtWWd
	E1nTY3I5GW9wQhnftmlurzj9wmSLVqBd5Uzo/Lb2MA2hTFDgoZX7ipEiH+0x7B6d
X-Gm-Gg: ASbGncsbFeS4T7C1CNGtNSC87FFZokCkSv5PZgnWJIFPU87fTK0stAm4EqgyoAC2jVE
	YoOZ2KujzWLoNv6j9RXNgRaGcbUMC/AS28FO636fi7v6Tk/xJ7FUzSLPWMLhovqHZJO2H/7LeNa
	5Dn9k5KsA4I8jEuUSgRZ9X5PXk4LNMOv21xOwsaaKCumKDNKbFi+G8MdzfI6/DXFeefRms0Hp3R
	z9SBvSRPRWi7z5dss1vsUxcR9hQ3JfjvNx/yW5hXgkWNpgn1WxW504KZJPU7d0L4ffbDnWCtHex
	iF0BRey98I0QVsNXscXKV+LPdRAVOm/3pT5vp/Y1ZK5mrbV1vTb+xJzys55agqAGZB+0rnPAokC
	4FWGAIBQOY8PGt0ZOfcc5SMivzaflz1oe5i0=
X-Google-Smtp-Source: AGHT+IEk+8SjDZrzRSSvyBR5L13poPAnInqZkwDw0RDQjlCzfu6N6e+qJ25vZpWJp4KM64Sa8P4KNQ==
X-Received: by 2002:a05:6102:e0b:b0:4e5:a316:6ee6 with SMTP id ada2fe7eead31-4ecc769c5d5mr4217039137.18.1750927188183;
        Thu, 26 Jun 2025 01:39:48 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e9c3047a5csm2400592137.23.2025.06.26.01.39.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 01:39:47 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4e7ef5d6bffso193612137.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 01:39:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWsysJ+xVRML8Wku4SHH1J5Di1u6B9Q8RlzKBW7EgrlSpjW6aA4O1/8v/HquLW8jiSmYQZ1TmNREkijCx8=@vger.kernel.org
X-Received: by 2002:a05:6102:1610:b0:4e9:a2bd:b422 with SMTP id
 ada2fe7eead31-4ecc7682529mr4585520137.15.1750927187429; Thu, 26 Jun 2025
 01:39:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611001255.527952-1-vishal.moola@gmail.com> <20250611001255.527952-4-vishal.moola@gmail.com>
In-Reply-To: <20250611001255.527952-4-vishal.moola@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jun 2025 10:39:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX0ERhb8KTmEJ-QQdix-yt6iP3SPvvc0hhRj4kjTCVJmw@mail.gmail.com>
X-Gm-Features: Ac12FXx11KF5_uv-y_hIKWSdWLzp2qstbKTBUYUc-2CxFIYYvesDwIAbfVm6Hi4
Message-ID: <CAMuHMdX0ERhb8KTmEJ-QQdix-yt6iP3SPvvc0hhRj4kjTCVJmw@mail.gmail.com>
Subject: Re: [PATCH 3/4] m68k: mm: Convert init_pointer_table() to use ptdescs
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Jun 2025 at 02:13, Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
> Motorola uses init_pointer_table() for page tables, so it should be using
> struct ptdesc, not struct page.
>
> This helps us prepare to allocate ptdescs as their own memory
> descriptor, and prepares to remove a user of page->lru.
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
