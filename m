Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA11244678
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 17:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745428993; cv=none; b=gG7/f+7mCs0SpHR9IJzdgfbQYHvnz6SYKH3SXMpW+AtkFqgbloXxc0kjyE1k4VyUqb+HWOXjR0A339sXTab15fuYFj5f98WKlpTiyCKcFq8xq4inOxKffQPE9k3kHowGqlDEo5QYw//50ePZQ41hC4bkbMKGb6BpswyYmLBq9Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745428993; c=relaxed/simple;
	bh=jejl/eLx0fhcuHLM0y/YQRdiN1C22cieICICQ96/V38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ja6cGUAsFuQgf6OIY9IZzvKPXcKSm4eFZy0wBFcdRKF47/Cho7mmlFbajP76wNOKHLujI3KizJGo+mFWCUqJa+wKaj9+W2zpwTdgCTMn2wX5vjl7xJgeqQ+iC7vz97J7umyww75iy2sb9OpqpWTn2sRlh+3a3z3Z1nbQLUz1FSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zQOJPeP6; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zQOJPeP6"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e8fd49b85eso1983306d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745428990; x=1746033790; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPPQRfeBlp3SWyGU6Y2ZQ8P7vL3m0Qv9EW5gsCWy8+k=;
        b=zQOJPeP69yJs9rav1wJ0Tp1mBkp1d6KsDvgoAKsLU7QMlfF3z2y5BVZ+wlP4Y/pyup
         76L6xNgtwIAjZ5OUSSe3B0ZRCAqLgB12rdHgvj/dlUArTRCYCA11JGBL/43VypzlW7rZ
         TlkI8/wyArqNAryDVQ0Y9Hb1hOQlcqpWHVnfXGF4kljGo5VFyiG1azVuzPBe8/U4jX7N
         mRcP5NK2IGb1sHKM0IEtLPKpgB62To4ooaLOb8+lPFNAQofdRnSQ09HrSh9XB6GihESV
         mTgotuyq7G9K0Ev5vaffSbUj+E6AngJLqtpWCki4CL39NYNfyavHtbuQ9moe8q1WMP/R
         vSuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745428990; x=1746033790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QPPQRfeBlp3SWyGU6Y2ZQ8P7vL3m0Qv9EW5gsCWy8+k=;
        b=LqIGD4kI/adKP6DJU3yNojAbROPwI7c8HCNswMsku5C67yi21jKt7EH5eBYoMjjBGI
         I6RgPfLSdZpXiueGjQ2CxUuV/wuU9akZdLZ7+K3w35pjZ8axayL0OhP3KyYPlBMgbEQf
         0IZ0t3YWZIBlXOfyk77KvArWZpFgXVD16YGhLUCVCfAepRKyi8FrqML8Uuq8luxsTcbu
         ulAKj8DtkfsDgzeDaf+yDWybn7CXtGr+pM54mkciYuu3dzvnU1/TzB/AwbZaTdlCCSp6
         ZQKs5ttKd5MuZ5qGT6x6zbck61oUHlwKu3JQD7uk3mODZlGwi79VrXu/FIL158oeFwqS
         cb7w==
X-Forwarded-Encrypted: i=1; AJvYcCXxrXDxO2MthX91iWqshcBItQX9T40nWK9ewJUVNukp1zlLbJtfxSfKz+DoAfH66tqIKqwxEOZiKJ7Bb3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBwuRiVPZTr/4jR/455X/kHLd0fz4y5GTo0tauDHMcuazRHsGC
	z/0ZGprGb0L0/tnWVo35rX/Gm53Ma6g6Lx+Raq/P2R2JN3MERLerVkZ9z00LSZslICe9PMfhG8S
	OPKET1btC5Y04xQ/FBqN+2QiL+aNAe73wg+w=
X-Gm-Gg: ASbGnct6xFPN+WrtYPC4x+NtkqtwsoWZQvi8uOnP7TNGC+mBbXfWBz99V16gpffnT1f
	lIlJT++XNXV4+Pv7NYgsyFRFVnvv/evDxg9Y3MNPJRFKkrEkWcSkA9aFFyjXKcGjy8tQ4CfDrZM
	oIqZK+alx3ZRDk1Q4xzD4RifKrTAZL9LAcVG1XKX6M+G86P1o2Q0Q=
X-Google-Smtp-Source: AGHT+IFT7muf/Vxs1o8pCt5PFOY4VsNRFef6m/B+3PW19ED9YKuGbCGJMgFt1ru5tRZSh3iKhw4E+kHLfwSZYxMRLYY=
X-Received: by 2002:ad4:5969:0:b0:6ea:d629:f492 with SMTP id
 6a1803df08f44-6f2c4636224mr288412496d6.29.1745428990103; Wed, 23 Apr 2025
 10:23:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415184649.356683-1-yabinc@google.com> <20250415184649.356683-3-yabinc@google.com>
 <20250423093253.GK28953@e132581.arm.com>
In-Reply-To: <20250423093253.GK28953@e132581.arm.com>
From: Yabin Cui <yabinc@google.com>
Date: Wed, 23 Apr 2025 10:22:58 -0700
X-Gm-Features: ATxdqUF72f6_dDAXXZfAZUH1pqys_MpJEp8XrE7HUAwBMqB2Ct_VO5XimnZtuhk
Message-ID: <CALJ9ZPMSuSCE8RO=7Jh0im5VoYS_rZf4zJji_8k=FR-CfEzN7w@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] coresight: core: Disable helpers for devices that
 fail to enable
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Jie Gan <quic_jiegan@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 2:32=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> On Tue, Apr 15, 2025 at 11:46:49AM -0700, Yabin Cui wrote:
> > When enabling a SINK or LINK type coresight device fails, the
> > associated helpers should be disabled.
> >
> > Signed-off-by: Yabin Cui <yabinc@google.com>
> > Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > ---
> >  drivers/hwtracing/coresight/coresight-core.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwt=
racing/coresight/coresight-core.c
> > index fb43ef6a3b1f..d9fcea69d221 100644
> > --- a/drivers/hwtracing/coresight/coresight-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-core.c
> > @@ -486,8 +486,10 @@ int coresight_enable_path(struct coresight_path *p=
ath, enum cs_mode mode,
> >                        * that need disabling. Disabling the path here
> >                        * would mean we could disrupt an existing sessio=
n.
> >                        */
> > -                     if (ret)
> > +                     if (ret) {
> > +                             coresight_disable_helpers(csdev, path);
>
> I think we can do better for code consolidation - we can use a central
> place for error handling.  I will give details below.
>
> >                               goto out;
> > +                     }
> >                       break;
> >               case CORESIGHT_DEV_TYPE_SOURCE:
> >                       /* sources are enabled from either sysFS or Perf =
*/
> > @@ -497,15 +499,17 @@ int coresight_enable_path(struct coresight_path *=
path, enum cs_mode mode,
> >                       child =3D list_next_entry(nd, link)->csdev;
> >                       ret =3D coresight_enable_link(csdev, parent, chil=
d, source);
> >                       if (ret)
> > -                             goto err;
> > +                             goto err_disable_helpers;
> >                       break;
> >               default:
> > -                     goto err;
> > +                     goto err_disable_helpers;
>
> I know this is not a problem introduced by your patch - for an error
> case, it returns 0.  This will hide unexpected issues.  I would like
> to suggest to return -EINVAL for unknown types.
>
> >               }
> >       }
> >
> >  out:
> >       return ret;
> > +err_disable_helpers:
> > +     coresight_disable_helpers(csdev, path);
> >  err:
> >       coresight_disable_path_from(path, nd);
> >       goto out;
>
> I am just wandering if we can handle errors in a unified way and
> without using goto.  I would change the code as below.
>
> The point is to use a general flow for error handling, include a
> sink error.  For sink error, we still invoke
> coresight_disable_path_from() for an empty operation.
>
> Also, I think we need an additional patch for error handling in
> coresight_enable_helpers(). If any errors are detected while enabling
> a helper, we should disable the helpers that have already been
> enabled.
>
> Please let me know if you have any questions.

I'm fine with these changes. However, there's one spot below that's
controversial in the v2 patch.

>
> Thanks,
> Leo
>
> ---8<---
>
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtra=
cing/coresight/coresight-core.c
> index fb43ef6a3b1f..cf2a3708a05e 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -465,7 +465,7 @@ int coresight_enable_path(struct coresight_path *path=
, enum cs_mode mode,
>                 /* Enable all helpers adjacent to the path first */
>                 ret =3D coresight_enable_helpers(csdev, mode, path);
>                 if (ret)
> -                       goto err;
> +                       goto err_disable_path;
>                 /*
>                  * ETF devices are tricky... They can be a link or a sink=
,
>                  * depending on how they are configured.  If an ETF has b=
een
> @@ -487,7 +487,7 @@ int coresight_enable_path(struct coresight_path *path=
, enum cs_mode mode,
>                          * would mean we could disrupt an existing sessio=
n.
>                          */
>                         if (ret)
> -                               goto out;
> +                               goto err_disable_helpers;

I made a similar change in this area in the v2 patch, which
contradicts the original comment here.
Mike had concerns about it. I explained my reasoning, but haven't
heard back. Could we get confirmation
that it's safe to remove the comment and proceed to err_disable_helpers her=
e?

>                         break;
>                 case CORESIGHT_DEV_TYPE_SOURCE:
>                         /* sources are enabled from either sysFS or Perf =
*/
> @@ -497,18 +497,21 @@ int coresight_enable_path(struct coresight_path *pa=
th, enum cs_mode mode,
>                         child =3D list_next_entry(nd, link)->csdev;
>                         ret =3D coresight_enable_link(csdev, parent, chil=
d, source);
>                         if (ret)
> -                               goto err;
> +                               goto err_disable_helpers;
>                         break;
>                 default:
> -                       goto err;
> +                       ret =3D -EINVAL;
> +                       goto err_disable_helpers;
>                 }
>         }
>
> -out:
> -       return ret;
> -err:
> +       return 0;
> +
> +err_disable_helpers:
> +       coresight_disable_helpers(csdev, path);
> +err_disable_path:
>         coresight_disable_path_from(path, nd);
> -       goto out;
> +       return ret;
>  }
>
> > --
> > 2.49.0.604.gff1f9ca942-goog
> >
