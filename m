Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBEA9461
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 15:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743347732; cv=none; b=s0xM8aFvvMnEHC7H6sW6GU7JApooZJcQG2Kblc5i1q3s1ZBnuElSBvKsk1qfaPFaM7xOvUojm9QCVC154S7r7PBdv1SWvaQUzt5X+ut6DTfEE4IUbzXhC2YApG8sz3o/rX12upFk+PwkS0SmZ38NIZwu22jMDJfDr4VFn38nMGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743347732; c=relaxed/simple;
	bh=nSQe5DiuJc0ezL/sZCLaSFWYPIUnawdRp/DU2qXnNV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZCG7R5S9bGGrlNCA1Qe28i7sEElFNz39ZnJ3i6qkip0g4MQNfvJqodhtO4Bgn/qUb6VvV95IhDJHFvxCmkHexILDQLUc4vJbEXNGhh4tlYM4RiCf96Q1NNM/tMK5XIpupQyyoHN0c2gaBgjMDh+8Up/IZgzkNWE/HKISXiO3x7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dEZ950XF; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dEZ950XF"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-307c13298eeso42179241fa.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 08:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743347728; x=1743952528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBGt0vfsXHVqKT4w76oPzKF16hPOvvtDAHKYBgXP2f8=;
        b=dEZ950XF2nM6ekbM8+BNJ4ylCv8dnoj6yre7ATmr43D8Giw1OnlchGITrjQPSLsrAO
         dZe8UYd14eOGtTvDJ9nc3C0rRK3G1rg8R4qIaGYxhEAyux9TGxc0CKrS0IOCW4SuNd1K
         QZ/rkv1Z5uuCZBTImQHqhnL/71YDj6i1a36eQiUWw1PPymekyndnSXuxBsMVOGQF24aT
         KY7a8yK25dh09vLaturJ/Ikdp2zV1A80TC2yUO1KkvViCUfOYBPo3J18fUJJyu12Gj9p
         mnouGgw/srwKOnfdGqGE1Ygn6TRYOpMhf38mFvEjdniBZtNPJ7JqhuIVDC0Dfo7vRQHQ
         bCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743347728; x=1743952528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EBGt0vfsXHVqKT4w76oPzKF16hPOvvtDAHKYBgXP2f8=;
        b=APkB6xyW3FBvqO6oMfxhqlWwn5kHI41ohzCV3U+f5AsxyR4br76ez6x6w4MJNHaBA4
         lMeAPDK9RZsW/fAqIxqdIfA3ZbC5fwHTOj0sbNskG1C6ne3eHBhDH444lByTFKuxW1Gq
         BfmzFfhfAJDmWXo69M3Ce5OCqCAuUpWgMUjB/F/nej1OuD1iPZInpNt5cw1MuiGCujDv
         sYWkIelba+7hIZlfbPLnNQsSNCPzTMgzHfIiOpCzGcSyS3VBOsLXBubRtiJXZ9oH8YTQ
         QKwRIq1Hr8xNuMRjbdpkDOZIb0sw17ISvRWwvdN8tLpRbUN0OkIiErNeJ8K56s2yRMqg
         tC5w==
X-Forwarded-Encrypted: i=1; AJvYcCXNkKm6MqVo3Ckep11Ri9ZAsILPaXH/eK6fVZfHi1WS1qgvpFUTlvstimOiBGzrB3zHtwBsNxoeQgRbz7U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOd/b+K/GC+pHcZTxdHzxz0/JZ/3P/BDrU/dI578JbV5HFXbUz
	KOLgAGeHRWktTIX+xQpyZx8kRSMyJZDfp9paHgHxaYXGhzhdwIwmu1iNX8F4GHfWOGtJ8pLt3q0
	/MwNi8NMu10E7R46XI3YSmfTkEcBYNOyS
X-Gm-Gg: ASbGncsGGCThWl4jSOXvDglgRqK/mLRhwkXQRUg0QN0OStoRzTOEVGizoo7f/FRvcLg
	F8o9gXs72cM3rIVSIokm+Eey/FM6Ni1PDJIP9nllaEQjZgxahsE4coV05TwvNCBCIh0DkfIQwjr
	WSzRY5np1DGLBK9WSaLl9cCqZRbehVMjnMXPBj
X-Google-Smtp-Source: AGHT+IHQ6lXMgsEEY7detjs4hgfXjnd9zlTjkiq8ZcsaIS4qeU3wbZWTG1lQvkNndDRguWxjA44Siuruwz0unAL5pSU=
X-Received: by 2002:a2e:a58a:0:b0:30c:465c:51de with SMTP id
 38308e7fff4ca-30ddf7fdba2mr14042731fa.10.1743347728120; Sun, 30 Mar 2025
 08:15:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325164854.199420-1-ubizjak@gmail.com> <20250325164854.199420-2-ubizjak@gmail.com>
 <20250325171141.GDZ-LjzaPbAG1MwjZi@fat_crate.local>
In-Reply-To: <20250325171141.GDZ-LjzaPbAG1MwjZi@fat_crate.local>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sun, 30 Mar 2025 17:15:16 +0200
X-Gm-Features: AQ5f1Jo7usrD5Mk0YJzj-ljKa6KA_fx5hNd1_vH7fHLwfEEIMFK944nXf5NwmA4
Message-ID: <CAFULd4ZT5mjjEXW3SnGQVMo18fO8CapFS-ikLQvYFw5EKtEfmA@mail.gmail.com>
Subject: Re: [PATCH -tip 2/2] x86/hweight: Use POPCNT when available with
 X86_NATIVE_CPU option
To: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 6:11=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Tue, Mar 25, 2025 at 05:48:38PM +0100, Uros Bizjak wrote:
> > +#ifdef __POPCNT__
> > +     asm_inline (ASM_FORCE_CLR "popcntl %[val], %[cnt]"
> > +                 : [cnt] "=3D&r" (res)
> > +                 : [val] ASM_INPUT_RM (w));
> > +#else
> >       asm_inline (ALTERNATIVE(ANNOTATE_IGNORE_ALTERNATIVE
> >                               "call __sw_hweight32",
> >                               ASM_CLR "popcntl %[val], %[cnt]",
> >                               X86_FEATURE_POPCNT)
> >                        : [cnt] "=3Da" (res), ASM_CALL_CONSTRAINT
> >                        : [val] REG_IN (w));
> > -
> > +#endif
>
> A whopping 599 bytes which makes the asm more ugly.
>
> Not worth the effort IMO.

You missed this part:

--q--
... where there is no need for an entry in the .altinstr_replacement
section, shrinking all text sections by 9476 bytes:

            text           data     bss      dec            hex filename
        27267068        4643047  814852 32724967        1f357e7 vmlinux-old=
.o
        27257592        4643047  814852 32715491        1f332e3 vmlinux-new=
.o
--/q--

Thanks,
Uros.
