Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76D98494;
	Sun, 22 Jun 2025 13:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750600145; cv=none; b=hhA3LpP32Jw2dqG6mPL7ZdsOSrT1et99dMlOtY0//XIsoX4rD9mbwSYVo7Evk9+fS3rcOO4Bdf3QGKe8CJK9HerbIZVEyieALBWCML6uuRBLIMzcl2VWX9NVu05yikDsjrs638diNKLbQFTAGUHCkc8C8GFup4cBnk3MijZNhP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750600145; c=relaxed/simple;
	bh=MZrRQRzoFSPquAv6RUKasJ8XUjg40gPM+juiPhWbeJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RPdbYyf+s1cit4hZ6HL1dpItD1lcGOP4H8/Eyayw2HkcbmEymCTc0BnAxerOz+I2yF/qz8i2meqiLEvKFrK4xrq+uj3Z04ux9aBJ0GBv8AyVLBZWNYlYgEMGqcNYj+ZnuNSLvVlj7YCuRec69Mizst4G+SxxMuWRtvPA6XzPwaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=0yqyLpAV; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="0yqyLpAV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=oFDaay6ObVe+UiujVij89FfjrwGtWai4DDnEmqpInLE=; b=0yqyLpAVlfQnyyUFI3XCCmjU/d
	hRDtO8qUnFY9FQx7ktw8FLvqR0u9rtq4nycjmwVs+TEWQrDNBDZ0WkVwumb9volVpfH1lzAbpFxr2
	t2szVJ7sD3VRredSZ24Xk6v44DlJU8HqrOktbMfJCE55V8OrrPhn7Aa/BtrnL2rOOdDN1M+PEb3Bh
	ltnZadRUDO5AexCLF0Tnm+t+vOrWyHfKjSxxbTFR3Ok7MPxaWv+xHjcUaT6Qf+crEeJgAjIW/WEKk
	nu7zHQwgHKLb/fvRJaJAbqJ7Mc9jj1I+19AF/6t8ZRfTxVUI1s6ifcwGqBQryEd/6UF3vR5YPc77C
	NBhEDGrw==;
Received: from [185.15.108.45] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uTL3y-0004W7-K6; Sun, 22 Jun 2025 15:48:50 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Alexey Charkov <alchark@gmail.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 XiaoDong Huang <derrick.huang@rock-chips.com>,
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>
Subject:
 Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
Date: Sun, 22 Jun 2025 15:48:49 +0200
Message-ID: <5897576.DvuYhMxLoT@phil>
In-Reply-To:
 <CABjd4YyaNF1zosFFi6hEsZanPDxoaa1h4Dpd6uTPRwA3BZn0=w@mail.gmail.com>
References:
 <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <3286000.Y6S9NjorxK@phil>
 <CABjd4YyaNF1zosFFi6hEsZanPDxoaa1h4Dpd6uTPRwA3BZn0=w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Samstag, 21. Juni 2025, 23:21:11 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Alexey Charkov:
> On Sat, Jun 21, 2025 at 11:44=E2=80=AFPM Heiko Stuebner <heiko@sntech.de>=
 wrote:
> >
> > Am Samstag, 21. Juni 2025, 21:35:56 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Alexey Charkov:
> > > On Fri, Jun 20, 2025 at 8:02=E2=80=AFPM Alexey Charkov <alchark@gmail=
=2Ecom> wrote:
> > > >
> > > > On Wed, Jun 18, 2025 at 6:48=E2=80=AFPM Alexey Charkov <alchark@gma=
il.com> wrote:
> > > > >
> > > > > On Wed, Jun 18, 2025 at 6:06=E2=80=AFPM Nicolas Frattaroli
> > > > > <nicolas.frattaroli@collabora.com> wrote:
> > > > > >
> > > > > > Hello,
> > > > > >
> > > > > > +Cc Jonas Karlman as he is intimately familiar with RK3576 cloc=
k shenanigans by now,
> > > > > >
> > > > > > On Wednesday, 18 June 2025 15:51:45 Central European Summer Tim=
e Alexey Charkov wrote:
> > > > > > > On Sun, Jun 15, 2025 at 8:00=E2=80=AFPM Piotr Oniszczuk
> > > > > > > <piotr.oniszczuk@gmail.com> wrote:
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > > > Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchar=
k@gmail.com> w dniu 9 cze 2025, o godz. 16:05:
> > > > > > > > >
> > > > > > > > > On Sun, Jun 8, 2025 at 11:24=E2=80=AFAM Piotr Oniszczuk
> > > > > > > > > <piotr.oniszczuk@gmail.com> wrote:
> > > > > > > > >>> Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alch=
ark@gmail.com> w dniu 5 cze 2025, o godz. 15:42:
> > > > > > > > >>>> Alexey,
> > > > > > > > >>>> I see you are using rk3576 board like me (nanopi-m5)
> > > > > > > > >>>> Have you on your board correctly working cpu dvfs?
> > > > > > > > >>>> I mean: [1][desired clocks reported by kernel sysfs ar=
e in pair with [2[]cur clocks?
> > > > > > > > >>>> In my case i see mine cpu lives totally on it=E2=80=99=
s own with dvfs:
> > > > > > > > >>>
> > > > > > > > >>> Hi Piotr,
> > > > > > > > >>>
> > > > > > > > >>> I haven't tried to validate actual running frequencies =
vs. requested
> > > > > > > > >>> frequencies, but subjective performance and power consu=
mption seem to
> > > > > > > > >>> be in line with what I expect.
> > > > > > > > >>
> > > > > > > > >> well - my subjective l&f is that  - currently - my rk357=
6 seems =E2=80=9Eslower" than i.e. 4xA53 h618.
> > > > > > > > >
> > > > > > > > > In my experience, native compilation of GCC 14 using 8 th=
reads on
> > > > > > > > > RK3576 (mainline with passive cooling and throttling enab=
led): 2 hours
> > > > > > > > > 6 minutes, on RK3588 (mainline with passive cooling via R=
adxa Rock 5B
> > > > > > > > > case and throttling enabled but never kicking in): 1 hour=
 10 minutes
> > > > > > > >
> > > > > > > > by curiosity i looked randomly on 3576 vs 3588:
> > > > > > > > multithread passmark: 3675 (https://www.cpubenchmark.net/cp=
u.php?cpu=3DRockchip+RK3576&id=3D6213)
> > > > > > > > multithread passmark: 4530 (https://www.cpubenchmark.net/cp=
u.php?cpu=3DRockchip+RK3588&id=3D4906)
> > > > > > > >
> > > > > > > > assuming 3588 as baseline, 3576 is approx 20% slower on mul=
tithread passmark (has ~0,8 comp power of 3588)
> > > > > > > > 70 min compile on 3588 should take something like ~86min on=
 3576.
> > > > > > > > In your case 126min compile on 3576 shows 3576 offers 0,55 =
comp power of 3588.
> > > > > > > > Roughly 3576 should do this task in 40min less than you cur=
rently see i think
> > > > > > > >
> > > > > > > >
> > > > > > > > > Can't see how u-boot would affect CPU speed in Linux, as =
long as you
> > > > > > > > > use comparable ATF images. Do you use the same kernel and=
 dtb in all
> > > > > > > > > these cases? Also, what's your thermal setup?
> > > > > > > >
> > > > > > > > yes. in all cases only change was: uboot & atf
> > > > > > > > thermal is based on recent collabora series (+ recent pooli=
ng fix for clocks return from throttling)
> > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > Not sure UX is a particularly good measure of CPU perform=
ance, as long
> > > > > > > > > as you've got a properly accelerated DRM graphics pipelin=
e. More
> > > > > > > > > likely 2D/3D and memory.
> > > > > > > >
> > > > > > > > indeed.
> > > > > > > > For quantified look i=E2=80=99m looking on v.simple approac=
h to estimate real clock is http://uob-hpc.github.io/2017/11/22/arm-clock-f=
req.html
> > > > > > > > by curiosity i looked what it reports on a53/a55/a72/a76 an=
d it is surprisingly accurate :-)
> > > > > > > > on mine 3576 with collabora uboot+mainline atf is hows 800M=
Hz (and in perf. gov it seems to be constant)
> > > > > > > >
> > > > > > > > >
> > > > > > > > > There might be some difference in how PVTPLL behaves on R=
K3576 vs.
> > > > > > > > > RK3588. But frankly first I would check if you are using =
comparable
> > > > > > > > > ATF implementations (e.g. upstream TF-A in both cases), k=
ernels and
> > > > > > > > > thermal environment :)
> > > > > > > >
> > > > > > > > all tests: the same 6.15.2 mainline + some collabora patches
> > > > > > > >
> > > > > > > > diffs were:
> > > > > > > > 1.collabora uboot[1] + mainline atf 2.13
> > > > > > > > 2.collabora uboot[1] + rockchip rkbin bl31 blob
> > > > > > > > 3.vendor uboot (bin dump from friendlyelec ubuntu image)
> > > > > > > >
> > > > > > > > on 1/2 i see kind of issue with clock values (i.e. perf gov=
 gives constant 800MHz on mainline atf).
> > > > > > > > 3 seems to perform better - (i.e. perf gov gives constant 1=
500MHz so all is snappier/faster)
> > > > > > >
> > > > > > > There is indeed something weird going on. I've tried running =
sbc-bench
> > > > > > > [1], and even though I observe dynamically varying CPU freque=
ncies
> > > > > > > after boot with schedutil governor, once sbc-bench switches t=
he
> > > > > > > governor to "performance" and goes through the OPPs in descen=
ding
> > > > > > > frequency order, the CPUs seem to get stuck at the last appli=
ed low
> > > > > > > frequency. Even after max frequency gets reverted from 408 MH=
z to
> > > > > > > something higher, even after I switch the governor to somethi=
ng else -
> > > > > > > no matter what. Only a reboot gets the higher frequencies 'un=
stuck'
> > > > > > > for me.
> > > > > > >
> > > > > > > These are all observed at around 55C SoC temperature, so thro=
ttling is
> > > > > > > not an issue. Regulators are stuck at 950000 uV - way above 7=
00000 uV
> > > > > > > that the 408 MHz OPP requires (and power readings seem to mat=
ch: I'm
> > > > > > > getting about 2.3W consumption at 408 MHz in idle vs. normal =
idle
> > > > > > > reading of 1.4W at around 1 GHz).
> > > > > > >
> > > > > > > Not sure what's going on here, and I don't remember seeing an=
ything
> > > > > > > similar on RK3588. Thoughts welcome.
> > > > > >
> > > > > > This may once again be a "accidentally uses wrong clock IDs" ty=
pe
> > > > > > situation. The other possibility is that we're getting confused
> > > > > > between what we think the clock rate is and what SCMI actually =
set
> > > > > > the clock rate to.
> > > > > >
> > > > > > Things to check is whether the right clock controller (scmi vs =
cru)
> > > > > > and the right clock id (check ATF source for this) is used.
> > > > >
> > > > > Clock IDs in the kernel seem to match those in ATF, but I've noti=
ced
> > > > > what appears to be a buffer overflow in some of the SCMI clock na=
mes
> > > > > defined in the opensource TF-A (thanks GCC 15 and its zealous
> > > > > warnings):
> > > >
> > > > After some more testing, I tend to confirm what Piotr observed
> > > > earlier. Namely, frequency scaling acts weird on any ATF version (be
> > > > it binary BL31 or opensource TF-A), as long as mainline u-boot is
> > > > used. Using the u-boot binary extracted from the ArmSoM QWRT image
> > > > does not lead to "stuck" CPU frequencies when running sbc-bench.
> > > >
> > > > I'm getting this with the exact same kernel build (6.16-rc1 with so=
me
> > > > Sige5 related patches, namely v2 of this series, Nicolas' USB
> > > > enablement series and TSADC). The only other difference is that the
> > > > binary u-boot doesn't have EFI support, so I had to boot into the
> > > > ARM64 uncompressed Image instead of vmlinuz.efi, but those were both
> > > > taken from the same build.
> > > >
> > > > What I'm observing during the sbc-bench run:
> > > >  - It switches the cpufreq governor from schedutil to performance
> > > >  - It goes through all CPU OPPs in descending frequency order
> > > >  --- While it does that when booted using mainline u-boot +
> > > > vmlinuz.efi: "hardware limits" line in "cpupower -c 0,4
> > > > frequency-info" changes with each OPP change (the max frequency
> > > > getting reduced sequentially), then it resets to the initial full
> > > > range, but the actual frequency stays stuck at the lowest possible
> > > > value
> > > >  --- While it does that when booted using binary u-boot + Image:
> > > > "hardware limits" line in "cpupower -c 0,4 frequency-info" doesn't
> > > > change, but the actual frequency gets reduced sequentially. Then af=
ter
> > > > the iteration over all OPPs is completed it returns to the highest
> > > > possible value, and adjusts dynamically based on thermal throttling=
 as
> > > > the benchmark progresses
> > >
> > > Slight correction: it's not the "hardware limits" line, but rather
> > > "current policy".
> > >
> > > Note that booting mainline u-boot in non-EFI mode (using plain Image)
> > > doesn't change the results above.
> >
> > I'm in a similar boat, while trying to make DSI run on the rk3576.
> > Andy from Rockchip was able to make it work "just" by using vendor-
> > firmware - while using mainline u-boot (with both mainline TF-A
> > or vendor TF-A) produces just black output.
> >
> > I think when I did the mainline u-boot thing I took the "vendor"-code
> > from the armbian rk3576 vendor-u-boot ... but that actually may differ
> > from what the vendors provided?
>=20
> Just tried booting into u-boot built from ArmSoM sources at [1] - same
> issues as using mainline. Either I'm doing something stupid building
> it (don't know what though), or the binary shipped in ArmSoM images is
> indeed different from what the sources are.

Can you list the versions you see for the _working_ binaries?

I.e. u-boot and friends may list someversion-gGITHASH thingy like your
OPTEE already does: OP-TEE version: 3.13.0-791-g185dc3c92 .
Also possibly the build date.

I.e. I'm wondering/hoping if we can match to some git commit.


Heiko


>=20
> FTR, my steps to build the vendor u-boot were:
>=20
> make rk3576_defconfig
> cp ~/rkbin/bin/rk35/rk3576_bl31_v1.15.elf bl31.elf
> cp ~/rkbin/bin/rk35/rk3576_bl32_v1.05.bin tee.bin
> make -j12
> make u-boot.itb
> ./tools/mkimage -n rk3576 -T rksd -d
> ~/rkbin/bin/rk35/rk3576_ddr_lp4_2112MHz_lp5_2736MHz_v1.09.bin:spl/u-boot-=
spl-dtb.bin
> idbloader.img
>=20
> Then I wrote idbloader.img to eMMC starting from sector 64, u-boot.itb
> starting from sector 16384. It boots, but exhibits the same "stuck"
> CPU frequencies as with mainline u-boot.
>=20
> FWIW, I've managed to load Rockchip BL32 as OP-TEE with mainline
> u-boot too: turns out the right address to load it is 0x48400000 and
> not 0x08400000. It didn't help with the problem though.
>=20
> Best regards,
> Alexey
>=20
> [1] https://github.com/ArmSoM/u-boot/tree/rk3576-6.1-rk3.1
>=20




