Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B54630E82C;
	Fri, 20 Jun 2025 01:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750382230; cv=none; b=C3AIzGc2AFzlQqIMNzV4DmsnhogRi6SA7TpOI5SYxvELhz7VIsdlhciL5HbU/rZ8Bb4Hfhubo4w8nYdVp4FVdFjWWzuPDgP0EPzXzEkJtCeY+4YchsR/EnGoq16IKpHGgUX4GmsvpQg1OuSOQamZ78NG+omr0HE0GNludzEHkQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750382230; c=relaxed/simple;
	bh=HuvLPxLPkstNLDVhsfm/q15+sEImbwFCn7WN5vk7pZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Da29ZAEDkpojRTkiFY2reb/caxmdsVRiUV307xeo7QvqtIyIIv6NkNCxfP2PXZrsufUhrd4suIlV12qjIQLnwAyNkbXNEAKKdIsYARPbA4PDStz+IiuupDYJMX2BhXPRH9iiou6SYIHx3kEJXbi+CH2XFYkSp3nshwIIRcvIR2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N2cGqZu3; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N2cGqZu3"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad8a6c202ffso250511666b.3;
        Thu, 19 Jun 2025 18:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750382227; x=1750987027; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDuuAYvAWCJrf+O+elcb74hWx7QQULFv/2SAPhAYV5s=;
        b=N2cGqZu3W/Agl5y4L8l3jGNF/pj+3C3mnHV6WtELYYt8tBnNE2vQtepmKHqEb0TCy6
         CI6FLbdF5je8x9kmNdRMvgeNZ0ajOsuw+hhXBsKSE8+v9l7Iomg3qSc4dgRihMLZXM59
         p4ZG2YebcbfWpA1IiGB0yGBzKpPHNZ4KK+HrgJpvgbCLHNSoxWz48rGl18QR5BiAlcN9
         L3VYG49JaZBizVH6lniOKYoIBGJv/gF6gWglu0ZRJ7XdbqhMOHcSOgr5IAuBOD24CmyJ
         60W04E4KL5dF9crXXYnw5vbtVHaO8Sk2JD+KCoM7TZcAt+ayABlrpdj4T/cOvyXTBERl
         wqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750382227; x=1750987027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDuuAYvAWCJrf+O+elcb74hWx7QQULFv/2SAPhAYV5s=;
        b=O9ogLXg9TSnLEBH8BC4cOE7dRs4tzIyxI37jrz2YC3586ToR64l4YOPzfx4KmwgKZ2
         ezG1vLf0EhA9TdriSSt7gHZZ0Uaq8Yub4BBYlIzdx3lo6wDpW/q4BOhAeSKLz7mVz6yP
         h5eOClIO/WtCJW6dJ0LJ/qMvHpvR3xYFN9KfWX+ZLxqYsfa5Hn/uWkx00qygRxbUUf2r
         ihvYs5fxjVYQdnbA8ycRyU72AQGjz3lnwoa+k3h9zPZNP8705sdwX/YnEJnrcf52hgjJ
         CgxajnNwMbFoDbugw++3UUrNT6Qyix6Sb8QUJbWH3JygulQWHgDsH+4c2XQou2JWahE7
         fc0A==
X-Forwarded-Encrypted: i=1; AJvYcCVkYmxXP5qlHWMYnvxWukJXCCWfoVw46yNJKaq4dC9DEkHh2/T7v5CHmyiL+Mixgbztzb7NBLIDafx2PeA=@vger.kernel.org, AJvYcCWyUHiUpSREXqaZlARysL72e2Kbl+/psFm8Oa6ciyUIQ12/ZNvZ8Qi0S3e9a2FerCrPbYAejH3mZAvT@vger.kernel.org
X-Gm-Message-State: AOJu0YzSVLq67xtBTHumHXPwWRYObtgJS2MQ0/oDfl946BbiCT4Srt7z
	a6VYfvxiLg+1Ri7I6qmYXNCEwb9+IGdiZTxlAiUszl6t4aRR42Sjmmdqz2DwCc0PAOso48S2w8X
	hYG3DiwGKsK1wvzhCyW7w1gURTzBxODlSBRg/
X-Gm-Gg: ASbGnct63CQWxTNNbll3a//DkSB9bDrzHj8mR7RQQxMvlRBLmCHE9PAPPxueFH0l/n9
	JOMpbctXEKSmaD0Z1CFmlNnmiY7nZ5wH1NbACqxcO2DnYpe1+/q0Uizz41bMQwL8m2QSsjs9Ma1
	iMa7f1sYZ7d6kzvqHuGeXI+6zXN6ne4r4+4J7xKZ6vK2nUgd181+En9x2rPaIh9wGbMzEbmFRZb
	+p9
X-Google-Smtp-Source: AGHT+IEGYjP1hNbtkB6m7CrQ1TnVG0Z1sX6Lm61kXGebSmHl9CobAe+TZjdgzJZ6k4Qpyaup2tZDqcRJ39ekUI9M/wo=
X-Received: by 2002:a17:906:f589:b0:ad8:adea:4b15 with SMTP id
 a640c23a62f3a-ae057bd4538mr80561666b.48.1750382227139; Thu, 19 Jun 2025
 18:17:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2025060325-everyone-padlock-931a@gregkh> <20250604025154.10165-1-syhuang3@nuvoton.com>
 <20250604025154.10165-2-syhuang3@nuvoton.com> <2025061941-dexterous-basket-fc7f@gregkh>
In-Reply-To: <2025061941-dexterous-basket-fc7f@gregkh>
From: Sheng-Yuan Huang <hsyemail2@gmail.com>
Date: Fri, 20 Jun 2025 09:16:55 +0800
X-Gm-Features: AX0GCFt0mxPzcAFUYj_5F2aO8fWkh7EUpFuDjT_wUyyFNJUI1ZVIVigU1Qun_4U
Message-ID: <CACW=pY7DO2aTCye3Wizd6z1fF7QycXbW4OBbLfpehAumMcRv2Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] USB: serial: nct_usb_serial: add support for
 Nuvoton USB adapter
To: Greg KH <gregkh@linuxfoundation.org>
Cc: johan@kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sheng-Yuan Huang <syhuang3@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

My apologies for the incomplete patch submission.
This is my first time submitting a driver, and I'm still getting
familiar with git console operations. A procedural error on my part
led to the patch not including the necessary Kconfig and Makefile
changes.

I truly appreciate you pointing out this mistake promptly, which
allows me to correct it early. I've learned from this, and the next
version of the patch will correctly incorporate all required files.
Thank you for your understanding, and I apologize again for any
inconvenience caused.

Best regards,

Sheng-Yuan Huang


Greg KH <gregkh@linuxfoundation.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=8819=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:40=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, Jun 04, 2025 at 10:51:54AM +0800, hsyemail2@gmail.com wrote:
> > From: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> >
> > Add support for the Nuvoton USB-to-serial adapter, which provides
> > multiple serial ports over a single USB interface.
> >
> > The device exposes one control endpoint, one bulk-in endpoint, and
> > one bulk-out endpoint for data transfer. Port status is reported via
> > an interrupt-in or bulk-in endpoint, depending on device configuration.
> >
> > This driver implements basic TTY operations.
> >
> > Signed-off-by: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> > ---
> >  drivers/usb/serial/nct_usb_serial.c | 1480 +++++++++++++++++++++++++++
> >  1 file changed, 1480 insertions(+)
> >  create mode 100644 drivers/usb/serial/nct_usb_serial.c
>
> This patch does not actually allow the .c file to be built, so how was
> this tested?
>
> confused,
>
> greg k-h
