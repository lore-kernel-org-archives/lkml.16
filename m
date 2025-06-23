Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6FA1F791C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750664035; cv=none; b=KSY19CSrgGghMPWDc/DOU3dGm+2ogzZz612YjynrDcYtMK8ZIe6xQ3iuW1zkbOVb6cgF4i1JRuq/3svL617aHGf+H9gUOrgc/T0Pyo0D2JzZ+StL8HL3CZ2IdjBxHaXyUJBUg35hSeH4nCbv/pNA2zBF8jVwInUvN9cSAvpPIoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750664035; c=relaxed/simple;
	bh=hZqwKFrQ22pH+J6FCqtPgcrjFb7CkKy8B23+PKK0y8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OUP6HJ3+NF1JAoHicQ1s71aJUocxcAI7x0vo1dJKoCgJwlncxpK/ROKt0dpliYBOvDzwAOnXmIg2U/4hXYqpd71VBS5XbqvLPHIV+FXDwHQILRL4isSEKd/1YhsAGCOz7jgfCtzNwP4bs5ELfSA6C2qQ/naUy5fRVezI/OFhVfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gxoLlVjq; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gxoLlVjq"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5533303070cso3632170e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 00:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750664032; x=1751268832; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/FmDVYFDGwW5KMGc8hcV6hExdC2WI6OVDkBnOBtebc=;
        b=gxoLlVjq7UAq81SKleh0Z67563NNike1VukXSYueZBWksTROPOITfzXDsexJQXB7UE
         gsSWZFUfYxakoUtIqjb1aOGlpIX5thWlq2hFxnjFf1d85FzqvnA5k7EgOqcmAU50coQT
         G71FSEG7TNaIaHswOgiYYAUYzg/UhHfuG7ZwWrJW5Cuwi2v7YjFM9wF6iIGt4Q9fKot8
         zoNnFnIhFB677I+/avdqujD4Y+n2+vjYzpg8QYb11ZyFWvjEHsZxUI5nhT2M/22yp8gU
         Q7JrCPV0+FvEhPMegJ0Xd7sE1yQ3oObfTAxeLviSNoMa4ZbHlgvTe25pMdutOaL9b8Rt
         EK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750664032; x=1751268832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/FmDVYFDGwW5KMGc8hcV6hExdC2WI6OVDkBnOBtebc=;
        b=bIlN/Map47sjNQexQZv1InUFb1OwmKQHpfxow9WbeoLKKN/EJt0QYsRJ/20wDmdPlj
         2gtlqhOBNeYmnkQIUhWy5QHAmhrIdQJ7THTH5Ohd4DhgaLe7/zQ4z6PAEsfYHjnxbAee
         5rRCkwbbi0spvFX5Iwd4LSb7g9lu7VCz9vxDEuIt0XUr35FbvF4IgEp0f5NXx1XAEnfE
         GYnrP2w9qFHYkN106fmJ3mIKMdIK9T6bC0kBn0XJuajxc6YE80QVNTXpbDopAgKkupqM
         MPl1Jv/EqCPp5Y12eITpZNWzWinkqLceFSHsBwCTwYEvzYMAG2rMkx0eOyIq5pgu0VBv
         yvzw==
X-Forwarded-Encrypted: i=1; AJvYcCWdZR2w0C6IWdGVUNdG10yXTHhQfffISYXCDW8o3wUaKdf2z41GBYIM6KF6eWcIdtn72dFjcpllZeo/aGI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaA8ZpXmqSvEPqZpkQHHSRVuab4eWUiiv/a5q8+SN4PnxKGvDO
	u5b7pO8K4C34po/vTsBZPFXxpSZdOu56JUMgOGQ+W7ac0JZ+T1Lnw+HUzH7bySE0goEblunttsR
	fzlf++L5vSisy5HnUN4XnXRAaykIyHIXAnD0cn+FANA==
X-Gm-Gg: ASbGnctqJxxSLhiKti/tjl5/5gqC8/CWFLL8pqi7rlLhBkmTeIkgkyXqEb5dXYC0I6B
	WEwtZ8sp3lhPZi0bamhlReStIAs+o5cjSnHBLF6gj3uBbR3rKBeAeeYHU0NqsD8nZW317wk9pQ4
	UleYwbkGkXPzejhfWakrEXHdNzBHSGfNuc11FMYPy5Ywmqw40TnUYH5JooWdiL3R2CeI9sh1yi5
	w==
X-Google-Smtp-Source: AGHT+IHXbQ1G61S6XTmap3R9KFxqdYburMPb7gYbxhsdAd+vhJ5pZrPzhPGsI5r9CHk6R8GllO6W7NbS7Xfzhgc6R0U=
X-Received: by 2002:a05:6512:1153:b0:553:a4a8:b860 with SMTP id
 2adb3069b0e04-553e3af3b66mr3432565e87.0.1750664031428; Mon, 23 Jun 2025
 00:33:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 23 Jun 2025 09:33:40 +0200
X-Gm-Features: AX0GCFvZI7j6aCfaYMvSqKv_YVgtIm3etGx79fDwp0jhT33AUgmaBnK_549jfVI
Message-ID: <CAMRc=McVV=VBw0DRiz-4tTjh7ZtRLWg=N_LQ2-7O1sKyW30rxw@mail.gmail.com>
Subject: Re: [PATCH 0/2] soc: use new GPIO line value setter callbacks
To: Qiang Zhao <qiang.zhao@nxp.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 2:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts all GPIO chips implemented under drivers/soc/.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (2):
>       soc: fsl: qe: use new GPIO line value setter callbacks
>       soc: renesas: pwc-rzv2m: use new GPIO line value setter callbacks
>
>  drivers/soc/fsl/qe/gpio.c       | 6 ++++--
>  drivers/soc/renesas/pwc-rzv2m.c | 8 +++++---
>  2 files changed, 9 insertions(+), 5 deletions(-)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250523-gpiochip-set-rv-soc-14e1d9414f70
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>

I see Geert queued patch 2/2, who would take patch 1/2?

Bart
