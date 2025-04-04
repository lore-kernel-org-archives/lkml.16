Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4E11DA53
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 16:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743785219; cv=none; b=rqo+o0m0JnHqHTfUwrFIcGYeRuY0wEsCmB2XpOGrIKcN7HfnBXd9uyygjg7eUzu7/98bQXmXiZZt8hAVsSuh2BAzilOgXDBbRRFy21QkjXz+MK3FppWCxa/gd58Zv9CKNOtZDJ7l2YccEs21HSi3FzKh7X+Fd46u8NIjbu6FJnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743785219; c=relaxed/simple;
	bh=hIKhRSZjhmThDb7EYJQvIkDSWU8hKSOGKFSqi3L1T1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rYaMv3pGluYMPNc+LLDu4HMLKxFcG7W08XorKnR8FaifhKcvTYinVfWfBtPWNy7o0OFgRYi7s4NAd/YGlvc3WVTRIFp3ATfSaQ9Hm8+cymefHMnMhU1TLcfdy4WNHxJTFb4DjzSpj1d+fvoVFkXGLH0BXyVcDJ1IfYUlETlUm5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zJU3G0X+; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zJU3G0X+"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e5e63162a0so3592737a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 09:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743785216; x=1744390016; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmIk4Bf8JYic5jKt2h6PG9WM5KVS12ByqS/whgCHN2s=;
        b=zJU3G0X+lYkAX292P2c63i1uVTlO2YGcdVyrPLzGNIfv5DkfnFU3r9qQHglKNUCWwT
         zpRcCCMNb0K3Jr8Hfq9YXXii7NeY7AGrNBAE58d7u1nEn1Qn9h2g7oIB7CDxUtooMp7F
         +3wYor2akCKFZ+Vcl+L7CW9Y9BotSM04g9jU0BrO1R5V4YAx60GQUi53giJOckOMuIMM
         qY6w6h67fmGr551j3L2rmtIVbtJDK3Zj0BKFTRjGouEFbXN/zhIUEJ5/oErD3jIABZDZ
         Onwl2y6j4DoZs9PtiG4td+HS/nmKj+DrcRHB6ls70MgpaoT/dmbqoKnP/uqRCbxHlJae
         U3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743785216; x=1744390016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmIk4Bf8JYic5jKt2h6PG9WM5KVS12ByqS/whgCHN2s=;
        b=fFRtJgjzmaWze8vWTBFljcnQRYoiDmCMvweKh9H4jhgNoIzVnUvD8kf32KbY5Xq6NU
         QvfxpaVNBbgGTYWGXparT1QaD/bN0TdpwGEYDf/wd8mCo3JBieupxuZhTPTkyfaD+Omq
         NJrotUFOTM06Sr8IYzq2AVPPwPwfoNIfkff+sDQLoIimaYHWFpKWaaXIkq6pvdi+7jNT
         btFheofF3b2cFVZ1+PyKLPiiX7+USQpXeFr9m7htAHSCjsjU7L3+VJaTqnX21REuaz1Y
         7bXCuErkZ7sQLAV/LPk6QHCSvFPAqT6ud2g/dggmQcym60YiuFN7LzS4myQAMtpbUPOK
         s4pQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8+K8iI1JpSmqnqUoFR9qm0+AD+Z5Q4xo6+tpoHqVDDpLidYxHH+j9PYKQct9cP7EvB/N9J1F9TN3LdnA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0jZtZW3lSu4BUBouhzlpB9RpY1DmQEXNhZy0QnOI9MC2rSKYd
	gFWKZczy0cGJf4gLcfU2CInNWUucVnx6dWtLVllZalDUnxoqF17ZZ64PgOIMIWK3z63yFzzxUeK
	CSuHkAsuvXjmKgiIA8GhaIylO7hjNiqjUOaKR
X-Gm-Gg: ASbGnctJs3qGbEPFi9L3+m/aXggwhv+olGmnbwe2OSoTKmi2p6gOwFI89fA6zvgnMfp
	yOFbD9PmbJXNuQGtEbecIZ05DvM+shl3hLgDhhsW85fOPqb+LblzaJV6vOBUY7zm846rDYNVJNo
	g8uHXi9/mIp6hfUpX3xoUwAsKFa8qf
X-Google-Smtp-Source: AGHT+IGZvJrBZhWim227+KHyeF5pHjecYkebdfC/oO+T1+f76z1K2lWjW4Sj9M1gPKhICcaBLgKlmCPR2Qri8rGuiyw=
X-Received: by 2002:a05:6402:501a:b0:5ec:7909:1a with SMTP id
 4fb4d7f45d1cf-5f0b3b90213mr3475628a12.12.1743785215689; Fri, 04 Apr 2025
 09:46:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403183638.3386628-1-korneld@google.com> <38049b58-a504-4223-9f6d-537609931fb4@arm.com>
In-Reply-To: <38049b58-a504-4223-9f6d-537609931fb4@arm.com>
From: =?UTF-8?Q?Kornel_Dul=C4=99ba?= <korneld@google.com>
Date: Fri, 4 Apr 2025 09:46:43 -0700
X-Gm-Features: ATxdqUECnVZpTf68QOEHrUaEwF1cbhB2o9BXMstyQIh2XA_NCs4lPmpJHqpR2eQ
Message-ID: <CACF_fqnevOo9NSRwDAh7KVQZTHTkP0pc2NKEXrWFapMYLf0Wkw@mail.gmail.com>
Subject: Re: [PATCH] arm64: Support ARM64_VA_BITS=52 when setting ARCH_MMAP_RND_BITS_MAX
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Steve Capper <steve.capper@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, ssradjacoumar@google.com, 
	chromeos-krk-upstreaming@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 11:46=E2=80=AFPM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
>
>
> On 4/4/25 00:06, Kornel Dul=C4=99ba wrote:
> > When the 52-bit virtual addressing was enabled the select like
> > ARCH_MMAP_RND_BITS_MAX logic was never updated to account for it.
> > Because of that the rnd max bits would be set to the default value of
> > 18 when ARM64_VA_BITS=3D52.
> > Fix this by setting ARCH_MMAP_RND_BITS_MAX to the same value that would
> > be used if 48-bit addressing was used. That's because the 52-bit
> > addressing is used only if the caller provides a hint to mmap, with a
> > fallback to 48-bit addressing.
>
> Why should ARCH_MMAP_RND_BITS_MAX value be same for both 48 bits and 52
> bits VA in case the user does request for 52 bit VA via mmap() hint and
> the HW supports it ?

Two reasons really.
1. The whole behavior is controlled through a global knob -
/proc/sys/vm/mmap_rnd_bits. ARCH_MMAP_RND_BITS_MAX is used as an upper
bound for the value that can be set to that knob.
So we have a single setting for all processes. Some might want 52 bit
addressing, others will stick with 48.
2. Quoting the documentation for this knob:

"""
mmap_rnd_bits
This value can be used to select the number of bits to use to
determine the random offset to the base address of vma regions
resulting from mmap allocations on architectures which support tuning
address space randomization. This value will be bounded by the
architecture=E2=80=99s minimum and maximum supported values.
"""

I suppose that it's legal for some calls to mmap from the same process
to request a 52 bit VA, while other calls will want only 48 bits.
Because of that the random offset can't be larger than what would work
for the 48 bit case.

>
> >
> > Fixes: b6d00d47e81a ("arm64: mm: Introduce 52-bit Kernel VAs")
> > Signed-off-by: Kornel Dul=C4=99ba <korneld@google.com>
> > ---
> >  arch/arm64/Kconfig | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index 748c34dc953c..38e0bac567f5 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -332,9 +332,9 @@ config ARCH_MMAP_RND_BITS_MAX
> >       default 24 if ARM64_VA_BITS=3D39
> >       default 27 if ARM64_VA_BITS=3D42
> >       default 30 if ARM64_VA_BITS=3D47
> > -     default 29 if ARM64_VA_BITS=3D48 && ARM64_64K_PAGES
> > -     default 31 if ARM64_VA_BITS=3D48 && ARM64_16K_PAGES
> > -     default 33 if ARM64_VA_BITS=3D48
> > +     default 29 if (ARM64_VA_BITS=3D48 || ARM64_VA_BITS=3D52) && ARM64=
_64K_PAGES
> > +     default 31 if (ARM64_VA_BITS=3D48 || ARM64_VA_BITS=3D52) && ARM64=
_16K_PAGES
> > +     default 33 if (ARM64_VA_BITS=3D48 || ARM64_VA_BITS=3D52)
> >       default 14 if ARM64_64K_PAGES
> >       default 16 if ARM64_16K_PAGES
> >       default 18
