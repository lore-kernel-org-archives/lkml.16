Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D460B1E412A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 08:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749458910; cv=none; b=hq1IIVDYxNoFUbKlK4wAvqECm9EHGPXWLeO7tMeUldBc45WnLn/CC/U5Y/ibBk3hxYfHnNegxzQHifoFr2aPNUu0/N5Kd3exT+EHaJBT/684eKheIoc1HRPs/AgBPHwXMysP6otuTVJ630oFkHyU0ulXGMMAEgjhxd9Yr/6qq1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749458910; c=relaxed/simple;
	bh=0XzL4kpmsZHZXN2qz7fHXQDCyKTAt3P/xJ06KG7pGfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VAVf++RhfuwwHPRAzYNk8btT38OA/6ZdI6d/4mZmGVQmZI5JzeMBbt87V/uGKLrKNYfEfiaREI0oY7GQLnFo8yrfUhZkEBU9aej0qh55A8cGQAQGrx3nIrWFJPjMnCo7YXs7VjCf/zrUZ7osFfyhw0UG417lE0cIyq+XovNw+Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Wp3H+kiA; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Wp3H+kiA"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-551fc6d4a76so4329155e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 01:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749458907; x=1750063707; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+qulMhJZHk6X+tREHSphVBY4DmeNmnxx1NU3h6SyVE=;
        b=Wp3H+kiAB/AEPhUIx+7SiPtMBZ8MvtQwOdpsop34wM/C1Zben+5ZQL/KClxsEhXKI7
         xo0OKnQ6o1Umw64BkzdhkwJAAmB7wMoJnCPJAjg4YFkwaN4RHpfzn9BACp2H7ZzUz6BY
         gpdt1/AJOqC+t9XtuhDbpJk6+kOtMeL/xsumM3TlB/5vY7Zqou+SFHzjcWVqSesp6Vm8
         A/SKZTc23UaHVHM6dDgUu6fUcNrqi7XpcrLzJ2CnbVcQa/LQPFm/+jXepmhA7JU/bixn
         d+sQUoFIc6pey2tY9ChVj/hWw9ZT6qG/Tp0fubewFaC1cc9zdXhRIFitLPNvvVovbm9B
         SHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749458907; x=1750063707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1+qulMhJZHk6X+tREHSphVBY4DmeNmnxx1NU3h6SyVE=;
        b=q5Sd7iq6UcQMD1RnBFujhEBzujTe0qZ98xgXHs2B+0Sdxg0C1xoEm6gkyHEV2fzSzr
         QUff47gs3zlGSIsf55CxQxCHBCfSdZOa9dyYsilv6OjiNTt03pzlOxipVoPE11tUIVzy
         AVE1TQA7SOSL2C2sHyKjxJvehVIXGw2wFlmZT5qVqjccx3DB6batZZW/d536NSCud513
         bOO/m+dz60gvcHkD9gCNPc5TDCYuNmL2tUCid6SxQTTVaK29hiTAc8qYh5vAO7swiXXT
         /3rtXhapqQZ5dRcVw/7L1C+qDSf8uXM7HMsccMgXnymwt83XR079LUUNUx8sKbqZuAno
         rGAw==
X-Forwarded-Encrypted: i=1; AJvYcCXXOCzwrpebIkTOKuzIpAK3skEqxnvFnJtEyy5KSbgYz3QKeoXvHaikpytmgjzWlAFUks41IFzGckeNnLY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl+QyNZgNq4F/Ekp3W/pxSXqB/47ALlYnu8xgcsIv1hluxKbAh
	ci/qxmoNW65bHheCz9/EUI3xMPdbMJY+V6oXd7LmYshtfMuABRAFbeetc2tqaZJ81JeMyK/okyh
	TxRphPRX9vKbBYEy2y+DV7jd8W9u0GcSqhfk1ybCNJg==
X-Gm-Gg: ASbGnctRiBuKcK69CFHlqvqjEnijod6edOB4S3U+2KZ7Dpl9xO5oUee+rS9v4adnH4O
	9EddSMKLBbfuiNwhjqHIi50EF9Hi4UJmD7lkS6Djc15+aZjsw1OJ5nHlEJmHDkgp/R4uMEySkjQ
	xTh7rEjdSmZO9jdvdWMpsqx3aqLjaBDJofAw==
X-Google-Smtp-Source: AGHT+IGD0pH7TFlMkgX9gTB2arw453UvhjyRmw09ACjbNfgzKN77QnxzN12Gz5PpF/wVzlrHBwVIxkmX2zq51K32rMQ=
X-Received: by 2002:a05:6512:398b:b0:553:263d:ab90 with SMTP id
 2adb3069b0e04-55366be26b0mr2962896e87.18.1749458906940; Mon, 09 Jun 2025
 01:48:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-6-apatel@ventanamicro.com> <aDWfDZ_rmdZeuvX3@smile.fi.intel.com>
In-Reply-To: <aDWfDZ_rmdZeuvX3@smile.fi.intel.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 9 Jun 2025 14:18:15 +0530
X-Gm-Features: AX0GCFv7nT4kE5svL_VD2AT2FTxU3u5CwWlzFhZ6AhttmorGU6f8kX-CYBTFYjM
Message-ID: <CAK9=C2Wc75EmvTnGF0m59eQjhXK0=htHCafpi5oPNE0_5TS-7A@mail.gmail.com>
Subject: Re: [PATCH v4 05/23] mailbox: Add common header for RPMI messages
 sent via mailbox
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
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

On Tue, May 27, 2025 at 4:46=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sun, May 25, 2025 at 02:16:52PM +0530, Anup Patel wrote:
> > The RPMI based mailbox controller drivers and mailbox clients need to
> > share defines related to RPMI messages over mailbox interface so add
> > a common header for this purpose.
>
> ...
>
> > +#include <linux/mailbox_client.h>
>
> This is not even closer to the list of the headers the header is using.
> E.g., types.h is missing.

Okay, I will add types.h

>
> > +/* RPMI version encode/decode macros */
> > +#define RPMI_VER_MAJOR(__ver)                (((__ver) >> 16) & 0xffff=
)
> > +#define RPMI_VER_MINOR(__ver)                ((__ver) & 0xffff)
>
> Same comment as per previous patch.

Okay, I will use macros from linux/wordpart.h

>
> ...
>
> > +     RPMI_ERR_NO_DATA                =3D -14,
> > +     RPMI_ERR_RESERVED_START         =3D -15,
> > +     RPMI_ERR_RESERVED_END           =3D -127,
> > +     RPMI_ERR_VENDOR_START           =3D -128
>
> Leave the trailing comma, as it doesn't sound like a terminator.

Okay

>
> ...
>
> > +             return -ETIMEDOUT;
> > +             return -ECOMM;
> > +             return -EOPNOTSUPP;
>
> + errno.h

Okay, I will add errno.h

>
> ...
>
> > +/* RPMI linux mailbox attribute IDs */
> > +enum rpmi_mbox_attribute_id {
> > +     RPMI_MBOX_ATTR_SPEC_VERSION =3D 0,
>
> Why do you need an explicit initialiser? If it's a HW requirement, all of=
 them
> should be explicitly defined. This makes code robust against potential ch=
anges.

Explicit initializers are not needed. I will drop in the next revision.

>
> > +     RPMI_MBOX_ATTR_MAX_MSG_DATA_SIZE,
> > +     RPMI_MBOX_ATTR_SERVICEGROUP_ID,
> > +     RPMI_MBOX_ATTR_SERVICEGROUP_VERSION,
> > +     RPMI_MBOX_ATTR_MAX_ID
> > +};
>
> ...
>
> > +/* RPMI linux mailbox message types */
>
> linux --> Linux
> (everywhere)

Okay, I will update.

Regards,
Anup
