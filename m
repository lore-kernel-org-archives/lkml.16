Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE7822B8A4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744789453; cv=none; b=FIEpUXtReSDha/SnzYGSt2gSXufOdPTK351hsbTKHnuubbvD2LwdZsqytTEB8NL140XHrYQvqCpOW4v6IvaoIESAG1Qa7e5twFGqhWvEz37h+53r3HzdLWhJDF+znT8jeFbY5DhQ/yjjQfovbHg3FodiRFiGUiQAKNjDqYlDGNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744789453; c=relaxed/simple;
	bh=w7BUvBYqTMm1Ze0afEibdThADpsOyoFKneytr7BCkqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XQfUrEYhrv2YBXkvnibMFkY0U4nDZ/clxOi9lhDRyzajZzVU5wPposT49hW3JNJtO0FkjjyMJDv/fVFALp5ngkLCFIm5LSiiV+Wh6s+RuLQhKtTURKAnae84IxDmmAIMgHhi+7HFXcksh9HoKRO51p4j6t8lCS04RUPTms9Fb8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Iw9rziFQ; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Iw9rziFQ"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5499d2134e8so7759642e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 00:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744789449; x=1745394249; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7BUvBYqTMm1Ze0afEibdThADpsOyoFKneytr7BCkqU=;
        b=Iw9rziFQ0zflq0thJE07XZeRtG5fvZ/UHqo7sL7GBaNh2gWnF/3MHaGz5+4ixr6pk7
         V/lAf/TNIXxPlzuBL7+uhsdWqGzWGj7dwoqFVbnrMFQkCdgF4tI+lx0ay5Nv0HdfTtDw
         IgM1sFW6iPaEc89Yr3Lvnus9Qb7n33KGMypsVe+P4GyClXjIeNd1O/WfNBG/nroXjPjn
         hn69/rtZhnOSiBg5G5lv+cL+yi7nOjttmz01oO0VGhGF2fkXXj2k4D1SJxveuHxvt6hr
         owg1y23r5FbLoiRiMFV48r048dIcmIc8SfiRqGQ8KCxFcDxZGW5bJZbjWeoNbSpHUeQp
         U60A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744789449; x=1745394249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w7BUvBYqTMm1Ze0afEibdThADpsOyoFKneytr7BCkqU=;
        b=UAqYF5TKSPT93ks79gJFovUN+xltHDWIatM331RjonFcceWF7uRkfbZgDI589xoB+d
         SyEYHSp7QQTiENeuVS62mpOuqQiOSgKe9E+M55n0DmwyY/XeckkJ4HFZQ6sQDvB7jZ1H
         v0ikXUteUwEaDO1z6Gy3SSgM4INZZEXqFCXJka3W4mZ3IOFYJRrrBu1jwSEeTqoHOywW
         KWSehIXnNx2DPs40XiJaXNHu0ab1kxMrA+RuAj0z8zaG89xg6t/hM/oxXIb7eYSmhvj6
         UFBxeE9zmGG8fWQTpG7zumdx10NULNuu1Pk51U57o0luGkZ0qkBZkr68YR75+27YrJ+q
         WuwA==
X-Forwarded-Encrypted: i=1; AJvYcCXR0CuUEvoqSxUjltjzFYD9LRDAiT4B6w3FG4Rsywng54HdH/JbZKIpy0c7aKA+r7aCVyPbkNspjSVIwM4=@vger.kernel.org
X-Gm-Message-State: AOJu0YweRzlmAG/Av5M6PmHnm2KiaYU40ey/Kk+rWB+yYAfh1DPomASF
	iexGKMgyAIBjU+lp9/MspozFpkJ0cFp1ycALigF/HaOxqwhlaAHXxdYBsSmfKiyj5AT6AQoPM0S
	6+gjzOYsUrXlTbBd2r42/ahvfRib9iJ7wm1arxw==
X-Gm-Gg: ASbGncv4K9oT12VHuD8cC4uhmRRqRSf/cypjLcLcqdiiURp1IVE8sN9wuUKAOCxUswp
	TITrC2TZWkt63BOvdEfcSPXg02OBuC5gcfGMPivK47SqsaPBNfJzxnAlhGm+3lmjTRNt0GrG664
	5Li7DUHqonRdg6QI7nfoGqjQ==
X-Google-Smtp-Source: AGHT+IG0Lwyub0udHPr2t5fpOsIZ2RLg7Lkae30HWcbs+tlOsVB08fWQavStEVsRHF6ju8VE3aya9e5Yj0LjLkUgobg=
X-Received: by 2002:a05:6512:118e:b0:546:2f4c:7f4f with SMTP id
 2adb3069b0e04-54d64ab0b47mr201581e87.28.1744789449414; Wed, 16 Apr 2025
 00:44:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1744325346.git.Jonathan.Santos@analog.com> <414f5b60b81f87f99b4e18b9a55eb51f29d2225a.1744325346.git.Jonathan.Santos@analog.com>
In-Reply-To: <414f5b60b81f87f99b4e18b9a55eb51f29d2225a.1744325346.git.Jonathan.Santos@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 09:43:58 +0200
X-Gm-Features: ATxdqUFrHLfUgDMhA2bIeO0emn67mugRA29Aq8hS3KKX_3FOQ4i_PWerQ3Zb48o
Message-ID: <CACRpkdauyPb3bhgK4MTYN4Xq0cM80vwT8i_jcKoQcicpvMo7yg@mail.gmail.com>
Subject: Re: [PATCH v5 01/14] dt-bindings: trigger-source: add generic GPIO
 trigger source
To: Jonathan Santos <Jonathan.Santos@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, lars@metafoo.de, 
	Michael.Hennerich@analog.com, marcelo.schmitt@analog.com, jic23@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	marcelo.schmitt1@gmail.com, brgl@bgdev.pl, lgirdwood@gmail.com, 
	broonie@kernel.org, jonath4nns@gmail.com, dlechner@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

thanks for your patch!

On Fri, Apr 11, 2025 at 5:56=E2=80=AFPM Jonathan Santos
<Jonathan.Santos@analog.com> wrote:

> Inspired by pwn-trigger, create a new binding for using a GPIO
> pin as a trigger source.
>
> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>

Is this actually documenting the trigger sources I implemented for LED
here?
https://lore.kernel.org/all/20230926-gpio-led-trigger-dt-v2-0-e06e458b788e@=
linaro.org/

Then maybe put this in as Link:

I tried to figure out how to properly document it but I think it was part o=
f
dtsschema and that may have confused me.

> +title: Generic trigger source using GPIO
> +
> +description: Remaps a GPIO pin as a trigger source.

Please write "GPIO line" instead of "GPIO pin".

The reason is that not all GPIOs are pins. Some are other stuff.

Yours,
Linus Walleij
