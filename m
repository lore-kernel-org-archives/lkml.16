Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2F123959B
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 19:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738869718; cv=none; b=Ml2YLOVcIrorCwfa1ZMPJo80Y+s2RqvvPXO+tdEOSu9ioyeuudeMHxYQ5C28NtSntRWhRlHHd9hkjTQG6dna8pX92OmueWY3594leUggIAeLGIHFfX5NdfCjzjB1hZFmvSSTZ8PjU5i64sa5qnKvKqPK6knZZC6PUvtc7Af30hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738869718; c=relaxed/simple;
	bh=lUa04qjMr00cFMUz5RHZRTpCIbh7MZNzkqqom/3g3l4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GRxQu9/BkGOQc7kImMkV1FCzwjqY/7sdIG++Z42pjOv9IXS1Ic3mJZqQ5UGRA+JUT0zVMKc0+HQDONO/lUKYNfx9rWSQftioJdYGlexKeS9Ej3SnRP4KyCsIMRg3pYLMlL+F8y1H4G/xDNHgAxjHLxAigjWeRy2ajWH2Yfja+6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V9WbV33z; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V9WbV33z"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30737db1aa9so12521771fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 11:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738869713; x=1739474513; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iejGLtNphddMwsWcL999rzVMsajm+EjwWDRl83wuIdw=;
        b=V9WbV33zvJD46WjyjAviUW8DFGv2fY+XkIZad35Iwv7T8YgvgsWUAYoYlF0NU6gJRS
         CUj1El54Nadlq3eJXxkjtWyLBozzutekZ85W2B//GgYz9TA+GzAkmNTGQqxDlqwxwYzk
         At5iyCSUoh1FdqsGOavT/65AVJXQKxSKPd/Rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738869713; x=1739474513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iejGLtNphddMwsWcL999rzVMsajm+EjwWDRl83wuIdw=;
        b=swmLs0ULa3ZZn8j/L5DymRgae0E76E3J+FU578jl2QSnTUJwfcUWzIlNtm+VppKe3A
         oy9ILbokSyon2ZO/Vcd/PNyuuYzr2kYYU9ntbmLZFLrE2QSxTHSRQJB5/H0sWPXdEUOG
         aI8i73dnfIvE7uYR5cTAfzsZftluhvyHrjPKZiLRCSNbbVAr8i94fOaF3XoLG5Budflg
         SAjPez7Bomj/mYui9RObzSif6uuTADXtP55tT2WFDHNf+EU8OWsaDoFXA8flIUJIZYSz
         rcUEpEdPRd6CPHoylTmr3/no6bH/Q58jG4AjqjDiRg4zM5Cj39xskt+cTorROzrinBIX
         /qfA==
X-Forwarded-Encrypted: i=1; AJvYcCWpmT/cy6FVLf5dRyah2/uto5ouIYMXsFZYyvPBtcCSTRNJT9G07eus63E+6u6d8/mLh9XfxnwJDzWf1U0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwRWDDGkYtH3aR17Osg0JYJCCHBsteavQP2Ttpr96nb9Cn3vgF
	Vs5HSWV5bMXn/x38R9wrNvY0NruASuEiMRfoZ4eSmzptZKCzyFgQ1H3yKkq1t4B2+5lhN4Prtf/
	cvTYh
X-Gm-Gg: ASbGncuv2Kd7mDRa3BVlf9rF2kP/Uoej6xgjX7JpEfWBdr9JIheUSvVXnWy2jDEMaam
	xcQgArND+gOtS+8bixWe/CUx8sOh0nx7Ccf02+kpfQZ0RBqPEm9D9AzQSagoVe6qbcD8C+e8Qds
	74LTIyLlKmQ74bKBuusrzpw01iqQAdVZF3jSaLh37Z8V8kp84a/QEGRtgfllbbYDAVYXHJx/K3M
	4gx6rz7uyce8fxFJD6bHCcrzNwOajV1nPx9ivl7D+WgTAmjJ5mB0vv7GiKbpQ4/yz37TVOdgVeh
	Oug0zrnaMYoR7wxWkyGUbE5vFKDkT2WeH5UvjhQH/e2lopndY6TPXlPGE9U=
X-Google-Smtp-Source: AGHT+IFY9jkp5SqBi+A3Bp6I+1IPjwYb/iun1Cyq1djmdoTGwjfOFK2lVcsro+C/yCA70hmtY1MVDQ==
X-Received: by 2002:a05:651c:b0b:b0:302:3021:9b03 with SMTP id 38308e7fff4ca-307e57f028emr480851fa.17.1738869713168;
        Thu, 06 Feb 2025 11:21:53 -0800 (PST)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de2d71a0sm2029301fa.89.2025.02.06.11.21.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 11:21:52 -0800 (PST)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30227ccf803so11183341fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 11:21:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXCBEfTRmseRH5eFacRhyBL1SCZMpIzKf7ulKrm6qCAMgIC2rCzKT+cO+bRJ4BTj/6rUfZH5z9A/BrNu2c=@vger.kernel.org
X-Received: by 2002:a2e:be8d:0:b0:302:1d24:8db7 with SMTP id
 38308e7fff4ca-307e57f026amr522881fa.19.1738869711621; Thu, 06 Feb 2025
 11:21:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206131300.1295111-1-yelangyan@huaqin.corp-partner.google.com>
 <20250206131300.1295111-2-yelangyan@huaqin.corp-partner.google.com>
 <CAD=FV=UfWJoUsKzYMkyU3U4Yn1ufAs=NHMCDL+db887Uec9fww@mail.gmail.com> <20250206-overlaid-eastward-610a0d6e34cd@spud>
In-Reply-To: <20250206-overlaid-eastward-610a0d6e34cd@spud>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 6 Feb 2025 11:21:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UqUkKXvEJr5JPHgjNnY_1ALv7TiRY1UQjVGD4_su8M_Q@mail.gmail.com>
X-Gm-Features: AWEUYZmS9xcU_MiFvWfdau59tVoQMHbzAishOQlY882_MKeaoyXcwaaKzpaqmEY
Message-ID: <CAD=FV=UqUkKXvEJr5JPHgjNnY_1ALv7TiRY1UQjVGD4_su8M_Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor: add csot
To: Conor Dooley <conor@kernel.org>
Cc: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>, neil.armstrong@linaro.org, 
	quic_jesszhan@quicinc.com, airlied@gmail.com, simona@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 6, 2025 at 10:13=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Thu, Feb 06, 2025 at 09:12:45AM -0800, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Feb 6, 2025 at 5:13=E2=80=AFAM Langyan Ye
> > <yelangyan@huaqin.corp-partner.google.com> wrote:
> > >
> > > Add "csot" to the Devicetree Vendor Prefix Registry.
> > >
> > > Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> > > ---
> > >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b=
/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > index 42d14899d584..375f1f7c79ef 100644
> > > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > @@ -336,6 +336,8 @@ patternProperties:
> > >      description: Crystalfontz America, Inc.
> > >    "^csky,.*":
> > >      description: Hangzhou C-SKY Microsystems Co., Ltd
> > > +  "^csot,.*":
> > > +    description: Guangzhou China Star Optoelectronics Technology Co.=
, Ltd
> >
> > Doing a `git log` on
> > `Documentation/devicetree/bindings/vendor-prefixes.yaml` shows that
> > most patches use the subject prefix `dt-bindings: vendor-prefixes`,
> > not `dt-bindings: vendor`. If device-tree folks care about this
> > difference and they don't want to fix it when applying, they might
> > request you to send a new version.
> >
> > In any case, that's fairly minor so I'm OK with:
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > I would assume this will go through the DT tree, not drm-misc. If this
> > is wrong then someone should shout.
>
> idk, probably the whole series should go together via drm-misc.
> %subject can change if there's a resubmission, otherwise
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Ah, I'm fine landing it with drm-misc. I'll land it tomorrow unless
there are objections. I'll adjust the subject when landing.

-Doug
