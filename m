Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E9C188713
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 17:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743703122; cv=none; b=BBRB9dqQZ5mVENUVXIY0HZWmijdfiJsMHpPz6SaVqwscp0W5Y+13dVJENSIpezZfBmwyKhBHgy4gYkiOS2kCnwlAE5XY5JB7VQhrZIrbVexUqQPpBDOiPlSPwnd+zOWkbYAsUG2ucT+zglux2mP5VT9As8s5u0NTXiqxohpgP/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743703122; c=relaxed/simple;
	bh=Q8POkohBVDxsHmtXchptR1NIXWd35AEj19zql7hGIgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pLTLc7/n0vPQ9ZM//4qSdM3xfESMcmHFcGVbPh2J4mYNzGBbRpH/6XLfAr4R4ZaaTet1Pcws/uhT1oPSob2vBEepv+rvjuglIoxbfZf+OcSVNR0XCMZZrxYNZsJp1/MVjQI0yCSF2m2rXynWOo9nbzTonwQPNi1vl95hqJKVBew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ip8qMc5M; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ip8qMc5M"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e8f254b875so11877536d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 10:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743703120; x=1744307920; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTtcXxb4p7VMEp2BDy1np9PTwD2dUqn8F9klggrFWvU=;
        b=ip8qMc5Mh6960/cRgHe++MDkDl5xogBaGsYWIqT7lqKM28EUcIzBm8lkUz98d7Q2Xe
         Bl/4aWK9UGHuNuAdUy95ohrw/iRdldcy8UdUywfldy9Y7dT+2GU2Cn02ISvfho5Sdlxv
         GCOlOShpJL4aKp1F9B0w311iYG+TFRi4H01lg9gcYvcHZx0bVcOJYP3enkQEd5ttrK/d
         3H99dNzxAoTLRnv2//oEYudLrOCS1y4z2XPA4BQ/2ypLtoYRJ3uGaL3os5jFOnxILUzg
         4NGT3evBfNwGEPzh6GeUh3aV0jBDWvEMV7gjvI8yH5PO5jAxmHP9HQme0RKHcGu8GmLW
         NMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743703120; x=1744307920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bTtcXxb4p7VMEp2BDy1np9PTwD2dUqn8F9klggrFWvU=;
        b=Vo9Gv+XTn1l4JPmO0dE1x/bWMrdsFoHOBDJJCqr8CMHdljqJgavScOuiSIFdf1RS+E
         rlqGduvlsuote0Za3yJLwvrj1/PydDsbwl1r8ZdZy/qQjG0azwKUUEJI9uT4bKZkcMlV
         WIXh9yDMazbA4xbnoC0w6BNDC1p3y2JS7gHiP38EjEMF6BPLHPoHLLEcS/Q9p5i0en4L
         aNgVG7uLwJeX2h45EKgSaIubXQJwxJeGkx5yE1hZc8kFWwKMilPRR7ljfhy1Z4+R885L
         g7i9t2RZzR+dVD4OtBOyTvywo7ZJECAjr9oe0BZdHHQJDvjIGRRaCmkQEi/XnxzvkQK9
         T9fw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ4FAoXOYaHgGqDNBPAMTGMeYyDn1y1u0mMomeWv7MgbS6aYmF+ckPKl8cIAAm9CpVuw0txVwyKQzTM+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCfuTvoqKy1RGflvRJ6nwHwRLO7ussai4Kc9CFREt8fC5TK3Ss
	NuLo2DEdrqgkLKR6KVSNwJUlqGKPnacWyuKfY3Jre8vfgoeeWr3rn0xEQxUYvhCx3RTSQvIZxkX
	HUzWwj0Ouy5C2lRKUXY7RjXDqrmu0J67vDrI=
X-Gm-Gg: ASbGnctbql3wrDjKln9qD1izFbdT0yaTNz798bepf1SEzGPrsisTtmj+groQMWoRcvb
	b3CvXVGkCPfHWWWwsRfM+PgwIHJxde72bPr3UhK6/4OvrX/jug7axTIgJvHQ8JfysOVBJZ9vbfF
	OWIvQuNHSUk/ZWWfvfIeF6hvsNhQ==
X-Google-Smtp-Source: AGHT+IEIevg4UoRGTbvyOr3Eao4GsML/JhZbbcVtm3uMnzENFqDg+qpmk05qd7SBpBbE6Xh8ZpZL9TyDiOgGPlQ/rnc=
X-Received: by 2002:a05:6214:224b:b0:6e8:fee2:aae7 with SMTP id
 6a1803df08f44-6f01e7a28e9mr2037426d6.39.1743703119539; Thu, 03 Apr 2025
 10:58:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402011832.2970072-1-yabinc@google.com> <20250402011832.2970072-3-yabinc@google.com>
 <20250402134716.GK115840@e132581.arm.com>
In-Reply-To: <20250402134716.GK115840@e132581.arm.com>
From: Yabin Cui <yabinc@google.com>
Date: Thu, 3 Apr 2025 10:58:28 -0700
X-Gm-Features: ATxdqUHIAqPYc3Y25BVtrlywrV7mimjAyUqMxC5jp5EtHtHnp9yy0EUaDFps-fo
Message-ID: <CALJ9ZPPp_DhLJcdjxmSTvkEspqYOK0mYkMaBF7ZieArJpWJOnw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] coresight: catu: Prevent concurrent PERF and SYSFS
 mode enablement
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 6:47=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> On Tue, Apr 01, 2025 at 06:18:31PM -0700, Yabin Cui wrote:
> > A CATU device can be enabled for either PERF mode or SYSFS mode, but
> > not both simultaneously. Consider the following race condition:
> >
> > CPU 1 enables CATU for PERF mode.
> > CPU 2 enables CATU for SYSFS mode. It only increases refcnt.
> > CPU 2 enables ETR for SYSFS mode.
> > CPU 1 fails to enable ETR for PERF mode.
> >
> > This results in a CATU being enabled in PERF mode and an ETR enabled
> > in SYSFS mode, leading to unknown behavior.
> >
> > To prevent this situation, this patch checks enabled mode of a
> > CATU device before increasing its refcnt.
>
> Yes.  We have also observed the same issue.  I am currently working on
> refactoring the Arm CoreSight locking, my plan is to use coresight_path
> to maintain mode.
>
> Given it is uncommon case to use two modes concurrently in Arm
> CoreSight, I assume this is not an urgent issue.  Could we defer this
> patch?  My understanding is that this issue will be prevented with
> checking the path mode, rather than checking modes in seperate modules.

Sure, I am fine with withdrawing this patch, as there are other plans to ad=
dress
the issue.

>
> To be clear, I am fine with other two patches in the series.
>
> Thanks,
> Leo
>
> > Signed-off-by: Yabin Cui <yabinc@google.com>
> > Suggested-by: James Clark <james.clark@linaro.org>
> > Suggested-by: Leo Yan <leo.yan@arm.com>
> > ---
> >  drivers/hwtracing/coresight/coresight-catu.c | 6 +++++-
> >  drivers/hwtracing/coresight/coresight-catu.h | 1 +
> >  2 files changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwt=
racing/coresight/coresight-catu.c
> > index b1d490dd7249..0caf3a3e75ce 100644
> > --- a/drivers/hwtracing/coresight/coresight-catu.c
> > +++ b/drivers/hwtracing/coresight/coresight-catu.c
> > @@ -466,7 +466,10 @@ static int catu_enable(struct coresight_device *cs=
dev, enum cs_mode mode,
> >               CS_UNLOCK(catu_drvdata->base);
> >               rc =3D catu_enable_hw(catu_drvdata, mode, data);
> >               CS_LOCK(catu_drvdata->base);
> > -     }
> > +             if (!rc)
> > +                     catu_drvdata->mode =3D mode;
> > +     } else if (catu_drvdata->mode !=3D mode)
> > +             rc =3D -EBUSY;
> >       if (!rc)
> >               csdev->refcnt++;
> >       return rc;
> > @@ -499,6 +502,7 @@ static int catu_disable(struct coresight_device *cs=
dev, void *__unused)
> >               CS_UNLOCK(catu_drvdata->base);
> >               rc =3D catu_disable_hw(catu_drvdata);
> >               CS_LOCK(catu_drvdata->base);
> > +             catu_drvdata->mode =3D CS_MODE_DISABLED;
> >       } else {
> >               rc =3D -EBUSY;
> >       }
> > diff --git a/drivers/hwtracing/coresight/coresight-catu.h b/drivers/hwt=
racing/coresight/coresight-catu.h
> > index 755776cd19c5..ea406464f0a8 100644
> > --- a/drivers/hwtracing/coresight/coresight-catu.h
> > +++ b/drivers/hwtracing/coresight/coresight-catu.h
> > @@ -66,6 +66,7 @@ struct catu_drvdata {
> >       struct coresight_device *csdev;
> >       int irq;
> >       raw_spinlock_t spinlock;
> > +     enum cs_mode mode;
> >  };
> >
> >  #define CATU_REG32(name, offset)                                     \
> > --
> > 2.49.0.472.ge94155a9ec-goog
> >
