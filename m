Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7521DED5F
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 10:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745749892; cv=none; b=SxPH0Df92GkTPYveThAvTIwNwUDimrt5sFOg42B8HgvPhFRXq67AtxoYIZbWab/OGVKQUcTl7QzRqGCbcJKNHniagj0FOBtyBxvzffiRcYHaPv2pKa6tJiTRlU6TtpJsvlB/vKJd+o33+kRnXj6uW3o9gXf5gpfK99QuYdITL7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745749892; c=relaxed/simple;
	bh=HxU+xahENi5kaqoZDhC8WrkN4Hp487uoXdYCP3vZANg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IAGpPSu8rI1DzbvIg+9bW3e5e5j53lUz12wCPDNg+B+8i6+oqYmH4s3YzFoacz0fkDh++EpaZ3i3wvrZqQkJDZyZR4qOo9FB7qzgKmN43A3ekLTKGnBBQhaZqwVW75+U6CKM4KXEEbMG2m8G4BiVvnPv4UKSnKaJsKjsnwBRFyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UhGe9x/4; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UhGe9x/4"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30db1bd3bebso39881681fa.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 03:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745749889; x=1746354689; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4v7x8hPCNraTFvM/ulE/o7KcPqrAVHHeBgfizXvUh88=;
        b=UhGe9x/4M/gvIF6JwzV73RdWb4uKiFbmroerpi40jsfM9ifSYypR0z2o3F14S1TNlY
         wL4YZlo8VFuZ/NP3SOUebDCCQPkiQodLzdaFnN4kj1dW6Zd1hb+n8PFdeqHVsA8GOOpR
         8af3QiFWaBn6Ha+6mltqiSHr73EGijMAo/5UThFj9EJquUjEBwTgUpf0G508pIlPFOwt
         FhoNOSxpyG7KWvXuYZ08/PshiGUm+kGVCfHCjj8FdyWq/23HF8AMQk2nYlv4IaEDfOiN
         bMD8Jh2OzCcF7NjPCyx5eOzF4dCBPr56ZNhaE0JV8WJ2O0TquFanv62bD/NqnS0482qM
         fAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745749889; x=1746354689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4v7x8hPCNraTFvM/ulE/o7KcPqrAVHHeBgfizXvUh88=;
        b=w6TCZ7tMVcRqwxg7WtY5a7OGfzGi1A76KPaHXr9W7QnCF3T7QilTT0+5i4tg12mL5A
         s57walQMTJx72gKbno63oJ+j1c2kaMbo5bV4IxCsXxJjy7G7p5whTh9jG1obiOM/Uv1I
         bUVoO8vS9pLrY9IQweWvGhafN0ffZvcMGyGLEcLGGSEZKkxJ60djZLpfIOVuExFmwqn0
         PwSRPX5kMpgQdNyzYywD6UBqOpJONyU/37BxgEbGWb8svV+0WQztq5V3p0RbpH1dDQex
         tX8+XcyAQ2Omcv8r1TN96jCGSBqOFKIxqrUvMSDcWkNG0RmaSZfj9P36Cyyk/Ep+iy0W
         A9Ow==
X-Gm-Message-State: AOJu0Yza33x5At0Qc0fxL7gPHYg3SlIUMeRzQtk5M8e3pLkBXrvKQV3u
	P0g2h6LX1uqZ22y1W/u25Oxy0GZNRPp4A+JzCdRyWVYrJX+18+aY67V4SssUhtQPYix//QztUc6
	lXQz9BEykLmU0jb886+vCKaaInjs=
X-Gm-Gg: ASbGncsRkr7kKxU+7TaXcSFguCgsMBCHOPuTfIaD2ea9cYFApVLnvemHf+v/q0IXETF
	OwgDJDlkwJgCFEqnzWytuH+G6tueF1ldfneDQPRmKqOYwK6okhkmRItEb2HZYjUhxQk6BCOVlSD
	YK5Uqbh9P0prFVgz/h9KEAHg==
X-Google-Smtp-Source: AGHT+IFnHcoMPJW3ylITn1hddWC5qqQpnVVGnu9bqGaPQcWC5Eu21LOrjaFWdDAoKlXjeP7qAfCJJvRa8IBlysmLlrE=
X-Received: by 2002:a2e:a913:0:b0:30d:b3f3:bcc6 with SMTP id
 38308e7fff4ca-319dc41cda0mr16446361fa.21.1745749888592; Sun, 27 Apr 2025
 03:31:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425084216.3913608-1-mingo@kernel.org> <20250425084216.3913608-16-mingo@kernel.org>
 <5c175b6a-e9c8-2546-a4fe-98572c3f4935@gmail.com> <aA3qGMf759kePUFI@gmail.com>
In-Reply-To: <aA3qGMf759kePUFI@gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sun, 27 Apr 2025 12:31:24 +0200
X-Gm-Features: ATxdqUERVN_IQJOOHeyCGUqglTaNwXwNr2Nkwb0cuQi0gpdfWUuhu93lzbdEAh0
Message-ID: <CAFULd4Za6kV0BuaDwi5j4Sz3LSX0VGef2Jfx9=Y0LYR-LKKaRQ@mail.gmail.com>
Subject: Re: [PATCH 15/15] x86/atomics: Remove !CONFIG_X86_CX8 methods
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, "Ahmed S . Darwish" <darwi@linutronix.de>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Arnd Bergmann <arnd@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	John Ogness <john.ogness@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 27, 2025 at 10:26=E2=80=AFAM Ingo Molnar <mingo@kernel.org> wro=
te:
>
>
> * Uros Bizjak <ubizjak@gmail.com> wrote:
>
> >
> >
> > On 25. 04. 25 10:42, Ingo Molnar wrote:
> >
> > > -#endif
> > > +#define arch_cmpxchg64                     __cmpxchg64
> > > +#define arch_cmpxchg64_local               __cmpxchg64_local
> > > +#define arch_try_cmpxchg64         __try_cmpxchg64
> > > +#define arch_try_cmpxchg64_local   __try_cmpxchg64_local
> > >   #define system_has_cmpxchg64()            boot_cpu_has(X86_FEATURE_=
CX8)
> >
> > #define system_has_cmpxchg64()                1
>
> Thanks, I've updated the patch with the change below.

I think you also want to change:

> diff --git a/lib/atomic64_test.c b/lib/atomic64_test.c
> index d726068358c7de..352e811c99ce9e 100644
> --- a/lib/atomic64_test.c
> +++ b/lib/atomic64_test.c
> @@ -254,10 +254,8 @@ static __init int test_atomics_init(void)
> pr_info("passed for %s platform %s CX8 and %s SSE\n",
> #ifdef CONFIG_X86_64
> "x86-64",
> -#elif defined(CONFIG_X86_CX8)
> - "i586+",
> #else
> - "i386+",
> + "i586+",
> #endif
> boot_cpu_has(X86_FEATURE_CX8) ? "with" : "without",

X86_FEATURE_CX8 is now always defined, so the "without" part is now a
dead code. Perhaps the info message should be updated to always say
"... platform with CX8 and ..." or even to remove this part.

Thanks,
Uros.
