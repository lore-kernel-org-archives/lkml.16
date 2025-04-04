Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DF01ACEAF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 09:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743757377; cv=none; b=Rl2OydWDPFBJkTtP09Y+nQ8zkAviW64Bjq9KhQztSZ+DuCWjaZ5WRUFzpbWgzQwMExp1cq0qR6u5Nk4kosXCpVSVQ/pSAJQr9fUpowiZiBxYdtz142CzzzmDamS380WIv4NGioL5o7eXmkRBMIdiguDVt3MZ8lCTGwV809CCNUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743757377; c=relaxed/simple;
	bh=Odehsj2BM8XDwHtXWOi49nNg3uGWv5LoB0mRa3iuQTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iMkU0oNRlehg7D6UWC5Rt2ZA55fJgEcQGFUatv0y21Nf+QI3EVoAsUUDrBUzkblXfJ7JEqR4QhvQ3yh9sgE4+4Lt+ueTL/MsziKhsWkfgiPCLrhJdFvJxBzOnlBhWxrugt7o8FqduCKWeBcb382DrwZ81IfRfSxorLv0mVWfr6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pO89RT65; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pO89RT65"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30c05fd126cso15241791fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 02:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743757374; x=1744362174; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AT0sYEXJkvVX4YpBmzj2OY2C1bjsMKeplWHZpo7aDCU=;
        b=pO89RT65tuUfGbKp88qFmapTtoQyH0zXgJeN1xxPXckoxqMXPZGby54DJOiqY+Bd+6
         X0Tz89Cqow0Pb4q+iMlY7Uo/nqKYs6g1lgdQdThcG2EB33pLbSgG/xiRAGNBAqXO2oMA
         XNVCqbi2m/bVTqbOQSSiN6GxPoBXIolVwsdT9VIpVkBXI0LDxxRduQLabS0ty3ByByoK
         cVmRzIrh2RBRmanOZlGTy9gYlo8Om0sZrNFDXYXEZ9aEroRoacSoO8hm/B50W5Wh8s+B
         g5JeYMij4/mVHopFJeWlYjzqF0FuxJyjUgx14aQ7bm+rW9gpYGTnDSSU+H7hMfxUyxdZ
         9jrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743757374; x=1744362174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AT0sYEXJkvVX4YpBmzj2OY2C1bjsMKeplWHZpo7aDCU=;
        b=NVF52NZwd+p3Izx4AAxaKswc08AzvuoNm4J7a7F9GZB4ixkOCMe6k/sz6TDAQT0VN4
         AElwaeq8Y9DHDF6jp8HaMHksYxwoCm7mpvTONwxlpDSfSZySzX+dNFaCQDPGQ9BhNyrX
         SoxTrKEU88yLHDUJ9kG14KUgzq+5NGW+Blx7VBetYJ5HAHmzymkC7eQAwrxgTzfwvCKA
         eiiFxutNjoy5iNlSMKy52q72S+JFwFef5gIEXNw+aS7urwjXpQkB10b0ojvgFr3Gr5uw
         SWl59I33A+Y2ZVBLxsTAR2/DSV9QbpZ9BauOpMFos2h+/I6PxjZipJmRmx7Jh/4pxmS2
         RRvw==
X-Forwarded-Encrypted: i=1; AJvYcCWfg+Cc+ieeRB+GIFlEewUVuGX22vmJLwFtBe8K2TPQFkNyh1QLGL3olvvTKLxzJGLmrSTD6wLpZhzyUS4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOGMlUdtgtDlh7Sm0pARbvEYosQPxhvKqi0j9q02D6CZz0YuYT
	OnjYP1ddA8L766zZCIMcIWssdwzOp5ktTfOs9wiOq6WHwloIM7Vn/XjOostk1d/ILKU7g78E27W
	8AKDhg7EjDy1cBWk+OZ2ipV8S+ZBf8SzOOHkHlg==
X-Gm-Gg: ASbGnctmi5OsHulsm93seud8MGEZylYSTBqqtErVev/fXhGRH5lLVWco0uUTXF60cJx
	ZuCtMvFsccAO9u03s6kC7/XBtJZ0UnbRjB0OoCw6hYhZjAqcBYAHPEd/lkT5pcXYtzq2IFR/9+H
	Pe+HH4xtAsjRlZiyhi75ep4EI=
X-Google-Smtp-Source: AGHT+IE3c8J5XFi4Pog/UFlbZxenY07T9F111peneZ+Nl3svAw6cNIj7qt8tUyUvZtN1WK7vFyYtoxkG2auhvg4tpbM=
X-Received: by 2002:a2e:bcc4:0:b0:30c:12b8:fb9e with SMTP id
 38308e7fff4ca-30f0c061ce6mr6442821fa.37.1743757373833; Fri, 04 Apr 2025
 02:02:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331-gpio-todo-remove-nonexclusive-v1-0-25f72675f304@linaro.org>
 <20250331-gpio-todo-remove-nonexclusive-v1-3-25f72675f304@linaro.org>
 <CACRpkdYMRnmYD1YRavZs7MHEVFM42bOL2=6s4rJzFDnfLJ4fAQ@mail.gmail.com> <CAMRc=McBWncrCcX87a3pYeZ3=uYGNhpSrK74hDP-XNYrT8WMMg@mail.gmail.com>
In-Reply-To: <CAMRc=McBWncrCcX87a3pYeZ3=uYGNhpSrK74hDP-XNYrT8WMMg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Apr 2025 11:02:42 +0200
X-Gm-Features: AQ5f1Jro8WxWYYgBK-u74u_UUFVf1ElCnzRI4WgZMQgyCFcbCXmRoZirkubFn-w
Message-ID: <CACRpkdbeObj7t=quffRrZtZQRRSr6GBeayN3o_8H8zGDD22XpQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: TODO: track the removal of GPIOD_FLAGS_BIT_NONEXCLUSIVE
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 10:57=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> > If several providers with their own struct device is using one
> > and the same GPIO line, the devres consumer is unclear: which
> > struct device should own the GPIO line?
> >
>
> Well, other subsystems just use reference-counted resources in this
> case but see above - this is not a good fit for GPIOs.

So to rehash, for example clocks and regulators are by definition the
equivalent to NONEXCLUSIVE, that is their default behaviour.

Two devices can surely request the same clock.

They can independently issue clk_enable() and clk_disable(),
and the semantics is a reference count increase/decrease.

They can have the same phandle in the device tree.

But GPIOs can not. They can only have one owner.

Technically this is because the only reference count we have in a gpio
descriptor is the boolean flag FLAG_REQUESTED, and it
happens like this in gpiod_request_commit():

        if (test_and_set_bit(FLAG_REQUESTED, &desc->flags))
                return -EBUSY;

This semantic is in a way natural because what would you do when
two owners make something a GPIO cannot do, such as
one does gpiod_set_value(1) and the other does gpiod_set_value(0)?

This issue does not exist in resources such as clocks or
regulators that only do enable/disable and that is why GPIOs
are different from other resources.

Then we can think of solutions to that.

One way would be to add a new type of refcounted GPIO
descriptor for this specific usecase, like (OTOMH):

struct gpio_desc_shared {
    struct gpio_desc *gpiod;
    struct device *devs[MAX_OWNERS];
    u32 use_count;
};

struct gpio_desc_shared *gpiod_shared_get(struct device *dev ...);
void gpiod_shared_put(struct gpio_desc_shared *gds);

int gpiod_shared_enable(struct gpio_desc_shared *gds);
int gpiod_shared_disable(struct gpio_desc_shared *gds);

So this compound struct will not be able to set value
directly.

The gpiod inside that shared descriptor need to be obtained with
some gpiolib-internal quirk, not with gpiod_request().

It will issue gpiod_set_value(1) on the first enable and
gpiod_set_value(0) on last disable its internal descriptor.

If existing valid users are switched over to that then the
NONEXCLUSIVE stuff can be deleted.

Yours,
Linus Walleij
