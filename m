Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96011C6FEC
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 19:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748374352; cv=none; b=Wg4ZlmlqvlwRGeJSByK01V+yuGZeXGEczKUqYscx7+4ThdKwnzuevoZuJcguyE4PMoHt2wp1E0wmrFHKe7bmHdEjJc05igrQuCL/x48f6pXaSJ+dsF1SqvxqjNPzc6ogQUwQSZBm03zkn+3vZUzJeS/RtcOqNkWbP6oH1dqqLhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748374352; c=relaxed/simple;
	bh=uzFA3ilBQ504lpBzuzMHiBkcD8tJcsjTFHHxhNpX7Dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BIl/b0JfC3DyR7mQDF0MXV6ZoWvU6Og3fIMAITJq0nUA5Ct9IJsuQaNMpUXiDSjLnPMkZH2KwVBG2m26ow2c6/fS885EYC9IwZkJwv+3tOYVpAPM5ccMk8d3RQ0Onu1ONYdrHk3CIZNRQ0N6hAc9L3TsQXJ+3nta8rhIIviIn4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=V7jAMbPL; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="V7jAMbPL"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-70a57a8ffc3so32344997b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748374350; x=1748979150; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAMW61EAomfw/fUNyk8GW0NVdz9vS8vCzbD7XJ2g2mk=;
        b=V7jAMbPLHTUYE+G6aQubFXk6ZDcFzXRkLgbnbVg1n+GuqNUrKVGN7G0yhRA55+kZDS
         pWUfivBFJWCBZtyVgZYtrBFlvgiP6GXWdiLZN4pWbt1g+uZSfuHAKvZ2mz/WzHLVRNaF
         ifaJUXP2dKokwhVradYbYyZLVH8ykIR4GX3qI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748374350; x=1748979150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RAMW61EAomfw/fUNyk8GW0NVdz9vS8vCzbD7XJ2g2mk=;
        b=feQJnTGwROd/HTCC7pul7v48zDCCfOpqR8lYOCBF6dC2pbYgBoTJiQC/Sg3kT1IE4F
         u8lZH6Ilcu9ft1iw5spwli6XaFiAg/yvgi/D69+e5VtKPoC39R0quklxHxRCGrGqWIVI
         1Zc8FxoH9FnPLVIRG+EnCMh5vOFkBlq0u3UcgL8pktXUVs9mZku5K+XK9l0LhjT9SwG3
         BeVflV/BiG+t+OMAxONVXREspgkyXAMkGjRMndTdvcmkTaNHRCGFMxlFl+UDvmaIbJTF
         PVxHb6jNvZ/gKxTis+5QVnhVcrgC+NGyF+q7DKg2GcQZqYaf1Zlr4zF3MpzsqFE/WIDl
         j+Lw==
X-Forwarded-Encrypted: i=1; AJvYcCXSobLnFDWxWS5UnINX/mQ/116k5pxeHRGwsb7yKYC8qZDPVx5JtLttXpNDDxmSFDJe0qMIXWIS4tb5LFc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwntIU3X3YWIyjK8/AlnrJv+jKyBgCXGQ1ehUEdlAYn4uK4r+a3
	NnItjr0y4acIV8SMiTkXzSSlCc8z0XqjHzCWtMSceyFWTTzyoHo9/U3hwn3qE7CQzJ1pA9zMbki
	D4Z0/4kh5/3pvEfvLYtnfSqZtxFkLKKNNeTG+QGhIYw==
X-Gm-Gg: ASbGncuRpu3ipzAUF5BeXl94+fcNz+L5QWwm1XoFlaKqSkohKMLq0PJYC07X9fduLcu
	18qKHFy8unsY1Soyw612oZ9jkPKpFcUJIXf45TCw3jaS2DCwxAN3IB/SueP/h5zA++MK1PXjzaF
	fEA+98YB5+/YWH6+7PKNot9J9UnqQtWaw=
X-Google-Smtp-Source: AGHT+IHpKdA2pbbNG4OrRbDcCpmkqycRDPThJP4yF+uhXUiU6y0MFBDvKQJkquESUTC+W3my9RdaR3/1y98M7NJ8QHE=
X-Received: by 2002:a05:690c:6083:b0:70e:2355:3fe0 with SMTP id
 00721157ae682-70e2d9daa58mr179805047b3.16.1748374349722; Tue, 27 May 2025
 12:32:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
 <174643143452.2950397.16722215892279685541.b4-ty@linaro.org>
 <CABGWkvq=pXhrzyCV2ABvQ3uwx4qKYL_G9280p5ECb8nsJ859yw@mail.gmail.com> <b2ed96a4-a236-4ea2-9e02-6896ff03caaa@kernel.org>
In-Reply-To: <b2ed96a4-a236-4ea2-9e02-6896ff03caaa@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 27 May 2025 21:32:18 +0200
X-Gm-Features: AX0GCFvlrZYhHqibbEv_6cXxIS8smjjQnIVNkeTDjWWzyIinppoBbEgrE74Khx0
Message-ID: <CABGWkvpu+quSY1y7u7eXOuiDLz8j2Sgs=sn=muZW80e-vNnHbg@mail.gmail.com>
Subject: Re: (subset) [PATCH v12 00/19] Support spread spectrum clocking for
 i.MX8M PLLs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	linux-amarula@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 8:42=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 23/05/2025 17:19, Dario Binacchi wrote:
> > Hello Abel,
> >
> > On Mon, May 5, 2025 at 9:52=E2=80=AFAM Abel Vesa <abel.vesa@linaro.org>=
 wrote:
> >>
> >>
> >> On Thu, 24 Apr 2025 08:21:30 +0200, Dario Binacchi wrote:
> >>> This version keeps the version v9 patches that can be merged and
> >>> removes the patches that will need to be modified in case Peng's
> >>> PR https://github.com/devicetree-org/dt-schema/pull/154 is accepted.
> >>> The idea is to speed up the merging of the patches in the series
> >>> that have already been reviewed and are not dependent on the
> >>> introduction of the assigned-clocks-sscs property, and postpone
> >>> the patches for spread spectrum to a future series once it becomes
> >>> clear what needs to be done.
> >>>
> >>> [...]
> >>
> >> Applied, thanks!
> >
> > I was surprised to see that the series has been removed from linux-next=
.
>
> Did you miss entire email thread explaining why? I think you never
> answered to several emails in this thread... and we - including myself -
> sent them a lot.

I don't think so:

The answers related to the errors encountered during DTC compilation:

https://lore.kernel.org/oe-kbuild-all/CABGWkvp7n=3DOr-OqnLoOJsQQCHF+=3D8eQ9=
EV5=3DO+Qp4sQF49_DbA@mail.gmail.com/
https://lore.kernel.org/all/CABGWkvqfyH=3Ddcuw6EDZaFVVebj8SZhJF0P944+mmzL5Y=
K3-Pug@mail.gmail.com/

The patch to fix the regression reported by Mark Brown:

https://lore.kernel.org/all/20250516134945.14692-1-dario.binacchi@amarulaso=
lutions.com/

Also successfully tested by him.

And when I didn=E2=80=99t reply, I was expecting the maintainers to handle =
it
=E2=80=94 as Peng Fan had requested in version 10:

https://lore.kernel.org/all/20250314093503.GD12210@nxa18884-linux/

I may have made some mistakes, but don't tell me I never replied.

After all, anyone can make mistakes:
https://lore.kernel.org/all/d421a6e8-e72c-48d9-8806-09724723b5d8@kernel.org=
/

Best regards,
Dario

>
> >
> > It=E2=80=99s been 8 months since the first version dated September 28, =
2024.
> > The most critical phase was version 3 -
> > https://lore.kernel.org/all/20241106090549.3684963-1-dario.binacchi@ama=
rulasolutions.com/
> > -
> > where two key issues emerged:
> >
> >  1 The CCM design is flawed because "in the current design, CCM is
> >    taken as the producer of CLK_IMX8M_VIDEO_PLL, not the consumer."
> >
> >  2 A driver for anatop needs to be implemented because "using clocks
> >    to replace fsl,ssc-clocks is possible under CCM mode, but you need
> >    to develop the fsl,imx8mm-anatop clock driver."
> >
> > These development guidelines, agreed upon with Krzysztof and Peng,
> > enabled a coherent implementation of both the DT bindings and the
> > code. The following versions, from v4 to v8, were necessary to
> > review and refine those implementations, bringing us to January 2025.
> >
> > At that point, Peng opened a separate pull request -
> > https://github.com/devicetree-org/dt-schema/pull/154 -
> > for the definition of general-purpose DT bindings for spread spectrum
> > handling, which ended up invalidating mine.
> >
> > While waiting for his pull request to be accepted, I submitted version =
9,
> > trying to at least get the patches for the anatop driver merged,
> > eventually reaching version 12.
> >
> > This final version was merged, but then a few days ago it was dropped.
>
> And explained why. There were bug reports which you completely ignored.
>
> >
> > As it stands now:
> >
> > - We still don=E2=80=99t have proper spread spectrum handling
> > - Peng=E2=80=99s pull request has been stalled since February 20
> > - We don=E2=80=99t have a driver for anatop
> > - The CCM design remains flawed
> > - Not even the first 4 patches of the series were merged =E2=80=94 thes=
e were
> >   simply a replication for i.MX8MM and i.MX8MP of patch
> >   bedcf9d1dcf88 ("clk: imx: rename video\_pll1 to video\_pll"), which
> >   was already merged some time ago.
> >
> > Could you please let me know if you're still interested in this series?
> > If so, could you suggest how to resolve the issues that led you to drop=
 it?
>
>
> You got several replies what is wrong. Can you respond to these instead
> of coming now surprised?
>
> Best regards,
> Krzysztof



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
