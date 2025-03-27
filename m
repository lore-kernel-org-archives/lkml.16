Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D56842AA1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743085960; cv=none; b=KHEtRe4h5ZjtkIGlLmIfslxRRm1GOVqQBwVZSPIVOkc5Hs/m4aO3oL4A6R/6MExrStBzDVUZElt0m6WNm4fsS1r4W9TUNRgC/3tOgQc3C7sswPj9ZdF1TFC2mtqp49MAMFl05tHrcoaV3SnmNVRm8YPhfs3goaRjruNoZGSq7Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743085960; c=relaxed/simple;
	bh=pST6bPwJimChjUpXQaK6XwudzjkNFGRi/Vj1RD83JVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qHvRXIzX5zuQLEZAyBq3NSnVh1chLbUTRPOXgWk91PKmoO9DCgD7+ORlkxHo9SXJqIvgwnAEdmPV/txgTQzKn/ss8ynG7hxY/+HoYGS2rEUdAdLACBr6W8QO7f2rwFnOJcUC/FYHYuBRc1JgHG8SKphRjMjbu00i6IZ0Y4u8t2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=mkiry0tY; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="mkiry0tY"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6ff07872097so9578947b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 07:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1743085956; x=1743690756; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woUs5DesLsfHklKKMhNOlVBZM+rfK8BJ56Zkt5kMqi0=;
        b=mkiry0tYrOaIUJpqlirMFwWyLRLf8OxCDhrEBDOVJfYbPrABHRwy2/BP9gXzXBsl53
         aR+1mc5TO5WROlHe7XII6ssVKt18aX2QnFGvVPWqD1+wfUzAN+2pbYslepD7i5BtXUDc
         08L/MEas8PQjdSTkzr6xwu0Z4WAeWRLxI8wVz8FGqP+oRS/s9VBtMhT+qMUJOEP2gluC
         H2anZDkdcejwYu58yjre/BbBFYULMeCz3Nhbjm419BNakHz9vjJ1Xj2EPTTSHZg2L8di
         4bUAZXlWBkGC/4Z0zktYe5GZAvpRFzJAnlye6aPgsdYjw/ekC5bmQJygYa2ywHXDuIYD
         a7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743085956; x=1743690756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=woUs5DesLsfHklKKMhNOlVBZM+rfK8BJ56Zkt5kMqi0=;
        b=LQ/2AsNhCtyGIzjo/8nVHHaV9D0MteH2WLSluQfleIz13CuwOq6/7m62/8X0ggQHmn
         Wm4GiMfpp4Dul2EVrPr7VQNT/i+2dt0vpukM0qKxClbPhSnMJ8Cq1sn+kMMhrW7rOlLG
         uX3/sIy51PnRP3paDU7AXsIU/Vwo5qgh4I4TbEdxp6izcDIrvJjzvVNLUybtsT0nSPY5
         f+W6BKNKkybjMyZ/8smGhz5IlSKKo01koETU1kO+vD/sKgZ9VKyMLQeclsrJX1eY7DzQ
         GIBKw1O4SW8BOSbRcHG3wWRq3L/lcxtvw4lQbq528AKbMoVfoJYbK3SWglel3QIaUtDm
         eNog==
X-Forwarded-Encrypted: i=1; AJvYcCXhFgRF92yLq5e78VAM06i+0Iz7cNwhuAuy7p1gv4WdKpsKvk5R0l3e8JgaOyEjSiSNMYacVCWCmUvPfLw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxDXfM1CVstPaHM4DtQwsvbzRePtqIB3vurqhTx4Y7xbyKjvHq
	Hy4wIp6OXrV4OfuVZndhrFYWOmXweXvFkZx6lQ2z3mEMGE9yZRnWZqZ2ebLd9g8zsMVEXn5tQB0
	t8GMV7CKUoCd5wLOrt3S/9uY+favOyHsPBojHlA==
X-Gm-Gg: ASbGncs8icG5DtkV0uikNyirzRL70o7lQIbiXNFonxho8F1tDM4zHGEHufyR3AvOVNP
	LWW/jaa51Gk+uonYcGNd85d1Orik1K8x2AenrI/aP/jl22FFyDMsCxL/Lno7j0bztMCW7QzpYK/
	2XWtRSZb2bufEb6BEOd6xsvWJ2wtydM0l94LzoIduOmokLftiYPwphcovaOg==
X-Google-Smtp-Source: AGHT+IGI1PG45Nb9es7WavJqavEs/WLKk7rdiqYP41Fi1bXbCX5LoquaNu+UOmnJyooqDju+QEaZPaw4AbULvBATb6c=
X-Received: by 2002:a05:690c:a8b:b0:6f9:87da:b763 with SMTP id
 00721157ae682-70224f9889fmr54781727b3.12.1743085955840; Thu, 27 Mar 2025
 07:32:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250310071751.151382-1-tarang.raval@siliconsignals.io>
 <20250310071751.151382-5-tarang.raval@siliconsignals.io> <Z-Uj1VnLKQH09__5@kekkonen.localdomain>
 <PN3P287MB18292A67AC52F0D877D480AF8BA12@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <PN3P287MB18292A67AC52F0D877D480AF8BA12@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 27 Mar 2025 14:32:19 +0000
X-Gm-Features: AQ5f1JrYQ-w-1t5fxVA0tVcSossyTFmFtDs5azU2cUWS0rGnqBSK6X3oY1uk8TI
Message-ID: <CAPY8ntDAkA9Srmru3WZO1HibGDZM+PMiRyWcikh3BcLmezb+ag@mail.gmail.com>
Subject: Re: [PATCH 4/6] media: i2c: imx334: Support 4 or 8 lane operation modes
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, 
	"Shravan.Chippa@microchip.com" <Shravan.Chippa@microchip.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Zhi Mao <zhi.mao@mediatek.com>, 
	Julien Massot <julien.massot@collabora.com>, Luis Garcia <git@luigi311.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tarang & Sakari

On Thu, 27 Mar 2025 at 10:55, Tarang Raval
<tarang.raval@siliconsignals.io> wrote:
>
> Hi Sakari,
>
> Thanks for the review.
>
> > On Mon, Mar 10, 2025 at 12:47:46PM +0530, Tarang Raval wrote:
> > > imx334 can support both 4 and 8 lane configurations.
> > > Extend the driver to configure the lane mode accordingly.
> > >
> > > Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> > > ---
> > >  drivers/media/i2c/imx334.c | 22 +++++++++++++++++++---
> > >  1 file changed, 19 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> > > index 24ccfd1d0986..23bfc64969cc 100644
> > > --- a/drivers/media/i2c/imx334.c
> > > +++ b/drivers/media/i2c/imx334.c
> > > @@ -47,6 +47,8 @@
> > >  #define IMX334_EXPOSURE_DEFAULT      0x0648
> > >
> > >  #define IMX334_REG_LANEMODE            CCI_REG8(0x3a01)
> > > +#define IMX334_CSI_4_LANE_MODE         3
> > > +#define IMX334_CSI_8_LANE_MODE         7
> > >
> > >  /* Window cropping Settings */
> > >  #define IMX334_REG_AREA3_ST_ADR_1      CCI_REG16_LE(0x3074)
> > > @@ -107,7 +109,6 @@
> > >  /* CSI2 HW configuration */
> > >  #define IMX334_LINK_FREQ_891M        891000000
> > >  #define IMX334_LINK_FREQ_445M        445500000
> > > -#define IMX334_NUM_DATA_LANES        4
> > >
> > >  #define IMX334_REG_MIN               0x00
> > >  #define IMX334_REG_MAX               0xfffff
> > > @@ -181,6 +182,7 @@ struct imx334_mode {
> > >   * @exp_ctrl: Pointer to exposure control
> > >   * @again_ctrl: Pointer to analog gain control
> > >   * @vblank: Vertical blanking in lines
> > > + * @lane_mode: Mode for number of connected data lanes
> > >   * @cur_mode: Pointer to current selected sensor mode
> > >   * @mutex: Mutex for serializing sensor controls
> > >   * @link_freq_bitmap: Menu bitmap for link_freq_ctrl
> > > @@ -204,6 +206,7 @@ struct imx334 {
> > >               struct v4l2_ctrl *again_ctrl;
> > >       };
> > >       u32 vblank;
> > > +     u32 lane_mode;
> > >       const struct imx334_mode *cur_mode;
> > >       struct mutex mutex;
> > >       unsigned long link_freq_bitmap;
> > > @@ -240,7 +243,6 @@ static const struct cci_reg_sequence common_mode_=
regs[] =3D {
> > >       { IMX334_REG_HADD_VADD, 0x00},
> > >       { IMX334_REG_VALID_EXPAND, 0x03},
> > >       { IMX334_REG_TCYCLE, 0x00},
> > > -     { IMX334_REG_LANEMODE, 0x03},
> >
> > Not a fault of this patch but also the closing brace should have a spac=
e
> > before it. Could you address it in the earlier patches?
>
> Okay, I will correct it.
>
> > >       { IMX334_REG_TCLKPOST, 0x007f},
> > >       { IMX334_REG_TCLKPREPARE, 0x0037},
> > >       { IMX334_REG_TCLKTRAIL, 0x0037},
> > > @@ -876,6 +878,13 @@ static int imx334_start_streaming(struct imx334 =
*imx334)
> > >               return ret;
> > >       }
> > >
> > > +     ret =3D cci_write(imx334->cci, IMX334_REG_LANEMODE,
> > > +                     imx334->lane_mode, NULL);
> > > +     if (ret) {
> > > +             dev_err(imx334->dev, "failed to configure lanes\n");
> > > +             return ret;
> > > +     }
> > > +
> > >       ret =3D imx334_set_framefmt(imx334);
> > >       if (ret) {
> > >               dev_err(imx334->dev, "%s failed to set frame format: %d=
\n",
> > > @@ -1022,7 +1031,14 @@ static int imx334_parse_hw_config(struct imx33=
4 *imx334)
> > >       if (ret)
> > >               return ret;
> > >
> > > -     if (bus_cfg.bus.mipi_csi2.num_data_lanes !=3D IMX334_NUM_DATA_L=
ANES) {
> > > +     switch (bus_cfg.bus.mipi_csi2.num_data_lanes) {
> > > +     case 4:
> > > +             imx334->lane_mode =3D IMX334_CSI_4_LANE_MODE;
> > > +             break;
> > > +     case 8:
> > > +             imx334->lane_mode =3D IMX334_CSI_8_LANE_MODE;
> >
> > Doesn't this affect the PLL configuration? Presumably higher frame rate=
s
> > could be achieved at least.
>
> Sorry, my commit message is misleading. The intention of this patch is to
> configure the lane mode dynamically from the streaming function instead
> of using a hardcoded value.
>
> You are correct that supporting an 8-lane mode requires changes to the PL=
L
> configuration. This patch does not address that aspect yet.

Is it actually required, or just a nicety?
The datasheet [1] says:
"Maximum frame rate in All-pixel scan mode 3840(H)=C3=972160(V) AD12bit: 60
frame / s"
The current driver configuration for the 3840x2160 mode is a pixel
clock 594MHz with total timings of (3840+560) x (2160+90), which gives
a framerate of 60fps. So you already have the maximum capabilities of
the sensor exposed.

Adding the 8 lane mode gives you the option to run at half the link
frequency of the 4 lane, but Sony Starvis sensors have a FIFO between
pixel array and MIPI block. All the other Starvis sensors I've
encountered are quite happy at any of the link frequencies as long as
the horizontal blanking makes the line period sufficient to send each
line.

The datasheet does say "The bit rate maximum value are 1782 Mbps /
Lane in 4 Lane mode and 1188 Mbps / Lane in 8 Lane mode. " (page 78
"CSI-2 output"), but then also "The maximum bit rate of each Lane are
1782 Mbps / Lane." (page 81 "MIPI transmitter"). Surely all lanes can
either do 1782Mbps, or they can't. They won't have downrated just
lanes 5-8.
Presumably it works at 1782Mbps/lane in 8 lane mode or you wouldn't
have submitted the patch,

We've been here before with the imx290 and imx415 drivers and what can
be supported with each combination of lanes and link frequency.

Cheers
  Dave

[1] https://en.sunnywale.com/uploadfile/2022/1205/IMX334LQR-C%20full%20data=
sheet_Awin.pdf

> Best Regards,
> Tarang
> > > +             break;
> > > +     default:
> > >               dev_err(imx334->dev,
> > >                       "number of CSI2 data lanes %d is not supported\=
n",
> > >                       bus_cfg.bus.mipi_csi2.num_data_lanes);
> >
> > --
> > Regards,
> >
> > Sakari Ailus
