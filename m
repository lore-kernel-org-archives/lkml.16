Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2962459DD
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 05:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749448702; cv=none; b=Bnw270Y7LONpUtOS+ecBDCr/j2AZO55ZWEzGO2Lux/h6CYdGF+F0gCgocbzIlSqsD829QClCfYg/DEf8J59GtZiOUYMDnS/QBivQrbGF5seo+X0LUm32exLHQ3o9gMpnWYK02eAPiQN1cNpUnI0MVA2aV7BG9mDbGesBtQqkMeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749448702; c=relaxed/simple;
	bh=slXEZt1JN9lXv9PIIOCjVGjhjME8+mB5XUxfKMGsbd0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XqckPCLRKm8lUh8a+8coSxzCe1JOQu1+/Uu/wdpmOhutc87nj+qtMS/mnbI8v8Hn3x7lfh5ZqWxvjV040djjr027Lp8PwqsKjmTK2R5PFKtuh7mmTeDGQngUWEAlEUMsH2zRzvZywpww2Hnjd/WDceFc6pW60HcpsSrfMaHtlTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=O/4PbqNE; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="O/4PbqNE"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5533302b49bso4173291e87.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 22:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749448699; x=1750053499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79dQYfKRjz/YesTMH1J35SSA7TkpXL6oM6f8PWhNqGs=;
        b=O/4PbqNEZk9pBBLormo1ZrCdf5fYtzEYPQzBKvBGlddyieONBAtJG3PpwJDQQTXXAf
         PJqG8PbF9Wch2UZoJb8IAsNLbWQ2vquBCV8TfqL8rGqFwFLJFUj/GDdjSV7UNlA7Karm
         Z1EPFDoYRtAb5bwEQSPvBHL6yIE+8LWVhPY6lqigze1SAJTba0mFMaQqos5u6HMtHFfe
         Z2++ewQGC/tvTQ8bpI0qa2lJ1yQphrhu4TrjE5ZqyggiKz1JQa9hLz8gIrFyKBKNcE/a
         Zp+CWw8ecdYQGdbXeZ+KRqLoyCWvVCrkHkT0usYwERB7GqubDTwt75PFA+2i4ZoDQKuW
         ZR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749448699; x=1750053499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79dQYfKRjz/YesTMH1J35SSA7TkpXL6oM6f8PWhNqGs=;
        b=dwq97avrJTYXdgCH/hAOLSVggSsmiKjuyzix3q8NcLc1UqbfoH+bg9/wHYQ4rsDrf+
         CEtICdAmurGG4j7votm8l9MQk+KrdYEhnjr9ApqqCEZFQYO/2NA3Af6h1bLU9ZHGIpnY
         9MCGk1teQOndzqTch5OQt6MVVM7Sn7u4F8Yvkg6vwB38mXj0qQf/RL1R3YJKtPvPNWXh
         MbedhDOCu1io/1B4VysB5yl0ZBqrpD8bV9nyhKsRLqlO5HfMUQzu4izqYTSr4eeD89iq
         Ct+GgcsUvy4aLUFdJgXbCmQujsF/wxVFoeWjOi6RUXSTjyYICbNJp1kwN10LTCaOQK/0
         9JMw==
X-Forwarded-Encrypted: i=1; AJvYcCWmsF0pe/gc0v6J9mD1C5CK1jcPkLYdk+O5Q4VPile3NXtVFEhQTGnoHd8EGakhU8ykX5hbten6R9Qf30c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/lVMCweJy6c9p3je2dINaI/wKT8YbU0ZwxTcEO2evgARH6CBj
	G9S5WCn9LtGpGAuxsmJGl3Tr6v5AsuvXRjHjCZ9DvqsPfBOixala+BeIB064DqStCM5rnQvOLxV
	+K8pwtym/cKB7O06Cu940tdEp8Xh3nNV895pkAdaNkA==
X-Gm-Gg: ASbGncvJ6uC3Fq8lPoJDUZOWHEvtn+r92gC2nwOibd+cT0Wo9TUZVNyBpI03maZervr
	QdJnS5MQubzfE/fLECA+cEZAM0PCdWhXwZwaKWpNyEp4gXspVJvQR0OdRhD5dwxbVm6Bspu3PmX
	PnLPmi/IU/yFmFh06Yhzqxa53LTWn7TjlNwU+9MfZydHsU
X-Google-Smtp-Source: AGHT+IEEAjCAU74AdDgZhPUpik9rwnZXkawnnn1BuceWjTl98W9A7+CL2sv8mgaup8C6oH709Ul1OgTzgtqBWZpTOi4=
X-Received: by 2002:a05:6512:39c3:b0:553:2486:e0fd with SMTP id
 2adb3069b0e04-55366bfa7a2mr2653560e87.23.1749448698667; Sun, 08 Jun 2025
 22:58:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-2-apatel@ventanamicro.com> <53abb1fc-6236-4266-a6e7-25023e27e160@linux.dev>
In-Reply-To: <53abb1fc-6236-4266-a6e7-25023e27e160@linux.dev>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 9 Jun 2025 11:28:06 +0530
X-Gm-Features: AX0GCFsmWbRIoUi6nNFKjR9qXpFfrpwbKCN1t236wpZV7bl1kup6dBRNjwof4ew
Message-ID: <CAK9=C2VhmU1a9TN4+oLMNRfweHY8jw=W71k+HpqnUxxve6hNfQ@mail.gmail.com>
Subject: Re: [PATCH v4 01/23] riscv: Add new error codes defined by SBI v3.0
To: Atish Patra <atish.patra@linux.dev>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>, 
	Rahul Pathak <rpathak@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 7, 2025 at 5:21=E2=80=AFAM Atish Patra <atish.patra@linux.dev> =
wrote:
>
>
> On 5/25/25 1:46 AM, Anup Patel wrote:
> > The SBI v3.0 defines new error codes so add these new error codes
> > to the asm/sbi.h for use by newer SBI extensions.
>
> This patch can be dropped as it is part of the FWFT series with minor
> modifications in error mappings.
>
> https://lore.kernel.org/linux-riscv/20250523101932.1594077-4-cleger@rivos=
inc.com/

Yes, I am aware of Clement's patch. I was temporarily carrying
this patch over here.

Regards,
Anup

>
>
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >   arch/riscv/include/asm/sbi.h | 12 ++++++++++++
> >   1 file changed, 12 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.=
h
> > index 3d250824178b..4dd6aafb8468 100644
> > --- a/arch/riscv/include/asm/sbi.h
> > +++ b/arch/riscv/include/asm/sbi.h
> > @@ -419,6 +419,11 @@ enum sbi_ext_nacl_feature {
> >   #define SBI_ERR_ALREADY_STARTED -7
> >   #define SBI_ERR_ALREADY_STOPPED -8
> >   #define SBI_ERR_NO_SHMEM    -9
> > +#define SBI_ERR_INVALID_STATE        -10
> > +#define SBI_ERR_BAD_RANGE    -11
> > +#define SBI_ERR_TIMEOUT              -12
> > +#define SBI_ERR_IO           -13
> > +#define SBI_ERR_DENIED_LOCKED        -14
> >
> >   extern unsigned long sbi_spec_version;
> >   struct sbiret {
> > @@ -503,11 +508,18 @@ static inline int sbi_err_map_linux_errno(int err=
)
> >       case SBI_SUCCESS:
> >               return 0;
> >       case SBI_ERR_DENIED:
> > +     case SBI_ERR_DENIED_LOCKED:
> >               return -EPERM;
> >       case SBI_ERR_INVALID_PARAM:
> > +     case SBI_ERR_INVALID_STATE:
> > +     case SBI_ERR_BAD_RANGE:
> >               return -EINVAL;
> >       case SBI_ERR_INVALID_ADDRESS:
> >               return -EFAULT;
> > +     case SBI_ERR_TIMEOUT:
> > +             return -ETIMEDOUT;
> > +     case SBI_ERR_IO:
> > +             return -EIO;
> >       case SBI_ERR_NOT_SUPPORTED:
> >       case SBI_ERR_FAILURE:
> >       default:
