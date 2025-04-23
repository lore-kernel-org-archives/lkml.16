Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4C71AA1D9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406000; cv=none; b=g4FM69mZCWDSWHvdyh783WYtEGEOTsEwIo0cgnH5R+QLQ0wWE0+EZ4oEqoYjJTcjFIAMkdhuFbGAbQlG3x7efrs5+8mEBZc0qj952/mSCZc9VJcMrn2k/XRiS8IGHtPdbTmkGKYgWa1VP3a2DcQQOpi/lqTMp3YR8mFA+sZNlDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406000; c=relaxed/simple;
	bh=1yGreJeglvKuZD0fGUj7A/qJS7yybhnwZk+WL1e6ipU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eJIQa9ujKHlwJCTxtozAOR3+rNnvun+WV8WSnF3qzhmP2r3C13Db7+oRDX3Tr1wIJMb3ZQ4Ex2SKuHob0xDEAvPqG1M45p24y9SIUZ/RRPaNQgTDE+minA1dqL57VPiqKyD0apdzN4DIhb0PPRTJzWia8n7Ib4fXmmwZWzHxwJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cy6m4utv; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cy6m4utv"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54acc0cd458so7278892e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 03:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745405996; x=1746010796; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3cEhVrVTg0kZTdvS2evoNFsbjUG4Yiqw/nFRP9UnlM=;
        b=Cy6m4utvPD+xBdA8LKOxfUSQIZ5rteDxmHyOiMvSAxr53hJvFrTIx/474M8UqPF5cU
         8GNQifmjLVE6I+R/JOP1C17I8iACQC+byTCBSyoU7seymtXbPQRKyCRBVDwHN+9L4tUM
         pxxTTrL0NnQLdWLb4W/MyZ3Hhg8NCl72xBThZtmkBh5jQhcLS86knf8AohtXOxRKrMhe
         Rgz5wQwE/4lH8FB/8fsLqEX/Kd4FUBP6Aqo5IJ0bzOKnw4EjZCvyXTJwkPl86jaJB7cs
         pbIooZVG0ZM9ldKfe/9Icuc+KbHA6y1jBX1fWPgPTHuLDn/ufuIgkO4hSZYcM2oUpsLv
         q+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745405996; x=1746010796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3cEhVrVTg0kZTdvS2evoNFsbjUG4Yiqw/nFRP9UnlM=;
        b=gk2SPls82qxYEfBtAgX0bycRVnydBXRmhmB1nljI/KFAqidHGzOE+IkPeaIj+B1Jud
         McH5wvoAXegW8xtxNXxD7Oh8sEt5KwGsRTu5PyLbjrmX6QYmXlUswL7sDZ5JUduKGn4Q
         ZNJS5RFy3RwhHwBErqnxVOhFLBa+ooUzvjy24aVvBf4W3yIuqhoSfR5f662zHIDzybbA
         R5e0DXL0U9GysAQ16Vj/R+5C+3g5S5yRJ4nvxR5NAZvMi//VOyr6d36ml+GJGCA6CbA/
         E4FJQ4piExH4ZiEH+srS5WrnEHA8SCfltg21+OYUAXixtodJJ6eOTvUOqFKlGbSGPp8E
         R0LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVosnhPDD6xlb08t7gDSiNChLViD0yykz0TvwyNg2G9oIZclSkSujp//kx45cp2Y/lHMZJUsa5nZqGeIKo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwmiSeLP/mYvs0iwtswaOcZBsXMdwKQ+/ZnB88hElQl3fEKhlH
	9/TiXCuoZdfj/7WQqvSsEceoReLaYIK09hc3hsoOf3vNm6kWAyW0gAc6H/lzpVI9Pyacujr6cDj
	qMZQ01qkmWJfUDHvmfHd1+vCDaW/f5pNOFMX0Dw==
X-Gm-Gg: ASbGncuj8zcenuNolfdvRsBciG8uhYnEuOHlxCbVAX5j0gqrclrkdhyBCA5Gdj0AL15
	YwvEezrnctzDFmgZQjLhAgncsTBNpejW3nNFTXPRClw0niWkImp88g/PdxwVooSmRrWXZDCs9t6
	SV5bOEsDw3Fcz6rdynmg2v8w==
X-Google-Smtp-Source: AGHT+IFtzLtF0BmAxKelCLV2/wocCla2vyxucaLxjvgEw30Sch51eBsux5LzRyNp/HGiwEeiD7kURWUr//rXX69Cxn0=
X-Received: by 2002:a05:6512:318c:b0:54b:117b:952e with SMTP id
 2adb3069b0e04-54d6e66cbefmr4418385e87.55.1745405995686; Wed, 23 Apr 2025
 03:59:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aAijc10fHka1WAMX@stanley.mountain>
In-Reply-To: <aAijc10fHka1WAMX@stanley.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 12:59:44 +0200
X-Gm-Features: ATxdqUGhq-8Df0lmzkXAKLmMqiEIc6uB0ArJmTsIwn6uONHy8hOiVyiU37DBzSI
Message-ID: <CACRpkdbLwZuFKqLvdkuCodQrNb5h-W9567eA4CLOP1FrV+PbZA@mail.gmail.com>
Subject: Re: [PATCH next] pinctrl: mediatek: common-v1: Fix error checking in mtk_eint_init()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 10:23=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:

> The devm_kzalloc() function doesn't return error pointers, it returns
> NULL on error.  Then on the next line it checks the same pointer again
> by mistake, "->base" instead of "->base[0]".
>
> Fixes: fe412e3a6c97 ("pinctrl: mediatek: common-v1: Fix EINT breakage on =
older controllers")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Patch applied for fixes as a fix on fix.

Yours,
Linus Walleij
