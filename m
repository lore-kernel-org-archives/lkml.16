Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B78921ADC2
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876143; cv=none; b=ip4duc27XRKKDrfLOz13FlFcbrAFdKhxXjARrFPIbLIkld7ZcQdFAHweV3k03MCnKR/4zbTVN53UVMEI7u7QduiDJ4t4bJ99Hl9jth21cm/COP/jFLmAl7VAo4g6u7onWBUw38mOweP88yRKGbXvCe0wUrVF3sH3Hy+2P9Lfp8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876143; c=relaxed/simple;
	bh=7RxzX09exhIzgLmhmiaw9DLQIcUyhzaVuL7SP9vsi7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QFZPBGb2xNz6PhO5wP21Rc2bJ7t0GJivEh3pX8zHBvsRSUa/TJyQ4XsCMvjYYqjySz5RnoQWvHQrh+HUTDx0sE/H+hrDSm48abQEXf1yWTK53Y8XYKeiexuuPPvrsPGTyfDGEb/E1ZVV19LwcvS9Gjn+o90guGvha9HimqnZBxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q9FueUks; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q9FueUks"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54ac9b3ddf6so471522e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876139; x=1745480939; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RxzX09exhIzgLmhmiaw9DLQIcUyhzaVuL7SP9vsi7Q=;
        b=q9FueUksayySWoqRwKZrn//UQh0pQL/1CNZQI1shj3c9N4+1roq8nL7j27UksRppiM
         pF2GRqraXlaKjFd0TCAeQLCFueE2VIYI2P5ZiM6L/leWh9awboL0fuCtqB97p3NvRnaS
         Sk2f4mASYb0kPx6a2Ix2Bq6YsW/18PjRbFdvO+UO6x3LVXI/FX6X6hwLyPvW8tx1P5u0
         uNgEG6PbgQ8zBs2gsr17FlCtJ0A1hWpexEBVru0ykg05vk8e/4sR6nd2KHPptSWRrOOA
         R6YhuFqsYSSwHZGTbW7yNIURNSHol4IuT6WVtk5HNfmrhDn03aUPTzVIUnTVbOg0mVoN
         arMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876139; x=1745480939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7RxzX09exhIzgLmhmiaw9DLQIcUyhzaVuL7SP9vsi7Q=;
        b=gVyYeRyLjoDYzLyZYK4N0ioR99gXwq5JViaxMalnNHrIt2IzLS5WVw71PiX2iIPwPq
         n7YFrYyUkJdjnZZAuJ07fmeupTJ83Xp7eBSOkkidGHMXwgkdKONWst98sf9Ysyxai5kS
         s9VNe9y3i3sGsuflxb83XYemMUZJM47qVLK2uhhncumRRuP3cVwTU329EmBJg/IwxzyP
         /yi8zR5ldip7RqUmO1okKaEKjiIbgHzKrpVhrfd8U9i0IwMEx1LoZJC/XFXED7j6gZ4f
         i8GwIInLk70aLuYbeMll59tmdZH8yRNe3IZu10fDDqDQiXsC6FrHI7dh5ETreuy8AFZe
         eqmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDcX0OiB/bQwz5oxRgX1fdvDhyru1iP5nHGVGm4pooDvENuqEZmHGLZ7krYcA+fijf8uTwm7yfyxILf6c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh1qK8d7ZY1QTKPzISt3hc7defnye4eEc0eNj2i1K9tX7PUBsu
	PHfWZJpbELHyLkRIvWPcXcho/Q+sN8nch9znr7genz9ubWBXHXJsV+9Qn5e2IUTUfwj+Q508ZHy
	E8lTlkR1mV3RK4xI5B2+XNE8VPfId7OLzfVQgYA==
X-Gm-Gg: ASbGncuTNLflldO4lDYlBcjyeiDaX6t/928vu0EpibcfOyIHbW950k2XzDIekJnBZW8
	GDbWuCFlv2k4baeBH8RNJ1jtM7iAJt/RdWKAVJZxdgBw+bSRdIa6XwYs7WmbxVfpcGHR6FsScs+
	kv1dKDNMInh+o3sAuKxLMqWUFcqPSIjbVf
X-Google-Smtp-Source: AGHT+IGl0yTbl1NfzL+pnA73vcbs4ZATHO5t0DMm0OPz1AIrbTpPp3OJ9FYZF3EeE/MV9ivlE2ZNC0B+frJYLn4K+3A=
X-Received: by 2002:a05:6512:3a87:b0:545:2ab1:3de with SMTP id
 2adb3069b0e04-54d64a98d9amr1453654e87.13.1744876139576; Thu, 17 Apr 2025
 00:48:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240814061315.112564-1-manikandan.m@microchip.com>
 <20240814061315.112564-3-manikandan.m@microchip.com> <605ff021-0770-4363-9734-ad8114a429f9@tuxon.dev>
 <fcdb9283-07aa-4d50-ac4d-317b0a4e5f7e@pengutronix.de>
In-Reply-To: <fcdb9283-07aa-4d50-ac4d-317b0a4e5f7e@pengutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Apr 2025 09:48:48 +0200
X-Gm-Features: ATxdqUH-NaQn7pZOyf2E47r3u7Tt7v9sT__5pjl_S36lgww88eFiiLrSfCpmg08
Message-ID: <CACRpkdarmBy1nd903SmyXPNhS+hxxRSyKNOxdXg51Emr9MgRQQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] ARM: dts: microchip: Remove additional compatible
 string from PIO3 pinctrl nodes
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: claudiu beznea <claudiu.beznea@tuxon.dev>, 
	Manikandan Muralidharan <manikandan.m@microchip.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, lsc@pengutronix.de, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 4:04=E2=80=AFPM Ahmad Fatoum <a.fatoum@pengutronix.=
de> wrote:

> The correct resolution would be to add an extra compatible to the
> binding instead of breaking non-Linux users of the device tree.

Ahmad is right, the patch needs to be reverted.

Yours,
Linus Walleij
