Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3542212B2B
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747127642; cv=none; b=jOgfrs96ggZa/c5Pgmh4tPQkrjjg031Dfq8JDeYsla2wKctMXniD/GHnEv762kZhqjLrM0osibjCfVbJCZZDbXA+CuXmIiKnSBpEqIBpLhlwOmBg+kzLGDLK1hcUNUQHIumxWOJtlxfhJsZvF3nYSbbzVUch5VLEWJuzAXuO3cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747127642; c=relaxed/simple;
	bh=/SAD+E8PlcSH1+Wt9D26KNtrABdi7IHZQ0z3Lf1kx9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IlTbPGRhQJ/OJIe5PHSk95q3A42nAiIqZMC7j4R2JdDQux9z5G4vtQw1qcoYL2+IHPmaSitQVkel+4Y6ZJ/vX/+TjJy48Jy/oWsW/erlmSqdTGIuVVyjsKlIAPuGbDtvYkQZVXdZX+9LfPNTeKSK7M9dQQIjlZu3QYxZcVFRWqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zf0z9Dny; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zf0z9Dny"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54fc36323c5so4880037e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 02:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747127639; x=1747732439; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYE6rz8ivBX5c5Je+9pTAeUXcNTn8kHnTYdngeOsHIc=;
        b=Zf0z9DnyMoAIGaXecaARiH73B0HYtkZtVtbtqW5eArogBS158f4pcbPoZU40xlu0HI
         TRdxJy61usnw335iD8l+Lhq/cZJWuLkzYAo1UqaDLYPaq8csYFGNuXwj6bOtJWPpKhdv
         Ac8GGYLC9mA7+L5KKAaIOZYrXZnv0nQnO8dqQNpRPDkmIeZUAB6nLVpdgKDxw+eWtOxY
         RwFvDgnN4N3dIAuAf+NIxfbPRw3ZiyJMc7Q4SR1BdrJlnD5Z0yf+OP+4w7IbBgz4L5hb
         kuFeLioJMS/AhridnSBjOW2wTvBNuWPBxWRD0e9QN/quDhgcwrUFtvfiXHe95DgUAlo1
         xP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747127639; x=1747732439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYE6rz8ivBX5c5Je+9pTAeUXcNTn8kHnTYdngeOsHIc=;
        b=JoarmIADPVu2fTZpO5sR6j3MaBGRhqaB09OOnUfk4Himms3ltRqNrogRVcQUuD6NZp
         ieeu50cYNzqlU1b7BCYWAg+6dTu5/ZDBzc7NYOvLC1A5kwT0J4TPoxqgdzp/ywGnjHaa
         EFGnW+t5zaqEluUuYnOP+BSRMH+qEREHva1Xg/8FuMkiyqFlhEMliKR4efZZ9TLF0FDP
         N2vbD8BYUVZlXOdH15GONSAws//rCAFahuNUvnzz0Ene+0YD6LsiLcEkMs1MdcovoDEW
         0tzjhOK8MqQ2kobhXfoSzys/ZxGebVZoREP0NAiaVps2WwMYj7wnbM0qUcgbapO+Gqj0
         ZNqA==
X-Forwarded-Encrypted: i=1; AJvYcCUDhP3muc70p1lbA/U6v5LmFakYAl0AreZC67/v4qlefYVEYmwiiWXkKg39o1cMkzj/i/1t1klTye5K15Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxouhzitg8ECWGE86Z5i9Nm8gfG/dlCQvj+QPEWQUKcM9ud7Its
	5lB6FgW0l6CaeZUngPjAtMhM2XyyFPIcaTW6VhSU2Ct2NROqy7OIsc3WXeS9fu8kKPS917l0UjO
	muaTZhCgJv7EyL77EFgf+xS6zQqoOQz0f12O9sg==
X-Gm-Gg: ASbGnctQMjSFbx5t5f4dUOg9bUFF31+5xK28jorSJhGddljQuxmm7KJcv8vOeFysFCj
	ofHppmeaATTJFi3xQ1l1016IE7GYnYNbTzfAppPiQJNk5CykCa+c/XqIR7bW5+aO/jyhrmYFxeT
	SP/RfLFVv65WJHGpF6bn+7elXZZeaJl3xL
X-Google-Smtp-Source: AGHT+IH/jeTxrV9HpMwi2pjeapptNJlfLhNnNzY1D3MSHE/hcFjWBYu5GOatTwYNUgShX23ZdgCZE+JMddotwLltrJY=
X-Received: by 2002:a05:6512:3f26:b0:549:8c0c:ea15 with SMTP id
 2adb3069b0e04-550d0b29ba5mr955737e87.0.1747127638909; Tue, 13 May 2025
 02:13:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428-csl42x-v2-0-e8056313968f@nxp.com> <20250428-csl42x-v2-3-e8056313968f@nxp.com>
In-Reply-To: <20250428-csl42x-v2-3-e8056313968f@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 11:13:47 +0200
X-Gm-Features: AX0GCFv6EYp1hHtdCbx7xVQ6OsQr3zpfxe4aZJqix-ETEXnpR-jVx_h06K8Q1co
Message-ID: <CACRpkdZeQ=A3dRGS0jLryPO65E7RutXDVZHFuAC19TTng-N1aQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] ASoC: codec: cs42l56: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 4:10=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use devm_gpiod_get_optional to get GPIO descriptor with default
>    polarity GPIOD_OUT_LOW, set consumer name.
>  - Use gpiod_set_value_cansleep to configure output value.
>
> Checking the current driver using legacy GPIO API, the
> nreset value is first output HIGH, then LOW, then HIGH.
>
> Checking the datasheet, nreset is should be held low after power
> on, when nreset is high, it starts to work.
>
> Since the driver has been here for quite long time and no complain on
> the nreset flow, still follow original flow when using GPIOD
> descriptors.
>
> Commit 944004eb56dc ("gpiolib: of: add a quirk for reset line for Cirrus
> CS42L56 codec") added quirks, so the gpio request API will work as before=
.
>
> Per datasheet, the DTS polarity should be GPIOD_ACTIVE_LOW. The binding
> example use value 0(GPIOD_ACTIVE_HIGH) which seems wrong. There is
> no in-tree DTS has the device, so all should be fine.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Looks right to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
