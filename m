Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B47327703E
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747252157; cv=none; b=jOs+s23WxNv34Weuc/yRLs9hE3t9sEb0zSGcyIKK+8DeXBChl/iPcZ0V5TY3zxPR+1mLk6LjToRJeBZdFPSeWnGB7xjEL290qP/jBosGHT2nO02AAshtxgWklxNiryyHDjrFcx9S8DSFD4ojeHbRpWN1QgCyy5HKGrPlSRg4Mgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747252157; c=relaxed/simple;
	bh=tu3E+VpQhbIEijZggilmf8ohmLQphkPrIyuMiy2Iyn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ut8sq33v2l3LgJb/WZGU8BLB4H9DMRknBe+0y2xTzWbCEhHCRXxg1pVaF7I336w4NrZqBhUnyD71i/bDypbj01wexbZF3Ih+N04og0txikbNPsqixNbUFIf8PlKCgCiddOBbydQfwlD3CWQMOg/adDPZoXlBsOmjs/HH5QN6CL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iU4/9UrV; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iU4/9UrV"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-72bc3987a05so185860a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747252153; x=1747856953; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZkh8g9me+Nykm0HQx0KLgmoG9EtGGARK97CTcvbJUE=;
        b=iU4/9UrVFjLLmv260Co+IbJFtnWMh6EXrpgdQ0cAouWMc+EP5ELfEuGELXzksl9P4k
         u6JDGcJG7L39WoSCBnaWSFefD9m/gV0Rn/5TXhv1raiO4XSWZCqFnMXvstH/bi+Ium7J
         gJdX8sLbL/t9LAH/yOMnisP4hoLRMQD1Kyqs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747252153; x=1747856953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZkh8g9me+Nykm0HQx0KLgmoG9EtGGARK97CTcvbJUE=;
        b=PHrW3+rjmkZ6wOD9ejH/5NQuQD6Zj+Uo0hzcmJ10azWR7iTtjQK7WXjOjcpX/xMd3s
         ApuWSdcpHjKOPn2TCiBGL+YkOEKWh+9JkZKMU1u4CFBxMwRZNuLwZLSggds5xdtwPIkC
         43p1LJtIUJjbuT6NqfSLgezl5d8WL/mqsFPAFGlM71kHtaBDUeay+XBU13LaHYtFlPp/
         xat1gekAt7etL6a1qbYQXYAIYupsm6RXUVg1dvPCP91G0XKqUsWJ3vzoraLDUi+gfrPc
         Nt162ZGZxSDoE4ij0jUTU88zJOPG6hsujNKKqNNRGBzGRa4CGiKhiswHdILju4ZJtE8d
         Eo6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWEFQd1U1K2lj8IODpjHmflVmZYIbsTzwTeUlOeBzG/KfUj90qvfdVVkjD8Ozf4j9yFoQPYV6gE4zlLJJY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzJBAP8yFpGUZ1ozj8wR13tb2d5flg1bcUMI1tJWMrLqnKwK5s
	OjzdXcutD2ljKrhvKAKgdxb9/PPwD9YzP2Fur5jskbBI2YBlWEMLBVWLUIIS765CY+TSph+pwGj
	jMLydvP2mGvlhvpNvc64rJ8aTRgT/upTbzPNY5pYR2YPUc9O116dM
X-Gm-Gg: ASbGnctedxIX4etscyAvC2nsP7mIpctWY+Dbi16cujd61UXCl8+6WX2bykkit+CTpMh
	Xk8DkAX8u2e+zUn5YSA6vzCn1uXZ7IFjEn8eILybHYmYBZa4WM/VtuyHhUdJiPWeWOXhvXQ7snV
	O+h6QRZ2URnUP7dj8pcVM7yeRKvV24CcwrOjxKMdmVD7DcJ6n3EUp95jZTqQVmXA==
X-Google-Smtp-Source: AGHT+IFCJSg8hIfl+Y+fxKZiYgrSWqqDLysVmocjXAAcg6uBcAFRx9APEaATMEgkLVcMFoVK/5iaOwFvZXjnUM20XV4=
X-Received: by 2002:a05:6830:3814:b0:72b:8593:d3eb with SMTP id
 46e09a7af769-734ec6bf6bcmr531328a34.2.1747252153472; Wed, 14 May 2025
 12:49:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240410000730.628043-1-treapking@chromium.org>
 <9c5aa4fb-a83c-470e-acf8-dd31303e50c2@collabora.com> <77c4437f2643475de495733d7840421198b78f49.camel@mediatek.com>
In-Reply-To: <77c4437f2643475de495733d7840421198b78f49.camel@mediatek.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Wed, 14 May 2025 15:49:02 -0400
X-Gm-Features: AX0GCFtecwOi8CEP2jK1ekxhH3Moa-nChPFzhyIRNlzu-0bbcdPxgTRcYXfWwSA
Message-ID: <CAEXTbpdNxFd7-RMXyvYraqC5cj_BgycAO6JWdNUo50DVn+yntw@mail.gmail.com>
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: Remove redundant
 code in lvts_ctrl_configure
To: =?UTF-8?B?Q2hhbmctWWkgTGluICjmnpfplbflhIQp?= <ds_chang-yi.lin@mediatek.com>
Cc: "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "nico@fluxnic.net" <nico@fluxnic.net>, 
	"rafael@kernel.org" <rafael@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"rui.zhang@intel.com" <rui.zhang@intel.com>, "lukasz.luba@arm.com" <lukasz.luba@arm.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "duminjie@vivo.com" <duminjie@vivo.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"bchihi@baylibre.com" <bchihi@baylibre.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	Nicolas Prado <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chang-Yi,

On Wed, Apr 30, 2025 at 4:26=E2=80=AFAM Chang-Yi Lin (=E6=9E=97=E9=95=B7=E5=
=84=84)
<ds_chang-yi.lin@mediatek.com> wrote:
>
> On Wed, 2024-04-10 at 11:55 +0200, AngeloGioacchino Del Regno wrote:
> > Il 10/04/24 02:07, Pin-yen Lin ha scritto:
> > > The removed variable assignment is never written to the register,
> > > so it
> > > has no effect on the device behavior.  Mediatek has confirmed that
> > > it
> > > is not required to initialize this register for current platforms,
> > > so
> > > remove this segment to avoid confusion.
> > >
> > > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > >
> >
> > Added Nicolas Pitre to the loop;
> >
> > Nicolas, since you're pushing support for those, can you please check
> > if CALSCALE
> > is used/useful/necessary on MT8186/88 before I give a R-b to this
> > commit?
> >
> > P.S.: Can anyone from MediaTek please confirm if the 0x300 value is
> > right for this
> >        register? I'd still like Linux to properly initialize the
> > registers, even if
> >        this could technically be a default value.
> >
> >
> > > ---
> > >
> > >   drivers/thermal/mediatek/lvts_thermal.c | 6 ------
> > >   1 file changed, 6 deletions(-)
> > >
> > > diff --git a/drivers/thermal/mediatek/lvts_thermal.c
> > > b/drivers/thermal/mediatek/lvts_thermal.c
> > > index fd4bd650c77a..48d2f8ba3f18 100644
> > > --- a/drivers/thermal/mediatek/lvts_thermal.c
> > > +++ b/drivers/thermal/mediatek/lvts_thermal.c
> > > @@ -985,12 +985,6 @@ static int lvts_ctrl_configure(struct device
> > > *dev, struct lvts_ctrl *lvts_ctrl)
> > >   value =3D LVTS_TSSEL_CONF;
> > >   writel(value, LVTS_TSSEL(lvts_ctrl->base));
> > >
> > > -/*
> > > - * LVTS_CALSCALE : ADC voltage round
> > > - */
> > > -value =3D 0x300;
> > > -value =3D LVTS_CALSCALE_CONF;
> >
> > As a side note, I believe that the original author wanted to write,
> > instead...
> >
> > value =3D LVTS_CALSCALE_CONF;
> > writel(value, LVTS_CALSCALE(lvts_ctrl->base);
> >
> > Cheers,
> > Angelo
> >
> > > -
> > >   /*
> > >    * LVTS_MSRCTL0 : Sensor filtering strategy
> > >    *
> >
> >
> Base on xiaojun.zheng
>      The register is for PTP function, and in MT8192 it's not required
> to do such setting any more

This driver is now also used by mt7988, mt8188, and mt8195. Could you
confirm if the PTP function are not required for all these SoCs, so we
are safe to remove this?

As a side note, Mediatek explained PTP in an offline discussion with us:
PTPOD stands for PTP (Performance Thermal Power) OD (Overdrive).
PTPOD is a technique to let the HW runs at the same frequency but with
lower operating voltage to save power.

Regards,
Pin-yen
>
>
> ************* MEDIATEK Confidentiality Notice
>  ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including it=
s
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or beli=
eve
>
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!
