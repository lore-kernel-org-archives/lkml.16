Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F7725392C;
	Mon, 23 Jun 2025 13:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750687112; cv=none; b=L4lQVxhZQlcswcFpNyJEx9mAWBS8aLjzL8QHR7G6cp4Ew5CfphsLch3m/WA50uF9+oIpErjD18ccVTQDdJR5SraKiBYdelk/A6OXvK1oJDBvZ4FCy2uhpSIkqe+rkJ2/jnAgPO7nNPA683ADoVmyciqaNe3j6BvyLrrbZFvDJX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750687112; c=relaxed/simple;
	bh=iKwZRHjA++O917jm8YgOwpEmDVz8eGyjiVAvO+EhwzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FXfhXaTHiuyAA15S+TQZvp2VKwQyy3VGEMgJ7nTFcdlZ3nLh4sCehDT6NzBT0bJ/BY1TXdkjk0WGRZCNoFGrYIw8t9kcLYASBsZUDi2ZWE/n+GktfGQwBReTeXSUenB1pZFJthfGNEm0Z9bJBfN7QTlFSSLO1wBJx/Wbtj4v4XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bC5vd/Bc; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bC5vd/Bc"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a3db0666f2so100093221cf.1;
        Mon, 23 Jun 2025 06:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750687108; x=1751291908; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Am3/Jkt1vGDX1rkUzHxXqzrzPrH3KDJ51ZQobA48OZA=;
        b=bC5vd/BckDrAgL/lffzL0TW5Q+0tMJom32z7ur4oLrxfTqDpWgi9pgl1AUCBGeMiUx
         zsfpveN87c685ZVziKxVcUzN1OiIYVHvmIpJFkasTtR52jlbXOHPOwSKCm8f1clTjw/+
         YZ3aw4bRpO2E2RBmjnoCSPmWxbP1Bt36896q/sXIk9VDMF+gdvdt6Y0d6HxMni6ofxcJ
         VmIWK+IbJNN4nGyNatTLhgrPU6qATiozlhuAFliemDk8qt2WrUVwcNkjo26aGZP8Iw4F
         Zw5UFcubfCLm+2ZrtL1LKZhHyqM3TZK8yTErbi0O/xqrfveo2NhYARZLaM7f6c3Ffn3F
         rjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687108; x=1751291908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Am3/Jkt1vGDX1rkUzHxXqzrzPrH3KDJ51ZQobA48OZA=;
        b=sHbHQ91XwvZmhz45Qv1FlWH3WfpuW2GmntYWRFygL7EtcJonBCVUoB2kuGOHRLk4Ek
         fKcuZhiG7HXDbnbd6LL0IzrAc+jWPBSqhaF3asrVS307zVZMBpqZm/xNmZa1jTLodKR1
         ndQLT/CqMuvsCuYkBsHrq1wMAOdpKSwMPxleIc/itqOZejC00plytaCQF4lw9zdPyVIX
         EF0diMSVnChNN+lKC4akwr9PjV9h/YXf7iIxjrDYgcJcCr937M30lT8aFsGn9JnvUfaw
         B7jvFTL18qTeLWVEOhwvq+rHpjTYgtP63MHvBGVigFD3RpqFwZZ0JyGicxRmZVD5GHao
         Yw8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUz42ZpakTJXQXniLCfH6okI1wJXreKWYqDenIabqCSTQ9Yl9DCmfakOYqULc2iaMrHlh1lj9Hmw9/n@vger.kernel.org, AJvYcCUzvN6lXYLT0PiA1eUOsA93jQUl8PAePeJ3IoM68oynLsLKWpVwAV4IdM8eraBHvCwDOHzrKev4nkBoRX9o@vger.kernel.org
X-Gm-Message-State: AOJu0YyemrBfou+fviRaCROGnWUCRwz72nXnEecJLwGiVVX6+bXTAZte
	TzOLFxczPRNL2HNguX8NvrWPCJ2HSlnOa7I+QcpWJpayvqd/9Dv1VQ97pHuzCecTPjZhFrWZFDK
	otwyy/4DcqtDAn6zW197jlZcXN/sEb98=
X-Gm-Gg: ASbGncvibN/FQkQq1yICqgUz3P+ZYCfsogqsALq4laG+2+qkvleRIrUglj2JQNZvYbs
	sihg5gNWPyAbi0EPuX6z1ZU7aKMEIVEC2fAU/ZuY8S4C0UAsDAfG8wVrANtT/EcUCtkMt1LyKW+
	FuIE2Zq+YxVg+BSbfVV0wnTMmceFKJRo8NYG/lXNETj6gpRjm9Mj4SrMTAv6hvPhT/Qy4OQpKCE
	8TG
X-Google-Smtp-Source: AGHT+IGE+kymn1CzLXmQSmKjTkb82/QHNJHwCx5hfG8EiAdO3S0WiCIk5MQcpVsdo0uFlcUJS/KqOIucEvFrYw9R/z8=
X-Received: by 2002:a05:622a:2281:b0:474:f1b5:519c with SMTP id
 d75a77b69052e-4a77a230208mr187861981cf.32.1750687108205; Mon, 23 Jun 2025
 06:58:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <3286000.Y6S9NjorxK@phil> <CABjd4YyaNF1zosFFi6hEsZanPDxoaa1h4Dpd6uTPRwA3BZn0=w@mail.gmail.com>
 <5897576.DvuYhMxLoT@phil> <CABjd4Yy8WeXKmmxh2-TjjF5-ABy-NzzJsWpt1KvSjJqTHh0Xwg@mail.gmail.com>
In-Reply-To: <CABjd4Yy8WeXKmmxh2-TjjF5-ABy-NzzJsWpt1KvSjJqTHh0Xwg@mail.gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 23 Jun 2025 17:58:19 +0400
X-Gm-Features: AX0GCFv2X6RDB8D3RTeo8pfyvKAmpUiDXfybuBRngBvpG0FClOji4ey7UT8MaZw
Message-ID: <CABjd4Yz4NbqzZH4Qsed3ias56gcga9K6CmYA+BLDBxtbG915Ag@mail.gmail.com>
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

On Mon, Jun 23, 2025 at 1:19=E2=80=AFPM Alexey Charkov <alchark@gmail.com> =
wrote:
>
> On Sun, Jun 22, 2025 at 5:48=E2=80=AFPM Heiko Stuebner <heiko@sntech.de> =
wrote:
> >
> > Am Samstag, 21. Juni 2025, 23:21:11 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Alexey Charkov:
> > > On Sat, Jun 21, 2025 at 11:44=E2=80=AFPM Heiko Stuebner <heiko@sntech=
.de> wrote:
> > > >
> > > > Am Samstag, 21. Juni 2025, 21:35:56 Mitteleurop=C3=A4ische Sommerze=
it schrieb Alexey Charkov:
> > > > > On Fri, Jun 20, 2025 at 8:02=E2=80=AFPM Alexey Charkov <alchark@g=
mail.com> wrote:
> > > > > >
> > > > > > On Wed, Jun 18, 2025 at 6:48=E2=80=AFPM Alexey Charkov <alchark=
@gmail.com> wrote:
> > > > > > >
> > > > > > > On Wed, Jun 18, 2025 at 6:06=E2=80=AFPM Nicolas Frattaroli
> > > > > > > <nicolas.frattaroli@collabora.com> wrote:
> > > > > > > >
> > > > > > > > Hello,
> > > > > > > >
> > > > > > > > +Cc Jonas Karlman as he is intimately familiar with RK3576 =
clock shenanigans by now,
> > > > > > > >
> > > > > > > > On Wednesday, 18 June 2025 15:51:45 Central European Summer=
 Time Alexey Charkov wrote:
> > > > > > > > > On Sun, Jun 15, 2025 at 8:00=E2=80=AFPM Piotr Oniszczuk
> > > > > > > > > <piotr.oniszczuk@gmail.com> wrote:
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <al=
chark@gmail.com> w dniu 9 cze 2025, o godz. 16:05:
> > > > > > > > > > >
> > > > > > > > > > > On Sun, Jun 8, 2025 at 11:24=E2=80=AFAM Piotr Oniszcz=
uk
> > > > > > > > > > > <piotr.oniszczuk@gmail.com> wrote:
> > > > > > > > > > >>> Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <=
alchark@gmail.com> w dniu 5 cze 2025, o godz. 15:42:
> > > > > > > > > > >>>> Alexey,
> > > > > > > > > > >>>> I see you are using rk3576 board like me (nanopi-m=
5)
> > > > > > > > > > >>>> Have you on your board correctly working cpu dvfs?
> > > > > > > > > > >>>> I mean: [1][desired clocks reported by kernel sysf=
s are in pair with [2[]cur clocks?
> > > > > > > > > > >>>> In my case i see mine cpu lives totally on it=E2=
=80=99s own with dvfs:
> > > > > > > > > > >>>
> > > > > > > > > > >>> Hi Piotr,
> > > > > > > > > > >>>
> > > > > > > > > > >>> I haven't tried to validate actual running frequenc=
ies vs. requested
> > > > > > > > > > >>> frequencies, but subjective performance and power c=
onsumption seem to
> > > > > > > > > > >>> be in line with what I expect.
> > > > > > > > > > >>
> > > > > > > > > > >> well - my subjective l&f is that  - currently - my r=
k3576 seems =E2=80=9Eslower" than i.e. 4xA53 h618.
> > > > > > > > > > >
> > > > > > > > > > > In my experience, native compilation of GCC 14 using =
8 threads on
> > > > > > > > > > > RK3576 (mainline with passive cooling and throttling =
enabled): 2 hours
> > > > > > > > > > > 6 minutes, on RK3588 (mainline with passive cooling v=
ia Radxa Rock 5B
> > > > > > > > > > > case and throttling enabled but never kicking in): 1 =
hour 10 minutes
> > > > > > > > > >
> > > > > > > > > > by curiosity i looked randomly on 3576 vs 3588:
> > > > > > > > > > multithread passmark: 3675 (https://www.cpubenchmark.ne=
t/cpu.php?cpu=3DRockchip+RK3576&id=3D6213)
> > > > > > > > > > multithread passmark: 4530 (https://www.cpubenchmark.ne=
t/cpu.php?cpu=3DRockchip+RK3588&id=3D4906)
> > > > > > > > > >
> > > > > > > > > > assuming 3588 as baseline, 3576 is approx 20% slower on=
 multithread passmark (has ~0,8 comp power of 3588)
> > > > > > > > > > 70 min compile on 3588 should take something like ~86mi=
n on 3576.
> > > > > > > > > > In your case 126min compile on 3576 shows 3576 offers 0=
,55 comp power of 3588.
> > > > > > > > > > Roughly 3576 should do this task in 40min less than you=
 currently see i think
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > Can't see how u-boot would affect CPU speed in Linux,=
 as long as you
> > > > > > > > > > > use comparable ATF images. Do you use the same kernel=
 and dtb in all
> > > > > > > > > > > these cases? Also, what's your thermal setup?
> > > > > > > > > >
> > > > > > > > > > yes. in all cases only change was: uboot & atf
> > > > > > > > > > thermal is based on recent collabora series (+ recent p=
ooling fix for clocks return from throttling)
> > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > Not sure UX is a particularly good measure of CPU per=
formance, as long
> > > > > > > > > > > as you've got a properly accelerated DRM graphics pip=
eline. More
> > > > > > > > > > > likely 2D/3D and memory.
> > > > > > > > > >
> > > > > > > > > > indeed.
> > > > > > > > > > For quantified look i=E2=80=99m looking on v.simple app=
roach to estimate real clock is http://uob-hpc.github.io/2017/11/22/arm-clo=
ck-freq.html
> > > > > > > > > > by curiosity i looked what it reports on a53/a55/a72/a7=
6 and it is surprisingly accurate :-)
> > > > > > > > > > on mine 3576 with collabora uboot+mainline atf is hows =
800MHz (and in perf. gov it seems to be constant)
> > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > There might be some difference in how PVTPLL behaves =
on RK3576 vs.
> > > > > > > > > > > RK3588. But frankly first I would check if you are us=
ing comparable
> > > > > > > > > > > ATF implementations (e.g. upstream TF-A in both cases=
), kernels and
> > > > > > > > > > > thermal environment :)
> > > > > > > > > >
> > > > > > > > > > all tests: the same 6.15.2 mainline + some collabora pa=
tches
> > > > > > > > > >
> > > > > > > > > > diffs were:
> > > > > > > > > > 1.collabora uboot[1] + mainline atf 2.13
> > > > > > > > > > 2.collabora uboot[1] + rockchip rkbin bl31 blob
> > > > > > > > > > 3.vendor uboot (bin dump from friendlyelec ubuntu image=
)
> > > > > > > > > >
> > > > > > > > > > on 1/2 i see kind of issue with clock values (i.e. perf=
 gov gives constant 800MHz on mainline atf).
> > > > > > > > > > 3 seems to perform better - (i.e. perf gov gives consta=
nt 1500MHz so all is snappier/faster)
> > > > > > > > >
> > > > > > > > > There is indeed something weird going on. I've tried runn=
ing sbc-bench
> > > > > > > > > [1], and even though I observe dynamically varying CPU fr=
equencies
> > > > > > > > > after boot with schedutil governor, once sbc-bench switch=
es the
> > > > > > > > > governor to "performance" and goes through the OPPs in de=
scending
> > > > > > > > > frequency order, the CPUs seem to get stuck at the last a=
pplied low
> > > > > > > > > frequency. Even after max frequency gets reverted from 40=
8 MHz to
> > > > > > > > > something higher, even after I switch the governor to som=
ething else -
> > > > > > > > > no matter what. Only a reboot gets the higher frequencies=
 'unstuck'
> > > > > > > > > for me.
> > > > > > > > >
> > > > > > > > > These are all observed at around 55C SoC temperature, so =
throttling is
> > > > > > > > > not an issue. Regulators are stuck at 950000 uV - way abo=
ve 700000 uV
> > > > > > > > > that the 408 MHz OPP requires (and power readings seem to=
 match: I'm
> > > > > > > > > getting about 2.3W consumption at 408 MHz in idle vs. nor=
mal idle
> > > > > > > > > reading of 1.4W at around 1 GHz).
> > > > > > > > >
> > > > > > > > > Not sure what's going on here, and I don't remember seein=
g anything
> > > > > > > > > similar on RK3588. Thoughts welcome.
> > > > > > > >
> > > > > > > > This may once again be a "accidentally uses wrong clock IDs=
" type
> > > > > > > > situation. The other possibility is that we're getting conf=
used
> > > > > > > > between what we think the clock rate is and what SCMI actua=
lly set
> > > > > > > > the clock rate to.
> > > > > > > >
> > > > > > > > Things to check is whether the right clock controller (scmi=
 vs cru)
> > > > > > > > and the right clock id (check ATF source for this) is used.
> > > > > > >
> > > > > > > Clock IDs in the kernel seem to match those in ATF, but I've =
noticed
> > > > > > > what appears to be a buffer overflow in some of the SCMI cloc=
k names
> > > > > > > defined in the opensource TF-A (thanks GCC 15 and its zealous
> > > > > > > warnings):
> > > > > >
> > > > > > After some more testing, I tend to confirm what Piotr observed
> > > > > > earlier. Namely, frequency scaling acts weird on any ATF versio=
n (be
> > > > > > it binary BL31 or opensource TF-A), as long as mainline u-boot =
is
> > > > > > used. Using the u-boot binary extracted from the ArmSoM QWRT im=
age
> > > > > > does not lead to "stuck" CPU frequencies when running sbc-bench=
.
> > > > > >
> > > > > > I'm getting this with the exact same kernel build (6.16-rc1 wit=
h some
> > > > > > Sige5 related patches, namely v2 of this series, Nicolas' USB
> > > > > > enablement series and TSADC). The only other difference is that=
 the
> > > > > > binary u-boot doesn't have EFI support, so I had to boot into t=
he
> > > > > > ARM64 uncompressed Image instead of vmlinuz.efi, but those were=
 both
> > > > > > taken from the same build.
> > > > > >
> > > > > > What I'm observing during the sbc-bench run:
> > > > > >  - It switches the cpufreq governor from schedutil to performan=
ce
> > > > > >  - It goes through all CPU OPPs in descending frequency order
> > > > > >  --- While it does that when booted using mainline u-boot +
> > > > > > vmlinuz.efi: "hardware limits" line in "cpupower -c 0,4
> > > > > > frequency-info" changes with each OPP change (the max frequency
> > > > > > getting reduced sequentially), then it resets to the initial fu=
ll
> > > > > > range, but the actual frequency stays stuck at the lowest possi=
ble
> > > > > > value
> > > > > >  --- While it does that when booted using binary u-boot + Image=
:
> > > > > > "hardware limits" line in "cpupower -c 0,4 frequency-info" does=
n't
> > > > > > change, but the actual frequency gets reduced sequentially. The=
n after
> > > > > > the iteration over all OPPs is completed it returns to the high=
est
> > > > > > possible value, and adjusts dynamically based on thermal thrott=
ling as
> > > > > > the benchmark progresses
> > > > >
> > > > > Slight correction: it's not the "hardware limits" line, but rathe=
r
> > > > > "current policy".
> > > > >
> > > > > Note that booting mainline u-boot in non-EFI mode (using plain Im=
age)
> > > > > doesn't change the results above.
> > > >
> > > > I'm in a similar boat, while trying to make DSI run on the rk3576.
> > > > Andy from Rockchip was able to make it work "just" by using vendor-
> > > > firmware - while using mainline u-boot (with both mainline TF-A
> > > > or vendor TF-A) produces just black output.
> > > >
> > > > I think when I did the mainline u-boot thing I took the "vendor"-co=
de
> > > > from the armbian rk3576 vendor-u-boot ... but that actually may dif=
fer
> > > > from what the vendors provided?
> > >
> > > Just tried booting into u-boot built from ArmSoM sources at [1] - sam=
e
> > > issues as using mainline. Either I'm doing something stupid building
> > > it (don't know what though), or the binary shipped in ArmSoM images i=
s
> > > indeed different from what the sources are.
> >
> > Can you list the versions you see for the _working_ binaries?
>
> Those are not as detailed as I'd like, as vendor builds seem to
> override the default U-boot versioning rules (stripping the git hash
> information off).
>
> I've identified the following versions for the binary image that worked f=
or me:
>
> DDR init v1.03 (version string "DDR 81dd75088a wesley.yao
> 24/04/16-11:19:41,fwver: v1.03")
> U-boot SPL 2017.09 (no traces of any particular git commit, version
> string "U-Boot SPL 2017.09 (Aug 23 2024 - 00:47:39)")
> U-boot proper 2017.09 (ditto, version string "U-Boot 2017.09 (Aug 23
> 2024 - 00:47:39 +0000) OpenWrt")
> BL31 image v1.04 (version string
> "v2.3():v2.3-749-g30018b771:derrick.huang, fwver: v1.04")
> BL32 image v1.01 (version string "U3.13.0-791-g185dc3c92 #hisping.lin
> (gcc version 10.2.1 20201103 (GNU Toolchain for the A-profile
> Architecture 10.2-2020.11 (arm-10.16))) #2 Tue Apr 16 11:05:25 CST
> 2024 aarch64, fwver: v1.01")
>
> > I.e. u-boot and friends may list someversion-gGITHASH thingy like your
> > OPTEE already does: OP-TEE version: 3.13.0-791-g185dc3c92 .
> > Also possibly the build date.
>
> The build date is later than any commit I see in the ArmSoM repo
> leading up to either of the two tags they have there ("rk3576" and
> "rk3576-6.1-rk3.1", neither of them belonging to any published branch
> there)
>
> > I.e. I'm wondering/hoping if we can match to some git commit.
>
> I've also noticed that ArmSoM SDK references the "boost" binary from
> rkbin (rk3576_boost_v1.00.bin in particular), but it doesn't seem to
> be present in the bootloader binary I'm looking at. The version string
> of the SPL binary in rkbin as included in the SDK is also different
> from what I'm seeing in the actual binary: SDK has "U-Boot SPL
> 2017.09-g57b8ceed1c3-240418 #lxh (Apr 19 2024 - 17:07:22), fwver:
> v1.02".
>
> I'll try and rebuild the vendor u-boot from source with these specific
> versions of rkbin blobs (ddr v1.03, bl31 v1.04 and bl32 v1.01), but
> the changelog in rkbin didn't mention anything that would seem
> relevant to the issue I'm observing :(

Okay, I've bisected this.

TLDR: Linux and u-boot seem to have nothing to do with it, opensource
TF-A doesn't work, binary BL31 starting with v1.09 do not work. BL31
v1.08 and earlier work fine. Tested with vendor u-boot and with
2025.07-rc2, results are similar. OP-TEE presence does not affect the
results.

To test:
1. Build and apply a fresh u-boot-rockchip.bin using the DDR init and
BL31 from rkbin repo [1]
2. Run "watch cpupower -c 0,4 frequency-info" to observe how CPU
frequencies change
3. In a separate terminal, run "bash sbc-bench.sh -c" [2]
4. "Good" behavior:
    a. Once the cpufreq governor is switched to "performance" (if it
was anything different at boot), both CPU clusters go up to their max
frequencies
    b. While the benchmark runs through the stage where it says
"Checking cpufreq OPP", CPU frequencies consecutively decrease from
the max OPP frequency to the min
    c. After the benchmark finishes the stage where it says "Checking
cpufreq OPP", both CPU clusters go up to their max frequencies for the
rest of the benchmarking run
    "Bad" behavior:
    a. Once the cpufreq governor is switched to "performance" (if it
was anything different at boot), both CPU clusters stay at whatever
frequencies they were at when the switch occurred
    b. While the benchmark runs through the stage where it says
"Checking cpufreq OPP", CPU frequencies consecutively decrease from
the "pre-max" OPP frequency to the min (max frequency never gets
applied on either of the clusters!)
    c. After the benchmark finishes the stage where it says "Checking
cpufreq OPP", both CPU clusters stay at their min frequencies for the
rest of the benchmarking run

I suspect it has something to do with the topmost OPP somehow becoming
unselectable in ATF starting from binary BL31 v1.09 (and similarly in
opensource TF-A). This time I couldn't reproduce the "permanently
stuck" CPU frequencies though.

Here are the git bisect results (running in rkbin repo):

0b338fd6ae7ad816295a75c80b00968bb1868625 is the first bad commit
commit 0b338fd6ae7ad816295a75c80b00968bb1868625 (HEAD)
Author: XiaoDong Huang <derrick.huang@rock-chips.com>
Date:   Fri Jun 28 17:47:55 2024 +0800

    rk3576: bl31: update version to v1.09

    Build from ATF commit:
        286c013b2 plat: rockchip: rk3576: Add support to set low length
    update feature:
        286c013b2 plat: rockchip: rk3576: Add support to set low length
        5fb78cd64 rockchip: uart: switch to loopback mode before
checking busy status
        02ff3b0da rockchip: uart: save uart register once
        23bd4684e plat: rk3576: support to switch hptimer to 1G
        b4833e988 plat: rk3576: remove AUTOCS_EN_COUNT
        437ed59cb plat: rockchip: rk3576: support aclk_sencure_s enable
        6d8c67d6a plat: rk3576: support poweroff scu1 when cpu4~cpu7 off

    Change-Id: I0fcb5afefcc3865cf8c413b4c0ed00234d2675cb
    Signed-off-by: XiaoDong Huang <derrick.huang@rock-chips.com>

 RKTRUST/RK3576TRUST.ini                                   |   2 +-
 bin/rk35/{rk3576_bl31_v1.08.elf =3D> rk3576_bl31_v1.09.elf} | Bin
349032 -> 349032 bytes
 doc/release/RK3576_CN.md                                  |  13 ++++++++++=
+++
 doc/release/RK3576_EN.md                                  |  14 ++++++++++=
++++
 4 files changed, 28 insertions(+), 1 deletion(-)
 rename bin/rk35/{rk3576_bl31_v1.08.elf =3D> rk3576_bl31_v1.09.elf} (82%)

[1] https://github.com/rockchip-linux/rkbin.git
[2] https://github.com/ThomasKaiser/sbc-bench

Derrick, if you could chime in on what might be going on here, that
would be greatly appreciated :)

Best regards,
Alexey
