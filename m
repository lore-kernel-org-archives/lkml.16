Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9D6296D33
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 06:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747289650; cv=none; b=E9809NjQE4Mg6Ns2FuhTEUdpBaAezp48FM7fqq0BLiixgYcta/QX3B4I1Tzlh2uc6R0bwWyq9MoHYtZnk+k47rimSKRRe90sZCOjVDuLXkKza0uNA6dMsN8J4ueVlj7NBA4uRrJOTztSJDDURObU23xOmHEf9thpAisNrbzIHrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747289650; c=relaxed/simple;
	bh=9gG1Y7Kjrhw+d+YVcGUDhhLiFXFPZgo9Mlb66jMi2nE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uviHVJQiNJQCMR8HHYxgkFjGopckmhFUVmm+WUD/uCeH/hgyDckbtDd7sBt6gJWechMIZrk08uqRJkRHFEyLAe8FxBK8lEiP9aWWAMjuw4DtO65t5Vyt0WUSim0HOcoHhNYXp+Q0zf0Ip0clVm3iehn+O7BudH3eOD/hqJh2dhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IKe2QOfX; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IKe2QOfX"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so561145e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747289646; x=1747894446; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drNlR+oPu307Cld2c2bhZ4PbduC0VAwweKZySGP+xWk=;
        b=IKe2QOfXkx/oukI2M4exAgvqM7H7UV+vfVjcpQ9FynYt0txnsVW0km7SG2wrSIN1ea
         YzHHvqdy8Qu7g6wf1k0Gksvab6r0mt0JBlkLqRRc78bcn1cFjcCUB2PcgAJQBQ3Y9OS8
         T5q51keQFxvi/zzT2O5CKE0jSpkNcTkdqO9Nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747289646; x=1747894446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=drNlR+oPu307Cld2c2bhZ4PbduC0VAwweKZySGP+xWk=;
        b=Wgb3s//hFf082Oh7g1qe6spsvve4rs3DBTtu5hR32ewPx0EpqMlNcv7ZI9+Np9vnAb
         J9IsunHKEor/f74lFydZjxPhjtt6K7f7JZ5NGsgw1VuL19M8EGbiDLm5rNpH3rUW6lvp
         DqXUNoIuk6/YAu9cRcn9L86MA1MHSB6sexgPBsS5j8/1k18iyNRgELZFr55TVepcpV5N
         Go7saz0fPN49aRbrOk1CKVp7KJ/H+b0ZAkbSS4pzAanL6LyUItPaovlFU2z1SN94vWTP
         8qgK8KM4z6AUwYN3g2cIv1087KAIzw918vh8mmMEN+tqiSi9QQx2KtTxvemKQaI6NQ8I
         JhPw==
X-Forwarded-Encrypted: i=1; AJvYcCWxDPaibhXjayWZwy75nNP4Nv9uwSLb7VU6dxTDpN/HvowDA1M5IXPHI8zyyJR2vdHBbrSD/7gU7EU1rrk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFxiV4GMmXLhCemGs5yIvX6f/mKlLfmZaZdYUipT0wIVHgGlrn
	cG16HyF/MIv5C9Oy4ulfkHGJIgkCkfYH9l1ZBUcvLeeefgUzQ8qaSf9Qy0r5+PLJuVhZsUX5SMs
	oROY4SE+uA4q5q/mqs9GOuMdk/ZhDnL8yVqG5
X-Gm-Gg: ASbGncsDVin5M6uqwCp9FHs5wcPXQCP+tnZyD+Un082TJZUhuoYM+1q9Hr1tnKDa6HT
	32+vZnKJilo6yyFZfH0oHNfVnWtdTM+OQE6BqLTZo00Lo7BN1icpgba53woX42jUldn879hjHRz
	WeKiD6Qvpd6kUTZyxRjE9Hgy70F3nTN5vwONrF8ZbxxDERQTEIJt5k2lrj/DiWAn9TLlQAaio=
X-Google-Smtp-Source: AGHT+IH6Tu1s7qfro8eTjpXXBa9bg/YMXFMFe0rGRv+AYRa3osr+ecXdrIFoJAbS7ovq5tmuUpU4zvFeFidf93w3Epg=
X-Received: by 2002:a05:651c:1993:b0:30b:cd68:b69c with SMTP id
 38308e7fff4ca-327ed09f95emr25687631fa.3.1747289646393; Wed, 14 May 2025
 23:14:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425082551.1467042-1-wenst@chromium.org> <86b55c96-7ec3-48ed-83b4-f434d7fcb5c2@collabora.com>
 <aCSqWbT9t1T29HT_@finisterre.sirena.org.uk>
In-Reply-To: <aCSqWbT9t1T29HT_@finisterre.sirena.org.uk>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 15 May 2025 14:13:53 +0800
X-Gm-Features: AX0GCFsS6xRp3ubfx5sogziOmFxZtWhFobfvOPwhpAASmoDhOKkToNpIA5VukSg
Message-ID: <CAGXv+5Eq1=TqhZmdhNY5H1s52omit7CZhNhYpRddcJAxGN2P6g@mail.gmail.com>
Subject: Re: [PATCH 0/3] ASoC: mediatek: mt8183-afe-pcm: Shorten source code
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>, 
	linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Darren Ye <darren.ye@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 10:36=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Wed, May 14, 2025 at 03:49:48PM +0200, AngeloGioacchino Del Regno wrot=
e:
> > Il 25/04/25 10:25, Chen-Yu Tsai ha scritto:
>
> > > This series is meant as an example on how to use macros and range cas=
es
> > > to shorten the MediaTek audio frontend drivers. The drivers have larg=
e
> > > tables describing the registers and register fields for every support=
ed
> > > audio DMA interface. (Some are actually skipped!) There's a lot of
> > > duplication which can be eliminated using macros. This should serve a=
s
> > > a reference for the MT8196 AFE driver that I had commented on.
>
> > Sorry for the very long wait here; the entire series is
>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
>
> Unfortunately this doesn't apply against current code (I guess due to
> development in the intervening time), could you please check and resend?

This series is based on the other series that I sent for reworking
reserved memory, in particular the patch

    ASoC: mediatek: mt8183-afe-pcm: Support >32 bit DMA addresses

touches the same parts.

Since this series is ready, I'll rebase it and resend.

ChenYu
