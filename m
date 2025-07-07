Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1905A28A70D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 08:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751878334; cv=none; b=nJN/PitB0MZhIgI3DFGv35Xhd5CJCY003wFQH/UksB9P1A+pce+fI0SjvTMT6dt3kimQij3yzk3nZZ0en97oc1VCJ74Q+X+SGv/j/Bs5eLU+Az/dKVG9B/M9YAsNE7G29V3xV0FyadsxPHjJSW1YQ8lMefUlcie8RQXeNRBpHVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751878334; c=relaxed/simple;
	bh=NDVPiT3y/IEBQaw7UV/tz0okFb5sjvyKj7Prqist9Bk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VWGsi60cmTzz9TmbXFkOOhfBJCkJ0uYVoaiIF6ynzxHFJ7x9yhExvBpSsZu9QBj9fCaKXIS1QMCGFmznbJ/2mGL0N8FY1ATBA0dllx5ME4Nru3Gnag0hVDXA23RiTi5+03+14Wc5cdRV3UmnmqN60uFq3443JN7o7flmS41Z9fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fvqE07jI; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fvqE07jI"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2ea35edc691so758237fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 01:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751878332; x=1752483132; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDVPiT3y/IEBQaw7UV/tz0okFb5sjvyKj7Prqist9Bk=;
        b=fvqE07jIpvy4ifNW0ENVM5dM8uK9HHJEA7cAtS3tvy/2syphxGzcHiDj0jB/UKb476
         cmUfcqrq+/gWOmz9amXLx0K8j/MCGQcmq3uj8FAizeNPpeimQ0BwqaITr2pMY/Ry3+VA
         xPkZMqx1C4pocgEJPguG0d8TlgVHk0c5l2atN4NZxjgbDjlrVpSUSsWgviiRlNaIf/Rk
         dzxrDoyjcxg8vu+l9HuuLnEPJ7vfs8VfDQUBmkpunc0nQsDMRAsUIucA2NEIiYsxK6xU
         ycf1skxi0hFJGUi3whQVT6UMDajY8qRGQxRMa9bjfDbak23ZXhlI+YfWqTU0xXpvvrOM
         y4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751878332; x=1752483132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NDVPiT3y/IEBQaw7UV/tz0okFb5sjvyKj7Prqist9Bk=;
        b=cSr01XHo8psMUzurhC3j2bJR3wGmKwpEzfdb0Vbs+V1rv/uQm/4yYMOMJI0zgZvz+y
         f3acluoZpkJI+YPQEP2itLIfLMVxqJ2mM/jkDPxNCH0pZC3ODpG+sB/tTD33cVpNb8MG
         kauvE9xEYAndRYXws3wH2PDFI/RKSafC5L0RNW6rOqmb9RWBPEB1/624/iryqTjRy6/L
         8qYuT6VY2H9JtkA9TqXyJZN3M29cC+McZXx5w5BNak0c4PXIhcNz+yrELMHGtBdffMOO
         AMVxqc5EzQ1LIRIKwUTCWg+H5mL2rtAcBsXf2eRypaNtxT6bWs9LoIL5T+pE1n6UPCf3
         CYNw==
X-Forwarded-Encrypted: i=1; AJvYcCWKWtEqIudzI6TvzoJH/Z9SoGpvLqPw+Xgb3lZ7G9NYzDSzfXF5IuAdaLxz4EWcVFIOLMFPcAh4Y50IaAU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI/nUaRs7pMXC7EjGQNKQzzurZjMn1ySBLcjlH7YoXZrqeetxJ
	rJNJYCGVou+TimOrmVy6Ya7o3h0MkV0vk/LOcAp17G26QtFh54e7pcRtowehr9c9aZEzvpT0xBn
	r4bga1y/pimgl1t5V/mfQP8IzRfdlgU4aAnxtI1StCg==
X-Gm-Gg: ASbGncuN52bgk0exB0j4K/+kk36knnrYjQUisOWRDjzK34mvc94X0u5FM47cUYmvcAx
	Od19BPgXx0nVQT4GG8YRClC0fCrSkhw831e4DWWs1kNJlYTGhazx/zXnvIW1lpmAL2RopJ0ugBS
	YESNU0HSMa/wxD2fIiGXOfKbZJjWBq3qmomUE+SclDHSuY
X-Google-Smtp-Source: AGHT+IEj3geuDFpX++SDMrn/ji9XGPECs4W5y0PIqWxFAyffhSBGzwoeTrtt+GXfjptm1UQik2oIQixEFyIbodoYkeE=
X-Received: by 2002:a05:6870:9687:b0:2d9:45b7:8ffc with SMTP id
 586e51a60fabf-2f7afde4ee8mr5416161fac.3.1751878332040; Mon, 07 Jul 2025
 01:52:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523-b4-gs101_max77759_fg-v4-0-b49904e35a34@uclouvain.be>
 <20250523-b4-gs101_max77759_fg-v4-2-b49904e35a34@uclouvain.be>
 <CADrjBPqOMOyHP=aQ1+fg2X58NWRp-=MJBRZfpbEhQsTzaZ9LHw@mail.gmail.com>
 <bc40326f-db40-4657-84a7-152def2ca9e3@uclouvain.be> <CADrjBPo2=FajKA0t7TTMdH6iK_qbWCSJK-hEqh+UWEuzC7wyGQ@mail.gmail.com>
 <2e26f8f534284b280e9d5e8d4ae556a452e93ff5.camel@linaro.org>
In-Reply-To: <2e26f8f534284b280e9d5e8d4ae556a452e93ff5.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 7 Jul 2025 09:52:00 +0100
X-Gm-Features: Ac12FXypfLDLEdnbrTBCEZv832mBaFKGNgc3VgFrnkzOkozoICaCDgwT3JcKDwQ
Message-ID: <CADrjBPr_UY6LDxTqHAszC1nhq+qdV7OC5M2y+z2C2iwOKzqWYw@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] power: supply: add support for max77759 fuel gauge
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Thomas Antoine <t.antoine@uclouvain.be>, Sebastian Reichel <sre@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dimitri Fedrau <dima.fedrau@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9

On Mon, 7 Jul 2025 at 09:04, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Hi,
>
> On Mon, 2025-07-07 at 08:16 +0100, Peter Griffin wrote:
> > Hi Thomas,
> >
> > On Tue, 24 Jun 2025 at 16:45, Thomas Antoine <t.antoine@uclouvain.be> w=
rote:
> >
> > > I am unsure about what to do about this initalization, especially for=
 values
> > > which slightly differ from the devicetree. I think for next version, =
I
> > > will have the same parameters be passed in the devicetree like androi=
d.
> >
> > We don't really pass register values like the downstream driver is
> > doing in the device tree. I think you will likely need to add a
> > max77759-gs101-oriole compatible to the driver and then have the
> > application specific values, and m5 gauge model algorithm as static
> > info in the driver applied from the dedicated compatible. It would
> > also be worth checking whether any more of those register values can
> > be represented by the standard power-supply binding properties that
> > already exist.
>
> I believe these are likely battery specific values, and were obtained dur=
ing
> battery characterization by the vendor (or Maxim). They can change (with =
a
> different battery supplier etc, hence I don't think basing this on a
> max77759-gs101-oriole would be correct here.
>
> As we learned from the Pixel 6a battery updates, the same phone may use
> batteries (e.g. from different suppliers).
>
> Either it needs to know about the specific battery model, or the values
> should be passed from DT in some way.

Some of the fg-params values are characterization values like
QResidual, Rcomp0 and others. I hadn't really considered different
batteries for the same phone model. Given that information I think one
would need to investigate in more detail how downstream chooses what
battery it has and what set of values to use.

Thanks,

Peter
