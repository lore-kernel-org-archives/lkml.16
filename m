Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CEA268FF0
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 22:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747951788; cv=none; b=M2CTlxCWyTKBmLCDNnZsruj89ogpSg09h5KPSaMibUQaptB3YRd3qVpABkSLVeOjUDe6P9TWuibd2OHZC9wORtST1KaXFA8dl5GbTHmcHLZt0OGZsm1PkyJciJRKPmFawoda6lrkv3UFwV2eZ6jOQvAIRarCGAzxN1lPrswqsGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747951788; c=relaxed/simple;
	bh=aGU5joKlmsc4tJLp/ZjJC18En5pCyl2YsaUdNZBEyNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iKaVKnJhZ00zTvWk9aCHXW0tQAgudp+XUsp3mtPQ50P4LAD+mrBYZiIuXSaDvonismlZzbNNkJpwTiAU1eyavwr66kLyfa/LY0rubyORci0U+HAPuLP12kkl0h/tyis79UG4zv4mTJXecHyCAAhiwgAB3kYqznDhavaziPo3eu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eo7EWxoX; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eo7EWxoX"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e7d6bedd114so1343237276.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747951784; x=1748556584; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ytKn/xAm5fG7iosGiXWkgx37JTIZsw4UDMYhapgMJtk=;
        b=eo7EWxoXG2C2dab2Gcs9PgUiF/krfJL/saD2738WdZyUopzv55iD3hI9+AIavMnd2R
         B8OGlDGvyC2RpKM3opg6YMXuOXS6ehgLc8QMPmCC5S+GlUXMABTWcFwTB5VrBTYMj9K/
         LopCVyZU9t9ZgMhjP4he1NLIrUKF3qyItZ4ByT5uQHQmHLkIso5+P94RFEOKpKYZMlq9
         i5plE2wNcYhznFgIkVcvXTnqGuk5yls1qMwSKkQmDi/h+/Nui5gd3a7sF7ms2j4pi7k7
         MdbWy3yla+Ad+a4bsUGGJDL6vEhy05JYuxaeCXej3kWicsfkgMTRJCXekyuBuDwb/Z1b
         coxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747951784; x=1748556584;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ytKn/xAm5fG7iosGiXWkgx37JTIZsw4UDMYhapgMJtk=;
        b=kmeME+/rO+AQy+Q9qXrfMwKwBLWhlfVU7Vu7QqB10ezFNU9mNbtdYFNd077OeXY5iG
         tCy1wMy5//puAgBQdVkB8VbS5WZFk+x2BLEnHN//fXrD+/HKCkFpsh9a36QIR3wcGadJ
         VSNMcEMFVmW0x17LlhOl6lw2U56585JzCRVQC/7DLaQaVCLeFuw0zA5n7ILEOV/KdnO/
         PNDAx8eDtx9bbMXbpT2Qet3muxiIrjyJa8aDb7AheM6kZgfDgYteT0ynNZZ4gQoSEZbm
         t/WuN3Nj7TZxp29SsiJzSsZSVKcY1AplidsK76lxe+rKJ7KezWlj6a34IGoaeiPaEyr5
         RL3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVoOWDG/h2xIYoCtB2UFQwvGrXDqMuq08kPGbQO7IY48IEJ0T2+QEomtCvKUNP9HzKgu3Pa3fb7AkZqFBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWWlD3D5eqH9Yx+kmSbwNsonDHGvZgyLsP8Hv+V1bvnh3NGkq9
	M54/gVTAHzRWZHD4PI5EgvBftqlTMdGoDRv7GzmJhUG/o9CZLfj5GW2ck52iBTBVnsPaFv0I7XX
	8YbYoj8GEsuH4rlrVPHfaqTdLm75CFZ+UuOkudTM88A==
X-Gm-Gg: ASbGnctHA7FlsUu3T+P0ZQDdCk1lFF9wxuY5ZauRdMuKLEoOy1wAyuYiwVOGXNVlgDb
	j12pKRLAnZVgcdJp9NfdYewRFJn0oGGgF4O5wETm2QWhtxdBSmhgQH5E9lPd+TXv51ThFVoyAdB
	42fhkYDSQCk69Va7IctyMPVwe5SYOexNQf4A==
X-Google-Smtp-Source: AGHT+IGYyJxLMA8/8GOi2bmSkwfU/WISSYVhRusNzbVkFPw+Z4WEurkZHKkq6Z3/hyy3zkRDJ4/v8Z7Q+C1zdP3A248=
X-Received: by 2002:a05:6902:2190:b0:e7d:3b61:e24a with SMTP id
 3f1490d57ef6-e7d3b61e544mr19540272276.32.1747951784370; Thu, 22 May 2025
 15:09:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPDyKFozR4qDq4mzcZBK-LcoPf=fGyuJTXwdt=Ey+_DcQOAp0g@mail.gmail.com>
 <4o3wo76st7w6qwyye3rrayuo2qx773i6jfzcnbkhdj76ouh7ds@3e2mblehkgwf>
 <CAPDyKFqMB7XutXba73YHx1X4rm6uc3Fz6yMZ8yM=wgduEmgUDg@mail.gmail.com>
 <a20fc6ee-c6c3-4013-b175-4918b9a44380@tuxon.dev> <CAPDyKFpbeLJUiB_xQbqDib+-8Q3AcJNVg+DuEcqmVGMbFdNxwA@mail.gmail.com>
 <fgl4w5uhxci7rrbdigtni72vveb2gqemh6iccz4qruqkek5rja@rzwkcjg6hkid>
 <3b1963ba-f93f-48f2-8fb0-a485dd80ffcb@tuxon.dev> <CAPDyKFqrAS4iV59S-zJ9H7_3VuGr9JdZABhfUGBwTzQNDCasaw@mail.gmail.com>
 <482b55c9-a210-4b2d-8405-e9f30d48a8fd@tuxon.dev> <CAPDyKFpLF2P438GGWSgbXzpT7JNdUjtZ2ZxYf1_4=fNUX3s-KQ@mail.gmail.com>
 <4fzotopz57igmiyssgkogfbup6uu7qgza3t53t5qsouegmj7ii@wfiz4g3eiffs>
In-Reply-To: <4fzotopz57igmiyssgkogfbup6uu7qgza3t53t5qsouegmj7ii@wfiz4g3eiffs>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 23 May 2025 00:09:08 +0200
X-Gm-Features: AX0GCFugZ72jR4N4Zhb7o7hjSV-HtwPLk02fPFYwEJ3WEVVCfay8AKrTsrcY3DI
Message-ID: <CAPDyKFoxs6wDCLp5EGHVqkqSstBLNmngps2KfanRezV_EN8tuA@mail.gmail.com>
Subject: Re: [PATCH] driver core: platform: Use devres group to free driver
 probe resources
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Cameron <jic23@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, dakr@kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org, bhelgaas@google.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 May 2025 at 20:47, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>
> On Thu, May 22, 2025 at 06:28:44PM +0200, Ulf Hansson wrote:
> > On Thu, 22 May 2025 at 16:08, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> > >
> > > Hi, Ulf,
> > >
> > > On 22.05.2025 14:53, Ulf Hansson wrote:
> > > >
> > > > That said, I think adding a devm_pm_domain_attach() interface would
> > > > make perfect sense. Then we can try to replace
> > > > dev_pm_domain_attach|detach() in bus level code, with just a call to
> > > > devm_pm_domain_attach(). In this way, we should preserve the
> > > > expectation for drivers around devres for PM domains. Even if it would
> > > > change the behaviour for some drivers, it still sounds like the
> > > > correct thing to do in my opinion.
> > >
> > > This looks good to me, as well. I did prototype it on my side and tested on
> > > all my failure cases and it works.
> >
> > That's great! I am happy to help review, if/when you decide to post it.
>
> So you are saying you'd be OK with essentially the following (with
> devm_pm_domain_attach() actually being elsewhere in a real patch and not
> necessarily mimicked by devm_add_action_or_reset()):

Correct!

>
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index cfccf3ff36e7..1e017bfa5caf 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -1376,6 +1376,27 @@ static int platform_uevent(const struct device *dev, struct kobj_uevent_env *env
>         return 0;
>  }
>
> +
> +static void platform_pm_domain_detach(void *d)
> +{
> +       dev_pm_domain_detach(d, true);
> +}

Well, I would not limit this to the platform bus, even if that is the
most widely used.

Let's add the new generic interface along with
dev_pm_domain_attach|detach* and friends instead.

Then we can convert bus level code (and others), such as the platform
bus to use it, in a step-by-step approach.

> +
> +static int devm_pm_domain_attach(struct device *dev)
> +{
> +       int error;
> +
> +       error = dev_pm_domain_attach(dev, true);
> +       if (error)
> +               return error;
> +
> +       error = devm_add_action_or_reset(dev, platform_pm_domain_detach, dev);
> +       if (error)
> +               return error;
> +
> +       return 0;
> +}
> +
>  static int platform_probe(struct device *_dev)
>  {
>         struct platform_driver *drv = to_platform_driver(_dev->driver);
> @@ -1396,15 +1417,12 @@ static int platform_probe(struct device *_dev)
>         if (ret < 0)
>                 return ret;
>
> -       ret = dev_pm_domain_attach(_dev, true);
> +       ret = devm_pm_domain_attach(_dev);
>         if (ret)
>                 goto out;
>
> -       if (drv->probe) {
> +       if (drv->probe)
>                 ret = drv->probe(dev);
> -               if (ret)
> -                       dev_pm_domain_detach(_dev, true);
> -       }
>
>  out:
>         if (drv->prevent_deferred_probe && ret == -EPROBE_DEFER) {
> @@ -1422,7 +1440,6 @@ static void platform_remove(struct device *_dev)
>
>         if (drv->remove)
>                 drv->remove(dev);
> -       dev_pm_domain_detach(_dev, true);
>  }
>
>  static void platform_shutdown(struct device *_dev)
>
>
> If so, then OK, it will work for me as well. This achieves the
> same behavior as with using devres group. The only difference is that if
> we ever need to extend the platform bus to acquire/release more
> resources they will also have to use devm API and not the regular one.

Sounds reasonable to me! Thanks for a nice discussion!

When it comes to the devm_pm_runtime_enable() API, I think we
seriously should consider removing it. Let me have a closer look at
that.

Kind regards
Uffe
