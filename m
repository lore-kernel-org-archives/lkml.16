Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813B1221F30
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876411; cv=none; b=kevw21RBl35v/b6OIieNUxfKIH7YeQHRPUl/YUSlrZ8tTrzkPc7UY4n39IlKXssa5XQYHD7AsDE4ewq/lpW43Zajti3TrX5QpnmyzibaU1mRQCg8a1ULlF32CkWiuIs9A9aWIGrAMxZFc4F3vBkOEwbgzCKNPUO+0d1y63ucnjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876411; c=relaxed/simple;
	bh=Q3+YaSQtPKXC0cuE5RjCpyH+Pf71thLokmXHjSKya4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XBe7CAviEDieRh842abjG6meVgigDtoRQSNKDMAzaWe1ea9C0me344MW1ucXiNBxuDZ5jAhniPsblgYCNpVxDOBojsH5+W8e+UOx6yM1/y9Vq9hQM60OcM8c+lHaBJJRyW1bQU6r8wTZNtCW+L0qR2tR66OGdW0pQf0lRyR5AEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VFkf4dvL; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VFkf4dvL"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3105ef2a070so4756371fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876408; x=1745481208; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q3+YaSQtPKXC0cuE5RjCpyH+Pf71thLokmXHjSKya4A=;
        b=VFkf4dvLKxbatPWImfVfFhvjNhlfjCdJu7/w1DE/80tzosAQTYLLi89ink/uzEnaIo
         r0vA+MsYx5HR0C/6oUwgGNuR41Oo1+qP5QiOPA8eMcEqCYav84trJCq2k6Ga9u+CdltA
         RgINGCtHhm2WTDKsuxMiVM7vOPEP5zyClelnQ/vyvrrrbcfTNDLS+bpLx7RFkv3nE868
         nOAljNlMP3F437YD7qkAuJZ0VOVig8ZXIMmqaND6hSqsTjedZqvdAJyIrWXW/J8xS2be
         C6GPVc+i5gJsl9q0/Jm6WI8vo5phXiHz8QvNQT22k3ZBlmJj7qpAK9w6N+wBxss1mF1z
         MeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876408; x=1745481208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q3+YaSQtPKXC0cuE5RjCpyH+Pf71thLokmXHjSKya4A=;
        b=UEfvSuim8QaAOqQu2tKX9x4M2HJ8D7Ag2gIQ+lzkkCUFXA03ycS7IReJgPCrymvIvG
         nYblh9VkrkFu6Y7DuYxgbLita3FcItC+ATw7nuprxQ9anmqDjgbeTkDswRMIxcZ3ahC7
         UIIVpQs5DwTk4jHb6G8+Qe+ebf8/vpRCLTnqqC9PGlXfPu0jjMV4gd9B2t8B4LfR+d/H
         jkZUlyBN0XPCOQ1kzEM8HD6eX4c2JoRClP0H1xYnl3xsuOAyUeyG3RosbZIyR/0bpBHf
         IwQLA7FJb9xanQxwOi744QHRlm9dWWortzLJm5pCZiUKSewooh1C+B0EVfTGh8YJNr3d
         u4Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVlfs4SsicVg/GI8rGYdsigE2P2c5rnTH9HstUtbrnPgKSIkdcbahTAwhXHtG2hOSzWpzSoBva6TpRVeqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsIWemdtx3F5nWQ2C/UyuedCYFfBz8+U8Y+4u90VErS4f7dh0u
	TSeERtfkePwyAvHpqvTPiW/JBHXfCfcGYdR5Id+i8kT2WoxD659er69rZ9iJAt4Y68vdL4xhJj9
	rnP6d4yQuJTC03es1b5hKv+9PP4RAGw2xTb/E8g==
X-Gm-Gg: ASbGnctCDILTf3lqmuF3nPuH90IebIyIAu9mFDK4FCZbe1OZiPTEYdhhyLTaTwX4iQm
	8Dtb6XmRCjTfYjAEMk8pK84suqIBLb1WShV8RrDE+se3MqbQrfDAdnuzJzOCw1b3JxQ5QLrad0x
	UiNViYNRrqp3dasn541WZsZg==
X-Google-Smtp-Source: AGHT+IG6fH8i73HZcByMHNF5RXrO9SAK28PBO/AFODMukbnw4fFfbSNlkijjqFOir4rIjJV1QWIs7u0W5Rh/Tw30EAQ=
X-Received: by 2002:a2e:be1c:0:b0:30b:e983:9ba0 with SMTP id
 38308e7fff4ca-3107f6cd893mr18106361fa.23.1744876407724; Thu, 17 Apr 2025
 00:53:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416-aaeon-up-board-pinctrl-support-v3-0-9ca13aa57312@bootlin.com>
In-Reply-To: <20250416-aaeon-up-board-pinctrl-support-v3-0-9ca13aa57312@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Apr 2025 09:53:16 +0200
X-Gm-Features: ATxdqUHbFi-Z7SI6e_TKuBrx9cROKcb5-SqU1LRW63Sr0A6JqXuYgLtul-_YeLE
Message-ID: <CACRpkdYo8bHYKdkFLLqkCTZzy44pk=xPri=E3ogXP=BiywL9zQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] Add pinctrl support for the AAEON UP board FPGA
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 4:00=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> This is the third version of this series (rebased on v6.15-rc2).
>
> The gpiolib part has been reworked, the gpiochip_add_pin_range() was
> renamed to gpiochip_add_pin_range_with_pins() and a new pins parameter wa=
s
> addded. Two stubs were created to add consecutive or sparse pin range.
>
> For the forwarder library, a namespace was added and patches were splitte=
d
> to more simpler changes.
>
> In the pinctrl core, the function devm_pinctrl_register_mappings() was
> created.
>
> No big changes in the upboard pinctrl driver, only few fixes and
> improvements.
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

From a pin control view this looks fine, I expect the whole thing
to be merged into the GPIO tree, so I'll just ACK the pinctrl
patches.

Yours,
Linus Walleij
