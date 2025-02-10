Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB8D233147
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 14:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739196717; cv=none; b=dVJo0SNhZw3SfCUmRp3vNozMw4RlLlQmk94WQCaj1B6hi9LHztlhhYmWtf3v2YRbFhrvI7B2AymM9YkogL9/nlWtvTjzdUUQI2ID2ogzOpr8fp26pbELfnPyAy5a1bx2GHTBl5FoeTJp8Hxnub2efK7rWI7VrHFiEcI4EJ65PJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739196717; c=relaxed/simple;
	bh=Zuw/8hktlkOv481QcKFpOWhseUN1AsxMNUdGVWQ/6mw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RK9u7QcY7osworYKuNVo3c0LrymKCcoLGkVX54NrUrlLf4QH7YzJBb8agGy+Q8gUni4XRuFQ3NO8omxzeBAPkU+JzsLlDkouSx6KmNzpAvWQQIOAALaEjqqUQj5W/Lr5/DN022iKe7H7avVNCRdEFGmrgY9WK0JCVn9Jr134xJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=edgeble.ai; spf=none smtp.mailfrom=edgeble.ai; dkim=pass (2048-bit key) header.d=edgeble-ai.20230601.gappssmtp.com header.i=@edgeble-ai.20230601.gappssmtp.com header.b=KSmfyN7C; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=edgeble.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=edgeble.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=edgeble-ai.20230601.gappssmtp.com header.i=@edgeble-ai.20230601.gappssmtp.com header.b="KSmfyN7C"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2f833af7a09so6047745a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 06:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20230601.gappssmtp.com; s=20230601; t=1739196714; x=1739801514; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+U+cJ54sadwbAEEQ1XMnFeXEpukGhrX3NXgbMiqSEdc=;
        b=KSmfyN7CVW6Nauz9XeRdD90SgOmUWUsBBXX1ffRupmbIJruw1D16LAg9ItOp3yyGph
         1gKn9rncqTSLTUPTI/lQGXKfSeAIZLAfUSLypBTWN1XjgNYhVrqz4MeGVRQ6mGZXQ602
         bHEOP6hHw5FB+OorG+7vAPbtV6cSEEUs6cy3mAzx1//02mrQmvpKDaa0tnfeKieBLdXl
         yiJgjs3/pne+6+7jmlCzYobM2dpG7OLNlYJn4J8F1Fu01bkkd/mB0T5F2+lcStJllQ+u
         m/pTrJ5GY41/oqkgNDUQW8fKM6MTNBZw9o4OOEHUS96JzeMQSnKlzOasxYiPfBZGrioF
         BKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739196714; x=1739801514;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+U+cJ54sadwbAEEQ1XMnFeXEpukGhrX3NXgbMiqSEdc=;
        b=wd2SoiKu34m+o3LRJDxVmSiYbPRwCCuKJPQrDNrMza/fc2r40Fz2PKlF1fc6JMDsO+
         S2M6PJLEe2jw1k84tmr0/hAmKmF52Vd0IiiclioFSgUtVxKYt9vPAwoRD4HSSWBL2IO0
         Gx252j0jjFnubnfzb8SgMh/i8hMkHU+T6RWVLloaRjiTk3crQSJhtBfCDbGHpqsn+I+6
         IdmmCXkYgtiJARay/At6ZwWJgLgxYXxNOc1iwo7ZTuYBXGEf2XuZl3hc3sG6ITa4vx2R
         n0dywz7vFcQ7PbH7qyxfwFTU6Qpxo4rIW9LhOFpUgH4STVd6RsoT6Q0P8K8bFF7uqOzG
         ZorA==
X-Forwarded-Encrypted: i=1; AJvYcCXNlty2IviAh8k6EiaBr7he+YiIISaEyC1Yr9PGUKUdkBgvWWEUXwVo6wLbuNJlE2tTuRhjkHAPSWXGe0k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQgyc89bam9H3/baOvx8v+hW71FjeVhjeP4Zf7i5jAXiVxDib9
	AZRZy4WFMSWQn85Oa4xCMoF3vnMbaREqEni6UJwv8WZO6288l17PzLDQtVZg4Q3DDbzj515bYSL
	RfY33buycShjWznqrzcEVA2o5QeD6ZZem0KUPvA==
X-Gm-Gg: ASbGnctydCo6Ctm9uISkXILu2YzTfVs1xvHn1YlAMpr/SG1JxXiOuUPt8HEN0VSRn1t
	ThUglB9dmI26E2wgCjUsVbnoSIJvnI7QWUu+PdvX90Iu73CGmJ1Vhi5BBRvGXVitC0WXxLKE=
X-Google-Smtp-Source: AGHT+IF1+dEqoORyKXu66dB2Rg8beCQhSwmnjjgQuD2ZBI10xzxpJ4Y1Rzbu+lgFq2AzogQw2HBplK2cVN2+wBMuIPk=
X-Received: by 2002:a17:90b:368c:b0:2ee:ee77:227c with SMTP id
 98e67ed59e1d1-2fa23f55e0cmr18756882a91.3.1739196714411; Mon, 10 Feb 2025
 06:11:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207-pre-ict-jaguar-v5-0-a70819ea0692@cherry.de> <20250207-pre-ict-jaguar-v5-2-a70819ea0692@cherry.de>
In-Reply-To: <20250207-pre-ict-jaguar-v5-2-a70819ea0692@cherry.de>
From: Jagan Teki <jagan@edgeble.ai>
Date: Mon, 10 Feb 2025 19:41:43 +0530
X-Gm-Features: AWEUYZk9JtE8zrOo2lYnBOq7Su2RsFQcHGdiZcrSSTPxmQcqmii1TNFikv1yH9o
Message-ID: <CA+VMnFyom=2BmJ_nt-At6hTQP0v+Auaw-DkCVbT9mjndMmLKtQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] arm64: dts: rockchip: add overlay test for Edgeble NCM6A
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Niklas Cassel <cassel@kernel.org>, 
	Michael Riesch <michael.riesch@wolfvision.net>, Jonas Karlman <jonas@kwiboo.se>, 
	Dragan Simic <dsimic@manjaro.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Feb 2025 at 20:50, Quentin Schulz <foss+kernel@0leil.net> wrote:
>
> From: Quentin Schulz <quentin.schulz@cherry.de>
>
> The Edgeble NCM6A can have WiFi modules connected and this is handled
> via an overlay (commit 951d6aaa37fe ("arm64: dts: rockchip: Add Edgeble
> NCM6A WiFi6 Overlay")).
>
> In order to make sure the overlay is still valid in the future, let's
> add a validation test by applying the overlay on top of the main base
> at build time.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index 534e70a649eeada7f9b6f12596b83f5c47b184b4..02f98abe1df10f44f2ac27ea5f6c6e6c6334724e 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -192,3 +192,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-vz-2-uhd.dtb
>  rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb \
>         rk3568-wolfvision-pf5-display-vz.dtbo \
>         rk3568-wolfvision-pf5-io-expander.dtbo
> +
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
> +rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb \
> +       rk3588-edgeble-neu6a-wifi.dtbo

Please add neu6b-io as well, wifi dtbo is similar for it as well.

Thanks,
Jagan.
