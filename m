Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747F5214229
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 12:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738673345; cv=none; b=Rca2IzZQNsDe7TogRm1wtAJH0banW3Q0VxqPVdvXaSQlGYCM0exdh6FCw1YXIHFoPqEQ7BTZHtILaUGMaRFVVDXyBK1usBkV5GhrfE4TzLwtXivzfa7D6fZEuOov8+Kd7DuT8NNV6UWTOi4CakE65htjHI7SPaU7klqfgDgxYo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738673345; c=relaxed/simple;
	bh=mzLFYGyzehDRkrpL2rCtNf203OLWIuVzWWcEfWVQNGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZT6urW+EDCEY1/7W4nqTwgwZY/GHupYWtjvuxENUu7iLczJdgTuJWRpMZQPHqBexp1Q4rwnXz1vi/fAzd5/jT/UOCbiwbwXT8l3dr9D3195NnCNHyXzQh00TCx1UdbntSSrUgHXya7ulm5i1AhHZ7CauMjglo7oAk2IMV30JOzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=o6AJPwqt; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="o6AJPwqt"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5439a6179a7so5752989e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 04:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738673340; x=1739278140; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqRA2SBT+SjnAkRh9pVs7Dxhd7dSiZIUx9jsLOe7RZ8=;
        b=o6AJPwqteEQcW/loahGvT6wLEGSoAVLbpW1Wt7altjg7XJLOwVyu6NsdAcTE9H4R55
         O9Mj5jk/Gn0YL1dXPhLx7kvnBkcN9rAK31pQ8+t8EuTJhCVaWsoW8I3xJDbtCXSowxeT
         I2VIV4VDoDtoR1w5YihjN9R8VFl1YDzXJ16Pp5cHeNTUMmmRtPkC0j7tdeXkxQ5zKJnI
         SVKZivJ9Fx5fyzPXlt8Hy2GUvrLvUSs4d8pOxNwT2XaHPkAH410ucJgBVou2n0exa42d
         Jjnb0Pq3nl2jgxujoyWn3fMTaJYwjTsnqeDf8hAqJDdQttAs7ui2GBv1RJp02CNTXAmC
         hscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738673340; x=1739278140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EqRA2SBT+SjnAkRh9pVs7Dxhd7dSiZIUx9jsLOe7RZ8=;
        b=GTUvAzFemMktG+jIbsmuulGYbAisCDCAyfCGxcu8ZPGcr/oLIRL32ZXLoZZpfdPKrl
         frZRXmzC9PMAQWZOPqCqydoyukOSEKWG7EFqggllmgoTRfdlfH8UItUICPU2m3XRX3r4
         ygKCRdwC0ANWs0XFRyjX35oQWA1iSB65mooNi8Bky2Zod0l1ImuiPnt2RoOiX1x4mETz
         q0sVRYS8EN5hN9KHggQSg/gD+AZSI4QS0HDXhoQubBkY+/PP4czu5E70JddcTCXG99Hj
         lNdB220oNzoT6iG0c1wjtHi404S5i5puYht4SKTARRj4zyEcYetkYex/57alaMPXJ9Oj
         c9Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWXDZ3O1ea1O7MV9SDDAQ1FSToEg/fGtfDkX+etqvdT/sj21WlPOZA7RsgZHaD3VJol55bmkcuw1h6GQM4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqrhaFn8Gy6PIPsim/A27efuVdGNNYPTNbP2fJ9UucYgZXqEtV
	8UfHGniFkoXZieCb2HRCgep57fyMjzgMCtvDKciKuRhzHENqcnEc/q5t0NAsTqn3NCbnfXl77i5
	Jf8Gm5E/U8VRCG/7rP8AORk3Blc9pUI3QR4Tnxw==
X-Gm-Gg: ASbGnctxc8ysX3Jk6DIfVV/FQ0LBkl7MK1qbNqIJtbA0j6xkiMydu8PBXCncQ58RTL0
	++s4qF5KKjFnpKc3wPLzRoSTogqtrg0r+MVuo2elI+e44g+Dg0KdZnZjjVLDgSKPCNqZLdfEKD6
	REfO+bhzj0MTJpN1V8A4Qgm3hZLHF7
X-Google-Smtp-Source: AGHT+IFLvExsKG5QWwsqrKqyeOtjHht69G0JC//9fyUYqfAKhgSgDDacyrIGnw0QokpTapXDqPo3VyQdLX5556N9RGI=
X-Received: by 2002:a05:6512:3da4:b0:542:223c:30f5 with SMTP id
 2adb3069b0e04-543ffb489a8mr1265662e87.24.1738673340179; Tue, 04 Feb 2025
 04:49:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203031213.399914-1-koichiro.den@canonical.com> <20250203031213.399914-3-koichiro.den@canonical.com>
In-Reply-To: <20250203031213.399914-3-koichiro.den@canonical.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Feb 2025 13:48:49 +0100
X-Gm-Features: AWEUYZkM5jQaBKP5J2U5AWw7Z9Gvy52Ww6wrmmyt2rxzTmv_Mxr367RTSyTf7d4
Message-ID: <CAMRc=MfcooZXBqVpbQ0ak+8LGsPDzwKSN3Zfb0eZDx1Bx4duzQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] gpio: aggregator: introduce basic configfs interface
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 4:12=E2=80=AFAM Koichiro Den <koichiro.den@canonical=
.com> wrote:
>
> The existing sysfs 'new_device' interface has several limitations:
> * No way to determine when GPIO aggregator creation is complete.
> * No way to retrieve errors when creating a GPIO aggregator.
> * No way to trace a GPIO line of an aggregator back to its
>   corresponding physical device.
> * The 'new_device' echo does not indicate which virtual gpiochip<N>
>   was created.
> * No way to assign names to GPIO lines exported through an aggregator.
>
> Introduce the new configfs interface for gpio-aggregator to address
> these limitations. It provides a more streamlined, modern, and
> extensible configuration method. For backward compatibility, the
> 'new_device' interface and its behaviour is retained for now.
>
> This commit implements minimal functionalities:
>
>   /config/gpio-aggregator/<name-of-your-choice>/
>   /config/gpio-aggregator/<name-of-your-choice>/live
>   /config/gpio-aggregator/<name-of-your-choice>/<lineY>/
>   /config/gpio-aggregator/<name-of-your-choice>/<lineY>/key
>   /config/gpio-aggregator/<name-of-your-choice>/<lineY>/offset
>
> Basic setup flow is:
> 1. Create a directory for a GPIO aggregator.
> 2. Create subdirectories for each line you want to instantiate.
> 3. In each line directory, configure the key and offset.
>    The key/offset semantics are as follows:
>    * If offset is >=3D 0:
>      - key specifies the name of the chip this GPIO belongs to
>      - offset specifies the line offset within that chip.
>    * If offset is <0:
>      - key needs to specify the GPIO line name.
> 4. Return to the aggregator's root directory and write '1' to the live
>    attribute.
>
> For example, the command in the existing kernel doc:
>
>   echo 'e6052000.gpio 19 e6050000.gpio 20-21' > new_device
>
> is equivalent to:
>
>   mkdir /sys/kernel/config/gpio-aggregator/<custom-name>
>   # Change <custom-name> to name of your choice (e.g. "aggr0")
>   cd /sys/kernel/config/gpio-aggregator/<custom-name>
>   mkdir line0 line1 line2  # Only "line<Y>" naming allowed.
>   echo e6052000.gpio > line0/key
>   echo 19            > line0/offset
>   echo e6050000.gpio > line1/key
>   echo 20            > line1/offset
>   echo e6050000.gpio > line2/key
>   echo 21            > line2/offset
>   echo 1             > live
>
> Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> ---
>  drivers/gpio/gpio-aggregator.c | 549 ++++++++++++++++++++++++++++++++-
>  1 file changed, 548 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregato=
r.c
> index 570cd1ff8cc2..c63cf3067ce7 100644
> --- a/drivers/gpio/gpio-aggregator.c
> +++ b/drivers/gpio/gpio-aggregator.c
> @@ -9,10 +9,14 @@
>
>  #include <linux/bitmap.h>
>  #include <linux/bitops.h>
> +#include <linux/completion.h>
> +#include <linux/configfs.h>
>  #include <linux/ctype.h>
>  #include <linux/delay.h>
>  #include <linux/idr.h>
>  #include <linux/kernel.h>
> +#include <linux/list.h>
> +#include <linux/lockdep.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> @@ -34,11 +38,39 @@
>   */
>
>  struct gpio_aggregator {
> +       struct config_group group;
>         struct gpiod_lookup_table *lookups;
>         struct platform_device *pdev;
> +       struct mutex lock;
> +       int id;
> +
> +       /* Synchronize with probe */
> +       struct notifier_block bus_notifier;
> +       struct completion probe_completion;
> +       bool driver_bound;
> +
> +       /* List of gpio_aggregator_line. Always added in order */
> +       struct list_head list_head;
> +
>         char args[];
>  };
>
> +struct gpio_aggregator_line {
> +       struct config_group group;
> +       struct gpio_aggregator *parent;
> +       struct list_head entry;
> +
> +       /* Line index within the aggregator device */
> +       int idx;
> +
> +       /* GPIO chip label or line name */
> +       char *key;
> +       /* Can be negative to indicate lookup by line name */
> +       int offset;
> +
> +       enum gpio_lookup_flags flags;
> +};
> +
>  static DEFINE_MUTEX(gpio_aggregator_lock);     /* protects idr */
>  static DEFINE_IDR(gpio_aggregator_idr);
>
> @@ -61,6 +93,97 @@ static int aggr_add_gpio(struct gpio_aggregator *aggr,=
 const char *key,
>         return 0;
>  }
>
> +static int aggr_notifier_call(struct notifier_block *nb, unsigned long a=
ction,
> +                             void *data)
> +{
> +       struct gpio_aggregator *aggr;
> +       struct device *dev =3D data;
> +
> +       aggr =3D container_of(nb, struct gpio_aggregator, bus_notifier);
> +       if (!device_match_name(dev, aggr->lookups->dev_id))
> +               return NOTIFY_DONE;
> +
> +       switch (action) {
> +       case BUS_NOTIFY_BOUND_DRIVER:
> +               aggr->driver_bound =3D true;
> +               break;
> +       case BUS_NOTIFY_DRIVER_NOT_BOUND:
> +               aggr->driver_bound =3D false;
> +               break;
> +       default:
> +               return NOTIFY_DONE;
> +       }
> +
> +       complete(&aggr->probe_completion);
> +       return NOTIFY_OK;
> +}

Suggestion: this is the third time we're seeing this mechanism being
used (after gpio-sim and gpio-virtuser). Maybe it's time to try and
abstract it as much of the code is shared?

The rest looks good to me.

Bart
