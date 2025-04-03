Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E886A224AF1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 06:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743663504; cv=none; b=ghXWgRBhmYpKOJmsj+ZC5dfZNQUj+DvVfU60lFn6cFQoQ92I1Hd6uGYKK265HCz/xMhgWNwUxYOuFkyxvqmQbrzMlQ5GoC93Noc5uyzGR6dDxGJ8NMuwPJkbu8SEas8643hJkMnutbl5ylZe9qQgMddNnFPTwb6ad36HaLpH660=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743663504; c=relaxed/simple;
	bh=Svo2A8r3Jmqe67aCC/m/jUEWnRUioDCWZy6BQcePGqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lb20tMHD3EIuJDP9TjHeMMotnYB4JzeEzXcUK+UShNX633HeFwTILE9jBwMmGokzsu3ijBhGtd2z/lB8o8LYgC/tXHxxwn5F+P1bF7lfE9Tyv/ttrxuReNzIaRo/jYESF5+Zq0Lwj+JwjyG7s+zXwkTFZlzWxzSNwRoS7bs45K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EpeHucUu; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EpeHucUu"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-548409cd2a8so640422e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 23:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743663501; x=1744268301; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Svo2A8r3Jmqe67aCC/m/jUEWnRUioDCWZy6BQcePGqc=;
        b=EpeHucUumYabH7JABx9E71uk5YgSwLhYPp9hQhnTOhkkvbW2t64Kz5N5WaZOXAFb4p
         P65QKDTP15d6YQpDmUG3wgHl6kTLIFyFaUglEruyRkklwP+uFEVA7W05qaMh8+ZXr7eI
         Wz5vfP3Q/vP5ps/1mPla9PGLWkpghs57TYzMtu6zsXUdtjKewBGANuphps3RvgnajBxu
         cyFVstLqg+uJcoYqN5nxnRwCuZSplQiaQ+fRzzRaOaNN8x+WINsYBXKDKPMNsyRd6UUf
         UB/ssNKfSIz6SaGu1QN1W8KxyC3GVjeBZ6GfVpV5LPV54j6GGhnAkYXO/8HHTGCo+E+h
         W3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743663501; x=1744268301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Svo2A8r3Jmqe67aCC/m/jUEWnRUioDCWZy6BQcePGqc=;
        b=VDO+aP0x3J4OJ2Swpt+XwaTTIb+eTSppLH6bXGbUAAPGf77VweldyyHKN8qyqx7I0j
         d6BeT8xP0P7IeSAxyAvJ2KEqo0vnaHh5kwxxBou2uKC9IbnAwxqIwboEFCiwFlS/9Syv
         uva6wRbB5TiFuqzxQZZ8nvIHl9oN6CXinqPUl5H+8JkK2umnAZFx8X1svnIXrCz2d3w+
         q/erGMviCkn6zUf/J9YLSIxIFudaF94alGCrJ4tDtd7+6G6METwGR9JZgFtxTWw9iYdg
         6tX39Jc6gEpx4T5AtY+qIcOszFw2MDFBjT5oDcFhHvpV5AbH/T6/joE9IVINaRAfK4Ua
         KK9g==
X-Forwarded-Encrypted: i=1; AJvYcCVhFUrZpnykb9ZFWZCX5MhW+Mx8qz5GU8txLz4+Ge95eonozJ+OVzbMewF1rYxD7ZUBM32eFVMY3otbgxA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzerpUihldnilfyNAQpBnKXyUFlKYUb4AHKoGq1H/OfBRYgo+s8
	IdULPmrTH1B0V/dV5H0JA6BVHYVc+9LkoXM3E/I+O83GW4v8KuSvqzS1LRRrN7CS+9/+n9NVSBr
	MeHRAI5UFhnUnydtJ31/O4NgxU3zSDFh+Je+HQA==
X-Gm-Gg: ASbGnct13igtlLoW5Sah+xmy/KoGPBXmp2Aekequ/lYQ9FE3v/JQFGXxco5eBy8rZKy
	JwCqdNZIRggPPwWjDpOjSS+TKYjGJdwaCbuE5g2c6ex2jlJKSnf3TL6tlIgGhIKXOhyEDvTXoal
	dmF9PdunZrnB7SSt0RRS2wmIo3pOdsFO/iOWCI4B4rdmcM+dkoRfrsylpO
X-Google-Smtp-Source: AGHT+IF7DQnLd2yHx8gCZKrzHn8zuC05BwBHsqp2Ajhws62+Hn5j+meHkLxz/EwnU3MjqUNm4hitHhMdcHo8xpr3WCI=
X-Received: by 2002:a05:6512:33d3:b0:549:b0f3:43a1 with SMTP id
 2adb3069b0e04-54c1d8b0d5bmr432688e87.30.1743663499972; Wed, 02 Apr 2025
 23:58:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402152000.1572764-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250402152000.1572764-1-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 3 Apr 2025 08:58:09 +0200
X-Gm-Features: AQ5f1Jo3r-FtyKUu_Mjqi8jTXLCPKanSLeSOFmvxvJrLriGpTe_MF2mRs_QHx44
Message-ID: <CAMRc=MfzRVy85NR_eSQc3ZX_OmgCRUKuBdd6TqCu=Adwh9drrA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Make gpiod_put() error pointer aware
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 5:20=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> When non-optional GPIO is requested and failed, the variable that holds
> the (invalid) descriptor can contain an error pointer. However, gpiod_put=
()
> ignores that fact and tries to cleanup never requested descriptor.
> Make sure gpiod_put() ignores that as well.
>
> While at it, do the same for the gpiod_put_array().
>
> Note, it arguable needs to be present in the stubs as those are usually
> called when CONFIG_GPIOLIB=3Dn and GPIOs are requested using gpiod_get_op=
tional()
> or similar APIs.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

I'm not a fan of this. Silently ignoring NULL makes sense in the
context of _optional() calls where we want to do nothing on GPIOs that
aren't there. But this encourages people to get sloppy and just ignore
error pointers returned from gpiod_get()? Also: all other calls error
out on IS_ERR(desc) so why would we make it an exception? If anything,
the broadcom SPI driver this is about should store the return value of
gpiod_get() in a local variable, check it and then assign NULL to the
actual descriptor stored in the driver data.

We return errors for a reason, I don't like the idea of just ignoring
them in gpiod_put().

Bartosz
