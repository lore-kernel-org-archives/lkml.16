Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935022139BF
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 14:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738680298; cv=none; b=OOOEOy/XO421LB3l/sJT52rItdL+hAWqSH3CtEgq7mz+Yh+gsIoUoXNWrIwxYWtBzl2X4N5DRdSwXfLV7yXButKZ7B1UHMzTRQ2Q/lIEoRooPLHjfT9IK2PSf2i/OjtH9Nve/nJTastWWDbD9VPHhnjPgwsJirigq0qECPFqbig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738680298; c=relaxed/simple;
	bh=9teYJwqqzM5RFJ+8dP6uj/h5FosolVaZCmXIUOJI1Bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cgRy3TETAqPB3refBwjSHKSL1LpPGVogjLfGTSxH+Br2ywi59TwqRSG79hQ5nbX65BMQMZAevVaHkISW1wGgQwdU6o0X1Zo/fitPMbzPIymUeutq0Y4GFpprwrolY61WR7uzWm7f8tlf0SL0ipvlzcVrQr5Uw+Tzftvs0diqMcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=t7eY0/8b; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="t7eY0/8b"
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 995063F84C
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 14:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738680293;
	bh=zxOwQXHcqsZg1DYdwRGnMofNXrezdocUt5b4vJLNAf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=t7eY0/8bvTmqDpKFScHTzNpLCK9bTeneM/WKN+2lPmpKZXYwB/tBPoUsRYbLExqRB
	 XoOeyJ5H/BM9tNL+xDgQ3X+xPjvDs6QzzJ8tWRkGsHuCqnJfUwSnwnScvPRezHaeg+
	 fzc1XxiKTVZzIapTpgTo0w0DbTsH4AZigFa7zD0i9/Hz3GE6o25YFEv06Bsvry/GC5
	 G6j+GPa5F/GCpDopJ0lYA9gS2UUBlGLgHA4/mQdT4YHvTOQpul3+nOwFpJIv2GDJjl
	 o7GM0AcAfzRBuCgKjv2N0orG4C9LAKI4xiBnM1aoLzXayBmT3bj33fpOK9W8sdl0wh
	 iUqPfLcGOSvRA==
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-216311faa51so105109825ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 06:44:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738680292; x=1739285092;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zxOwQXHcqsZg1DYdwRGnMofNXrezdocUt5b4vJLNAf0=;
        b=E4KwYKCgJoCrZV/xZSnj/O6RayjunABfMm3kaDav1fUHdnz7X58P/4LpNXWiag+wu0
         R9ZHhxOJE4rFiMfYXnwrnkoF9Em0aua+IT6eVe6KGzSXROIubbhGW8cDE25VS+xGlsMT
         ePJ0VixlLoh6AREKQMx3rnplbWuKmT9A+f9ZhB+/jGLjDJLs88kio2Aemp6HrfxEWRi8
         Ua+TFsJhfTu9XtxjwQz9Q6RdgLTTV/DzHc0/m3CmQBDxqpfRxOuxx/w/N1nV+DzLy/vW
         rHxtmiyDlRv/BqfIo0CTEC46YWRGh/RfJGzAK1CekBgUSllp63mnTzg/Qh15cbHXtTkF
         pjSw==
X-Forwarded-Encrypted: i=1; AJvYcCV5ZUDPbKfOsPS73h8qL6YjkqYVF3b4b75he1IlHlg3IfsO75cLSxg1BOPYQj7RVrH6+jqNwjPBCKgrUs4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP5yqeGG1jqDyr84mgGcYLFMalddsfZ0OBtSPFr9JV8Dlht2f1
	wi75T0w/HgO1j8puymHaWVf09IScids957n0rMG2GrJCEkyCI0TFuKTzamXnWd5lerfGLYy9QKR
	/WmP5/dkVLVPwB1IED6SVhCMlx1dneLBb9tE0jYaRdV2aKXsxtPb/QtcFxNP4/ZBrY+ZMjZnkaG
	ohLA==
X-Gm-Gg: ASbGncsbEhF5s+B1EQWzlr3KtaqzDxjizKrd2cLnReH16aPlYRzAns+59pkJftBY+st
	yY5k9loLauRNfJ7li3p8Hr0djj3QQLxgo1pEWJ+wWm0JnfpwT8Ez5rcsEnCIFE9JagLOYN7MTMm
	FPGTXQSR95I2blm8us7wNjhhVPRdNcWX4Is5TYlaBowv47aAOL59mylVnK8ob4HY7RmAbUXs+j+
	i6WbNxSDsWYjKtD3GDGUy7PHNhH5Ydb19O6kOU3aLK4VXf3r6kBs0siYlEx2RfE7mJ7dEib8DDk
	CKNurlo=
X-Received: by 2002:a17:902:da84:b0:216:2aec:2d54 with SMTP id d9443c01a7336-21f01c3d2b7mr48082605ad.8.1738680291404;
        Tue, 04 Feb 2025 06:44:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZHYpYZXJFrqgUlIWj+UgazrfCD8t7GMWpQI06MDxwE31jOCPjjfMtRmeJX0yv+O42j2I+eg==
X-Received: by 2002:a17:902:da84:b0:216:2aec:2d54 with SMTP id d9443c01a7336-21f01c3d2b7mr48082305ad.8.1738680291046;
        Tue, 04 Feb 2025 06:44:51 -0800 (PST)
Received: from localhost ([240f:74:7be:1:45f0:d4ba:baba:a275])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de33000ebsm97243265ad.159.2025.02.04.06.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 06:44:50 -0800 (PST)
Date: Tue, 4 Feb 2025 23:44:49 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/10] gpio: aggregator: add read-only 'dev_name'
 configfs attribute
Message-ID: <rejcrhomapkfyho55bedlfo5cqqly2opzkkym44mqqpsofzjmc@pylnreerkpcc>
References: <20250203031213.399914-1-koichiro.den@canonical.com>
 <20250203031213.399914-4-koichiro.den@canonical.com>
 <CAMRc=McftUKH_DNvsJPjBP1MMSo94CCXxT+ffoR5F_H=OegBvg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McftUKH_DNvsJPjBP1MMSo94CCXxT+ffoR5F_H=OegBvg@mail.gmail.com>

On Tue, Feb 04, 2025 at 01:49:22PM GMT, Bartosz Golaszewski wrote:
> On Mon, Feb 3, 2025 at 4:12 AM Koichiro Den <koichiro.den@canonical.com> wrote:
> >
> > Add a read-only 'dev_name' attribute to configfs interface, which
> > exposes the platform bus device name. Users can easily identify which
> > gpiochip<N> has been created as follows:
> >
> > $ cat /sys/kernel/config/gpio-aggregator/<aggregator-name>/dev_name
> >   gpio-aggregator.0
> > $ ls -d /sys/devices/platform/gpio-aggregator.0/gpiochip*
> >   gpiochip3
> >
> > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> > ---
> >  drivers/gpio/gpio-aggregator.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
> > index c63cf3067ce7..76d3a8677308 100644
> > --- a/drivers/gpio/gpio-aggregator.c
> > +++ b/drivers/gpio/gpio-aggregator.c
> > @@ -732,6 +732,23 @@ static struct configfs_attribute *gpio_aggr_line_attrs[] = {
> >         NULL
> >  };
> >
> > +static ssize_t
> > +gpio_aggr_device_dev_name_show(struct config_item *item, char *page)
> > +{
> > +       struct gpio_aggregator *aggr = to_gpio_aggregator(item);
> > +       struct platform_device *pdev;
> > +
> > +       guard(mutex)(&aggr->lock);
> > +
> > +       pdev = aggr->pdev;
> > +       if (pdev)
> > +               return sprintf(page, "%s\n", dev_name(&pdev->dev));
> > +
> > +       return sprintf(page, "%s.%d\n", DRV_NAME, aggr->id);
> > +}
> > +
> > +CONFIGFS_ATTR_RO(gpio_aggr_device_, dev_name);
> > +
> >  static ssize_t
> >  gpio_aggr_device_live_show(struct config_item *item, char *page)
> >  {
> > @@ -781,6 +798,7 @@ gpio_aggr_device_live_store(struct config_item *item, const char *page,
> >  CONFIGFS_ATTR(gpio_aggr_device_, live);
> >
> >  static struct configfs_attribute *gpio_aggr_device_attrs[] = {
> > +       &gpio_aggr_device_attr_dev_name,
> >         &gpio_aggr_device_attr_live,
> >         NULL
> >  };
> > --
> > 2.45.2
> >
> 
> I don't understand why this isn't part of the previous patch?

I just separated it to keep the previous one minimal as possible :)
Ok, I'll squash it.

Koichiro

> 
> Bart
