Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017B028E61E
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 13:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747142650; cv=none; b=DzyeYAn7xZfRjCUM6fFXeO6GAm3ei0RMVfe4e/dKdjeD9Ik22FwpzgiVUHSQIF7I4lpa6tANmbm5O2ZHBCkF/CRDLixVaXzvAD+HZClZhn1arbuzlx8vxj6bTts0ZdigbflkaEmxK7KaCNcrJyt7zWVYlEAA4p94+KCmDiSy7Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747142650; c=relaxed/simple;
	bh=5eKxaIX3fw3jx/+XOFOXndB/4SjWjO6DJ61Rmj65mQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t1FsRd7Fvn8C5Avi6mUCe9RQMePaoj60JxWvoqdhWu5Osk1phCuCcnagV4fyc6R1fUoAw/MKQifidX4wxRLQkHCVL1vLo1U03ybz1lfl3VHK51Uq28i8ZHNPod5vVlFLRDo6zbKt1FzTA5E9cHwn6O3klVX0X0g5FFiXIe8sCpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DbwhB7RF; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DbwhB7RF"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54fc64e8419so5383024e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 06:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747142647; x=1747747447; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5eKxaIX3fw3jx/+XOFOXndB/4SjWjO6DJ61Rmj65mQw=;
        b=DbwhB7RF1JQqu3Vx8YErtq3rTPzu9DrvuTZHBpumUlQ9Fqckpe1d5klxFnDVlvW9a0
         mbStNuiJFw6GfBvu77Ue2MiUVYjGnhfDkvYoBPIMkNngWUkdhBZXjME64mxikNmE9Obl
         Bx6okDN+VXaiokTpeMVKPodEUSYw7zYVqSwGTEaDg0KBuIMuEVTI8rbJ6jNHXfC0JJNX
         dBwe8fYiS2PsBI2LA87kD88l/WduHaiVSySc6bJYyqGQwtAF0gt4vSo2bG7RupqrIt0i
         P4v1bE3w+K2sqOjV/XJOYUMhzq9cJZChC3eoTF8Ug7CPfW77rOzm6g3EUgOlE3oJw2G8
         PoGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142647; x=1747747447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5eKxaIX3fw3jx/+XOFOXndB/4SjWjO6DJ61Rmj65mQw=;
        b=JCspg84X1DpM/ZuunPhdqiOvYZ/+uKdd3s6TIS1rTF9JTrAQdDMY4L004RAngDJCgw
         Enm3PpUHWtFM+0DSaTOwyY2fNtVAYhwI3SlL7bjKVlboRf/YE7BhIflsRuV/kj0rG7xV
         9bm0+1wZYFXyNAvxAfcP/6GGVTYFBhgi+reA42aMR32ZH96Ey6+fLiV2aFe+tG2UH0Lh
         PgUgIJKKOmMo01IILysCivEJqyrfyLqkZ2KSWsN5fYBExOD3KsRczg/MVc5oHsgupzmB
         OXbPBhdx/shj0nttjizCSP+H2Ufv1sP9/lgY11tvgKLpSG0vaGswdtYxYanSwPix8lp0
         5qSg==
X-Forwarded-Encrypted: i=1; AJvYcCUhhRlRBrwBqwfD1y4D9X+LpgLlN+bEt5sgtwds9pKAdUAWEM+z76m2NNzAXRIkCtZeU8eZ8rShjQIAJH4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7yS9LRyJTkmMKwPM/W/UxvwE61w/9QEMn9HWssQhnCq3zWtWl
	wcLhCfD55AccrLXuCk8M21pVcGyNzCr+SHMo5+AerTM9/RcwcKFtL6DKi/Re8kRs3EnCADGMR/v
	yRKh8CfcEQJ1R6u25kD2uGGq3TvNauoMlARiQwQ==
X-Gm-Gg: ASbGnct0BeI0rm6dBesoIbGDqvcyY3dCnJkpCtYLWKGHWxkdDlcGOczlmxo3z7FG8Yk
	QLYjyyEuI4mEJX06B16IxrQ5G2JbHEKh3XTvFXfnhKaZfi1ZDMVpdmvuWzbWnRUBMCwteLuqLNR
	PataMV8ELnF/fNxSlYd8gwkadWUoUzyJad
X-Google-Smtp-Source: AGHT+IFQKowijPtKxWmuvEciX1nJf+TDzv0WZoqM/uKvRSmSrIT4h7hRJwXNUJZcQ/uYhV04L0dGE2029I5lSw65p/4=
X-Received: by 2002:a05:6512:2586:b0:54a:cc10:1050 with SMTP id
 2adb3069b0e04-550d0bc78b3mr1158871e87.15.1747142647002; Tue, 13 May 2025
 06:24:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509-max77759-mfd-v10-0-962ac15ee3ef@linaro.org> <20250509-max77759-mfd-v10-2-962ac15ee3ef@linaro.org>
In-Reply-To: <20250509-max77759-mfd-v10-2-962ac15ee3ef@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 15:23:55 +0200
X-Gm-Features: AX0GCFvUasElVjJYv3I7eVQPe0A6FsXnY_zILsVN3taTVIhvI167ZdVbaeRULuk
Message-ID: <CACRpkdZg0ZLcmGbFPqUmRpkw8DJYe5bY8yEDe5+KrnzTWxeXFQ@mail.gmail.com>
Subject: Re: [PATCH v10 2/3] gpio: max77759: add Maxim MAX77759 gpio driver
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hardening@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 3:22=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik@li=
naro.org> wrote:

> The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
> includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> Port Controller (TCPC), NVMEM, and a GPIO expander.
>
> This driver supports the GPIO functions using the platform device
> registered by the core MFD driver.
>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
