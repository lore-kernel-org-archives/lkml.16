Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91072749FC
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747654944; cv=none; b=M9ST0CwPpEehAuwRqWcvE8lg6NZe0NerFD0D/DFiYFLqms5xpkMqVDI6RAUvIxKBxfrkUqxdj0z3F7zCaHld4TR7ZmQENs/5skAlYyYK9QSrQ4qXt8kdER0n/3+T44EXBcGfZi4SOeoUORxiTWx6LjZY6N8NGl2CWjSWSc4AxZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747654944; c=relaxed/simple;
	bh=QpvRVedBrBMy10NIbVtvjYN30CB+eR89OGKIdjlaWu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DmEbyMhazRIUgNHz7/omyqDLK4NliB9F6u2QEYmxXaaQD/sNacqLgpShehghDmECw5m4AkQphGX0kbY1Qc7QPUPEXBrQ59Py5qV4vK62cocs/IrWrzpuaQgupDGBrwe+02g6l+eheCd6m5agSfh/leDHbUqZJ4NEbBWBtWkuGU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gRhhvab9; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gRhhvab9"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e7b7b4eaca1so2302724276.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 04:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747654942; x=1748259742; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xi4QP+tb++uj0FmPaNWal/Va1UBFazasXzcN4zOZKIQ=;
        b=gRhhvab9dfHz3HQ/gmOuWwP1oGHRa6gQfM8m/RBXe4D1IDBWgcr8DiNAFTUb0FB+4N
         h4XByRiKnof96q+O93WDFqoKBB1qMlMO1s2tfe2fIvEuydtdbWBXDDM/5qhHTzSV9816
         5JlMyj/0uRJqd62tg/FarSzgaVZrMQsaZnzd1Lp1GV2A///KqPs4AjbZtN6lHDmCDj20
         uokoStP58hB6g0REbHFj1Oo0wVr0AMsZYO6wBXbYSvUgzNHiwWJ7/kxBjTnS6AYP85ad
         FfU5RKpwS7dIIUZrteXjNxDQxelNSECINWQreT14wnkHbCp890gh68a/idAEyUhXvXry
         XRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747654942; x=1748259742;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xi4QP+tb++uj0FmPaNWal/Va1UBFazasXzcN4zOZKIQ=;
        b=Ycj5aNdbJmdwV91GelOk32iQzdRivruunUE10BwfY3oMO+DNsOW4fcD7MEHijaSfEZ
         QMfwzRnKUIJovHTkmz2U9nDiEaWyAa90J6q/MLuJaWILZrFpa7E5W2OfdyzJEmR3XCln
         vbdaEMHsYLWCPKBWtsq/hL5VHU+t5BKeEZwgG2D7UFvMkjPSJhImiat8FQVnk26QFsfK
         R8kuTTXDfX9Zn/YrLefN7OsB0EpF/FpAh9mUDhy0paytDPOS2mOAgOQR5MxlQm0f/n6z
         5KvKsglXy74j3J4atX4/DUVeSAwF/dvhHHP1co9WfTB41MHi1sih9IxnNzCPB3zIDfAi
         RU5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVsqHaYpDC6pksSl+V4YyYeZe6C8YFin9HQbFOrOEB9fYEXDaq95f8psPGoWX2Q7LayJ//LAa5lxcPcFus=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4jnVrOIc4SeLnT0nH4/LsI2IP+PDYArZhEICYoDRJlRFZSgb/
	5aS5R98mkgUD/4trueqMi+1jOw/rd1GcTPWeX+2dk90KTbUbNrpDfoMvd6Y3Gxmu39jLkeJ7z8i
	pJ0hEcSPVP7VOu5rWbGoJAvx8H2E4fFDhVYOcr36vtw==
X-Gm-Gg: ASbGncvzoWeWKpbfwHTnM9DTwgdBmpntAml/vKwNTH8sWc7hB0rzIikdHX/yiAEbWLu
	HVgNYv+SLjZhRu47t8++91JNgV4/C8bd3/g2HjFp4Xfc9k1d+PpJegoxD1WniA69qvA2G6/xBC3
	gOajaSmD0Hn/T6CY1tGsA+QGXykLoi+nSK5A==
X-Google-Smtp-Source: AGHT+IFE9YTmql2J1EDYOQW1GURLdO1CuAEE1Qnz48P0JUcDipJN0t2wX+uqL9weWpYsYzTJL1jtg61xH036CqGhtyI=
X-Received: by 2002:a05:6902:10c3:b0:e78:f2a8:a69b with SMTP id
 3f1490d57ef6-e7b6d3dd2dfmr14389495276.17.1747654941775; Mon, 19 May 2025
 04:42:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509-20-k1-sdhci-v3-0-526c35feaa20@gentoo.org>
 <20250509-20-k1-sdhci-v3-2-526c35feaa20@gentoo.org> <4cee9284-8f71-4214-8bc2-48bcb4030e40@intel.com>
 <20250512075631-GYA517379@gentoo> <CAPDyKFpgCMsaP=CZx210Ov=gTCkez-fwEPMwKTGHrzF51p5_TA@mail.gmail.com>
In-Reply-To: <CAPDyKFpgCMsaP=CZx210Ov=gTCkez-fwEPMwKTGHrzF51p5_TA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 19 May 2025 13:41:46 +0200
X-Gm-Features: AX0GCFsB9fU8obeLDfkKRVtLEIl-4TRtUdQD79rwTQ1raKLz78xB0D2YGIo8yS4
Message-ID: <CAPDyKFrtH9AeHCiyJLv+F+tdVKJkhxcvcFj+wgqmAqN2CoC0jA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mmc: sdhci-of-k1: add support for SpacemiT K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 May 2025 at 13:38, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Mon, 12 May 2025 at 09:56, Yixun Lan <dlan@gentoo.org> wrote:
> >
> > Hi Ulf,
> >
> > On 09:04 Mon 12 May     , Adrian Hunter wrote:
> > > On 09/05/2025 16:22, Yixun Lan wrote:
> > > > The SDHCI controller found in SpacemiT K1 SoC features SD,
> > > > SDIO, eMMC support, such as:
> > > >
> > > > - Compatible for 4-bit SDIO 3.0 UHS-I protocol, up to SDR104
> > > > - Compatible for 4-bit SD 3.0 UHS-I protocol, up to SDR104
> > > > - Compatible for 8bit eMMC5.1, up to HS400
> > > >
> > > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > >
> > > Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> > >
> >
> > If this isn't too late (as v6.15-rc6 is tagged), I'd like to seek
> > the opportunity to queue for v6.16 as no big changes during these
> > two review cycles..
> >
> > I also know people who would expect to have a full rootfs support,
> > and this driver is sufficient to bring eMMC up and will make their
> > life of development easy..
> >
> > But if you have different opinion, then I'm totally fine to delay
> > it to next merge window, thanks
>
> I have been busy the last week, apoligize for the delay.
>
> I just posted a few minor comments on an earlier version, I didn't see
> v3 sorry. Anyway, should be pretty easy to address those comments. If
> you manage to send another version within the next couple of days I
> can certainly pick this up for v6.16.

Ehh, nevermind. I don't want to hold this back. I have picked this up for next.

Please address my comments on v2 as patches on top instead.

Kind regards
Uffe
