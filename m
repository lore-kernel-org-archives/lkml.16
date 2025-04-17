Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB512309A8
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744877323; cv=none; b=aD67QIUuh9k0sCL/AViJNq2KXwJoM0duZW4UEZn9woy9KUpOs+Gd4BRHhVfK5NlulOx2D5YGIZlLIzPhbbU+l7FMCkYxJDECc107bz/hBh/PcXPftAaFX1apprs77lgFZehMu0KnDjkpkP2k9m7+PieHJwUTmpjepbNaTPiei84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744877323; c=relaxed/simple;
	bh=vkyoWugRoTksrbmWHNnd8BkwVMcRxQLEaw53gk79Rvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BWBxwNkTARix1uMDsvtLxE80XR3R7A2KV0FdH75mXno1+CZWEJqUxzFIVzTFDe8wwAPYgeANv1Pg6V1pMUEHjvi39Rr4O+EcSrSM6Lmq538Iu2bgr+Djj+NXLo/vyrfErX5RPcQKbsf3QwoBoFCbVsQ4j1q+M5GJ9TGS/+cO5b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2OdyfI2w; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2OdyfI2w"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac41514a734so68581966b.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 01:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744877319; x=1745482119; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtHyIUQ7PPZmcAeyFR/vgm01NmNP155YBbbcOUPlqcw=;
        b=2OdyfI2wtcznKDXY8x8i7Aa7BBQNIELl0cHWq5D7BfPM5JiwrCxPc5Of6ByjbVYbFv
         IXGCaQd3rF/PDPSiGY3w/BDWZy8aX+l1ZTCBxLtT97569l6ek/OHjGIS0j3Bii1kNNKL
         wRY9YIJ5y5ni7jsV+AYeBSxT486SVA5HmLJl9XQDp4S/t4qhzZAs7CyaLRe4FBts4I3+
         StvFmSgenO7Wr/Tgz6dBRHWfTR1c6iEW1XJV7DQd5qm2GEWpZ+2f/mYT3ELawkAFLvS1
         ISdJVWLdvYUfjHjdz+fTKaQrmWAhVk2PN8vi/jt5M5W0sbhbfuZYvXYgWB2OZWjJBVYJ
         1K7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744877319; x=1745482119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wtHyIUQ7PPZmcAeyFR/vgm01NmNP155YBbbcOUPlqcw=;
        b=rgLI/nNvuhxSbkiVfgYrVe+KsmzLk4qq3XiTZ4dZjM3o9cjqlo1KiE1uQ3XgffX46E
         NpZtinFXNPtuKAQOEQhKEqPqGv9NSi5h8ujeGqkYCMaKxMeM7UrQ2xqBVOJBzfhtYwmy
         x24oUbL/vDqAb87tIrkx1H9o2DRW9XCTz7/8xcmcNFFT3FnwCCZ48t2IKr0ThAfPHpN0
         CfeH7FS310LwOJG86sGuAQqbovN+qMUHIwHdFKMG6rF57OMBVtXr8dlH5sU1zlan4Ksi
         RUtCuXkLqSJQP6FuNkwmKKAM7AYcny3PN6ZP3c07J0YD+lacAfjIGEOEFJfe8/fvmYVK
         Rrkg==
X-Forwarded-Encrypted: i=1; AJvYcCUw3aWAG/dtXzmUy7SahTQczDZNuJ6Y/mrE5Ns5yHYRCaOFE67mtGBFQGAp3OWFgX48Ikr6OiBBM2Z/1Mg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEOLmksHLhHO1YCIu3Nv5UblJ6h9/mveb19nT69pj9qlrtyLZZ
	40AcokA1dAf9EoOi7Z28pcrwYsGAXYbLqHC15i9k+TfBwnXxZeD43RXt4rFwGCCNUT1m9ZAE1Vx
	KgCriaC0SawvqzsPtghMMZKr9EtCeKBWcHBO8
X-Gm-Gg: ASbGncs/oxCcKGIzx7TfUFIt3SZgi8u1fABNj1rn15wQR8dpRsGavuKO16hXj6HXNAY
	34RtxmwZq5svwr9jYYx497UPp6YXUIPQP0m8uVnV0xeqAYxkfpRes4yR1H/jqMRH9BB0FfNIDJ0
	JOKpvaV5C3j/yiYZxkzgjydTs8AHvSz15pI0ymZBNdItJPJAnm
X-Google-Smtp-Source: AGHT+IGpESoslQHTK0ogEW6yQ7GTAZkJZOLnAr+AoJwj8UFQjOudRmdKb0q0bSeFruID8VwGWPn9BWN2wlym/51A+Ok=
X-Received: by 2002:a17:906:9f91:b0:ac2:9683:ad25 with SMTP id
 a640c23a62f3a-acb429f1deamr444633566b.34.1744877319462; Thu, 17 Apr 2025
 01:08:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403183638.3386628-1-korneld@google.com> <38049b58-a504-4223-9f6d-537609931fb4@arm.com>
 <CACF_fqnevOo9NSRwDAh7KVQZTHTkP0pc2NKEXrWFapMYLf0Wkw@mail.gmail.com> <6f1af7bf-a354-4b90-bf82-edc8cc6e71fe@arm.com>
In-Reply-To: <6f1af7bf-a354-4b90-bf82-edc8cc6e71fe@arm.com>
From: =?UTF-8?Q?Kornel_Dul=C4=99ba?= <korneld@google.com>
Date: Thu, 17 Apr 2025 10:08:27 +0200
X-Gm-Features: ATxdqUHWXjxt6FKkLeRswNUzasHECz8dNyCr3yjMNkHFGcVaT-gsxFCFilKbj7I
Message-ID: <CACF_fq=yFLUO2P0qrZFizUJe8J2FGYUK7w3DykKL3x7_R87UQA@mail.gmail.com>
Subject: Re: [PATCH] arm64: Support ARM64_VA_BITS=52 when setting ARCH_MMAP_RND_BITS_MAX
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Steve Capper <steve.capper@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, ssradjacoumar@google.com, 
	chromeos-krk-upstreaming@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 7:15=E2=80=AFAM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
>
>
> On 4/4/25 22:16, Kornel Dul=C4=99ba wrote:
> > On Thu, Apr 3, 2025 at 11:46=E2=80=AFPM Anshuman Khandual
> > <anshuman.khandual@arm.com> wrote:
> >>
> >>
> >>
> >> On 4/4/25 00:06, Kornel Dul=C4=99ba wrote:
> >>> When the 52-bit virtual addressing was enabled the select like
> >>> ARCH_MMAP_RND_BITS_MAX logic was never updated to account for it.
> >>> Because of that the rnd max bits would be set to the default value of
> >>> 18 when ARM64_VA_BITS=3D52.
> >>> Fix this by setting ARCH_MMAP_RND_BITS_MAX to the same value that wou=
ld
> >>> be used if 48-bit addressing was used. That's because the 52-bit
> >>> addressing is used only if the caller provides a hint to mmap, with a
> >>> fallback to 48-bit addressing.
> >>
> >> Why should ARCH_MMAP_RND_BITS_MAX value be same for both 48 bits and 5=
2
> >> bits VA in case the user does request for 52 bit VA via mmap() hint an=
d
> >> the HW supports it ?
> >
> > Two reasons really.
> > 1. The whole behavior is controlled through a global knob -
> > /proc/sys/vm/mmap_rnd_bits. ARCH_MMAP_RND_BITS_MAX is used as an upper
> > bound for the value that can be set to that knob.
> > So we have a single setting for all processes. Some might want 52 bit
> > addressing, others will stick with 48.
> > 2. Quoting the documentation for this knob:
> >
> > """
> > mmap_rnd_bits
> > This value can be used to select the number of bits to use to
> > determine the random offset to the base address of vma regions
> > resulting from mmap allocations on architectures which support tuning
> > address space randomization. This value will be bounded by the
> > architecture=E2=80=99s minimum and maximum supported values.
> > """
> >
> > I suppose that it's legal for some calls to mmap from the same process
> > to request a 52 bit VA, while other calls will want only 48 bits.
> > Because of that the random offset can't be larger than what would work
> > for the 48 bit case.
>
> Agreed but should not this rationale also be added in the commit
> message as well ?

Sure, I will update this in v2.
>
>
> >
> >>
> >>>
> >>> Fixes: b6d00d47e81a ("arm64: mm: Introduce 52-bit Kernel VAs")
>
> Correct commit to be attributed for this fix.

What commit would you like me to point at? I selected b6d00d47e81a,
because it introduced "ARM64_VA_BITS=3D52".
Looking at git blame, ARCH_MMAP_RND_BITS_MAX logic was introduced back
in 2016 in 8f0d3aa9de57 ("arm64: mm: support ARCH_MMAP_RND_BITS"),
which is before "ARM64_VA_BITS=3D52" was a thing.
I suppose that there's also 3cb7e662a930 ("arm64: Kconfig: Fix
indentation and add comments"), but that's just some whitespace
adjustments.

>
>
> >>> Signed-off-by: Kornel Dul=C4=99ba <korneld@google.com>
> >>> ---
> >>>  arch/arm64/Kconfig | 6 +++---
> >>>  1 file changed, 3 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> >>> index 748c34dc953c..38e0bac567f5 100644
> >>> --- a/arch/arm64/Kconfig
> >>> +++ b/arch/arm64/Kconfig
> >>> @@ -332,9 +332,9 @@ config ARCH_MMAP_RND_BITS_MAX
> >>>       default 24 if ARM64_VA_BITS=3D39
> >>>       default 27 if ARM64_VA_BITS=3D42
> >>>       default 30 if ARM64_VA_BITS=3D47
> >>> -     default 29 if ARM64_VA_BITS=3D48 && ARM64_64K_PAGES
> >>> -     default 31 if ARM64_VA_BITS=3D48 && ARM64_16K_PAGES
> >>> -     default 33 if ARM64_VA_BITS=3D48
> >>> +     default 29 if (ARM64_VA_BITS=3D48 || ARM64_VA_BITS=3D52) && ARM=
64_64K_PAGES
> >>> +     default 31 if (ARM64_VA_BITS=3D48 || ARM64_VA_BITS=3D52) && ARM=
64_16K_PAGES
> >>> +     default 33 if (ARM64_VA_BITS=3D48 || ARM64_VA_BITS=3D52)
> >>>       default 14 if ARM64_64K_PAGES
> >>>       default 16 if ARM64_16K_PAGES
> >>>       default 18
>
> Otherwise LGTM.
>
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
