Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E251F1902
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739279009; cv=none; b=IWxr8XleHbdvPcJhnSQTaDCdfBzmqr5mR7IDaHr221HYtrLlP0bX7CjFF6M5DAYd0HR04ieovjQxTms+pPej6CoOv5+j1KxRDpMeu2fQRwETFv0DZogmMOm2Kx+Fj3hVpflJY3wfjeaMdZ75pAqyyPaITtzA51Dthqo3kTkHlJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739279009; c=relaxed/simple;
	bh=t4ghqC5uBy7BE8igwkxJT0+IlaB5NctEtS32SBL9EG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MgW6k35U/f6+MmNNVdED6cGnXWR2inz/JPaP2gePlLZiiBrC19WjlsoKDB/mRLN/u6bzmJa01e8pfxhBnh1tUeEeNbKfF2FIlY5m3ZLhQQgLdPTuelphUzxDmsDmXoBqthLKgWBuud3sloz9BL4Y1Yfg2UKOkgfXWfGkD1xthSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=edgeble.ai; spf=none smtp.mailfrom=edgeble.ai; dkim=pass (2048-bit key) header.d=edgeble-ai.20230601.gappssmtp.com header.i=@edgeble-ai.20230601.gappssmtp.com header.b=BtwxWUSY; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=edgeble.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=edgeble.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=edgeble-ai.20230601.gappssmtp.com header.i=@edgeble-ai.20230601.gappssmtp.com header.b="BtwxWUSY"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21c2f1b610dso133498545ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 05:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20230601.gappssmtp.com; s=20230601; t=1739279007; x=1739883807; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n3wx9zk5qHzdPMIZwl01jPTrtMsd38bzKH0sGNqE64Q=;
        b=BtwxWUSYM7Uhp+tad8G87ScBd3m7WfUDzdOxQ22M3wOszA8SP6iQ88Rrpy7APBhP8o
         1920bHx8sjL7ljpyMdxMmb0G4AR8RtyL/dd51+DYBOtBrHyD1McOeBdvaCa3BVgLAifR
         i9QFJCR/BrYToGNZjtsXR9YfWv7tDSX47uAM39A9tJvnD2Zte99y0QUewsJiv5Tdkjrd
         36sRTmVQcn+4uuT9Ob2D+Xq79X/VO054nfadCtEfuYwZEZh8RL/BcSad/HJXmNtTBRNx
         cLekk5FJPdM+omO7loy7mVFWWfUyTqRa5YgRth5dOB34XPThsXhSO+YBbyBJ7qIAjU58
         K1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739279007; x=1739883807;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3wx9zk5qHzdPMIZwl01jPTrtMsd38bzKH0sGNqE64Q=;
        b=qzaB6ETNrJdqTp6t7xNpmFW1p7PFhOq4aFvEvdppzqssQppny0KcwsML5w8yD1Tgcu
         CifHH/wEmOmmRcQIR7auD0pAObT2syqYjfDHi5gldy4d8611BxX07w/sgQlICgnrPuen
         uO5ynUSyAy493pTe+TejN6mGzqJU/4pZaHBOIuNzTM90msulzCsHzcG6D1q1a31CERs/
         iZJPw12eEoabLoMRM9CboJCRPKrBW395w13sYixzuuSicfJ1cvz8fv2AZc7u1oce8ZYy
         t2DqjiBWKWT8WB7rTNnpAVtnTVBev1NPpG37+bC0ooOIYBR/at63/0Przliy7YJBB0EL
         c6zQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk5P6f0hrrWQL4HbRqPIewZKTx8geftumGBhdLi4wB2Rc+uv/TgqTIg8lmHmL1PeEbHh4pcuG9NZ54oD0=@vger.kernel.org
X-Gm-Message-State: AOJu0YymP0YTv5sn/Rvlm4bG8gPNHJ+GR/ibjfxkqhZHesndU3IBFQXF
	KJYQT13sUi/52ThMy1CICR+lJ1e/GYUjhWHlb7nwQ2aqy4vrd+hnOjU4TRx9pvIQgmW9yltY+tO
	fYwQW48ghzcDFaxzN3ZH3A4sY+H5nCYdfIZbfSA==
X-Gm-Gg: ASbGnct9Lb0Eey/g5fYC5YmhZIkseEhGzI+DtTbttaQofqyEWSr+XTjC1AbCAcB4kvz
	KXITrlYVxx6c9FtsffCcBJKb3KGF9P987+9y0QnuTwcd8O3tAlUwb5qYsLQNrTQ4g1Ju/j+o=
X-Google-Smtp-Source: AGHT+IEMVpkiHNiW0PFSaGrVrINKXb5sxzgwVDUOtgfEWggvvAR0CvuTqqd3P9Mx3MHb8RdrN+UeWxJU5s62w/GAwiQ=
X-Received: by 2002:a17:902:ce90:b0:216:2477:e4d3 with SMTP id
 d9443c01a7336-21f4e7f2c46mr294522695ad.51.1739279006869; Tue, 11 Feb 2025
 05:03:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207-pre-ict-jaguar-v5-0-a70819ea0692@cherry.de>
 <20250207-pre-ict-jaguar-v5-2-a70819ea0692@cherry.de> <CA+VMnFyom=2BmJ_nt-At6hTQP0v+Auaw-DkCVbT9mjndMmLKtQ@mail.gmail.com>
 <8d830c2c-6268-4c70-ae8a-47183b8cbace@cherry.de>
In-Reply-To: <8d830c2c-6268-4c70-ae8a-47183b8cbace@cherry.de>
From: Jagan Teki <jagan@edgeble.ai>
Date: Tue, 11 Feb 2025 18:33:14 +0530
X-Gm-Features: AWEUYZm0htviHKGbBoFA3-kz2TrpIHA0nE9JnkvC09nlcKbz1Z6y2gei6ZbeNLI
Message-ID: <CA+VMnFxJZPD2D3-5t+=BEo2TVWoJFuEtd1Jj-_+2oqVoXonHcg@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] arm64: dts: rockchip: add overlay test for Edgeble NCM6A
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Quentin Schulz <foss+kernel@0leil.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Niklas Cassel <cassel@kernel.org>, 
	Michael Riesch <michael.riesch@wolfvision.net>, Jonas Karlman <jonas@kwiboo.se>, 
	Dragan Simic <dsimic@manjaro.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Quentin,

On Mon, 10 Feb 2025 at 23:27, Quentin Schulz <quentin.schulz@cherry.de> wrote:
>
> Hi Jagan,
>
> On 2/10/25 3:11 PM, Jagan Teki wrote:
> > On Fri, 7 Feb 2025 at 20:50, Quentin Schulz <foss+kernel@0leil.net> wrote:
> >>
> >> From: Quentin Schulz <quentin.schulz@cherry.de>
> >>
> >> The Edgeble NCM6A can have WiFi modules connected and this is handled
> >> via an overlay (commit 951d6aaa37fe ("arm64: dts: rockchip: Add Edgeble
> >> NCM6A WiFi6 Overlay")).
> >>
> >> In order to make sure the overlay is still valid in the future, let's
> >> add a validation test by applying the overlay on top of the main base
> >> at build time.
> >>
> >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> >> ---
> >>   arch/arm64/boot/dts/rockchip/Makefile | 4 ++++
> >>   1 file changed, 4 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> >> index 534e70a649eeada7f9b6f12596b83f5c47b184b4..02f98abe1df10f44f2ac27ea5f6c6e6c6334724e 100644
> >> --- a/arch/arm64/boot/dts/rockchip/Makefile
> >> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> >> @@ -192,3 +192,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-vz-2-uhd.dtb
> >>   rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb \
> >>          rk3568-wolfvision-pf5-display-vz.dtbo \
> >>          rk3568-wolfvision-pf5-io-expander.dtbo
> >> +
> >> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
> >> +rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb \
> >> +       rk3588-edgeble-neu6a-wifi.dtbo
> >
> > Please add neu6b-io as well, wifi dtbo is similar for it as well.
> >
>
> Similar or identical :)?
>
> Should the overlay be renamed if it applies to neu6b AND neu6a instead
> of implying it's only for neu6a based on the name of the overlay?

Similar. that overlay is applicable for neu6a-io and neu6b-io both.

Thanks,
Jagan.
