Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB298DDAD
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 17:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745428025; cv=none; b=gSG5qoVk1WJSOmIXfdk4hDzVqGoA8GwtUGQxH0D6dg70Ipywaz/AdpRS3spbp4MwaZ8MehCcxLQvMbQySFjTqrkFOcNQnApvX53KECEUhczy4poYoKt2wvR4FiLFBaLe0cZMi9eeiaM7a21W9/MN3JyTqfUy1j7IMpZIrM6/YvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745428025; c=relaxed/simple;
	bh=+sKJnklG2LeYRGBTYEi2wsi1oZ6mYYTO1oaYPp93AXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tSrFlgPVPppG4Cb/Zxmu8Rk0kT57uvcumEvcr7qrfsTRusG2ejlYAb4oDWVkS0Xwz6mU16mqQ1uTA0+eiyKzp4OPZftqy6WbSZw9ywIhsx9UYaHLw4g1k7/gwBo0E34C23e/WeABCiYJ52ukdL2aPtOofTjIPKrhJTnZTV6G6NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aaQMHqLA; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aaQMHqLA"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6ecfbf8fa76so1341056d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745428022; x=1746032822; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwoLC090KAiMN1YJGTa664tyM6EnyyhutxXQA6EbVAA=;
        b=aaQMHqLA6srFtBPwzJSka5RjkA+yerGTKs3zRg5sCVyxCbloNENxJFdmI5s4vPCxoq
         ngXYXC8xhGw92UALtCCst3wUzI/1oO6Oku4yrTd0hgRDs6Gp3ADO/jPKMT3KHqXGfhk8
         Tahr4h+kEn1yo0iIyi5eTv4BH1IvrxU5qeZcTbgSGVTzz/XkVJ7QJvd7hBeWDRkkT8Is
         +W92nGA/Q3Ti76UsAXRJqQUKmYXz2bkOfNCpaVurD5Ob3wh5BF3/7zPukhsZpf9j/97m
         EIHr8ZBFFEdaujiMalhiKgHcZQTbbyhnffRk/bxhiTR52H1PPL0RsxZjujO3iMe5e7d7
         5Rvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745428022; x=1746032822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nwoLC090KAiMN1YJGTa664tyM6EnyyhutxXQA6EbVAA=;
        b=rmtI/vaxzY5vzz0shJUieaOaZty+7Lkm6EGqAhW1DRw5gVgysfb/9fRuwFcHkmzTmO
         twsLAgxONqz44zYYE3qg6T3y28H4M/JIKI5X0pXoM4UHgJTkb35mHuEsoG5ZGyDuSDLu
         ble+GtWALpWUIjjeGzJWBWDyHBO0BY6kr4zLVvocUDYoEWN8kOI+B+WciAf+mf/s8D8q
         HacQiZbUW7q80Iwm2yUHM598mFl5VBunwnfxdO/x0vDcQq7uSvr8Qk1FgKDUdrVBJDKN
         f/ClpdpbxUxtScX90PtFOfzT18C+xFGRmi6xNcFWEkqJ4QevxQUkMn4aBY/KVg7YSn2M
         Mr6A==
X-Forwarded-Encrypted: i=1; AJvYcCVsr6eTx7Bjy8wcpa6vMAwJ5ujTVsibDDO1YjyfcHhVFGlgPRVYgC7PRxltQB6aWmIyHqhkt2lfxDTyjbs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEGO+nH4ZtwgbLrBlVipyCEdeFkSHYB9L8AwqAwI9UyESn4aAD
	gCeRZwSIS1YnZHQSynL2X9Bqj3lC5t6aQtlQgttL0PrEbum/YHcPIamYa4XRtkqKHgB4ta1wXBo
	buyTt8XbHaJOL2vX+EA7mc9n6LRU3CDZDjP8=
X-Gm-Gg: ASbGncsgvMzoie2XtpXTNypRNm+4TwVrGCgNAx1Sy58Ic9XoeyINnOGQsAN8eyCEiuZ
	OFHNj6HSlN4cMD3JFKXYv/H5vTWBLUc32T432ms4WM4eKk9KafhCjN/LLetjust7To+z0QWKKww
	wS+2WfBWJZjMr6xvLBgITvX+F12SKIfosBuToU+2PhFxWgiXPcIR3ACcVl/whpFA==
X-Google-Smtp-Source: AGHT+IG9kj/bKbm3xOybDI1j9UpcbimSJl5hS4BlvPDwk4FKqxsGFeVSFvWjRYvDk3VbKvPh1kjAaZOMmUl54mN2ssk=
X-Received: by 2002:a05:6214:5d8e:b0:6f2:c94f:56b5 with SMTP id
 6a1803df08f44-6f2c94f57e4mr420533326d6.10.1745428021880; Wed, 23 Apr 2025
 10:07:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415184649.356683-1-yabinc@google.com> <20250415184649.356683-2-yabinc@google.com>
 <20250423081648.GJ28953@e132581.arm.com>
In-Reply-To: <20250423081648.GJ28953@e132581.arm.com>
From: Yabin Cui <yabinc@google.com>
Date: Wed, 23 Apr 2025 10:06:50 -0700
X-Gm-Features: ATxdqUHA6VR574bbzyvYawg5qzV7NglTFU4wSViIiTNQ0tOAE65VyLttkuLoKeA
Message-ID: <CALJ9ZPN+JoL1SCoWhgRvCkTa6YPv-psGgOoxL9aotNmbdS+cHA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] coresight: catu: Introduce refcount and spinlock
 for enabling/disabling
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Jie Gan <quic_jiegan@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 1:16=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Hi Yabin,
>
> Sorry for late reply as I was on vacation for the past two weeks.
>
> On Tue, Apr 15, 2025 at 11:46:48AM -0700, Yabin Cui wrote:
> > When tracing ETM data on multiple CPUs concurrently via the
> > perf interface, the CATU device is shared across different CPU
> > paths. This can lead to race conditions when multiple CPUs attempt
> > to enable or disable the CATU device simultaneously.
> >
> > To address these race conditions, this patch introduces the
> > following changes:
> >
> > 1. The enable and disable operations for the CATU device are not
> >    reentrant. Therefore, a spinlock is added to ensure that only
> >    one CPU can enable or disable a given CATU device at any point
> >    in time.
> >
> > 2. A reference counter is used to manage the enable/disable state
> >    of the CATU device. The device is enabled when the first CPU
> >    requires it and is only disabled when the last CPU finishes
> >    using it. This ensures the device remains active as long as at
> >    least one CPU needs it.
> >
> > Signed-off-by: Yabin Cui <yabinc@google.com>
>
> LGTM:
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>
>
> As Jie reminded, please add James' review tag in next spin.

Sorry for forgetting to add Reviewed-by. Will add it in next spin.

>
> Thanks,
> Leo
>
> > ---
> >  drivers/hwtracing/coresight/coresight-catu.c | 25 +++++++++++++-------
> >  drivers/hwtracing/coresight/coresight-catu.h |  1 +
> >  2 files changed, 18 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwt=
racing/coresight/coresight-catu.c
> > index fa170c966bc3..3909b562b077 100644
> > --- a/drivers/hwtracing/coresight/coresight-catu.c
> > +++ b/drivers/hwtracing/coresight/coresight-catu.c
> > @@ -458,12 +458,17 @@ static int catu_enable_hw(struct catu_drvdata *dr=
vdata, enum cs_mode cs_mode,
> >  static int catu_enable(struct coresight_device *csdev, enum cs_mode mo=
de,
> >                      void *data)
> >  {
> > -     int rc;
> > +     int rc =3D 0;
> >       struct catu_drvdata *catu_drvdata =3D csdev_to_catu_drvdata(csdev=
);
> >
> > -     CS_UNLOCK(catu_drvdata->base);
> > -     rc =3D catu_enable_hw(catu_drvdata, mode, data);
> > -     CS_LOCK(catu_drvdata->base);
> > +     guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
> > +     if (csdev->refcnt =3D=3D 0) {
> > +             CS_UNLOCK(catu_drvdata->base);
> > +             rc =3D catu_enable_hw(catu_drvdata, mode, data);
> > +             CS_LOCK(catu_drvdata->base);
> > +     }
> > +     if (!rc)
> > +             csdev->refcnt++;
> >       return rc;
> >  }
> >
> > @@ -486,12 +491,15 @@ static int catu_disable_hw(struct catu_drvdata *d=
rvdata)
> >
> >  static int catu_disable(struct coresight_device *csdev, void *__unused=
)
> >  {
> > -     int rc;
> > +     int rc =3D 0;
> >       struct catu_drvdata *catu_drvdata =3D csdev_to_catu_drvdata(csdev=
);
> >
> > -     CS_UNLOCK(catu_drvdata->base);
> > -     rc =3D catu_disable_hw(catu_drvdata);
> > -     CS_LOCK(catu_drvdata->base);
> > +     guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
> > +     if (--csdev->refcnt =3D=3D 0) {
> > +             CS_UNLOCK(catu_drvdata->base);
> > +             rc =3D catu_disable_hw(catu_drvdata);
> > +             CS_LOCK(catu_drvdata->base);
> > +     }
> >       return rc;
> >  }
> >
> > @@ -550,6 +558,7 @@ static int __catu_probe(struct device *dev, struct =
resource *res)
> >       dev->platform_data =3D pdata;
> >
> >       drvdata->base =3D base;
> > +     raw_spin_lock_init(&drvdata->spinlock);
> >       catu_desc.access =3D CSDEV_ACCESS_IOMEM(base);
> >       catu_desc.pdata =3D pdata;
> >       catu_desc.dev =3D dev;
> > diff --git a/drivers/hwtracing/coresight/coresight-catu.h b/drivers/hwt=
racing/coresight/coresight-catu.h
> > index 141feac1c14b..755776cd19c5 100644
> > --- a/drivers/hwtracing/coresight/coresight-catu.h
> > +++ b/drivers/hwtracing/coresight/coresight-catu.h
> > @@ -65,6 +65,7 @@ struct catu_drvdata {
> >       void __iomem *base;
> >       struct coresight_device *csdev;
> >       int irq;
> > +     raw_spinlock_t spinlock;
> >  };
> >
> >  #define CATU_REG32(name, offset)                                     \
> > --
> > 2.49.0.604.gff1f9ca942-goog
> >
