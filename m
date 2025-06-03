Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDBA281379
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 08:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748940397; cv=none; b=t5MBwY4hn3Qd59uqwkZqpphtAyDCGesvqcINbAL993wTckfVyUcqticEEiktGYTX7XUs4cN2s364LXDHrgJa7g2ZVr/oUwSjdK7AWlteocI6VkdIrZ/7rImarpGl3b1/pZEP++ng9ZfFevMZ29qRiBBXsu84ux1P05zgxCJgfu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748940397; c=relaxed/simple;
	bh=GHyD4CpAhBWwsgVBdk73lj4IVsCmxUf4Mu39EiZILnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S8d74lBYD3D3ssaee+YZBctwPVgpJExqsgXL7IXwTHRf0Jccm4s+f0LR426mPyzkyOdhURexRj/nHFaLjos8sDltyhwQEi6fApKoLOw621gpYUH08/Q+70yH8GN7eaN/2aXuPFIvdGzFX53/I+Otrbm65cbDK4bD+Yi+7x1wTPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H2g6sRKo; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H2g6sRKo"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6000791e832so5822a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 01:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748940394; x=1749545194; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWAWEh/2YYsa14fENY1/1kOhGKvOx6iFO5AiVN3BwTw=;
        b=H2g6sRKoVeVpRvSn2GCL3KOZiRg0QA+VwBjlcUiNZ3Wnu6V34CqkZrNUI1m15AL5B4
         gKlHtBOO8UKuN0t8x6zNIOfNWBSnI4UtFKoZ7QJ/RlTdsRb4e0OkIqV6vhKe8u9OhNBR
         arvsgbs5/d/iBH5wul/0goNI/DRKWdQ0oTh43gbedUKw0CakGJVtLjdn5DKXfGSLk0qN
         YI6AeCBKBqVdeCT8J7oKSOcC52s8tRxBlcrzCh9zMeilrpgXcizHHy9C/k4pP0YlaYqV
         tNMmNd+JNih6hI2rYCcYYGK2cwHdUUZNp/x0a6b68SGTaHtkckQg1U3IMN1hYfWXg4Tz
         7wTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748940394; x=1749545194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWAWEh/2YYsa14fENY1/1kOhGKvOx6iFO5AiVN3BwTw=;
        b=N8G0QvJRHHdIbMFpB9e4+ib3jFKSMKqrwhCsqtR6v+f0S3F1KCWjUbay3MZHgWNnIv
         PBNGbyFwH5qOfb9sG1XmEpP7G+NEGnZbIz7BAmR+Mw5AsNHUDPicQQmSHHFG/Qzue+h0
         G/98rjzk+ZqYQISh5Sg53s/Vjqo40J/fwg289t62x7BU93j4owZjibd61oyg7xOBz1BG
         /h0SgHwC+dCN1cMP4+PCLabFBAROVpN69qXDTaqTZ077nDg167gDzP+oEh0+b8/CgwwQ
         8ySGF2aculGiq6mgEnti0/DsxBJ/SOLYboCmT7T2Imf1ZWledWm9ttGvFAcNQBjiXv4B
         qSPA==
X-Forwarded-Encrypted: i=1; AJvYcCV1y7DTXaMLwbkJ9nd0C8whzPSF8K9Mcf1R9bhGgtPZn52PB+e3syvB3rUxUCdZO4s1QpSDMouGvJkoiGE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbWTcGYNkSwKFU9cpPkMH/m3aPRkmwuBm6LVt5rtdBvXptCl4G
	NM+6/aOjd88PVN82MdVxOt6Qz/GU0pZCSwcb59kR/43cqEcLKNPoKm1u8oVHCACfg43eOIw2rJP
	+YFVKNL20tF5jFpHH+ZchOdYVKBCSz2lbVes/pjmlbU/dIc5AG3EimscJ
X-Gm-Gg: ASbGncvKx2UqjtmGl6HBgvroktiOfAY4wvD6NdJx/1olekmaJ+lvtAuFJm0ozKr7IyT
	UCdBFiA9qA6g5qfmV1Ju7fgZ5BViKPBug37K6vCFVNo/zvvUmw1FXBVfWEkkpu3pZFqPwEh7XS4
	NdvIpi4js5M1WK3vtbDqEckR1opWhsrB2FdtpEtlmkhMqzseUZe8VzlyxQm8wDLyIGW+WdEQAI5
	A==
X-Google-Smtp-Source: AGHT+IGHH8Vo149BamuTxG6GaezBYSZirqyxqSNVi3kfQuRKjlrau9iqmOu6TKC54cBRwHP7T9QBTOCF+qcXoVYMeAM=
X-Received: by 2002:aa7:d8da:0:b0:606:b6da:5028 with SMTP id
 4fb4d7f45d1cf-606b6da50b0mr34647a12.0.1748940393661; Tue, 03 Jun 2025
 01:46:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528090849.2095085-1-guanyulin@google.com>
 <20250528090849.2095085-3-guanyulin@google.com> <2025052808-shown-sitting-1ff9@gregkh>
In-Reply-To: <2025052808-shown-sitting-1ff9@gregkh>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Tue, 3 Jun 2025 16:46:00 +0800
X-Gm-Features: AX0GCFvq5Eo0j-QZZ4AMBsa6Dfa8KmibGHbeMgCDIJvB8M919kj3wpH71zF_c-8
Message-ID: <CAOuDEK28-ruD-DabsD7V0B8M8zZPVDu0vv1aYRnwYq+qTUua6Q@mail.gmail.com>
Subject: Re: [PATCH v13 2/4] usb: add apis for offload usage tracking
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, gargaditya08@live.com, kekrby@gmail.com, 
	jeff.johnson@oss.qualcomm.com, quic_zijuhu@quicinc.com, 
	andriy.shevchenko@linux.intel.com, ben@decadent.org.uk, broonie@kernel.org, 
	quic_wcheng@quicinc.com, krzysztof.kozlowski@linaro.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 5:16=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, May 28, 2025 at 09:04:07AM +0000, Guan-Yu Lin wrote:
> > @@ -2036,6 +2036,131 @@ int usb_disable_usb2_hardware_lpm(struct usb_de=
vice *udev)
> >
> >  #endif /* CONFIG_PM */
> >
> > +#if IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND_SUSPEND)
>
> ifdef in .c files are messy and hard to maintain.
>
> Also, why is an xhci-specific option enabling/disabling core USB
> functions like this?  Shouldn't it be a generic USB config option name
> instead?
>

To address the above 2 suggestions, I'll move related codes into a new
file offload.c, and create a new config to manage them.

> > +int usb_offload_get(struct usb_device *udev)
> > +{
> > +     int ret;
> > +
> > +     usb_lock_device(udev);
> > +     if (udev->state =3D=3D USB_STATE_NOTATTACHED) {
> > +             ret =3D -ENODEV;
> > +             goto unlock_device;
>
> Shouldn't we using the guard logic here instead?  That would make all of
> this look much simpler and easier to maintain over time.
>

Thanks for the suggestion. Guard logics would be adapted in the next versio=
n.

> > +
> > +     if (ret < 0)
>
> Why the blank line?
>

I'll remove the blank line. Thanks for the heads up.

> > +bool usb_offload_check(struct usb_device *udev)
> > +{
> > +     struct usb_device *child;
> > +     bool active;
> > +     int port1;
> > +
> > +     usb_hub_for_each_child(udev, port1, child) {
> > +             usb_lock_device(child);
> > +             active =3D usb_offload_check(child);
> > +             usb_unlock_device(child);
> > +             if (active)
> > +                     return true;
> > +     }
> > +
> > +     return !!udev->offload_usage;
>
> I think you forgot to mark this function as requiring that the lock be
> held, right?  Just documenting it isn't going to be simple to notice or
> maintain over time...
>
> thanks,
>
> greg k-h

__must_hold marco would be added in the next version. Thanks for the heads =
up.

Regards,
Guan-Yu
