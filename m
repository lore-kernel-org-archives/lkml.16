Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C882224891
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744788595; cv=none; b=SsL0cnJouO4Dx50sdgwPZnutZvf5hYvWlH6KNHyeUarxHAx1P9uEe4CbO97u3eDV0ndoBPrteU3hUQKGm9ncL+vOj0IC1+V1eu4p78zSBgUh0LijJXJxdXLep/8cWl7IpUbf+iZeH1PHdJ0V62eIXa2Uo3JX0mue/g3ohMLzmZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744788595; c=relaxed/simple;
	bh=Vu1Z1iNyXH/P0QywYALzynooSIZlETxbTzFpRmXM8t0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NW3amxKCrjGuldpuO+MKd/zZd6Mfo9P/wgOZsKxXn0KWcHKtMm7bWudwLw/CzCEGoMYaoFVYeWJYG6ytD957GcSXTYbOA8JxtAnlrV/yHt3Xlc48DsJoM/AsCM4V9EqSVJn/zc2/WL8x5xhH+GuIwozP23TMtrjTLwcQY/z7V9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VB7XOpYe; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VB7XOpYe"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-548409cd2a8so8408423e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 00:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744788592; x=1745393392; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vu1Z1iNyXH/P0QywYALzynooSIZlETxbTzFpRmXM8t0=;
        b=VB7XOpYeXsxjQYFLpY+qLwHfsWEoE8mvq5nvMYY9gOwAUhDfBFuiXlVz6OyucCQ9Yb
         Owmppq6GCgwfs15BbC8baenIljnkyh+QMbI/drRtn8SXhCSuIrzIKaHlnlXl6VwBNarT
         KS3Jm/Yo/M8F6ghW5Mv6fe26bYa2TvaLG6ezcehUK7SxLUBdwq5vxRvjy3N8kd/0i1tv
         Hbf91iHoI2q69z0TsAyFWncxv5o+PD8XLAesJWo0yxCclKnpL/6rfy/jzaEvq0WIAm3l
         /c60AwJaehSh+cWrsg0NPrQw9T/VV8RRO+MtSDmtgbH97zj4FYeEzS5Bsd2p4DxpYN0p
         M50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744788592; x=1745393392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vu1Z1iNyXH/P0QywYALzynooSIZlETxbTzFpRmXM8t0=;
        b=AosuhkvrmQwrYau/Qmd1kpv9Wup4D63uRRn0zbnoXSaF4oTgxdavYaT11mm6+2CGYL
         GHDHho0s0WC603KVnlqdt83J5PTZ31KTB1ruFKhiXPEGB/eChR3UNfz2fO7HZBydfi5e
         zPbRHPK0vdVatwg5L802NvKwea0F/XCWjBOup86DEDlUSjyOhMnFXFMHAapB5AdzFQL9
         KzoOZP6QSTuVskpcnVgnYSSgB5vk3g7U4wjT8qO8+ba5ZQtpJi0UhWjVOE5cKAnQ5ch1
         jKyyqL+YZtfFdetaVtfqvpvprPh/ZRxgHppXtndUYQBYw0W7+ktheA35FEgGRJtDv7kk
         2chA==
X-Forwarded-Encrypted: i=1; AJvYcCWw/7lVCEoGYJ9d0qHwGPD8SgKyNvXiMpGc1SofTxM9LXAFLPguWH+H3Rub8hPaAj+UH8t/oB1kSOAkcMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHBZF+VB5oFFZG4em/z0hoWvWO1a64FMLDQ87cQSpRJ/w/D48R
	lyHtKW9NwDqFJXQTMaXtUoy35KEhQdyoo/GKiZzUcqJTR53CcEHvzqSgSuW0bKl2hZge8t5tiq9
	BZT2oe0pWb+2AQg/vkCVp+G2XRpFGk48qe7mwm4tDZTv2B+N7
X-Gm-Gg: ASbGnct5Nd5/AIIM13Kler4K03KFcJA95M1MMDLv5dHUgSvy/UE5hXBWZhvTZLUmxMV
	uv0Vo8Lj1cqLbnOT9MQNnSQTzG33NQTL3z+j9Ey7qm7BffJwG+N8Jlf84MFd7tpXrtgjOfCJAEk
	Xu5dwWhrMAywUwK0icYCg0aQ==
X-Google-Smtp-Source: AGHT+IFIpyoa4b37GuE7bShcO/RCUjBlfmU/mTjYO4extyxyEAUNDPyqKbiJFcyUDnd++AOe+MPmtXvLY9f9jwMpHVM=
X-Received: by 2002:a05:6512:108e:b0:54a:c835:cc4b with SMTP id
 2adb3069b0e04-54d64aea449mr196703e87.45.1744788592107; Wed, 16 Apr 2025
 00:29:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415112339.2385454-1-wenst@chromium.org>
In-Reply-To: <20250415112339.2385454-1-wenst@chromium.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 09:29:41 +0200
X-Gm-Features: ATxdqUGsaRj7mRwORGwu-YQfJxqBlwgA7akp1LopdnGat1Af2KKfApGkes9E8jA
Message-ID: <CACRpkda0HVd1auh1zmyX8QdDCL6jNVb+JYj7hbZrdg+v26BQWw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: common-v1: Fix EINT breakage on older controllers
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Hao Chang <ot_chhao.chang@mediatek.com>, Qingliang Li <qingliang.li@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 1:23=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:

> When EINT support for multiple addresses was introduced, the driver
> library for the older generations (pinctrl-mtk-common) was not fixed
> together. This resulted in invalid pointer accesses.
>
> Fix up the filled in |struct mtk_eint| in pinctrl-mtk-common to match
> what is now expected by the mtk-eint library.
>
> Reported-by: "Uwe Kleine-K=C3=B6nig" <u.kleine-koenig@baylibre.com>
> Closes: https://lore.kernel.org/all/43nd5jxpk7b7fv46frqlfjnqfh5jlpqsemeoa=
kqzd4wdi3df6y@w7ycd3k5ezvn/
> Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple ad=
dresses")
> Cc: Hao Chang <ot_chhao.chang@mediatek.com>
> Cc: Qingliang Li <qingliang.li@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Patch applied for fixes.

Yours,
Linus Walleij
