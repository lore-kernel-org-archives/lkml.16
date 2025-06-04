Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601D2202C44;
	Wed,  4 Jun 2025 19:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749065032; cv=pass; b=pZtIp+fP/VlrDnWbA3zHx7tzopQPYdyvhNquwANomh8WvnStP5OJdFZ+YJOXqVW/jhgJAIbcKfUs1f1eQfHNNeVAD1h/0iWm9QSrykljLGZJ3uyeO0EgQuymKzD+dU6y6ob/YiPi8e5C62CB5KFQ6Yd8hHuFOKajUAfeVCmkXLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749065032; c=relaxed/simple;
	bh=syUhhHsipbTpBl9ygoyFFcUTcxOfTKqtwlEB/vlrEMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mtlUCqIjC6WAZ6taTYLRhF/fz8rE0QmOJYD6gg2hiu/Hew+aP3+21jfPn320og3gWSMs9iqXvluIr9FFh9F4K0I0oLqdDSy/Mk9RfHHIvGHlpvvqhOW+SVPWQFHybbTpZYe7tvKrUn7PQXRSm69vmnzwUe+JG0YMRBcRZpVW0ro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=JY/fdBxk; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="JY/fdBxk"
ARC-Seal: i=1; a=rsa-sha256; t=1749065007; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Z5hbGG59HyjhN4Hd22Jpqs9Ye08p54dElHM8fk57RTIt4kGKjVEGHtkUyWMBAReaKMfcONZOSQCMYf4szBIykeFhqzTLGsi9r8P/ysQMPxjCO/cB6TiRQAdGgwciuvjLOKXoyRfuKHV8y0bWLZwUVZ4W3w7WeCmaedbInRAgSZ8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749065007; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kXSt0WPyJdE3zC65/zXJeztOuAlaCmnXB8Js7D/bSQ8=; 
	b=CzddvxqDRy00+fEBSWx2h9T1AYu1jW9D8OhJd9Of+OBPljLjFP8PbUUFrOMCk3/LSqpCBW47tqzXJ8sDF3DIKmDsbQP1/aKlorOBpIM6zFE29ej5Hu9np+5G2w8p7QrW7UTlnhBYbuEctpIy0kefb7vCPmVyde3wXIOTu8Z3wNo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749065007;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=kXSt0WPyJdE3zC65/zXJeztOuAlaCmnXB8Js7D/bSQ8=;
	b=JY/fdBxk20i7dBX4AV6BwwBbylRllfJ7eG4LIG3LUuyWeXebMSn2xFRv8XQ+10Eq
	FJ23Odtpp3AEdcchXi3utD9u5+rhKjRCTjVhQm7MObnOVGREGod7+14LS7JqWutepCm
	EyxkkBSXrY2dT0Qrg4FYgryIZVRmuoXSznnfbXe4=
Received: by mx.zohomail.com with SMTPS id 1749065006388272.56864063119986;
	Wed, 4 Jun 2025 12:23:26 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
Date: Wed, 04 Jun 2025 21:23:23 +0200
Message-ID: <23482965.EfDdHjke4D@workhorse>
In-Reply-To:
 <CABjd4Yx05SCm+03jWbsEP-A5AuhL14wLj=+VdKyQgqMbnxi3xQ@mail.gmail.com>
References:
 <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <6656934.DvuYhMxLoT@workhorse>
 <CABjd4Yx05SCm+03jWbsEP-A5AuhL14wLj=+VdKyQgqMbnxi3xQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Wednesday, 4 June 2025 21:12:35 Central European Summer Time Alexey Char=
kov wrote:
> On Wed, Jun 4, 2025 at 10:38=E2=80=AFPM Nicolas Frattaroli
> <nicolas.frattaroli@collabora.com> wrote:
> >
> > On Tuesday, 3 June 2025 19:01:13 Central European Summer Time Alexey Ch=
arkov wrote:
> > > List both CPU supply regulators which drive the little and big CPU
> > > clusters, respectively, so that cpufreq can pick them up.
> > >
> > > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > > ---
> > >  .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 28 ++++++++++++=
++++++++++
> > >  1 file changed, 28 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/a=
rch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> > > index b09e789c75c47fec7cf7e9810ab0dcca32d9404a..d9c129be55a0d997e04e6=
d677cdc98fb50353418 100644
> > > --- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> > > +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> > > @@ -207,6 +207,22 @@ vcc_3v3_ufs_s0: regulator-vcc-ufs-s0 {
> > >       };
> > >  };
> > >
> > > +&cpu_b0 {
> > > +     cpu-supply =3D <&vdd_cpu_big_s0>;
> > > +};
> > > +
> > > +&cpu_b1 {
> > > +     cpu-supply =3D <&vdd_cpu_big_s0>;
> > > +};
> > > +
> > > +&cpu_b2 {
> > > +     cpu-supply =3D <&vdd_cpu_big_s0>;
> > > +};
> > > +
> > > +&cpu_b3 {
> > > +     cpu-supply =3D <&vdd_cpu_big_s0>;
> > > +};
> > > +
> > >  &combphy0_ps {
> > >       status =3D "okay";
> > >  };
> > > @@ -215,6 +231,18 @@ &cpu_l0 {
> > >       cpu-supply =3D <&vdd_cpu_lit_s0>;
> > >  };
> > >
> > > +&cpu_l1 {
> > > +     cpu-supply =3D <&vdd_cpu_lit_s0>;
> > > +};
> > > +
> > > +&cpu_l2 {
> > > +     cpu-supply =3D <&vdd_cpu_lit_s0>;
> > > +};
> > > +
> > > +&cpu_l3 {
> > > +     cpu-supply =3D <&vdd_cpu_lit_s0>;
> > > +};
> > > +
> > >  &gmac0 {
> > >       phy-mode =3D "rgmii-id";
> > >       clock_in_out =3D "output";
> > >
> > >
> >
> > Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> >
> > > so that cpufreq can pick them up.
> >
> > Fwiw, even without this patch they're picked up by cpufreq-dt for me:
> >
> >     user@trixie:~$ sudo cpupower frequency-info
> >       analyzing CPU 5:
> >       driver: cpufreq-dt
> >       CPUs which run at the same hardware frequency: 4 5 6 7
> >       CPUs which need to have their frequency coordinated by software: =
4 5 6 7
> >       maximum transition latency: 40.0 us
> >       hardware limits: 408 MHz - 2.30 GHz
> >       available frequency steps:  408 MHz, 600 MHz, 816 MHz, 1.01 GHz, =
1.20 GHz, 1.42 GHz, 1.61 GHz, 1.80 GHz, 2.02 GHz, 2.21 GHz, 2.30 GHz
> >       available cpufreq governors: ondemand userspace performance sched=
util
> >       current policy: frequency should be within 408 MHz and 2.30 GHz.
> >                       The governor "schedutil" may decide which speed t=
o use
> >                       within this range.
> >       current CPU frequency: 1.61 GHz (asserted by call to hardware)
> >     user@trixie:~$ uname -a
> >     Linux trixie 6.15.0-11173-g546b1c9e93c2 #2 SMP PREEMPT Wed Jun  4 2=
0:32:52 CEST 2025 aarch64 GNU/Linux
>=20
> Frequencies are fine, but I don't think the more power hungry big CPU
> cluster gets any voltage scaling without it. Once I try to load the
> system enough that the governor decides to bump the big cluster
> frequency up, the regulator stays at 850000 microvolts, causing random
> reboots when the whole cluster starts starving. With the patch,
> voltage oscillates between 700000-737000 microvolts in idle and jumps
> up to 950000 under load, and the system seems stable.

Okay, that sounds pretty serious and in this case you should add the
following tag at the end of the commit message, usually as the first
thing after the line break:

  Fixes: 40f742b07ab2 ("arm64: dts: rockchip: Add rk3576-armsom-sige5 board=
")

That way, our stable kernel robot overlords will pick it up and
backport it to the kernels that already contain the mentioned commit.

>=20
> Here's what I used to monitor the voltage (there must be a better way
> to do it, but it works):
> sige5 ~ # watch cat `grep -r . /sys/class/regulator/*/name | grep
> vdd_cpu_big_s0 | sed -e 's/name.*//'`/microvolts
>=20
> And in another terminal:
> sige5 ~ # stress-ng -c8
>=20
> This might warrant a note in the commit message I guess :)

Yes, definitely mention stuff like this in the commit message.

>=20
> Thanks for your review and testing!
>=20
> Best regards,
> Alexey
>=20

Kind regards,
Nicolas Frattaroli


