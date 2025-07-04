Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F03828B40A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 08:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751618597; cv=none; b=I4/uSs9tU9m03CXOr78OxP+3dI6KGzfToK2ndOuYRHokyEc7J4iYuiXIPv3yj3No/Q4cZHxhsuR98jxXMZirsPmfpaApkcbfGMLHEdYT3lqHMMHbtJHjOF1USPVBLae/kBJBiZ+rgIpl8S5sKyvJuBBxBAdnAUXLMEOOuDgcR1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751618597; c=relaxed/simple;
	bh=XWPuLH+r945MMXMKIDI54FYqxlY/reitRUTj8Ejgnuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D4D0nvlUTeGU6QgXt35I/zd9fSI9eWKDgVRqDF3LvG0EL4bYmhNIL5j+SCptS9VCWJ1rAqqEx2SPDnUN0WKykHyBjhn47kYrYV8F4KpJ2YTEkMfYjCt48i9VOeIM8qaqCyrj8N2/D1o2lMym4y3MbuhAjJwVlV0nxfIvsst4QY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XnG8IIrk; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XnG8IIrk"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553bcf41440so846975e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 01:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751618593; x=1752223393; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWPuLH+r945MMXMKIDI54FYqxlY/reitRUTj8Ejgnuo=;
        b=XnG8IIrkaR4PiO2w5NhZizCrv5VJ8gOFBTeeRewG/O8LNKor/464lUJadrQ1rZlljH
         iJ4ZQTIkfaa/mUxRIXa/2Ev0HsFLlf804FyJ/TMAW5MK+pwG+p3POASsRFVOIM5G2/0v
         ZRQQJ+ER5g0gMZzV/3aO0/kDeqL7KEmaIzaBd25o7QeC5FOGXJOjNCrUkHDB0cYTf9gh
         hXFF+jny+BkHwqFA9VwPAmU52AAdf+50HvxTFaMp+yfqzGeAgx/GikIG/hKyMcylqEAe
         uDareKppgpvC/0Xge1rko+itxMOrmNnNkp7ltZNon9v7CpbfO0yVAywQh4EaDKMZEszq
         +BNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751618593; x=1752223393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XWPuLH+r945MMXMKIDI54FYqxlY/reitRUTj8Ejgnuo=;
        b=aXUmE5yN+NLsP/h+h2156we9wGFTsLm9yk1RBMnwhYh8X1lKvoe0W2PDn98CKonsuw
         iJcUF026Am20rw+s1bawfuCB7usQd+gBU7SWiBV4AVOsG5VedZkq2cXU1ON4J0rswIhi
         QJSvONYaztLP/GfTUX+YFzUULEg71ywwrJm2+Uo7Xh6Lc5zDSIzpzUuttbsl3rS5zxXf
         a3aaCr0LlvvlP4CKC15cs59pPVcb4PU7OwT+qchfylJsl4smMltkTI/iX2Xtoj98nZgD
         hLUfpmNuj67m1rCyp383XiCV4pSH1DRfVWhHHrL7Q14UCAc867gCtJ+jEMg23uZfirBf
         Z5YQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAK7j3di+YAxIIoRCbSGZzCoFcVsTo3RP9pp/tA22Jit9WvUzL/if9bBUJ6D7AKLO1ND6BtHkO79rKZXE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIt2fEhVVdh+YZbfEsP8KxCYRrD4jK/oqPYcV51577fvsHT5i3
	3GE1R2mieWX1plCWcubVEoWOggkaH/PtQvDUN9R/m5eJx/EpVmUAhE075yzGJF5gw02DdOwwt+0
	dg8kTI0GmU2iafkqXXB2XpCC/pLwKrMtEupKiNbfdQw==
X-Gm-Gg: ASbGncsX3oYk96zZY8XvAkh7dGbdV6puP3pnssc6J88IOPbhRy3rhSN2xBTQu6d72Gf
	mnCJYw+xu6G9wJ8CD1vnnuTUTOVsmWc/u+EWMjQBMbftk+Us4vRGDyEd/CUs4/1byL2kfCpgJLO
	Tk8rBkihkX5HHe9ujC3p70hTZOkHv4nOALhHvEtFU49TE=
X-Google-Smtp-Source: AGHT+IGygUbBqXVfLxaLDk54V2AN8vVvj+sifspuQseTLX5ENvM8EjcwjnY64cUuxldDodJn88Si0MNwx96DmR8ZR2k=
X-Received: by 2002:a05:6512:15a7:b0:553:23f9:bb3b with SMTP id
 2adb3069b0e04-556f2f25595mr495692e87.49.1751618593487; Fri, 04 Jul 2025
 01:43:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com> <20250704075425.3219648-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20250704075425.3219648-1-sakari.ailus@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 10:43:01 +0200
X-Gm-Features: Ac12FXwoTDxBT2X9zSk4EsbKoD54_AAQBokPURktdmvdCe76XBldGoZG3G1FI9g
Message-ID: <CACRpkdZewS7FUFZZTbR3QXZ6y_MPD0g1vwMPmx2ALA3H7+H=xQ@mail.gmail.com>
Subject: Re: [PATCH 35/80] iio: magnetometer: Remove redundant
 pm_runtime_mark_last_busy() calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Gerald Loacker <gerald.loacker@wolfvision.net>, 
	=?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Waqar Hameed <waqar.hameed@axis.com>, Hans de Goede <hansg@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Jakob Hauser <jahau@rocketmail.com>, 
	David Laight <david.laight@aculab.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 9:54=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:

> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
