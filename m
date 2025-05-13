Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78C3292080
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 13:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747142709; cv=none; b=OkXYH345bAD+txiRriiv78NGuMh71hQe6SpYTZtKoV6rR0nnA5s9nPVufaxnvvGrSd4pgo+ApWbvKWZZKG7NkkwNQUVF63hhvfpYQzxAoLR7DTpPLaet4SdgWwXa/aDm6wqMu3zat0ndYIUNm2akCxabwISyLQhd0rZchqQ/eDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747142709; c=relaxed/simple;
	bh=oeaPKUbEXcR7UnhZHw3ByvLch2L+QYwsj5q5SBmNOrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hZwqi/2ajs3ZqtdskmxlJRx8Yks44E4TgG9Hc87VnUXpmUjDng23eDcw4DRjCdcPhHto5nuKRv88axCEOLwfg3oPMOKE9c+ptyKQJlaMXZVCloXlpbMV7E0dGCtVlZvwfCnUgFsB2PwxwXQH/R+UxDys2SSyqtL+Z4kpcu1tmnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r1UOD6im; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r1UOD6im"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so7494588e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 06:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747142706; x=1747747506; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oeaPKUbEXcR7UnhZHw3ByvLch2L+QYwsj5q5SBmNOrQ=;
        b=r1UOD6imcOR0vjLR4Ea4z8EREqHxMrwLbcVbFsJ9DHLFpm61/ltUsrJL7LeNi5Qhxh
         prPNPS3JKEOR7qgm0S7QhxzrgPkga+cSVv3BDVZTqOC6ASdpqzWt5rC238BEZcb15uJ4
         0sk2pBPy//2E6FGw9vhlADBJqjsI5o+QpaqqfUjSyZWDMImw97gJOpwUOcM3nbJMj87r
         5GiD2TRI9tx23/cDvftm8oa2VAgqJSrHIygx4gTndK2ycaMtY10lhR0Puf8UIOBGyVeW
         TypTK5yrylagYWvaZ4g/Nmug1nYl/gcCzCDvpbErHCyUvIArbgsmfpY0qZVe2NCQVZoA
         v5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142706; x=1747747506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oeaPKUbEXcR7UnhZHw3ByvLch2L+QYwsj5q5SBmNOrQ=;
        b=xRL6p+sNcMWFHCUpz8DpYuQHPuPJWtzYPj/lOnOMUQCjXH6Rg0wjGgrjdMQOaH9D0Z
         7zWDPo+kP7gvhJdbtTblCG5F7rPlCWh78SzgkCP/vIeAr2WR8ZeB/FKuyirNVWsKqpZp
         k/B0ms0lsm1PartF1aJ4TZg9Irgjqc8wYwyKHXZrLatG2PgyzFoipnrefGnJRE2c6lsV
         mOlMYX1FpQWISmNU8t2uJFWmwa90AiMcVz32LxPPaNQ7gtLJXCnKEf1lnoptBN8CIrmz
         43iu3riGqZXMENvtVnz5qB6qYtSOYg5yrj9OCfhXKKDgZg8SvF+d10e2PXkUlJzdt0gX
         LEEg==
X-Forwarded-Encrypted: i=1; AJvYcCUkNaspsrOJIlkdSvYwELXF5pmO4KapVmfiN+eiquNJud6oFtjW2uvXRNSL1HKYbQbE/A4btvjxknb0z/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqyioalaOp3UH9IokPGa//dJftWdTkvDniq4BxMQcPGM2yj17i
	A8X4kLeTh2zvEKMiARWIwlFkHF2iAvreJTfibzYcx6EMA9agmZ535aQnBR9DrbFf852myjoEWzj
	FaxJ7fB7qwOxTKOkh1+mfNDnXFR0XYkoYrYQ7FIlhmMyzOFx9jdA=
X-Gm-Gg: ASbGnctoBn9jgHnNjPO0S+lRgRTtkguQM40+Z/qgCBy+/LT9PrNM997cdYNGARqwehM
	uQx1HrdKfxOrtO783K876pUoyiu6TH/yg0g+PIAp5watrJmG3+85jkreLXUZtm/yFmYJ+nbk6KB
	afkI7s/ffRdCEKZuI3ffopPnNYJIb7X9r/
X-Google-Smtp-Source: AGHT+IGrFe0tuAriV566xCxGXQdjanyVItnT/Sux+rzaMTjlQlVvAT/07pib6nmXkVlcFGa3WzzOP2qmoucOJhH9xsM=
X-Received: by 2002:a05:6512:2283:b0:54b:1055:f4b2 with SMTP id
 2adb3069b0e04-54fc6763856mr5251355e87.0.1747142706043; Tue, 13 May 2025
 06:25:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1746662899.git.Jonathan.Santos@analog.com> <f62bcaabde172e0b2880f7d05dce97d684cc04ca.1746662899.git.Jonathan.Santos@analog.com>
In-Reply-To: <f62bcaabde172e0b2880f7d05dce97d684cc04ca.1746662899.git.Jonathan.Santos@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 15:24:54 +0200
X-Gm-Features: AX0GCFvMmIKAiesRTZ04kXYyY8RbLpVm-_ozv8YU8-R0c4lMc2-ZzlahfAbU6BU
Message-ID: <CACRpkdbWauD3Z5TMdGTmVbLC-sBBNJ4wCqJxoixQMwUHDektrA@mail.gmail.com>
Subject: Re: [PATCH v7 02/12] dt-bindings: trigger-source: add generic GPIO
 trigger source
To: Jonathan Santos <Jonathan.Santos@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, andy@kernel.org, 
	nuno.sa@analog.com, Michael.Hennerich@analog.com, marcelo.schmitt@analog.com, 
	jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	marcelo.schmitt1@gmail.com, brgl@bgdev.pl, lgirdwood@gmail.com, 
	broonie@kernel.org, jonath4nns@gmail.com, dlechner@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 7:03=E2=80=AFPM Jonathan Santos
<Jonathan.Santos@analog.com> wrote:

> Inspired by pwm-trigger, create a new binding for using a GPIO
> line as a trigger source.
>
> Link: https://lore.kernel.org/linux-iio/20250207-dlech-mainline-spi-engin=
e-offload-2-v8-3-e48a489be48c@baylibre.com/
> Reviewed-by: David Lechner <dlechner@baylibre.com>
> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
