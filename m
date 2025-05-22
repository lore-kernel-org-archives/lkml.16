Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B66327054E
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 22:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747952702; cv=none; b=BQTzotYa+rd8IQkx3YXNY0XpRn/ji2/EYhJ5arzczRrL/eJmzevtl1YlCpFRUGuGfHpIxqk64sW/iVnLIAnvAF6zFzwzKOYRLrjTp40XQj8GZyMQKvv1jLW0nECgpgilmdfvAaiN0dkTmOrBq8c5JIj1IFCw8Hajd1/Z13XuGzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747952702; c=relaxed/simple;
	bh=D4gXf7k9CUNciIPNoD2d5KCpK3nE9hEh+TOs0VegVxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OTqTYaCtOD3UD2s9Sr16hALrhQmGrb0UQQ0KjK9YCbnY9ASJ+twXb/aIMcV9eV5A19uSDarLfs/fhokTj00echYbRZ8SRZYQJCwU8x60YdKAj2Y8tyL3jNKGaBiiEMk5NBxAqEF1XBci9cBaJnkInFu/o/jLYnlW3N8lo2rigME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b4Kymxef; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b4Kymxef"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e7d75318601so812631276.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747952700; x=1748557500; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NxvStOnrhhdHpMl3yQwpKdFC4CaZgST0YwPJdz+2jlk=;
        b=b4Kymxefn57MH8NGpFP18ojN00ommkF1eBK+DW+GsA55syu3B7RL0ms+Mn0qy9S/JK
         Xt8FFPO+f0yNhAKj/93ETc2fcUkhKX3G3Gi9CRHxKYBGbfe4rZ29t7R18H6ErwdosM0a
         ZuSah0+5s8b4D7yexmp2KerldTwUYIhEXBAAGSs+cOrNUA1IevUUJMK0Q8aSwr7j8CwF
         E2590UPX34cvDGL/eUDlK8WFJO1Dc1LbI5RaUbn9hDeZS7xEt90DSAhnl1Bl5zrmWr8N
         PQEuHWsiBEhBLxUmo0/NvttidBCuG0sm5lIhSWbmQLqikPgKvk+qr86XRyj7oni/3NFe
         a+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747952700; x=1748557500;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NxvStOnrhhdHpMl3yQwpKdFC4CaZgST0YwPJdz+2jlk=;
        b=qoDogiXuUdMrMNZvff0Ff07AIwRw20zY7tUXTR4656lOYI2p9zcFsPmF2eSl02axFk
         SFxqma0qqvaW4MACteDhGYg0DZQM03J9nnyYEYZa5TxqR9WLWx3IKx/4NmLdnnvcEYp0
         1ze9/OmhhMa6diUPgNrX+XTFmVgqYZdzwYm7y5+CoYQCH1GylDUnCHT5XUOBfVwOI+ZJ
         0BYQ8g7baskLKUK4F1uKgRi6EvXNbR7FYWRgQkvPY7bLOLx/hH7/162rpDpRjqvk75wR
         ooFQ6/MZPoyoh5KzOXXK2NZTmxlrx+Ato+EKqM2Fycf5er+kjyK04h6zmh70h7MERgtm
         3uhQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1qVwW38jJ8yDH7ov4Da8cuWISENupM9GRR9W9rAN0iTIu2eBNuFQjUSDojQQPX5LOGHQPGlTOgb6sVuk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOWflHWn4Ei5ESFmsCNJC7ZmYe1wHilCxP/to5dK3LU/8GctDo
	sPS/TacOas2N7vxsGloGuTAW8Fwm6cyW0QVVPAkCItQ8OFpSfaOoJTHVODsBT26dKW0SLLhk+jF
	33Mi8rMp0h91W0hXppwLOplvNSUVlX//oL3nDwYJAjw==
X-Gm-Gg: ASbGncu6E+sshUTKsxeaeM5rNJ2/gBmDpXuNZIpbsjnuBVTDSHj83YojGKSb90G0jc+
	fm/ZwxBqR16BVb4/U++iLhn59h5Ba+F3RLVHhRzdpdStbt0iq7FV1xGxQiMrfs4r6e8O778LpGS
	rA+7BjDUfcaLmS+iMWW+sTJMwVSiuB5kUykg==
X-Google-Smtp-Source: AGHT+IEo+69w2SsM6WMoVy+VU1iqNjeWOLIwlyMXV18izZtek9qzw2edQkf8SeO0U8a6gS+XaVviMhz0QFnpEijXRvY=
X-Received: by 2002:a05:6902:1247:b0:e7d:702d:9342 with SMTP id
 3f1490d57ef6-e7d7e0a37acmr1367189276.8.1747952700109; Thu, 22 May 2025
 15:25:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330163129.02f24afb@jic23-huawei> <5bca6dfd-fe03-4c44-acf4-a51673124338@tuxon.dev>
 <95f5923f-7a8f-4947-b588-419525930bcb@tuxon.dev> <CAPDyKFoMqmCFBoO8FwQe2wHh2kqQi4jUZNFyiNckK7QhGVgmvg@mail.gmail.com>
 <c3a2950a-17ff-444a-bee7-af5e7e10e2bf@tuxon.dev> <CAPDyKFozR4qDq4mzcZBK-LcoPf=fGyuJTXwdt=Ey+_DcQOAp0g@mail.gmail.com>
 <4o3wo76st7w6qwyye3rrayuo2qx773i6jfzcnbkhdj76ouh7ds@3e2mblehkgwf>
 <CAPDyKFqMB7XutXba73YHx1X4rm6uc3Fz6yMZ8yM=wgduEmgUDg@mail.gmail.com>
 <a20fc6ee-c6c3-4013-b175-4918b9a44380@tuxon.dev> <CAPDyKFpbeLJUiB_xQbqDib+-8Q3AcJNVg+DuEcqmVGMbFdNxwA@mail.gmail.com>
 <fgl4w5uhxci7rrbdigtni72vveb2gqemh6iccz4qruqkek5rja@rzwkcjg6hkid>
 <3b1963ba-f93f-48f2-8fb0-a485dd80ffcb@tuxon.dev> <CAPDyKFqrAS4iV59S-zJ9H7_3VuGr9JdZABhfUGBwTzQNDCasaw@mail.gmail.com>
 <CAMuHMdWxeKWJ8hDG=GHngJzGxs_pDe3oGeok38S_PhxQy194RA@mail.gmail.com>
In-Reply-To: <CAMuHMdWxeKWJ8hDG=GHngJzGxs_pDe3oGeok38S_PhxQy194RA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 23 May 2025 00:24:23 +0200
X-Gm-Features: AX0GCFuXinMJhLA931XICspXqJ6iaQgPA7OkwAdTsyiI_m91Si1IspTyACa7VnU
Message-ID: <CAPDyKFq1iFCan+jB8oSh7z9CRogYWTZPj8x_jbFAu-U93QEMiQ@mail.gmail.com>
Subject: Re: [PATCH] driver core: platform: Use devres group to free driver
 probe resources
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jonathan Cameron <jic23@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, dakr@kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org, bhelgaas@google.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 May 2025 at 16:56, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Ulf,
>
> On Thu, 22 May 2025 at 13:54, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > On Thu, 22 May 2025 at 11:48, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> > > I may have missed considering things when describing the case 2 (which is
> > > what is proposed by this patch) as I don't have the full picture behind the
> > > dev_pm_domain_detach() call in platform bus remove. If so, please correct me.
> >
> > The dev_pm_domain_attach|detach() calls in bus level code
> > (probe/remove) were added there a long time ago, way before devres was
> > being used like today.
> >
> > Currently we also have devm_pm_domain_attach_list(), which is used
> > when devices have multiple PM domains to attach too. This is *not*
> > called by bus-level code, but by the driver themselves. For these
> > cases, we would not encounter the problems you have been facing with
> > clocks/IRQ-handler, I think - because the devres order is maintained
> > for PM domains too.
> >
> > That said, I think adding a devm_pm_domain_attach() interface would
> > make perfect sense. Then we can try to replace
> > dev_pm_domain_attach|detach() in bus level code, with just a call to
> > devm_pm_domain_attach(). In this way, we should preserve the
> > expectation for drivers around devres for PM domains. Even if it would
> > change the behaviour for some drivers, it still sounds like the
> > correct thing to do in my opinion.
>
> IMO that sounds like going in the wrong direction.  Why would a driver
> need to care if the device it manages is not located in a PM domain,
> located in a single PM domain, or located in multiple PM domains?

Before we added support for multiple PM domains for a device, it was
more or less transparent for drivers. It still is, as long as there
are not multiple PM domains to consider for the device in question.

The problem with making this transparent/common for the multiple PM
domain case too, was in principle that it could not be done flexible
enough from bus level code. It was discussed at conferences and at
LKML, sorry but I don't have the references to those chats at hand.
Anyway, that was the conclusion back when we introduced this around
2018. See the below commits:

82e12d9e0bd5 PM / Domains: Add dev_pm_domain_attach_by_id() to manage
multi PM domains
3c095f32a92b PM / Domains: Add support for multi PM domains per device to genpd

> All of this depends on SoC integration, not on the device that's
> being driven. The nice thing about doing all this in the bus level
> code is that it is abstracted away for the device driver (modulo using
> pm_runtime_*() calls).

Right, I would have been nice, but we couldn't make it work back then.

[...]

Kind regards
Uffe
