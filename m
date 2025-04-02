Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9F11AAC9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 01:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743556933; cv=none; b=S5QUJsFEDRrlHUv6kQF/chLtq0tBF5jCKfy8B3jj2qQtHksSjZsfFs4I8cNsW2VnuWTsYJNbxcAIrTbwZtpPDDMy3EFr+5au2EwxXy6mj2+ukIgMcD3NHESuFiHI4bxhOFp3lbFdLlCPBfbAbcqGvGQRCD5CseiADQRux5NeVT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743556933; c=relaxed/simple;
	bh=Y4N8HfXgy2RY9kU6tulD4+1XtgSD75PR7mMPjdbMXWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KFNEEfD6uvPYjuX0YG3eFJGnhMQPF35p0mjIdsFLO0TEi5EQV30y2LrWJoCAIfMSMVrw4L8bgo54KO0QXSkcKh+1NrTiSh2v9KqUlGF5koXkHkqJTm1BjLpU3xaPEI2vs1hbYUf8Wvnc/h8LDHn1FU1I1Y8XRwHjgkDktsJulgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fpa1Cag0; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fpa1Cag0"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e8fce04655so59135546d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 18:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743556931; x=1744161731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GofoErHI9T810tytuenQDsE4GnxZ6SooxECYzx95nys=;
        b=fpa1Cag0TSU8fjXDBP/+++XiBAWJekP/S2SSAP2u0bhDXr1x1qMsjXpvLCh0moM8Ex
         qaE9i8Kx1ydE6rS6fjWCTCixi1kUJcu3qsv+K4UamLmODYKxs+Q+pB55X75QtDRqh+iG
         dYjNjzhzCCNin9CivE9LBCkxJIDIJHIqua9Jy2iUscE7L/drzZwNqZ9/SwBC+rvoxkwq
         hYl+VyFFzMoNMq9b0GBByMAHKimDztxATc+GyKV+l5hHCHk63qf9ZUS/GY36VJoMEesG
         O2tB91H8YeNE+AXdNLX5FYUlG+E+jdjnOGy/HfkAFl091UdJG4IHask3zDFEqtQKJWUN
         uKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743556931; x=1744161731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GofoErHI9T810tytuenQDsE4GnxZ6SooxECYzx95nys=;
        b=mC+tsqrMJCbOlJnFXFkCAAJSN3q3Z4OysNxKs/S0NIS2/Hz9YlEJPsHSlwDsYTZiP+
         YNKTyRSDxQZM25ntv92exRZhKeE1GFVUw0aXFM42fLLPejQvQU5ZWhPeAF5ltLcrrGwt
         y2kNM3QfzTJ/PC/NZlzMDo2GO4tsqQ0R7u7VhN14bDPFSRgjRvwv+TT2zELz9eyHhrlK
         AbpeksQWNBgEJynO3Ce+jgoymBZEIignSYYWvbf50P7ATw12YgHH4HibNea4FeXFX6f4
         PenFjD/83C+EL04eO6BYfEn8NpYLzJRTXxG4nsOWxmhIu8oimSzFyWUuGPx44SqsS8FP
         JdUg==
X-Forwarded-Encrypted: i=1; AJvYcCVnRfF6BlZ7ldBp4BUUdK7XoDAI3Rk5fUrjHBKRBR6cy+mcerOplzKlKPBaAct9FvQFpCIngTS25Bv0E0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTaOvQrEeL3ZrEqRdIvi/zfoBYnUuES2jYRlpZhWcGUWTfVWdW
	ayHj0tFj/1ZlduVIrc9KEGS4ZWNxDrDCnySFnbYp99BvgAq6eDvtnQvwcpNM+hH8qkM4m4lgDGM
	oWG1Io2Vauxsmpp6t4IHwWVniRu+iySIQAPM=
X-Gm-Gg: ASbGncuOGHNmdVpyovUoy/aDXCA2HtLHbgoYQhgT97B8g03FwhUS/RPUL//ANAwMLRY
	+lTCeBsFE3r+fOGll2FfPn6GRGt/kcgQd0+giczxh0JNXX16xX4kiStPhNQ2+GU+nukmGV6XRnl
	dkvofe05Y6ibFipPVFXSJUYK9Txw==
X-Google-Smtp-Source: AGHT+IFNgYbnbBXVlpFQqcBdZGewOZnpTP2ZbadklR5ZyIYHzakO6QVp2iSwpF6RIqS/Zt3n6YrcxZbDmVj3XHmvwuU=
X-Received: by 2002:a05:6214:2a49:b0:6e8:f4e2:26d9 with SMTP id
 6a1803df08f44-6ef02d0d895mr12378236d6.35.1743556930967; Tue, 01 Apr 2025
 18:22:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402011832.2970072-1-yabinc@google.com> <20250402011832.2970072-2-yabinc@google.com>
In-Reply-To: <20250402011832.2970072-2-yabinc@google.com>
From: Yabin Cui <yabinc@google.com>
Date: Tue, 1 Apr 2025 18:21:59 -0700
X-Gm-Features: AQ5f1JrgVf9BlOqU8nJc8AGx92KxV31d-C-bB1fxTFWAWir3Ez9IcMJEkhnV41I
Message-ID: <CALJ9ZPNBGBd9OTBgedoQStXh3d2oGDGi6fUF7PXbU5qTEBRHew@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] coresight: catu: Introduce refcount and spinlock
 for enabling/disabling
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, leo.yan@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 6:19=E2=80=AFPM Yabin Cui <yabinc@google.com> wrote:
>
> When tracing ETM data on multiple CPUs concurrently via the
> perf interface, the CATU device is shared across different CPU
> paths. This can lead to race conditions when multiple CPUs attempt
> to enable or disable the CATU device simultaneously.
>
> To address these race conditions, this patch introduces the
> following changes:
>
> 1. The enable and disable operations for the CATU device are not
>    reentrant. Therefore, a spinlock is added to ensure that only
>    one CPU can enable or disable a given CATU device at any point
>    in time.
>
> 2. A reference counter is used to manage the enable/disable state
>    of the CATU device. The device is enabled when the first CPU
>    requires it and is only disabled when the last CPU finishes
>    using it. This ensures the device remains active as long as at
>    least one CPU needs it.
>
> Signed-off-by: Yabin Cui <yabinc@google.com>
> ---
>  drivers/hwtracing/coresight/coresight-catu.c | 27 ++++++++++++++------
>  drivers/hwtracing/coresight/coresight-catu.h |  1 +
>  2 files changed, 20 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtra=
cing/coresight/coresight-catu.c
> index fa170c966bc3..b1d490dd7249 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -458,12 +458,17 @@ static int catu_enable_hw(struct catu_drvdata *drvd=
ata, enum cs_mode cs_mode,
>  static int catu_enable(struct coresight_device *csdev, enum cs_mode mode=
,
>                        void *data)
>  {
> -       int rc;
> +       int rc =3D 0;
>         struct catu_drvdata *catu_drvdata =3D csdev_to_catu_drvdata(csdev=
);
> +       guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
>
> -       CS_UNLOCK(catu_drvdata->base);
> -       rc =3D catu_enable_hw(catu_drvdata, mode, data);
> -       CS_LOCK(catu_drvdata->base);
> +       if (csdev->refcnt =3D=3D 0) {
> +               CS_UNLOCK(catu_drvdata->base);
> +               rc =3D catu_enable_hw(catu_drvdata, mode, data);
> +               CS_LOCK(catu_drvdata->base);
> +       }
> +       if (!rc)
> +               csdev->refcnt++;
>         return rc;
>  }
>
> @@ -486,12 +491,17 @@ static int catu_disable_hw(struct catu_drvdata *drv=
data)
>
>  static int catu_disable(struct coresight_device *csdev, void *__unused)
>  {
> -       int rc;
> +       int rc =3D 0;
>         struct catu_drvdata *catu_drvdata =3D csdev_to_catu_drvdata(csdev=
);
> +       guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
>
> -       CS_UNLOCK(catu_drvdata->base);
> -       rc =3D catu_disable_hw(catu_drvdata);
> -       CS_LOCK(catu_drvdata->base);
> +       if (--csdev->refcnt =3D=3D 0) {
> +               CS_UNLOCK(catu_drvdata->base);
> +               rc =3D catu_disable_hw(catu_drvdata);
> +               CS_LOCK(catu_drvdata->base);
> +       } else {
> +               rc =3D -EBUSY;
> +       }
>         return rc;
>  }
>
> @@ -550,6 +560,7 @@ static int __catu_probe(struct device *dev, struct re=
source *res)
>         dev->platform_data =3D pdata;
>
>         drvdata->base =3D base;
> +       raw_spin_lock_init(&drvdata->spinlock);
>         catu_desc.access =3D CSDEV_ACCESS_IOMEM(base);
>         catu_desc.pdata =3D pdata;
>         catu_desc.dev =3D dev;
> diff --git a/drivers/hwtracing/coresight/coresight-catu.h b/drivers/hwtra=
cing/coresight/coresight-catu.h
> index 141feac1c14b..755776cd19c5 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.h
> +++ b/drivers/hwtracing/coresight/coresight-catu.h
> @@ -65,6 +65,7 @@ struct catu_drvdata {
>         void __iomem *base;
>         struct coresight_device *csdev;
>         int irq;
> +       raw_spinlock_t spinlock;
>  };
>
>  #define CATU_REG32(name, offset)                                       \
> --
> 2.49.0.472.ge94155a9ec-goog
>
