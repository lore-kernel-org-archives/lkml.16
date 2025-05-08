Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8A627470
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 17:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746726530; cv=none; b=knnujjfnWdKE1ViHxS/Xl16r6o8I4dkSz43IndyWVokEZC4KBhSn2N5YgeG7az6nWYH7WFVwo65G671LPQca8QbL2+D2mXpVN2rfYY/p355cLYv/kGuVzEmtTzHkamv/tgKZhx3lvwzqRw2dCJM7NnuyvkHONGAt8EuFp+B/6yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746726530; c=relaxed/simple;
	bh=Mn0ibbYww6nu7ChoXnb/V8up93JjOP9PQag24UPnr/s=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=LfLL5lv2jkLR0n2bO4XNHA2rprAkOdQe7ZTtGrMtwm+zn8jei8UoX0JI39haRMiHxZKdcqh49AstPQV6dMjkAAzgabD1YA93DbYbPJ5oplfT38zltoW9uAmodUNONb5uSLEiEC5cplhTvg/jYUw1QXK1EsbSh1LiSkgrpAEosxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=NQZjXSyd; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="NQZjXSyd"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22e6a088e16so10377095ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 10:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1746726527; x=1747331327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DYqLmfWWYnfjqyKiU4qtxry5bO8L2HemS6Lj3IB5Ozo=;
        b=NQZjXSydwdMJMfOkGNMzs6nMKqE18ZiUXo6xOMyEoXLYC1G6ieZHRLWqRgVq/HyJRo
         D4Tfikc2mryfpwlO1y3vb+M213/yWQe6626KwUxtinGVSWFtJfToTuchQpqnqYMM5yRL
         WKRVx4N+M3soPOyOlvBVd9Ph3ovLHqbCQVrSP92UbN0yyrvmWjz3PcukGArHY90iCYD3
         mZGIcDTCboyOJ/bzWUE+fX6a54/c1gurwUc5rvw/RzytMYLgazV1+FX2hBa+kBiqii+3
         dL8UgfiWg7IbyAKRX/ANTBY6OKafsCLyCoa91ceZxMgqHKv3jcXM7D716X1bwkRfQ6Rz
         bB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746726527; x=1747331327;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYqLmfWWYnfjqyKiU4qtxry5bO8L2HemS6Lj3IB5Ozo=;
        b=HqArnp+EDaVzqai3mKusOUgssEZNCquAkyqIdXIFd8ENWgwAZssxBb4yOcq5aX39oT
         cT0bwGOfRnrW9lojTv/26GB3EzE/D6RJMCLd+fs+Z4L70/ek2fOk3Tct8lEv8uzngnGZ
         bDE3NYCAdHZ2qabR70w1FOZFmwoNoXXJb+2tVx8SH/s1wpMrF9v6zqzOd3GcsEcigd7O
         q6zuaLrqKtE70YuNgUGpGhTC4H8wp5d+HmwXJk157qTeXC0LrRF2VWgi6ldR6FfrfVgU
         /BssYC73sJixLOIxDx1Zw3Kvk4ailTihvCAayfYAfYnfRYwLY8wFVb0cjgNw96ASe4HD
         ZzzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAQZqY0fAPoZlnfo2fC2OjFgxGzG4MhANC3HvBf51syRyNWOMDXW11nkjnnXP88sI+QCe07BPVuYgwRTo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNtKlnx9skbXvxz5J7S6mAYZpnvYQl5pJGc6hObffcSY0VOb++
	BjOyuAykmJhl8mo0yuL1Ci2bBPIaV91//EHSBnnnel/jCIrG3OAY3W73NiBJj3I=
X-Gm-Gg: ASbGncvuNVW+zUlcQACmcmBY1mJgAXSr1VptJY8LfZcAQVw168hA8KQDmUxcfb7gJuZ
	4uEovUUbDpyKc3DmBtamS/7TppRK3nA3D/JvXZxuvijOfsQwpU8CsY7qV5qxxCsfWqvEl0lHKz6
	sC1JghKmi8uZQENRviJ8KWQkAqu0QvCJEqp5eCUGoQSoVfNJhWMbDEnuk3u0PORQQAcafe7CuKa
	d0+BnmMBGQ+wGz5TtDr9+YsyFuBJTScmjn4RlNO2+xttd+nsbOis50Xxedy+U41xVE6EpvGFEUj
	n2luV0mPQRLm6qg2EWMqLVTk/N4DVNk5AmyjoYKCg8eC
X-Google-Smtp-Source: AGHT+IH82nPRzsrk8rYddBvn02C0V4vxqNATQ/FAfbV0gyTYbn992YmIneFZFLQQNKd12/Qa8kEAyA==
X-Received: by 2002:a17:903:8cc:b0:223:517a:d4ed with SMTP id d9443c01a7336-22fc938ca63mr1882425ad.15.1746726527509;
        Thu, 08 May 2025 10:48:47 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7547838sm2322225ad.18.2025.05.08.10.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 10:48:46 -0700 (PDT)
Date: Thu, 08 May 2025 10:48:46 -0700 (PDT)
X-Google-Original-Date: Thu, 08 May 2025 10:48:45 PDT (-0700)
Subject:     Re: [PATCH] riscv: add Andes SoC family Kconfig support
In-Reply-To: <Z8rMKZoDYmpNosSj@atctrx.andestech.com>
CC: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, alex@ghiti.fr,
  tim609@andestech.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ben717@andestech.com
Message-ID: <mhng-d0a8012c-c5c9-4309-ac08-bcb1dab85b26@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Fri, 07 Mar 2025 02:36:25 PST (-0800), ben717@andestech.com wrote:
> On Thu, Mar 06, 2025 at 04:40:49PM +0000, Conor Dooley wrote:
>> [EXTERNAL MAIL]
>
>> Date: Thu, 6 Mar 2025 16:40:49 +0000
>> From: Conor Dooley <conor@kernel.org>
>> To: Ben Zong-You Xie <ben717@andestech.com>
>> Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
>>  paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
>>  alex@ghiti.fr
>> Subject: Re: [PATCH] riscv: add Andes SoC family Kconfig support
>>
>> On Wed, Mar 05, 2025 at 11:05:26AM +0800, Ben Zong-You Xie wrote:
>> > The first SoC in the Andes series is QiLai. It includes a high-performance
>> > quad-core RISC-V AX45MP cluster and one NX27V vector processor.
>>
>> I'd expect a config option like this to come with the user, which in
>> this case is the dts etc for a board using the QiLai SoC or drivers for
>> the SoC. Without dts or drivers, there's no reason to ever enable this,
>> so where are those patches?
>>
>> Cheers,
>> Conor.
>>
>
> Hi Conor,
>
> We are still preparing those patches for upstream, and we will add them
> in the next patch series.

This is still "Needs Ack" in patchwork, so

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Though like Conor says, we need the rest of the code to do anything 
here, so that's really just a way to get it out of my queue ;)

>
> Thanks,
> Ben
>
>> >
>> > For further information, refer to [1].
>> >
>> > [1] https://www.andestech.com/en/products-solutions/andeshape-platforms/qilai-chip/
>> >
>> > Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
>> > ---
>> >  arch/riscv/Kconfig.errata | 2 +-
>> >  arch/riscv/Kconfig.socs   | 9 +++++++++
>> >  2 files changed, 10 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
>> > index e318119d570d..be76883704a6 100644
>> > --- a/arch/riscv/Kconfig.errata
>> > +++ b/arch/riscv/Kconfig.errata
>> > @@ -12,7 +12,7 @@ config ERRATA_ANDES
>> >
>> >  config ERRATA_ANDES_CMO
>> >  	bool "Apply Andes cache management errata"
>> > -	depends on ERRATA_ANDES && ARCH_R9A07G043
>> > +	depends on ERRATA_ANDES && (ARCH_R9A07G043 || ARCH_ANDES)
>> >  	select RISCV_DMA_NONCOHERENT
>> >  	default y
>> >  	help
>> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
>> > index 1916cf7ba450..b89b6e0d1bc9 100644
>> > --- a/arch/riscv/Kconfig.socs
>> > +++ b/arch/riscv/Kconfig.socs
>> > @@ -1,5 +1,14 @@
>> >  menu "SoC selection"
>> >
>> > +config ARCH_ANDES
>> > +	bool "Andes SoCs"
>> > +	depends on MMU && !XIP_KERNEL
>> > +	select ERRATA_ANDES
>> > +	select ERRATA_ANDES_CMO
>> > +	select AX45MP_L2_CACHE
>> > +	help
>> > +	  This enables support for Andes SoC platform hardware.
>> > +
>> >  config ARCH_MICROCHIP_POLARFIRE
>> >  	def_bool ARCH_MICROCHIP
>> >
>> > --
>> > 2.34.1
>> >
>> >
>> > _______________________________________________
>> > linux-riscv mailing list
>> > linux-riscv@lists.infradead.org
>> > http://lists.infradead.org/mailman/listinfo/linux-riscv
