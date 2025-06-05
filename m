Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628C02327A3
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 13:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749130419; cv=none; b=EKKjgmCLHY3jk9ShKWA1Lt8BcVSJh8VCeGSXc1O3DHthG73ye90iOxwmbKYkyXKQP1bISiTW3Nq8kk9Gn6PKuUxdH1hWCRP6pyYrZEuwvfQCVWrESsRJ18IVKUXHs+1eRLIGTB94E/B2t85fSxxRWpgNnGvKaute1ZGoz94Bz6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749130419; c=relaxed/simple;
	bh=VUknEBTdSjzH3vSAyO97+fdwjTdAd0iU+EtfDLbIzJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RshFKUMTjCZqv4m8MDQzIxkNBuJV+BIfel/Rzl1ckvAmiME+blDxbH4Na8X399+hL2TRSW94TAfrZranbub6w6FLXHv2E+h72Jjmr9zUO3aqIpau4tecJDLdqa+ShTX7ol4OflCQTnDbbEaqIB1Etf3zTwoIjgm3TGd4a+TXuSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oO89MaWR; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oO89MaWR"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54998f865b8so937544e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 06:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749130415; x=1749735215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUknEBTdSjzH3vSAyO97+fdwjTdAd0iU+EtfDLbIzJg=;
        b=oO89MaWRZQYYIdAXI0QboMa2M695ugR4shKTGo10iJ0LW2logpiSHxfroMIGzb4DcP
         R6oCTjJdKjljUutH3L4DnXSQP1xbN9nXmb2HAPstu7YADkVy7q+iqKaa6CJD2tbePkBg
         zvIk5VnvXTeA2NosMkH0zF6zDTHNSwhGtmOApci4nQ2epnN16XL8fMKNrBNzsMq1xPHq
         /0FzV1Kc4MyBQ4+67xvYcS+Vp/qxCnd0I4GCfFmID9lGAquHmQXz0M+b837i2Aa0Mcv3
         dQn3LX7yzeHuCpLjHdBwgh7mcffoq/DCghjebZli08LnmYU00WifHt+uVauxSTUgORtL
         DZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749130415; x=1749735215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VUknEBTdSjzH3vSAyO97+fdwjTdAd0iU+EtfDLbIzJg=;
        b=i6/Ic44ZStB8mTT/DCOP78UBAwz7rzACzZC7TsAB9DktcVIR8vfdgqy/B966UYV/Qu
         AWVnH54eOmNROv8oxmboo/fOG3huNsJt6/r26snmlRhCWc0VrRJHsEwiw3vhJspQHcpX
         T/LycY5j6nPR7svrqc40H2bTD0C4xiRR+IRWXCjTngY8HA691A3OLIg+7+9pO+J/ttbu
         ku1JmbhcXq7bntylVZxwC4sNWGeZ0xMnqcAb/Fy3vCjOnUTMphviWvSAL30CxSxoh5zO
         OYaV8VYwNqINHbe9dXzauUb8yilbucBWlxq5dpc3bDK2oDVTRaNKrQNjKDk/fxhbb8qF
         nqnA==
X-Forwarded-Encrypted: i=1; AJvYcCWFI4EYAwhpJLLR5tF4CjOZvRbjqKCX4g9kcclCP/zlCrYwIJZhTwykr+WQ04/0t4XizWPj52tSBPjdWJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC4ogt2QDyJnUBj0qN9XRudqhGZvRjpIb7RsKHGfDE+Gp6WGjy
	9n2N6hr7s7eFVT548QrDFqtwgG+iQWln4RZi9vvp0WN/coL9R123V5NOQ+XctehA+z3tn9wrYaw
	L1f7PCQ1s6f4Cb2mNpLe8ZJYOq6YE8op6W8K4gOHVyw==
X-Gm-Gg: ASbGncviHMcxkg2DucGr23hVbrSRq6dSuFMe4sii7d/KW7j3l2TK9JTqylFEAvgt9yR
	0vXGFCpmXsrRQyOQ+M+J7DNYPk/SvHQDNcw15gqRSNXIhyW4z8E7VEy6//+b7D3iyg6O2XkQ+JC
	j8Xlh/5Q6bXhnXeYYLl4Cvpq762ZSoAChRfYp3X7+WvAhdxzsCXzbJUQ==
X-Google-Smtp-Source: AGHT+IEgjC4fcmg+OD5IGVLjZUrIMPEfYs/w9+6VTW1vagtiTaUcBabncwsUcBazgBGF/ZYxoheFQtZJR4MPvZFNfsc=
X-Received: by 2002:a05:6512:3c85:b0:553:2e37:6952 with SMTP id
 2adb3069b0e04-55356df1e50mr2121333e87.55.1749130415411; Thu, 05 Jun 2025
 06:33:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250531212331.3635269-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250531212331.3635269-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:33:24 +0200
X-Gm-Features: AX0GCFvHxiWRpP5cMCB8iSavv_JwXNB2m6sizTI16LHxsIHw9CZ-Y-5vnZK5ofQ
Message-ID: <CACRpkdYD1F_AGXkeEhKcfS8BZxgznmfj_r3BBaK8LJLQJkDMvg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] gpiolib: get rid of devm_gpio_request()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 31, 2025 at 11:23=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> devm_gpio_request() is used by a single driver. Replace it there and
> kill the legacy API. Assumed to be routed via GPIO tree.

Excellent cleanup, as always!

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
