Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C132356B1
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747815087; cv=none; b=l3F8z85k6hISGrECa0EeHkeHXuoP/w8B7H/MdrKdVp4KCtW/GwicIWTp848J66soN2bMJvITXpkR6oKnXJt7jkQ7bcs46yxZh6p/3IZUvjNft9ZTb0002J6chs3r4h7Sc9cxEOVbdQnlLKQLlcl3m88hg8mIF2uU2IFZn+Dn8qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747815087; c=relaxed/simple;
	bh=b4Ig0XOyQfEMoUAAjNHDQhh7+S48zOrx5dD261ukggw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W2ltKnD0P3Icqi/lSlVS4SbZnJdXO5t7MJLf4+SVfWTtcDwBU3P7EFKlaTkFBvWokXFkzUq861bppsMbbJ8n3l2w5USjpb+izOFIr0x1tcw5ICTbi1q+P6C6NTYYEvoIRdis+Hc4sW8o8YwbZEPmiV8T5f3XFuHG460/ZtJa/Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M+Fgxv0d; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M+Fgxv0d"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54d98aa5981so9608990e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 01:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747815083; x=1748419883; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4Ig0XOyQfEMoUAAjNHDQhh7+S48zOrx5dD261ukggw=;
        b=M+Fgxv0d/2YG9yBWAIwiGJ3yUSceU3ihyYgjTqSSntnF0Xk+Mc9NXHb3vvPbdQ8t9t
         FimB5zEjkRpL4lpZ5yeYgp5xGwmQyYLNerQslNakuU1iJ72gpWmNMmmPLOSX+u8XvXet
         TIp/0IK+e5vf9+4+l+pdNwVIf7wl8kZY9TdoMckfIoO5Xj4AhxaLn3putFT3sS2IklwD
         Pdid5pZg/QbI54rO7xYJ7y2l0G0gPk5rgWiEWrLO+ZkvKQpvxndigkZOOIMh2NDARsO/
         JPZGEn9YjiBNlGc7eOfDyjs1Mi3vTJ69QRkp1jupRoSiB7MH4roQhLkoV5b9bAL14U2B
         zplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747815083; x=1748419883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4Ig0XOyQfEMoUAAjNHDQhh7+S48zOrx5dD261ukggw=;
        b=HkLvDiEZvLqdP2UOp/tfCbwxNAxP+iiUxFRHfpo5v7TQcdRchrYKqTRCreccXRfTw4
         dOYkQ168aqGRIzctQxjbIG/Hp3FD46V4xwPltX2oT39T7uW6Ftpw2ejKdfsx29xi+prK
         p5hV8SCR9N4bsYjfG81VjfL/1byWUPblebVXw93g/hCW6CJ9d41cB9Ns9Z0WVeQK8LCt
         yBbfnlaTSK1mcBalXbB5O5FFSJaLGg2dgB9qAS2EU/y5n7dZ5SbcdrKBQZEnE+3Q68Y6
         Y62JauUneFPv/fodQ5EnEmZcpbv6Wlcv7VE6m1QYe445X/JGyHFaLmRTjpUDwxhssN7z
         X4gQ==
X-Forwarded-Encrypted: i=1; AJvYcCWb8IyKHcc84wmNXbtpMwzC8xkfAWUtlUmkPV84/QXaR9ArHpaD3SGYss7S2grtbKsxqHv4AVy4TFC03Mk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWAXp3fB9jeevX4JZYLst1HX3R0DRSklCins9tiMrqXGDStvKB
	qgYculYGyzpJj2eo2TevBwlV+Ks4YuJPkBswdxVRydvu/G4Tdex5DWgbJKV1l7O1t0yIIwPpabu
	NkSSyfXVLASDTHZ03XlmfY4MzQTXoPEtGvlLm6LA3xA==
X-Gm-Gg: ASbGncsQjc+EzGIwtRWkhHzd+6WVUcp4DnB1Sg9Y9Mk67kdHY8hpHUbLKnyYqiBr7hl
	U43NP4pPGarhWWTGBysxzb9OsK53XqSH+ZqVHiyrCta0dHo825sl6xbTlyRIlFmHXsVMcFNiEri
	DiaZsxDQXmC3jQk5X7N5kQri0X6sMXDUCo
X-Google-Smtp-Source: AGHT+IHr3PWCQAtuLgEYwRwwW4iRxfUP3QxoUSfN1BXwa21y3iPHsi32IWoXuUCO745fcwdxDECQuaLmM/WWBqdXJzk=
X-Received: by 2002:a05:651c:421b:b0:30b:a20d:1c06 with SMTP id
 38308e7fff4ca-328075fafd4mr52461801fa.0.1747815083428; Wed, 21 May 2025
 01:11:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520-aaeon-up-board-pinctrl-support-v6-0-dcb3756be3c6@bootlin.com>
In-Reply-To: <20250520-aaeon-up-board-pinctrl-support-v6-0-dcb3756be3c6@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 May 2025 10:11:12 +0200
X-Gm-Features: AX0GCFtgrsoYedOY9iI8wKVEZEWG9oGL9tXc9fGDI2DAkg_LOqFcWmofxbD1UNI
Message-ID: <CACRpkdbCUPQT60-bqLhgYHLLUYd3ZcihZ9PV-x__UGPArgbnkg@mail.gmail.com>
Subject: Re: [PATCH v6 00/12] Add pinctrl support for the AAEON UP board FPGA
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 3:28=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> This is the sixth version of this series. The main change is the rework o=
f
> the GPIO forwarder API as requested by Geert to have more consistent nami=
ng
> and parameters.

As Bartosz said it's too late for v6.16.

But I applied patches 2 & 3 to the pin control tree so we will get
down your patch stack a bit and less cross-subsystem noise in
the next kernel cycle.

Yours,
Linus Walleij
