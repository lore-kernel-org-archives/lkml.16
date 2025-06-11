Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7E535970
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749652843; cv=none; b=MFLUgRo5PktQcPVw9886xA8HLsR4mYIbvsXWMIfkey0fFIYVAYSz4Vf6TN0kMMCNZHpob9d+fp8yLyoYbqx8pmZeZEzIKy+l8VEYNIFWkAG0KQbgaIU+cC2KR7HOH9rvmzfZ7V6wRiCCOrvAWQOrAGWnRw5QIA+1gGN+wPJlDk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749652843; c=relaxed/simple;
	bh=Ves9IAlDOG6rT2wK3GTXUgHQbJsl7xwyic6gvh9n1D8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KlfmF1SU2dnBcibc77OxuceeYMDbXtLlkAPWj0k3K90M7iPF/2BpUbeKe3bv0boO4lk10VWmdTehvXVgmWSDxYHUMfAVvod/yD9DV1mzHzJ+Bzej/RmGoP4sa+Ef5m0jPDKFK3V87sQ9XYSyobwZGfzdmPICCTH//nqSsb85r0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ymlLGxnM; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ymlLGxnM"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad883afdf0cso1229427966b.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 07:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749652839; x=1750257639; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VanCGAV853jeZl/piu55b8cOeQ1lh3SiVReRL2SvGyU=;
        b=ymlLGxnMsVfiy/aok9AEqGYJFidNS+mNhQrefas1XlXonhcN7fIoSVeXXSYu4Ggi/6
         u1bedUuR9OXXmTBMrxtLE5IAqMZlo7ZsLjcm5ewCbfGGthkDcATGwEFuKRAlccvrEMFo
         yM1iKcqmFlwZLovjnbb1k2pIELqp9nwM1H3jyTuGwcbX2ZvCJoIbZ23yPMhn6VXIY8ja
         y+XI5/WAd5QSserPAWxtNaylQ/VZwNUljHQbAtXo8kpVfQOM9iNQeDKdvHlWQIYvtjRR
         EtZTGiPExK5QgjbQrIxpSyFmMLRn5bsoUvoA8YtJ2jlcFqCQoDRyJmaAW57HCnZLJUy4
         TSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749652839; x=1750257639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VanCGAV853jeZl/piu55b8cOeQ1lh3SiVReRL2SvGyU=;
        b=OglzieFtjZARwGOI69ZFw60oAi8mlToKG1a2nxw2HPy3awBu6DB5SGXZBaq8tHwpPZ
         slvghZWIvaVmiMlkS3T4erjgBqW2IAvmxMurLuyx93KmGv6jPjMmPo0heEvQfN4xAX14
         /Uhk13bYLp7IYUYV0UH8x9/dvoVEPS2qhVxlbFaD34NedDKpVpMP+2hUImFp17NCiUjr
         Ujjf5NntLOy1C/QbfYKw2JXMUr7aGwxBgZ9S9r/FqcS7psfNPCgwqdukVP5wyvoQjDXV
         IiszwdaItLUW1Lm/nP6U0aZpPEgpd6pf0b5nlqaNdIzOywoZFv/2ARmeJzoZ/mFqB8h1
         78lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXnCVd6ADLoYGiJjp7nYsFhcOlLs2SnSrF8Bqfelcv6Vb8EuTkxP9u3GA+IkFvPsEGO5K0qCeHEZJMtyg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+YFgdjGAflJoFXtzIcFQ5zc60cqpRPPNm+bemxVrhoEvFHEce
	b4T6h4dGvDx7Q+7hpnWRre48zIkY84rYk3xHyRqEU7v7brwgAzYx49glj5bTSL0Ph3h+tzNF0LI
	P0KHux3K+bFc8zjpa77C0jgrFQwtv4f8WqdHCaKBjsQ==
X-Gm-Gg: ASbGncv3bbC2m0ELi0eDqz6CDqW8t+dNP3y+1ECSgkwa/MpxOPs0vWcy4jElUZtAexf
	b81ItIsCuQDIbwjpWxi6vvDHhSR8O5fn2so6Yq1No7Z+LjxE7kZ/vA0400lHk7aH7gX+9DqZr3U
	j/AC0AiOvPpjuD4AlJkuwyewprurUBNa3uDOhnn6+xu5n7
X-Google-Smtp-Source: AGHT+IHDSmTZDyiDRZOD1n1VEoO2BN/q5+1t3d32dZUsxmTdSpg0xwKQkFHQYBpUpsmp4CIhNRKBUUObLCw4k1Y89D8=
X-Received: by 2002:a17:907:968a:b0:adb:1804:db93 with SMTP id
 a640c23a62f3a-ade8c8eff15mr309077666b.49.1749652839519; Wed, 11 Jun 2025
 07:40:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611125723.181711-1-guodong@riscstar.com> <20250611125723.181711-8-guodong@riscstar.com>
 <20250611135116-GYB125008@gentoo>
In-Reply-To: <20250611135116-GYB125008@gentoo>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 11 Jun 2025 22:40:28 +0800
X-Gm-Features: AX0GCFtLP8n8AGHV29EjK0zTceQ99c8B_7Z1bY9fkoSHAd2Q1BdFWQkZ6Pv-a54
Message-ID: <CAH1PCMbP54PRq27p7Ss+cdvB86M8k3CQepzxJwfpwfJPPnrMag@mail.gmail.com>
Subject: Re: [PATCH 7/8] dma: Kconfig: MMP_PDMA: Add support for ARCH_SPACEMIT
To: Yixun Lan <dlan@gentoo.org>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, 
	emil.renner.berthing@canonical.com, inochiama@gmail.com, 
	geert+renesas@glider.be, tglx@linutronix.de, hal.feng@starfivetech.com, 
	joel@jms.id.au, duje.mihanovic@skole.hr, elder@riscstar.com, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 9:51=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Guodong,
>   I'd suggest moving this patch after 4/8, as both of them should go
> via DMA susbystem tree, or simply squash them?
>

Thanks for your advice. Agree. It makes sense.
I will arrange them.

-Guodong

> On 20:57 Wed 11 Jun     , Guodong Xu wrote:
> > Extend the MMP_PDMA driver to support the SpacemiT architecture
> > by adding ARCH_SPACEMIT as a dependency in Kconfig.
> >
> > This allows the driver to be built for SpacemiT-based platforms
> > alongside existing ARCH_MMP and ARCH_PXA architectures.
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> >  drivers/dma/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> > index db87dd2a07f7..fff70f66c773 100644
> > --- a/drivers/dma/Kconfig
> > +++ b/drivers/dma/Kconfig
> > @@ -451,7 +451,7 @@ config MILBEAUT_XDMAC
> >
> >  config MMP_PDMA
> >       tristate "MMP PDMA support"
> > -     depends on ARCH_MMP || ARCH_PXA || COMPILE_TEST
> > +     depends on ARCH_MMP || ARCH_PXA || ARCH_SPACEMIT || COMPILE_TEST
> >       select DMA_ENGINE
> >       help
> >         Support the MMP PDMA engine for PXA and MMP platform.
> > --
> > 2.43.0
> >
> >
>
> --
> Yixun Lan (dlan)
