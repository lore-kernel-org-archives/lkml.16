Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692E325E440
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 22:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747779263; cv=none; b=kt55uERBprOBu7OL/e/V1V8RU6NzFYUP6AZbMXyJrP7Dr2Tz8wROQM7jJVI8JKqNveUe0tDwPUL2mYxunRV/J1wb/6kpdyEm+ki+oDGkLy5s0nXlIUwld59ZhpoK0unGdGPOvqiDfs7eUWvayqV9+FvBuJ/uVDB6G9n5DEcduSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747779263; c=relaxed/simple;
	bh=0KKxr0NhS0ebwaZO5bcBif23znaAXOSTxXvDT9vZo0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UVJyWMwRODIt4lSeNASAM2XbABZ001YKRkVnb62BVhWBKDHwZ97ddsZ+jm/Ts/3O3SJ5bp4WQJ9ahn4Ad6IB6dPGnyRk+NRIwABdVDOa0j6GiU4guq2ruvUzdTWzntl48gKZ8w86lc+tjM9Rp2X6u0iyBQo6NXfqey2bYcHxMok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oa/mr1tt; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oa/mr1tt"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-328114b26e1so26433641fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747779257; x=1748384057; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KKxr0NhS0ebwaZO5bcBif23znaAXOSTxXvDT9vZo0g=;
        b=oa/mr1ttNxpHiJVbOLzJSzaxUGjB5Ou2lgam79kh0wuUvalfFufsQGRB8QzHlTl6Gt
         unlS9073PNdQa4PPnoLOHbpmYK6NlJ9vozyJ0M4IGniOhkqN9v/Q8Q9MJIymP9VxxFMB
         Ho6GwNkYL6xh1XJstC60XlFhd1Fgj7S9UqGiApGXpC8CYHU0qEQ8jONJMW5DI0JUiVI9
         D5rQxZPD0GY2OLFgG3QMo4RTPwLY3ZZZ3zfwSRUw2guLIoxTMsY8/RpaivI+R3z6fgwt
         eN3RzpocGgOse6JuwOqjojnlkX/K1WycZGz+hfRMmqTXfRL8+Us3mZNRvCyI3s8/6z83
         /GUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747779257; x=1748384057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0KKxr0NhS0ebwaZO5bcBif23znaAXOSTxXvDT9vZo0g=;
        b=Fu1xWvi2Pun9zu8hXe0K36YIhMXDV57IXGqf0/gS0XrzesrjnjCTMNqTcZZGq25Stv
         rrdGyEQbSJuOhj/NBuxMygJO3lpeYN20WYCXD1goHbRO4Jtz2uSRDsQ0clYyf8foP6Uw
         iYTcCdO4ju9VPygD+UBWP3eNggcLmYmWXfmZNjNWvdwgiBKOnQdQ0Hv8Gi/9vh3bvag3
         G9x0k/wPe+KB/sXYcOmtALg4VPkd1Ndm9EAQiG2yoSRbrOWIQgKCX3NiH241Jf+3Xw/n
         iJ3vwzQEjH6EBjiu/l9crqOvjeOhOh/l2glT9xVyowhUZIcSIuYyvsUf8JAilBGczQbw
         YsDg==
X-Forwarded-Encrypted: i=1; AJvYcCWKQUaQ7Z4HU7tRW1YhL0hWkqwgYZgb+fN7RssIFFpydXeqa4n+07LRUq8zgTTJxRJ415Q8aNQhVaPvkOM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHu2d6Ht707FoOjdcM/0TvxxISx1jScnw/J2IfOLG0c1u9fHgp
	LrfglXFzmGAfb/P9Rs0N6EugE/Gv0RUSc9ey1dD51edmwibpwTQFXZYpwYghz1u91JS3Bj9nchT
	WEGJHiJFEzHX3E4iCXNXvmUz991w4fc+mAy+z4bWaAg==
X-Gm-Gg: ASbGncsu6BvheWrdNR819iR9TgH4tW4cX66ALP8+fH1lZZKxd1niyUDU+7H5kevX2Fz
	ikydJgghZgMG4VlIYRLR0GjxMLPmIeH71Db8Agw2/sVsswxIB3j2gcisDXDCce0PEPL3fKc/ZT0
	w0Xx2nr8pKuIth48kqJYKB/AtLKPM5pZlj
X-Google-Smtp-Source: AGHT+IE2I9dkpHJtUzuV3F55HIcCy4H/0xE0bIT2P9EiCFLTqHbK469GeJi8kQXTq+VvjFFqjzVGAT63GH/fgS+P2nQ=
X-Received: by 2002:a2e:bc1a:0:b0:318:7f36:da6f with SMTP id
 38308e7fff4ca-3280974b19dmr60101281fa.26.1747779257574; Tue, 20 May 2025
 15:14:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com> <20250520-gpio-dts-v3-2-04771c6cf325@nxp.com>
 <f0017caf-8fd7-4046-ab7c-71c6560b7a95@gmx.net>
In-Reply-To: <f0017caf-8fd7-4046-ab7c-71c6560b7a95@gmx.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 May 2025 00:14:06 +0200
X-Gm-Features: AX0GCFujWmK7RjwxHirjq3655UF2TsXAVvYT5SDx5SrWKMcU6UcS_lP2iMrNx4c
Message-ID: <CACRpkda1OKXnma11wKTrBsO_AAXrifVK8RDCKmufdHXBMmtMbQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] ARM: dts: add ngpios for vf610 compatible gpio controllers
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Haibo Chen <haibo.chen@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Stefan Agner <stefan@agner.ch>, Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, peng.fan@nxp.com, 
	conor@kernel.org, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 12:54=E2=80=AFPM Stefan Wahren <wahrenst@gmx.net> w=
rote:

> sorry for asking this dumb question: why do we need the redundant ngpio
> property in case there is already gpio-ranges defined? AFAIU the last
> cell already contains the necessary information. Or do I missed something=
?

Not all GPIOs on a gpio controller have to be present in
a range.

The ranges can be multiple and have holes in them.

The ranges are also optional.

The fact that this DTS file, for this SoC and on this controller
happens to have a range mapped right over all of the pins
is merely a coinicidence and not a general rule of any kind,
it just apophenia playing games on us.

Yours,
Linus Walleij
