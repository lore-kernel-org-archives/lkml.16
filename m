Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4F4111BF;
	Wed,  4 Jun 2025 19:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749066866; cv=none; b=FFuGpMVM34a87mqw2bQCgathnI9tmRbb+h+n2o/PuelLMm9rt2PQ/p/21T8D2ZSvQGyM+YwVt7xbfftz0wi8U8RjiLDW1a7/5lBgul1Pt6Vx4qvMCj586KXGNENqpeavFtwhOp2E1D3XrNghA3L1Ra6sPlp2UoDhPralZ1N/zHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749066866; c=relaxed/simple;
	bh=FK5qCDPK6HuTjCJbnQOSRwdSyUGsa/lU7mjXf4FKb7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J0ll3KKaJqq16oynI8IqxJhd5AFJw4jrVCQcKV5SvwbbIkDPnp0zWQ8eSUF8fpmUPzQG2LhKd0J8sRJur3LW8InS4PNM5U+6RpTKFZzeBHIdlAMYNPiRinJ2pCIFFR+TBH3w3THEXueV9bOnkPJc5AFRMdyT9BvAcshpDZcgQfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffgH1hU1; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffgH1hU1"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4a589b7dd5fso2808101cf.0;
        Wed, 04 Jun 2025 12:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749066864; x=1749671664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqa5razpkQwxe4vQQTx47r6fs83MP5HEXihvc/yiIDU=;
        b=ffgH1hU14ELFRpPmWToMokb0gZhGUKCMbaU0kx4ESlBMmqIUMbXDhx9C8S1AK7ADOQ
         LqQB5M2JrBoAlolkYYqdZni9E7cKcre3+VIZyzZDiBn7re1GQxTicuO/JjyK40FTlTjg
         +vbi/+/QEHaNQuk3XUn6B9rPFQUw3AdpAMHra6hrJyS26K94gn4zaeZYcivyDpVyI11+
         Vz7+v0gWwy/DDvuVGtaAv80Y2r2FWzBNLbH7cl4CgnzQMyZHxtsIDffqmiwk1eHWiaQ3
         HCm8/yivbAMj25rhIzzZnOeTY7XW2bHtcppUX+B6MrCzZ8hrUnO0LmJ8UgdzgtssfeyT
         Jy4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749066864; x=1749671664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kqa5razpkQwxe4vQQTx47r6fs83MP5HEXihvc/yiIDU=;
        b=u9k7ncfvcFpW0ehFh8W3RPcXXe4LrsDbz7IvSeizVSu8tm4iRF+4l+fstQnxADLPwf
         i4c9nnl4byvIICFzdo8arW+mERzTGN19u/y1Oe9E4uHbB2FIR4IB/4tlSEGA8b11lASV
         1Amuy+GmPA+B5rLGhVHSVQ7hKATuYqH58YlpXPOwzXpqp/tgrRMPlHe/o5/85lU4ToME
         7VM86nJkKqW2sL8s578joy3lgIEnFV0uEva8u2vRtrP2c0u0ulgFt1clBYmIWpAQroMt
         ImE1rpc/HJ1JOm/jXnE+Y5URLISt+PkupH9K3njI4MkZq7km17ISNOg1lKD9DzdsJlCk
         AUlg==
X-Forwarded-Encrypted: i=1; AJvYcCU02wxFxhseBKiZoh5gduxWgtUoBNevdmz49oPJAVgkzhkmFCAByJXlB/YVAz81syz74qadFZ3hjHy8YyOW@vger.kernel.org, AJvYcCVtm04wOii6rUg9yFGM+jkX8guJ9+zhJvQEorYnt71e4mUNdy9V8DMjCVhrRYIv1h9xaKbAE4cRJYED@vger.kernel.org
X-Gm-Message-State: AOJu0YzqueylSZpqoFC0O6uP1KPbvddFXnk1r9/oCX5k5NT5qalYAz6e
	Xxo4w4KJvZaKhT5smniCk76ODlB/+pUNri1+r4dKWes3TkeaOMUoMMfle5NIIjq06XEQWnwyQVI
	+Wtnvr3BrBsmTQ1F7XXxvyvm9DSn+2ZE=
X-Gm-Gg: ASbGncvou7d88PaCtlTqKR1V2VIfkzQxEfXDAk/HWvuFI4BILRMxzObI3esJP661VjZ
	39TfdTDB6tz2yiL3h+f4GczXDEnvpBLAnIq4465z/NqYOrOdEcp5oc8J9g1DE0YxqOD18kGEkIU
	dAu7cfo7+ivvpMg7RSsZJFHUCxa16Dx8lQ+0KCghzLbKyMUtTE/gdgQn9N36Wf1aRxMw==
X-Google-Smtp-Source: AGHT+IHAyy7cOKoQrKo/qrn3FqhxEupKgT1BOK1u+EwZ6v7KzrpFo7ToVVNkwt6ARpY9qanwEAnINSvWr4g7fwW6JX0=
X-Received: by 2002:a05:622a:1927:b0:4a1:511a:b99f with SMTP id
 d75a77b69052e-4a5a573b2c3mr68994861cf.3.1749066864086; Wed, 04 Jun 2025
 12:54:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <6656934.DvuYhMxLoT@workhorse> <CABjd4Yx05SCm+03jWbsEP-A5AuhL14wLj=+VdKyQgqMbnxi3xQ@mail.gmail.com>
 <23482965.EfDdHjke4D@workhorse>
In-Reply-To: <23482965.EfDdHjke4D@workhorse>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 4 Jun 2025 23:54:14 +0400
X-Gm-Features: AX0GCFuLXULnMLr8rryeq8foOrYa4cmHNsLuY_-MFNEhem-Gq9QzyGKN9mE70Mw
Message-ID: <CABjd4YxBHn4f4QRVxk1uLGgt7-n=VQqF0_ZSJsKSxZuVtrLiaw@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 11:23=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Wednesday, 4 June 2025 21:12:35 Central European Summer Time Alexey Ch=
arkov wrote:
> > On Wed, Jun 4, 2025 at 10:38=E2=80=AFPM Nicolas Frattaroli
> > <nicolas.frattaroli@collabora.com> wrote:
> > >
> > > On Tuesday, 3 June 2025 19:01:13 Central European Summer Time Alexey =
Charkov wrote:
> > > > List both CPU supply regulators which drive the little and big CPU
> > > > clusters, respectively, so that cpufreq can pick them up.
> > > >
> > > > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > > > ---
> > > >  .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 28 ++++++++++=
++++++++++++
> > > >  1 file changed, 28 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b=
/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> > > > index b09e789c75c47fec7cf7e9810ab0dcca32d9404a..d9c129be55a0d997e04=
e6d677cdc98fb50353418 100644
> > > > --- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> > > > +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> > > > @@ -207,6 +207,22 @@ vcc_3v3_ufs_s0: regulator-vcc-ufs-s0 {
> > > >       };
> > > >  };
> > > >
> > > > +&cpu_b0 {
> > > > +     cpu-supply =3D <&vdd_cpu_big_s0>;
> > > > +};
> > > > +
> > > > +&cpu_b1 {
> > > > +     cpu-supply =3D <&vdd_cpu_big_s0>;
> > > > +};
> > > > +
> > > > +&cpu_b2 {
> > > > +     cpu-supply =3D <&vdd_cpu_big_s0>;
> > > > +};
> > > > +
> > > > +&cpu_b3 {
> > > > +     cpu-supply =3D <&vdd_cpu_big_s0>;
> > > > +};
> > > > +
> > > >  &combphy0_ps {
> > > >       status =3D "okay";
> > > >  };
> > > > @@ -215,6 +231,18 @@ &cpu_l0 {
> > > >       cpu-supply =3D <&vdd_cpu_lit_s0>;
> > > >  };
> > > >
> > > > +&cpu_l1 {
> > > > +     cpu-supply =3D <&vdd_cpu_lit_s0>;
> > > > +};
> > > > +
> > > > +&cpu_l2 {
> > > > +     cpu-supply =3D <&vdd_cpu_lit_s0>;
> > > > +};
> > > > +
> > > > +&cpu_l3 {
> > > > +     cpu-supply =3D <&vdd_cpu_lit_s0>;
> > > > +};
> > > > +
> > > >  &gmac0 {
> > > >       phy-mode =3D "rgmii-id";
> > > >       clock_in_out =3D "output";
> > > >
> > > >
> > >
> > > Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > >
> > > > so that cpufreq can pick them up.
> > >
> > > Fwiw, even without this patch they're picked up by cpufreq-dt for me:
> > >
> > >     user@trixie:~$ sudo cpupower frequency-info
> > >       analyzing CPU 5:
> > >       driver: cpufreq-dt
> > >       CPUs which run at the same hardware frequency: 4 5 6 7
> > >       CPUs which need to have their frequency coordinated by software=
: 4 5 6 7
> > >       maximum transition latency: 40.0 us
> > >       hardware limits: 408 MHz - 2.30 GHz
> > >       available frequency steps:  408 MHz, 600 MHz, 816 MHz, 1.01 GHz=
, 1.20 GHz, 1.42 GHz, 1.61 GHz, 1.80 GHz, 2.02 GHz, 2.21 GHz, 2.30 GHz
> > >       available cpufreq governors: ondemand userspace performance sch=
edutil
> > >       current policy: frequency should be within 408 MHz and 2.30 GHz=
.
> > >                       The governor "schedutil" may decide which speed=
 to use
> > >                       within this range.
> > >       current CPU frequency: 1.61 GHz (asserted by call to hardware)
> > >     user@trixie:~$ uname -a
> > >     Linux trixie 6.15.0-11173-g546b1c9e93c2 #2 SMP PREEMPT Wed Jun  4=
 20:32:52 CEST 2025 aarch64 GNU/Linux
> >
> > Frequencies are fine, but I don't think the more power hungry big CPU
> > cluster gets any voltage scaling without it. Once I try to load the
> > system enough that the governor decides to bump the big cluster
> > frequency up, the regulator stays at 850000 microvolts, causing random
> > reboots when the whole cluster starts starving. With the patch,
> > voltage oscillates between 700000-737000 microvolts in idle and jumps
> > up to 950000 under load, and the system seems stable.
>
> Okay, that sounds pretty serious and in this case you should add the
> following tag at the end of the commit message, usually as the first
> thing after the line break:
>
>   Fixes: 40f742b07ab2 ("arm64: dts: rockchip: Add rk3576-armsom-sige5 boa=
rd")
>
> That way, our stable kernel robot overlords will pick it up and
> backport it to the kernels that already contain the mentioned commit.

Will do, thanks!

Best regards,
Alexey
