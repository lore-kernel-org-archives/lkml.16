Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9042F1FCB
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 23:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751068317; cv=none; b=FQIjInrl7Ek26WJh1R8bEO2IXW5sulsYM7voTXMd5B+/kRaqumPZi0nSyYWHcnN489Kb1gNBosf6s2xvdbrXTrVQrlUnwOnsydMeRgWo8ucUj59vggJoWY00GSZwQplHn5k2soyEtTm9EGPzi52aRtVLnVHddhySeXx+ZkxehF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751068317; c=relaxed/simple;
	bh=kyrV6L+meAj02dvvdma6O77Vtcf1w8s3JJQjUVYj4uw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JmME/WdrtcNrNDdhJtivoPBXEuZKxbn2QvWWkKJ0XJRrgg5NI1Q+rUUUEg7Ra9kqzRa0tZhIMqsWZeGUSKEXuIokC5PZ8dSLawvPeT01Ll8R7ExsKslLeQH1V5hmglUE333VK59mmIfZyQGCzTSfYX1s88MMmECgajuKLJ8jtmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b=Dys1RGIP; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b="Dys1RGIP"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-60bd30dd387so190958eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1751068314; x=1751673114; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BzzFxvtsJDUS1GN+Rp5blvMdsxvFtXnK7MAb3nkjiUk=;
        b=Dys1RGIPVSHRcyuObRgkVvQ67a3I5WYd/K7/Z1YRbWXL1CTzveSL6RgLfAosN7joDd
         dnmGDhGgDMjUiR3ACd/7nw11i7J/yNH7P4U6/wFd093li+PjedN8xj4An+R//ZBhGsY8
         zJ+ZYqXqygMuStuwDEZN3KA8cToyB9AgtOFoeXEnym+se0yRAhNPALCIm9yPFl3127nX
         QNIE4lnPSHjG4c3hdKfBFLGL8CtltaEzPxMaBWMAhOhW/GYp/BHeLdJwHyooAeAmeIkt
         w9lmzSXCT0cI10vlhpS96lycYhPdVUFHlIIfnO41mk0+dkcW1Nx/i28YMQZP3K6yVNXx
         r3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751068314; x=1751673114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BzzFxvtsJDUS1GN+Rp5blvMdsxvFtXnK7MAb3nkjiUk=;
        b=YFAmOIiY9hXK9uR0DXU1pqb9tr/Hnv78nu4Whmnh/38ISee7OX58beC6D+PGHi+XYt
         5JJGS5yhYVPqr6ZtTTd4i5bLFEDGlQUqB5sVdKkozvuMoj4Wl6KJ4IydaZQvGj2uPj60
         bp4dH6d9h/AvnRAGKLIoCop9hH+frqaHwSLhSzt3o9gn4qrBU1LsmV0uMip3hGP0szrz
         h0bGKxpDbwImmZ5KrPZjJuIXJvT8xl8hLeiDdBz2Q/xhTi1nbs+mSH8s8GBmKmZHu6C3
         IeSMhwLGeKZL/VKyfMVjxiBiVASoOqTl3izyovRrexKjYFtq7JTTiaAatsvF4Redbkov
         +YXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+FkJPKdCTcIJs4MLHTZjB7RMSvpNoV7jPqjIIE5ZDP3hoCyUrJW6juVswT5EbSrifMPUa67dOhyzjeo8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqaEB2I+lhOmTekExY5kZXM38yqmyaUBf/UaYCaQwWDz+ped9t
	u9uzpsN2X/iTKTE924OHDwbJBODbktG9h1/1IO0HvrLQE8SgCX2YvLbh/mcRVS/P/JTLocb4IKP
	4py+uoDf9Et7IFc0wBJvlNIJDwO+O9ayqpxg/TjOkhA==
X-Gm-Gg: ASbGncsBskXt612qq6QgWqMY32M/e4EdofdnrB6xocs30qd33NxbOYbPqo/8te6Ec3f
	ipkuCl/zTynT+E48QulicewgnKRWvK2GzfDtg3gEcD7X9GeByJJrotU0MSnra3SUY8cTnTACFBy
	8fG/pyl26/fd2W4vcJ72INJpYCHW3Pbz7FGb3fYcZQDBw=
X-Google-Smtp-Source: AGHT+IGgc47EYY0K8HdBdfElHz/fGDss2oWTxTnf5NF11fTfAkKrJuQZMypuhZquvGUVIV3cfJTO7ety3y21wfQ3YXo=
X-Received: by 2002:a4a:ec42:0:b0:611:befc:38e5 with SMTP id
 006d021491bc7-611befc396emr2467182eaf.4.1751068314368; Fri, 27 Jun 2025
 16:51:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620213447.56392-1-aford173@gmail.com> <CAJ+vNU0caeeC6in5dO_jkkbYNAnTL7drBZcmNBsstbrPWqUkHw@mail.gmail.com>
 <CAHCN7x++XGXu6DsPaOc2EpAbxzy+RZbDq5A5-j5a4roGDhv4fQ@mail.gmail.com>
In-Reply-To: <CAHCN7x++XGXu6DsPaOc2EpAbxzy+RZbDq5A5-j5a4roGDhv4fQ@mail.gmail.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Fri, 27 Jun 2025 16:51:43 -0700
X-Gm-Features: Ac12FXwXGulBL0jbVqQnJxN_WDCz81yMYRpGFHs9RhAW_Av5urg3MXFIWan08mk
Message-ID: <CAJ+vNU2iY4V3yp_58NTSht2XbS_YiWU+T5jn7fcbrkBMGygzJA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mm-beacon: Fix HS400 USDHC clock speed
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 11:40=E2=80=AFAM Adam Ford <aford173@gmail.com> wro=
te:
>
> On Fri, Jun 27, 2025 at 12:56=E2=80=AFPM Tim Harvey <tharvey@gateworks.co=
m> wrote:
> >
> > On Fri, Jun 20, 2025 at 2:52=E2=80=AFPM Adam Ford <aford173@gmail.com> =
wrote:
> > >
> > > The reference manual for the i.MX8MM states the clock rate in
> > > MMC mode is 1/2 of the input clock, therefore to properly run
> > > at HS400 rates, the input clock must be 400MHz to operate at
> > > 200MHz.  Currently the clock is set to 200MHz which is half the
> > > rate it should be, so the throughput is half of what it should be
> > > for HS400 operation.
> > >
> > > Fixes: 593816fa2f35 ("arm64: dts: imx: Add Beacon i.MX8m-Mini develop=
ment kit")
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/a=
rch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> > > index 21bcd82fd092..8287a7f66ed3 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> > > @@ -294,6 +294,8 @@ &usdhc3 {
> > >         pinctrl-0 =3D <&pinctrl_usdhc3>;
> > >         pinctrl-1 =3D <&pinctrl_usdhc3_100mhz>;
> > >         pinctrl-2 =3D <&pinctrl_usdhc3_200mhz>;
> > > +       assigned-clocks =3D <&clk IMX8MM_CLK_USDHC3>;
> > > +       assigned-clock-rates =3D <400000000>;
> > >         bus-width =3D <8>;
> > >         non-removable;
> > >         status =3D "okay";
> > > --
> > > 2.48.1
> > >
> > >
> >
> > Hi Adam,
> >
> > This caught my interest. Where in the IMX8MMRM do you see this and
> > would it also apply to the IMX8MP? (You've patched your IMX8MM and
> > IMX8MN boards).
>
> My 8MP board already appears to be running at 400MHz, but I did check.
> The reference I found was in the 8MM TRM, under 10.3.3.5 Clock
> generator, there is a note:
>
> CLK is different for the SDR and DDR modes.
> - In the SDR mode, CLK is equal to the internal working clock (card_clk).
> - In the DDR mode, CLK is equal to card_clk/2.
>
> >
> > Have you encountered any issues when running eMMC at HS400 due to this
> > or is it just something you noticed in the RM more recently like with
>
> One of my colleagues reported that the eMMC was running slower than he
> expected, and I looked at the reference clock and noticed the 200MHz.
> He asked if it needed to run 2x that since HS400 clocks on both edges.
> I looked it up and found the note from above.  When I increased the
> rate to 400MHz from 200MHz, the throughput doubled. I also noticed
> some other boards, including the reference from NXP had the clock rate
> set to 400MHz, so I don't think anything unreasonable.
>

Hi Adam,

The verbiage in the 'clock generator' section is not really easy to
understand but you're right, setting it to 400MHz also bumped the
performance on my boards. It looks like there are a lot of imx8m
boards that could likely benefit from this that are not already doing
so.

Check your imx8mp again, in my case (imx8mp-venice) sdhc3 was not
running at 400Mhz without the appropriate change - maybe yours is
running higher due to some other clock configuration you have.

I'll be patching my boards with this as well - thanks!

Best Regards,

Tim
