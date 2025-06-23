Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B3D221299;
	Mon, 23 Jun 2025 21:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750713442; cv=none; b=m07ztay+rjLOucAcSBUG5DoiZtjcl+OARQDoap56l1BuPOb3kqfKcDMERyl3bR9X3AKmP+yEBqEF246uiEQFSVCUljjC7iOlgvzsEhVdy8Cfa73JrboXTEmlv/IfkuSzB6fqG7XGv60Dcn9lNU/YYq3tiDayhR76VZmwed3PLhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750713442; c=relaxed/simple;
	bh=T1gbs+ME0Z/CPRQJWSWlq3sPr3dmhric/2Lq5B04QoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aDpIioynG1EfhbfljTF0LIssLg3kRdUSk87v/hCgg/7kbTNuqEIsNTjFt/OElMhVrd+IVjlkbZAWy+uKzqc8Akec4x7FgXoPllPPHwlrIruKYqEieFTTESYdC69tPT1ULZ7Cu8Drx86ApsEKRt61y7bQ+AybOTVnF+f3wQ2zkPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=NBBdcAa1; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="NBBdcAa1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=U3UErYnrVYZ1g9kUUb3a1dfR1/w+hPH2Q/0/oF/UJJM=; b=NBBdcAa17Q+xwBYcEk2T6MBbry
	w7IWwueFxcfmjTlpHwOGRhXYx5Fuy0Z+BbUbgg9Va1yENMiAG2uL4ZAFmI+LKgJ+qMR9O+Rj+DMnM
	Mf6QJ+ALWgWZxJL4mGvlqr+tVfF3BKK3cgqEO6LzZI+CDS1eSTU5cC12HQJpqCwRRPQihZJCcGQui
	/fNd/rcdv0yWaazQDq9y4npbIarXGCzCMf+996ZwLU1wH0rpbucuPRZ30hdnZoE2y3j56zr0bMGiq
	8+7rqqKvZUQR5xEbiDf5zgOdHekB+imCHSnFp81KD5lQJE4FZmUu6UHVyfSzKbdzxpQTYftX/b7Mh
	Sty6zhGw==;
Received: from [185.15.108.45] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uToXM-0006NM-Cv; Mon, 23 Jun 2025 23:17:08 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
 Alexey Charkov <alchark@gmail.com>, Jonas Karlman <jonas@kwiboo.se>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 XiaoDong Huang <derrick.huang@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
Date: Mon, 23 Jun 2025 23:17:06 +0200
Message-ID: <12692993.O9o76ZdvQC@phil>
In-Reply-To: <90b7a1b6-bc49-414d-9cde-e6fad46d2650@kwiboo.se>
References:
 <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <dd1d0676-4eaa-4df7-b557-676b3de9a52e@kwiboo.se>
 <90b7a1b6-bc49-414d-9cde-e6fad46d2650@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Montag, 23. Juni 2025, 23:07:53 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Jonas Karlman:
> On 2025-06-23 19:40, Jonas Karlman wrote:
> > On 2025-06-23 17:02, Piotr Oniszczuk wrote:
> >>
> >>
> >>> Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gmail.com>=
 w dniu 23 cze 2025, o godz. 15:58:
> >>>
> >>> On Mon, Jun 23, 2025 at 1:19=E2=80=AFPM Alexey Charkov <alchark@gmail=
=2Ecom> wrote:
> >>>>
> >>>>
> >>>
> >>> Okay, I've bisected this.
> >>>
> >>> TLDR: Linux and u-boot seem to have nothing to do with it, opensource
> >>> TF-A doesn't work, binary BL31 starting with v1.09 do not work. BL31
> >>> v1.08 and earlier work fine.
> >=20
> > v1.09 added support for 1 GHz hrtimer in addition to the normal 24 MHz
> > rate. Mainline U-Boot may only support use of 24 MHz hrtimer, unsure
> > what impact the hrtimer rate has. Mixing blobs with/without 1 GHz
> > support is known to cause issues. At one point the latest rkbin tree may
> > have contained incompatible rk3576 blobs (mixed 1 ghz vs 24 mhz rate).
>=20
> Clarification:
> Following boot1 parameter activates use of 1 GHz hrtimer, see [3].
>=20
> This parameter was added to rkbin repo before all blobs was updated to
> fully support use of the 1 ghz mode, and is the source for incompatible
> blobs I referenced above.
>=20
>   [BOOT1_PARAM]
>   WORD_2=3D0x100

which I guess is something we don't do in u-boot at all right now?
Which would also mean, that something may have broken with the 24MHz mode
when the 1GHz thing was added. And nobody ever realized that because the
Rockchip thing uses that boot param for all of them?


>=20
> [3] https://github.com/rockchip-linux/rkbin/commit/cbbc6868221fb416d4f0d8=
6a10e493dbbbc1f117
>=20
> Regards,
> Jonas
>=20
> >=20
> > Did you try with newer blobs, i.e. ddr init v1.09, bl31 v1.19 blobs [1]
> > and mainline U-Boot [2] ?
> >=20
> > [1] https://github.com/radxa/rkbin/commits/develop-v2025.04/
> > [2] https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/commits/=
rk3576
> >=20
> > Regards,
> > Jonas
> >=20
> >>
> >>
> >> just fyi:=20
> >> to confirm: replacing only bl31 to 1.08 makes all good
> >> with perf gov. clocks staying on 2200/2300
> >> clock estimations are predictable, constant and estimating constantly =
2400
> >> ux is =E2=80=9Elike=E2=80=9D on 3588
> >>
> >> Alexey: many thx for finding root cause component!
> >>  =20
> >>   =20
> >=20
>=20
>=20




