Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF1F215077
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 15:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738683484; cv=none; b=kMla409WojA7Q2C9zAiECQaaonkhDqa8OtCE9JE86GuYrUlkIqcBKyASlJQN7piVNUwkqGknH2fuqHrd2mARggnx52e87ka3wNuthfOLV5N9plDM1vRRfc6cCn6yGy65akXiPvNqXOn52RtL0AJW4qLRXDpHOks4UC1EfXna5WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738683484; c=relaxed/simple;
	bh=ltZ949oM+lMRV7UBAxtOUIjP4ivNHQ9d0hi0WriRce8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y3OBbViOkSl43eIcw5lbHkikd8Bpn2mYs14zP/7hiH3xZ6QiJkm7R1dxgnYcFxHNP9z3OZFLUKmEdI1ZGPCbrmzYy7ghwVG62wyVig786KX+E8oFHTqo7bPFFKJ5jz/Vyqe5FY+vcoIoyuiAPk3OCgILuLBkl2+pvL22ikUG8t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NN5UQJkz; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NN5UQJkz"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e5b107c4346so1303401276.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 07:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738683481; x=1739288281; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jVMfm8ZhSAvtr5Dot2F5GueOESbiJOB9RRL5JCbpZyU=;
        b=NN5UQJkzSiz6IcxyAbcgc8IiV5ZkupT6U310HuXW4brkLUc5nDuzAipx5IP46ct4gd
         EpyHisjAgdO+AnSGAlHo3RPO4wV1QEVBMkSNP0oxEpCNirBeuLGQ2ydqn5gsJLyNGYpf
         KinFAh3wjqvzfw+ndKa/L2JOouFYVOzOG6qf099WTnigAqNL1KIvo8y7IZ5l8otHJsST
         L0wNbuojoah+F5eaDOn3wOkbTF0VluC7NSMO1Ncv9IrkJVkWiyUR/plsL88NnZ01XA/z
         SYRlRtV9lS5ABP/W6POaMQ2TIJQMGuBeAY04VpokBgral376cUrNsjvBdy9/shF7fsd9
         KkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738683481; x=1739288281;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jVMfm8ZhSAvtr5Dot2F5GueOESbiJOB9RRL5JCbpZyU=;
        b=QuDtc3AqvYZuJn87a5cP8flJ433K2OLiN5TtxJdZJ62ieV/uX8Pa7JecYkMiEasqGP
         UCJex2S8Rp+oijZuooOue8G+mGyHY9Tn2qQ+2d5QMcXTs6XRPWlkMHB6LKOrogn3GdCt
         UgP9u5c042o3Sd+m/dZX2SYHVYsLn6K9AZJ9GysTAP0wofkYgPuaeMyHFzpEba5Y4AiB
         lX4z2h73zCtOJmDyTk31Gk6uou2EHUt7ip+joWX8IVNrjhssFwTrxUmrNDj/djfoHAhU
         ZHJgj+BRqmrbeHVwNyRDfkYw7NhGSf0YFI8T8N5t/hsRqGufcL5KdyCawoWOulerPjEU
         H2Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUaUFineq/BV6D4nD+rxdIZ0UCv+oJeLqN7V0yQANOFNCnLW1zZaF5fweL9kutOk3bQuSB/GZsOJ466IKc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF/yrfZoJy3ad5FVOmc85m5UvdWIUks8LleK0ou5MElguFVs6j
	wat3ziKiWoos9oyOQi3ipy2LYpF5dORvXOnpS9xvS9KHAaI20NiuRvn5tCpYqx5IRdBhSM1DSAj
	X1EGsLL0pI9aNW+VMfh4s9caT5Kg3bTd9zneYqA==
X-Gm-Gg: ASbGncs39X6Mkl35QCtjyaouwHqgBbuo+dxya+Bl+dvfPXoHPu/ODYe3b77sHalzvfc
	cZJLr7ViIxi1+4OsDYmgCwxLKhsZkPijP2jAh47J0uF0GqXGDj2sFeBONT2y0PJk3J9SXqgLFXw
	==
X-Google-Smtp-Source: AGHT+IHvgaaPpDS+6zz+NW+qWTxfxKZ5xGI5mBb28CNf8euDfNNskCLrVmo+9LeT8cifH6u3mLCbOQvZ3PdCNlYInak=
X-Received: by 2002:a05:6902:2409:b0:e5b:22a9:fd44 with SMTP id
 3f1490d57ef6-e5b22a9fedamr351835276.27.1738683481129; Tue, 04 Feb 2025
 07:38:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131-gpio-set-array-helper-v1-0-991c8ccb4d6e@baylibre.com> <20250131-gpio-set-array-helper-v1-9-991c8ccb4d6e@baylibre.com>
In-Reply-To: <20250131-gpio-set-array-helper-v1-9-991c8ccb4d6e@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 4 Feb 2025 16:37:25 +0100
X-Gm-Features: AWEUYZk_FOEufbv4XIOWWo19tqsP-vJZAmqSGiOD8X2-D-NUV7n8lB7W5hF96hc
Message-ID: <CAPDyKFqnEtnCRcu963t1cBqjHvz2nV+Ymahtpef+ZoCD9-C2Ew@mail.gmail.com>
Subject: Re: [PATCH 09/13] mmc: pwrseq_simple: use gpiods_set_array_value_cansleep
To: David Lechner <dlechner@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Peter Rosin <peda@axentia.se>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-mmc@vger.kernel.org, netdev@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 Jan 2025 at 21:25, David Lechner <dlechner@baylibre.com> wrote:
>
> Reduce verbosity by using gpiods_set_array_value_cansleep() instead of
> gpiods_set_array_value_cansleep().
>
> Signed-off-by: David Lechner <dlechner@baylibre.com>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/mmc/core/pwrseq_simple.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/core/pwrseq_simple.c b/drivers/mmc/core/pwrseq_simple.c
> index 37cd858df0f4d7123683e1fe23a4c3fcd7817d13..b3a6d053c826741005f1484ad81df30b6bf75bbc 100644
> --- a/drivers/mmc/core/pwrseq_simple.c
> +++ b/drivers/mmc/core/pwrseq_simple.c
> @@ -54,8 +54,7 @@ static void mmc_pwrseq_simple_set_gpios_value(struct mmc_pwrseq_simple *pwrseq,
>                 else
>                         bitmap_zero(values, nvalues);
>
> -               gpiod_set_array_value_cansleep(nvalues, reset_gpios->desc,
> -                                              reset_gpios->info, values);
> +               gpiods_set_array_value_cansleep(reset_gpios, values);
>
>                 bitmap_free(values);
>         }
>
> --
> 2.43.0
>
