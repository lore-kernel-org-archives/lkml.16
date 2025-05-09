Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CFC272E40
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 08:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746777992; cv=none; b=BJ3PzY4rYrRaXaMRDaAttAgtblPsRQUq3MTx7qchYI8P6n26xRju435jr9I0aUAeIOKHvKUpyQRdhsk6fSwjGdTAqjPkuL9BAf1+gvZpI3bOJgFJccHixxRzh2JiuIvhs2f2vzlIFxh4i6G2lnWA/xXpZyZlg+ygIbkrjL2rTz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746777992; c=relaxed/simple;
	bh=bqCvODsHpIfhcMqnp7QHHWAf2VlzjskdSxaKx6IvzpQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=izuL3ukJJBbhItL++Wq1+5sIXc98iPtKNZLG72z+NE4X4SgD5kZh+i6oZ5prYerQfSEmWyYafCrCRJtju872m6IE6HrzdHFZeAEgDf3oMi1QXjTHgLdtm3wdbzT0Bg+uk0mTX8bLM21EqQLpA7AQIGOiJxkQSkPwwDJn5oEZZg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tr9h3Lnw; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tr9h3Lnw"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54fc35a390eso1603440e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 01:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746777988; x=1747382788; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqCvODsHpIfhcMqnp7QHHWAf2VlzjskdSxaKx6IvzpQ=;
        b=Tr9h3LnwHQFDj6CAjC70dFBJAKj/pon5qK9zjvhHG4Dwvwu5DxEXzmLf6ZpR/rxVkd
         jngebgO7GMMJu6QeunF6/lvNhIlauNGvGVEGWlRRt0MKJtGOFybkS8JBSy3NyN6fXSvX
         F8TeJoZdrbHhJl7PJzPXMo5hhLFl4A/wN/Z1db+Oo5jDMPrwp+WeK0XCjG/tiyh4ck0O
         18FjyQVygEMwmoo61DVZXFGoH18CcojuXUX+Q0BBurHsTJrkWHAsUAFbiASTE5dgFLII
         6KKfXtdQWq1IlpAWw5oKRkYJfgi2hoV6gVL64bFXhOgl+2EBiOOn8iWXeceQSgCGcO1m
         EaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746777988; x=1747382788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bqCvODsHpIfhcMqnp7QHHWAf2VlzjskdSxaKx6IvzpQ=;
        b=QJAGUs3sL15QDraXe5CP0/qsk390wNFwcArim3LoEkJ0lMkRtS70PI5q3x8hgpEM5M
         9ZvJmhp/NlN4A8vBoIAvoUD8hX1e12aQe/yVG85/OfUZYTM60AenxLeL52YceFoqRzjV
         kc3IfnG78NuRhy/9kb40fBR5OQLq3QwshRTqhZW6DkkNfuM0sh90qAVvPUcPR1J/+nEh
         fFoCgo3Y+8/15mujIm3rMxZrDhk7UfQWKHfmk23b8p+wGKdd6UbVLbLT4i2j3OwiNFoB
         KKEDep85iDxzfhAvxmgmK+Kf9MeDql7HDSIiijjZOPAoKICdzMasyjYaC9NANaJZzpAY
         MYJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVi0Np62nWDMCpHlBTy5qQicefotqh2tf94DHzzlhP01eQ/JtUXQ+uUESIJ/kfDPEoArjwwBBqcXijkNMc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUxp9+3PNnkiwjlEpuXHJRuzNCKJ7KvicnnmXBp8VcaVp8hu2c
	B/IxTFMAEbcJvxgkOiFQ5KtGSIviyDZ72vwlSm0UfsCfrcUvDZPa2txBebAeYFreJ91C2SKNs2I
	0Q0LNIqTCEeSAL+FYZrhkDb4xSuLxR4IeBnbgcw==
X-Gm-Gg: ASbGncu7VnkAQPdSnBSA+o21QNf/IoqSrjlHUbivAF7leNqPda8x9U+EecTDZCpj6Lm
	Tv6SwBVFPouOkmLHe6HxqJdYL4oZd/cnUMHTw9pFff/KCbn2BKc1pQmYlYWkjNkniZfI9dyoJZ5
	/MwxEQD26R/hDjBXQRDyrOgA==
X-Google-Smtp-Source: AGHT+IF/OaH6tvPTnpWGCU15yq3VtPlZCMuQXSmIR+VYN20W07SffN7TF5F44rEgRUHfgjiVA1uoD+Xl6WIttmOvrl0=
X-Received: by 2002:a05:6512:1382:b0:54f:c31b:aed4 with SMTP id
 2adb3069b0e04-54fc67e3490mr781088e87.48.1746777988424; Fri, 09 May 2025
 01:06:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425-gpiochip-set-rv-pinctrl-bcm-v1-0-6b8883d79b66@linaro.org>
In-Reply-To: <20250425-gpiochip-set-rv-pinctrl-bcm-v1-0-6b8883d79b66@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 9 May 2025 10:06:16 +0200
X-Gm-Features: ATxdqUFnVH5j_K9bIXCXJ7lpjCcn1ZQxHRcfa3pHCEiiJ5CP7DDqvtQgyMgegYA
Message-ID: <CACRpkdZmePbKDE90WEhLgqPrgN5prSo0K1B4_2zS1i=1Z7zHKQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: bcm: convert GPIO chips to using new value setters
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 11:08=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all the broadcom pinctrl GPIO controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

All 3 patches applied!

Yours,
Linus Walleij
