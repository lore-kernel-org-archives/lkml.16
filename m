Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18F6284686
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705940; cv=none; b=IzbRjEz+EvQT8oxqWfG7sngVWC14WcdcabFYj3LNoPkj4y5Yw2yaREu8iNbuRDuZrWA5k/qO1DAG4dQ6bsqpFhk2HHqdhOtdpFjRG+JGInziUZe1RS+O8LQZp+GsfM9wBFvEhSvp9eP7NhLHkTgAOUO9RvKZshQupmMf441Cpdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705940; c=relaxed/simple;
	bh=EEtamelvEL5oMF5dTsmr5bTfdDwuT/yXwBSnoDyJAdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=edc6fGBMCOVxagCojqWKOBcNCP547aOw6yAOf6o0ioRLInCH/SlRzjopdVQyeUReADvUm1Uq1QQbJlZL2AQv21lBDbHz1uuK4P5LKe0LAhIPNBMbhsjnfnr/k7Q2C0pOjVs508HS7xvzyyzm6DpxfEmfa6TnFJemoybPXUAB4Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eD8rVFwk; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eD8rVFwk"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30de488cf81so51392011fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744705937; x=1745310737; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEtamelvEL5oMF5dTsmr5bTfdDwuT/yXwBSnoDyJAdQ=;
        b=eD8rVFwkIXGmI25mJFx/SrWwz9Ddu21oSCHJcKaOEm0LsDxzLnVZB3eYiEc2CEWFdh
         jQbcz90VXTm1tKSRUd5in43hkIyjcOR2U1HI4Rl+F4ebNUCXhxj7trNe79qZ267G+zgK
         7mZ3FUrPf0w8cK4azUYZef0YjM1bDAlI3XMu7TpTD4j4nK5O0OlV1CkLyR/aGBlti4Fx
         //1RvB3Jl1gKtDCP05wVuSR9sy0dLSRKK/tvDw1xHv61sI3/dq+BsGw/MQpHbS+ekkoN
         DBSf0f4wlLmdicH6ec5NbIGLYB3u+viKHyc+n5OF0/aV+2qblRDLrHdL4m/Ey8ZkLV+3
         Wkjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744705937; x=1745310737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEtamelvEL5oMF5dTsmr5bTfdDwuT/yXwBSnoDyJAdQ=;
        b=E7Pr23116Fw1DwyCH6yBnhm83IDZOnnDLdcYoAdWp+hCU8Tcs4rm2UaZlaGj5WED5a
         E7+4qEiRiOW+lzjK9+rVLmU+BX+DdravzHEbJrYAp6nvuX5wgw0x4q042dgXo+Xt6Z6u
         ZpBHT5P3EbQKRgq8p46tvNgg8Oq/wwasQQh53cRdpJ55w4MSxY8SF9VDAij8ehOFbKKt
         kym0chjlrO7mIbL5ND0tuJf5jxiQU/wQD+hBWN8qHGrT4PeewQihT5ESQW336BNBiYOY
         nyJDSifUtWHpKWBpop1lkKGHqo6Dpq/Zn07FqA54Xdd+jd2LElkAYBrogX8j6mzWnLP4
         fXCw==
X-Forwarded-Encrypted: i=1; AJvYcCUr/QXYp0F2m+K6gtRss3pw+ftfxAd1Ozso16P3bSDCPzzrkxWsN1fXG9HubZszZh/sSzvi66+YpQPYmOo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3NiRz6s3F9Hmn/+TXHXjs5UKr/B13AF7NC0iDg7mJGBCiLXLf
	fTyu9/W9URYINu0SlSkCjxR/fAE/Zrmu4eJBr1yqL28UR8PnnR4ic6OO2bBwmKzD9VuLrO8sFcG
	dYWjiXcF49tx2X+FyzSf06N3+GJpbmH9k7OiBXQ==
X-Gm-Gg: ASbGncvEfMj16soDFbmyTHQQRi50cvocV64ufcEVDqnlXP+eDFEbaYZ6xsFN300zTgq
	xunV58CgBCRhJ7CtA9dvm7/BxoEyT0scIdDrouwUO2LF2Ht7esEl6gcVrTmC2XI7ZKifRCNZm4d
	J7tFImutjB0K1IVNaItD2jyZmEW8c45Xlt
X-Google-Smtp-Source: AGHT+IFqHgt85FAtKpysh1GWDt1MaHgR9+EQKoY32RVv1qV7EcZCQfTfkiR5qV5ET1fUQSQ/nZPTWz01QIwFY80tssg=
X-Received: by 2002:a05:651c:2228:b0:30b:aabf:fc4 with SMTP id
 38308e7fff4ca-31049a2302fmr45655041fa.21.1744705936671; Tue, 15 Apr 2025
 01:32:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-m68k-v1-1-7fdc9132b6e8@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-m68k-v1-1-7fdc9132b6e8@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:32:05 +0200
X-Gm-Features: ATxdqUENeFi82570dVSVXEp-45cJFXwjP5cf6PqktWQkh-wVvXZ5PyE19YzMtfA
Message-ID: <CACRpkdZRdyFJaKLnBVHUWor_MhJ-HBoEP=NMYm1are6em4v81A@mail.gmail.com>
Subject: Re: [PATCH] m68k: coldfire: gpio: use new line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:20=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
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
