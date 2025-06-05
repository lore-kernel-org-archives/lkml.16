Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757D927603F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 17:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749143310; cv=none; b=PZVYFo9XoeZAxDLXeUmeHetiGzAJE2yLmtE1w3Ripy+dqFNAWnSX/sYDsvE/fLDwQuqBjLkMA1xa+9VqmV9HLyxe8GLBOEXV0VUzhDGYMS2fPJo/l7TxXIp4qmenTcNvb9WPf9ke5i2xcN4cp2DvVBzbm0USwZEO0uCHCLH9rbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749143310; c=relaxed/simple;
	bh=Xor07VUsbOeFgDBNzxyUQcS3y1z857Vg/NhaiO09Vjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rikB/Z1Iq7XJcWFsi4KBqRWS6wawZdei4zCoBVE/FINpORaoJi0da9PB+lONGhDY3RaSqZcWAjCNg5yjRezItZYsEX6jFCqke6opoZZCnBDBavAlbzRXkXRVt9OBbPImMZEC2C8EcDmYQuPNadMwtcjqTkUsOXhvBLwQFGX40Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=rbEli0xE; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="rbEli0xE"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6020ff8d51dso2239702a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 10:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749143307; x=1749748107; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBFaMyvc7Z4G2BwTWyjfiiTjbOmRhGeDBAsf/dJ0JBA=;
        b=rbEli0xEIWhc+ZpMaMWUQ3UAx0qdLDux7ZR2rXzF5Vygr1KL28gi5aKC68/Jef7uXd
         llytjwtPq1rqZlgfU+mBiFO7rnA1Oetk+Jmc3z25xo2ssSLnRmCSMkr1R+mwCYj2y6Rs
         RVsUjA5agZyEL20glRRO1Pq1yCsP2i4FPpUbdDX6YSB2++oxMCojcFHTyLkKJR+vXgnC
         JaZgsub0WJdQzQuInSRiUrNPELxQyoB7wbUmu0C49+PrROVYPiI9Y+CCLvrzdLHZvG9E
         OpBk7qxToDpUIKweWdzDTr0mz03JBd3MLc6cMvSF6DrCCLzaCu60ozId0OYPXCG3M6z5
         TCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749143307; x=1749748107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eBFaMyvc7Z4G2BwTWyjfiiTjbOmRhGeDBAsf/dJ0JBA=;
        b=GyQwkhIk/L48YtMiofbJSCt0PPwPf9Vl0ExdCY/O9Rrte0Hi3EPKDZXaL7yQSzZiSB
         IWwSaKQTvezXYJ7yaKKspZEUw3Eowk76pvFW9BfM3j8ej8hP+E9Q0ZTUNcdVAwBb2vg9
         Fo4dSg00iutNOwfXmocF1aCskPzZdoyn52hBp0tNEfw/e5Id0U7WzE3Gso3q1ziuACN2
         J+Mey8WpjzMr6Ke1G58keYsNXYVOfX6UoMgsdR40HEEPMZz0DedHjBuVCRCpNXRTBNtF
         BvVq0x0i1ekM7L9m50CHdbD7ryaq6SkgRP5DXMdMbLaFfF1tRoMkdGdhMQPTK41twBhn
         YQCg==
X-Forwarded-Encrypted: i=1; AJvYcCXninsvOgHr4bNiGQK5NAAoFcmS87Nz0hXmyudPGYmS5Dro8RJjV8wUp+bFUABAr12jgrucs6TuE5Db4b0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIjGDEM6Usfudibzs1S/TBwzBbd754sNzfrrIE42KnIHjB6aM9
	ByV9b5YIULpc5K4k1J/EN8ohWLBuamDSrKA/keHaRvrGpcjFh53zZZr4v07sP7GhY+0epuvnOE/
	tMrlSKGTZaf3htL+i6XYABEgEIsG1b/vqSOygZqoWzw==
X-Gm-Gg: ASbGncuX967X1k/jhHHEv35nuxLWqmxwz00elo1ys6VT9HQEos958xR198CXfL+Isqk
	92/XBiTy4jLuLjsy/GZi5qfyymFKEf+Jg+CqcIc1IF5b9UY7Ft90tgBvdC1S0R96aF1vtOrofXe
	qeXChdiktv2FneEP/wL7IeUZ29dzrJgsQoxssXxsR5inhTNUaMqTOKC/t9tQDCko72aA==
X-Google-Smtp-Source: AGHT+IGTCHq+t5jdVb8jQHUiPfAMFaQRkOyee0NnDl9vyCqzG6RguIOtsl/bnX1AkhqzfGKID5KrFbQAwgDjTLTpk0k=
X-Received: by 2002:a17:906:7309:b0:add:f182:2f with SMTP id
 a640c23a62f3a-addf8ff42c6mr763518166b.51.1749143306591; Thu, 05 Jun 2025
 10:08:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605163513.7cfb7f2b@canb.auug.org.au> <mhng-3E0595D4-92E8-4E7C-B02A-C33F7289E4A6@palmerdabbelt-mac>
In-Reply-To: <mhng-3E0595D4-92E8-4E7C-B02A-C33F7289E4A6@palmerdabbelt-mac>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 5 Jun 2025 19:08:15 +0200
X-Gm-Features: AX0GCFvCQWwB2B0ViDQFNYu-OFCgo9Wv2Jrd8RVGLpLAUQmyY22KHw5EsyNqXeI
Message-ID: <CAHVXubicfhkX15S=fSo2yQcSCUmA57cJATk6=ayy5OCWvRx0MA@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the risc-v tree
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Paul Walmsley <paul@pwsan.com>, cyrilbur@tenstorrent.com, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 6:23=E2=80=AFPM Palmer Dabbelt <palmer@dabbelt.com> =
wrote:
>
> On Wed, 04 Jun 2025 23:35:13 PDT (-0700), Stephen Rothwell wrote:
> > Hi all,
> >
> > In commit
> >
> >   4e27ce58e7fa ("riscv: uaccess: Only restore the CSR_STATUS SUM bit")
> >
> > Fixes tag
> >
> >   Fixes: 788aa64c0c01 ("riscv: save the SR_SUM status over switches")
> >
> > has these problem(s):
> >
> >   - Target SHA1 does not exist
> >
> > Maybe you meant
> >
> > Fixes: b0feecf5b812 ("riscv: save the SR_SUM status over switches")
> > Fixes: 788aa64c01f1 ("riscv: save the SR_SUM status over switches")
> > or
> > Fixes: 8f9b274ad153 ("riscv: save the SR_SUM status over switches")
> >
> > (yes, they are all the same patch ... and all ancestors of 4e27ce58e7fa=
)
>
> Ya, thanks.  Something's gone way off the rails here, let me try to
> figure it out...

I expected to send this fix (along with other fixes) next week, after
the -rc1 was released, with the proper fixes tag, so maybe Palmer you
can just drop it?

>
> > --
> > Cheers,
> > Stephen Rothwell
