Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DED23E336
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793632; cv=none; b=Xad9Ndh0eD7MfkGpcfb8223LlfTcZgnhTX/FayGzDlwPIycOsaX84HaxylWSL74PXpNoY9J0R8+yQMtMvhMA/yuJMkay4s6H5g/Rq5Dqsf9c0Zv8m17DcSzK6ZiQSUXhF7nDi4SSQTf7zXT8WIdKsP4v6zUFfJsvq0yawzXqpCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793632; c=relaxed/simple;
	bh=RgseiNL4xvtb+kSI8k8aKXYWnQct2A/yQxTRMzMTBK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oATMe9wQt6zMAm8PlmuU+N54NAfunloN/CuMujj+hHnWGFoPFLI8f2QFt2jNFt3P+B38ApiUh7NwLfRFEwtpuq4hxqEjdBE5uSKbltbR6IQPGf01fWfT4A1IRjgSElElgEwwTAz65RTRF02mMJ3pBRI7qo5nEKhybdhfjmAavOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nW1QyYAg; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nW1QyYAg"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32b49ac6431so7447681fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750793628; x=1751398428; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgseiNL4xvtb+kSI8k8aKXYWnQct2A/yQxTRMzMTBK4=;
        b=nW1QyYAgaAlml33xZDPc4eGWwH6SyJvjst6i7fN5AqmnZKHhvuTlTweXQd8vM3noTi
         gqUaqjNyiR/NgGVxQAB/JuglHPD+GzCY2s/RnatsqM0noXZ5HARLKdwu41o3riUws+WU
         LBptUb7sCLr09+A/Ph+TvgjaTzZiitsL6KSeUHUc9qV/mPWF+J80bV0ZrxaEH+0u1AKt
         W2n1Vb1JmtZomRlaytL8SoPdYDkSzE1GTm4eAbQ+oKDv20NlIdlsP94tuJT65ki+D1D1
         SrB0Z1sUarnu7VC3chQHDF1V8fjvw5pVo8uOcXXC7JWnzl0Y/o/i32QX9JBxW3C/2DwK
         ZVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750793628; x=1751398428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RgseiNL4xvtb+kSI8k8aKXYWnQct2A/yQxTRMzMTBK4=;
        b=ehZz4CXdgKsF7AZ5AvCZHHlQpCsiEM3cDYxmunL3VeNxnC4y3Ualv9U+bNVX3puPhr
         2YWicg4MSYFWM+kzo/o7BcVhJfsDEbkbWDFPvfbL6yepZzPwyu/TERPWh5PGIAT4SfqH
         VN6euAAOFoRyDFW7j6AwbsLyJACRDrr0K4DneDWCo3su/Wjt9oYCmxDqky9jHeK7F5th
         K/yX+7tG7OLU2LRXXvkibP0OGS1l99Htz41+IxnlFCmerY4p5wDgft3FsaZFV9Lza03r
         BhmnrTH+U0lqhH+mXRdxco5DeG8GUa6HJ6fU4+5vY3CWw2jja50WHOAgXRYVk5NfN08U
         Gimw==
X-Forwarded-Encrypted: i=1; AJvYcCVsOnxfzsCBuseh9wCs3Xk2x05Kci7yWssYhe+84QZLDxVnhp7/wa7d6A9ZAWXLetR6yiCwfP3bTXGyW9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnD1FcqHtwJU70npSwm3lBxqXLNVcQHJ47oKLrBFfTdttFBO2r
	l4CjaslCt9oY78I1VGDerxiKdTqptka17aDDbrqCZjOHdNLkBsmxDnvGVfvRA9cLhrtwwP6i3Vx
	UzyOPlXsibtxUlUKPPjVM2Jf+N/+wacZ5g3KgbVg7Zw==
X-Gm-Gg: ASbGncshC4WQqKcTXmIYFnuBrTa2euyhO0jcvoUbjWm2glqhegIOrpwEpJr/9Bru06w
	eVX0WOYZEQFh824/l1Gr237BJgU+FltzecoYcWgmWi66STjGzUNBBfkS4k6DY+XWJeJGhJH4dmV
	CZ74++zx0nO1rCtMJmFjcTY9GA7hTjytbKHTwt2N74yvc=
X-Google-Smtp-Source: AGHT+IE+bxYIyuJMqpkxoh79XW+22rye1okeR/P8QXw1HMjiNPaRsz9kT4xlc/bQbdb4WxO7oPAcNeoNHJl3BaMancE=
X-Received: by 2002:a2e:a552:0:b0:32c:bc69:e921 with SMTP id
 38308e7fff4ca-32cc649f481mr80321fa.9.1750793628527; Tue, 24 Jun 2025 12:33:48
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org> <20250623-gpio-sysfs-chip-export-v2-4-d592793f8964@linaro.org>
In-Reply-To: <20250623-gpio-sysfs-chip-export-v2-4-d592793f8964@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:33:36 +0200
X-Gm-Features: AX0GCFtlvzaIjpNNAu1m_g9IoQS1etZ2n88hEJISU_S5woZgvnQy4k4SmPLO_Zw
Message-ID: <CACRpkdan+5xY6RUbGb1r8OmaB3-xSj_MGGq0oONevqBGay8NYg@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] gpio: sysfs: don't use driver data in sysfs
 callbacks for line attributes
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 11:00=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Currently each exported GPIO is represented in sysfs as a separate class
> device. This allows us to simply use dev_get_drvdata() to retrieve the
> pointer passed to device_create_with_groups() from sysfs ops callbacks.
>
> However, we're preparing to add a parallel set of per-line sysfs
> attributes that will live inside the associated gpiochip group. They are
> not registered as class devices and so have the parent device passed as
> argument to their callbacks (the GPIO chip class device).
>
> Put the attribute structs inside the GPIO descriptor data and
> dereference the relevant ones using container_of() in the callbacks.
> This way, we'll be able to reuse the same code for both the legacy and
> new GPIO attributes.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
