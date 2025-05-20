Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70291E5702
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 22:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747778456; cv=none; b=FzGW/fvn4dcUt7uug4k1ISFkBs779WmTMQ9m6egBALS2PNHWxBq8rUGygxFg2j+n80Y25XmeWePtdbBh5dLSNgwznwr581N5uxNy6ekPBGK4iWvrimSsBhZuI7/6qtDZN8ZJrd4N57KZJI6A+esbGQ5h6R8baB9I9WDB+GgeuVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747778456; c=relaxed/simple;
	bh=aesLXUD8kkfuC4JloYbEc/GKhln/5QM06KKNgtCf/ds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JXaVFN7+Dlj4QgcEV1pu3mEpufFwpuwg+BEagBAFYDdvfSzapWdcVa5ZxjcKYeNSj5iYGrD5tCB/fkXk4QDKCfik5r2t8HwoyQedF69LdA15433H/+0BeIskoMgOfC1Gxdc6hodX5SQt5nORdiz2C+vRvoWHt+D2YgDRT94ZWxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eGQInvxQ; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eGQInvxQ"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32805275d68so33085481fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747778453; x=1748383253; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aesLXUD8kkfuC4JloYbEc/GKhln/5QM06KKNgtCf/ds=;
        b=eGQInvxQKSs+gUkpm2yg0xgBm9nMhukoGPCGzTRakA/R0mRFo+OHpNwEyDf2sFq+Ds
         zVNt7oBCcRCHsPvLggTj+cJ1ryLrtyQ8ASUSfBsLE7Zd9CXERyPXMq3VK2FaTUJ2Tqnm
         3TdHJh36RG+nMkORN5W8T+sP9WpWunAi5QpkDxFy2qU1GD5clii2CpohT19DgZKC7SHC
         4PWGBUymgtAHG/aM2Juxjhs4Y7wxdU23eZkedpvWijG5oGSgzp7SSnyT8/4dmrI7zfs+
         hBdBN0UvkW4h4S3TrimxF8XqVfu0PAF6+gfaVX3fMEdO+wmuI1caj0BXyQ9GF2j81ID1
         QDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747778453; x=1748383253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aesLXUD8kkfuC4JloYbEc/GKhln/5QM06KKNgtCf/ds=;
        b=Q/K+sXs06V5IX6FPf7cleugFMhLx2OEtj8kzLv0TEKDV84ao4/YxjB248k7pwTvuk/
         dvXdbZMlIjwpCqS0F7dvrMydVAkOQMIxSXI+WHv2JyvyzD/y9+LiOVCh45vn4Ep9mCv7
         ZvTjNd+5FzdPKPp4E1OO4L2uzsPtx3Ceh8r3aVgPU0IFuZwKDb8IXQwDfgW5+p7VHX7o
         uHRA4XtY0di33dKTdfI7qr90+Fo/ZHtfIZF1S/ujGVKcxCZRVBDqrcRjFDsfsQ5Q+chy
         66AwbU+xKPbCzDVTMCiSKchUrJmQqHL8XG5TmedFOOaiRR4ThJjmt0SV5rtLB8x2XmVJ
         xgVg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ6Fv9fHybK4dQTfuCFOYj7QofM/3IwSZzmrgcJ33JCjmWxoXIwbNHN2jNlSOm1OW/f8TzOyAVozERdd0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlopay2z+LvLXrTspcZEJf/4vAJAd+2UdhYXeo6MnsOsB1//Q2
	ka7dnmtjcg3z5EXK7x/jPgUjn3Vz5jQ9pKkIOBKiP2ZecIm0Hxiaoh2KDyDnhtheKgcyPMYSt86
	VWwlW8dzT06st5d0YwL4bbIlTCMNnwwBhvW9MX9DcSLslVT2ouKQi9V4=
X-Gm-Gg: ASbGncuW8EvVA3zRK3euhqVsSIQpcn6GxwTWyqzXCEfBNkb1tjF7Uo9KLgZSMSiR4pG
	+HTi5UpQONx/10YuCT5LoX3PjUMT54jcKUrqQ/1P6VREQpfGtYKu00eqKK9hqvzYj68pKuY4JkI
	MBXAv+WP6Bw4xbcnuitCOfy2YOEyBDwX9x
X-Google-Smtp-Source: AGHT+IFRaW2vDPoGKArEGCC85gqp/UqP4HhB8TBT8BAvg0ex5Yy8tSCcFqTUaGysfB97COhylbd9nsb75PXw2X6SrfU=
X-Received: by 2002:a2e:a98e:0:b0:30c:557:72b0 with SMTP id
 38308e7fff4ca-3280771da2amr55544521fa.14.1747778452945; Tue, 20 May 2025
 15:00:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519-gpio-irq-kconfig-fixes-v1-0-fe6ba1c6116d@linaro.org> <20250519-gpio-irq-kconfig-fixes-v1-3-fe6ba1c6116d@linaro.org>
In-Reply-To: <20250519-gpio-irq-kconfig-fixes-v1-3-fe6ba1c6116d@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 May 2025 00:00:41 +0200
X-Gm-Features: AX0GCFuCqHZdJEQm0AkAirailI8wcv3Jij3NbSgeMGH1BEok7H84BTeN_mldAnk
Message-ID: <CACRpkdZjrjxPL_275PzFgcXgWo7TCNDYf39d6QkupW1L2=4zMw@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpiolib: remove unneeded #ifdef
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Peng Fan <peng.fan@nxp.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 1:10=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We are already within another `#ifdef CONFIG_GPIOLIB_IRQCHIP` in
> gpiochip_to_irq() so there's no need for another guard. Remove it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
