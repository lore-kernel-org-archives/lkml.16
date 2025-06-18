Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FD51EF091
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750224258; cv=none; b=uZr2aOeWT9wDCkr8kYiuTuqWgec8RNsTGlsbFF3za++cwLN5/i2Eexdl3D2h+2wkxrd4jNPJA96vczbSZXt039+SdiykaMn+cTgaeRBCqALkObp6U5C4r1WcS2DAgme1jaM3VhGvGhbcyADX4vjFc6DQGLAqoFL4KRhoab2SLxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750224258; c=relaxed/simple;
	bh=CjftUrHfuTNnLmkXf91akeBADK/18bO2WwdPuXaL3V8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hSGf5PM6A2qUzdOP5MHMYYinNfemrVwCT9ACFi0XpnFaz0Hq/cmDrLJwrJ6ygN8P/URBiUcNisrwplSkqDqfGqDJaQ94y06B9A4Dy8gBlrYP/IvPQH2PYyr4v1Kodzfa3LYUGvaI2VO4gcjtDbXxgIhxl6kfnrWO6d5zi35wboA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=WJXMWXOH; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="WJXMWXOH"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54e98f73850so6132573e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 22:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750224255; x=1750829055; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Z4TSLN8JZPIMvLRhF9VLnkxWZBX3eFV9ERu7o6ArDg=;
        b=WJXMWXOHm/s4/nSrJXVlhkMhDNznxmdjWA2qdr59YKj5gsW8m96PrRbxTCnN/xH5qU
         r7BO5sl5xBYIwElh1Wjk6ABH0hKnP37PKJEqrTxLbFpXw6P3v9PCHCqWE7oo+Pj0de6V
         vPyIu0+zZllELc2w3aFHaxr2t3ddp0iYO0vXbfCWBI3gURRZv7QTbWFT9owlc7NrB368
         nggVODsa2loHMzLRrns72tsNiPzhkTxxwJIeXpQX0/CzqP+yJounHlOcAgIA0CdIe3AE
         hc3shf8r//Og+dI+yvlhpzbtQtd/Spzc078HjPTvi+mLe2zCeL1u2MyNx6tRLcsMbyGE
         iS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750224255; x=1750829055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Z4TSLN8JZPIMvLRhF9VLnkxWZBX3eFV9ERu7o6ArDg=;
        b=O/2B6aEEM8UJqSKgmyFJnPJsuErLopN5UsrASo7xn2+LK0N/4vW2PI72rFz69Vqw/W
         o6vcnse5wYhPKj0V7WylbEKOuRcQXs+Te5u4iCj3jQgI6EBSePc6obqKlmrGM2BRM8QS
         C01r6J0ruAO+TrrH5gt4HCcP5vgQ6qhfTXJUhbZiHmPIaRwjPkXep9yLjoEDcnpRMLbT
         pA0Sxo/9npKVcpGIB/2lM5+amfbCkXsQdZ8lAf1A1h5APBjqOynQhUCfwObLMQblMrs0
         BY5h7/xyu8kngQ+PZxgTcbI+UIuHGUxY+325/mgNnrDIZ/BAC+h8Z+sqq8J2T6out2CU
         mG2w==
X-Forwarded-Encrypted: i=1; AJvYcCXKGgdzTRpJo75b83ghDzazn3oyesEtFPwUzixzDF50elCS1Fmo9Pz77Vid6yyXaE0+kyeDwG/L10OikYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6o2MxYeSNAzTX+Lr3bg++BMr7iJPWblSz3PQ59WkfwChLL/yI
	Cc/f1CSkR6ytjy8dd586yjepCzR5y02uethm9yuPdw8CxHDTE6mpIJVhsgkeCFMGTwhj5IDLHxD
	cOLy6J1bbg6Xtr1ZFrSxfArSRZd48zfR4I5VX3rurug==
X-Gm-Gg: ASbGncvA5UEi3pLunEd50c1cBlHh8p7p1CT07fDoPedCI1YHFIWW/umHq1QzaJMAMNv
	kVwpI14ND4p6J5PwKyApQqVjoHYsKrKqK6+ooNRV7QlmKIbsmcKSXhTVNRxfKoUKYGkU+fmjPfG
	qh3yi/ibWeTC0YgTBZfwqbkSq6BjnsESaO0wHi2mkm2g==
X-Google-Smtp-Source: AGHT+IFwL9G1DHBfI/lVr74bMBkL3ROv8/Gb0OUH3lB+sHfgk3+LXmQwxwY2JVd0OZNae9e8E+jgY8I9Gk7tR0VNm6E=
X-Received: by 2002:a05:6512:3b0f:b0:553:abbb:c530 with SMTP id
 2adb3069b0e04-553b6f49986mr4356712e87.56.1750224255114; Tue, 17 Jun 2025
 22:24:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611062238.636753-1-apatel@ventanamicro.com>
 <20250611062238.636753-13-apatel@ventanamicro.com> <87ldpvirl2.ffs@tglx>
In-Reply-To: <87ldpvirl2.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 18 Jun 2025 10:54:02 +0530
X-Gm-Features: AX0GCFuqAwxb7NkJo6ROc36kRxrpGi8zqYIq4k-XKsi8PzPM1EcP4vkMM19V2qo
Message-ID: <CAK9=C2UCpth4GQ_q2OMwndBeZKf9e_bsoHXaKJW0cNzTWggNUg@mail.gmail.com>
Subject: Re: [PATCH v5 12/23] irqchip: Add driver for the RPMI system MSI
 service group
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

On Fri, Jun 13, 2025 at 9:03=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Wed, Jun 11 2025 at 11:52, Anup Patel wrote:
> > +     ret =3D rpmi_sysmsi_set_msi_target(priv, hwirq, msg);
> > +     if (ret) {
> > +             dev_warn(priv->dev, "Failed to set target for hwirq %lu (=
error %d)\n",
> > +                      hwirq, ret);
>
> Just let stick it out. You have 100 characters ...

Okay, I will update.

>
> > +     }
> > +}
>
> Other than that:
>
> Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
>
> under the assumption that this goes all through either the RISC-V or the
> mailbox tree.
>

IMO, this series should go through the RISC-V tree but I am fine
with the mailbox tree as well.

Best Regards,
Anup
