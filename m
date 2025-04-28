Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B3627A108
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857304; cv=none; b=AVryTg9xdZOKs1nmRS594lsbAqVFeAqpeBDwLfz+UYSN/v/cISz1/fHxZpwKViDsd64YDleU8BU27YZ7rk5WNcEttI9o9nKv+r0kUhgd72cFVErx82X0XzD8Ut8QzdKslb0I9oIOqt1W2usBtwJId2O53/humIVhf+6bmt4e2/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857304; c=relaxed/simple;
	bh=auYuhBEBTtdaYxBsQTyC1bAABv5AWq9SeRu6eAAMBK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f4uZ+kazPmMmMivzp37otpPEDZmjAI1qdyzzJQ3rJH103Wx5BeYngO49+/8SghdAlRfeLVHpuj61pKLqDngQPKs2iXe+2FQxqBgvNROgQdGN3okq1RPOVWeX09XueMsk3E32FFlUrOqSfPQZffNf6iqaTkPAp1GVp5ucRZ69jeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G+cBk43u; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G+cBk43u"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-703cd93820fso43049497b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745857301; x=1746462101; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ozyYaD4uyMvYAeC6ThRYIW6+h6QCpMFE1Z79BTTe4Ys=;
        b=G+cBk43uXyde43df0g/psr/69DICK/8s6E414h3WEvUL84teCHmmGtkm5uFlOHPfM/
         7XU1z0iHJGJhS2oxCrvvocQsIhF+jIskBWAfqWlBptYCQydy+q8enOjMTHzluHa/srEz
         DjrVWfQegDLxAHW0+e8xj1Ae5QkGJGSDnVm5OzmCC9skYJMJ3hFPEEn6u7nv+FN9po4S
         bPgNNqx1kDNCgMZ8oUO47PDKwtiNEoGillr2ery0eSqkh8RcFRCEbYZ3HZScWQlNxZ1r
         rlbwutJ5gh3QmeDPczZPLEFLCygXwXaP1yyLSGGstjpSyZX4ylWCxsgwrfBXrPB3rAWx
         3rMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745857301; x=1746462101;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ozyYaD4uyMvYAeC6ThRYIW6+h6QCpMFE1Z79BTTe4Ys=;
        b=fWIvF4oEX17cwD0B9U53hjXPAS7Hdqy2RcSE56SG4L6J5EHfWMwC7Ykr8JhwNgIYiN
         HvLfo1IUwGFrwEU5UBog9lkkRLrytQzK8pXiUxMNGeds0IjgA8qTFov2weMSH1MWf5Ng
         z4vBGOGy1Gn3U3f/N/syZ+xktyUfLbKMkJFQj+nO9KR/usg6xQT1p1WuXfbMY5AfSmBq
         fJIkz2I628Si2eufYAEPWgemL4B6ko++y3zUkVXl4LR5ftjvaAK4Haz0UYb0nFFfxRr2
         FxSk/VO8oWKPBPpSaWl3fyjQN4J4RyfU0mmf/DqcY9cApTZTloKk9RrF1NOZ98DLSu/3
         trdA==
X-Forwarded-Encrypted: i=1; AJvYcCX72jdnCbFHQQAh/hmlW8s2rvbZ5PdlHVFvWFfh1yplqJ72NzHgYR6iGgR5MlsKNsW96Esx78y5KdndwrY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGqC05HOLxzfbkMvdPZSCOayUZIzFEUNfnVbgXITdfa/qFwo/H
	xTeuwpoZ3GP8ZGWlgsUj5/gSSH/dcCUByQUHgxWUV/0hS4YUVj4BWyYgFmpMMdUOuCBC1QOcTmB
	Az3c+n8xpaQ/QE19AF/K1FeWGgGQP3pyV5BFsIQ==
X-Gm-Gg: ASbGncuQSO8gH4erQIrttb4jXcEwaxbA2Vg5+3xhsW+++OgY78lOpkyW16XOoY7GE+P
	TX+5JGFtjHSYWo9ZDdiPlRC8WdmIBbuM51OT1TZddIEpd0xnSWw6r730D+2bPhEOC/i130dyq6h
	fVitUOOa8MxRk0pyRXBdsiYa4=
X-Google-Smtp-Source: AGHT+IF3Nj6mWpTWBj/+o4tJL25s0CN8hYakvk9PwN70OV0ov5/0UD6xzNyRF97ztJi6m2LHGnOwz76IAO3Cf/tDFG0=
X-Received: by 2002:a05:690c:7304:b0:708:170c:a699 with SMTP id
 00721157ae682-7085f239adamr122430517b3.27.1745857300782; Mon, 28 Apr 2025
 09:21:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416120245.147951-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250416120245.147951-1-angelogioacchino.delregno@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 28 Apr 2025 18:21:05 +0200
X-Gm-Features: ATxdqUG1v-Vp3M3iAycu00z5_FRl29-cbPTsX6LqWTtDPHUaj3lI0F-RZsKBbmI
Message-ID: <CAPDyKFrjaEk49O4T1dfaxmA1OSsFaF_iH3U73mq-fWnbBiRaVw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: mtk-sd: Add support for Dimensity 1200 MT6893
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chaotian.jing@mediatek.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, wenbin.mei@mediatek.com, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Apr 2025 at 14:02, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add a compatible for the MediaTek Dimensity 1200 (MT6893) SoC.
> All of the MMC/SD controllers in this chip are compatible with
> the ones found in MT8183, but do also make use of an optional
> crypto clock when enabling HW disk encryption.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index 0debccbd6519..6dd26ad31491 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -32,6 +32,7 @@ properties:
>            - const: mediatek,mt2701-mmc
>        - items:
>            - enum:
> +              - mediatek,mt6893-mmc
>                - mediatek,mt8186-mmc
>                - mediatek,mt8188-mmc
>                - mediatek,mt8192-mmc
> @@ -299,6 +300,7 @@ allOf:
>        properties:
>          compatible:
>            enum:
> +            - mediatek,mt6893-mmc
>              - mediatek,mt8186-mmc
>              - mediatek,mt8188-mmc
>              - mediatek,mt8195-mmc
> --
> 2.49.0
>
