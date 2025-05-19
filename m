Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4D9274657
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747654740; cv=none; b=eSg8+oCqqchg2tHxA+HglcM5H6/74MC7PE27JX7/lNUt2FD/hP6WKsmN+amhaGFOxrOCUlhDD9+tk75nlouOVgg9xyXbbbTRLq6MSnllLS6YAN+Z0G6/X+gYUA3PI7Uu3ZVA4xL7w37dk3YJWgZLtFQqOrU8Ssa2z7X27LNkQHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747654740; c=relaxed/simple;
	bh=TMHxhEkJeLRrFVomKdfUPmg32HngiwuN7Y8XouZQTSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QvoaxQ5BY9rzNqEcdQYJ0O8dl+Iqc0oFTfhwaESm1OCQek7vTWpzZBasjxl5V1HEUxaEE9vybfrkDnC8zPblvPVsomYOBjXUA92UsZJb2IRP+FIGRYVTYvFqf27dmbrFmEvr5aLHswQl25hKoDGQl1bITXnqkzxKc22UBSHpzKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qplCrzOO; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qplCrzOO"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e7b98303087so889423276.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 04:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747654738; x=1748259538; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jGbkzJ0eqqimJI7DwVKRZ7T05jAEAZTanGLLnplCIgc=;
        b=qplCrzOOeNGb+ExJFbmhlwgae5MQ/NMv0uqLEQIn1I1n5sVGLEbN21aaxQ3J6nqHa2
         jR8nMUxnKoAUeVh+cRd5kf2rwMaOoLNDGYVJxXkL9DnOECscng6dlzaclADb6RPbk0pn
         4oUgXaDC95CFSnqhEt+Ej3VlSZGvCbjQk/pGfQWL7BsltrNFChoLGshigd8jLbhJ3c3S
         GnQtbctZb6/i1WkiSnY4nX3EC+lf+B12Se0x9sbmzkM1JgkVJTNjzonW0h7lrg8S8qsm
         DHmbYg7EUx2INULKcSW6QPNM/PfRaMbtbjskt3dFuiHh6psBuuB/98HAl5M3MtZg7kKe
         IpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747654738; x=1748259538;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jGbkzJ0eqqimJI7DwVKRZ7T05jAEAZTanGLLnplCIgc=;
        b=S67M1URjvjNx+VGY33Cm4jsT9UQjobBB9RosOBbNzw0SopbGn1zU044wGQuPuZWxg/
         HVOMsFPzSdK5H1d3VVgylurX8UbybJd2n0Cgsgw9KAgKrbLmuUpaBlwrMZXqCoCFAQV3
         jGvQC8dWiKtznztL+lWPZE0upj1ozHgjoWbtBho1bFm8W5Ca6WdkarvXU//tb3Q1K4NN
         g1hOGmcPGLrN+eU87anbI2RmP5pmVYriTgkAN76U0iUolRPV0ZGPEXsBUGwGe7scg7J6
         cDZVHks6y97sNiu+nyhyy0AKOp8zu6NbCtI4CIS9jr9jFXs2QpKwSlPGth9+7CjT9/a1
         1e+A==
X-Forwarded-Encrypted: i=1; AJvYcCUCRchs7BVBo8oTtTe580/dRN4Tp/dL0A+bkYDl/EFTLPXau3iauuonM4oRzy5kJCB3XPs3QHJpjB1pbrY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIMfRbFLh//aQk+AJ1IKH21jBDORRsDs4eo9Tag1yIGuoLx63q
	5r7c0AMelY0+mTE8gjHRT82vCHbWcN4yTlHJXlZt/SbE6uIlG9bdzLgwQzwySo6FOOAVkpK/s1H
	swRarXygzokxT4Y5fCKv+NtRzYaozfJS+AdcBQ1UHXA==
X-Gm-Gg: ASbGncs+wV34Z0zM1MA5sPiIRIfAoetMhVbeArGpzUbsbPPyK506lPoYXTvlzcnNAdX
	dg1tf2DeiFAB2HL30Xf1plDJ9nEiB52eV4mmMcAjKB0mk4115vcY99/9M1BEzt2QqV3yWsE90Zx
	SfICCU1fBt0z1bfuaJf7qRonzqGEsMBw0+Vg==
X-Google-Smtp-Source: AGHT+IGEhk9xvOXamJcUf2c7oYgnHzt7/Q6Jc8A16RlKxL4KhnX0gE0Bk6C5w2N1j0qtNoul2O4nnkYi1A17Lqm3muU=
X-Received: by 2002:a05:6902:1547:b0:e7b:9763:6676 with SMTP id
 3f1490d57ef6-e7b97636a60mr5570580276.17.1747654737919; Mon, 19 May 2025
 04:38:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509-20-k1-sdhci-v3-0-526c35feaa20@gentoo.org>
 <20250509-20-k1-sdhci-v3-2-526c35feaa20@gentoo.org> <4cee9284-8f71-4214-8bc2-48bcb4030e40@intel.com>
 <20250512075631-GYA517379@gentoo>
In-Reply-To: <20250512075631-GYA517379@gentoo>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 19 May 2025 13:38:21 +0200
X-Gm-Features: AX0GCFuvP9LYuHS81_oe6T9DU2l0mF54pVYJmbBwMEiyFEMW40gm2OmA7P10SVI
Message-ID: <CAPDyKFpgCMsaP=CZx210Ov=gTCkez-fwEPMwKTGHrzF51p5_TA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mmc: sdhci-of-k1: add support for SpacemiT K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 May 2025 at 09:56, Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Ulf,
>
> On 09:04 Mon 12 May     , Adrian Hunter wrote:
> > On 09/05/2025 16:22, Yixun Lan wrote:
> > > The SDHCI controller found in SpacemiT K1 SoC features SD,
> > > SDIO, eMMC support, such as:
> > >
> > > - Compatible for 4-bit SDIO 3.0 UHS-I protocol, up to SDR104
> > > - Compatible for 4-bit SD 3.0 UHS-I protocol, up to SDR104
> > > - Compatible for 8bit eMMC5.1, up to HS400
> > >
> > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> >
> > Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> >
>
> If this isn't too late (as v6.15-rc6 is tagged), I'd like to seek
> the opportunity to queue for v6.16 as no big changes during these
> two review cycles..
>
> I also know people who would expect to have a full rootfs support,
> and this driver is sufficient to bring eMMC up and will make their
> life of development easy..
>
> But if you have different opinion, then I'm totally fine to delay
> it to next merge window, thanks

I have been busy the last week, apoligize for the delay.

I just posted a few minor comments on an earlier version, I didn't see
v3 sorry. Anyway, should be pretty easy to address those comments. If
you manage to send another version within the next couple of days I
can certainly pick this up for v6.16.

Kind regards
Uffe
