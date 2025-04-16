Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6C020F08C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744792618; cv=none; b=tL+kzBGgTd1wqHTmV7R7JLaNdrmjOrWPrhdaZwAqxIW833+hkv7Qf0TEJf/OzHryY/DN9rPDIF8VnaKy+pFGmPJRZhAEY+gUNYX71BGJX3IeUtlXwzows2mwHezSOi0TPnsuS2i2HIwn17zjuthOdce9Ht5B2IjG8CREWrUdg0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744792618; c=relaxed/simple;
	bh=DXCImHbhgaHYD5NXAki2E5LHyVFHbeqj7RL6q2PIT+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z/DlIvzbbmrMXnbnRknxS3mwCIzIcdzw8990xhlE02nieOAlsaQvkFs35W56EvPYbdkFGrWLT0gPcqhAwK+YYZnCFEZYPqaEprTS2OYhQBEvOPBlQ8E5qjIKYH0TQoLjd+UqqAWcGb8oNZrx0wan1BJhK02rpVrg9Gy5LTSaDBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=baFOoMUz; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="baFOoMUz"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54963160818so7881062e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744792615; x=1745397415; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXCImHbhgaHYD5NXAki2E5LHyVFHbeqj7RL6q2PIT+U=;
        b=baFOoMUz3UUr2fIPjRVkp0kpSh2jnrjfyFWgmhHWHF+V+sheqtna0Xa843SdB7hKt5
         zH93FiQ69Awgke61GfQ80jR0QUkU3v9WexrHd3qjLYcELh8nlroIh5QQG8+H9QJH76tp
         Z3Xf4NAUlxJcoHdH3S14GWVxFSQMhyq8UkBhMuvgue4pq/RcCi/L46KTaPyXVVgHHIZE
         DXmf9fb3NgeDq16uOJ0bxEikAY92w38O7EQBEW5mr7WLw97VZnajZFq4D7x0FRSQAcjt
         MEcKg3A4gJ+IRZeyIZPZ1OLzVxTW85eXoKn/sFeZly+nJNr9l3CT9Fo+eLay5xTEyaJ6
         849A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744792615; x=1745397415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXCImHbhgaHYD5NXAki2E5LHyVFHbeqj7RL6q2PIT+U=;
        b=gCvgEezF4Y9ICsjD34WT0NYWkZoFMEuqNxwg4N1hpkdtiglaGXv9e73QGgNbg7whnw
         WsRqYXolFGHyND44xvR2BLOxCpHIJGVAM1J8FpP0wkcSgHtv9f/kERSKikcASz7sXciB
         X2uSy7GRoh7fcVYHTBkeISaS2GNuIxvjwm1G3Ito8Z2WJaDbPyM0wbCisGpRwnhtr79r
         rParchHdOVZkCdZzIW1fCH/5MmXtLWWFY40PHP3VjQ4HP2jpDhc3MBCoNXMXsvomXiTJ
         v/1IPvZa7f2wMedadA3acp6ewZ0RZ1wm5ne1fxgZl1tDDAHTAflwg8vGfJx0B9orppLU
         IkZg==
X-Forwarded-Encrypted: i=1; AJvYcCXr3T1hSC2EBE3pZOy7CYaqkk7FiuBWPy/Be+LJ5Q36UkJpdR4X1KouCgMtS9MjVWYTSshwlim2erpv2FM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJwnZ0V2h8ciTb9sAcsKmwWc9boIrVaYU2RaKPGAlPb1jGfarc
	xnj/EbtEpYBIs2u3g+XmV9aIRO17Dwa5tB4z6TLfnsqqnj9xD6YNMntY0KweXEpcjju9ijU/Gr7
	td7NUYeim2JD6LCqft2+egPQ89f9fOBsg0NfYcg==
X-Gm-Gg: ASbGncvBno7LwBh7Q4aOs1teJv1VPMHe/JTeVPwIhE23onUOJTvynYRYm/1sJ7BnArh
	yyt3SeqaKn4HKuB7koNaEeWnWKzOUDQ0dbkdob8/Lx8feuIRTX8d/QLKY87JInhjh+ZTRC+GlY3
	5DZlxHskDV6ZUADYzdt8A9mUGHKx7Icd/1
X-Google-Smtp-Source: AGHT+IFnTyulj/0oGbeIikzilFJSE7sEuMb0JSQLD2qCkdI3QvGlZH639PCmqr2wKnbHsJXFbiOa8zKp3Mk8GGtQ/fo=
X-Received: by 2002:a05:6512:3d02:b0:549:5802:b32d with SMTP id
 2adb3069b0e04-54d64a7ae44mr362901e87.3.1744792614952; Wed, 16 Apr 2025
 01:36:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250322035307.4811-1-ot_chhao.chang@mediatek.com>
 <20250322035307.4811-2-ot_chhao.chang@mediatek.com> <43nd5jxpk7b7fv46frqlfjnqfh5jlpqsemeoakqzd4wdi3df6y@w7ycd3k5ezvn>
In-Reply-To: <43nd5jxpk7b7fv46frqlfjnqfh5jlpqsemeoakqzd4wdi3df6y@w7ycd3k5ezvn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 10:36:42 +0200
X-Gm-Features: ATxdqUG40hdym0n5Q2fxGBsUSS0OPVO8ybbpsBi47RVMjHapZZipAk2JRY_FG-A
Message-ID: <CACRpkdbhGJhmNhoS-rqWEtqvH=D_2Q2+djaXWmyEu3o8UEcaZQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] pinctrl: mediatek: Add EINT support for multiple addresses
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Hao Chang <ot_chhao.chang@mediatek.com>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>, 
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>, 
	Chunhui Li <chunhui.li@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 4:57=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:

> this patch became commit 3ef9f710efcb in v6.15-rc1. It breaks booting a
> mt8365-evk.
>
> With earlycon it's possible to see a null pointer exception:

Argh, does this patch fix it:
https://lore.kernel.org/all/20250415112339.2385454-1-wenst@chromium.org/

I have applied that one for fixes.

Yours,
Linus Walleij
