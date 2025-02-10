Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB5025C714
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 22:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739228244; cv=none; b=HU4Tl0AIhVHHC3cnRyFAryA3NATs0ciKGOzGeC0KZpvWocs1ZyatdK/WDBV7s78vc30tB83e4hqDJ7xYg99nIswbVJlRUfQaeyjIDbssU5pf1+9n3lv32ohA4K3UAadM6AxjvYiyEloVM0tdKJoECfKZzlHjRl1oJ5wXGc9gKes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739228244; c=relaxed/simple;
	bh=aCi3QBSVTjikq/6lSHfwlub+3Pl2k8NkvVS0wN2lDZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s/IVzHKdLW16Xd5y2Pg4k7ehl4lX/m0LbKEF9cgSoSpB6OctDW7lPJSuHafC9DPFBtS3qWkSe3rs4Q+wDSkI4hx0/FeM3eq8jKcCLr32y8pBeoIrmZjV9QHpdtr7VZu7MtZy/Aa2wnV/YNb4MCAawt+pfQAtdAk88s0jd2ruqpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHW5UL2H; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHW5UL2H"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso11477785e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 14:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739228241; x=1739833041; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNWayjBWWd58FYF2aoHGNPi8TO+bWh90xjxqLfz1DXo=;
        b=aHW5UL2H4GUj0JYgauwSl3so2LAABpGUY32i8aQEXAhJn3DQM7kQiUT74M0/7vlstP
         80QD2HI1c7lSOtgKfPFBrChSL5XHFzmT+8H2NZc+ZbCy+sHGVpggncQODMyGLHDAdDOC
         QFkJ7YOh8eUHNLy5pm8owMjo01Np5L8TqHAHay03QmY8mL8Fql5XnuhMigQ0BCjqt2lF
         1jkoa6fn0gM5VL3l4kLbVxwo6MAxCs01uw3Dz4IrGgbXbFkzFq9UxrNkcvOuanWhAd2j
         FI7dMbjKLE+X6+nlwf3UHKh24AQQUVTogywbs7PL5XQZKAka8I9hySfnP0v7z8F4r/CP
         sJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739228241; x=1739833041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RNWayjBWWd58FYF2aoHGNPi8TO+bWh90xjxqLfz1DXo=;
        b=LHiykpSAX3K6qdliRN5zfRMO3Glht594zqgCd2zp6ex30ZNUHs4jWqtS45QH8DwLdY
         pjBHYXelLXMsI2Y1TwvFujjfZcAbymL2qC6yeN2up01yqey5H/KZp9WYRyXumm1t/Npz
         gsTRSFzP21+FlYrEdyHf+RA7+cSRy6CaKiVXrXARPTAT4q3MS9Iie0lo3GWpQisHUvRF
         O+g2NaqY2iDINK/5XS9ZKv4no3s1dDZ5pUWjxFp106WHBXqQerwie4OeQWKdQmeX0pxr
         DPw9j0mUr/j2htlIFeAPWip9FHIwrITmY0Q0gtPCtJNAbuni5oaH5Sfo3VBId5aExZlk
         bnvw==
X-Forwarded-Encrypted: i=1; AJvYcCXo71sxtcgvRd6Ml+Q1gzxJoRInioFJ6ay/vMW7xyq5bzIdFspi1fZi5o/F77vRpJUduzFLjJ3JRwpLZCY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyENfm+edqtubU+6KgYo8G72puA+R6kd0WhvQt58gUR9Q4+QYai
	t8GB0ytHlMYVHtnp68KrabOVLguEeqEKH3aSQvfN7k0F10X+qA46AkEwjQVvvB0j+ik97n2Uyzh
	+sHX2mZqWVQtJLHiyr7bd2JSCchU=
X-Gm-Gg: ASbGncvqBEErTnhka+HxgzwYuhBJuEZ4oWVPolmjQAg9ougRCEquMei/dbvHkWV1hSs
	RVm7Uyu3a1/DvY1X30Uq4VGiwGJbe4x/L4B5PkqoqL/Vm6zSxNkSia+uGRJ09fTAgsWhFUtre1Q
	==
X-Google-Smtp-Source: AGHT+IEyUgh5hlQMy0mHMpjDyPnw+ddSs3VVjhhzfY77llj/hDQfGTz8SApwdafm8zv7xWDMgUXawi4NTtMIohvXxFk=
X-Received: by 2002:a05:600c:83ca:b0:434:f4fa:83c4 with SMTP id
 5b1f17b1804b1-439249bcfc5mr154560525e9.29.1739228240742; Mon, 10 Feb 2025
 14:57:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
 <20241022015913.3524425-2-samuel.holland@sifive.com> <CA+fCnZeBEe3VWm=VfYvG-f4eh2jAFP-p4Xn4SLEeFCGTudVuEw@mail.gmail.com>
 <e7t5yzfw3dq5stp5xjy5yclcx6ikne4vwz7d6w2ukfw2b7gr6t@oomoynf3b2jl> <zjuvfdbl7q76ahdxk3lrgaznk7vjj43f5ftzfgrnca6dqtcd5x@5qj24womzgyq>
In-Reply-To: <zjuvfdbl7q76ahdxk3lrgaznk7vjj43f5ftzfgrnca6dqtcd5x@5qj24womzgyq>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Mon, 10 Feb 2025 23:57:10 +0100
X-Gm-Features: AWEUYZn_arFHbmdvgRzow88RfNbJeiY3tjTfw66TROSp7YjMhPMT9KN4C9hXEgM
Message-ID: <CA+fCnZfySpeRy0FCFidLdUUeqp97eBdjAqQyYPpz1WxYwcsW9A@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] kasan: sw_tags: Use arithmetic shift for shadow computation
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, 
	Evgenii Stepanov <eugenis@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 4:53=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> On 2025-02-10 at 16:22:41 +0100, Maciej Wieczor-Retman wrote:
> >On 2024-10-23 at 20:41:57 +0200, Andrey Konovalov wrote:
> >>On Tue, Oct 22, 2024 at 3:59=E2=80=AFAM Samuel Holland
> >><samuel.holland@sifive.com> wrote:
> >...
> >>> +        * Software Tag-Based KASAN, the displacement is signed, so
> >>> +        * KASAN_SHADOW_OFFSET is the center of the range.
> >>>          */
> >>> -       if (addr < KASAN_SHADOW_OFFSET)
> >>> -               return;
> >>> +       if (IS_ENABLED(CONFIG_KASAN_GENERIC)) {
> >>> +               if (addr < KASAN_SHADOW_OFFSET ||
> >>> +                   addr >=3D KASAN_SHADOW_OFFSET + max_shadow_size)
> >>> +                       return;
> >>> +       } else {
> >>> +               if (addr < KASAN_SHADOW_OFFSET - max_shadow_size / 2 =
||
> >>> +                   addr >=3D KASAN_SHADOW_OFFSET + max_shadow_size /=
 2)
> >>> +                       return;
> >>
> >>Hm, I might be wrong, but I think this check does not work.
> >>
> >>Let's say we have non-canonical address 0x4242424242424242 and number
> >>of VA bits is 48.
> >>
> >>Then:
> >>
> >>KASAN_SHADOW_OFFSET =3D=3D 0xffff800000000000
> >>kasan_mem_to_shadow(0x4242424242424242) =3D=3D 0x0423a42424242424
> >>max_shadow_size =3D=3D 0x1000000000000000
> >>KASAN_SHADOW_OFFSET - max_shadow_size / 2 =3D=3D 0xf7ff800000000000
> >>KASAN_SHADOW_OFFSET + max_shadow_size / 2 =3D=3D 0x07ff800000000000 (ov=
erflows)
> >>
> >>0x0423a42424242424 is < than 0xf7ff800000000000, so the function will
> >>wrongly return.
> >
> >As I understand this check aims to figure out if the address landed in s=
hadow
> >space and if it didn't we can return.
> >
> >Can't this above snippet be a simple:
> >
> >       if (!addr_in_shadow(addr))
> >               return;
> >
> >?
>
> Sorry, I think this wouldn't work. The tag also needs to be reset. Does t=
his
> perhaps work for this problem?
>
>         if (!addr_in_shadow(kasan_reset_tag((void *)addr)))
>                 return;

This wouldn't work as well.

addr_in_shadow() checks whether an address belongs to the proper
shadow memory area. That area is the result of the memory-to-shadow
mapping applied to the range of proper kernel addresses.

However, what we want to check in this function is whether the given
address can be the result of the memory-to-shadow mapping for some
memory address, including userspace addresses, non-canonical
addresses, etc. So essentially we need to check whether the given
address belongs to the area that is the result of the memory-to-shadow
mapping applied to the whole address space, not only to proper kernel
addresses.
