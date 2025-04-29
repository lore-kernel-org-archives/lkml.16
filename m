Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61270278174
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745915498; cv=none; b=QMtFZsm84n1tiYFcMnCZ/ySSWn8Z20/u7bgiHmLHJWIPhVDl37aQfK9fzy257PRG+iHZQfK0Cd+UvZl6CLgfeV3CdD6nN5Y/FMjDanUBwKdSf5XVfVgLDRgCFB/QT1JHylcBlncjdAtAwYIPjOzg5QimmAYJujBvZ3n8sevvNgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745915498; c=relaxed/simple;
	bh=gF3fPF6CllcQs9x0YHwVW91aBk4339QyjWLq4v3kcvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AKpjIsbn3SJEuWj16VRYTsZkEZFf+lWTI/jfGj6SnjGSmMRKWyrS7YtkNvf2YmxP4CGuFkN4/t+djhWFFvc0OTbcZSnzG7e33zigKyOG0bkZEj3XHdll2Hl7NzcfFs6H3UWknwpfPVBV73Q9QO+aga2EepIfA8pHxn4a+9ubR4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kgfkFngT; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kgfkFngT"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30c461a45f8so54630481fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745915493; x=1746520293; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gF3fPF6CllcQs9x0YHwVW91aBk4339QyjWLq4v3kcvo=;
        b=kgfkFngT99U37cDcTimcj0eBfZU1V/wgcNATyGtPXehLnEVmGSUE0LU3wq+5ZjH7hG
         EnzsgEizMSscxt7wEpR6A/FDTu9ru6KCnm2WawOoobl/AfOKVmj/Zixx4SOiIAQaGXF1
         1UNZHLkqTg0oyrUf7ezNnbx0rGSVAlRVfUMAszfezTwjOKhPfzdmuT5XJ0sHSRvt+P3A
         YsUEZ2TdJAHzA797v7glxk+EbHylXUKTBGxWN5cA6RCFA8gOniDGir32XzLTQwQiuBy/
         nbYWlni9+vITWDvbo48cIl6itlAHj3TXtZfuKUps43G3m8fPz4cV46DWM+1FD2MGAMQd
         qyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745915493; x=1746520293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gF3fPF6CllcQs9x0YHwVW91aBk4339QyjWLq4v3kcvo=;
        b=CCGJQCmHumMZhyKjX1KBLt50b+z4NQypKug1wW7UO3bJc+hGy0TSz/Q01dPiYhpixg
         XjVuvjRTw0uqaFwKedCoe0F4pNqKt+FwrU6mT5AX/k/QPLP0drQ59bmkCqahQucZB8Vw
         RWtY1l++EHH5ip0evQHGfbQ+aZAKwhPkH1ajfchf3SxZdPLXVFeTGm02lvpfjPOtRdlB
         i9QsP0o5YC4oSse67lI/+82xG5V+y/89yL+GGUna4Sxcr+wWJvFdoX5AbSqXnE37gWmY
         HRnwerHquyW3WsCHkMkaxRDKOTSdwYFq6bXXYhaeunhzqEgSolrG9Ep+5KC2iq7qvqTr
         xBfg==
X-Forwarded-Encrypted: i=1; AJvYcCU7+JTsZ1gluGSAA4u4B5FToLz/gCNceknTyRwqcb/Qi2oR1GuUtpOHgoQ0eVhblxEAiv2IB4mbh4fFAqU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtB0cPsLSY+OT8nLU2xR4TM6k13X0jf2C7thTkOErqEUz/+74n
	wdk01rDP8IPRldVGfHGxXUrE5yIvK6flYkcA3hWaMIvXnb/vG1mTOgHcVNA74NvvEh/L6C9LXq4
	dfUGV9YO4Yn8EYaCg39wYx1ndHgsS78HL7BlDkA==
X-Gm-Gg: ASbGncv2wia7IHD0xyEYBh14PiJ3YCaR1Ct2nVck/3OQBeEw14PSq0s1HJOaskzCAyQ
	7iErBWpY41sB9QFbwxFALKdYgNznxBJPtDF3rj+BXWXqkZSOF2P/KQuAtnZORT3GUHCPzBFCo6q
	qaH8JWO+DTB1Crs1BR22wJUA==
X-Google-Smtp-Source: AGHT+IEQGZYoiDX6agThY6MEttiXW/phwPHOzvMp4EUn15NcMCCtvMBuCxgvpSJ2KIlE88xdOI9ul/LqAjmdMjo0Oj0=
X-Received: by 2002:a05:651c:b08:b0:30d:e104:b67c with SMTP id
 38308e7fff4ca-31d36ad1ac0mr6506481fa.39.1745915493462; Tue, 29 Apr 2025
 01:31:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Apr 2025 10:31:22 +0200
X-Gm-Features: ATxdqUEwnjlawzkertE2U747LwGdYLhBGRSu2FbSCTDtMI-ddocvoVo9dn0tQa0
Message-ID: <CACRpkdYbf4zSrkzrGLn9+Sn0Wh5LvZxW3omCdMP4w1VdFf-iZg@mail.gmail.com>
Subject: Re: [PATCH 00/12] pinctrl: convert GPIO chips to using new value
 setters - part 2 for v6.16
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Paul Cercueil <paul@crapouillou.net>, 
	Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon <daniel.machon@microchip.com>, 
	UNGLinuxDriver@microchip.com, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 10:35=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> the another round of pinctrl GPIO controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patches applied!

Yours,
Linus Walleij
