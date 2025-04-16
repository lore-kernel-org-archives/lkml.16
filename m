Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBEE21ABAA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 18:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744828096; cv=none; b=OW1AcYghpqY923hL0+59vL6vcOZ6HIqAmBRvixMkdXK0VeOrWJ3F58PZLrSeJedNnKPyvkrBZWulRByory+s2O7pL2dJYXDRmOit50otpmbuVNNJwu2b4mN79LXP7oPL4rVYGfHFATYzbIOhTU6fItNDNwsLfVslTKTj8Gk13Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744828096; c=relaxed/simple;
	bh=bUBb5mFoJb9G5BgJnxotUeKRdbd+vsxPnYgjdZX4OYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QLEo8pLswDKz3FOCq6wJY74Xy61nuSsjtSl/vifeBT+dVX3nkj2CEeG5pHuc2a0eQP+lTroeKQg0bpyo6iYBF4d+vWWYUFDJBbI95pvttGBb0sp6FDavIBn95+6qeE0TLtpYRrInP4wloXm23INfKgh74Zzb6x830Doethb0Afw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N/jKgODi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N/jKgODi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744828092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HqpDy6pI/eQq6luBbGPAlrOSVzuf9WMRWlny/FPlhAY=;
	b=N/jKgODiMfC3vcx8z2fi3OkMZvH6OKmjaXhJ8990sU4cBUhu3QhkhaF+0ymz+aymWfN077
	2pNGDXKteyA8s5Xs30JTXIM0eBo/e63ffK0zTZ4hUaN8pfjUb3VKqIgL5UKYCzpkvwnvuD
	9jpR8YySGDuNvRKyql2NC50eP/Cf7XY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-Z10BP2QWOny3LjzBcbcRlw-1; Wed, 16 Apr 2025 14:28:11 -0400
X-MC-Unique: Z10BP2QWOny3LjzBcbcRlw-1
X-Mimecast-MFC-AGG-ID: Z10BP2QWOny3LjzBcbcRlw_1744828090
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac3db5469fbso633394166b.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744828090; x=1745432890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HqpDy6pI/eQq6luBbGPAlrOSVzuf9WMRWlny/FPlhAY=;
        b=uvCCWyxCdhbPhzKmad8MK5LW6FUXl8AKyZWdToLBE3lzsB35YWC8Y+q0EH7D9ln4+i
         z7dNbVRnfCr+of4u64OM+Zf8LJtlu4zFGf21vg/ccLKCXds+xSxkJgvnibOV8LnDeeA+
         nRLq0tkWN1oKJ3bA0sZrtfupEsO8p8ekw546OIsgcrcXpiFT0GunK83RPTYyc3tmwXbS
         d3z3P9L5pI6WWg+stI31CJ5qlo4cy5em/ksogxWqoJu6DOkwILIRHi4NmSqRwMLh9AVe
         ojjeqnKzJ9HF56PfcbsAGqdhJmSMOdKD9je9k3cVSoEtzYFaj3K9VoIERfRbw5/XtBNS
         /KfA==
X-Forwarded-Encrypted: i=1; AJvYcCWbT4N9gNbH7pDn3KVFHusWriVd2EsRk1NInwMFlYgpoq6yTEPNEDopzUsgh0ieVfTDMLDUGH0VvCPwfzk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAWjFY/t9RUZ2dDvCBSpXb2gOKi34lVgXfDASJ2eTJk1pPdUlJ
	USxlglvcx7xbOBAsOiGQ/gfoyt4nmquQk/WJ0kUiL2aeOOagwXCMwzeoXFDlzNIrxAOCyaKTbxU
	//pbilIN1KHz41us3SwOPCxEm6DIXq+3WcqfV1CDFFmBtQkFv6pL5Pr65WHbntkkzcV6dK0dBTC
	8egt+vPzCbo/GIOK3csxgcV7HwcDCHsi0oFHXw
X-Gm-Gg: ASbGncsOCtjm0nApN8YY8okimOlIg4D2RsfdDiiopAou8xYNPeyKbYLFmCCeaeFy2Kx
	AhRyjxcYZLuivDeal6JNJ3JH0zeeSIs9/hon46gswF86lzVYbiWA02njnryJM0N3EhEMbZZwj4i
	zMKFcn3XAEZgnMKI/gWnYjBlg=
X-Received: by 2002:a17:907:dab:b0:acb:35e6:eacf with SMTP id a640c23a62f3a-acb42870b74mr259875966b.4.1744828090412;
        Wed, 16 Apr 2025 11:28:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSoF42j4ymXh4k2DWlxZNaW5OkZRSSUqi4pxp1gEEVEvZ1VJluzXf3BKzOlO4E7zUkwC3XtYHE9JkFfyjbrOY=
X-Received: by 2002:a17:907:dab:b0:acb:35e6:eacf with SMTP id
 a640c23a62f3a-acb42870b74mr259872766b.4.1744828090052; Wed, 16 Apr 2025
 11:28:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416162144.670760-1-ivecera@redhat.com> <20250416162144.670760-6-ivecera@redhat.com>
 <d286dec9-a544-409d-bf62-d2b84ef6ecd4@lunn.ch>
In-Reply-To: <d286dec9-a544-409d-bf62-d2b84ef6ecd4@lunn.ch>
From: Ivan Vecera <ivecera@redhat.com>
Date: Wed, 16 Apr 2025 20:27:46 +0200
X-Gm-Features: ATxdqUE-ky5T4DA1oVeKdaFaD--po_j_TkYXO-lqG89DNt53ozs0tBAdouq5muw
Message-ID: <CAAVpwAvVO7RGLGMXCBxCD35kKCLmZEkeXuERG0C2GHP54kCGJw@mail.gmail.com>
Subject: Re: [PATCH v3 net-next 5/8] mfd: zl3073x: Add functions to work with
 register mailboxes
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Jiri Pirko <jiri@resnulli.us>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Prathosh Satish <Prathosh.Satish@microchip.com>, Lee Jones <lee@kernel.org>, 
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Michal Schmidt <mschmidt@redhat.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 7:32=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +/**
> > + * zl3073x_mb_dpll_read - read given DPLL configuration to mailbox
> > + * @zldev: pointer to device structure
> > + * @index: DPLL index
> > + *
> > + * Reads configuration of given DPLL into DPLL mailbox.
> > + *
> > + * Context: Process context. Expects zldev->regmap_lock to be held by =
caller.
> > + * Return: 0 on success, <0 on error
> > + */
> > +int zl3073x_mb_dpll_read(struct zl3073x_dev *zldev, u8 index)
> > +{
> > +     int rc;
>
> lockdep_assert_held(zldev->regmap_lock) is stronger than having a
> comment. When talking about i2c and spi devices, it costs nothing, and
> catches bugs early.

Makes sense to put the assert here...

Will add.

>
> > +/*
> > + * Mailbox operations
> > + */
> > +int zl3073x_mb_dpll_read(struct zl3073x_dev *zldev, u8 index);
> > +int zl3073x_mb_dpll_write(struct zl3073x_dev *zldev, u8 index);
> > +int zl3073x_mb_output_read(struct zl3073x_dev *zldev, u8 index);
> > +int zl3073x_mb_output_write(struct zl3073x_dev *zldev, u8 index);
> > +int zl3073x_mb_ref_read(struct zl3073x_dev *zldev, u8 index);
> > +int zl3073x_mb_ref_write(struct zl3073x_dev *zldev, u8 index);
> > +int zl3073x_mb_synth_read(struct zl3073x_dev *zldev, u8 index);
> > +int zl3073x_mb_synth_write(struct zl3073x_dev *zldev, u8 index);
>
> I assume these are the only valid ways to access a mailbox?
>
> If so:
>
> > +static inline __maybe_unused int
> > +zl3073x_mb_read_ref_mb_mask(struct zl3073x_dev *zldev, u16 *value)
> > +{
> > +     __be16 temp;
> > +     int rc;
> > +
> > +     lockdep_assert_held(&zldev->mailbox_lock);
> > +     rc =3D regmap_bulk_read(zldev->regmap, ZL_REG_REF_MB_MASK, &temp,
> > +                           sizeof(temp));
> > +     if (rc)
> > +             return rc;
> > +
> > +     *value =3D be16_to_cpu(temp);
> > +     return rc;
> > +}
>
> These helpers can be made local to the core. You can then drop the
> lockdep_assert_held() from here, since the only way to access them is
> via the API you defined above, and add the checks in those API
> functions.

This cannot be done this way... the above API just simplifies the
operation of read and write latch registers from/to mailbox.

Whole operation is described in the commit description.

E.g. read something about DPLL1
1. Call zl3073x_mb_dpll_read(..., 1)
   This selects DPLL1 in the DPLL mailbox and performs read operation
and waits for finish
2. Call zl3073x_mb_read_dpll_mode()
   This reads dpll_mode latch register

write:
1. Call zl3073x_mb_write_dpll_mode(...)
   This writes mode to dpll_mode latch register
2. Call zl3073x_mb_dpll_read(..., 1)
   This writes all info from latch registers to DPLL1

The point is that between step 1 and 2 nobody else cannot touch
latch_registers or mailbox select register and op semaphore.

Thanks,
Ivan

