Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0589284B4A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749592923; cv=none; b=uAbH8DsgPR5OeKYJwQfobRugUN8BJ6D42Xpn7SwyeUOYxJ0t16JUCFLNcofShVxjlEWLJm75VkDnavPre/TtKwrswb/YMTdif9NlHbfndjWJcCCY79DguAzqpLHQX2A/WB0uxZDxnKhcIJ1LunaGtsx8QNVTn8m8RIbxGogEsSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749592923; c=relaxed/simple;
	bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bnQbkJ4UsoXp9KzSKwWuZBFDOMkDM7Cvjz6CiFAobyOPpD4McH2DB4kRSzOyE5wjnTdxgfeBXnmi3H0TZNx4gCgObzwwvvOdmFlZ8xb5FtTiXZ2rOPAG6uNE/R9nxj+oeFKuD/0mLxN6qDgYBWSjms4pk/NftwVTzBGD1wnQpqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=darL0WaF; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="darL0WaF"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55394ee39dfso317439e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749592920; x=1750197720; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=darL0WaFnqXsN60//KyNJtt83dkUlHHZa7TiQytwBwMfvg8t0Bs5VmCa4OdUdkOKcK
         3KCxkXaBD/KLi+JQ8KUhosrpIA1k9+tlptkt2QwxVgNGib31KzwFfYdc2jVqcLPN3JMC
         hP0QjgBAIU2VbTSnTIzbG3f4boMFIPDnGka2gTEuLgpGhfUu+R4cPQLV1EeXJlSFf/j9
         GAYJ6POlPW+B3Zzd4rbTI83BVhQi/WQilVQVuDz+adCtIPFVrjao3dJV7fA/zQrn/AL0
         NWIPHwvEiRgeyNdi3Fs7eMMlnR2nVCFdGstfo0b/HPtgr5+I5ostEaAmybKca7b7g+Y0
         kBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749592920; x=1750197720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=MpIe+Y34pIJW2+W9iVDNU2OV0NHgBQJTvW471heSQqWzVrvaqFOWAqxMsYiyAvPtX+
         3z8f1VDOaHJSz6OvXEBRmh06pizU+azb0yiG1n8aVe5zDA0sd+VWqFF6R7a/QHXUnGL0
         /Up/bxyDRAZVrOtC8a60UT0aqgvzS8gVGBVgjiMecMYA+IrRGA88u5/8QZ2l0JxcM7ZT
         amMCD3sceKfVXoBVQfhNkoCXOYLeoQJOFm3TtFut2pEk5le16zlK7ZuMl/KIm9pgXRxC
         TGt1BqCvM9f5s13b3BA7yqaD8MOP+PhTmrniGGtXe0EXIK+u2237pIs1z2q1dWOvzZEb
         NVNg==
X-Forwarded-Encrypted: i=1; AJvYcCWIqPe6iD8sylqgmHKZLAwe1CneCPrxKriCrb2n+xmA0diKkiTAhVqFndgWSrmt5YN6ArIZEuI8IgkVQBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk7gD6lpcng9NZtP/m7ppWDQvfp6/9gjtRhGwlfGC0k8Rw19On
	9M7ZkpCx9QlQcQAC4X8x7+/RLZnQOWQsGRaY+TUrSL5svMk0HplkVNs6YUpcCpXUdMZXHRDWhq+
	iFR0h6wIZTD9Bh3xqFPvV1gqADJjAYlSRkfYLW9JiQg==
X-Gm-Gg: ASbGncvApBF5P62TXEpdHysfn+scEniFxtehH+JV56OufoSqn9kaPFFaeiveCvB7ntc
	BX/0/eWxO1Y8WDeoh/B69pUqCLSX1Gkzb16R0huGlFWIy+hQE3ggts3Jn8fxNYgGbzj25QKymb7
	ZGgc/J63lmM/6/M8MrE9Lq+bJWmthU9PN7JCvc2hQD928=
X-Google-Smtp-Source: AGHT+IHHOhOUj30OWDDSx+2F42g2fLc3I9bcRSXhW2UcQzuablZdDsnZ46Wc3GihsOmkn7ZczCyHo2K03K0tk80OU04=
X-Received: by 2002:a05:6512:1504:10b0:551:f166:bbb with SMTP id
 2adb3069b0e04-5539c5ff09amr174150e87.13.1749592919907; Tue, 10 Jun 2025
 15:01:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org> <20250610-gpiochip-set-rv-gpio-v1-2-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-2-3a9a3c1472ff@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 00:01:49 +0200
X-Gm-Features: AX0GCFufuH4LiWDSgWF_9h-zk6BcvJ0Do0hqFlGAZPq_9bZnp7tz4BcqtgZHIfw
Message-ID: <CACRpkdaK=Ua0=Jgnff4xXxVx9W=LcLg7RykR7CozhqtAb+8XQw@mail.gmail.com>
Subject: Re: [PATCH 02/12] gpio: mm-lantiq: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 2:33=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
