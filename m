Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9B222F3A8
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749625144; cv=none; b=CjYnyJ2lBrv+HkWqM3Ote9evsvNkNYaKuA+Jap0/lq3ZT2YPA3MjyrfXS6wlaQ288zm5VWn4dkmelqoAQXSckS1AKIFWWBJ56w2BofVSuUlP8IB2fqfMEbOAjjj0HNgkxza+9YOy86GNvEgFRN0JxW7Y/NaNrUu3vwNkyLeRYE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749625144; c=relaxed/simple;
	bh=dhY8tTIaHxzBeyhk1xPMKaQLngS8G/RjM44iDX1MTQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LZ9bALvzpttq+xWTQzr3t3ifRoeOok155B7l5oVuGAfFH/e/qG2DZ29FyZYnt5R6ij3M5zI3JpK5icNTHaSOJgXsEC/nQOUsNP/gZbWuwXAaI3EVzYyZuigAhIHNYsloMrSZPwt1z7bEqfvJfNeQoILRfpITpb65CEk+ZDA1TyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jocJ9c58; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jocJ9c58"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553246e975fso7344053e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749625141; x=1750229941; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8nA2PNnIRRvEbnFF50ioWvbhGVteh9Ywj6FtJtDCnA=;
        b=jocJ9c584qlVDVn6UJhYMjrkzw9Wz7thkJ+41v8/8fjP4fZD9JlkteyJbZBgMs60zu
         Ehr56YhE/IZZsEMaddr0kcfsM1TOO0094kwB6XyGKTuQSpH28mmYhWpUTk6vmwkSf3hP
         Wl8JHP3mzrncyKn+5pYIlREWzw0ImLZ8SScx1A+wg59wy5sA7XgYTGS5KFFQU6MmNjb3
         tl9rPz/ix2vZmjFlgzhY4eeVvlq1UFrZcz5fVjtSE2C9l8l2wYKgdr4evEt1hSkgg9yN
         lcHEdQxtyzCUcQn+gqVH1mhhgN3avvekWhpK1tSDlEVQPS+k0putfQPOMpxjjDVYjHdD
         H8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749625141; x=1750229941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U8nA2PNnIRRvEbnFF50ioWvbhGVteh9Ywj6FtJtDCnA=;
        b=rHbQy8SCD0i49tuIVCA6S3BMrELlPXfGUcIgUQ2NSFJ1FZV1v/FuX3f0rCb+W+sdVC
         qz1UpyVpbMomC9YaD/GZ9xxOaPcm7xTeeMgO3nz0MpxL9OZ8uRBctVkjMbodIbX68sxP
         VpEtitXfLToZiuLF4mWmIXf27m39CSB8G7fUZuI8wzD4dXY72IiR37lU/kFpccnonv1w
         Tl9y5z7E1RwMEto1i35gxYEdNfk4jRdBbD/mlEa4B8UAt0aH7SDaC3LopJTvDXN+79yi
         rMUEDpuoWVb83K504M83CQ8HRbH/VWoVV4a8TyiKiKSvtipMeaWKaf9ETQgr+2mPWpTu
         +yBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnV37WV0k+6YDqy2UUOuKY7PsEClneoT6z0gqTw6cdPTctmGYD/QPdHGmT8KfJWLHT/S+4MfotFB2cbjY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6T3RBzTbWgsaQ6+Rv+iv269rUACvaqKBMiblPCSPslyOoC1cT
	v1z02Ef6fjm09IKV1g299iVHX16oKs+wL8fRy2a+qNMEgeF8GdwnsDBzaPV8EQxpkSDViI5fYW4
	GV/qnXOROIaiDI9mJVWHS6TBXpLftoP5REjDsE9Aupg==
X-Gm-Gg: ASbGnct7nw53RiNp3AgDUCInKmxxrZOc2cikuKDPTlS64bT/CYvAp6Y12eA4f3CFzrM
	Kt1GYGnBBOuGk0PHnIv2tZprWk5KhH0lYiApmLFpD0Ql1JH2w+ODmiUCXpvZ/6+/GxTnTxOB27Q
	JOVRkwr7Z5QGxPIhw8D5lyxA9o8r91opN3a6wXy4r+yaw=
X-Google-Smtp-Source: AGHT+IG6utHIOdDkcpuozNh2nqM9zH/+sRrcv4+dUano9lJ8/d+qcOtmsSZATDFdcJvRJ4JBx+FV6cWHmQ4clAOQL1E=
X-Received: by 2002:a05:651c:221f:b0:30b:edfc:5d8a with SMTP id
 38308e7fff4ca-32b22100cf8mr5212561fa.0.1749625140694; Tue, 10 Jun 2025
 23:59:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250608-tegra186-pinctrl-v2-0-502d41f3eedd@gmail.com>
 <20250608-tegra186-pinctrl-v2-2-502d41f3eedd@gmail.com> <yw2uglyxxx22d3lwyezy34wdniouu32zppfgwqs5omny3ge5zd@iuqo4qmi55a2>
In-Reply-To: <yw2uglyxxx22d3lwyezy34wdniouu32zppfgwqs5omny3ge5zd@iuqo4qmi55a2>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 08:58:49 +0200
X-Gm-Features: AX0GCFtY4lWmGfSr3aKIZM_841dA1Q0ZW3SK2jFhQhq_82hUZBSPfb71HJ3Q2qM
Message-ID: <CACRpkdZha_ucjWvP_NQ+z2vbD65Y3u7Q0U57NYbJ=vqQ6uPGGA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] pinctrl: tegra: Add Tegra186 pinmux driver
To: Thierry Reding <thierry.reding@gmail.com>
Cc: webgeek1234@gmail.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 11:40=E2=80=AFAM Thierry Reding
<thierry.reding@gmail.com> wrote:

> One thing that's not clear from this patch set is whether we actually
> need the Tegra186 pinmux driver, or you're only adding it because it
> happens to be present in a 5.10 downstream driver. Do you actually have
> a requirement for setting pins dynamically at runtime? Do you need to be
> able to set a static configuration at boot that can't be set using some
> earlier bootloader/firmware mechanism?

Actually, speaking as the maintainer of pin control I hear the following
a lot:

- We don't need pin control, the BIOS/firmware deals with it
- We don't need runtime pin control, the BIOS/firmware deals
  with it
- We don't need runtime pin control, static set-up should be
  enough

These are all enthusiastic estimates, but in practice, for any
successful SoC we always need pin control. Either the BIOS
firmware authors got things wrong or made errors (bugs) and
there is no path to upgrade the firmware safely, or runtime
usecases appear that no-one ever thought about.

Aarons case looks like that latter.

I think it'd be wise to send the message to any SoC system
architects (or Linux base port overseer or whatever title
this person may have) that a pin control driver is usually
needed.

The SCMI people heard the message and have added pin
control into the specification for that firmware interface.

Yours,
Linus Walleij
