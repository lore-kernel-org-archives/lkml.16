Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D49FC2EF
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 06:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749449559; cv=none; b=BZiFbVckd5jAO5yLWytg4mxzq7X0BeYRmw7/Ob0KTi0SNu1+KOb6g/ib5Y5kpRzwWz9kqzkesBpX7NZKQLM33IQgVy3gUnnoLrAhLfEBjgdhaa+Ci129jStalpWitHGnB9fN21g7c05gQTxd1uEBwaB/tJep0QWJgAVu1tAmXKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749449559; c=relaxed/simple;
	bh=hC7sYjRTRprvhqWeyddKYr1R75JwHa16GRXz1WGFPCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MVjjZM3861NK1SRAya7+QU2vJ2BLQedlzDLrwAY7G6Snp8nv/ekKcIiYqVmau0G8WivJi7EllW1q8pmsM9bBTHp27ZtdjsipImLYVu8CWG1iazAVkeAGst1bDUzZgGH4nTDa18bXBSCjfD/lJ+/gnQGnUUf9BRUyBqIUMp5mIpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=HkI0tmDf; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="HkI0tmDf"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5532f9ac219so4629321e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 23:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749449555; x=1750054355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QrTT2Ug0zbdaKyRxl6jBbSEjhgl8N2Elyqr8mo3YZs8=;
        b=HkI0tmDf1zaAwVk2tV5DEWzZwI0X8AHf6QTikEWF+Im4kHdBPc0S7MghSGPMR8xoZF
         62OQb+BcXlLmIMgPqGyNczQPs+BBLbWqJagIeECqHHYLiSKir7rCD/eg6vcAL3JoGRXw
         cWhlupyCD31F5fNgfsTorQOdKg3nA9TkDfDht6YfaYVP8OYkMQmy8uaHoxONMQuMTZvf
         X9ypvYIF4TuizkElbgOKINgqv8aNoYfcTRqgkCHzsvKknEuSGqfp641F9E09Lt+FHRzf
         2DPKPcqU44NOaX/eyg+dLZiX+9+U2MDKiudcdxG4T8RRsfWdR8P6LYhWe/FXvSohtqCQ
         q33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749449555; x=1750054355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QrTT2Ug0zbdaKyRxl6jBbSEjhgl8N2Elyqr8mo3YZs8=;
        b=ZFIlMq8nPSTgAUu/KjY8JRO85wQbvU+aR2b8KvKEqW3njEY1uQgkPJ/+B2wxBnNcaO
         UHmby2/qAoXw5Fgbf2F11C0YAVDz2YFPAhuKEzMuPlHvJLVGKSRzBEdGyxVWCH7qiRQA
         JxD6smDQ8iTR6ZQ795dPeTRSUsOHn0jjbB4M5LYig4Uc7pmwbgShOs7I5vhckHdt4RHF
         Zs0+rqvPYnY1uiDC7sux7aRRxAaBA4+EsiZ7pX+j+rbpTT99GGKunICK/f/yevj/UIV1
         z2uVw6+y/PkNKyhceU6UPFYeS7iJZih3lQ3u34b2YeH24AQvF4XSB6YW6XiBTPic6IYd
         eNyg==
X-Forwarded-Encrypted: i=1; AJvYcCWWe3WMqsp/7I/6ekjfJokCpp+aBr7C1ymhscO/nW+bmCI6RXZAUV58a1qnswu2l97/Xm8SB7bg1cYqa5E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww30SMG3weAZSP0JUukOTTo5iHC+18vMpVH6oT73eqUa7Cy6yJ
	EryaxKEQH5cpVghgWXMRkATymRn2aKH+JI4YESoLMdR14P36Joc8s5LQ0+nSUZRDGMwdNU0kcqR
	xMlddcnAtsqZ9PYiRsf5tTjw9t4bifxruycrnAdLoCA==
X-Gm-Gg: ASbGnctcZkFq32oQw+2yFXvDKXZocVQt2N7MwAiO/mNsVSD+H5t6eZkynksmpbaI76M
	kudTrxDxHaJtl6VKmMOQyGInA+nI931jsHj+gN1CDlOhBENCSQFhKb7bzk7knAPdnwDBaQ7dt/H
	y8Uqo9Mgd3sHNS62f/Z79u+1znZmPqpUFgxg==
X-Google-Smtp-Source: AGHT+IEECTtnbfpfpm1PCJ+0qNEPhUm+SPgQTf/zlmkXsjTkZrawcTxrDJFp5prLSUOiP9b4jKSeL0mzxrsjJjV1G9g=
X-Received: by 2002:a05:6512:3e14:b0:553:2633:8a64 with SMTP id
 2adb3069b0e04-55366bee0a6mr3224048e87.23.1749449555474; Sun, 08 Jun 2025
 23:12:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-5-apatel@ventanamicro.com> <aDV8E0TF_cYuoQ4A@smile.fi.intel.com>
In-Reply-To: <aDV8E0TF_cYuoQ4A@smile.fi.intel.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 9 Jun 2025 11:42:23 +0530
X-Gm-Features: AX0GCFvPnCJfNRo5uBNaPo8NZXrvaeCQeQ6i_dUaHiR22KPdWkZ9co7wy5KHhiQ
Message-ID: <CAK9=C2XJ7+homTqdiYvYRv6J+4-gEM3jLmi3EpMDn=wZjkMOqA@mail.gmail.com>
Subject: Re: [PATCH v4 04/23] RISC-V: Add defines for the SBI message proxy extension
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

On Tue, May 27, 2025 at 2:17=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sun, May 25, 2025 at 02:16:51PM +0530, Anup Patel wrote:
> > Add defines for the new SBI message proxy extension which is part
> > of the SBI v3.0 specification.
>
> ...
>
> > +/** RPMI message protocol specific MPXY attributes */
>
> If you do a kernel-doc, do it properly.

Okay, I will update.

>
> > +enum sbi_mpxy_rpmi_attribute_id {
> > +     SBI_MPXY_RPMI_ATTR_SERVICEGROUP_ID =3D SBI_MPXY_ATTR_MSGPROTO_ATT=
R_START,
> > +     SBI_MPXY_RPMI_ATTR_SERVICEGROUP_VERSION,
>
> > +     SBI_MPXY_RPMI_ATTR_MAX_ID,
>
> Remove trailing comma for the terminator.

Okay, I will update.

>
> > +};
> > +
> > +/* Encoding of MSG_PROT_VER attribute */
> > +#define SBI_MPXY_MSG_PROT_VER_MAJOR(__ver)   (((__ver) >> 16) & 0xffff=
)
> > +#define SBI_MPXY_MSG_PROT_VER_MINOR(__ver)   ((__ver) & 0xffff)
>
> This can utilise GENAMSK() or even upper_16_bits()/lower_16_bits().

Okay, I will update.

Regards,
Anup
