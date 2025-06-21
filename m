Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2041BD01F;
	Sat, 21 Jun 2025 19:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750534569; cv=none; b=JxI0ssBERQJCEvaWHFsOJ6OeuhHZyAnWZRKQaQ3Ox14/NkobjFcHeyD3tCZHTNJVBvM2yH82OuvO7sRkBD9dG/sNPxmMCcE7kgLwmo04fR3E0b7NBxY1YkoMHFkP24J4+aPaZTXUz9YExhf+TbYRm9/iS1bzbo9HaHILRXh//AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750534569; c=relaxed/simple;
	bh=60myjZ1nSi5A44z6f82qWwWAN2Q6771m4RwIuXyACmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ry2zX4vEL1c3/o6MkdS+3c+I6lWubs444BqPSt5hyY5bQifqCnY9ldsa7NSVHTedczMR2j3Oqds2UMFdEofK9DzUWR/b8aWOspv+esWU0dBtQ5/eT/8KceiyWu5QzR4EsoZCxKCRQXM+4hu0pAfGpujc+/TIo2YDvNoWWdJkAIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WagiNL1m; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WagiNL1m"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4a58ba6c945so50453071cf.2;
        Sat, 21 Jun 2025 12:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750534567; x=1751139367; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsL/maNFVBzuSJA+QEQtq5ueH/059IPnga8BgHtmvQQ=;
        b=WagiNL1m/JdIM1/2Csy98bUJX6cqozM/2lRSZ4BkIO5Z3yCyQjBfr4N/tPbUNqvobN
         Hn0NY5RCzXifcYCLuvoqAgVPg9HpXVlQszeh2phJrMYonKuCEtykOFaPq5YHHr/cXWkd
         SFlLdnIQzaoA5A0jG0/h9iHJ9ytY46OJqKrUdE3HDYE53TsvVDMJDVAXqv1q39r/YKzS
         +XtfggctFNSTKs4zbpLB6OKIvv//8F3DE8hZaubjN81+5ts5PV2m6y1Ez8DsXjGII39G
         F3FCEohr72gMH11f0MuJrDSW53Ghm0DB4YhysXq+vvZhk9935l2w9lo0p+2yfTVbCinv
         kycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750534567; x=1751139367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xsL/maNFVBzuSJA+QEQtq5ueH/059IPnga8BgHtmvQQ=;
        b=CGFjjd51Lr6HRTcjnssmIfx07b6070QJw8IZ/zdg45IIT7fvp8AKTINSxkwnhtzcGb
         3tIwkpwRJBV00q7Zq2iF07+OVMFU+pfC9lhVWHbT5/mg9nt8SAeFuEd8/7diV4dAT37I
         pYWmRq1Wnt9POsIc72l3ghysavwjDvG5xIf5jqGJ1scJGKV6r7IL//p1jzSgsjyv9rhw
         ieaRn5KrNjEPoTb89X24ohhneDSCln821MxZpHvdtlxkIletEbgGVpXfhnVszvmGm4na
         E8Z6FgcZs2fsN8MbgTX5wp9NuySijMS8vgiROf8dXd/z25qt+XzNR0Ue87SbVVogxNKG
         xX5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUk0Q2eUoGKb1ZFasxPGw+DH5ZMzb4Percvwe3rC+ojEYmlt72n+hnUXyD8zjW+2mFYscUfJUw8da0qvsG4@vger.kernel.org, AJvYcCWlESmVEUlJYMwl7GIf7jz6zm/75uf55AzEI0NXXW/N8j8oVbjTDmXz6CGXn+cFBQxe+JlACJbisGkA@vger.kernel.org
X-Gm-Message-State: AOJu0YzY0TEMJdi2v9W90zsGjcmgofoU8t595/G+tc4pwFpsqCzXVUQH
	sP5FrD/cvFQ7XC6v57oZXun2lIZfUnlzH5Bdl1rPN3M06o1ZSBSQ/LdaxwXfPVkXU/5S5A80Ycc
	+EqIAxk/zWmspcAzeg2jkFBNo5+beRQY=
X-Gm-Gg: ASbGncujADEgqA5Wq5tG/i9WTDEjb9EyFen41i6cacGk0s/iARva+bEffna1NBtrHfM
	YbLRsQQsrSY+miPgJSG+bgh0bEGrn5xda6vhkOKkQzD2KOIOALce6a1Jr2WVB8Itl1Wv+fIH5cv
	uxVjaoMRyd2UbjpFabdg1nS20nM0InMq12xbiFxSqtzXj50kbSGcHF7eHzyRRL0GEtJQe7O32lY
	G0V
X-Google-Smtp-Source: AGHT+IG9IUyaj4d79rOc3H/Aw1+r45t965dPq2Vf1h1tNXi7ZnQh4EGQhTwZzamxqA3DriQc6UgIorfArsQ5lTdz7ho=
X-Received: by 2002:a05:622a:4d46:b0:4a6:f99c:3962 with SMTP id
 d75a77b69052e-4a77a2e6717mr130653281cf.46.1750534566692; Sat, 21 Jun 2025
 12:36:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <80ACAAAE-F522-4199-9048-ADE69F6E1128@gmail.com> <CABjd4YyVJv0NmF9LsGWQ-O44MGjT5=FFeUjbg5rJ6XkNgjxb+g@mail.gmail.com>
 <3286422.5fSG56mABF@workhorse> <CABjd4Yy0rjET+TyA3pNGrzfKd1xKKG1AjWFFLsgb+mgDpu_TRg@mail.gmail.com>
 <CABjd4YwrBurnKOAqXK_wFj0c7bEV-PZ682_-1y_VNMPvFrJ-Aw@mail.gmail.com>
In-Reply-To: <CABjd4YwrBurnKOAqXK_wFj0c7bEV-PZ682_-1y_VNMPvFrJ-Aw@mail.gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Sat, 21 Jun 2025 23:35:56 +0400
X-Gm-Features: AX0GCFuCtTqZVnK2_fARXy_goy8uKXOy8QBJy8vlLRZz2ohb2sizazNW7Pz7vM0
Message-ID: <CABjd4YyBoTkNcFVDcYFXt1mNh==wTa1pO7BTmam6CX68rrF=oQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	XiaoDong Huang <derrick.huang@rock-chips.com>
Cc: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 8:02=E2=80=AFPM Alexey Charkov <alchark@gmail.com> =
wrote:
>
> On Wed, Jun 18, 2025 at 6:48=E2=80=AFPM Alexey Charkov <alchark@gmail.com=
> wrote:
> >
> > On Wed, Jun 18, 2025 at 6:06=E2=80=AFPM Nicolas Frattaroli
> > <nicolas.frattaroli@collabora.com> wrote:
> > >
> > > Hello,
> > >
> > > +Cc Jonas Karlman as he is intimately familiar with RK3576 clock shen=
anigans by now,
> > >
> > > On Wednesday, 18 June 2025 15:51:45 Central European Summer Time Alex=
ey Charkov wrote:
> > > > On Sun, Jun 15, 2025 at 8:00=E2=80=AFPM Piotr Oniszczuk
> > > > <piotr.oniszczuk@gmail.com> wrote:
> > > > >
> > > > >
> > > > >
> > > > > > Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gmai=
l.com> w dniu 9 cze 2025, o godz. 16:05:
> > > > > >
> > > > > > On Sun, Jun 8, 2025 at 11:24=E2=80=AFAM Piotr Oniszczuk
> > > > > > <piotr.oniszczuk@gmail.com> wrote:
> > > > > >>> Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gm=
ail.com> w dniu 5 cze 2025, o godz. 15:42:
> > > > > >>>> Alexey,
> > > > > >>>> I see you are using rk3576 board like me (nanopi-m5)
> > > > > >>>> Have you on your board correctly working cpu dvfs?
> > > > > >>>> I mean: [1][desired clocks reported by kernel sysfs are in p=
air with [2[]cur clocks?
> > > > > >>>> In my case i see mine cpu lives totally on it=E2=80=99s own =
with dvfs:
> > > > > >>>
> > > > > >>> Hi Piotr,
> > > > > >>>
> > > > > >>> I haven't tried to validate actual running frequencies vs. re=
quested
> > > > > >>> frequencies, but subjective performance and power consumption=
 seem to
> > > > > >>> be in line with what I expect.
> > > > > >>
> > > > > >> well - my subjective l&f is that  - currently - my rk3576 seem=
s =E2=80=9Eslower" than i.e. 4xA53 h618.
> > > > > >
> > > > > > In my experience, native compilation of GCC 14 using 8 threads =
on
> > > > > > RK3576 (mainline with passive cooling and throttling enabled): =
2 hours
> > > > > > 6 minutes, on RK3588 (mainline with passive cooling via Radxa R=
ock 5B
> > > > > > case and throttling enabled but never kicking in): 1 hour 10 mi=
nutes
> > > > >
> > > > > by curiosity i looked randomly on 3576 vs 3588:
> > > > > multithread passmark: 3675 (https://www.cpubenchmark.net/cpu.php?=
cpu=3DRockchip+RK3576&id=3D6213)
> > > > > multithread passmark: 4530 (https://www.cpubenchmark.net/cpu.php?=
cpu=3DRockchip+RK3588&id=3D4906)
> > > > >
> > > > > assuming 3588 as baseline, 3576 is approx 20% slower on multithre=
ad passmark (has ~0,8 comp power of 3588)
> > > > > 70 min compile on 3588 should take something like ~86min on 3576.
> > > > > In your case 126min compile on 3576 shows 3576 offers 0,55 comp p=
ower of 3588.
> > > > > Roughly 3576 should do this task in 40min less than you currently=
 see i think
> > > > >
> > > > >
> > > > > > Can't see how u-boot would affect CPU speed in Linux, as long a=
s you
> > > > > > use comparable ATF images. Do you use the same kernel and dtb i=
n all
> > > > > > these cases? Also, what's your thermal setup?
> > > > >
> > > > > yes. in all cases only change was: uboot & atf
> > > > > thermal is based on recent collabora series (+ recent pooling fix=
 for clocks return from throttling)
> > > > >
> > > > > >
> > > > > >
> > > > > > Not sure UX is a particularly good measure of CPU performance, =
as long
> > > > > > as you've got a properly accelerated DRM graphics pipeline. Mor=
e
> > > > > > likely 2D/3D and memory.
> > > > >
> > > > > indeed.
> > > > > For quantified look i=E2=80=99m looking on v.simple approach to e=
stimate real clock is http://uob-hpc.github.io/2017/11/22/arm-clock-freq.ht=
ml
> > > > > by curiosity i looked what it reports on a53/a55/a72/a76 and it i=
s surprisingly accurate :-)
> > > > > on mine 3576 with collabora uboot+mainline atf is hows 800MHz (an=
d in perf. gov it seems to be constant)
> > > > >
> > > > > >
> > > > > > There might be some difference in how PVTPLL behaves on RK3576 =
vs.
> > > > > > RK3588. But frankly first I would check if you are using compar=
able
> > > > > > ATF implementations (e.g. upstream TF-A in both cases), kernels=
 and
> > > > > > thermal environment :)
> > > > >
> > > > > all tests: the same 6.15.2 mainline + some collabora patches
> > > > >
> > > > > diffs were:
> > > > > 1.collabora uboot[1] + mainline atf 2.13
> > > > > 2.collabora uboot[1] + rockchip rkbin bl31 blob
> > > > > 3.vendor uboot (bin dump from friendlyelec ubuntu image)
> > > > >
> > > > > on 1/2 i see kind of issue with clock values (i.e. perf gov gives=
 constant 800MHz on mainline atf).
> > > > > 3 seems to perform better - (i.e. perf gov gives constant 1500MHz=
 so all is snappier/faster)
> > > >
> > > > There is indeed something weird going on. I've tried running sbc-be=
nch
> > > > [1], and even though I observe dynamically varying CPU frequencies
> > > > after boot with schedutil governor, once sbc-bench switches the
> > > > governor to "performance" and goes through the OPPs in descending
> > > > frequency order, the CPUs seem to get stuck at the last applied low
> > > > frequency. Even after max frequency gets reverted from 408 MHz to
> > > > something higher, even after I switch the governor to something els=
e -
> > > > no matter what. Only a reboot gets the higher frequencies 'unstuck'
> > > > for me.
> > > >
> > > > These are all observed at around 55C SoC temperature, so throttling=
 is
> > > > not an issue. Regulators are stuck at 950000 uV - way above 700000 =
uV
> > > > that the 408 MHz OPP requires (and power readings seem to match: I'=
m
> > > > getting about 2.3W consumption at 408 MHz in idle vs. normal idle
> > > > reading of 1.4W at around 1 GHz).
> > > >
> > > > Not sure what's going on here, and I don't remember seeing anything
> > > > similar on RK3588. Thoughts welcome.
> > >
> > > This may once again be a "accidentally uses wrong clock IDs" type
> > > situation. The other possibility is that we're getting confused
> > > between what we think the clock rate is and what SCMI actually set
> > > the clock rate to.
> > >
> > > Things to check is whether the right clock controller (scmi vs cru)
> > > and the right clock id (check ATF source for this) is used.
> >
> > Clock IDs in the kernel seem to match those in ATF, but I've noticed
> > what appears to be a buffer overflow in some of the SCMI clock names
> > defined in the opensource TF-A (thanks GCC 15 and its zealous
> > warnings):
>
> After some more testing, I tend to confirm what Piotr observed
> earlier. Namely, frequency scaling acts weird on any ATF version (be
> it binary BL31 or opensource TF-A), as long as mainline u-boot is
> used. Using the u-boot binary extracted from the ArmSoM QWRT image
> does not lead to "stuck" CPU frequencies when running sbc-bench.
>
> I'm getting this with the exact same kernel build (6.16-rc1 with some
> Sige5 related patches, namely v2 of this series, Nicolas' USB
> enablement series and TSADC). The only other difference is that the
> binary u-boot doesn't have EFI support, so I had to boot into the
> ARM64 uncompressed Image instead of vmlinuz.efi, but those were both
> taken from the same build.
>
> What I'm observing during the sbc-bench run:
>  - It switches the cpufreq governor from schedutil to performance
>  - It goes through all CPU OPPs in descending frequency order
>  --- While it does that when booted using mainline u-boot +
> vmlinuz.efi: "hardware limits" line in "cpupower -c 0,4
> frequency-info" changes with each OPP change (the max frequency
> getting reduced sequentially), then it resets to the initial full
> range, but the actual frequency stays stuck at the lowest possible
> value
>  --- While it does that when booted using binary u-boot + Image:
> "hardware limits" line in "cpupower -c 0,4 frequency-info" doesn't
> change, but the actual frequency gets reduced sequentially. Then after
> the iteration over all OPPs is completed it returns to the highest
> possible value, and adjusts dynamically based on thermal throttling as
> the benchmark progresses

Slight correction: it's not the "hardware limits" line, but rather
"current policy".

Note that booting mainline u-boot in non-EFI mode (using plain Image)
doesn't change the results above.

> So it seems that it's not really linked to SCMI clocks or PVTPLL per
> se, but rather what the binary u-boot configures differently vs.
> mainline before the kernel takes over, or something in other firmware
> services that the binary u-boot provides (?)
>
> I'm wondering if there is any clock related functionality in the
> OP-TEE? I didn't have any OP-TEE image in my mainline u-boot builds
> (frankly, I don't even know where to grab one), but the binary u-boot
> from ArmSoM advertises the following:
>
> I/TC: OP-TEE version: 3.13.0-791-g185dc3c92 #hisping.lin (gcc version
> 10.2.1 20201103 (GNU Toolchain for the A-profile Architecture
> 10.2-2020.11 (arm-10.16))) #2 Tue Apr 16 11:05:25 CST 2024 aarch64,
> fwver: v1.01

FTR: I've tried to bluntly wrap rk3576_bl32_v1.05.bin into an ELF file
using the following linker script and feed it as $TEE to the mainline
u-boot build, but the resulting u-boot-rockchip.bin gets stuck at boot
after checking hashes of ATF images, so I'm still lost as to how one
can check if the OP-TEE has any influence on the cpufreq behavior.

---
ENTRY(_binary_rk3576_bl32_v1_05_bin_start);

SECTIONS
{
        . =3D 0x08400000;
        .data : {
                *(.data)
        }
}
---

0x08400000 is the addr listed for BL32 in RK3576TRUST.ini in rkbin.

Best regards,
Alexey
