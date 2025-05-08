Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD51B224AF3
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 12:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746708888; cv=none; b=Qoe7VWOOQNGiLd1ZNoFcmtQSA8xGTyBSKE6CzkIXcuqLYsynbQT9fhodv15CQ37hvGpvL6o3EDJ6rg375/CU2614v/JP1/q4/qtmO6/0pyNK11WodYvpnYPUDyCCjjb+gqZYFXr4/E27d57FSEncrZZthCHF784Ee2utehr2Uws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746708888; c=relaxed/simple;
	bh=Ut5s6R9tRw13gFju4bD7gu9d90vFam5WdykQvgBBp4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rtQbLsxcpXFH4lJnjiryO6c1SrQLcGmUejPS+TSjjXCFWmGsze/WfpPsRTNgl26DYp1VJ47ZNOGjHG/SXhlHhxO9phaXdohI7Zd652fAjkEej5NnqDwFyW+6IEgUggVJqtOGoyZHTEJcc+THExXqmVCeJSCyHN9kE508VaJd2PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x+GgUCd+; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x+GgUCd+"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30bfe0d2b6dso7985951fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 05:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746708885; x=1747313685; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmSnlmxJWeeD10oNDjS6EnBGlRIgti7Si5Ae3x1v+G8=;
        b=x+GgUCd+J6wA12FZ8BvNl7PSD7cdI856uT9enxa3iFZ+RE4L7aM5PQzWQLvI9ay9rA
         5ipU105qYh2oZlshkExvYs3ljKKgd2NV48Fo0A1hr+UYnp/2Zp1iezhth7JD4GSCk0xU
         oLyrtby8lcPh0AGkeNN+BOHLrn//f9U7AQVbNagp8PB0pUeZUZHx2BViZJHc2CJSegdQ
         kNwXY3eEmvwKQg8Hp2p6cZDG6VMvIMiU1fU42WxuZF3+otSEsTrudbpgIiwFvEr2+pCS
         qA+0uuX061HqeWySw+P5AFxeiReq5f05h+XR5BIkg9EHJrct16d75SwTq8Dpz24IqCGe
         wU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746708885; x=1747313685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fmSnlmxJWeeD10oNDjS6EnBGlRIgti7Si5Ae3x1v+G8=;
        b=MpQX2gQg7Dw/fZjZIBBoAB59vjzdYq40Vvqk1wcKB6XjbjlUg7ffppb7KNbf7XCbbG
         EEOU9zaFa/kuj7jKWDzb8AENzKjbjdVprQXs1FI+9h2GIXaghJPd35eGVDk2Ve97sgep
         zQtj/Nrju2RE9VXRQLoOCobbSS/Ssi6XvJ8DINW/t/R9daZe4Jccf9I1UqPCouIUaXzf
         l7w6LWcgml4rGKUSO9/hWHl93A+4JESoYQLOBQSyh546KQ1h1Sc5vY11fdGMywa2zbqM
         eb+082O6fYiKxchfoSdxMlAMdC1uQ1m0vQRQs7uUOPkwlcqvsItmjnhc+Jg4P7sN+Ljh
         6I7w==
X-Forwarded-Encrypted: i=1; AJvYcCU+ezAM2Mtp2HmklGEPfqLKfDNHjquC+AVuYj8yDsMqmLAbL8t/uBSlmH97ZGzu3uIcicr/SNf6vx50+w4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza486JZF+RQxRJbRtxcaDcQ98eZ0pwsgky0iEfUM0VcIhjCVvg
	1vg8wFj6MKQYWXt5o3FX5w6sU6Xkyhf33mW+VBXiT0KC0b+Iak4/5rEQAAxVBL//vstEe/wdWCy
	ujdTJc+Rg6zklTsXj+0xmujzqHxWdr0mu6mL6EQ==
X-Gm-Gg: ASbGnctHV1KV+QiZOu5EfCk0vdAgTzPxn5K2SYkTRTz1mFYT9ZNGBI6V1RqFscYwwRG
	nf5IipS+MgPoW5cmTJLNyB22iaIjhTOIWFGbIDHBFJxXNMdPpN0T5SLzK43Q220KJuPsAen60sJ
	fvyMOJNCZ4qN2qQGTMqu1pUw==
X-Google-Smtp-Source: AGHT+IESDSB+M6cQqQKoi1no4CUO3/t7RnhD0N76Oc6h9qf9nOOdCGVN/uzMOa2kSVF2KTBgdhb1HyNQNUQQ07MCqDY=
X-Received: by 2002:a2e:9fc5:0:b0:30c:523a:a84 with SMTP id
 38308e7fff4ca-326b88af180mr10273841fa.32.1746708885003; Thu, 08 May 2025
 05:54:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505-sm8750-display-panel-v1-0-e5b5398482cc@linaro.org> <20250505-sm8750-display-panel-v1-2-e5b5398482cc@linaro.org>
In-Reply-To: <20250505-sm8750-display-panel-v1-2-e5b5398482cc@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 May 2025 14:54:33 +0200
X-Gm-Features: ATxdqUGekggxGo4UYqHnYKuHD3Y3vsGE4-NVmxpuSSBnslo0v5IlSxfK1_TPjro
Message-ID: <CACRpkdZi3ryJ_D6NYaLS1Cmevp-Pmbdq6zTL5+a=cmXNq42N5g@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: Add Novatek NT37801 panel driver
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

thanks for your patch!

On Mon, May 5, 2025 at 11:16=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Add driver for the Novatek NT37801 or NT37810 AMOLED DSI 1440x3200
> panel in CMD mode, used on Qualcomm MTP8750 board (SM8750).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

(...)
> +static int novatek_nt37801_on(struct novatek_nt37801 *ctx)
> +{
> +       struct mipi_dsi_device *dsi =3D ctx->dsi;
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
> +
> +       dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
> +
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0,
> +                                    0x55, 0xaa, 0x52, 0x08, 0x01);

The above is obviously some kind of unlocking
sequence to open page 1 of some vendor registers.

We know this because the exact same sequence appear in
panel-innolux-p079zca.c  and panel-sony-tulip-truly-nt35521.c
and the last argument is the page, so there we added
a switch page macro making it clear what is going on.
Could you do the same here?

With this addressed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
