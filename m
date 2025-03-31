Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA751DE3D2
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 22:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743461348; cv=none; b=ouAiBrAoIO0+FZG43cW2SaGuHNrWSiSf2kQX0DTArES2uqqLH2KhKuHB4vAHGBe3kDeq0ae0ahT9I2bKCT1qgjBJbYVudza4rnip+hjeBBBIb6vJ/LbpoNJpVZjQvdqmx1j1xhULvWQrYTE5hfAYnUTmcQWOlg+PO4TDnzaJ5Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743461348; c=relaxed/simple;
	bh=4ZDBK5wd+OT6FOl7634B79WuXMAHhGo8qXtK4fNt574=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IlFko+V0IIINwdVQ1ckeiNgB6BvqFJCpJmVlOezdk3iguoamPsSJEmwGl8uuVQS+SrQ/N4J7AVUIxtcHbf6VLdvSNEzn+4zNFbnb1Lzq6+4Xcq18T479S+Y6RzsJ/3L/P+EktZvOKZkJNsfUkRThnFEF85XJXpqyLyfmkStPSgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cpe/qVrH; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cpe/qVrH"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30dd5a93b49so31174471fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743461345; x=1744066145; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZDBK5wd+OT6FOl7634B79WuXMAHhGo8qXtK4fNt574=;
        b=cpe/qVrHMQXWiYEWzfkjRiSNem5zX2q+/7N3fYofIC63drscvE2JLe4JgSMIUg/fU/
         7UzBXTCygmzNRvO9p2KbUJT/PIDc+IZh4YlZ+haxWEfN4iwKosE6+/yeIegHOk8P0SfR
         CTCmBgfOmwDHGirR1uQe4BUsg6HAJGvn5V0XI9Rm5ffvF1T/kFMtupF1PdlJ3Hl7cD0k
         ll44WNEcSvcvDnU+NoSrvfAbW9zODnlKll/m8xmkK/w45MLir31AVH05SlSUE7hjD07w
         Z6Xqk8g7+wl1sRnwnvFeZIuRfO89lFRlyRasSs4NwQpDCesrr8j4lPybqgW3wYre8dI5
         1Ndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743461345; x=1744066145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ZDBK5wd+OT6FOl7634B79WuXMAHhGo8qXtK4fNt574=;
        b=tnkjBhrXcGLoB3mKUhUBFjoXtIHQ1SWsM9q/lJEvxpoE8t/op5dLBwba/8VbmQOgMk
         tBgnFgUTrliRXyuES3bU23CmyxWrC06hyNUOc5TreK80UeUEiEJ82956E1wnn4tKx3nl
         4/0MARaUAiabiI64Re9Nwf98ANUYUaDUuT8jGvV+Cycj09/qVWnP7PQxkhiM2MuvQ4Sk
         hguIq9OUlAo3QgniGvguCky0zuCmVuTBgRhyra/EIS9PbmHznasQEiq4gXaA+yG3OtU1
         8yTi1S7DoFZ9eVU6PTHSAkar+siGiwFW9I+ucgxrVPW7IJ0FFVQXf5aV3VJX/OqNGtXa
         17Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWJPcxZKuSYN0MoUb+zJVrWmL9pAB8ntDijEa9Lu+/maYu3brdEVPafKD4lTyNhRUw0Ndkec/zB7tPcQDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw22BFwAv9g4LephPPeJL3kKJVCKGScf2N66hJfV8dwE/ph6hY
	aDb/z1oGcvEvrj4S4Oc/UuVkL2eUYyXHq76uugH5mSyTJ8/7EDpg8UJBWieGnpLzHjLfrNW52KA
	n9e5kLJbtHZ4OlOy+hEtF5fbMgZlni9/3AbMBag==
X-Gm-Gg: ASbGncvc6H61caSWqp3fUUmZzlp2/McKucfr+HztPP+jHWAfx8AWZRGpDjHa4v4fG22
	ekIU7zjoMXu2YLmAB4IeisjZJ700h7LwzU50Q+kDRLZVhc3OOGfhcYhETgSLvbEteHZWsS5CcCN
	y3I+kY5Gxcj2GKaGG/VPBjd84=
X-Google-Smtp-Source: AGHT+IG6CJlfaf1CpSYIp/yiz+NR5Eb81ow4rmXMILKyEQQd7uEL49ENq8dv9Xm9UPNSgjdpRBsUdgvnDueF0/OokRo=
X-Received: by 2002:a2e:a882:0:b0:30b:cef8:de87 with SMTP id
 38308e7fff4ca-30de02319damr30589121fa.4.1743461344859; Mon, 31 Mar 2025
 15:49:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331-gpio-todo-remove-nonexclusive-v1-0-25f72675f304@linaro.org>
 <20250331-gpio-todo-remove-nonexclusive-v1-3-25f72675f304@linaro.org>
In-Reply-To: <20250331-gpio-todo-remove-nonexclusive-v1-3-25f72675f304@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Apr 2025 00:48:53 +0200
X-Gm-Features: AQ5f1JoiWbsO_w_VGj89jv-ltY4wa1VIMHCc6oO0E-cTy9oKdIeJVQ1THGG4Hjw
Message-ID: <CACRpkdYMRnmYD1YRavZs7MHEVFM42bOL2=6s4rJzFDnfLJ4fAQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: TODO: track the removal of GPIOD_FLAGS_BIT_NONEXCLUSIVE
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 11:00=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> +Remove GPIOD_FLAGS_BIT_NONEXCLUSIVE
> +
> +This flag is an awful workaround that was created for some regulator
> +corner-cases but got out of hand and is now used in at least 33 places
> +treewide. Unlike what the intuition may tell users, it's not a reference
> +counted mechanisms like what clocks or regulators use but just a raw acc=
ess
> +to the same GPIO descriptor from multiple places with no synchronization=
 (other
> +than what the underying driver offers). It doesn't even correctly suppor=
t
> +releasing the supposedly non-exclusive GPIOs. This whole thing should go=
 and be
> +replaced with a better solution - for exampe: using the relatively new p=
ower
> +sequencing subsystem.

Try to focus on the solution instead of writing so much about the problem.
We mostly get the information that the GPIO maintainer dislikes them,
not so much about why they exist and what can be done about them.

I would describe the actual problem and the actual solution,
something like:

"A problematic usecase for GPIOs is when two consumers want to use
the same descriptor independently, as a consumer (in Linux a struct
device) is generally assumed to have exclusive access to all of its
resources, with a resource being defined as anything obtained behind
a devm_* managed resource API such as devm_gpiod_get().

Providers such as regulators pose a special problem here since
regulators instantiate several struct regulator_dev instances containing
a struct device but using the *same* enable GPIO line: i.e. from a Linux
point of view this enable line has a many-to-one ownership. You can
imagine a 12V and a 5V regulator being turned on by the same GPIO
line for example. The regulator resources need to have two different
devices in Linux because they have different voltages, but they are enabled
by the same GPIO.

This breaks the devres resource assumptions:

If several providers with their own struct device is using one
and the same GPIO line, the devres consumer is unclear: which
struct device should own the GPIO line?

A hack allows GPIO lines to be shared between several consumers
with the flag GPIOD_FLAGS_BIT_NONEXCLUSIVE but this API is
confusing and prone to abuse, as is the related devm_gpiod_unhinge() API.

A better solution to some of the problems is to use approaches such as
the power sequencing subsystem, which avoids having several owners of
a resource by strictly sequencing the order in which they are obtained
and activated.

For example a GPIO turning on the power for both wireless and bluetooth
chips can be obtained and turned on in a power sequence such that this
problem never occurs: it is always active when when it needs to be, it has
just one owner (the power sequence itself, struct pwrseq_device, which
contains a struct device) and the GPIO regulator driver is not used in this
scenario."

Yours,
Linus Walleij
