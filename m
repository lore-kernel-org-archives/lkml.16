Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7291DACB8
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705828; cv=none; b=pY/XszHUDBgZ9dFT2djMGfz2Fo3Vo3ocWyOi8NeL9vSjaElAH5vzBVIDEImmI2v1SIb9mOlyMHYsXbETMlNnBce1kIH2+3Kh77KP69Lm8snrJHHBawfoYUXGxBXn7h9ms51wKRogGpUj3C8bSU8FVrc8HJl0otsEfzuHpUdLL/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705828; c=relaxed/simple;
	bh=dA/4o6Pc5kzYT69miDJELdy/TW9cYoPGWvldFsoPOqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pN317EXLIwAcD7DITiWBH+1W/DIYWPr2WNaVcb5CoRfIcxtH5QOMiIai0vmRpG/Mo9TvWyPGJb7nTRgqPn6+36QIqUh7ULKy134nF7Q/qVKOpXhbi7e1b/IXsX8/igyPVd/7di6YmYjGLPyBjaoNWPtlSacseJHVnKR7W46Plu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EJr/fFy9; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EJr/fFy9"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso54384301fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744705824; x=1745310624; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dA/4o6Pc5kzYT69miDJELdy/TW9cYoPGWvldFsoPOqA=;
        b=EJr/fFy9xKKf1odUcpDXeXaHHrIC+IzANZrzaXl/skQTpOSSzi1f6GRToQaBLqEmX9
         1c4K3iQNZKXX2ZzpahxyGRv7+sCTu6mmmDvT5sYcHRrDpQF572hqa4Oy7MMF/k1yu/ro
         VSQ/aawAGjWUOWOe9of9NW+EIaUjmf8BzVgGJHYxrDkYCiqEByKaQx9fhAYAvEeCIZ5W
         C62C8xRLIf/KSyoAVNt9DBq9Tynu5HRfiKkgPstyaRBa5Wzx/RlouiReM2U169iYl4L4
         uP5nrLQY4wOjnTm1/c8LvDbZ3w/BwAxBqfDqzkvymFYMc6tCy71FYuyd91KCP6a7GIKF
         v5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744705824; x=1745310624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dA/4o6Pc5kzYT69miDJELdy/TW9cYoPGWvldFsoPOqA=;
        b=Lwd/hm33lSljnf6Q1JrHLIIBj+PDsp9qud4vnoioxvJ2s0BmZ2Othny4Ly+mlf33K4
         c6EjkllGlGMRl8pk2qAHMHzuSg7RIPO1UPONX3I7OWQWVED3WemxBa4xKXpFI9d1Y40Z
         N9Tr5EWZDpRJo2Ob67Hz8YY1W9CPILFZ6DqUksfnNf+h+Tqa4be+6ViBdqSePE8ZdqYF
         2m+Smieg24zafi6WW0o5Bm1aw6Y9TyebV8iKPeK7B7XfwRkN6Hyt0GmOILcqmM1Lqlt+
         nZCQgmkgUx9W6T8yKIx9DdSnmjAFW/WOurHlK9T8BIL3uurm2b0E14d6Skh7ZtPjoBZv
         RuwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXc7Iq8sDXQXIwaktGXQqJFWpcHkJpKfbKb5KwO47FeQkLj5zMDmfiRYYUs+hrwNHQLzt08NMkD0yXoVkE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw15WdJc3coYELn4+fUj2QJXn1TKHacoOWLeGbJtFxU5z163oSU
	GSwcVEAiXj3zzwvla91GRMqmFlw4ccwRO/arTDf1cu2dSaxC4kxJ0ERiYwXQEbTwUiLKr0+0Hqz
	7aMd5T8t7CsU6XxkmcT/htPrKFkqdISj9lIELVA==
X-Gm-Gg: ASbGncttraswU3pmmbQnS3KqsLDCE0DTNAzYP8PTivLMymEJQj23KUYqVo4HmtuEf/x
	x2c6eh67rK/otgpwdh+4zzLecjcj8kQDNMAVKICpqcvucEiBh9zSBhpExfIEJ58m1MITKnXT9eP
	BLUzi3T9gcEN3cmxxKKeGw2Q==
X-Google-Smtp-Source: AGHT+IFnkHgPenci5JpbiQ78vp1k4USgnq/9BvxSzEHvpE09Vk7uQXHULEOnoM1NzoUs2NLhz2eCy9/1WL61vHKGtdU=
X-Received: by 2002:a2e:b8cc:0:b0:30c:12b8:fb8a with SMTP id
 38308e7fff4ca-310495188efmr46416771fa.0.1744705824468; Tue, 15 Apr 2025
 01:30:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org> <20250407-gpiochip-set-rv-gpio-part1-v1-5-78399683ca38@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-gpio-part1-v1-5-78399683ca38@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:30:13 +0200
X-Gm-Features: ATxdqUEjzKkwmn3_RQShaPxJfoWorbzsnHaGfDvqxf3hWT_HovesOIO4Pl6zfjI
Message-ID: <CACRpkdbOACAtCr=DymS4GtauS9PuRqtbjWsmVTDmqGt97kkhSQ@mail.gmail.com>
Subject: Re: [PATCH 05/12] gpio: allow building port-mapped GPIO drivers with COMPILE_TEST=y
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:13=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Extend the build coverage by allowing the port-mapped drivers to be
> build with COMPILE_TEST enabled.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

That's really helpful!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
