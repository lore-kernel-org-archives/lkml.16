Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944632701D0;
	Sat, 21 Jun 2025 19:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750535109; cv=none; b=hh5xlhnPAqiKLP8E8R5GgjKrMHMoGUHiu3PIQVSqU0ZfUgI988knenZgI/1tYizdLs2FsFoUsLvLNjdmHEnGNVIE51aRLUmgBhZFASPg0dRjZfJ8xhrzSI/IU2vgkrPw3aNdB0i+KfhAXR+ktfPFf9utR/6xw8AHtu73vVzi90c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750535109; c=relaxed/simple;
	bh=QbJZz1UUlcSLFozRjDN57K8OtIIm7LVQDWvBVpCR+pw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xu0yZrculbEiDnNvaquPxo/8Rvn9TYuXX4y2czXeqTUd6kVAJKpH1eGC/XD3bWpPULdsZhUV9w9tsYm6eFdNZcpzZdv3TJ1CDjknGZzA51iydbDpXoGCzbyCs7CwGRjt2RrBzx8RjNWOSfznc2X0VqjtylHTeCKR+wRLpkV8IBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=DGDhiXy2; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="DGDhiXy2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=sv7tVvQqmX8wrxpnSPIrKw5fwx/VJrEZXKziP/cE/wA=; b=DGDhiXy2ZmXXe8djpbO/KLT8ds
	OGeIMfxbnL/T9yqOfqADJBrbW/xtkMtknrYz3+Rh63HKvCrRDxWA53WBQoe1nkekxC9hinOffxRhz
	GUoWIQGkmFRopIZhs/gPj6OawoQ9nMtCnV2piDBqsiElWJibPF9MEVEB6D4U9TydYNwRqM4Ih4ods
	81YZ8AOgcjaT5yrYe6EEkS43s/acUAsdgp5enPbXFFD/yrrGKQlyFmUaWewOKsjE9i0uDuGDu4qQB
	Kosc9EKH1aBqtsJtwZXfbg97pWUU70JA7KFzCZMnkv4fNUURKQe+7Y70JyD7govW+WnpoGQgU5NNl
	ak4ojmeg==;
Received: from 85-207-219-154.static.bluetone.cz ([85.207.219.154] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uT491-0002yL-Bp; Sat, 21 Jun 2025 21:44:55 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 XiaoDong Huang <derrick.huang@rock-chips.com>,
 Alexey Charkov <alchark@gmail.com>
Cc: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>
Subject:
 Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
Date: Sat, 21 Jun 2025 21:44:54 +0200
Message-ID: <3286000.Y6S9NjorxK@phil>
In-Reply-To:
 <CABjd4YyBoTkNcFVDcYFXt1mNh==wTa1pO7BTmam6CX68rrF=oQ@mail.gmail.com>
References:
 <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <CABjd4YwrBurnKOAqXK_wFj0c7bEV-PZ682_-1y_VNMPvFrJ-Aw@mail.gmail.com>
 <CABjd4YyBoTkNcFVDcYFXt1mNh==wTa1pO7BTmam6CX68rrF=oQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Samstag, 21. Juni 2025, 21:35:56 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Alexey Charkov:
> On Fri, Jun 20, 2025 at 8:02=E2=80=AFPM Alexey Charkov <alchark@gmail.com=
> wrote:
> >
> > On Wed, Jun 18, 2025 at 6:48=E2=80=AFPM Alexey Charkov <alchark@gmail.c=
om> wrote:
> > >
> > > On Wed, Jun 18, 2025 at 6:06=E2=80=AFPM Nicolas Frattaroli
> > > <nicolas.frattaroli@collabora.com> wrote:
> > > >
> > > > Hello,
> > > >
> > > > +Cc Jonas Karlman as he is intimately familiar with RK3576 clock sh=
enanigans by now,
> > > >
> > > > On Wednesday, 18 June 2025 15:51:45 Central European Summer Time Al=
exey Charkov wrote:
> > > > > On Sun, Jun 15, 2025 at 8:00=E2=80=AFPM Piotr Oniszczuk
> > > > > <piotr.oniszczuk@gmail.com> wrote:
> > > > > >
> > > > > >
> > > > > >
> > > > > > > Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gm=
ail.com> w dniu 9 cze 2025, o godz. 16:05:
> > > > > > >
> > > > > > > On Sun, Jun 8, 2025 at 11:24=E2=80=AFAM Piotr Oniszczuk
> > > > > > > <piotr.oniszczuk@gmail.com> wrote:
> > > > > > >>> Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@=
gmail.com> w dniu 5 cze 2025, o godz. 15:42:
> > > > > > >>>> Alexey,
> > > > > > >>>> I see you are using rk3576 board like me (nanopi-m5)
> > > > > > >>>> Have you on your board correctly working cpu dvfs?
> > > > > > >>>> I mean: [1][desired clocks reported by kernel sysfs are in=
 pair with [2[]cur clocks?
> > > > > > >>>> In my case i see mine cpu lives totally on it=E2=80=99s ow=
n with dvfs:
> > > > > > >>>
> > > > > > >>> Hi Piotr,
> > > > > > >>>
> > > > > > >>> I haven't tried to validate actual running frequencies vs. =
requested
> > > > > > >>> frequencies, but subjective performance and power consumpti=
on seem to
> > > > > > >>> be in line with what I expect.
> > > > > > >>
> > > > > > >> well - my subjective l&f is that  - currently - my rk3576 se=
ems =E2=80=9Eslower" than i.e. 4xA53 h618.
> > > > > > >
> > > > > > > In my experience, native compilation of GCC 14 using 8 thread=
s on
> > > > > > > RK3576 (mainline with passive cooling and throttling enabled)=
: 2 hours
> > > > > > > 6 minutes, on RK3588 (mainline with passive cooling via Radxa=
 Rock 5B
> > > > > > > case and throttling enabled but never kicking in): 1 hour 10 =
minutes
> > > > > >
> > > > > > by curiosity i looked randomly on 3576 vs 3588:
> > > > > > multithread passmark: 3675 (https://www.cpubenchmark.net/cpu.ph=
p?cpu=3DRockchip+RK3576&id=3D6213)
> > > > > > multithread passmark: 4530 (https://www.cpubenchmark.net/cpu.ph=
p?cpu=3DRockchip+RK3588&id=3D4906)
> > > > > >
> > > > > > assuming 3588 as baseline, 3576 is approx 20% slower on multith=
read passmark (has ~0,8 comp power of 3588)
> > > > > > 70 min compile on 3588 should take something like ~86min on 357=
6.
> > > > > > In your case 126min compile on 3576 shows 3576 offers 0,55 comp=
 power of 3588.
> > > > > > Roughly 3576 should do this task in 40min less than you current=
ly see i think
> > > > > >
> > > > > >
> > > > > > > Can't see how u-boot would affect CPU speed in Linux, as long=
 as you
> > > > > > > use comparable ATF images. Do you use the same kernel and dtb=
 in all
> > > > > > > these cases? Also, what's your thermal setup?
> > > > > >
> > > > > > yes. in all cases only change was: uboot & atf
> > > > > > thermal is based on recent collabora series (+ recent pooling f=
ix for clocks return from throttling)
> > > > > >
> > > > > > >
> > > > > > >
> > > > > > > Not sure UX is a particularly good measure of CPU performance=
, as long
> > > > > > > as you've got a properly accelerated DRM graphics pipeline. M=
ore
> > > > > > > likely 2D/3D and memory.
> > > > > >
> > > > > > indeed.
> > > > > > For quantified look i=E2=80=99m looking on v.simple approach to=
 estimate real clock is http://uob-hpc.github.io/2017/11/22/arm-clock-freq.=
html
> > > > > > by curiosity i looked what it reports on a53/a55/a72/a76 and it=
 is surprisingly accurate :-)
> > > > > > on mine 3576 with collabora uboot+mainline atf is hows 800MHz (=
and in perf. gov it seems to be constant)
> > > > > >
> > > > > > >
> > > > > > > There might be some difference in how PVTPLL behaves on RK357=
6 vs.
> > > > > > > RK3588. But frankly first I would check if you are using comp=
arable
> > > > > > > ATF implementations (e.g. upstream TF-A in both cases), kerne=
ls and
> > > > > > > thermal environment :)
> > > > > >
> > > > > > all tests: the same 6.15.2 mainline + some collabora patches
> > > > > >
> > > > > > diffs were:
> > > > > > 1.collabora uboot[1] + mainline atf 2.13
> > > > > > 2.collabora uboot[1] + rockchip rkbin bl31 blob
> > > > > > 3.vendor uboot (bin dump from friendlyelec ubuntu image)
> > > > > >
> > > > > > on 1/2 i see kind of issue with clock values (i.e. perf gov giv=
es constant 800MHz on mainline atf).
> > > > > > 3 seems to perform better - (i.e. perf gov gives constant 1500M=
Hz so all is snappier/faster)
> > > > >
> > > > > There is indeed something weird going on. I've tried running sbc-=
bench
> > > > > [1], and even though I observe dynamically varying CPU frequencies
> > > > > after boot with schedutil governor, once sbc-bench switches the
> > > > > governor to "performance" and goes through the OPPs in descending
> > > > > frequency order, the CPUs seem to get stuck at the last applied l=
ow
> > > > > frequency. Even after max frequency gets reverted from 408 MHz to
> > > > > something higher, even after I switch the governor to something e=
lse -
> > > > > no matter what. Only a reboot gets the higher frequencies 'unstuc=
k'
> > > > > for me.
> > > > >
> > > > > These are all observed at around 55C SoC temperature, so throttli=
ng is
> > > > > not an issue. Regulators are stuck at 950000 uV - way above 70000=
0 uV
> > > > > that the 408 MHz OPP requires (and power readings seem to match: =
I'm
> > > > > getting about 2.3W consumption at 408 MHz in idle vs. normal idle
> > > > > reading of 1.4W at around 1 GHz).
> > > > >
> > > > > Not sure what's going on here, and I don't remember seeing anythi=
ng
> > > > > similar on RK3588. Thoughts welcome.
> > > >
> > > > This may once again be a "accidentally uses wrong clock IDs" type
> > > > situation. The other possibility is that we're getting confused
> > > > between what we think the clock rate is and what SCMI actually set
> > > > the clock rate to.
> > > >
> > > > Things to check is whether the right clock controller (scmi vs cru)
> > > > and the right clock id (check ATF source for this) is used.
> > >
> > > Clock IDs in the kernel seem to match those in ATF, but I've noticed
> > > what appears to be a buffer overflow in some of the SCMI clock names
> > > defined in the opensource TF-A (thanks GCC 15 and its zealous
> > > warnings):
> >
> > After some more testing, I tend to confirm what Piotr observed
> > earlier. Namely, frequency scaling acts weird on any ATF version (be
> > it binary BL31 or opensource TF-A), as long as mainline u-boot is
> > used. Using the u-boot binary extracted from the ArmSoM QWRT image
> > does not lead to "stuck" CPU frequencies when running sbc-bench.
> >
> > I'm getting this with the exact same kernel build (6.16-rc1 with some
> > Sige5 related patches, namely v2 of this series, Nicolas' USB
> > enablement series and TSADC). The only other difference is that the
> > binary u-boot doesn't have EFI support, so I had to boot into the
> > ARM64 uncompressed Image instead of vmlinuz.efi, but those were both
> > taken from the same build.
> >
> > What I'm observing during the sbc-bench run:
> >  - It switches the cpufreq governor from schedutil to performance
> >  - It goes through all CPU OPPs in descending frequency order
> >  --- While it does that when booted using mainline u-boot +
> > vmlinuz.efi: "hardware limits" line in "cpupower -c 0,4
> > frequency-info" changes with each OPP change (the max frequency
> > getting reduced sequentially), then it resets to the initial full
> > range, but the actual frequency stays stuck at the lowest possible
> > value
> >  --- While it does that when booted using binary u-boot + Image:
> > "hardware limits" line in "cpupower -c 0,4 frequency-info" doesn't
> > change, but the actual frequency gets reduced sequentially. Then after
> > the iteration over all OPPs is completed it returns to the highest
> > possible value, and adjusts dynamically based on thermal throttling as
> > the benchmark progresses
>=20
> Slight correction: it's not the "hardware limits" line, but rather
> "current policy".
>=20
> Note that booting mainline u-boot in non-EFI mode (using plain Image)
> doesn't change the results above.

I'm in a similar boat, while trying to make DSI run on the rk3576.
Andy from Rockchip was able to make it work "just" by using vendor-
firmware - while using mainline u-boot (with both mainline TF-A
or vendor TF-A) produces just black output.

I think when I did the mainline u-boot thing I took the "vendor"-code
from the armbian rk3576 vendor-u-boot ... but that actually may differ
from what the vendors provided?

Because at least looking at that code did not show any clock differences
to me.


> > So it seems that it's not really linked to SCMI clocks or PVTPLL per
> > se, but rather what the binary u-boot configures differently vs.
> > mainline before the kernel takes over, or something in other firmware
> > services that the binary u-boot provides (?)
> >
> > I'm wondering if there is any clock related functionality in the
> > OP-TEE? I didn't have any OP-TEE image in my mainline u-boot builds
> > (frankly, I don't even know where to grab one), but the binary u-boot
> > from ArmSoM advertises the following:
> >
> > I/TC: OP-TEE version: 3.13.0-791-g185dc3c92 #hisping.lin (gcc version
> > 10.2.1 20201103 (GNU Toolchain for the A-profile Architecture
> > 10.2-2020.11 (arm-10.16))) #2 Tue Apr 16 11:05:25 CST 2024 aarch64,
> > fwver: v1.01
>=20
> FTR: I've tried to bluntly wrap rk3576_bl32_v1.05.bin into an ELF file
> using the following linker script and feed it as $TEE to the mainline
> u-boot build, but the resulting u-boot-rockchip.bin gets stuck at boot
> after checking hashes of ATF images, so I'm still lost as to how one
> can check if the OP-TEE has any influence on the cpufreq behavior.
>=20
> ---
> ENTRY(_binary_rk3576_bl32_v1_05_bin_start);
>=20
> SECTIONS
> {
>         . =3D 0x08400000;
>         .data : {
>                 *(.data)
>         }
> }
> ---
>=20
> 0x08400000 is the addr listed for BL32 in RK3576TRUST.ini in rkbin.
>=20
> Best regards,
> Alexey
>=20




