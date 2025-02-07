Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6CF198A19
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 17:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738951158; cv=none; b=XS2ATABW8NpNdkRDBz9Nzm4rsV8YD03+wDO5knfFci6MiwRV3ro2Cg/V4af685twYnhKsM3tPh0zbWnhdyqq6k8/8QYuVDfawr0k4BtS00NTS2dW7UxYTy6id807dZn1+GByFiYaYBZT41CQR6D9qvu1SR3pBS63R43+lakNAvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738951158; c=relaxed/simple;
	bh=yjImdBucZgKfFi/AfVlFm3SkAQG+R90KnnFQAcqGKmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZBlINdgGqikWPylQlKUFCN+xzEVW9s6n/oLfnaozcptuYGpwjR11H4oyDbHLrkHJBjmPLZsgdEyY7GNNnyGhWeomWSd568lmCtdI/Dhfdv1f9Ek1REOHUxprQH2ES0KfT2BDM3tDZOxKLr1sU8EQopj7b/jfA9D/+1yo1ErrOjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iYSWIBrA; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iYSWIBrA"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-543e4bbcd86so2666209e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 09:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738951152; x=1739555952; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZIsw/eph0Ja1f9gKiHNlo33ou4ZjPNWGIGZAe/rGfE=;
        b=iYSWIBrAW9EqEip1WBJ524myp4/wrprueatO11aHZ5lJHbLKnkrkX1eaBc1IgouNSp
         Xo+8TW+zB2rN5p3JxAVRhEHHNLhB3aRhGyvZaD+ijx3Jl3icblciTic6b0nYDF/76FXK
         f5pERfa32gQayXJYnDziWu5KKfczSyJTSgk9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738951152; x=1739555952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZIsw/eph0Ja1f9gKiHNlo33ou4ZjPNWGIGZAe/rGfE=;
        b=qbQNEakr6+SfmC913G2uuA1QGUYqUFOxCCyqW9k6O0fYzA3hhv5rxXV0N83icDjEOD
         QJc0CM17cWm7CtPevWsRPF5r6eQYePHiDi74q+dQ3F/tXSNK0OaTxhz9gU1sLkOUTcgA
         ZKyZFFv9evKwb7RYYsPxm/3PCUeZ/1/CthKlKE/UAdHBj80A6YKkuUYeacivSZ5TLVkh
         vP2BqAj/RZhn/PuXTDW96fMAmtyOEZuQyrWBR0XD/TD0qd9MosXdhUyqwFY/jEl38Msc
         LN2z3DgWbDkRNttNssPPSmdBp6diKMHEm0OhMClZsj9xsX929V3kO1kXOUcctoJhNJ8G
         8caQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVlcjCRgZc2rAIgLK3abIruQeQMYk9UXKnPQKnep2BQA8uCNhIgIs24rJI64w1bdJRpFNt964YBL/JoT0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl7embB2cKvDxhzguZI0NtuVsbOVTCHmrygxRkLIbg2veCLgRf
	Ctb6po5X22Pammdk8+XIQT1ZoQZioSFiRxJhMYJj0T2jSSXQtBW3LJHGSmXQJ10KzOmFWeYdIT0
	18/3P
X-Gm-Gg: ASbGncunI41UL78z3wfT+MbidQMMGrYhiMZHsq6aXIDtkqwbn0K55PEzqP674ugpU2B
	QfjTtTTI9J/3+qeM8YHt5FT1s2V9chpuudyg+NfNe+3dzBQBIaLz48FO21PNoDU1VXEd+nlGefZ
	VXLuA/GyyKDkt8UHdKwFv3V+bhjlKTzDViChWIRTS9M3dfkDes4ldbrvEG992qT4U+9Ax5gXrUH
	VDymTmj9pXVCMRSYeRwf4HIKU4q3nrhu4Q2TYkNjj0zsmshEKrR1lGUlE5tWbuwlxNjtsGzwd2l
	xjQxA8ggM26bjLeFhaOMX8j373nMfPKp04KqP1c9jWyWYEo2PDtir60=
X-Google-Smtp-Source: AGHT+IFPxpamu7vI++PtvqBMqi8FZty23PGGmBpHe9Q47rebw4bhOElBJ8FeEfRqwaCb+6+9RSxOVw==
X-Received: by 2002:a05:6512:5d3:b0:542:28a9:dca2 with SMTP id 2adb3069b0e04-54414b01bf0mr1288161e87.39.1738951151808;
        Fri, 07 Feb 2025 09:59:11 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544105bf655sm516200e87.158.2025.02.07.09.59.09
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 09:59:11 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5440f22aabdso2170045e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 09:59:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXGU2srVNLzvHDdcC5tqmuzSKI4PJ529yviWYwEiJ+h3o4T64pQAnAVnsx5zO9uUiqVGZJ+7APZR9A2xbc=@vger.kernel.org
X-Received: by 2002:a05:6512:e9b:b0:542:7053:ef1b with SMTP id
 2adb3069b0e04-54414abb2d3mr1390120e87.29.1738951149433; Fri, 07 Feb 2025
 09:59:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206131300.1295111-1-yelangyan@huaqin.corp-partner.google.com>
 <20250206131300.1295111-2-yelangyan@huaqin.corp-partner.google.com>
 <CAD=FV=UfWJoUsKzYMkyU3U4Yn1ufAs=NHMCDL+db887Uec9fww@mail.gmail.com>
 <20250206-overlaid-eastward-610a0d6e34cd@spud> <CAD=FV=UqUkKXvEJr5JPHgjNnY_1ALv7TiRY1UQjVGD4_su8M_Q@mail.gmail.com>
In-Reply-To: <CAD=FV=UqUkKXvEJr5JPHgjNnY_1ALv7TiRY1UQjVGD4_su8M_Q@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 7 Feb 2025 09:58:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W-faj7O=pYVeLuM1Fqj4BnyxzD2L2Tf+GRbdkAo3Kk7A@mail.gmail.com>
X-Gm-Features: AWEUYZkN40y1BSrM1hbsqCvffOXn5hViKgff7psR1NbkWrBJyE7Wzq5bYUwiG1E
Message-ID: <CAD=FV=W-faj7O=pYVeLuM1Fqj4BnyxzD2L2Tf+GRbdkAo3Kk7A@mail.gmail.com>
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

On Thu, Feb 6, 2025 at 11:21=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Thu, Feb 6, 2025 at 10:13=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Thu, Feb 06, 2025 at 09:12:45AM -0800, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Thu, Feb 6, 2025 at 5:13=E2=80=AFAM Langyan Ye
> > > <yelangyan@huaqin.corp-partner.google.com> wrote:
> > > >
> > > > Add "csot" to the Devicetree Vendor Prefix Registry.
> > > >
> > > > Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com=
>
> > > > ---
> > > >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml=
 b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > > index 42d14899d584..375f1f7c79ef 100644
> > > > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > > @@ -336,6 +336,8 @@ patternProperties:
> > > >      description: Crystalfontz America, Inc.
> > > >    "^csky,.*":
> > > >      description: Hangzhou C-SKY Microsystems Co., Ltd
> > > > +  "^csot,.*":
> > > > +    description: Guangzhou China Star Optoelectronics Technology C=
o., Ltd
> > >
> > > Doing a `git log` on
> > > `Documentation/devicetree/bindings/vendor-prefixes.yaml` shows that
> > > most patches use the subject prefix `dt-bindings: vendor-prefixes`,
> > > not `dt-bindings: vendor`. If device-tree folks care about this
> > > difference and they don't want to fix it when applying, they might
> > > request you to send a new version.
> > >
> > > In any case, that's fairly minor so I'm OK with:
> > >
> > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > >
> > > I would assume this will go through the DT tree, not drm-misc. If thi=
s
> > > is wrong then someone should shout.
> >
> > idk, probably the whole series should go together via drm-misc.
> > %subject can change if there's a resubmission, otherwise
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
> Ah, I'm fine landing it with drm-misc. I'll land it tomorrow unless
> there are objections. I'll adjust the subject when landing.

Pushed to drm-misc-next with Conor's Ack after adjusting the subject:

[1/3] dt-bindings: vendor-prefixes: add csot
      commit: 75e80af7d62e0dde006c23aec67b9ec8037324db
