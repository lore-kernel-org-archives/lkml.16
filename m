Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEB527735
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743601837; cv=none; b=YaHB1V1cuirjjW1uowX7IAVHRp47FufXySWY04jdcuuLxQvPxPVgc45E+vTYZT9wWG38qS6RkdLnoSmW2xYN5tuAM256Z5UcE5ucPzL8IftxlV4eASVfUm0Igmp6AT+tKua0y8AfDXhQHD2KhLfxoXD+VcAJv2EMoek8ZFEuOdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743601837; c=relaxed/simple;
	bh=pDeoNhuZwaw4msWO9MsOr3hBwwR4u8GBkPAPBUJEMZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F2axyc/tYRFnfvKHYyTt8hxxvpymDvtHXT4Nqu9VFBoIciqPhRTZOwLxWlJwWlKvEh//pae6O03uex44NXDCzT42bCtVDsOhvodS1ui6pK4DbNQX5rgx7XHkjSoMfRhULkOfTplF/O/Ryarq2ddo5bp+cAg1i2XH961snjQNI/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y1ofJ6xw; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y1ofJ6xw"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736b0c68092so135696b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 06:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743601835; x=1744206635; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HMguzqC9j9EV0of1YoNXfPm1mjs9rcmoyuc3Vef0Cg=;
        b=y1ofJ6xwXo7/+9LUzV6klWp0V3CaDV03OeRSZF86VC6DC0RwtrX5MEufKlpmSWSZAx
         odVdGw9MITCjJS3bdLorbptVhLYt3mMsGJQhQmo8AwhRh70tMBtkW5Rww7oRv3fnnNmx
         mcP3kWCX9RpAQkpJjL0OtIxEwKN7VixcnOlTWPxAF20Iezz8f+G7KMNcMZNka48XvZcT
         r+KyzD/STHQplB8GF4H3MJNvpJYVXXzxG+qYPOuW3Qv8HqVBhvZfFRCOY7igOBsQ+4b6
         1y3mORai6OAQk4O8Wan6KuPJVn8fJPmOe7CHQs3s9M7cmRFEfrlDGcasQ6z/cU9Y8Ior
         HE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743601835; x=1744206635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2HMguzqC9j9EV0of1YoNXfPm1mjs9rcmoyuc3Vef0Cg=;
        b=IW4yWzy/0qn1hlchrerA30FNDTq1DVcEZWUdby71QPtjFWLy9W2SHJJ3wA7+g7irFP
         jaenBk2dC8vZTLnlL9jQvmwxTOgPPp/l0tvShlR0/QvaubcSRdC+bSoc/xyFqVCfTtUt
         IQDmA7QQ2NNw5/h4zZcyd0NwXlsOCILgNzkVDFgNr7bVGr0cUk35UhO2NrP47f7e+UMv
         qj4VoYcezutugabaF+S81gOFMRJWdZlqS6q9UvsnLHM0BFQnQ78nzTo/Ypq6kGxZcuas
         HSyfrif37p6VWJLl2dJ83rppM4CZbGDJQCAHvnkEyS4yxESDiyr/NxSBGWB7YookMBmY
         1GtA==
X-Forwarded-Encrypted: i=1; AJvYcCWSDkMc45ghcX3pA6CDX7pBkEUzUQGOUyXlEkpibrInaiiPlN/5KipxurCCQGcMrElJzY+FsSZvGb1KTn0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yypp2fAyirny4Zqk6InGvgCMyF67M6mM5Tob+xRuMF/RDqPmk3m
	0RhGzgIvnYLtQi+mBOyw4ITuCmBiaLKM4m9zeOufjhF79eJ9KLQS1ftRXt2gtHZ19qKZATTw+tO
	3hx3IE8boJoX4uDj5CJQD005iqY1yiqMPJlSHWg==
X-Gm-Gg: ASbGncun/9K/HCFEMdFim2eeCWob2S9HKFiWu7OLBTb/hTJuC61vqwADFWMiT/YJMZd
	iB6HQr9224+iqj/p/QthDJQ1PLVXNPQjC6RsGlnNFI8RREwkC3IU+90EANPLaOLZ3SUgtcfFQH+
	CMANKLSBNfm4n/Wc57GlkSQvMSsbk=
X-Google-Smtp-Source: AGHT+IHp7t8r2pydSNbANhxJKeymRIZ/eKV+x2OT6vup6idos5f2KZpXXuu/OXbiS7W8QYIoIkAWymldruKbA3f2VXo=
X-Received: by 2002:a05:6a00:1942:b0:736:a82a:58ad with SMTP id
 d2e1a72fcca58-739b60fb517mr8295648b3a.15.1743601834707; Wed, 02 Apr 2025
 06:50:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402011832.2970072-1-yabinc@google.com> <20250402011832.2970072-4-yabinc@google.com>
 <CALJ9ZPOvcxswvfbpWkXgJ=WL+HLa33nm0ZzHogYNZ9keXfi1MA@mail.gmail.com> <20250402133232.GJ115840@e132581.arm.com>
In-Reply-To: <20250402133232.GJ115840@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 2 Apr 2025 14:50:22 +0100
X-Gm-Features: AQ5f1Jq5mPtgzeoLUURAuYqDE_iAPk5v6h-VWiYx7OA5tNNn0TL6E8vkrRSIDow
Message-ID: <CAJ9a7Vg4DGzPhnSBh2taTgUTORMY3GUPpJY2bHjkMdFB1=wP=Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] coresight: core: Disable helpers for devices that
 fail to enable
To: Leo Yan <leo.yan@arm.com>
Cc: Yabin Cui <yabinc@google.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 2 Apr 2025 at 14:32, Leo Yan <leo.yan@arm.com> wrote:
>
> On Tue, Apr 01, 2025 at 06:22:46PM -0700, Yabin Cui wrote:
> > On Tue, Apr 1, 2025 at 6:19=E2=80=AFPM Yabin Cui <yabinc@google.com> wr=
ote:
> > >
> > > When enabling a SINK or LINK type coresight device fails, the
> > > associated helpers should be disabled.
> > >
> > > Signed-off-by: Yabin Cui <yabinc@google.com>
> > > Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > > ---
> > >  drivers/hwtracing/coresight/coresight-core.c | 12 ++++--------
> > >  1 file changed, 4 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/h=
wtracing/coresight/coresight-core.c
> > > index fb43ef6a3b1f..e3270d9b46c9 100644
> > > --- a/drivers/hwtracing/coresight/coresight-core.c
> > > +++ b/drivers/hwtracing/coresight/coresight-core.c
> > > @@ -465,7 +465,7 @@ int coresight_enable_path(struct coresight_path *=
path, enum cs_mode mode,
> > >                 /* Enable all helpers adjacent to the path first */
> > >                 ret =3D coresight_enable_helpers(csdev, mode, path);
> > >                 if (ret)
> > > -                       goto err;
> > > +                       goto err_helper;
> > >                 /*
> > >                  * ETF devices are tricky... They can be a link or a =
sink,
> > >                  * depending on how they are configured.  If an ETF h=
as been
> > > @@ -480,14 +480,8 @@ int coresight_enable_path(struct coresight_path =
*path, enum cs_mode mode,
> > >                 switch (type) {
> > >                 case CORESIGHT_DEV_TYPE_SINK:
> > >                         ret =3D coresight_enable_sink(csdev, mode, si=
nk_data);
> > > -                       /*
> > > -                        * Sink is the first component turned on. If =
we
> > > -                        * failed to enable the sink, there are no co=
mponents
> > > -                        * that need disabling. Disabling the path he=
re
> > > -                        * would mean we could disrupt an existing se=
ssion.
> > > -                        */
> > >                         if (ret)
> > > -                               goto out;
> > > +                               goto err;

Going to err here is wrong. The comment above specifically states that
we do _not_ want to disable the path, yet the new code flow disables
helpers. then falls through to coresight_disable_path_from() - which
the original code avoided and which also disables helpers a second
time.

Please rework to get the correct program flow.

> > >                         break;
> > >                 case CORESIGHT_DEV_TYPE_SOURCE:
> > >                         /* sources are enabled from either sysFS or P=
erf */
> > > @@ -507,6 +501,8 @@ int coresight_enable_path(struct coresight_path *=
path, enum cs_mode mode,
> > >  out:
> > >         return ret;
> > >  err:
> > > +       coresight_disable_helpers(csdev);

Drop this - put it where it is needed  in the flow

Regards

Mike


>
> Given it is unconditionally to enable helpers, I would suggest we
> disable helper unconditionally.  Thus, we don't need to add a new
> 'err_helper' tag, simply reuse the 'err' tag would be fine.
>
> I would like to know if mainatiners have different opinions.
>
> Thanks,
> Leo
>
> > > +err_helper:
> > >         coresight_disable_path_from(path, nd);
> > >         goto out;
> > >  }
> > > --
> > > 2.49.0.472.ge94155a9ec-goog
> > >

coresight_disable_path_from() also disables helpers.

--=20
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
