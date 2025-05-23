Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0CE224243
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 12:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748003058; cv=none; b=Wgr6zXleGHULx+laZSxVyD5leC0lZ/aSG2m+6e6gK+rPhn9jwjwAmgk2g+ICqin2s9HBPK86fCdIH0S2kwCYVeIBqVFM8cxN8Wugm15qAsZ2IWGmENfj1ErjphiC4SWOX3uk3PonMq8BSLjBr7eucbFShK4SdZhR9ldqIjGmeek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748003058; c=relaxed/simple;
	bh=CRQ1CMrTbmORbM8q+dECoDek/gZU71KuJkuyy/QwL7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aNLZEYd8UarAHTWG1bdzOC5JhBDEtwGCNT9240hl9zGYRpgsowdNrzK7bbDoXpwVMhhm0i8J4/12dEdaIIyaP+3d94nO0uQpsz0inWdxEWkzlkk7ypk+iOKNf1hL30Pyl5fEadKB39crfdPIc4R3ovKSX285yJgMF/FkhNfeMlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=adDDdjZf; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="adDDdjZf"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54acc0cd458so11872496e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 05:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748003055; x=1748607855; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fezVj3hu+n03EIwbXRE/aCJEPV25lQN8HH83CRPugxs=;
        b=adDDdjZfyubirpITGT4eapqIbqhQ0iSI1/32WlFlzP5lovIEb9LxSX8xamZANCauP5
         EzSPnYGsEpeP7lsGp8cw8AaC8cNjQ+SIxssLUJm0xlBgBgZY1l5tAKNoCzmeqvbb1K0S
         6BNSNuxjg2U/EjR4o/EwDSuQYGgDSvXGr4Gns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748003055; x=1748607855;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fezVj3hu+n03EIwbXRE/aCJEPV25lQN8HH83CRPugxs=;
        b=JO5Z7B10eC7VVc6kvxlFJD1IUu/rRGfRjAJQpQrIrEeFrYroMnA76DTH3HRVZtgQZO
         r8hf9sWM81FkJBCHnmRhcRF9mpt6G/ZXHLQN2TgStvhQg0Rr5+SZcb90UB6mDE2yYh9E
         kXjKSRRsi78bZPiVAggzLPjkqb9ZAOhXL4Uz2/vtJxsT/4tdonT6hJo6Zu/71Msg+9UR
         WPIsr5bzTCpvGVy1tfM8Z/o/bp+dTXLYxSMfJl1sOHZ4qG/aOEHDcZYJ7SysRaE5pYb2
         G7YeGipycDgLuqHawi7RXiCFlCNGO0+YyohDVejwe7vOPR5Pc7HDg5aujNDeR7AkXLzc
         WjQg==
X-Forwarded-Encrypted: i=1; AJvYcCXtRY5fggyrck5Y4lhsK0avap/DCSXeAIDj6x3+RrAtGnpTAoAX4hakOZZhA2MXrUutIC2tdVQlbOBOBnk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS9gyZ9dwnAw/NhndsfO+qtmo21Yds9z+UZdDoM5sg36YHz8Od
	uxoScrz5gshBtqJ+uv+7gb0FtQJgjstCHadEFoLsO6T9vGMO6PG92MTpi1G2qvDT5do+fVvGE1c
	F4HZJDw==
X-Gm-Gg: ASbGncs+1Rj6HbgGAOvV7DFRh+P06AlrLmU5jnfqKUZys2baBKq1wTDONgCMSpg7LKT
	RXqFXXizTUygSb0801I0NRnsYvUKht7oFzrUq0Out0w1s1WFI4p4OgxHPcqJ2ASF61nz8/WaX8+
	4cYABu+RQzfxH4yFTxfj97hY414N+dD93lcMCsqzHFLOEserG6SQi+rdDHN44olTt3sICQ1p+C4
	naG+iXzkTrQia0LHW8yLKhEJfa3t6hg0rNHMXZazEqv6OjsYCM4lIqyji2Aw4Eis7jRvFQ9+CXQ
	ZNcH99xp/tXUcY3rE+qVXFdUixBdWwrdwyNc/47l1Z15yj6pr/CBJhZmdx+Ej/tHOlnESsbA+Bf
	zppUO63JI+WxaOMchLUuhAVN4D8fQ
X-Google-Smtp-Source: AGHT+IFOdpVO4NcKBFR6GPLUfS4Jx5a8qXKrCTU5i9b1Td7IOideLJuNZt3aNnfmmKEsNCaDVPoxhA==
X-Received: by 2002:a05:6512:6289:b0:54f:bd1b:a556 with SMTP id 2adb3069b0e04-550e71c96d3mr10802435e87.21.1748003054636;
        Fri, 23 May 2025 05:24:14 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fd0768a5sm1892718e87.71.2025.05.23.05.24.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 05:24:13 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32909637624so71230531fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 05:24:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXnP00mZWA+WUeVEDfl4wG47NdJ7xhJT+2k8vdSkSg+4oebE9ezRHJxt9by+Kt+fntyCKNKwzutKxWMK/A=@vger.kernel.org
X-Received: by 2002:a05:651c:20c1:b0:328:848:839f with SMTP id
 38308e7fff4ca-32808488552mr57254401fa.40.1748003053410; Fri, 23 May 2025
 05:24:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509-uvc-followup-v1-0-73bcde30d2b5@chromium.org>
 <20250509-uvc-followup-v1-4-73bcde30d2b5@chromium.org> <20250523115759.GE12514@pendragon.ideasonboard.com>
In-Reply-To: <20250523115759.GE12514@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 23 May 2025 14:24:00 +0200
X-Gmail-Original-Message-ID: <CANiDSCsmhQFYwsPy8QNnrgrwKj3E9PHJbo+hKv_i-_70b-Wktw@mail.gmail.com>
X-Gm-Features: AX0GCFt2VRsyLYkzyn2U4jT6Qm-K5sPzCzV9IpY2Lpvoh6aT3jqDH6TEI5q1KAg
Message-ID: <CANiDSCsmhQFYwsPy8QNnrgrwKj3E9PHJbo+hKv_i-_70b-Wktw@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: uvcvideo: Populate all errors in uvc_probe()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Fri, 23 May 2025 at 13:58, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Fri, May 09, 2025 at 06:24:16PM +0000, Ricardo Ribalda wrote:
> > Now we are replacing most of the error codes with -ENODEV.
> > Instead, Populate the error code from the functions called by
> > uvc_probe().
> >
> > Take this opportunity to replace a generic error code from
> > uvc_scan_device() into something more meaningful.
> >
> > Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 15 ++++-----------
> >  1 file changed, 4 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index da24a655ab68cc0957762f2b67387677c22224d1..cdf4bbe582272277a6a95267e9752010adc51b6b 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -1866,7 +1866,7 @@ static int uvc_scan_device(struct uvc_device *dev)
> >
> >       if (list_empty(&dev->chains)) {
> >               dev_info(&dev->udev->dev, "No valid video chain found.\n");
> > -             return -1;
> > +             return -ENODEV;
> >       }
> >
> >       /* Add GPIO entity to the first chain. */
> > @@ -2239,7 +2239,6 @@ static int uvc_probe(struct usb_interface *intf,
> >       /* Parse the Video Class control descriptor. */
> >       ret = uvc_parse_control(dev);
> >       if (ret < 0) {
> > -             ret = -ENODEV;
> >               uvc_dbg(dev, PROBE, "Unable to parse UVC descriptors\n");
> >               goto error;
> >       }
> > @@ -2275,22 +2274,16 @@ static int uvc_probe(struct usb_interface *intf,
> >               goto error;
> >
> >       /* Scan the device for video chains. */
> > -     if (uvc_scan_device(dev) < 0) {
> > -             ret = -ENODEV;
> > +     if (uvc_scan_device(dev) < 0)
>
> That's not going to work. You probably meant
>
>         ret = uvc_scan_device(dev);
>         if (ret < 0)

Ups, seems like I sent a partial path :S

Sorry about that. Shall I resend 4/4 or you want to take it as well?

>
> Same elsewhere where applicable.
>
> >               goto error;
> > -     }
> >
> >       /* Initialize controls. */
> > -     if (uvc_ctrl_init_device(dev) < 0) {
> > -             ret = -ENODEV;
> > +     if (uvc_ctrl_init_device(dev) < 0)
> >               goto error;
> > -     }
> >
> >       /* Register video device nodes. */
> > -     if (uvc_register_chains(dev) < 0) {
> > -             ret = -ENODEV;
> > +     if (uvc_register_chains(dev) < 0)
> >               goto error;
> > -     }
> >
> >  #ifdef CONFIG_MEDIA_CONTROLLER
> >       /* Register the media device node */
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
