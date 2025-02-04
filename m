Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DD420DD71
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 13:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738674883; cv=none; b=PUTN4UdLd1cu5mkEMGBTylzkMYyYvqbR/7RluRFoXQ7LpNB6uP9qKRfwMM38xejPNnyDfniyaTf9MYFpiJ9+nbx1QuTYAupiWIqduJS1ZhLwimryLk3rxrQ4n6oibYYlASN3H5+s+hHdVJRgxX5dfLXFLwy4VK06sgePIxzg2A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738674883; c=relaxed/simple;
	bh=lJ9T1u9q2YZ6gau6z5aPQ5S1iFNq+ZFtrOES/qnuq+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gJKeyhfVK22D39yDvH9aVLeu35grIiLPuBJGO7pXAQPLlfsjAgfCqXgytWy73IIyMu9PiKkZ5DdkVMz2Z14DKhZlyqR5K8lMM980tizscoFeGX0mXqfZFW7ozmFdaSt1b2fnZ3SnZDbpwnpJdCnCsXKFoFen3olJPaFXcJlodNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=a9c9E+mh; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="a9c9E+mh"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54298ec925bso6429643e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 05:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738674878; x=1739279678; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zzKgIq7rz08fBMN0W/dqGNraXehNUjIQ90fAtJxNy1o=;
        b=a9c9E+mhZ8Y7YL5vd994W/W5NcaoWnDgPMcmNq9leF1WNamiyGq8VWDCZ5tNiUscwM
         yNpyfWp8lHWMJcthtr0BLaG6WezIVGDlINGR/KpPtRHs+37cM69EMzkBn4Ekzm0ydwOw
         Zu/weoKggCW0QdbQ9VlNmlokuEoCxFiZUBGyrTcXNKgOQsl9vg55cLbnGSEz0QYYaLGn
         VRMPNBwvwoAd0AAF/QCp34hID3GPac+kLbgaY6QfHneOeB/idw6YCDCNXffUwx6qCLz+
         a5MLSNWoAqaF/I0sez06J95S8x5sWpqmhFfu5vZ9pa+nYeCYeDABCUk58xRwu/Lw+z8/
         4qng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738674878; x=1739279678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zzKgIq7rz08fBMN0W/dqGNraXehNUjIQ90fAtJxNy1o=;
        b=THRw4NgpMRPKpv1OPzMw6CTXlO0gmUF3qwPNVJ0E9Y0Rjh17oimdOIPKWUjqCKV/fc
         GgypmCZyrSIe1ejO3Untn9hvBdKmBMymyW59wpAZv7NG7nf/dpGJM9tyfzM0pwvJpGvw
         TC2O5050J5gY1py1kwa+m0XaNG85APq/9vU3Y/uISHXPpPXRjXcYV0LXVdwd96hOa2Cb
         AREOqVld2CGRAmbuGHr9gXTEh7NDbZrhpTnhdQi4CmPy+PIvPTcwN9izY1Z+r8C2P+Mc
         ednEoSjwyM7pc2MQ16iIZwDHkDzakctGUba0Hm/oUhCq7+N5HQ3BO0qOlYCun5cnu6nO
         UYBA==
X-Forwarded-Encrypted: i=1; AJvYcCXnhzHV5TIkXhBFElAFQ++ITdDMB7+Y31dF6Kinx0fud1LAEQby8iOaxvSgx5a9OjmIaUPDw7U5lNAsLmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxY+a3TwvdBp4Dvk2x4MA97g+96YTrL8ygrzgDuody36hgJk8TA
	82tiviSB+8gAJY3rGfkDmBIgpmNVewYgogQgXCHv5MgkC9++M31rMaRLA24ILzhzlZxOUIOGX0B
	zNqtuMiB8BfmhoPg3+8OyGmdHAW5B3uApyw3THQ==
X-Gm-Gg: ASbGncsKdhy527lBe70yu5imt2/w//YrNDaHD8HxPkJmXnpksrBx8dSCmMyCKWL8Fgm
	3m6h1RJgfDG3iOy6OvXcAN87BniiLkR6Vimn2UQJhm8U6L3ARjDRTMyqsjMQqurUqsMpJLcmuSK
	evJhD/fyOzP7F57+DcuEbbwEdWkexN
X-Google-Smtp-Source: AGHT+IG3iK/gLYXxjiIAYHWRJ7P+AhZZKbxnmRlx23C/h/unN+vix5GK7X+U8ENJurLGDtOx9+8rw2p5LXLpdHZKqK8=
X-Received: by 2002:a05:6512:131e:b0:540:2576:d0d8 with SMTP id
 2adb3069b0e04-543e4c32866mr7678444e87.40.1738674878387; Tue, 04 Feb 2025
 05:14:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203031213.399914-1-koichiro.den@canonical.com> <20250203031213.399914-10-koichiro.den@canonical.com>
In-Reply-To: <20250203031213.399914-10-koichiro.den@canonical.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Feb 2025 14:14:27 +0100
X-Gm-Features: AWEUYZk-OGR0Gg1AhH6ADDIik_r3P3vu-Vw7Ihm4kfBQvjAQXX4aKVaTVOSz8VY
Message-ID: <CAMRc=Meb633zVgemPSeNtnm8oJmk=njcr2CQQbD5UJd=tBC5Zg@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] gpio: aggregator: cancel deferred probe for
 devices created via configfs
To: Koichiro Den <koichiro.den@canonical.com>, geert+renesas@glider.be
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, 
	maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 4:12=E2=80=AFAM Koichiro Den <koichiro.den@canonical=
.com> wrote:
>
> For aggregators initialized via configfs, write 1 to 'live' waits for
> probe completion and returns an error if the probe fails, unlike the
> legacy sysfs interface, which is asynchronous.
>
> Since users control the liveness of the aggregator device and might be
> editting configurations while 'live' is 0, deferred probing is both
> unnatural and unsafe.
>
> Cancel deferred probe for purely configfs-based aggregators when probe
> fails.
>
> Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> ---
>  drivers/gpio/gpio-aggregator.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregato=
r.c
> index e101b78ad524..174078e02287 100644
> --- a/drivers/gpio/gpio-aggregator.c
> +++ b/drivers/gpio/gpio-aggregator.c
> @@ -1313,7 +1313,6 @@ static struct attribute *gpio_aggregator_attrs[] =
=3D {
>  };
>  ATTRIBUTE_GROUPS(gpio_aggregator);
>
> -
>  /*
>   *  GPIO Aggregator platform device
>   */
> @@ -1342,8 +1341,22 @@ static int gpio_aggregator_probe(struct platform_d=
evice *pdev)
>
>         for (i =3D 0; i < n; i++) {
>                 descs[i] =3D devm_gpiod_get_index(dev, NULL, i, GPIOD_ASI=
S);
> -               if (IS_ERR(descs[i]))
> +               if (IS_ERR(descs[i])) {
> +                       /*
> +                        * Deferred probing is not suitable when the aggr=
egator
> +                        * is created by userspace. They should just retr=
y later
> +                        * whenever they like. For device creation via sy=
sfs,
> +                        * error is propagated without overriding for bac=
kward
> +                        * compatibility. .prevent_deferred_probe is kept=
 unset
> +                        * for other cases.
> +                        */
> +                       if (!init_via_sysfs && !dev_of_node(dev) &&
> +                           descs[i] =3D=3D ERR_PTR(-EPROBE_DEFER)) {
> +                               pr_warn("Deferred probe canceled for crea=
tion by userspace.\n");
> +                               return -ENODEV;
> +                       }
>                         return PTR_ERR(descs[i]);
> +               }
>         }
>
>         features =3D (uintptr_t)device_get_match_data(dev);
> --
> 2.45.2
>

Geert, what do you think about making the sysfs interface synchronous
instead? I would argue it's actually more logical as the user will
instinctively expect the aggregator to be ready after write() to
new_device returns.

Bart
