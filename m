Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0DD12CD96
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 07:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747293685; cv=none; b=d2Kwv/eCetr7Oi2JoKxTnTtqPDKGfKZKle2v3ggkQqAYoSxV9mCrW1eEDqFNFQmRXWI1qon1ycMRsitlkF1bAGgDnoEAm2VK0Ocj6+9coEslgqg4UjLjJZsbO2OJYG4WNidsdf5Nvc2fOIttT2oc7qrllmP+MCogaw0eTeCjFlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747293685; c=relaxed/simple;
	bh=rFA23rO8B1u3kvxa4WIKw/RxaGLl6GEtW0gjkkQkqnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kYTJ5w5IdJJA4gkbmUp/UBXWv1PXdVMiOX9yXINfhjpH5BGl/UrG/xILOUQxXizcDP9Ib4QC2s/xVeekGyQZAAOHeWsA9dQxQnuzy9R/iAAlcmLoGl/74opSlVgI0vw5Rsp4GGJ2vXiL44wKRF5p99QCUP8+MSsU6sToDn6RB10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DoZim4mZ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DoZim4mZ"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so649671e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 00:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747293681; x=1747898481; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6YK9RRVMXkVGqlU6GqJxPV6A7A/9haPaSrRoUXo37E=;
        b=DoZim4mZARrtzj7AnQpB3ITf5KOj5QfSWZyAVA8sLcfWoPRdLWHMynnKR3U6XRKzC0
         ks94JYHXBT1VgCvckLijuffJaAjaD5wy4HCHf6TreUkywkmhsbDZ6/EIZ0tthgngmaHz
         TV19Vh4VWhdVGKPQnIt4Od2/CqVbfSieM6m+PfDop3KVXhDWhBw+rzf/ySNS/UZvj7bY
         OnhWUTXL/+FzbWiiWDXUvS6h9vYNnefybU8gHgtZwisfRtvN1cFGsZQyshdfkUR8ilS1
         q9ncl/JIfPPvCeLClbw4GqyV1olE6hnECW6Lv6qXr2HdNWUI6JF7+haWW7hv/tEb34Wz
         N0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747293681; x=1747898481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6YK9RRVMXkVGqlU6GqJxPV6A7A/9haPaSrRoUXo37E=;
        b=e8LVyXrV3LxIWH6yVZc5lxVR6gS8J5sfmuZhgc6T542iAq9emC1oGe0adg4S8WoD5s
         80kGQ2Zb2PKsE/Cm+nIuQbWlE/Hm76VkABPl/gtodrvy1rszZRwstGtc7AnjuV9KgxLi
         IlY9OEfGums4qoanl6h1HsEosgcdewHPwacFOLlRsYPMf6Ri7hgDu9TVS+WhJdM75Z3t
         yQaS1kEZQRYS/S2k0KndAl710Q9evWeaDJXZTO8spJ0hypofLmHAZFRTlnTNbK4bsYdN
         yOZ34szMuCwXH0vnEZkHAlzoxRE6U0WXZS9NPlaw3Wyq+1Fq22/R5R9sJY1MDeSTlSBR
         7jlg==
X-Forwarded-Encrypted: i=1; AJvYcCWNEQGe3HwWUq8kyRO/rCZqw82DzorCatxVY8YpSxaZY5MiMrgdHkFwTTN9YLSDbO381xJH6tpSQiTHJ5w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/TzxG2tMVwhIQpIIEhyXo2W5JH5axbmf/VkcyUeLUX8+jCW2k
	OXV6dnIrj1ByrdXS8TBWtbmiHcNSDd8MR4uL+8QkEB6DjgQsF6VfkRwIVJhB103MZInUTnBvv5F
	bhotv4hk8Yxu9S/cYhAj3fcO1JYEl6ro/FA57LA==
X-Gm-Gg: ASbGncs7zImI+JVIGdPvZjIYw9HBqzLzU2Kgo1X26S3xqI/wnue539yLmgLvkwkYnbr
	ya/XgBIPJt/9BSa29cM0abc4O9oMD//TkwZomqS4iLJedYYjweDb3PxvUTJdWCTswEEPL9eLFet
	3Kt9KSlG1lb/b086XAnD3QJtP/S6clc139nMhWy0IVO0I=
X-Google-Smtp-Source: AGHT+IEQDghWbCxuBbPh7MoxRvTvC4TcoQ8cazusXwqfZHPvPiHoVHrYr5jD67moVFO5st3g3yaGcaBX8eP9wX1a9UA=
X-Received: by 2002:a05:6512:640d:b0:54e:a262:c93b with SMTP id
 2adb3069b0e04-550d5f9ff82mr2562008e87.18.1747293681475; Thu, 15 May 2025
 00:21:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513100514.2492545-1-andriy.shevchenko@linux.intel.com> <20250514155955.GS88033@black.fi.intel.com>
In-Reply-To: <20250514155955.GS88033@black.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 May 2025 09:21:10 +0200
X-Gm-Features: AX0GCFunPKAkQp3YlQHAKcUwsKeCICBeSwG40YsLNZHuw00mxaGy5pSg_nbMeyM
Message-ID: <CACRpkdbhnoffwtwVTMRaUAGVEpLfAESQNOb1PvYOer=V+og97Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] gpiolib: acpi: Split quirks to its own file
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Mika Westerberg <westeri@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 6:00=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> >  drivers/gpio/Makefile                         |   1 +
> >  .../{gpiolib-acpi.c =3D> gpiolib-acpi-core.c}   | 344 +---------------=
-
> >  drivers/gpio/gpiolib-acpi-quirks.c            | 363 ++++++++++++++++++
> >  drivers/gpio/gpiolib-acpi.h                   |  15 +
>
> All this -foo-core things look redundant to me. Why not just split it out
> and call it gpiolib-quirks.c and put there all the quirks not just ACPI? =
I
> Don't think we want to have gpiolib-of-quirks.c and gpiolog-swnode-quirks=
.c
> and so on.

For OF/device tree the quirks are in gpiolib-of.c and we probably do
not want to put these into a shared file with ACPI (and swnode?)
quirks as systems with OF compile objects (Makefile entries)
and ACPI compile objects are not always included in the same build,
so having them per-hw-config-principle cuts down compiletime
overhead. Also it's pretty clear separation of concerns I think.

Yours,
Linus Walleij
