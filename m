Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4119A19D8A7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 21:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751492083; cv=none; b=ZK2xgN9s6Tu8Q94tIrbaZp0WhrlY2VxPY+XQ/HqjBvfYag7frOGsxpcKFZs7Dz03EsDBOq2tpeMYpVNEt5VCbuxK0o9eCK4M/Ds463jFh3sUY8SmFbCAMwBraWdTBBoU3E9f4lOREfdZDKqPLcH9pzC7XULNhMvRfyMNRHtCdAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751492083; c=relaxed/simple;
	bh=dIvSAKAz9GvFL8eF8f11r9vPU2RPP8HamslypNFwZD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KW9F1l5d2AkHsVBAgFhAEDCUcM5FAcPwgW7E1EMzWyG/3ExukPUAqA5KLxYKZKIooNLMy0OZbU6hgnWDpxfmdgUrP6FythdDjBu0OUspAIZv9N6rpKxSrHCDlSeN3HOIP+nHImeWvgKXWf6Z2piQarEdrGUsNRKOhKHusQeV8gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g5vN7RTm; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g5vN7RTm"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4e7fc3309f2so1789048137.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 14:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751492081; x=1752096881; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SpucKaFQXs24/Gdxy0fvjSfjmEgyvs47syPRCcBg2xY=;
        b=g5vN7RTmr2dk4axdoF6+fBQYjrqtuzDSkkKwE2qN3D5++wg+EINlYQpHCEZgregjir
         PxB6BYNEx95JWOEouYFbV6CC1xmgglD/C3teLwafmArJFhrb+N8Fv55Awyz4Xr9eakbl
         3/07rxUR45dHdjSYE9nzNqO4iQ2eRnjXrliXriidpAEy2SRAt6etWelOwEjy2ZhW7deB
         IlC/WW5Nb65916AW1UmUusK/HlDf3ab+WImdDlMzv7mCE5N6wgENWumi8K3xYGclnWFQ
         o0pqanBauyiXZ3revWzSysJm8NnBU7LLp4Ttx8L+gAliYCtjx5IULcf8SYcDydZ9V2fp
         Nhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751492081; x=1752096881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SpucKaFQXs24/Gdxy0fvjSfjmEgyvs47syPRCcBg2xY=;
        b=e28ZzOnqAEcsAEO4/RU8waqOd5xIYQm8nVWj6Sc6Vqt7VymOU5XDfJLqUmBVLPKbJO
         pjWf4gYuXR4DRi4aAdijbbk0Rfa3RDjIfCiUcfhPuj8dmvTvmteUyUAGWdZbPjNGOAsC
         JvN5QTCFlpCmmuBQ5ilodHHSNzMXCcpWcT+ODVchco7IgJsyTQVpxf5MgQir5CX7DUOV
         H56wQ4YZAvYxdtVzFc/a3rg+ji51qzm80cC8sGwhnlLZkDloAoVh/yjI4KgT9e/jgO/o
         d2t4BYnZW3Y1iXGjyvWySRCczOg48rXNfR5fgmiATgSpRiQHMmdJJ7YNnFJxxc/woNYu
         Qigg==
X-Forwarded-Encrypted: i=1; AJvYcCXEWgA6MnqDmJRbcXKECkPiyJPlLNBysSgvJRxoYFYpgP2NU5jC+d3ZtQalqF36b/ZJgbWfZF2TY0MuNJE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP3WJ7h3EuimOLHtvgug5n0NCbBmFV/sQQneyquwIOyTnkN6Tw
	k+pbGrccHUMzDPGFWm+cYH4B2UlrYfCSZ5Ef5NGjCiZtpAWiMkhblz7UIJTTh6HReTe9qJg5i5h
	QFAr6mwON5Oe/iyr5QCpHuH3wGD4Tvwrnl2+HElad
X-Gm-Gg: ASbGncvFUSs/Qq8fEcRFbeGOuOBgWVm98R6ROiLE4Xc1Ps/dQSqfEzpQ0EqQoxDwMue
	eSuC5cnRGX+EYBAaUIITE8eqwcKvg4F+X8vLGngdfTYU2VgrPk+ksOaeQOyWNSTGB+Shch43wGG
	M8wDYzDRbjWflvjhLeQdHcEL7ZAEIC43f7Yx0ZBmXsrgr6OFntG2DTWKIX5YgEKZCEPgHJaupR
X-Google-Smtp-Source: AGHT+IH1fp/oO8knYExoVI4CZr0MWB4CCN3Ddzd0DoffyBdgk98L0zPZn5aGpXX4Klhx4XnOgbiAKitEu5ixJn7kSp4=
X-Received: by 2002:a05:6102:5486:b0:4e5:59ce:471b with SMTP id
 ada2fe7eead31-4f1613c8319mr3578113137.23.1751492080860; Wed, 02 Jul 2025
 14:34:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <20250701114733.636510-18-ulf.hansson@linaro.org> <2025070205-ignore-passive-17b4@gregkh>
 <aGWH2mH6iZJ3s3lL@pollux>
In-Reply-To: <aGWH2mH6iZJ3s3lL@pollux>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 2 Jul 2025 14:34:04 -0700
X-Gm-Features: Ac12FXzxNwy9Q8y7eUa-yNyxqV22KlOcq4v5ePhyN7HxiHMeoKsg2U5kRHPewzA
Message-ID: <CAGETcx_yVXgvmbDFYe+Nbdp18D-m14W8xO_G9RyAujpag+M9ow@mail.gmail.com>
Subject: Re: [PATCH v3 17/24] driver core: Export get_dev_from_fwnode()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Michael Grzeschik <m.grzeschik@pengutronix.de>, 
	Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Peng Fan <peng.fan@oss.nxp.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Johan Hovold <johan@kernel.org>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Michal Simek <michal.simek@amd.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Hiago De Franco <hiago.franco@toradex.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 12:26=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Wed, Jul 02, 2025 at 09:34:12AM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Jul 01, 2025 at 01:47:19PM +0200, Ulf Hansson wrote:
> > > It has turned out get_dev_from_fwnode() is useful at a few other plac=
es
> > > outside of the driver core, as in gpiolib.c for example. Therefore le=
t's
> > > make it available as a common helper function.
> > >
> > > Suggested-by: Saravana Kannan <saravanak@google.com>
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
> > > Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62=
A,Xilinx ZynqMP ZCU106
> > > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > ---
> > >  drivers/base/core.c    | 8 ++++++--
> > >  include/linux/device.h | 1 +
> > >  2 files changed, 7 insertions(+), 2 deletions(-)
> > >
> >
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> I'm a bit concerned about exporting get_dev_from_fwnode() -- at least wit=
hout a
> clear note on that this helper should be used with caution.
>
> AFAIK, a struct fwnode_handle instance does not have a reference count fo=
r its
> struct device pointer.
>
> Hence, calling get_dev_from_fwnode() with a valid fwnode handle is not en=
ough.

Not enough for what?

> The caller also needs to ensure that the device the fwnode has a pointer =
to has
> not been released yet.

Why? The point of the API is to give you the driver core's notion of
the primary device that corresponds to a fwnode at that instant.

There's no refcount needed for that. This is just a simpler way than
looping through all the devices to find the first device that has that
specific fwnode.

It's only the device that needs to be ref counted because the caller
needs to do stuff with it.

-Saravana
