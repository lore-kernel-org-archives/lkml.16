Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73DE1F5825
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 12:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743682183; cv=none; b=FMH7DNgM8Xg2QTSy8gpBRTtrJscIlh9mG6dtXm42pnDzei1wZy0ol3zt7D/0cpN3XYZl9wqVG5T/AU1LJGoG/jRCTZ2eSa1RpUyYGYwYwyvt5RKq51nrSii4cF2IH4YTlXz24cKegs0kInF+fZIU7HEkeZU+JwrpXcvnJPvKlEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743682183; c=relaxed/simple;
	bh=HRJ4VQHLu0emwrcajIwG7AaCaM8Yazy63e2Lxo4bPDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CTaJhvxYAgr7uPsweEynHYQ/+dJASLpv+v25xkkQS4IhtL+LG8Ka6ttu6wvH5RzpxZ0HaQnqNwUB2TGnJ6pXw2H9qdESsK1R2laNZidDYvwwGDbpIAiVExjFaCteijVONzhm2AK7HgT3zRqJ4NU9zD6y5PY5+6xzPa+zIXFamP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n+uQ4Vyz; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n+uQ4Vyz"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5f09f2b3959so4185a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 05:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743682180; x=1744286980; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHjvfBRxISPEMnu3DVDSD/KoNUJ6WfjbGHHT/RUHDuI=;
        b=n+uQ4VyzrbFwk7D+5cEjWsPwho378vg1YTg+0pTW6LG+RAahSorbkc/sA/pAQ/ICfw
         HxtnbJjIFVuGgtiL59MwfmE7545MuT40yyN2wSs7BygTzEi5yViov1wK0Q+txqjxuJk7
         5kwNacelWx8BJ8nQ6Dp3WevXwxVK49t5Ea2CEb6b0JkO+XHhtIV7raEKxOyxa1XvvCu8
         K03X46UhQNJ7mDNhnK6jZvC675NhYVDf/MPTMGGcqm3AcO1fbHuLLVfpA4XN5WJvx9Fx
         Hi+k42S4NddSVQmj+uGFSUE7+49bjKTa9M5kj4y1Nm1HvA/1Kslcod05opMhf6GFbfF8
         OqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743682180; x=1744286980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UHjvfBRxISPEMnu3DVDSD/KoNUJ6WfjbGHHT/RUHDuI=;
        b=Gc47/wmZkc6BHlULisfhXSOVMfjRj1tUDEDO8rcqA9r6rY0IwPkK7KC+tSOCF5BME9
         vnYS0Fja4FggLuKNg/NZhr1KhAyjm961JjFpA/Iiq7fhRe9QlOhDpoEpZ/BEfK6eQHAg
         0Qc/8ENhiS4U8pnjDjKFw6bPCO/skooLUmwWjXnPA2oyKOMlp6d/XTiFRUBbaK3y0GGs
         tU7GqiURNYCkCNBPWqHIf47Bi1I1zkammGjwznWwb98/vhCNZ6jb9OMb6Q2+l4KtEcUK
         keA5XoVuKK56n5fa9GSZNeo9Oqv9fKIMos9fGqyb9+SqrtFfmmxBJUPaAYsRLQNgSF5B
         ag2Q==
X-Gm-Message-State: AOJu0YzcQ0ZrFmgraPw8dVd4/xOmPXcYFt82tE/eAFjJVeOSZHDLvOIe
	fcSWn+MkIZxkiGPc1f1i28kyHISTsKfch9MmTi82Jg4eKh6h0RoMtRAOdrL7lFvYtY6iX61aNHR
	byhZ/8pSlYJIvCFLH3Z4/oVKpGxcXByZ176lF6my5LnKjsJ7Tzjg1
X-Gm-Gg: ASbGncurfPhYDeJRAsaIAuLyM+Aj4240BKD5JuiB7zRCPb3zxXPT4+IId07gacb5hQ6
	xe7cinjDO7psYug681Vzut0WZHKOrMjZTIGH6b7cDcQ5B9F6Z6ua+0Yzx9DY8M6ehd7ou45ZNNN
	ki9MUzsmjpTH5p3xHyqyihcEot5dU=
X-Google-Smtp-Source: AGHT+IE07gRQRiskFLWSI7nqZgD1+d/QJ7v5JtEeOOxjpUkFcaNnav4/Un5DxB7tCpsftQmgPIxogkZ1py/kK1Y2DAs=
X-Received: by 2002:a50:9542:0:b0:5ec:13d0:4505 with SMTP id
 4fb4d7f45d1cf-5f09fc0f94emr45236a12.5.1743682179665; Thu, 03 Apr 2025
 05:09:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401062951.3180871-1-guanyulin@google.com>
 <20250401062951.3180871-5-guanyulin@google.com> <cc96ceae-304e-4113-86f8-06b6037ffd4b@rowland.harvard.edu>
In-Reply-To: <cc96ceae-304e-4113-86f8-06b6037ffd4b@rowland.harvard.edu>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Thu, 3 Apr 2025 20:09:27 +0800
X-Gm-Features: AQ5f1JpC5SFJlq2upMGrYiudiKyO2nC6Iuklu8PC2J7Zcy9fVZLYUPNyuuaeWKM
Message-ID: <CAOuDEK19FeZsR_0-4t02kszcAVH2JMiZ1D-z-sd9yK1beMfG_g@mail.gmail.com>
Subject: Re: [PATCH v10 4/4] usb: host: enable USB offload during system sleep
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 10:28=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Tue, Apr 01, 2025 at 06:22:42AM +0000, Guan-Yu Lin wrote:
>
> >       /* Suspend all the interfaces and then udev itself */
> >       if (udev->actconfig) {
> >               n =3D udev->actconfig->desc.bNumInterfaces;
> >               for (i =3D n - 1; i >=3D 0; --i) {
> >                       intf =3D udev->actconfig->interface[i];
> > +                     if (udev->offload_at_suspend && intf->needs_remot=
e_wakeup) {
>
> Why is intf->needs_remote_wakeup part of this test?  There should be a
> comment explaining this.
>

I think it's still required for remote wakeup supported interfaces to
skip suspend as the suspend procedure. The reason is as the commit
message suggested: "skip usb_suspend_interface() and
usb_hcd_flush_endpoint() on associated USB interfaces. This reserves a
pending interrupt urb during system suspend for handling the interrupt
transfer, which is necessary since remote wakeup doesn't apply in the
offloaded USB devices when controller is still active."
I plan to add the following comment to explain the situation:
/* Don't suspend interfaces with remote wakeup while the controller is acti=
ve.
 * This preserves pending interrupt urbs, allowing interrupt events to be
 * handled during system suspend.
 */

> >       /* Resume the interfaces */
> >       if (status =3D=3D 0 && udev->actconfig) {
> >               for (i =3D 0; i < udev->actconfig->desc.bNumInterfaces; i=
++) {
> >                       intf =3D udev->actconfig->interface[i];
> > +                     if (udev->offload_at_suspend) {
> > +                             dev_dbg(&intf->dev, "active interface on =
offloaded devices\n");
> > +                             continue;
>
> If intf->needs_remote_wakeup wasn't set above then the interface was
> suspended.  But here you're not going to resume it.  That can't be
> right.
>

Thanks for identifying this, I'll check for needs_remote_wakeup as
well in the next version.
