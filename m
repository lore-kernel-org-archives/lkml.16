Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C178B23504B
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747807745; cv=none; b=SVOU5SE306DYy9AfZH+TT/8fNob8S90Y8TFYcIO6BeUV6wh+8WrFWTRfGX2ES97V8nTiq5LslEsrUWr+7nVF/xrMbhzSobdGqnmGTR5yhbPOaH0I37CRDPUvXA8O4bByB2ch5L9m666k3ocO7U2jL1aej1LEXPSZHNsiV2Ogbqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747807745; c=relaxed/simple;
	bh=7XDeMyyzQBhrnDADaYeES07Q9+a7IWYOyBUinXwzpoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EJb1QRAtqx5hZb7b8XUdJjI7KoGtKLyqsDwjMHTmhG8ZHGbe8BmeUaoGgN86faw+/NuBeDtVBPABLqLYvri1a90SZrwDFtRTS6JvNIPIisy33XTkq8/KgGyDVy1Uhjc5Hvw76VLeURi9QjXPyZJkvYPvx5HtREAGmuRdZ7+o+nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=SxOXhaUV; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="SxOXhaUV"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-329157c9f79so15719501fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 23:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747807742; x=1748412542; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kk7tve0D+1Pg7EfOZteEFafimD45UzCXl3cwN1jHuNg=;
        b=SxOXhaUVM8Yug3MTFlHn3mo7HvyWZQbqQHSrcA4f+/jrMVVL7beUkrbS731qr78esw
         r2x4k1U2HnboF4VVIRjlqCwj032uQf1PfpbjzDfsUvDR5m/z/H7P+K3fVwlOConp+l4T
         yFCN6npjCOh5E8oPYKLcA1J1sBw6ID5YEn8rTJQ7hMO+LyLK32kgJ18sNoR7n3YifWkR
         FzRX5aFBp4IWVWmjoqupoMG/nZPkfnQxsP1nup6sGVVtvKCdGhyu9b51YqrlrIDpngTV
         PMxszoxsmpI6VO2XkAF+kw9hp9gq4WpKBLYOaTUdYbUJUiusItBxCKAoqTrxixZzNOLi
         7oFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747807742; x=1748412542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kk7tve0D+1Pg7EfOZteEFafimD45UzCXl3cwN1jHuNg=;
        b=snb5rWFWxHeZWU5ltVU1RfAtYktzpOS0ZLpbPlPUt0Ydi1hSNCxbtB4GY4uIOhkknV
         qMs63DaCB7S+WxTztPhN/B6PwvHBEJMIjgl9Qf4wi7SE4+kfxTKhyvJf8TrC0nLWZAfC
         vCcwpiWFioULE4oU2sVaJtOaxM11XLFp1q4fLbKNunUqPArbDb6ESGMPdtSOt5ZFj5SY
         CkrDUKThKzfB6B0DN+P4JFNrR5lbC7IFUeR1HL1LkXAhwJOqKWTQMaXLW9fIykOYhOjc
         h9pTliB7uRmOpXNOH77j5wKPmjqIozwy9A3wLWAnBXedwfTcoWLhZMsbBh2OvTy8sOpM
         Tp0w==
X-Forwarded-Encrypted: i=1; AJvYcCVa3n5ATkY9pSQ+/j9Urc86ajjzxgo67xCvdBoLPvJsP6ukMs9dwtTKDMW5AtyaS6GTI4rUGCnuZZWkt+8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0ZfHKAT9tICVNAhECFx6Fx/vSZckLUIuQKm7uQZ9YmmhAxe6x
	uZ9hX+8FZf73RjVHGGJpguqX2HtNFE3C8AX6LrP2l20X75mcBYd9AOUTqzd4y95+uCH67klTsGE
	6iFFL2ltEqx6aKs5Qg/T584HKCx9lFCUf8fJEbfIpPQ==
X-Gm-Gg: ASbGncvEicFuxQRNQr34nbNB1AkIO7MF8cvFVms5KhxIEq06Zsnr/xhlNdx+69wFsfu
	thg6BUupRqFhn0hmWtwAvxWgWmKCp/lLM+vtQVTCy40NPLBXi1slUFDp6LFlgMKYh6OsUUc216G
	LbUNWZZE7Tm/KzY9xTkHAgOOYs6clB+/8++g==
X-Google-Smtp-Source: AGHT+IG/ijYmqO23QeZ1aE3WFzSnbU9SjPJREE5AAB9eJlu7O6h0wLI3eFr8ZVc9F4TKF98L9DEYFiwBk2o9Z5nia5s=
X-Received: by 2002:a05:651c:f09:b0:30c:1441:9e84 with SMTP id
 38308e7fff4ca-32807712dfamr55578621fa.13.1747807741824; Tue, 20 May 2025
 23:09:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-8-apatel@ventanamicro.com> <8734d9lkww.ffs@tglx>
In-Reply-To: <8734d9lkww.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 21 May 2025 11:38:50 +0530
X-Gm-Features: AX0GCFu61i3AUthehDtL9xq27qbaFkv0eH6gSaBfv0P1Z2ikn1u_-esbTNLJB7I
Message-ID: <CAK9=C2VJ=qw+F7Q0y-6ZMMyJUaM3Aw7o4zFL0n_h=hAOSJaQKA@mail.gmail.com>
Subject: Re: [PATCH v3 07/23] mailbox: Add RISC-V SBI message proxy (MPXY)
 based mailbox driver
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>, 
	Rahul Pathak <rpathak@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 12:24=E2=80=AFAM Thomas Gleixner <tglx@linutronix.d=
e> wrote:
>
> On Sun, May 11 2025 at 19:09, Anup Patel wrote:
> > +
> > +static irqreturn_t mpxy_mbox_irq_event(int irq, void *dev_id)
> > +{
> > +     /* We only have MSI for notification so just wakeup IRQ thread */
> > +     return IRQ_WAKE_THREAD;
>
> I was idly reading through this because I looked at the irq chip.
>
> This function is competely pointless.
>
> > +}
> > +
> > +static irqreturn_t mpxy_mbox_irq_thread(int irq, void *dev_id)
> > +{
> > +     mpxy_mbox_peek_data(dev_id);
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +static int mpxy_mbox_setup_msi(struct mbox_chan *chan,
> > +                            struct mpxy_mbox_channel *mchan)
> > +{
> > +     struct device *dev =3D mchan->mbox->dev;
> > +     int rc;
> > +
> > +     /* Do nothing if MSI not supported */
> > +     if (mchan->msi_irq =3D=3D U32_MAX)
> > +             return 0;
> > +
> > +     /* Fail if MSI already enabled */
> > +     if (mchan->attrs.msi_control)
> > +             return -EALREADY;
> > +
> > +     /* Request channel MSI handler */
> > +     rc =3D request_threaded_irq(mchan->msi_irq,
> > +                               mpxy_mbox_irq_event,
> > +                               mpxy_mbox_irq_thread,
> > +                               0, dev_name(dev), chan);
>
> Just do:
>
>         rc =3D request_threaded_irq(mchan->msi_irq, NULL, mpxy_mbox_irq_t=
hread,
>                                   0, dev_name(dev), chan);
>
> and be done with it. The core code will happily wake up your thread.

I did not see the irq_default_primary_handler() set by irq core.
Thanks for catching it, I will update in the next revision.

Regards,
Anup
