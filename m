Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600741FFC5F;
	Wed,  4 Jun 2025 19:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749064368; cv=none; b=BNmUU7F/2CjSd+7j8d/efw58F4/YXsbf0m8MaA4Bv0nKtPOWeJ4HAbaHG8hOSehIpJ0/j891co4PB0//DaVWg0Rpnk4HEVAaB9Rp9I6Hagf4czfXBGUVLJvpQedBZxR/ulvJeZ2Bzk2KtpucRQewF3p+Q93Wf6r7Azmi5dNPLI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749064368; c=relaxed/simple;
	bh=0vus+DnA+getFsaWB+zVr2atIZzQTgmvU5AdXkeDlXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S2TsD51jjogBp6OSowhvyPS2KDspVGEBmSct4sFfh966yOLaPh/rSgtJFhggTHGj5ggYL0HtrzxvxK/yOT2xpR+qJZmhM6F1x4jHaFRe++ohHPIUegM0tVABrk6TCDq1R6U6cUi+VDJX5n72YZrJXlERYoA78sdI0IEhyS6TinA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7U8Odtd; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7U8Odtd"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a4bb155edeso1487191cf.2;
        Wed, 04 Jun 2025 12:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749064365; x=1749669165; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v68ILt8xt28THMlmyuKMfaQcpvhx4IXAkUL4p7ZYZOA=;
        b=X7U8OdtdR4wN7Tx8pGP+GfsGYfSDe5yT0JYU/5KSsqfoAeIBgGMGlXQoELU0EFSoy7
         V+U+p5AGWQuGWbVPSGQas1+Lw5sHNlRCDV1pJe9gGxFWWTF2zUtlB0P87inbELBor4vy
         K5DSULJ42g2yHEYG4JVOve1O+3xGtgE3balHlw5CFjPJKJgtYyK96GLw/mGC5cbwyVdW
         7A1AWsa2CtLNXhlxU9zsuRIg90N5migkITBXm4wDKOjI6eNfvCFXU/hEApoQkX+0cmUp
         5PniFgbe2x3HhaIG8OC7Vzc7AFWx5uZGu5VFsjI8oY/UVNqGgWBfZdE2m/vnV6fUZ9Z4
         IVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749064365; x=1749669165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v68ILt8xt28THMlmyuKMfaQcpvhx4IXAkUL4p7ZYZOA=;
        b=ZBiBgMIysbEs/aVsxFxupVhWcJ4DKb2vIMjFw5uk2rGPXT/JTPnZG/zoQA1jkaVU5e
         5v+lwuIXcS6bFh7hlcf2UYKykx8Vhmbx6a6e4bg0dvwVQYudffi2dhzGMQLOZjCPJrHI
         KLi2iRpl1Vhu4ax5GOJmJ/SAadqueESaQvHUgUhEEKsw1o9qZCNphxZ2IYmGESKgIl7d
         fvmM+BZ3pNtysaBjFBwF+5E3Tm60Azb9chHK+Sg+7PR8VNy7UIZNdnJNLIRFpdqxEA4w
         cQOd91kxviap2e3/j5rd4MyQBHovxVQngy0j+wncoQuo1jtTcu0GIzEmXf2AKZhEIwDX
         +T1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZGRGC2m0YOx53WUOt22Pvmp2SnHrCWG+2rBdoBO3lAtnvtyh7S7I53Wp1P2RG1DGQWAWFLBYN135Teyg3@vger.kernel.org, AJvYcCVaZO/35UGhi6YKFLizCxal0RlF0eFrlLVguyTkjGXJQQa4IbBvEbqLTArf2vD9Covs2oYZUIRzbzBv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Fm7Elue88RSz79JiY7pnPvEBqbT/XaedyrCAMW7k/gyKpzV+
	jTaF0BlWsZENUph8LLUrj7w0r+iV4nW0zpEZwqo2jXyQEEZ1Pvd3j3L3tAkYuA/Js/h0wZqYLxm
	F12oM/U8gDUtQLOTOrGDR4J2eAEUYClqyjrM+zo7BY6Bk
X-Gm-Gg: ASbGncsyX2941Qy2l4N6tjNARRaenkURcnNd5v3t0z8kJ3G425CpwH8Bo+/4SyG0Vpm
	vWEtFHmYHNphBlA4OCFrwMI+j1YKp2YZSz+CyAStQv6iY2H/ILHub969uT2QbA1bgsLS0xH0VYF
	f0UCns+F5eS4j10sW+oF8QypuhlkSaykN6RgtrcbnccwbIYnuL7mUNfjO0OtC23x4arQ==
X-Google-Smtp-Source: AGHT+IHkGcI9KV0dFs+7Hj/zh+wdAmNhv6TFy7eW9sMjhV5X2zUe4MTyLbGWK9esEy06HGIELxjaKcjO6066Mlf9nY0=
X-Received: by 2002:ac8:5cd5:0:b0:48c:c121:7e27 with SMTP id
 d75a77b69052e-4a5a584733cmr74376181cf.50.1749064365064; Wed, 04 Jun 2025
 12:12:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <20250603-sige5-updates-v1-1-717e8ce4ab77@gmail.com> <6656934.DvuYhMxLoT@workhorse>
In-Reply-To: <6656934.DvuYhMxLoT@workhorse>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 4 Jun 2025 23:12:35 +0400
X-Gm-Features: AX0GCFspbBIHwcLfNzc6-jDHvamdNprrbgOXqKsRv_8yqqyAsKIYJM_cipXfo4o
Message-ID: <CABjd4Yx05SCm+03jWbsEP-A5AuhL14wLj=+VdKyQgqMbnxi3xQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 10:38=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Tuesday, 3 June 2025 19:01:13 Central European Summer Time Alexey Char=
kov wrote:
> > List both CPU supply regulators which drive the little and big CPU
> > clusters, respectively, so that cpufreq can pick them up.
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> >  .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 28 ++++++++++++++=
++++++++
> >  1 file changed, 28 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arc=
h/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> > index b09e789c75c47fec7cf7e9810ab0dcca32d9404a..d9c129be55a0d997e04e6d6=
77cdc98fb50353418 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> > @@ -207,6 +207,22 @@ vcc_3v3_ufs_s0: regulator-vcc-ufs-s0 {
> >       };
> >  };
> >
> > +&cpu_b0 {
> > +     cpu-supply =3D <&vdd_cpu_big_s0>;
> > +};
> > +
> > +&cpu_b1 {
> > +     cpu-supply =3D <&vdd_cpu_big_s0>;
> > +};
> > +
> > +&cpu_b2 {
> > +     cpu-supply =3D <&vdd_cpu_big_s0>;
> > +};
> > +
> > +&cpu_b3 {
> > +     cpu-supply =3D <&vdd_cpu_big_s0>;
> > +};
> > +
> >  &combphy0_ps {
> >       status =3D "okay";
> >  };
> > @@ -215,6 +231,18 @@ &cpu_l0 {
> >       cpu-supply =3D <&vdd_cpu_lit_s0>;
> >  };
> >
> > +&cpu_l1 {
> > +     cpu-supply =3D <&vdd_cpu_lit_s0>;
> > +};
> > +
> > +&cpu_l2 {
> > +     cpu-supply =3D <&vdd_cpu_lit_s0>;
> > +};
> > +
> > +&cpu_l3 {
> > +     cpu-supply =3D <&vdd_cpu_lit_s0>;
> > +};
> > +
> >  &gmac0 {
> >       phy-mode =3D "rgmii-id";
> >       clock_in_out =3D "output";
> >
> >
>
> Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>
> > so that cpufreq can pick them up.
>
> Fwiw, even without this patch they're picked up by cpufreq-dt for me:
>
>     user@trixie:~$ sudo cpupower frequency-info
>       analyzing CPU 5:
>       driver: cpufreq-dt
>       CPUs which run at the same hardware frequency: 4 5 6 7
>       CPUs which need to have their frequency coordinated by software: 4 =
5 6 7
>       maximum transition latency: 40.0 us
>       hardware limits: 408 MHz - 2.30 GHz
>       available frequency steps:  408 MHz, 600 MHz, 816 MHz, 1.01 GHz, 1.=
20 GHz, 1.42 GHz, 1.61 GHz, 1.80 GHz, 2.02 GHz, 2.21 GHz, 2.30 GHz
>       available cpufreq governors: ondemand userspace performance schedut=
il
>       current policy: frequency should be within 408 MHz and 2.30 GHz.
>                       The governor "schedutil" may decide which speed to =
use
>                       within this range.
>       current CPU frequency: 1.61 GHz (asserted by call to hardware)
>     user@trixie:~$ uname -a
>     Linux trixie 6.15.0-11173-g546b1c9e93c2 #2 SMP PREEMPT Wed Jun  4 20:=
32:52 CEST 2025 aarch64 GNU/Linux

Frequencies are fine, but I don't think the more power hungry big CPU
cluster gets any voltage scaling without it. Once I try to load the
system enough that the governor decides to bump the big cluster
frequency up, the regulator stays at 850000 microvolts, causing random
reboots when the whole cluster starts starving. With the patch,
voltage oscillates between 700000-737000 microvolts in idle and jumps
up to 950000 under load, and the system seems stable.

Here's what I used to monitor the voltage (there must be a better way
to do it, but it works):
sige5 ~ # watch cat `grep -r . /sys/class/regulator/*/name | grep
vdd_cpu_big_s0 | sed -e 's/name.*//'`/microvolts

And in another terminal:
sige5 ~ # stress-ng -c8

This might warrant a note in the commit message I guess :)

Thanks for your review and testing!

Best regards,
Alexey
