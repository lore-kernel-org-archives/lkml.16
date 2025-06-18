Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BBD522F;
	Wed, 18 Jun 2025 14:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750255606; cv=pass; b=mqZB1xpB+OIcflVNN7BRdxqEhCrMEZMvDSXLikHDac4ob64jR9pkL/BtyxPExC/bHgqAMzbG0wtDJMM36m4GA1oJzYl2Jth+JKzw0KXugPBmVX3hCbnnKnoEqAwP51PBkaXbuWjijIufQkAb6o1lxOhF6eED/+D+krubdFsJPeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750255606; c=relaxed/simple;
	bh=hj3srasRo+5ur5rSqELAw8wT5z+tkgumudGWFKX2P2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KIVbUV4vDuYySsqn/Q3CeX+gpzco9mQM4b2DB4q3gnvm3cLT+/d/BM06yXXyb0HBgWsFc/p2BgFjEEFt9ZK69zwLhgkz2zIs+O4diQu9aLZtv7rYlPNnG6IFMNt3XKvj+Sfppn7BBIAew0dVBRgYxg2Q7/7g4TZ3bqUicJwU1ZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=KWKb9dyT; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="KWKb9dyT"
ARC-Seal: i=1; a=rsa-sha256; t=1750255583; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UJT88ereqHexP126cH3BC60Ftrjp3MqaeRhOmqhcCwuQnxgVIIJAhsOQ1++RlHCmrnLJDj/lhBtBkjpJFTpZGKVnPq/ZG3SQqKEbqPbpXhRK3o2ym1wkv5s0rlaph8qAzRi7Y4y269Scq+BUlZTZcNVkQCql3r07e1qGoWADdWU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750255583; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sjpDqdUdnROUzOr37FSSwpzItdKuL53Ug5lBdtcujlI=; 
	b=JII/6iHx9yKHuGNiWQYYxDWPsmXw2P8ma8rlDb+hPXjBdxY5tYLNZoRN11EvF+2l53WIxzSX+7/zpwHvt7r8ix5cvHZ+qHDwsObCKtP+T1aM6qXAUF2uT+IPCAWDX4Qa3AQkQ6ZFODJ5oOCvW7EclKrc7cuvGr42dgCuhlgyMvc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750255583;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=sjpDqdUdnROUzOr37FSSwpzItdKuL53Ug5lBdtcujlI=;
	b=KWKb9dyTTnE8TqT/+lG8I+cGzN4Z+SU2LVX/YPXnJA3oYWZzFxosbiZ7Mp2hPTwM
	2Y1wICXd9BawbTKCnENdQkVfLx27cEEsXOnvUrRWQlVkjnmgbqv51XXzr11PgIcqFvU
	7QLRs7lRFhhaKjUpPGZhAisMQIF8c3LDsBMZgL8g=
Received: by mx.zohomail.com with SMTPS id 1750255580611190.85093936823102;
	Wed, 18 Jun 2025 07:06:20 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
 Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>
Subject:
 Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
Date: Wed, 18 Jun 2025 16:06:16 +0200
Message-ID: <3286422.5fSG56mABF@workhorse>
In-Reply-To:
 <CABjd4YyVJv0NmF9LsGWQ-O44MGjT5=FFeUjbg5rJ6XkNgjxb+g@mail.gmail.com>
References:
 <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <80ACAAAE-F522-4199-9048-ADE69F6E1128@gmail.com>
 <CABjd4YyVJv0NmF9LsGWQ-O44MGjT5=FFeUjbg5rJ6XkNgjxb+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hello,

+Cc Jonas Karlman as he is intimately familiar with RK3576 clock shenanigan=
s by now,

On Wednesday, 18 June 2025 15:51:45 Central European Summer Time Alexey Cha=
rkov wrote:
> On Sun, Jun 15, 2025 at 8:00=E2=80=AFPM Piotr Oniszczuk
> <piotr.oniszczuk@gmail.com> wrote:
> >
> >
> >
> > > Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gmail.com>=
 w dniu 9 cze 2025, o godz. 16:05:
> > >
> > > On Sun, Jun 8, 2025 at 11:24=E2=80=AFAM Piotr Oniszczuk
> > > <piotr.oniszczuk@gmail.com> wrote:
> > >>> Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gmail.co=
m> w dniu 5 cze 2025, o godz. 15:42:
> > >>>> Alexey,
> > >>>> I see you are using rk3576 board like me (nanopi-m5)
> > >>>> Have you on your board correctly working cpu dvfs?
> > >>>> I mean: [1][desired clocks reported by kernel sysfs are in pair wi=
th [2[]cur clocks?
> > >>>> In my case i see mine cpu lives totally on it=E2=80=99s own with d=
vfs:
> > >>>
> > >>> Hi Piotr,
> > >>>
> > >>> I haven't tried to validate actual running frequencies vs. requested
> > >>> frequencies, but subjective performance and power consumption seem =
to
> > >>> be in line with what I expect.
> > >>
> > >> well - my subjective l&f is that  - currently - my rk3576 seems =E2=
=80=9Eslower" than i.e. 4xA53 h618.
> > >
> > > In my experience, native compilation of GCC 14 using 8 threads on
> > > RK3576 (mainline with passive cooling and throttling enabled): 2 hours
> > > 6 minutes, on RK3588 (mainline with passive cooling via Radxa Rock 5B
> > > case and throttling enabled but never kicking in): 1 hour 10 minutes
> >
> > by curiosity i looked randomly on 3576 vs 3588:
> > multithread passmark: 3675 (https://www.cpubenchmark.net/cpu.php?cpu=3D=
Rockchip+RK3576&id=3D6213)
> > multithread passmark: 4530 (https://www.cpubenchmark.net/cpu.php?cpu=3D=
Rockchip+RK3588&id=3D4906)
> >
> > assuming 3588 as baseline, 3576 is approx 20% slower on multithread pas=
smark (has ~0,8 comp power of 3588)
> > 70 min compile on 3588 should take something like ~86min on 3576.
> > In your case 126min compile on 3576 shows 3576 offers 0,55 comp power o=
f 3588.
> > Roughly 3576 should do this task in 40min less than you currently see i=
 think
> >
> >
> > > Can't see how u-boot would affect CPU speed in Linux, as long as you
> > > use comparable ATF images. Do you use the same kernel and dtb in all
> > > these cases? Also, what's your thermal setup?
> >
> > yes. in all cases only change was: uboot & atf
> > thermal is based on recent collabora series (+ recent pooling fix for c=
locks return from throttling)
> >
> > >
> > >
> > > Not sure UX is a particularly good measure of CPU performance, as long
> > > as you've got a properly accelerated DRM graphics pipeline. More
> > > likely 2D/3D and memory.
> >
> > indeed.
> > For quantified look i=E2=80=99m looking on v.simple approach to estimat=
e real clock is http://uob-hpc.github.io/2017/11/22/arm-clock-freq.html
> > by curiosity i looked what it reports on a53/a55/a72/a76 and it is surp=
risingly accurate :-)
> > on mine 3576 with collabora uboot+mainline atf is hows 800MHz (and in p=
erf. gov it seems to be constant)
> >
> > >
> > > There might be some difference in how PVTPLL behaves on RK3576 vs.
> > > RK3588. But frankly first I would check if you are using comparable
> > > ATF implementations (e.g. upstream TF-A in both cases), kernels and
> > > thermal environment :)
> >
> > all tests: the same 6.15.2 mainline + some collabora patches
> >
> > diffs were:
> > 1.collabora uboot[1] + mainline atf 2.13
> > 2.collabora uboot[1] + rockchip rkbin bl31 blob
> > 3.vendor uboot (bin dump from friendlyelec ubuntu image)
> >
> > on 1/2 i see kind of issue with clock values (i.e. perf gov gives const=
ant 800MHz on mainline atf).
> > 3 seems to perform better - (i.e. perf gov gives constant 1500MHz so al=
l is snappier/faster)
>=20
> There is indeed something weird going on. I've tried running sbc-bench
> [1], and even though I observe dynamically varying CPU frequencies
> after boot with schedutil governor, once sbc-bench switches the
> governor to "performance" and goes through the OPPs in descending
> frequency order, the CPUs seem to get stuck at the last applied low
> frequency. Even after max frequency gets reverted from 408 MHz to
> something higher, even after I switch the governor to something else -
> no matter what. Only a reboot gets the higher frequencies 'unstuck'
> for me.
>=20
> These are all observed at around 55C SoC temperature, so throttling is
> not an issue. Regulators are stuck at 950000 uV - way above 700000 uV
> that the 408 MHz OPP requires (and power readings seem to match: I'm
> getting about 2.3W consumption at 408 MHz in idle vs. normal idle
> reading of 1.4W at around 1 GHz).
>=20
> Not sure what's going on here, and I don't remember seeing anything
> similar on RK3588. Thoughts welcome.

This may once again be a "accidentally uses wrong clock IDs" type
situation. The other possibility is that we're getting confused
between what we think the clock rate is and what SCMI actually set
the clock rate to.

Things to check is whether the right clock controller (scmi vs cru)
and the right clock id (check ATF source for this) is used.

Kind regards,
Nicolas Frattaroli

>=20
> Best regards,
> Alexey
>=20
> [1] https://github.com/ThomasKaiser/sbc-bench
>=20




