Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D917020C004
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 12:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738673377; cv=none; b=JU6MCVK9ZOljpWVzJGqiYGELbYFcVBS6Jzdnglb9lRvkkZ9TwqwIx/ftZuyyE4gRnY4tsiURNhvCNc36t3LVR0rZOezjJKS7VL6+xQMJ8vCd+fdyH+rkQLPGOSiDxN0+x80zw81iwpgfp+v8F02NqZ27kiyckyJiupAL66/pEzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738673377; c=relaxed/simple;
	bh=/T9Sh9PRHJva4qd2W6nNPRoLpbx2eTBsWsBBrUf6yVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tH7Ie0ktWvlMhelrX+k1DzOeHwQJf09H5jJbQHbAqklYm5SJPn7kuAowhe7t66nkLXxbFNjHaXCe3UPac51mph5Adj2wvIjafqX7wHhBZjA8cPN1tb0yYIVl4xOnaAm0MON6geiIG1jyvjDrQAP0SAoHtTGlM9qDnR5x5QVWfOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=C8RzIx1b; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="C8RzIx1b"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-540215984f0so6084399e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 04:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738673373; x=1739278173; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KR0Gevd3W4EVuh0yJZJBtnhS1e3+lA76cfZQ0K3Yb7s=;
        b=C8RzIx1bBwxuX9HZQxT6JZjyf2n7zCASYWOsuBOoTCTxZwCCjEFqzet09zC4b6NjZX
         /V7FisV8twTIQcD9CwNCCfUgDEXe7pQragRSdDc08DvPc/2ftG8yOCfCLX92JxkDskr5
         A1VtnWlzTeDeZo1sGSw3jy/xrzj7jJjvnPYDf1Ws0L4oeBGVDSF7hnP1XLmXojHIiXyH
         tfKRl9dHtcddxezqZGDz8k4GO6MHC+H55PzBJwbQGEMya0n8+YaGAMjB682lwhFKokam
         CrkT0LNi2Qz1qVuS9SS/W/ICDjdjWt/4YB2uc3RFTu/fdg1F/J+aZRq4Kb+aF82C5iif
         gDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738673373; x=1739278173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KR0Gevd3W4EVuh0yJZJBtnhS1e3+lA76cfZQ0K3Yb7s=;
        b=UQeB+Xu/ZirVOsu/M1kKbXcCJ1RYfLOp0ZI2zqxPCsueKXDEQ3th8h7buvnvsPUPCp
         E/6OJDLdV4wJ0xp6oPWjm78wQlB/TAx5bDAL7CBgHN4EEr3KpjboL7k6gSSRkzhpvY6D
         UV6RxLkTAr8kAdPLjU5po16P84GQd69o4P4gQ1912aro/QYfVT5bUUtZAcgU10epZymg
         lnB/Jj0xwwihRgzVIU73utTe5OGXbNOiDD3w76HkvE3x/kuJhAaT2cwJR7+Yb3WRp8bN
         Ia44f9bwZlbWoMsMrV/Vm9M13guO/WUQDU6WZLehYHDrANNSIkLj5SjoP7U7cd9/TD0L
         cmBg==
X-Forwarded-Encrypted: i=1; AJvYcCWMOfNzwdvCS1bJ2FZGCrGnKF6bnPXAZSPzry+EaIRtNEOkDNMFb2JDPF4dCiY/A+FfjHxgSrtC6g6xqKU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGhiJnYrlDn+bHcHse1VRYMX0I4XvddVpuIrKFRvl3MD4cJJGW
	w3vWv++g9ZIit8gb84SfDr0SQ6HoL3uX9TZKZzGETviN85N6g+vJ9rGNba3YhErpVnofDsG9Aey
	FiVXYKZh8L45gSWN9xMu2Rka6GYyHFqty7cxQNg==
X-Gm-Gg: ASbGnctqkBhf7y3Dxnv5I02KNKWD1STke4t0hzcfOcisnQSTKYbiP9t2xKWnGPNwWQj
	fx9epgQAAWJkNkKCotSiMoqzDe2ZGR8my1uU5s7bur3pyMd4JwvSePbQ5vtkWGvwUlk45ETtLnH
	fIkcquOcKq1jo4nt8sp2rNFoUqyyOE
X-Google-Smtp-Source: AGHT+IG71qlTLTpIDZmlqJpqP28YbkJfHeJ0QRNm0NxTAdBdTBgRmTv5h3wS6dO6yteihQoGUYnAUUSE3uWIXgOBAP0=
X-Received: by 2002:a05:6512:33c9:b0:542:232a:7b2c with SMTP id
 2adb3069b0e04-543e4c017e6mr7595249e87.29.1738673372814; Tue, 04 Feb 2025
 04:49:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203031213.399914-1-koichiro.den@canonical.com> <20250203031213.399914-4-koichiro.den@canonical.com>
In-Reply-To: <20250203031213.399914-4-koichiro.den@canonical.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Feb 2025 13:49:22 +0100
X-Gm-Features: AWEUYZmicD-KTkukacr-qp_vj9khYtqZlX8C1R-ghbNXUqwnDjHUxpSjYkyVFNU
Message-ID: <CAMRc=McftUKH_DNvsJPjBP1MMSo94CCXxT+ffoR5F_H=OegBvg@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] gpio: aggregator: add read-only 'dev_name'
 configfs attribute
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 4:12=E2=80=AFAM Koichiro Den <koichiro.den@canonical=
.com> wrote:
>
> Add a read-only 'dev_name' attribute to configfs interface, which
> exposes the platform bus device name. Users can easily identify which
> gpiochip<N> has been created as follows:
>
> $ cat /sys/kernel/config/gpio-aggregator/<aggregator-name>/dev_name
>   gpio-aggregator.0
> $ ls -d /sys/devices/platform/gpio-aggregator.0/gpiochip*
>   gpiochip3
>
> Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> ---
>  drivers/gpio/gpio-aggregator.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregato=
r.c
> index c63cf3067ce7..76d3a8677308 100644
> --- a/drivers/gpio/gpio-aggregator.c
> +++ b/drivers/gpio/gpio-aggregator.c
> @@ -732,6 +732,23 @@ static struct configfs_attribute *gpio_aggr_line_att=
rs[] =3D {
>         NULL
>  };
>
> +static ssize_t
> +gpio_aggr_device_dev_name_show(struct config_item *item, char *page)
> +{
> +       struct gpio_aggregator *aggr =3D to_gpio_aggregator(item);
> +       struct platform_device *pdev;
> +
> +       guard(mutex)(&aggr->lock);
> +
> +       pdev =3D aggr->pdev;
> +       if (pdev)
> +               return sprintf(page, "%s\n", dev_name(&pdev->dev));
> +
> +       return sprintf(page, "%s.%d\n", DRV_NAME, aggr->id);
> +}
> +
> +CONFIGFS_ATTR_RO(gpio_aggr_device_, dev_name);
> +
>  static ssize_t
>  gpio_aggr_device_live_show(struct config_item *item, char *page)
>  {
> @@ -781,6 +798,7 @@ gpio_aggr_device_live_store(struct config_item *item,=
 const char *page,
>  CONFIGFS_ATTR(gpio_aggr_device_, live);
>
>  static struct configfs_attribute *gpio_aggr_device_attrs[] =3D {
> +       &gpio_aggr_device_attr_dev_name,
>         &gpio_aggr_device_attr_live,
>         NULL
>  };
> --
> 2.45.2
>

I don't understand why this isn't part of the previous patch?

Bart
