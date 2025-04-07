Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49DE20966B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 23:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744067381; cv=none; b=ijXYDkA9NvIrS3f/hqnjzAbaZPK1wzs92Tl6H1vHtABIw3wlti+fj62dgiMzQxzWgNskT6jUQmKG7V2IL/AZIAEZlo+G2DHvop3EzFX2dUkAOyD0WSxF6gzwNTE6F2YxCLDOPr1H45ShVRCjhxOYduc/CpjNwquw+oVvabsodtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744067381; c=relaxed/simple;
	bh=O74ZcjE1OQcfzpO0kSxXYabLxllHbRodD/griblwqRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LoLxbucI0qxd1MSS0cNV29NufEaIsy2OeCvd/wEQ0gcaKknBOXA+0ALB9+1zIqsaCTCuPWzNMDngo7+8i6kW53/TD12zswa5XvxGJsMYoJcUfURCEA2bda5BVnqS0aZcg9D80LrM5U4f/gdJDCwmOlWljidmkr5QSJ8SKYxdEpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=Gcj+tGui; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="Gcj+tGui"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id BF5C9240103
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 01:09:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1744067377; bh=O74ZcjE1OQcfzpO0kSxXYabLxllHbRodD/griblwqRc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=Gcj+tGuiZxMvRsMcyD94GiVdn1pbO9JOIzUUYcuBSh9GfmYheVojifVwsYX3TZocE
	 airCcsxueG1jNc8E+flZDNqAIVaA1RTYnI2TYOq6XTrybinrgEOrxB5YM10MpNH3vp
	 fVt3u51ripG3p2iMMC/OkkREGypxdOGbkkqZGW/1hn/VpVbPT0wZrdsXArrlpZZwRM
	 52NvzIdXNCaOEbudWSyhDAmQXRp1z+wc5vk8vYSLNmEEh21MUtY0zYpUD1uls0NUqM
	 EJ79qOZbL1D/cpjvYIGXIqlf/1pHGka7SWSLK64IUJEOsEgWANgj7v4ofQwxJXzc/9
	 ccueJiRTKHKgA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ZWlKD3rbZz6v0r;
	Tue,  8 Apr 2025 01:09:36 +0200 (CEST)
Date: Mon,  7 Apr 2025 23:09:36 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 3/3] ARM: dts: amlogic: Add TCU Fernsehfee 3.0
Message-ID: <Z_RbMLu27AKHaCIO@probook>
References: <20250323-fernsehfee-v1-0-2621341cd37a@posteo.net>
 <20250323-fernsehfee-v1-3-2621341cd37a@posteo.net>
 <CAFBinCD13CNuxRkrSoPXUMNQ9AJH7UV0gsOfdgeRKhkXsANgnw@mail.gmail.com>
 <Z-vjWFFWvo1gesCe@probook>
 <CAFBinCDgn30H13hfkEsfyzSjO-HJ-XpAUwSwimBk7VPpKyNKMw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFBinCDgn30H13hfkEsfyzSjO-HJ-XpAUwSwimBk7VPpKyNKMw@mail.gmail.com>

On Sun, Apr 06, 2025 at 10:36:18PM +0200, Martin Blumenstingl wrote:
> On Tue, Apr 1, 2025 at 3:00 PM J. Neuschäfer <j.ne@posteo.net> wrote:
> >
> > On Sun, Mar 30, 2025 at 11:10:28PM +0200, Martin Blumenstingl wrote:
> > > Thanks for your patch!
> > >
> > > On Sun, Mar 23, 2025 at 1:38 PM J. Neuschäfer via B4 Relay
> > > <devnull+j.ne.posteo.net@kernel.org> wrote:
> > > [...]
> > > > +               eth_phy0: ethernet-phy@0 {
> > > > +                       /* IC Plus IP101A (0x02430c54) */
> > > > +                       reg = <0>;
> > > Does reg = <1> also work on your board?
> > > 0 is the broadcast address. It's unfortunately something that we still
> > > have incorrect in a lot of .dts files.
> >
> > Unfortunately not. I tried addresses 1 to 31 without success, which
> > seems strange; my guess was that the PHY should respond to one of them.
> > I get this error:
> >
> > # ip l set eth0 up
> > [    6.806847] meson6-dwmac c9410000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
> > [    6.810609] meson6-dwmac c9410000.ethernet eth0: __stmmac_open: Cannot attach to PHY (error: -19)
> Thanks for testing. Let's keep it at zero then.
> 
> > >
> > > [...]
> > > > +&i2c_AO {
> > > > +       status = "okay";
> > > > +       pinctrl-0 = <&i2c_ao_pins>;
> > > > +       pinctrl-names = "default";
> > > > +
> > > > +       pmic@32 {
> > > > +               compatible = "ricoh,rn5t618";
> > > > +               reg = <0x32>;
> > > > +               system-power-controller;
> > > Here I'm a bit surprised:
> > > Aren't some of the outputs used to drive VCCK (CPU power rail) and
> > > VDDEE (everything else power rail, which also powers the GPU)?
> >
> > Unfortunately I don't have schematics and I wasn't able to trace the
> > connections on the board because they're so tiny. So it's quite possible that
> > you're right, but I can't be sure.
> >
> > Are there voltage sensors in the Meson8 SoC that I could use to establishs the
> > relation between PMIC outputs and SoC supplies?
>
> There aren't any sensors (that I'm aware of). But you can check
> /sys/kernel/debug/regulator/regulator_summary and compare the values
> with the ones from arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dts
> Also the vendor u-boot and kernel logs may provide some information.

The values in /sys/kernel/debug/regulator/regulator_summary do indeed
match the values in meson8m2-mxiii-plus.dts:

 DCDC1                            0    0      0 unknown  1100mV     0mA     0mV     0mV
 DCDC2                            0    0      0 unknown  1150mV     0mA     0mV     0mV
 DCDC3                            0    0      0 unknown  1500mV     0mA     0mV     0mV
 LDO1                             0    0      0 unknown  2900mV     0mA     0mV     0mV
 LDO2                             0    0      0 unknown  1800mV     0mA     0mV     0mV
 LDO3                             0    0      0 unknown  1800mV     0mA     0mV     0mV
 LDO4                             0    0      0 unknown  2850mV     0mA     0mV     0mV
 LDO5                             0    0      0 unknown  1800mV     0mA     0mV     0mV
 LDORTC1                          0    0      0 unknown  2700mV     0mA     0mV     0mV
 LDORTC2                          0    0      0 unknown   900mV     0mA     0mV     0mV

After I copy the regulator table from meson8m2-mxiii-plus.dts, I can indeed
observe the effect of regulators being on/off. I will use that to further
investigate how the regulators are used.

The vendor u-boot/kernel aren't very useful, unfortunately.
The downstream devicetree includes these settings:

	rn5t618 {
		status = "okay";
		ddr_voltage   = <1500000>; // 1.5V
		vddao_voltage = <1200000>; // 1.2V
		[...]
	};

The corresponding driver seems to associate ddr_voltage with DCDC2 and
vddio_voltage with DCDC3, although this part of the code[1] is "#if 0"'d.

[1] https://github.com/endlessm/linux-meson/blob/master/drivers/amlogic/power/ricoh/ricoh_pmu.c#L127


Best regards,
J. Neuschäfer
