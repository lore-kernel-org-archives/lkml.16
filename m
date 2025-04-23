Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9024F2F50
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745397769; cv=none; b=Y4DpEGF3wMBU9LLbcMfR+hB++BLsggaUziqbSVAwCnJgMTvTj0io01fZSOExhMwpv9KBE1/DHspgFcR0cQR+RchLOHNnaiXmaCA2l71uIHy3XbKEtUmfaKDUS9XMhP4R6RQ/0NrAL7epIylORBJZx1+42UHa4gZkq7J4MM1rlEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745397769; c=relaxed/simple;
	bh=ECOXHvPy1m6u83HyWp0b6PRWuYparDalOzZlX1hnZOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a/ptZxU4+VhJIFxfKNWyf4r41XGCkKCCmcbIcW+uIvV5nA+2Ns7IM3jXcZJK+D608hZQqT3U8nxw6cgJhG8YTxVRh6gX6o5dUdWhlkMfWBTUaHolijZQFEmK/E2q0dMQUJV2BdtcVQBC0XLq55aRNxxrtiLlG2zmVqJFgetig9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q8dkRrXC; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q8dkRrXC"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso7984867e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 01:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745397765; x=1746002565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ECOXHvPy1m6u83HyWp0b6PRWuYparDalOzZlX1hnZOQ=;
        b=Q8dkRrXCR30NI7Z2l38foBGD/QbQlPEGtzh8rKRux7Z1GglbLI8A0RbLoxnX9C66xn
         ORu2tzOpbOzDVtsP/ZD+Xa0CCCsoRSpzgyeweBJFYpiC3JxaytSPOXT7iMt6ERtLZJVf
         +u3G6f3c4qku35Fb6I/LuMX0j+rGImQ8p0so161mcdafn9oWTt7cYttPQEO47vrK6R79
         NKzzB1DLHZg/0auJGupS2l5kRQl/SIJYo6Xtq1Ew3LAsZNeHCUk1lWxpg0WNS/+XvWwL
         LpoReHQGhvobcG/tADcpbqFzASFkYRzndWk8lgpzz7vFk+HF7M2ZPodzf3dW6fduB0dn
         hU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745397765; x=1746002565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ECOXHvPy1m6u83HyWp0b6PRWuYparDalOzZlX1hnZOQ=;
        b=jGdYBLxTysIhoHdynTJX/v6riupDHXNIPeo8EFgsYseRw6LThtMItcP+wKjUKbBenh
         QGEFT9KqJBDwVqLyidzj+IpOuK4ilEk7nLj0y5kcmT20+9Fg1sMWsLVKaPucSJKdTN9z
         VrLSQaU2+yIQHp6huMrQE8exKLd1r3R44sfArHp5qCK7Wq2yDLxxkS9w1zyciTH68tRc
         O6sz3MTNdcZFNmnCasKnRUl6NRZHco/AfsSDuqvBotINHXE1jA8usfO+U+s9+1LOM6Az
         VwmcHFoWElbF9Nk1YwD6tEk+1qlZt9p8WKdpwS/PFDV+hy2SdIAR3Xh2J7LM1YbX+y8m
         RFMg==
X-Forwarded-Encrypted: i=1; AJvYcCU1tGU/nqrSqieKSC4R3Z7pNGRNzIbFJlorfVpIQDvXlje7QFgvKxcL58qvfPbs4W2m6Wmfn4YLHtvUo78=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrH8fFKL08W1TxkSnBxI+XipsnLekB3iRO4ZZ/KyroAUb49jx8
	a6g3nEjZ5X0anduFCqEqLMjITHwQ5HI+AZEH2uyqPFYAQmS2NHuKoDvFKk5V3aGPqwBCrvCVRZC
	EuiviD/RtIMVA8l3ydVQFlJWfAARaGb+rUWh3yg==
X-Gm-Gg: ASbGnctg5oFOl5YxJ+r0NoQ5rO/DPOdViurFHxbzoPAK21bX8x1zKBmPVC2DskMFyWu
	+boKzGWaghS8HuHWZRhoxcrdzW/ZBvG4PToT86UwYSTBGgJAStofquSwml/LaK8ywjjZEGN8D2k
	tOdvtXkv+LAjwVa0AObQT6Rg==
X-Google-Smtp-Source: AGHT+IF/9nczjT+/oWrcGPQu6RRK0VMd+RPdPyXG/CCLKRQHhZRImrCsqO3mNIzSHj966SqZ9meSOpaq1WCgkHTJSBc=
X-Received: by 2002:a05:6512:3987:b0:545:a1a:5576 with SMTP id
 2adb3069b0e04-54d6e62bf8amr5062499e87.22.1745397765600; Wed, 23 Apr 2025
 01:42:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411084159.3307-1-ot_chhao.chang@mediatek.com>
In-Reply-To: <20250411084159.3307-1-ot_chhao.chang@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 10:42:34 +0200
X-Gm-Features: ATxdqUECxAVIQqbFYM6Ibi6XkYyTlVovD9mEdGmf4ii6T1onYXMYyalIoDjWE5Y
Message-ID: <CACRpkdb-+xhugxuAif_X0KyxOCgRr5LihzF0pUkviUzwZQTYCw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: pinctrl: mediatek: add mt8196 eint pin
To: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>, 
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>, 
	Chunhui Li <chunhui.li@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 10:42=E2=80=AFAM Hao Chang <ot_chhao.chang@mediatek=
.com> wrote:

> Add eint pin support for MediaTek mt8196 SoC.

Patch fixed up and applied.

I recorded Cathys affirmative reply as Acked-by.

Yours,
Linus Walleij
