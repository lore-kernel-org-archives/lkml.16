Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0EC1CA84;
	Fri, 11 Apr 2025 02:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744337079; cv=none; b=YWbPPxPknGinnvLyJb6gNvZGhd8kuJeNDCs4OcKLlp1N4Jm0GaPWqZ8gYW7ZnIr5fryVcysBr/G7tNN8UHu8J+ANNGnpj+gqXNdZ1ojTNVdsL8+VxHyGI+Eo5iYv+iq7se/KjxhaTxFMB5Ut2YvCijpkP2t+ADLHs7MG3KfxLjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744337079; c=relaxed/simple;
	bh=g9/x8XVo04TJwsErizKXE+KW7n7KBUBQb8/FWxPLymg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NbHZTEZxxoOLSoyq/CMGqbsSDJUK6rvTrTGq7vPw5YPDz4o0mTSN+9OEphcOwIqGzgLyLqn2GtAhQxDkIFsVLDMjO49itH0VCFE4c3LeWLhdpease3N+nQIPUxSvPU/4MyblH79jvsuiu8ZyeEvaFf/kmNm28r5W4IoweUnPZXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac2963dc379so236664566b.2;
        Thu, 10 Apr 2025 19:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744337075; x=1744941875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5z1I+Yl9dtmBZZ8N6P8UIj5dgbJQZua1H9d8D+bvII=;
        b=w/sZ9P9rQaFphBuYZRJyGzR6SF43l4oLaaATBi9Gg/xF2BOhapkbHahOgCTFOpDFy7
         5SLqHCGRDyBdjsdLHSyUpzBnyDJS/VcRBINvyNAOXt+EbOMFGIqAsdsdPDoTJE+2s/NL
         Grto5LZHgGdiZFwGR5kgo0eQFidcOVgXM2c07bUT4A3ct3ri9WbhhZYt+s+yhtsB4Td0
         gjQnUxM0u/EX8Fibzc5XE57lwpPvO4Ssujynt94+zOvwihL7RO3l3xG3C7D5lG4fzm3w
         FWCDRWsaQrXHl8xNJklYDpQEcEomEtqScqVP0Qf6uCc3XWpFrwV2MneJKZqEgf/nw0q7
         cAfQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5DjzIbqSkr7SgKF3WBuS7muq8am+tcEjzFOWRfamaTq3Dv07hFf/dwM9APY7cvoMfyUB4QAggesqPpXne@vger.kernel.org, AJvYcCVfcBKj0N2RDoWTBlW/xH9RLZTLT6ql1+w6n1ERxexV4verSlIdVvnmAONdaHRelhdLCCBLWcLcoulG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy73C9L7S6DGsDCB8fBliPeZagGOH8+jy50hMkdL3qCLUE3qmct
	1NNrda8INYH/qj8Q0nySdJ4yeGU0EWjLI+UiEqZNfPGHvztWRuZOwLpFlmLxHfQ=
X-Gm-Gg: ASbGncs/fRWkqO0Tv9Fm3zVAfWiVI60BFYxmpEIrAblSXC5sYG990VkT70AU/g0cdJZ
	AziB+BjEB5fdxLeirXNLs7+urnweGy7Oivo8wrcXVuEhiNmBoqXmAB5uC90ciNjlUJbv9vGv/rV
	qprSj1SqioDYvKe1vip8qAMSoOnWzYjVGATao4ryiqGt5YB/ZzJl9HHCleVC15TPyqr/6kkU2zy
	h7RSd/3yk3z9K6UFGTCCpUtfYEDLYTJ5YfXGsuMcOcilElG4KXo+O8NPUuPHVZOw8Ol9Qv4UKS8
	c3qPeEM1Ao51KXtRaLiuWwxLuFWPjpO0ozIcmjfdN+M4OF8cWAbhaO40/+sVCswqJmyjxS+IomK
	mGUD1bg==
X-Google-Smtp-Source: AGHT+IFvxZZrQ7asbaqTnZj9oRNLPRZ1myUouFHcRiJne2AI36eem2HQRTjCSYM300IiFWl4iOde0g==
X-Received: by 2002:a17:907:3d4a:b0:ac7:82b3:7ad with SMTP id a640c23a62f3a-acad36a3f5fmr96559866b.46.1744337075446;
        Thu, 10 Apr 2025 19:04:35 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb3d9asm369703166b.105.2025.04.10.19.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 19:04:34 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so2304799a12.1;
        Thu, 10 Apr 2025 19:04:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQzbGmvEcWscQghPIbqkjiRdkCh4RF1JBpbGacCDeuKoaUPvFOtrvzIHKRXBi+dZeMPgQB9bJZdoKT@vger.kernel.org, AJvYcCXsk/B1C9vN7o4XPKy/Cyx2U+mIE5x6klV7M1EreCXTzzUCZqqWhLR20HgXWHTc9hm+EYJ06DpUKeYEjyva@vger.kernel.org
X-Received: by 2002:a17:907:7215:b0:ac7:805f:905a with SMTP id
 a640c23a62f3a-acad34c6e4fmr59887566b.28.1744337074794; Thu, 10 Apr 2025
 19:04:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409-spmi-v4-0-eb81ecfd1f64@gmail.com>
In-Reply-To: <20250409-spmi-v4-0-eb81ecfd1f64@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Thu, 10 Apr 2025 22:03:57 -0400
X-Gmail-Original-Message-ID: <CAEg-Je9xarQK2jP=+7P_Ug5oM=HbBLsc-Sad_wp1tQkfSgXA=g@mail.gmail.com>
X-Gm-Features: ATxdqUFptu85Pq5XS2Y77lz4M0bInU8AWjExnkfiEk-bZJ-0RHCXCTLUmPDmg_M
Message-ID: <CAEg-Je9xarQK2jP=+7P_Ug5oM=HbBLsc-Sad_wp1tQkfSgXA=g@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Driver for the Apple SPMI controller
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Jean-Francois Bortolotti <jeff@borto.fr>, 
	Nick Chan <towinchenmi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 5:52=E2=80=AFPM Sasha Finkelstein via B4 Relay
<devnull+fnkl.kernel.gmail.com@kernel.org> wrote:
>
> Hi.
>
> This patch series adds support for the SPMI controller persent in most
> Apple SoCs. The drivers for the attached PMU and subdevices will be in
> further patch series.
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
> Changes in v4:
> - Rebase on 6.14
> - Link to v3: https://lore.kernel.org/r/20250310-spmi-v3-0-92a82e7d9f0d@g=
mail.com
>
> Changes in v3:
> - Inlined helpers, dropped unneccesary error prefixes
> - Link to v2: https://lore.kernel.org/r/20250307-spmi-v2-0-eccdb06afb99@g=
mail.com
>
> Changes in v2:
> - Removed redundant error prints
> - Various style fixes
> - Better explanation of why the driver is needed
> - Link to v1: https://lore.kernel.org/r/20250305-spmi-v1-0-c98f561fa99f@g=
mail.com
>
> ---
> Jean-Francois Bortolotti (1):
>       spmi: add a spmi driver for Apple SoC
>
> Sasha Finkelstein (2):
>       dt-bindings: spmi: Add Apple SPMI controller
>       arm64: dts: apple: Add SPMI controller nodes
>
>  .../devicetree/bindings/spmi/apple,spmi.yaml       |  49 ++++++
>  MAINTAINERS                                        |   2 +
>  arch/arm64/boot/dts/apple/t600x-die0.dtsi          |   7 +
>  arch/arm64/boot/dts/apple/t8103.dtsi               |   8 +
>  arch/arm64/boot/dts/apple/t8112.dtsi               |   7 +
>  drivers/spmi/Kconfig                               |   8 +
>  drivers/spmi/Makefile                              |   1 +
>  drivers/spmi/spmi-apple-controller.c               | 168 +++++++++++++++=
++++++
>  8 files changed, 250 insertions(+)
> ---
> base-commit: a24588245776dafc227243a01bfbeb8a59bafba9
> change-id: 20250304-spmi-6d3c24b9027a
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
