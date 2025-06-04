Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEF7111BF;
	Wed,  4 Jun 2025 19:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749066535; cv=none; b=QIHzT3LuwEoXs3w0NMLKUusxvjLFPGiuv8JAMkbQDyqwVrDpmdrmY2UhEovQd6Aq4mb7phbWDxA+u2l8nnrem03cbJM6+XSd+oTmMEGKdbXiC9suKiBuuTyvmguALqup61GRSeUuTx8bK84Labn1jekCNN9rA6104j7cJmZJiow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749066535; c=relaxed/simple;
	bh=/P44QRKMu/0tVFpqvGf8UuDF7OHGONedZMz+P7rZYMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S4BoZEcR0eVwGUn8qL8xUuOgonlIrMK30tqhxP/VH/y4qQsoTMYdCfV1pnvuI7pqjmQUJVVHPMFShNyTD7oBVCIpxIcKBhL0rwa2bKc1IBa1QdsUgBeFU9PiUSnI4cUF8EVRTIebyDLdPgiq0Fypzo/gCvDzUU8wTcGCZHcDTZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CuWpfkay; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CuWpfkay"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4a585dc5f4aso2029731cf.2;
        Wed, 04 Jun 2025 12:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749066533; x=1749671333; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXCEiM39Ukk34aOzUk8oPBSr5pdnK8+2MaECbIa3iYo=;
        b=CuWpfkaynDWI0so1ptqEW5h0axO703RZiuR7sqUizuA2YLBP2auxx76rTRI7SeVdJy
         EijGyrEqtutHqdQxkAR/2/5fNK4+HHdXVWtk0cLC5TObUkv9Nq2R8jZHGpo2LmDD4bVT
         5/2jH9i9nSrxqp4m4+ToB3TWXTmVCqro4QKxddwVRMeq0eVR+1mvZwtEp5hgan3JSHgs
         bcdNE+pWA/A/Hjh3l1b2Ae3wY3+vCkVme6rA7m188ujA5ugbNaIzI6ERIKpR+jef8KoF
         /N8SDf48a/tB+l9J2oABex/NdguBTkMb74PXUCbe/gAxyvZGe7sqBGyh6r3APL3JnMJf
         neuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749066533; x=1749671333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lXCEiM39Ukk34aOzUk8oPBSr5pdnK8+2MaECbIa3iYo=;
        b=u6KUzyXNFBdiH+yCCE/emc52p6ARffnYm2sa8EZnCz32/eQTRSaj1DFk3JvPoHzZ6j
         r0nXeNWi5qv5DpUYhCpUcbTZFVMeLbIwdd6eyU8VbcsmIHrmfrruNiGX4Ks4meAgU0bh
         ulLybmxQykNUP5J5RJDC7MVd4jV2dBzJ+WBSySl2yOkqp+3Yvc0WUkRiKzScBbZTMt1m
         XGca+6uREu+FtEwUe0EPeksj4P7HiYCcX9qShO4fGfTsPbxWNj/GC+I4bOEKGYV/wUjt
         M+MpwEbzctQdmujXZ6PNz8+t5cZxwJtRiYvYWA0YQ7sdkcSxGjx4AflQTTy09tUPL46Z
         fpfA==
X-Forwarded-Encrypted: i=1; AJvYcCWtyEnBbSf/5dNNB7LM35LUO+F868JtO+AIWlGZIih+LWsh9vi8QYlVeozKUhyYB3LzWzxVlfRY4kGv@vger.kernel.org, AJvYcCXHqCuqW9mrqh3UUUrJpU1vKbPg7JHH+pXF/9KyoTysFSEuCwLpiFAPmvd4++V/a+0Vgh2GOyI+OLFBTDji@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj3FYwRN7QqeoD1OCa5W2FjBEGMwVpPVOBgGtUx11aQhpMii18
	XIa4cwZ6HLP1NEmChDdwoj8oZhDqG80KsKUV4CYuRpq1XT1g9//wENCV02dLlNsPHFjLvp4sKWh
	trK1MAGn/juMWQKOmGBFL9JLIOi4T7gQ=
X-Gm-Gg: ASbGncsKfqIzY6yiC0W7gYPqlF8iNlSK08kb2EpTvgTXgve8F8tdDfoKvVZya/Wj+bB
	yHwcODC+CiQSgHDO+p7+HC+zrJkL1yx8cTrhQ/HFpXRxTGe+rAE5XU4FXn6UbgKDfuij+wEgB7p
	xejkVMxgcAyFBCdPB9VNPfcFi2SfY4Ws0wNHpK972J6GxekZn5g0aQw59Ihi9pW7mAHA==
X-Google-Smtp-Source: AGHT+IGSdI2iH/78lCpY/FmdwOq/0KffeZV59xBksGE/iPhTqYe2o31X/3h4uGApiFiXXDlOU73adxdduyt5opuFIUk=
X-Received: by 2002:ac8:6f19:0:b0:4a4:4101:ab1a with SMTP id
 d75a77b69052e-4a5a57c075emr74586571cf.2.1749066532673; Wed, 04 Jun 2025
 12:48:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <20250603-sige5-updates-v1-3-717e8ce4ab77@gmail.com> <11432858.nUPlyArG6x@workhorse>
In-Reply-To: <11432858.nUPlyArG6x@workhorse>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 4 Jun 2025 23:48:42 +0400
X-Gm-Features: AX0GCFsV9N6fbULTUWmk0HhznU6dkWbShbjvuaRV-K_xsoCC--s5HEFjxZb7NOA
Message-ID: <CABjd4YzxvG6u8g8OjCBSOe6Zddk6Fe-sv+M5-8Si2-=Vw8qHBg@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: enable wifi on ArmSoM Sige5
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 11:01=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Tuesday, 3 June 2025 19:01:15 Central European Summer Time Alexey Char=
kov wrote:
> > ArmSoM Sige5 uses a soldered-on SDIO connected WiFi module. Namely,
> > board v1.1 uses a Realtek based BL-M8852BS2, while v1.2 uses a Broadcom
> > based BW3752-50B1.
>
> Okay, so there's two board revisions, which makes this patch and the
> following that adds bluetooth a problem. This patch here doesn't
> seem to actually add the SDIO Wi-Fi module node where it'll differ,
> so skirts around the issue AFAIU. It might also be that it's not
> needed for you and I just don't notice because I have v1.1 where the
> SDIO driver for that module doesn't exist yet iirc.

The WiFi module actually probes just fine without explicitly listing
it in the device tree, because SDIO is enumerable (unlike
UART/serdev). Pin configs and the lpo clock are pulled in by the
mmc-pwrseq part, and with that it just works as long as the drivers
are in place (which is the case with the Broadcom module, but perhaps
not yet with the Realtek one).

I haven't tested the wake-host functionality, given that there is no
suspend support anyway (no Rockchip SiP communication support in
mainline, and nothing to ask ATF to suspend the main CPU like
downstream rockchip_pm_config.c does). Guess it doesn't work, because
nothing binds the respective GPIO to the WiFi driver right now. But I
do get a WiFi connection without it.

> But what we should think about is first doing
> - probably add a new compatible for armsom,sige5-v1.2
> - git mv arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts \
>          arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtsi
> - commit here like Sebastian Reichel had to do for [1]
> - create a new arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
>   that includes the dtsi and moves the model and compatible property
>   there. Make sure the model includes v1.1 in the name, compatible
>   should remain the same
> - commit here that will be a squash commit like Sebastian Reichel
>   had to do in [2]

I believe another way to do this is with --break-rewrites, as Dragan did in=
 [1]

[1] https://lore.kernel.org/all/9ffedc0e2ca7f167d9d795b2a8f43cb9f56a653b.17=
17923308.git.dsimic@manjaro.org/

> - create a new arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2.dts,
>   could be adding the Wi-Fi node here to cut down on how many patches we
>   do. I assume you only have the v1.2 board and can't test the older Wi-F=
i,
>   which is fine.
>   compatible should probably be something like
>     compatible =3D "armsom,sige5-v1.2", "armsom,sige5", "rockchip,rk3576"=
;
>   Don't forget to change the model property as well.

Given that the user would have to manually feed an appropriate DTB for
their board to the bootloader, and given that the WiFi/BT module used
is the only difference between v1.1 vs. v1.2, this doesn't seem to be
much easier for users vs. applying a DTBO... But more churn in the
kernel just for that bluetooth function. With a DTBO we could keep the
same compatible and just move the Bluetooth node into an overlay.

Happy to go either way. Wonder what Heiko prefers?

> I know this will be a royal PITA, especially considering they'll likely
> never produce v1.1 again and it now hogs the name, but keeping the
> current dts as 1.1 may be the best way forward, as it keeps compat (thoug=
h
> the Wi-Fi changes won't affect anything already in there) and will stop
> people from accidentally picking the higher number better DTS like what
> happens with rockpro64 all the time where the non-numbered DTS is 2.1 and
> the numbered one is 2.0 and people keep picking 2.0.

Quite a PITA indeed :)

> > Add required device tree nodes in the SoC .dtsi for the SDIO controller
> > and pinctrl / clock wiring in the board .dts for the module itself.
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> >  .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 36 ++++++++++++++=
++++++++
> >  arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 16 ++++++++++
> >  2 files changed, 52 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arc=
h/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> > index 7ce1fb1380b0863c902fdd9cbc7454ee6011cf92..dcd033859398312f7693beb=
b7f080ee4f2ecaa32 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> > @@ -219,6 +219,15 @@ vcc_5v0_host: regulator-vcc-5v0-host {
> >               pinctrl-names =3D "default";
> >               pinctrl-0 =3D <&usb_host_pwren>;
> >       };
> > +
> > +     sdio_pwrseq: sdio-pwrseq {
> > +             compatible =3D "mmc-pwrseq-simple";
> > +             clocks =3D <&hym8563>;
> > +             clock-names =3D "ext_clock";
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&wifi_reg_on>;
> > +             reset-gpios =3D <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;
> > +     };
> >  };
> >
> >  &combphy1_psu {
> > @@ -781,6 +790,16 @@ usb_host_pwren: usb-host-pwren {
> >                       rockchip,pins =3D <4 RK_PA4 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> >               };
> >       };
> > +
> > +     wireless-wlan {
> > +             wifi_wake_host: wifi-wake-host {
> > +                     rockchip,pins =3D <0 RK_PB0 RK_FUNC_GPIO &pcfg_pu=
ll_down>;
> > +             };
> > +
> > +             wifi_reg_on: wifi-reg-on {
> > +                     rockchip,pins =3D <1 RK_PC6 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> > +             };
> > +     };
> >  };
> >
> >  &sai1 {
> > @@ -808,6 +827,23 @@ &sdhci {
> >       status =3D "okay";
> >  };
> >
> > +&sdio {
> > +     bus-width =3D <4>;
> > +     cap-sdio-irq;
> > +     disable-wp;
> > +     keep-power-in-suspend;
> > +     mmc-pwrseq =3D <&sdio_pwrseq>;
> > +     no-sd;
> > +     no-mmc;
> > +     non-removable;
> > +     sd-uhs-sdr50;
> > +     sd-uhs-sdr104;
> > +     vmmc-supply =3D <&vcc_3v3_s3>;
> > +     vqmmc-supply =3D <&vcc_1v8_s3>;
> > +     wakeup-source;
> > +     status =3D "okay";
> > +};
> > +
> >  &sdmmc {
> >       bus-width =3D <4>;
> >       cap-mmc-highspeed;
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot=
/dts/rockchip/rk3576.dtsi
>
> Okay, I think adding the sdio node to the SoC dtsi should be a separate
> patch before this one.

Fair enough, will split it out, thanks!

> > index 1086482f04792325dc4c22fb8ceeb27eef59afe4..a09582470bb7f654b711308=
da1e51fa8571ca1e8 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> > @@ -1695,6 +1695,22 @@ sdmmc: mmc@2a310000 {
> >                       status =3D "disabled";
> >               };
> >
> > +             sdio: mmc@2a320000 {
> > +                     compatible =3D "rockchip,rk3576-dw-mshc", "rockch=
ip,rk3288-dw-mshc";
> > +                     reg =3D <0x0 0x2a320000 0x0 0x4000>;
> > +                     clocks =3D <&cru HCLK_SDIO>, <&cru CCLK_SRC_SDIO>=
;
> > +                     clock-names =3D "biu", "ciu";
> > +                     fifo-depth =3D <0x100>;
> > +                     interrupts =3D <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>;
> > +                     max-frequency =3D <200000000>;
> > +                     pinctrl-0 =3D <&sdmmc1m0_clk &sdmmc1m0_cmd &sdmmc=
1m0_bus4>;
> > +                     pinctrl-names =3D "default";
> > +                     power-domains =3D <&power RK3576_PD_SDGMAC>;
> > +                     resets =3D <&cru SRST_H_SDIO>;
> > +                     reset-names =3D "reset";
> > +                     status =3D "disabled";
> > +             };
> > +
> >               sdhci: mmc@2a330000 {
> >                       compatible =3D "rockchip,rk3576-dwcmshc", "rockch=
ip,rk3588-dwcmshc";
> >                       reg =3D <0x0 0x2a330000 0x0 0x10000>;
> >
> >
>
> So in conclusion:
> - bindings patch adding v1.2 compatible
> - SoC dtsi patch for the sdio node
> - git mv patch
> - rk3576-armsom-sige5.dts patch, ask maintainer to squash it into the
>   previous patch, make it obvious by giving it the same subject or someth=
ing
> - rk3576-armsom-sige5-v1.2.dts patch
>
> Sorry to drop all this on you, it's a little unpleasant and in-the-woods
> with regards to preparing a patch series. Basically, the reason why I've
> held off on this for the moment is that I don't have a v1.2 board and my
> v1.1 board's Wi-Fi module doesn't seem to be supported (yet).

No worries, thanks for delving into all this stuff with me - much appreciat=
ed!

Best regards,
Alexey
