Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C1113DDAE
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 23:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751152167; cv=none; b=hshQfFJDckhnei/djgXeztEmLsWVKT7wGLwDheYQM1qQzgxnZO8ObTxAPmEHPdSn0tICXoK9MsnVCm/qjpbH5tkb0o70Xp9sweuhdklumeuS5EsHUh7jhaHkBuNCVuP2VzYeGS/LHOvftTzTKfTrll9C9DDm9r1LSqIC7bjPmKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751152167; c=relaxed/simple;
	bh=MRVUCRgUFnRXsc4X+ViqiuHCZ39s/cTZH9WQss8R5oM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DC3MwS3kLGzVaLEf4omUkTG0C/P8Lan5H5qN2ulGzm1boFn8vdLQYCH1XF2qRDUtb3cSrnhFCErfRfyyTEJtcA8dzev+z2zfFOvWRgYRZJQzaU66ATK3qbtcTQxh9AD//zEhmjQD9ToM8Ufb2AGa8gxwpok+Qbw9/Q9Cjiauasg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=aB+VBA84; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="aB+VBA84"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso952799b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 16:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751152164; x=1751756964; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+RghmK7bwNQ0kQhbtW4wZXNGWIk0IsY2NIzalhOt1CU=;
        b=aB+VBA84RtbtKhyqUkWegdf7BAmKr13bI4PrAxXtcsP04iHe3QzGOtq4uzS9n//fiG
         yOQ8zYK3EUw5b1evRDMBl+D5wlGFOafop9Fq/Qs1VVMR26TeaqPG+ur7x0cpGJfECA/q
         lpyT7wTx1jiP9HufZySfmk+XzOIZBFZykzjUqTUaN8b0m/GMhrxs+WJvJ2r+I9ICV2vl
         IpAcgvX74ysMJcgXL6C4AGg/lCvtZytsBL6gMXY9iGNZuCa+6d+dg+w/Iufn9rCaM1dX
         gg//InLgNl6pMfNOpvAwUtvZp1TcmiQ4hvmqTsSSqqW0ogbf2p1DxQ2NlHI0kNTZ8znU
         6Yew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751152164; x=1751756964;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+RghmK7bwNQ0kQhbtW4wZXNGWIk0IsY2NIzalhOt1CU=;
        b=nXZ4+37cWzCKvoWq8AL1EhK7KVrwQ+DQMK3CETaEnw5tx3ZvHWinged6TTElnaFsd4
         T12aRZGcC8Yenbx50m8tntSCS4FVZX6h8bdWJAmYH52W+o5dOi22gyT7F16j+813D1jC
         UQ1CP5uEZMroDx7guxWAWVdhYZwPXYHrFxmUUQnv9H89nA6ckyFn9dGzyNajwRWNmeil
         H4FWhExoFyr7CrLI4TfdOHLsmRCSN0EffvSDwlaYyDJ5A1Ufs4EDKDaTl5noYpq7X9nw
         lMx/VBCY2YHfFrClhvfVL32xJDdMXUwiQu2Ivfj90GXnv3tlifheYwOsSZUM5CBZduPA
         5bwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0baRp1wfrpxXgi96B0A9vUacbDq4W1z/Uz612o1wtY84tFjwN76OaKyHwdnQBzcS4Nvakh/tFP+k0adM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAV1s3OKHYnXxZTMiw0UvXbjJrp0fJRsUGswGMYSzF6yvCdddE
	T95ANw3iAfMMyGk8tdwXxiBZ2uW7U91UnXnsvwXiQkhsw9srZ0w/0CO3Fx+Jz+Qy7Kc=
X-Gm-Gg: ASbGnctYMqAHwCplzDz8SuOFqcfdAWbl6gaqyLdG7J8lIy5kvSLBfzJAxQMyTLz1JEP
	vkwOwuITxltRTHJS3FB03C4MCrFXfNhSqQtmDtJZSeL89a/KoiktG0T79IRTyTCX+xsn7sM/84u
	PsW4FHPyRVZJ2rbLnn7/rggDDGsJDXk2EfMEP6kn07kiKew9l4dhvayrGU4viBCViyIpBXIWk/F
	oBpJxSYNezD7I0Lll7jRtn6MNzRuaAQ2LO2xEA0JBacEqgRJT1nI6so9Q//WJPi5oMaI2WOXDiE
	ICE/at+FuJFAY+m+C7kpT/86tZsjKtJZelVwzbGkqTZxUpVnd9YexiisjyWd9VPeZJBB38TZhs9
	a8K6Z6BEnZANQgermL6yIWQ==
X-Google-Smtp-Source: AGHT+IEkgXTCk2sJOs74/1zzhIFRegzigXwVLQh/vGpG3wmqlsyEARN48cwxen3DleajyDV5uKnKgQ==
X-Received: by 2002:a05:6a21:6d87:b0:21d:fd1:9be with SMTP id adf61e73a8af0-220a12d79demr12927327637.12.1751152164483;
        Sat, 28 Jun 2025 16:09:24 -0700 (PDT)
Received: from dev-linux (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e31beab2sm4612049a12.47.2025.06.28.16.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 16:09:23 -0700 (PDT)
Date: Sat, 28 Jun 2025 16:09:10 -0700
From: Sukrut Bellary <sbellary@baylibre.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Angelo Compagnucci <angelo.compagnucci@gmail.com>,
	Nishanth Menon <nm@ti.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/5] iio: adc: ti-adc128s052: Add lower resolution
 devices support
Message-ID: <aGB2Fnv797Wrenza@dev-linux>
References: <20250614091504.575685-1-sbellary@baylibre.com>
 <20250614091504.575685-5-sbellary@baylibre.com>
 <CAHp75Vf=zQ+pdo5V1fAq2qWEpdUfNfWdO+_iW0wETWSniXisyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vf=zQ+pdo5V1fAq2qWEpdUfNfWdO+_iW0wETWSniXisyA@mail.gmail.com>

On Sat, Jun 14, 2025 at 09:45:43PM +0300, Andy Shevchenko wrote:
> On Sat, Jun 14, 2025 at 12:15 PM Sukrut Bellary <sbellary@baylibre.com> wrote:
> >
> > The adcxx communicates with a host processor via an SPI/Microwire Bus
> > interface. The device family responds with 12-bit data, of which the LSB bits
> > are transmitted by the lower resolution devices as 0.
> > The unavailable bits are 0 in LSB.
> > Shift is calculated per resolution and used in scaling and raw data read.
> >
> > Lets reuse the driver to support the family of devices with name
> > ADC<bb><c>S<sss>, where
> 
> I believe it's incorrect, i.e. it's something like ...S<ss><?>, where
> <?> is something you need to clarify, and <ss> is definitely a speed
> in kSPS.
>
Thank you for the review.
I am not sure about the last s in <sss>.
It could be TI's silicon spins versioning.
I couldn't find any information about it in any of the datasheets.
I can drop the last s or mark it as <ssx> and specify the first two <ss> as
maximum speed.

> > * bb is the resolution in number of bits (8, 10, 12)
> > * c is the number of channels (1, 2, 4, 8)
> > * sss is the maximum conversion speed (021 for 200 kSPS, 051 for 500 kSPS
> > and 101 for 1 MSPS)
> >
> > Complete datasheets are available at TI's website here:
> > https://www.ti.com/lit/ds/symlink/adc<bb><c>s<sss>.pdf
> >
> > Tested only with ti-adc102s051 on BegalePlay SBC.
> > https://www.beagleboard.org/boards/beagleplay
> 
> ...
> 
> >   * https://www.ti.com/lit/ds/symlink/adc128s052.pdf
> >   * https://www.ti.com/lit/ds/symlink/adc122s021.pdf
> >   * https://www.ti.com/lit/ds/symlink/adc124s021.pdf
> 
> Forgot to sort out in the previous patch?
>
I will fix this in respin.

> -- 
> With Best Regards,
> Andy Shevchenko
