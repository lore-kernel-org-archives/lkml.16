Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB2E84FAD
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745479023; cv=none; b=GTDQRacrhhW+LwbgyVK3YqxtLdIgYQWjLnjcC/8ltupRhFRvmIKAyjOKUjONWfa23ipLd4aDPGQ6PfzHsA4MjMB8Ma0W9EYsKIWNydEdNV3DSjFG/uvAHZ9O7TyPfkpqRl3uadDA998THrKPqwOn9MBTVYGWo2AAupqInFOuf9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745479023; c=relaxed/simple;
	bh=guNwUuYB1XS70rv7UL0LfJmT859rRszSPJy1YBjgdfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZWzTTdLz4KczkWvRs8c57Z/fs8YlRHLu/ZfNNQioPDekEhzVrwa2zFgsd4U3FaKKZgb7D0mrYJp9MVJhZgMrAqU/J97ThahlMyf8uSNVYSkbasi8h/DSjh/TQZiiEP+GL+BGGhneOUOc2IgBYX9Ag9BmBbYnzNr/OIELOE6hPsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iFgq2CrK; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iFgq2CrK"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5499614d3d2so638231e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 00:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745479020; x=1746083820; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=guNwUuYB1XS70rv7UL0LfJmT859rRszSPJy1YBjgdfM=;
        b=iFgq2CrKN5ooXXvj1AdN3AukOU1QQBrq7qbmTZwNi+gDnVp28ahPlbABX2zKqj433Q
         iOx5eplyI5CJpxSRGEOecMF5Yf1p+OUiI6NWbThKgfJhlVGmTUMds0LZBzCf6zIVXn9L
         o80BJ1t0pVW9nkFbuHkSPFyhnoNYSAerCS8gVuO9I2fL6gO1Va/XEgFpWnYMBY36CWlE
         XwLTrTrpcGQArNPz/zB3W6na1sNp3a5sTiTA7kg/79slgAlE1F83UjHVar+nw5LLtSoT
         wGztuShaeoNOdNgZUVRDY/mURz4bG4ANHSFlDfcwWJ/9B0z7N8iUwY8fiuTKlEAeay6y
         BAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479020; x=1746083820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=guNwUuYB1XS70rv7UL0LfJmT859rRszSPJy1YBjgdfM=;
        b=XVP7VUC4zhFaaSXX13Buak0kf1Vn0HNXqxIkY9sKw0jCoJYLd28DrEEDkd9lVOPuPt
         bJBZpu1+iMWUTx8fN9M3C9z3v1UIMMFUHoHLL/zzkztOIOxwbkjX9PCG5ELcC5MS2lnr
         x3tlOdjxLIwoaeeF1qsc+7RWvb1DMIVsFXWQK6KFFd1lmlJ0NBhnFdt2n4KrLfZV61sP
         CFwLVSds8izUXI6rB2SoeApvEWMCE8lOXxxzzF5y+Y2vF3ROVZVJk+MK17W7jPv+4lhc
         zcG4pzxDDVRgdk7JgbTxqd8ALR4VAzcDwdpZYUEWzKVBuFHJsALZrVnNQShLtTtr2SJt
         FRiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZu7XdNXdLqocOhGtbXIy6IR4MFlbjclklKPSVdspQQePsPRQ0g/tMtErtiwri0rVH81ALT0fsjZ3a5WQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKyzpXwwBhYSXd2uEXIr1F5fhAbvkmce5DfIn+i/pClTMSSsCl
	OTzKuunqnSei3lngNY8IdpwiqbkQVC7r44Fet2FSBFu5fdQtr9uJYwHKAllyRqLPcLl22y5jP3C
	qAOZyAdKUlcJ9A5/LfEUkijR+/wveuY5GNRSkyg==
X-Gm-Gg: ASbGncuQLQxeSyR3NXGGmGeAcTFCYfAiOoFP/VK0a2/EDJ/3cMrYxvib9Dgt5VK/YUS
	aS52gtYON/cNmoFqQDT75vL37JHDlQsp3SZvwPMlzLw7hB55cc7VQnbVHgqUtxmdQTgR2x5SURb
	koqcw21ezlvPTUind/VSgU5u/waJwdrbHoIDCB9fqnb9sbklCgHDXGlA==
X-Google-Smtp-Source: AGHT+IG7sbNkW6K4E+gZCj9BvmRurRuIOdRBZYRXKnKeo9MdE3o52+XU5EDUC66JU8GTial2FaxDd9hruPwHijYGY+Q=
X-Received: by 2002:a05:6512:15a5:b0:549:8e54:da9c with SMTP id
 2adb3069b0e04-54e7c41682fmr591334e87.4.1745479019474; Thu, 24 Apr 2025
 00:16:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-i2c-mux-v1-1-7330a0f4df1a@linaro.org> <16b14e5e-e5eb-5203-4cdf-44fbde9a5688@axentia.se>
In-Reply-To: <16b14e5e-e5eb-5203-4cdf-44fbde9a5688@axentia.se>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 09:16:48 +0200
X-Gm-Features: ATxdqUGJSrKABbl7cdx0FUWA6bl4aWMdgNufCjq59VS62rLqVUFNqJgqC7ohSmc
Message-ID: <CAMRc=MeYs0W31Kj-o530_8+EvhoDNzyZunk4xu6PbwK8N1OE4Q@mail.gmail.com>
Subject: Re: [PATCH] i2c: mux: ltc4306: use new GPIO line value setter callbacks
To: Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>, 
	Andi Shyti <andi.shyti@kernel.org>
Cc: Michael Hennerich <michael.hennerich@analog.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 10:08=E2=80=AFAM Peter Rosin <peda@axentia.se> wrote=
:
>
> Hi!
>
> 2025-04-07 at 09:17, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> > Peter: I know you've not been very active recently. If you prefer to
> > just Ack it and let me take it through the GPIO tree, please do.
>
> What normally happens is that I just Ack trivial things like this, and
> then either Wolfram or Andi picks it. The risk of future conflicts in
> this area (and cycle) should be low, so I don't think it really matters
> if you pick it, but Wolfram/Andi should have first dibs, since it makes
> for slightly neater PRs during the merge window.
>
> Acked-by: Peter Rosin <peda@axentia.se>
>

I just realized their emails didn't pop up in b4 --auto-to-cc. Cc'ed
now. Wolfram, Andi: do you want to pick it up or should I take it via
the GPIO tree?

Bartosz
