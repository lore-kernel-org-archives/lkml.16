Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FBE1A23AC
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744616552; cv=none; b=XwNya8czs+zXlh1JZo2xYL1hQ/CAbDpayXGAQSpzrPuRWL0iD7SWJuTRWP9ovhhu0Lyl8qh6eCDCh4tGsFXEFjofmtoiLpFYsBNmQVBM+S/QkZiYlIlD0CjgZBM1glwLLmhyDrDq0sTmbRRBoDR/S+xthO3lLStHTo7iEpV7XyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744616552; c=relaxed/simple;
	bh=aGOjQMyzNf7lFDY26ytPCmLpwEPSgkDdt3Lh75dVgqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qc2L09Dj5njJGB4I5MXnQ2S69YpYLzWzE9cngyq2YEsD/WNJp5OBH2IzPsSx7to1z6ocTlc/BnNO/9bLamGGK4mmqtaS48FN9qxk77qEhYBQ2Hf7Z6Fq2d+UGT/0l5Osk27lsFRah+PsSgH5phhZ3vDmktaAibtI5TYNc0xwj+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LU5OxLpJ; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LU5OxLpJ"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e6167d0536so7461937a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 00:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744616549; x=1745221349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MXmOU2mBSnJ1Q/G80oE+sQEi5M/NGyL+TQUbVq1jkto=;
        b=LU5OxLpJJ5tP8Yg0njZkWp7duwpzkftHu4HZyHlng+VZLdmPT4A619zNzseMfnbN7h
         nDjU74Mnzb0FEvIM8aYzHXp574fbk8hkkrycu/2kT3fjAAdSMjGXK2sU/fM30XhxZJNl
         vvkqnN0hdGRt5i6xWQxQVDVr8tsMO5k7auwmX3dE8Y2kllqiBljxjmBXfDcBeU6SlL9H
         TErbAi0620bmFwW8D8rJsaHSoVLipWsiDdkxKWViRemRHMXlVnG8IZJ6rNKlUE2f6U+G
         DiFHSzVuYjNTSpPT6g4uZ0NI2PMIBcgcyJkTCKQCV5LLtsoRcDPii/BulcjM7jyT3XVt
         VPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744616549; x=1745221349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MXmOU2mBSnJ1Q/G80oE+sQEi5M/NGyL+TQUbVq1jkto=;
        b=qEmdiJO2Ua4E4PKDer0w5EwmoY8kmX9HgbXuTgJtP4UF6dnnXYA2Ivd/y7/pftQPQt
         /Y3JUWCLJ21fPseSPRXUWSm4oavF5+6BXbuFBBgaSaDl7nqfwcE5svwKOcoCEv4vY5Kw
         6SzJEwZtjjHSLbp5ZYyY1nY+l10oI0mj3yvVBhxktiSsXu6w4wlI6psLW0IWBqkia2Lq
         aZiB5/GyhYmHERXtmaWkbzO+pswXIkGgYbXtMuVUCSzCZ/LGkfIJAMKSjJnUyRjC3kwv
         TI22iksGI/bizczY+OFsUIZoBGbtphJ2KN6R7L+RRHurvUk21OyYQaTy94dOobEHok8e
         3tIA==
X-Forwarded-Encrypted: i=1; AJvYcCUofINUOCLHWruKPkj9BnFsIbDM62m/9/fgsT5yML21vkBQw4SvU0ZBPP+L8OJiNRjA9xnd00ArfX0ppGI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYJ1PLK2yL24DPLvE7zjaE8swjwhTN0t6jHQGiXY6j+htKtI37
	3cRmB7W1jR5ioSo5j6Jkq4+S4krcyS34eF6BnBUZ/s+Rk6b7fJRgVKwwuelWERo3nJOcYE9+agM
	59fhJwQZrrOdCfSKmsLoTWUrHY0gXe6qN61sz
X-Gm-Gg: ASbGncuhLEN8B40M+n3jedh+Z2OP1JdS/J7qhbwPlwp34HaezgAQsa1+ePxCSxkgFyn
	AD31WtlTbUQdtVvYRkfHIuPX3UbJCwuntvuOyRxVpF0TkfS057T9kNuiNdKrQdGnBOS4NCMwUCV
	BjVGeZS/EoUa98LfqpDt3ONrcMABJZOmDCGieoQKaPRj+0eus3
X-Google-Smtp-Source: AGHT+IH09efJ8Do6RKQnRVYr9V5LLKXMMFfz2m0gjC+zCWdS733LZPt7VwiJ8EFz/qGyl/AVQsVsgaoO2y2QWrRxPjs=
X-Received: by 2002:a05:6402:5110:b0:5e7:8827:2c33 with SMTP id
 4fb4d7f45d1cf-5f36fb8e0femr10232874a12.11.1744616548318; Mon, 14 Apr 2025
 00:42:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403183638.3386628-1-korneld@google.com> <38049b58-a504-4223-9f6d-537609931fb4@arm.com>
 <CACF_fqnevOo9NSRwDAh7KVQZTHTkP0pc2NKEXrWFapMYLf0Wkw@mail.gmail.com>
In-Reply-To: <CACF_fqnevOo9NSRwDAh7KVQZTHTkP0pc2NKEXrWFapMYLf0Wkw@mail.gmail.com>
From: =?UTF-8?Q?Kornel_Dul=C4=99ba?= <korneld@google.com>
Date: Mon, 14 Apr 2025 09:42:16 +0200
X-Gm-Features: ATxdqUG4qM2qSi7P61VxUS_DpHbalmw0jUa2CR-GhJDUE8W1x3Gplsn-A1ToMew
Message-ID: <CACF_fqmzULKuq0C3FQe5enmu4A2UQYUeC5rrznM54uiQDCrsHg@mail.gmail.com>
Subject: Re: [PATCH] arm64: Support ARM64_VA_BITS=52 when setting ARCH_MMAP_RND_BITS_MAX
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Steve Capper <steve.capper@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, ssradjacoumar@google.com, 
	chromeos-krk-upstreaming@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 6:46=E2=80=AFPM Kornel Dul=C4=99ba <korneld@google.c=
om> wrote:
>
> On Thu, Apr 3, 2025 at 11:46=E2=80=AFPM Anshuman Khandual
> <anshuman.khandual@arm.com> wrote:
> >
> >
> >
> > On 4/4/25 00:06, Kornel Dul=C4=99ba wrote:
> > > When the 52-bit virtual addressing was enabled the select like
> > > ARCH_MMAP_RND_BITS_MAX logic was never updated to account for it.
> > > Because of that the rnd max bits would be set to the default value of
> > > 18 when ARM64_VA_BITS=3D52.
> > > Fix this by setting ARCH_MMAP_RND_BITS_MAX to the same value that wou=
ld
> > > be used if 48-bit addressing was used. That's because the 52-bit
> > > addressing is used only if the caller provides a hint to mmap, with a
> > > fallback to 48-bit addressing.
> >
> > Why should ARCH_MMAP_RND_BITS_MAX value be same for both 48 bits and 52
> > bits VA in case the user does request for 52 bit VA via mmap() hint and
> > the HW supports it ?
>
> Two reasons really.
> 1. The whole behavior is controlled through a global knob -
> /proc/sys/vm/mmap_rnd_bits. ARCH_MMAP_RND_BITS_MAX is used as an upper
> bound for the value that can be set to that knob.
> So we have a single setting for all processes. Some might want 52 bit
> addressing, others will stick with 48.
> 2. Quoting the documentation for this knob:
>
> """
> mmap_rnd_bits
> This value can be used to select the number of bits to use to
> determine the random offset to the base address of vma regions
> resulting from mmap allocations on architectures which support tuning
> address space randomization. This value will be bounded by the
> architecture=E2=80=99s minimum and maximum supported values.
> """
>
> I suppose that it's legal for some calls to mmap from the same process
> to request a 52 bit VA, while other calls will want only 48 bits.
> Because of that the random offset can't be larger than what would work
> for the 48 bit case.

Hi,

Do you have any further comments?

Regards
Kornel
> >
> > >
> > > Fixes: b6d00d47e81a ("arm64: mm: Introduce 52-bit Kernel VAs")
> > > Signed-off-by: Kornel Dul=C4=99ba <korneld@google.com>
> > > ---
> > >  arch/arm64/Kconfig | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > > index 748c34dc953c..38e0bac567f5 100644
> > > --- a/arch/arm64/Kconfig
> > > +++ b/arch/arm64/Kconfig
> > > @@ -332,9 +332,9 @@ config ARCH_MMAP_RND_BITS_MAX
> > >       default 24 if ARM64_VA_BITS=3D39
> > >       default 27 if ARM64_VA_BITS=3D42
> > >       default 30 if ARM64_VA_BITS=3D47
> > > -     default 29 if ARM64_VA_BITS=3D48 && ARM64_64K_PAGES
> > > -     default 31 if ARM64_VA_BITS=3D48 && ARM64_16K_PAGES
> > > -     default 33 if ARM64_VA_BITS=3D48
> > > +     default 29 if (ARM64_VA_BITS=3D48 || ARM64_VA_BITS=3D52) && ARM=
64_64K_PAGES
> > > +     default 31 if (ARM64_VA_BITS=3D48 || ARM64_VA_BITS=3D52) && ARM=
64_16K_PAGES
> > > +     default 33 if (ARM64_VA_BITS=3D48 || ARM64_VA_BITS=3D52)
> > >       default 14 if ARM64_64K_PAGES
> > >       default 16 if ARM64_16K_PAGES
> > >       default 18
