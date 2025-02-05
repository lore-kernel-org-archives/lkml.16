Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E92613A244
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 13:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738762754; cv=none; b=o6n2QQkzxeHQ7Zi4rni030IITH6zcZ/RMqpCDaL/ECJ+ej9Kcp6p7n3OYB9CBfROzADFSI/gaHugvwY22QhdMKOUpv8WOSkkdHSDz6wC5RYoNXg1lyQngGW4VhlJ09i8uy/bgalFibnSUUmxubuPKHsLcu2NOxaFUWDfJ8Uwilk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738762754; c=relaxed/simple;
	bh=XIlBawrt1HrnAL1fJF/NMVQKvvuIhgEKoVwat7RndvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ddBiIGkMaqnLg7rafyoR/mw2seZBoXXS+0kXNRARCQ8ZHaVg2DXWciptHRXS+EfjlkcXJrH34nKkhORDcvkbu65QVO+fqgVwOUuhzrYlz5Q8P7PVq71DmqFK0C+7PL8qXutt5SunHs4vKe8gJ3o++LZKwcqJjI1AFm1O9Ky5Qkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=fail smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=LC3paigR; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="LC3paigR"
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 049173F477
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 13:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738762749;
	bh=tSugA90/VHb7IX3bkFcnQ+nO3Qe0hz7LEEDJxb8uKmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=LC3paigRbBKWv0SGZknM5iGXFXwSyi1FNDvaeypabsaXrZYbADvOfXLvAkgBx7RWC
	 kUPEr8sSGWMShLMRcnMtduAVBPyGdB7jyfqm/JmqJ/mK5TVPCVJX6FisPVhzafl0U7
	 bPX6FLlpmLuYaXa6u1KK/gLW1YFVG1M95Ma0EMGToP08tYftzWQyJlQsKCCneDXpTY
	 KJwOGNglEZZ2LxIxT+6SUZXpp2j34gt5gYU7nd4nElsyhWxeXQznnMR18VySnxKs89
	 VksAhcgEvZmVa3KoAUmJWdw8XxzaHjcUm5emzD0z/ZB20SrqL0TxXFmfCav7HEBp4y
	 H6uf9N0MAE36A==
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-216387ddda8so150510075ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 05:39:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738762747; x=1739367547;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tSugA90/VHb7IX3bkFcnQ+nO3Qe0hz7LEEDJxb8uKmo=;
        b=FR+H76lGhT7WtXiA2hNy5KpKI9+MOTwIUfCasO1GgyrvGqwIDJkMNhN8If6ECDSnpA
         HNkpMLIQCgngrue7zNq9XAUgWrBmVmTePlkylwRwIkhKV+6sC8uRHmE11CLSroFFKxhA
         7eXXCV4KGXQsqLYUzpnAFTvj9fnKWMz4FID4OnPZf9j0Nxfvz3RTIMWay1DT7mtaiJ4G
         YisMhOuWtwCuhmfjzhYjiH/nyfgjgbV9oIR+6k0shQE5VGBMRjz+LeLX6zKv36e0pcGR
         CqRK/jO9fcCS036+Fq6sjYa+mQt1B5VPyyEi6kaBgrGoSEmlBia+Q/rXyvGU+dz4ro13
         tW9g==
X-Forwarded-Encrypted: i=1; AJvYcCV+XZUumoLdckrfZwohhSgN8MKUpGdFDAeohVjd/j5xVUr0sZXqx1I3ZmRs1mVJD3BepDNMmPqTLgo5i3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuySOfQkcpAFF3k2GkAfmVg7qMWM9u0z7JX/IMpuvz+/w5jpwh
	gtN+3aRCfFXaoO+B/5eYZhQZtydeIl2MgjKQe9gEdQO0H6dNwUGG8Ai4//jAVg2SI9tDs2T5xRC
	7YV5HYsBSz7K5Th5B20hXlXjr4nVtmoF5v9aE2enJAr4psFc48VR5ouqhjiUXnczgG3iHQnv567
	nzlSKEoQuz4w==
X-Gm-Gg: ASbGncsRMzJRZlT5wRhmZi4s9YcnSl+bt2R+u/6bXTGAjjQHeX9Labzmlw4epskLink
	0MBP9nIbAxJBCQWSNCiX01kr8AYnhbnNzgO+8+ca3+dHqJvHms2AdJ57lv9DfYIer+GfjoHpK0L
	I7aY1IU+5B3Kq+kAEDlD5iVCbM1CQip08FxMk7HRh/rvroDr9zCB4UdfaGX1hBeo7ruUIzlMrgQ
	E9VxHNN9JD6Qheg4OY0KLw884DtrKtnUFTYzjIa32SlaIvPAuEWWTb+BO7GeKpe9F3FopT+rj0P
	sEPJlNg=
X-Received: by 2002:a17:902:e803:b0:215:e98c:c5c1 with SMTP id d9443c01a7336-21f17e74e67mr41446655ad.30.1738762746896;
        Wed, 05 Feb 2025 05:39:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIVRvCnElpUm14sHLZB2kuMes82lQ8It/4MSzK0Nn/xkxQ5iPNJpL3qRVBbRM57Ddm4/GQOg==
X-Received: by 2002:a17:902:e803:b0:215:e98c:c5c1 with SMTP id d9443c01a7336-21f17e74e67mr41446365ad.30.1738762746433;
        Wed, 05 Feb 2025 05:39:06 -0800 (PST)
Received: from localhost ([240f:74:7be:1:32aa:793b:6be9:7226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f15431cb5sm16344195ad.98.2025.02.05.05.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 05:39:06 -0800 (PST)
Date: Wed, 5 Feb 2025 22:39:04 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/10] gpio: aggregator: introduce basic configfs
 interface
Message-ID: <dmy4mvxut3l5kqds2b2fnnes5ukr73spddwgrbkeoqrb5p5wir@hkq6ltr7d6dt>
References: <20250203031213.399914-1-koichiro.den@canonical.com>
 <20250203031213.399914-3-koichiro.den@canonical.com>
 <CAMRc=MfcooZXBqVpbQ0ak+8LGsPDzwKSN3Zfb0eZDx1Bx4duzQ@mail.gmail.com>
 <lkqxpfu3uzh4p4as3msv322qwlm6frv3iujifs6f3t2fjl4sep@3hsp6gzdieik>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <lkqxpfu3uzh4p4as3msv322qwlm6frv3iujifs6f3t2fjl4sep@3hsp6gzdieik>

On Tue, Feb 04, 2025 at 11:41:16PM GMT, Koichiro Den wrote:
> On Tue, Feb 04, 2025 at 01:48:49PM GMT, Bartosz Golaszewski wrote:
> > On Mon, Feb 3, 2025 at 4:12 AM Koichiro Den <koichiro.den@canonical.com> wrote:
> > >
> > > The existing sysfs 'new_device' interface has several limitations:
> > > * No way to determine when GPIO aggregator creation is complete.
> > > * No way to retrieve errors when creating a GPIO aggregator.
> > > * No way to trace a GPIO line of an aggregator back to its
> > >   corresponding physical device.
> > > * The 'new_device' echo does not indicate which virtual gpiochip<N>
> > >   was created.
> > > * No way to assign names to GPIO lines exported through an aggregator.
> > >
> > > Introduce the new configfs interface for gpio-aggregator to address
> > > these limitations. It provides a more streamlined, modern, and
> > > extensible configuration method. For backward compatibility, the
> > > 'new_device' interface and its behaviour is retained for now.
> > >
> > > This commit implements minimal functionalities:
> > >
> > >   /config/gpio-aggregator/<name-of-your-choice>/
> > >   /config/gpio-aggregator/<name-of-your-choice>/live
> > >   /config/gpio-aggregator/<name-of-your-choice>/<lineY>/
> > >   /config/gpio-aggregator/<name-of-your-choice>/<lineY>/key
> > >   /config/gpio-aggregator/<name-of-your-choice>/<lineY>/offset
> > >
> > > Basic setup flow is:
> > > 1. Create a directory for a GPIO aggregator.
> > > 2. Create subdirectories for each line you want to instantiate.
> > > 3. In each line directory, configure the key and offset.
> > >    The key/offset semantics are as follows:
> > >    * If offset is >= 0:
> > >      - key specifies the name of the chip this GPIO belongs to
> > >      - offset specifies the line offset within that chip.
> > >    * If offset is <0:
> > >      - key needs to specify the GPIO line name.
> > > 4. Return to the aggregator's root directory and write '1' to the live
> > >    attribute.
> > >
> > > For example, the command in the existing kernel doc:
> > >
> > >   echo 'e6052000.gpio 19 e6050000.gpio 20-21' > new_device
> > >
> > > is equivalent to:
> > >
> > >   mkdir /sys/kernel/config/gpio-aggregator/<custom-name>
> > >   # Change <custom-name> to name of your choice (e.g. "aggr0")
> > >   cd /sys/kernel/config/gpio-aggregator/<custom-name>
> > >   mkdir line0 line1 line2  # Only "line<Y>" naming allowed.
> > >   echo e6052000.gpio > line0/key
> > >   echo 19            > line0/offset
> > >   echo e6050000.gpio > line1/key
> > >   echo 20            > line1/offset
> > >   echo e6050000.gpio > line2/key
> > >   echo 21            > line2/offset
> > >   echo 1             > live
> > >
> > > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> > > ---
> > >  drivers/gpio/gpio-aggregator.c | 549 ++++++++++++++++++++++++++++++++-
> > >  1 file changed, 548 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
> > > index 570cd1ff8cc2..c63cf3067ce7 100644
> > > --- a/drivers/gpio/gpio-aggregator.c
> > > +++ b/drivers/gpio/gpio-aggregator.c
> > > @@ -9,10 +9,14 @@
> > >
> > >  #include <linux/bitmap.h>
> > >  #include <linux/bitops.h>
> > > +#include <linux/completion.h>
> > > +#include <linux/configfs.h>
> > >  #include <linux/ctype.h>
> > >  #include <linux/delay.h>
> > >  #include <linux/idr.h>
> > >  #include <linux/kernel.h>
> > > +#include <linux/list.h>
> > > +#include <linux/lockdep.h>
> > >  #include <linux/mod_devicetable.h>
> > >  #include <linux/module.h>
> > >  #include <linux/mutex.h>
> > > @@ -34,11 +38,39 @@
> > >   */
> > >
> > >  struct gpio_aggregator {
> > > +       struct config_group group;
> > >         struct gpiod_lookup_table *lookups;
> > >         struct platform_device *pdev;
> > > +       struct mutex lock;
> > > +       int id;
> > > +
> > > +       /* Synchronize with probe */
> > > +       struct notifier_block bus_notifier;
> > > +       struct completion probe_completion;
> > > +       bool driver_bound;
> > > +
> > > +       /* List of gpio_aggregator_line. Always added in order */
> > > +       struct list_head list_head;
> > > +
> > >         char args[];
> > >  };
> > >
> > > +struct gpio_aggregator_line {
> > > +       struct config_group group;
> > > +       struct gpio_aggregator *parent;
> > > +       struct list_head entry;
> > > +
> > > +       /* Line index within the aggregator device */
> > > +       int idx;
> > > +
> > > +       /* GPIO chip label or line name */
> > > +       char *key;
> > > +       /* Can be negative to indicate lookup by line name */
> > > +       int offset;
> > > +
> > > +       enum gpio_lookup_flags flags;
> > > +};
> > > +
> > >  static DEFINE_MUTEX(gpio_aggregator_lock);     /* protects idr */
> > >  static DEFINE_IDR(gpio_aggregator_idr);
> > >
> > > @@ -61,6 +93,97 @@ static int aggr_add_gpio(struct gpio_aggregator *aggr, const char *key,
> > >         return 0;
> > >  }
> > >
> > > +static int aggr_notifier_call(struct notifier_block *nb, unsigned long action,
> > > +                             void *data)
> > > +{
> > > +       struct gpio_aggregator *aggr;
> > > +       struct device *dev = data;
> > > +
> > > +       aggr = container_of(nb, struct gpio_aggregator, bus_notifier);
> > > +       if (!device_match_name(dev, aggr->lookups->dev_id))
> > > +               return NOTIFY_DONE;
> > > +
> > > +       switch (action) {
> > > +       case BUS_NOTIFY_BOUND_DRIVER:
> > > +               aggr->driver_bound = true;
> > > +               break;
> > > +       case BUS_NOTIFY_DRIVER_NOT_BOUND:
> > > +               aggr->driver_bound = false;
> > > +               break;
> > > +       default:
> > > +               return NOTIFY_DONE;
> > > +       }
> > > +
> > > +       complete(&aggr->probe_completion);
> > > +       return NOTIFY_OK;
> > > +}
> > 
> > Suggestion: this is the third time we're seeing this mechanism being
> > used (after gpio-sim and gpio-virtuser). Maybe it's time to try and
> > abstract it as much of the code is shared?
> 
> That makes sense. I would add gpiolib-vgpio.[ch] and add an opaque
> * struct vgpio_common
> and two api functions as our first step:
> * vgpio_init(get_devname_cb) # bus notifier calls the cb to get devname
> * vgpio_register_pdev_sync(pdevinfo) # return -ENXIO when probe fails
> What do you think?

The previous comment was a bit too rough, sorry. I feel it's not a good
idea to write down detailed design plan here, so I'm thinking of having it
reviewed in v3. Please disregard the above comment.
I also noticed that this v2 patch series lacks 'select CONFIGFS_FS' for
CONFIG_GPIO_AGGREGATOR. I'll add it in v3.

In any case, I'll wait for further progress in the discussion at:
https://lore.kernel.org/all/CAMRc=Meb633zVgemPSeNtnm8oJmk=njcr2CQQbD5UJd=tBC5Zg@mail.gmail.com/

Thanks for the review.

Koichiro

> 
> Thanks,
> Koichiro
> 
> > 
> > The rest looks good to me.
> > 
> > Bart
