Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBF119A297;
	Fri, 20 Jun 2025 16:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750435384; cv=none; b=sswSssM0r9OmM0XweBaVCmzzQjm8p3Tn13OH8fG8cxyU4Cn6ZP8F10bYT1hFXmSwm9bFNhLNuyxHMAl1A/mgoT4zNTWLE7tuUZ761dZkY1/dTGehEjo8sr7KKdBiqkilBr2iVuDhLcRfi/NXduZQJOsXPw8eusBV1r3NWmXODjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750435384; c=relaxed/simple;
	bh=W3DvKeM4EqzLWasnxKnmL5cXYh+j/mu4ated+XvGcS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=czn9gOQKHklmH9UUiqOPtj7UhU5B9/E5mA9a6clPa8fMvHpJQulZLqRez2cO76R5aKjwdjb3UR0ygkP1fS/8XysybsMOn8awVQ+OEanF0f/TbPiVpIttZLEQwZ1JupCJ7eYlD+naAZy6se/lVAFhlqncVBy1tXyAd6GIyMlr5CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NKr5Lo38; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NKr5Lo38"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a76ea97cefso21101751cf.2;
        Fri, 20 Jun 2025 09:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750435382; x=1751040182; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvqqy5YTKLkCqgHETfYa8hhkLZxk0yPmImTHTMo7/0s=;
        b=NKr5Lo38ybJ/lZIdhjTcTVOPPCOrIAlNxKFbaa29WgANxbeB6i3ZYzb+z3+cosdvop
         292vQDB7X8jb/XjRtqr7e+xHO6seGkWifC7fp7jLRd3crmtRm1sHlO11S0rBEU4nlaMg
         g8xYzZK1ouCD6Hthm8hZHQvK57DYe86NjPe0Yyw9ClamO3iAo9VAtUzGNhUZcwKr0FhE
         IIrOM++iHIg7T0Xqqr9BLftVFUFBayLoM/xarm20q0/iY/oPEKIMV6WRCtlcC8tjntdw
         9F3OCEQOMimxoRCruM04ZRLmLBIaA+KwGzEpJWJZtJa521wmTXxYcMKveYRG3kKpbrke
         GGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750435382; x=1751040182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvqqy5YTKLkCqgHETfYa8hhkLZxk0yPmImTHTMo7/0s=;
        b=qDbwgaf/VomVO960NvVMfEyd8TgBiPDP44ex6Mq+HQ9s3BI/HcG4wZCYPzzQuIWYg+
         8iJ9a+vih6xe3nhT43W1smE2QrCuOoX80Po09apgbJl1WLXGS5NRJ5ibGfVqYZDLnhoO
         Usv6rRhbPGKKjJeG3Ej5wDDP2Y06eJu8iSeCYP73wuzFCxhNHFEya1DIsB/Ct8F4g0C3
         dN8voV6dFBk3ycsy9zaVIdVTPHW0+xpq+BA2CfmrN2YQHtvsZWEuDLnullVK7mQvbLeF
         oL1CsoqLwokYyuQRnHemzTBiTku8M1L3TP+UHcyrwV1KzJRakhb9w7oaqxZGhO5iqGxW
         yGIQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+H3KxgbmictsqB0ONlnq4jOvvnn95hkvn+9207aqkj5i3wWMxECZOWFEcnAiLufQ22yCV6kMwlLsF@vger.kernel.org, AJvYcCWyDiMHyerDxIeBEPp9MaIeqWMwUXn2VrICCZuDYwydEH+zGH+3wxpZy7KmMHBi3zvKxfUkTMNatINMW+IX@vger.kernel.org
X-Gm-Message-State: AOJu0YwLzgAgPC2co3IBeXs5z/0E/IgTBiJj4z2ws4J4sGwiuvCmrb+e
	G9jNd0Krar0+rCbvkI4yytw+PaG71BwOw5Ji38rEfBvQIqFzIUcrE8uijdQh5WhAZak1xtBLpWR
	YKXoorC2aNJSK3qK2CmGbUiwJLjPCGFY=
X-Gm-Gg: ASbGncszGV5uC0EkDjoJmGUJWpSjbyMLBfTv0+9YiBi94pSgmOAiQitnkl6jAl7bkWB
	NfFiOFe9W5FjAE6ozpR1Soxgf6Fm1EKlMj+Pn7XTfHNZWpctyyp53zTFG63g8P9NBr2SIW254DU
	ObTFgTZ68ntXqwEadlutbXev+nLT2bu1iBlc4eXjpKzfXy7tq3W8Toy9/j5enBGA2AfKbuOGTKc
	gEy
X-Google-Smtp-Source: AGHT+IEbRIf1llrIp083n5cVXqVqWOQqhIoBknN8uXJqch8RV+Pe1B/1Kqh6XJDtTUh7xY9AjMghXr/jUe/Nc2Ohsfc=
X-Received: by 2002:a05:622a:22a2:b0:4a7:6ddf:f7d6 with SMTP id
 d75a77b69052e-4a77a1f5fe1mr37932691cf.10.1750435381694; Fri, 20 Jun 2025
 09:03:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <80ACAAAE-F522-4199-9048-ADE69F6E1128@gmail.com> <CABjd4YyVJv0NmF9LsGWQ-O44MGjT5=FFeUjbg5rJ6XkNgjxb+g@mail.gmail.com>
 <3286422.5fSG56mABF@workhorse> <CABjd4Yy0rjET+TyA3pNGrzfKd1xKKG1AjWFFLsgb+mgDpu_TRg@mail.gmail.com>
In-Reply-To: <CABjd4Yy0rjET+TyA3pNGrzfKd1xKKG1AjWFFLsgb+mgDpu_TRg@mail.gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 20 Jun 2025 20:02:50 +0400
X-Gm-Features: AX0GCFvdN48ERIfe-GKBbQO5ahvzTNBpETI9sWZVQzOBmONmFE6WTCwT7mhrfFQ
Message-ID: <CABjd4YwrBurnKOAqXK_wFj0c7bEV-PZ682_-1y_VNMPvFrJ-Aw@mail.gmail.com>
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

On Wed, Jun 18, 2025 at 6:48=E2=80=AFPM Alexey Charkov <alchark@gmail.com> =
wrote:
>
> On Wed, Jun 18, 2025 at 6:06=E2=80=AFPM Nicolas Frattaroli
> <nicolas.frattaroli@collabora.com> wrote:
> >
> > Hello,
> >
> > +Cc Jonas Karlman as he is intimately familiar with RK3576 clock shenan=
igans by now,
> >
> > On Wednesday, 18 June 2025 15:51:45 Central European Summer Time Alexey=
 Charkov wrote:
> > > On Sun, Jun 15, 2025 at 8:00=E2=80=AFPM Piotr Oniszczuk
> > > <piotr.oniszczuk@gmail.com> wrote:
> > > >
> > > >
> > > >
> > > > > Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gmail.=
com> w dniu 9 cze 2025, o godz. 16:05:
> > > > >
> > > > > On Sun, Jun 8, 2025 at 11:24=E2=80=AFAM Piotr Oniszczuk
> > > > > <piotr.oniszczuk@gmail.com> wrote:
> > > > >>> Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gmai=
l.com> w dniu 5 cze 2025, o godz. 15:42:
> > > > >>>> Alexey,
> > > > >>>> I see you are using rk3576 board like me (nanopi-m5)
> > > > >>>> Have you on your board correctly working cpu dvfs?
> > > > >>>> I mean: [1][desired clocks reported by kernel sysfs are in pai=
r with [2[]cur clocks?
> > > > >>>> In my case i see mine cpu lives totally on it=E2=80=99s own wi=
th dvfs:
> > > > >>>
> > > > >>> Hi Piotr,
> > > > >>>
> > > > >>> I haven't tried to validate actual running frequencies vs. requ=
ested
> > > > >>> frequencies, but subjective performance and power consumption s=
eem to
> > > > >>> be in line with what I expect.
> > > > >>
> > > > >> well - my subjective l&f is that  - currently - my rk3576 seems =
=E2=80=9Eslower" than i.e. 4xA53 h618.
> > > > >
> > > > > In my experience, native compilation of GCC 14 using 8 threads on
> > > > > RK3576 (mainline with passive cooling and throttling enabled): 2 =
hours
> > > > > 6 minutes, on RK3588 (mainline with passive cooling via Radxa Roc=
k 5B
> > > > > case and throttling enabled but never kicking in): 1 hour 10 minu=
tes
> > > >
> > > > by curiosity i looked randomly on 3576 vs 3588:
> > > > multithread passmark: 3675 (https://www.cpubenchmark.net/cpu.php?cp=
u=3DRockchip+RK3576&id=3D6213)
> > > > multithread passmark: 4530 (https://www.cpubenchmark.net/cpu.php?cp=
u=3DRockchip+RK3588&id=3D4906)
> > > >
> > > > assuming 3588 as baseline, 3576 is approx 20% slower on multithread=
 passmark (has ~0,8 comp power of 3588)
> > > > 70 min compile on 3588 should take something like ~86min on 3576.
> > > > In your case 126min compile on 3576 shows 3576 offers 0,55 comp pow=
er of 3588.
> > > > Roughly 3576 should do this task in 40min less than you currently s=
ee i think
> > > >
> > > >
> > > > > Can't see how u-boot would affect CPU speed in Linux, as long as =
you
> > > > > use comparable ATF images. Do you use the same kernel and dtb in =
all
> > > > > these cases? Also, what's your thermal setup?
> > > >
> > > > yes. in all cases only change was: uboot & atf
> > > > thermal is based on recent collabora series (+ recent pooling fix f=
or clocks return from throttling)
> > > >
> > > > >
> > > > >
> > > > > Not sure UX is a particularly good measure of CPU performance, as=
 long
> > > > > as you've got a properly accelerated DRM graphics pipeline. More
> > > > > likely 2D/3D and memory.
> > > >
> > > > indeed.
> > > > For quantified look i=E2=80=99m looking on v.simple approach to est=
imate real clock is http://uob-hpc.github.io/2017/11/22/arm-clock-freq.html
> > > > by curiosity i looked what it reports on a53/a55/a72/a76 and it is =
surprisingly accurate :-)
> > > > on mine 3576 with collabora uboot+mainline atf is hows 800MHz (and =
in perf. gov it seems to be constant)
> > > >
> > > > >
> > > > > There might be some difference in how PVTPLL behaves on RK3576 vs=
.
> > > > > RK3588. But frankly first I would check if you are using comparab=
le
> > > > > ATF implementations (e.g. upstream TF-A in both cases), kernels a=
nd
> > > > > thermal environment :)
> > > >
> > > > all tests: the same 6.15.2 mainline + some collabora patches
> > > >
> > > > diffs were:
> > > > 1.collabora uboot[1] + mainline atf 2.13
> > > > 2.collabora uboot[1] + rockchip rkbin bl31 blob
> > > > 3.vendor uboot (bin dump from friendlyelec ubuntu image)
> > > >
> > > > on 1/2 i see kind of issue with clock values (i.e. perf gov gives c=
onstant 800MHz on mainline atf).
> > > > 3 seems to perform better - (i.e. perf gov gives constant 1500MHz s=
o all is snappier/faster)
> > >
> > > There is indeed something weird going on. I've tried running sbc-benc=
h
> > > [1], and even though I observe dynamically varying CPU frequencies
> > > after boot with schedutil governor, once sbc-bench switches the
> > > governor to "performance" and goes through the OPPs in descending
> > > frequency order, the CPUs seem to get stuck at the last applied low
> > > frequency. Even after max frequency gets reverted from 408 MHz to
> > > something higher, even after I switch the governor to something else =
-
> > > no matter what. Only a reboot gets the higher frequencies 'unstuck'
> > > for me.
> > >
> > > These are all observed at around 55C SoC temperature, so throttling i=
s
> > > not an issue. Regulators are stuck at 950000 uV - way above 700000 uV
> > > that the 408 MHz OPP requires (and power readings seem to match: I'm
> > > getting about 2.3W consumption at 408 MHz in idle vs. normal idle
> > > reading of 1.4W at around 1 GHz).
> > >
> > > Not sure what's going on here, and I don't remember seeing anything
> > > similar on RK3588. Thoughts welcome.
> >
> > This may once again be a "accidentally uses wrong clock IDs" type
> > situation. The other possibility is that we're getting confused
> > between what we think the clock rate is and what SCMI actually set
> > the clock rate to.
> >
> > Things to check is whether the right clock controller (scmi vs cru)
> > and the right clock id (check ATF source for this) is used.
>
> Clock IDs in the kernel seem to match those in ATF, but I've noticed
> what appears to be a buffer overflow in some of the SCMI clock names
> defined in the opensource TF-A (thanks GCC 15 and its zealous
> warnings):

After some more testing, I tend to confirm what Piotr observed
earlier. Namely, frequency scaling acts weird on any ATF version (be
it binary BL31 or opensource TF-A), as long as mainline u-boot is
used. Using the u-boot binary extracted from the ArmSoM QWRT image
does not lead to "stuck" CPU frequencies when running sbc-bench.

I'm getting this with the exact same kernel build (6.16-rc1 with some
Sige5 related patches, namely v2 of this series, Nicolas' USB
enablement series and TSADC). The only other difference is that the
binary u-boot doesn't have EFI support, so I had to boot into the
ARM64 uncompressed Image instead of vmlinuz.efi, but those were both
taken from the same build.

What I'm observing during the sbc-bench run:
 - It switches the cpufreq governor from schedutil to performance
 - It goes through all CPU OPPs in descending frequency order
 --- While it does that when booted using mainline u-boot +
vmlinuz.efi: "hardware limits" line in "cpupower -c 0,4
frequency-info" changes with each OPP change (the max frequency
getting reduced sequentially), then it resets to the initial full
range, but the actual frequency stays stuck at the lowest possible
value
 --- While it does that when booted using binary u-boot + Image:
"hardware limits" line in "cpupower -c 0,4 frequency-info" doesn't
change, but the actual frequency gets reduced sequentially. Then after
the iteration over all OPPs is completed it returns to the highest
possible value, and adjusts dynamically based on thermal throttling as
the benchmark progresses

So it seems that it's not really linked to SCMI clocks or PVTPLL per
se, but rather what the binary u-boot configures differently vs.
mainline before the kernel takes over, or something in other firmware
services that the binary u-boot provides (?)

I'm wondering if there is any clock related functionality in the
OP-TEE? I didn't have any OP-TEE image in my mainline u-boot builds
(frankly, I don't even know where to grab one), but the binary u-boot
from ArmSoM advertises the following:

I/TC: OP-TEE version: 3.13.0-791-g185dc3c92 #hisping.lin (gcc version
10.2.1 20201103 (GNU Toolchain for the A-profile Architecture
10.2-2020.11 (arm-10.16))) #2 Tue Apr 16 11:05:25 CST 2024 aarch64,
fwver: v1.01

Any thoughts would be much appreciated.

Best regards,
Alexey
