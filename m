Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A1119F40F;
	Mon, 23 Jun 2025 09:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750670400; cv=none; b=KVJt1ieBhb/L0AnXyB1nRBHtHpNSGIBCtdMDfA0jGLdLw4r3roGv8wVR/d9L+E+V48OtjHYBYmCOSPS8hwMdB75R6EMDl+lzrLsRzA4DYr3NTRcxM83Gpp7nrrepnmjLRUd4bF4bLKZrpnRX6lKQdxXIsjj3HhTbX4L9XFcqTRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750670400; c=relaxed/simple;
	bh=qYA4sJYmdQAhkC6BMNeNo6qcoSV6KEmE2oPPVA518QA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vwtr+/B+wFDSJSEq7rDJ/+bs13ZW1H9OIPKd435AxKYKzdzEwD43yzkA3eFyQglteUj0arEmCN7ddevkP0UzfNBsuvov8CC9NLWJo9H5pxriWdObs3eIQcbRiO4ZiBKGN5J7bCvQyuxdol0MUhOSs3dkmuGRHO49fvVakMXeaA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lePbQtju; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lePbQtju"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a44b9b2af8so18887601cf.3;
        Mon, 23 Jun 2025 02:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750670397; x=1751275197; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/wEvLV+XUDkUUbf+MnYAq5KDj79to69aojQVd2SW7lk=;
        b=lePbQtju2ClMy0EHB5zOQFasUKKxWkQplWGloYLGn+Qb66N7h4KBCejSC6QxKuXJxI
         tmsu+64lnbA0x18e0Nqa1uUxOMyP8aiBMSzvKqX05oOzxKQ5HIck4IP/9UNttTKGDvJW
         o4Z08CeBWJRgRK79QTAhcP4TrkG40UsPkRWGx65RzzHMxNX/E86rTUB40oYjzRhVpVOS
         bANnuEZuKmnCO3/rfyw1PQ3xyvzHZHDWRlz3i905eCyBLVw9l2T2osYzh5TYeWJiFZN/
         KSjqush6p2tVtVqFMawdtBHOZPMz39cyYjPm45SL9D84wL1G7C8dwjDRqoPYpyIfwT0c
         k+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750670397; x=1751275197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/wEvLV+XUDkUUbf+MnYAq5KDj79to69aojQVd2SW7lk=;
        b=SYFih8ZGWnXvJy+xrFHshkO05HUjMdxQDKICJwPC/4RZiJMhEteietXXg/PsUypaE9
         G4MgYmIKf/LNAmWMrRUakNLu5RlGezIRvI5lJ9o+WWWgJSGxw5u0dbVI2nHKWK+p1bPl
         6cv5uCok8kNy45wJ3EWGhYvHL7EncEoSbRP8hG5p8wHbtMR9c87AtOigF9Xk73176LNy
         a2J2a4SBaOJmlNgMpc9IltPdR+h3CyX/mnzAi2z2nRJp+iDQDnBsz2LMj/dMqGPv/nCQ
         ObHILK7ZXMxJq+sk+ZS5Qgek+USGPoLVr7rkN8nxsYRq5YpBwy+dFDI0b6UGDdLQ+jsI
         aFYg==
X-Forwarded-Encrypted: i=1; AJvYcCUvFzw2T6+6/0zZk1ykkLVUX3KjtN2xbUvgh4SIdNlTqHDFfNpjvstPmxC971bQq5Q8lsY+xtSwXQTQ@vger.kernel.org, AJvYcCVyvsrypakbjLWQjE/QBn3REqHjOC+rXrANkPe4SU5MD6bjRieBuHjsmnAGUpkIzMNL7Un1e/BX2OMVAgNq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Bx/A0jKQb9PKEoPENsIXVdyHTA5JYzJcLYifOjK91z/dmhUF
	Tugnf1QAV+Iwf3h8lJWClmKCvf1Wj7K+9rrCIldRBuu2U6OouUkM4A/EasmwoEntllF8kde17RV
	NTf6nMZwC0QgP3eNAfkb7pyyard5gXvU=
X-Gm-Gg: ASbGnctiyhoE9d/S2BcZbUe2vjUsetrSHEKpP0pTn+b5/abbPnPaoQAGJUe8stdhEsA
	k6wYoRn2blxS+7UqSD1HTnj38HXH3KdcR5KYoPu9KhnulmtrDqt3xn8yV5GgXX5c5jDmZgVkE4v
	p1bUGKqRQv7no14+Fjuu9GeWPJGlTZXP6eVwgHiDc4EK83o6uRNJw3bNeoAHeabiimAkbEKGWYG
	ii6
X-Google-Smtp-Source: AGHT+IGHzYJ6UUrqi2LdYMqwXyHs8/FIiY5UXWI3E9jHjR9GWQsbOSjLJkISB6YHyOMmQdHzeFbLLj6oiz/sUnrm6N0=
X-Received: by 2002:ac8:5803:0:b0:49a:8542:b496 with SMTP id
 d75a77b69052e-4a77a25edcdmr137669461cf.25.1750670396800; Mon, 23 Jun 2025
 02:19:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <3286000.Y6S9NjorxK@phil> <CABjd4YyaNF1zosFFi6hEsZanPDxoaa1h4Dpd6uTPRwA3BZn0=w@mail.gmail.com>
 <5897576.DvuYhMxLoT@phil>
In-Reply-To: <5897576.DvuYhMxLoT@phil>
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 23 Jun 2025 13:19:48 +0400
X-Gm-Features: AX0GCFvGIfu_h2Tdo6Q6Ri5vaM7FSPBRqMyn87PiNr6wtzGYqe2UABSxfmrvMMs
Message-ID: <CABjd4Yy8WeXKmmxh2-TjjF5-ABy-NzzJsWpt1KvSjJqTHh0Xwg@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
To: Heiko Stuebner <heiko@sntech.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	XiaoDong Huang <derrick.huang@rock-chips.com>, Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 5:48=E2=80=AFPM Heiko Stuebner <heiko@sntech.de> wr=
ote:
>
> Am Samstag, 21. Juni 2025, 23:21:11 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Alexey Charkov:
> > On Sat, Jun 21, 2025 at 11:44=E2=80=AFPM Heiko Stuebner <heiko@sntech.d=
e> wrote:
> > >
> > > Am Samstag, 21. Juni 2025, 21:35:56 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Alexey Charkov:
> > > > On Fri, Jun 20, 2025 at 8:02=E2=80=AFPM Alexey Charkov <alchark@gma=
il.com> wrote:
> > > > >
> > > > > On Wed, Jun 18, 2025 at 6:48=E2=80=AFPM Alexey Charkov <alchark@g=
mail.com> wrote:
> > > > > >
> > > > > > On Wed, Jun 18, 2025 at 6:06=E2=80=AFPM Nicolas Frattaroli
> > > > > > <nicolas.frattaroli@collabora.com> wrote:
> > > > > > >
> > > > > > > Hello,
> > > > > > >
> > > > > > > +Cc Jonas Karlman as he is intimately familiar with RK3576 cl=
ock shenanigans by now,
> > > > > > >
> > > > > > > On Wednesday, 18 June 2025 15:51:45 Central European Summer T=
ime Alexey Charkov wrote:
> > > > > > > > On Sun, Jun 15, 2025 at 8:00=E2=80=AFPM Piotr Oniszczuk
> > > > > > > > <piotr.oniszczuk@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > > Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alch=
ark@gmail.com> w dniu 9 cze 2025, o godz. 16:05:
> > > > > > > > > >
> > > > > > > > > > On Sun, Jun 8, 2025 at 11:24=E2=80=AFAM Piotr Oniszczuk
> > > > > > > > > > <piotr.oniszczuk@gmail.com> wrote:
> > > > > > > > > >>> Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <al=
chark@gmail.com> w dniu 5 cze 2025, o godz. 15:42:
> > > > > > > > > >>>> Alexey,
> > > > > > > > > >>>> I see you are using rk3576 board like me (nanopi-m5)
> > > > > > > > > >>>> Have you on your board correctly working cpu dvfs?
> > > > > > > > > >>>> I mean: [1][desired clocks reported by kernel sysfs =
are in pair with [2[]cur clocks?
> > > > > > > > > >>>> In my case i see mine cpu lives totally on it=E2=80=
=99s own with dvfs:
> > > > > > > > > >>>
> > > > > > > > > >>> Hi Piotr,
> > > > > > > > > >>>
> > > > > > > > > >>> I haven't tried to validate actual running frequencie=
s vs. requested
> > > > > > > > > >>> frequencies, but subjective performance and power con=
sumption seem to
> > > > > > > > > >>> be in line with what I expect.
> > > > > > > > > >>
> > > > > > > > > >> well - my subjective l&f is that  - currently - my rk3=
576 seems =E2=80=9Eslower" than i.e. 4xA53 h618.
> > > > > > > > > >
> > > > > > > > > > In my experience, native compilation of GCC 14 using 8 =
threads on
> > > > > > > > > > RK3576 (mainline with passive cooling and throttling en=
abled): 2 hours
> > > > > > > > > > 6 minutes, on RK3588 (mainline with passive cooling via=
 Radxa Rock 5B
> > > > > > > > > > case and throttling enabled but never kicking in): 1 ho=
ur 10 minutes
> > > > > > > > >
> > > > > > > > > by curiosity i looked randomly on 3576 vs 3588:
> > > > > > > > > multithread passmark: 3675 (https://www.cpubenchmark.net/=
cpu.php?cpu=3DRockchip+RK3576&id=3D6213)
> > > > > > > > > multithread passmark: 4530 (https://www.cpubenchmark.net/=
cpu.php?cpu=3DRockchip+RK3588&id=3D4906)
> > > > > > > > >
> > > > > > > > > assuming 3588 as baseline, 3576 is approx 20% slower on m=
ultithread passmark (has ~0,8 comp power of 3588)
> > > > > > > > > 70 min compile on 3588 should take something like ~86min =
on 3576.
> > > > > > > > > In your case 126min compile on 3576 shows 3576 offers 0,5=
5 comp power of 3588.
> > > > > > > > > Roughly 3576 should do this task in 40min less than you c=
urrently see i think
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > > Can't see how u-boot would affect CPU speed in Linux, a=
s long as you
> > > > > > > > > > use comparable ATF images. Do you use the same kernel a=
nd dtb in all
> > > > > > > > > > these cases? Also, what's your thermal setup?
> > > > > > > > >
> > > > > > > > > yes. in all cases only change was: uboot & atf
> > > > > > > > > thermal is based on recent collabora series (+ recent poo=
ling fix for clocks return from throttling)
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Not sure UX is a particularly good measure of CPU perfo=
rmance, as long
> > > > > > > > > > as you've got a properly accelerated DRM graphics pipel=
ine. More
> > > > > > > > > > likely 2D/3D and memory.
> > > > > > > > >
> > > > > > > > > indeed.
> > > > > > > > > For quantified look i=E2=80=99m looking on v.simple appro=
ach to estimate real clock is http://uob-hpc.github.io/2017/11/22/arm-clock=
-freq.html
> > > > > > > > > by curiosity i looked what it reports on a53/a55/a72/a76 =
and it is surprisingly accurate :-)
> > > > > > > > > on mine 3576 with collabora uboot+mainline atf is hows 80=
0MHz (and in perf. gov it seems to be constant)
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > There might be some difference in how PVTPLL behaves on=
 RK3576 vs.
> > > > > > > > > > RK3588. But frankly first I would check if you are usin=
g comparable
> > > > > > > > > > ATF implementations (e.g. upstream TF-A in both cases),=
 kernels and
> > > > > > > > > > thermal environment :)
> > > > > > > > >
> > > > > > > > > all tests: the same 6.15.2 mainline + some collabora patc=
hes
> > > > > > > > >
> > > > > > > > > diffs were:
> > > > > > > > > 1.collabora uboot[1] + mainline atf 2.13
> > > > > > > > > 2.collabora uboot[1] + rockchip rkbin bl31 blob
> > > > > > > > > 3.vendor uboot (bin dump from friendlyelec ubuntu image)
> > > > > > > > >
> > > > > > > > > on 1/2 i see kind of issue with clock values (i.e. perf g=
ov gives constant 800MHz on mainline atf).
> > > > > > > > > 3 seems to perform better - (i.e. perf gov gives constant=
 1500MHz so all is snappier/faster)
> > > > > > > >
> > > > > > > > There is indeed something weird going on. I've tried runnin=
g sbc-bench
> > > > > > > > [1], and even though I observe dynamically varying CPU freq=
uencies
> > > > > > > > after boot with schedutil governor, once sbc-bench switches=
 the
> > > > > > > > governor to "performance" and goes through the OPPs in desc=
ending
> > > > > > > > frequency order, the CPUs seem to get stuck at the last app=
lied low
> > > > > > > > frequency. Even after max frequency gets reverted from 408 =
MHz to
> > > > > > > > something higher, even after I switch the governor to somet=
hing else -
> > > > > > > > no matter what. Only a reboot gets the higher frequencies '=
unstuck'
> > > > > > > > for me.
> > > > > > > >
> > > > > > > > These are all observed at around 55C SoC temperature, so th=
rottling is
> > > > > > > > not an issue. Regulators are stuck at 950000 uV - way above=
 700000 uV
> > > > > > > > that the 408 MHz OPP requires (and power readings seem to m=
atch: I'm
> > > > > > > > getting about 2.3W consumption at 408 MHz in idle vs. norma=
l idle
> > > > > > > > reading of 1.4W at around 1 GHz).
> > > > > > > >
> > > > > > > > Not sure what's going on here, and I don't remember seeing =
anything
> > > > > > > > similar on RK3588. Thoughts welcome.
> > > > > > >
> > > > > > > This may once again be a "accidentally uses wrong clock IDs" =
type
> > > > > > > situation. The other possibility is that we're getting confus=
ed
> > > > > > > between what we think the clock rate is and what SCMI actuall=
y set
> > > > > > > the clock rate to.
> > > > > > >
> > > > > > > Things to check is whether the right clock controller (scmi v=
s cru)
> > > > > > > and the right clock id (check ATF source for this) is used.
> > > > > >
> > > > > > Clock IDs in the kernel seem to match those in ATF, but I've no=
ticed
> > > > > > what appears to be a buffer overflow in some of the SCMI clock =
names
> > > > > > defined in the opensource TF-A (thanks GCC 15 and its zealous
> > > > > > warnings):
> > > > >
> > > > > After some more testing, I tend to confirm what Piotr observed
> > > > > earlier. Namely, frequency scaling acts weird on any ATF version =
(be
> > > > > it binary BL31 or opensource TF-A), as long as mainline u-boot is
> > > > > used. Using the u-boot binary extracted from the ArmSoM QWRT imag=
e
> > > > > does not lead to "stuck" CPU frequencies when running sbc-bench.
> > > > >
> > > > > I'm getting this with the exact same kernel build (6.16-rc1 with =
some
> > > > > Sige5 related patches, namely v2 of this series, Nicolas' USB
> > > > > enablement series and TSADC). The only other difference is that t=
he
> > > > > binary u-boot doesn't have EFI support, so I had to boot into the
> > > > > ARM64 uncompressed Image instead of vmlinuz.efi, but those were b=
oth
> > > > > taken from the same build.
> > > > >
> > > > > What I'm observing during the sbc-bench run:
> > > > >  - It switches the cpufreq governor from schedutil to performance
> > > > >  - It goes through all CPU OPPs in descending frequency order
> > > > >  --- While it does that when booted using mainline u-boot +
> > > > > vmlinuz.efi: "hardware limits" line in "cpupower -c 0,4
> > > > > frequency-info" changes with each OPP change (the max frequency
> > > > > getting reduced sequentially), then it resets to the initial full
> > > > > range, but the actual frequency stays stuck at the lowest possibl=
e
> > > > > value
> > > > >  --- While it does that when booted using binary u-boot + Image:
> > > > > "hardware limits" line in "cpupower -c 0,4 frequency-info" doesn'=
t
> > > > > change, but the actual frequency gets reduced sequentially. Then =
after
> > > > > the iteration over all OPPs is completed it returns to the highes=
t
> > > > > possible value, and adjusts dynamically based on thermal throttli=
ng as
> > > > > the benchmark progresses
> > > >
> > > > Slight correction: it's not the "hardware limits" line, but rather
> > > > "current policy".
> > > >
> > > > Note that booting mainline u-boot in non-EFI mode (using plain Imag=
e)
> > > > doesn't change the results above.
> > >
> > > I'm in a similar boat, while trying to make DSI run on the rk3576.
> > > Andy from Rockchip was able to make it work "just" by using vendor-
> > > firmware - while using mainline u-boot (with both mainline TF-A
> > > or vendor TF-A) produces just black output.
> > >
> > > I think when I did the mainline u-boot thing I took the "vendor"-code
> > > from the armbian rk3576 vendor-u-boot ... but that actually may diffe=
r
> > > from what the vendors provided?
> >
> > Just tried booting into u-boot built from ArmSoM sources at [1] - same
> > issues as using mainline. Either I'm doing something stupid building
> > it (don't know what though), or the binary shipped in ArmSoM images is
> > indeed different from what the sources are.
>
> Can you list the versions you see for the _working_ binaries?

Those are not as detailed as I'd like, as vendor builds seem to
override the default U-boot versioning rules (stripping the git hash
information off).

I've identified the following versions for the binary image that worked for=
 me:

DDR init v1.03 (version string "DDR 81dd75088a wesley.yao
24/04/16-11:19:41,fwver: v1.03")
U-boot SPL 2017.09 (no traces of any particular git commit, version
string "U-Boot SPL 2017.09 (Aug 23 2024 - 00:47:39)")
U-boot proper 2017.09 (ditto, version string "U-Boot 2017.09 (Aug 23
2024 - 00:47:39 +0000) OpenWrt")
BL31 image v1.04 (version string
"v2.3():v2.3-749-g30018b771:derrick.huang, fwver: v1.04")
BL32 image v1.01 (version string "U3.13.0-791-g185dc3c92 #hisping.lin
(gcc version 10.2.1 20201103 (GNU Toolchain for the A-profile
Architecture 10.2-2020.11 (arm-10.16))) #2 Tue Apr 16 11:05:25 CST
2024 aarch64, fwver: v1.01")

> I.e. u-boot and friends may list someversion-gGITHASH thingy like your
> OPTEE already does: OP-TEE version: 3.13.0-791-g185dc3c92 .
> Also possibly the build date.

The build date is later than any commit I see in the ArmSoM repo
leading up to either of the two tags they have there ("rk3576" and
"rk3576-6.1-rk3.1", neither of them belonging to any published branch
there)

> I.e. I'm wondering/hoping if we can match to some git commit.

I've also noticed that ArmSoM SDK references the "boost" binary from
rkbin (rk3576_boost_v1.00.bin in particular), but it doesn't seem to
be present in the bootloader binary I'm looking at. The version string
of the SPL binary in rkbin as included in the SDK is also different
from what I'm seeing in the actual binary: SDK has "U-Boot SPL
2017.09-g57b8ceed1c3-240418 #lxh (Apr 19 2024 - 17:07:22), fwver:
v1.02".

I'll try and rebuild the vendor u-boot from source with these specific
versions of rkbin blobs (ddr v1.03, bl31 v1.04 and bl32 v1.01), but
the changelog in rkbin didn't mention anything that would seem
relevant to the issue I'm observing :(

Best regards,
Alexey
