Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03651D63FC
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750241726; cv=none; b=CGsBiLkKinGoVS4lUelAnYlwNNk8R5wQLGAgnIBsY4j5B51exNYIR8Bn2xLn0JGy52wjA2LUYCa0+ODEhiLwbf2wYhfM6NKYSYJuwTWZ/jzp42DQpnhuPLto7J9Jf2jj5i39Bu40nX/t0CCODJ+fX0AlRzv2N+Bjs7wrUJrgKmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750241726; c=relaxed/simple;
	bh=jD921DQHaDQ1ESWyrhW1JyQ7YkUvB798UiZzCJTny/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oc9hL5O+pCI9tRFjTdUKQ6+Qhcv8uyVTvzHi8noIN1ImyNyykCMMNmEiQsUVxzEuldGvo5/gRGITJ8CxBW4/oocBTbC8Bs0FIcmah68cN6HwgbQ/8xt9oWkLapDy+YvR6n4Jcftw6sp6MkLyMo3hJgjluopHvocg95YFF2xkkvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lJgl9yHq; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lJgl9yHq"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32ac52f78c1so67551471fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 03:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750241723; x=1750846523; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jD921DQHaDQ1ESWyrhW1JyQ7YkUvB798UiZzCJTny/I=;
        b=lJgl9yHqBu8jryFDFVQ4GSv9B+Z8KJq/GKGTBxW9xGW/sWdtlDPr4FwVt/Ms4tYBw/
         wzKjkA7uMQt+M5fRcqW4WnnYuVrzDu19CLbuYJZvJGxdHdD8c7HYr8xidqWaTZ/zprWv
         MsND+kOgGtUfAzW/gPhbA1wgOZyiaEpAZjLL5+Q4lpMQA2Bh76RDvXRokkIoFpBEKbpQ
         UvWFJq2eYm7A2Lxa3BRZHaRQ5+ZmKPLgoNsLi8DVBuTUPf/xFJXj8i4XN+soFPB+pF04
         9T2MGXBT2y96bDhfzrSXSwi6qq38wufY8ertY9hZt2o4k2UXrSmqvqtOjX90BoKutrph
         QabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750241723; x=1750846523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jD921DQHaDQ1ESWyrhW1JyQ7YkUvB798UiZzCJTny/I=;
        b=abSiCjavCpJPUDbtUo/bXIY7Ous+lyHpFV65N5W3P/IpfShRqa2Ve3GjvtI7xRXGBu
         C/hSOsxCkJHmZHkc2wSlaLcnaWL2c65MdgEYb+wd60piNGSvgXY73fY2LwJtVFerXR09
         paDReYKGYIZ266H2v12YkGFyIfsgxwHix5auwyxC26DrvoUxVN1EdeqQrr/kViLW8kW4
         51zkfGt68nckYBDhTRep34RjyK5B7wW3k5a6r01nv/Ji94hliNjU1pD2M+3DI5Vt3Ap1
         55A9vAJI9C2Ueubv1YRyRUq3QidBTfi5v9+3rmxFN+Iy28/drhYF71BD5zMR2wfXKVWw
         gqtw==
X-Forwarded-Encrypted: i=1; AJvYcCUL5mCtSQEF02kX0cfNocPXSLvuP6+HoUUd9PEb2GPGVrGcGhExCdGkFUW1rBTiof2x8Lo3xhBDDCNyZVg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yytu2aqFbe5LlU3LpYmp/k9RecV4zxH6CHXPOlIX1TGI+lqDlGj
	A65wGiis7wHWQo9p4X8/orEGFKicFlaoKvxvL4vRjmvxt8zl0Jq2G5RAK99X6u+a8OI3llo4a/b
	59InizpGlsQzdRy9XQk5Nk+sTVoQpxW2vrN3h9Mtf8A==
X-Gm-Gg: ASbGncvb7vo7eQdVl14juk9ULb96un3eu6eeQPXmR/tijtndPRxTmI8HehUtYXfEWDv
	eHzMqvVPYOo9Hw5f2iZ3rlwVDFkJiFDzKQdYzPBVzEhNLffWjufCtkitK7+BjoEPs9joilIeme2
	oQlmmP17rbrQl5Y4ErnIbvZRnrJ16n8bJoE24Ob89lAbM=
X-Google-Smtp-Source: AGHT+IFgJoTNO+BsB4HVVc11Iwmn03x/+8pEoCMR5VEUoD09rS2tyjDc5RccGdUlZPyD0CvACF53jo8rK9pUhRXX4xI=
X-Received: by 2002:a2e:a546:0:b0:32a:648e:7ee3 with SMTP id
 38308e7fff4ca-32b4a6dbc53mr60545701fa.25.1750241723005; Wed, 18 Jun 2025
 03:15:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1749582679.git.marcelo.schmitt@analog.com> <834e630a45f8b3ffe93f5663b356046d6c6fdd95.1749582679.git.marcelo.schmitt@analog.com>
In-Reply-To: <834e630a45f8b3ffe93f5663b356046d6c6fdd95.1749582679.git.marcelo.schmitt@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 12:15:12 +0200
X-Gm-Features: AX0GCFu0MlYcjSENoy5QcqrOme-qHw-2bn5oP7jO7v4dKtoPQUQWh1af-rRa5E8
Message-ID: <CACRpkdax5amh2ei9QJDzT12FQwg33Mnnv5iJphzM31gL1mupMw@mail.gmail.com>
Subject: Re: [PATCH v5 08/11] iio: adc: ad4170: Add GPIO controller support
To: Marcelo Schmitt <marcelo.schmitt@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jic23@kernel.org, 
	lars@metafoo.de, Michael.Hennerich@analog.com, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, brgl@bgdev.pl, marcelo.schmitt1@gmail.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 10:33=E2=80=AFPM Marcelo Schmitt
<marcelo.schmitt@analog.com> wrote:

> The AD4170 has four multifunctional pins that can be used as GPIOs. The
> GPIO functionality can be accessed when the AD4170 chip is not busy
> performing continuous data capture or handling any other register
> read/write request. Also, the AD4170 does not provide any interrupt based
> on GPIO pin states so AD4170 GPIOs can't be used as interrupt sources.
>
> Implement gpio_chip callbacks to make AD4170 GPIO pins controllable throu=
gh
> the gpiochip interface.
>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>

Looks good to me!

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
