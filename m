Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570C32638A6
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 08:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746693144; cv=none; b=in8/+/DssM4ndan15AQ7amvY9/RQEQGV7LxCKCbFsN+StOIWeeY7mLZxttPKnO8oXzc00IXs2t9nfUti9HN6KR50fe2YrS8OUOwnZACrdI6MPagGIAh+8r0L7DcNeVKnnIhJ+8nlBdUZPiT6jP8Rv86QJbmPE8t0AgJYl6nbVPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746693144; c=relaxed/simple;
	bh=99sIuYQv9yyYPOuX4dWNyMjpDSYVT8a3hkLHdw7sW/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P6zubpHuh/Z4AJcEdt8HGOpsjY/tVGZO9T3VKii5iTAFkF84JaXSEtuss1ZGs0Js/tz1GZ4nzXJaxl+SssA7LNyCOBytnZD24F0qCYBLX1i0SeGjyAmPOzCcg96t7T8j5h9RQLcSfr4mNalJ7mxCvDFMqcXw38TJmrqUKhdfLnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=eyeiwUwD; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="eyeiwUwD"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-70a23f4fe8bso6827697b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 01:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1746693141; x=1747297941; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quaZx11+VGNrggf88njtg5xLklc9eFfI7c4+X9LIJ5o=;
        b=eyeiwUwDy8WmvUUrw6HR1/xH8hzDgSNjEqMPKS/pwC58tREEdgjfwtfdWOCMhSFzJc
         DJW5XK9kF7Cs4+g7fCSv4YelbBxQIW9lF4pl8CaTJ0nsqbBOYRX8Ml0E0uSGE20vkK18
         o7JWzEdbgFQn6ad3PwkgKzLmg/akNSClNnb6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746693141; x=1747297941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quaZx11+VGNrggf88njtg5xLklc9eFfI7c4+X9LIJ5o=;
        b=r9vXvF5aPl23JFFmfNgREvtWl4FCcaKj5EFRPGap6SxUKCPEq3bzPwoxk6R3yk172P
         SYxerDOqLEZIChgxy7+jaRcrDOkVBwttOW7VBQK5ZnL9he2z8JZpSRU2p6UoiHoeKYNM
         jrZKFn0GNqnKmLRb+d2g4otePrZe/e/2RAKHf9AQSJB0ThvbyjuYxPO4DaJPXBk+fe7q
         Frwybb13VVRvH4bF9lQgw5qBVlNcoEDIM3wzbwrcJPzarmkOqKpPsAQ1+giJ9rC7skhA
         Z3gcwDWAv2XDBAvm+sEeRR3ytjGv1Lf/T7nxUoD5lxkxg5EcPX+Aqkk3pzT2BmKrQ9KO
         jvbg==
X-Gm-Message-State: AOJu0YxJQ4a+u247IGbYXRVw630s1OxEsaItFniecD5isKR93HuJvK0y
	wfQexGgZaAMIc86MM65aIUGA+bdS08SYPtwu7MgpsK6xxlaA8/eZZQ16i1mUyoAKp8FrS+wC73D
	lGgR97BHpm8PMmsnEaGiM7a6QgIHscb97Dvc4Kw==
X-Gm-Gg: ASbGncsbZNtr8rMgz45vq1m1KJ+H6Xs7UG3xVBnxG2TOZLUlYuB/ocg0hffINofP26u
	vSAxp2Gk7bvymVW0KjoamU9yY1WtWtoUdfazBB+CiFgbpiQAPqgzM1rNDiQVci/4Wx5W0VwpXLP
	vrfo6cNec7CtfEyt7aB39a
X-Google-Smtp-Source: AGHT+IE4CmJhrdoXRe32HoBH4jbtzbQ2hoNMjPwxRG6sk3WrTeunXaOWumwPqctZu6MIIYqzIKZAUd1PKmmcUuwqfyo=
X-Received: by 2002:a05:690c:6085:b0:703:d7a6:6266 with SMTP id
 00721157ae682-70a1d9f9304mr89735297b3.10.1746693141277; Thu, 08 May 2025
 01:32:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com> <174643143452.2950397.16722215892279685541.b4-ty@linaro.org>
In-Reply-To: <174643143452.2950397.16722215892279685541.b4-ty@linaro.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 8 May 2025 10:32:10 +0200
X-Gm-Features: ATxdqUGGoyMhD-TPgWfLjSDF0XqnBspVuNvo1SR1O8IpFOj15QasDBjp5hm1sY0
Message-ID: <CABGWkvrkVLRocFsZs9JLni4KDZCDyYDZxMzwA9AzAwipmUyTzQ@mail.gmail.com>
Subject: Re: (subset) [PATCH v12 00/19] Support spread spectrum clocking for
 i.MX8M PLLs
To: Shawn Guo <shawnguo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-amarula@amarulasolutions.com, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Shawn,

On Mon, May 5, 2025 at 9:52=E2=80=AFAM Abel Vesa <abel.vesa@linaro.org> wro=
te:
>
>
> On Thu, 24 Apr 2025 08:21:30 +0200, Dario Binacchi wrote:
> > This version keeps the version v9 patches that can be merged and
> > removes the patches that will need to be modified in case Peng's
> > PR https://github.com/devicetree-org/dt-schema/pull/154 is accepted.
> > The idea is to speed up the merging of the patches in the series
> > that have already been reviewed and are not dependent on the
> > introduction of the assigned-clocks-sscs property, and postpone
> > the patches for spread spectrum to a future series once it becomes
> > clear what needs to be done.
> >
> > [...]
>
> Applied, thanks!
>
> [01/19] dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
>         commit: 20e5d201b5d8f830e702d7d183f6b1b246b78d8a
> [02/19] clk: imx8mm: rename video_pll1 to video_pll
>         commit: 26a33196b5b68cf199b6c4283a254aa92d2aaf4b
> [03/19] dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
>         commit: 2d50415e2457c6f6621c2faa3b01b11150fb9c67
> [04/19] clk: imx8mp: rename video_pll1 to video_pll
>         commit: 21bb969f608cefd8d847cf6eb50a193d9f1fbb87
> [05/19] dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
>         commit: 2ba124053687c933031a6dc5b2e16ceaca250934
> [10/19] clk: imx: add hw API imx_anatop_get_clk_hw
>         commit: 17e3c1a272d97e49b4f3fbfe1f1b889e120d2be8
> [11/19] clk: imx: add support for i.MX8MM anatop clock driver
>         commit: 3cbc38cf42ca42d2dc9a93c949e0381ff919df71
> [12/19] clk: imx: add support for i.MX8MN anatop clock driver
>         commit: 80badb1d7264e83b512475898e7459f464a009c9
> [13/19] clk: imx: add support for i.MX8MP anatop clock driver
>         commit: 4c82bbe8b5437c7f16b2891ce33210c0f1410597
> [14/19] clk: imx8mp: rename ccm_base to base
>         commit: 1a77907dbbecfbe5e6a1aec28afd49a1dc184b7a
> [16/19] dt-bindings: clock: imx8m-clock: add PLLs
>         commit: 6a55647af3334f1d935ece67de4a838a864b53fc
>

Please check the remaining patches, as they are required for correctly
building the
ones merged by Abel. The kernel test robot has already reported build error=
s.

Thanks and regards,
Dario

> Best regards,
> --
> Abel Vesa <abel.vesa@linaro.org>



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
