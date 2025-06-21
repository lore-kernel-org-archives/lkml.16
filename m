Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A504027280D;
	Sat, 21 Jun 2025 21:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750540884; cv=none; b=X1O2XmlYyd6RcqtQikqQy+nHESLRQxfzuvD2XxUt438XBQ2sQGuf5Tc3fdDdVtRgUMWSWOvk679W9YAktmK16Ky095VjA0ke7a9ufQ4R1rM/mbyEl0Arq/MvmQQrO2Zp/eqq4uUClz3jSLctnq8SBW5YbzQdcMvW5FY69Vwnx4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750540884; c=relaxed/simple;
	bh=rlKbGzA6SkUIN5ovLeTNdCtARzGTaWmaMEZDojtTPGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AmOGWxEfkaQyminRpshHNQlQDEfrwa0YCcdRy5aV16RXTJWi3RL7OgIRRlHIS06L1Y1PDvx6gyJWKoOMan6Hm7axNMwurOciX/QLYAlMOc/kT/834jXI6Ba5se0eYLV6lD1Kd/Au6AycigdAP/j3d+Q4sBQIapWfJaOwlxLbjqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hbbbnrpi; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbbbnrpi"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4a52d82adcaso41986541cf.0;
        Sat, 21 Jun 2025 14:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750540881; x=1751145681; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8yLeaexx7LlGaVLkl5qRY5z0whAeYjxT9TiaK1W4kQ8=;
        b=hbbbnrpimV970v3ZIPmgaeNBj3auytoekOxt6yT1CTY9RWBJeLbUopiTrwh4WyqUrx
         Pm1PNFuM+I2XwfhszbkjizBGyWvAC34+09LYrK+wsEPUrPCNOVC1WGSKVw/PADIP3GTf
         EYfq6WpIRVoIqkNwtYYk2fOWSXHFx4HKbDVDPv4sVsXPjW1254zNOl3DfvexokR0z227
         d7VjLx7TjiTrzMMhZvsqjNjP6ywrOY+sYrZ2eUF44rRTg2SRFIjki+LzGTGRjxM3E9Dz
         3pdm1PQNtIJS61hKprn0u6DSslgDda4NeM0NSvfs0uQ8C7Dirv0pxV9DgkB/4XfWQUXD
         8dTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750540881; x=1751145681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8yLeaexx7LlGaVLkl5qRY5z0whAeYjxT9TiaK1W4kQ8=;
        b=HH1Uw09PhPWZK/503XaBglsmRaffTB0u2W8u2ydzOoynbZYVg6FXIiAZpIfRmiRJ/B
         PJYhaBQwVdVVMtkIg3cQS6VcKFMvLmEhRQuW6UuJnrds453E08pmUkdJuV8ejTngeluR
         LR2yPssW1QHXRzff/jn6Q7jakIIDFzpr9rjFev834NVzjnp8JfCFGrU1v4PTcxr7CW4p
         PC1ZlsmqazKB3VzLrvpbVu2jyr21reoHlwXQJbrddlutDl9xivPFDTOpbKkOEdfiyQSc
         eqkvKMzFAy5lvZsBlDp9e/fpp6TY/pn0DYDMAwB3iwmn+uBIHb0JyqAgsNq8vkpieUe2
         UVGw==
X-Forwarded-Encrypted: i=1; AJvYcCVpKSajDwxmMRcyt0tXmMNA4CfVU2ARit7iPYermQLa54iDrcl4zkOUET0UeB2VAH8KuILWyRYEUtgXxIEB@vger.kernel.org, AJvYcCWMJRFj+DfAzd2FDYr1Df8ANxcCnUhAz4lSXrUDY6CDRDTAaWqv3hsMZAfo3bdhbR3hQqARF+Uc5T/g@vger.kernel.org
X-Gm-Message-State: AOJu0YwKPMoKUiTIdTDiHppFKIaKqlPic9+hiGZNBRIaSHBjU++dYeq+
	6ryTWhK9s1shaevqj0zDqWeEFbQ/NUCWiuDt1nlhx69Mi2BeLnyskflc8gWsqJXbhZ+rNK8CdZC
	CWRv7/sxJqxj1ANX4oV3XcZbd6y5sVJ4=
X-Gm-Gg: ASbGncsiParoqGzEwsE7A5wVLVn3kyujDtPtxhxju3H6LFTeZ102W0KWkPEXuUkEX66
	2E4+4rWk4fFeh2mhMz9vL6MhyyQudwf7pG6LNzoM2uf6KMDM0SW+P1bQfcs84850W2OzTrubaCx
	P39y9cFzRktxpP4OvgbKS8gJl4rgWF2WJCVOadWQZa3eB/0fPTCTYP8auoVu4YyYJx+pSVeo3Ap
	MhNXJKka5Czxa0=
X-Google-Smtp-Source: AGHT+IF10w8qHQVdw5XPFMec7MnTSIJKT2/VUg72Ub1ubBrj+jd2kmMzG1j14GxtYJUWYZOmQAHp5msUnnMY0KNzO0s=
X-Received: by 2002:ac8:7f92:0:b0:477:ea0:1b27 with SMTP id
 d75a77b69052e-4a77a273559mr110864311cf.26.1750540881263; Sat, 21 Jun 2025
 14:21:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <CABjd4YwrBurnKOAqXK_wFj0c7bEV-PZ682_-1y_VNMPvFrJ-Aw@mail.gmail.com>
 <CABjd4YyBoTkNcFVDcYFXt1mNh==wTa1pO7BTmam6CX68rrF=oQ@mail.gmail.com> <3286000.Y6S9NjorxK@phil>
In-Reply-To: <3286000.Y6S9NjorxK@phil>
From: Alexey Charkov <alchark@gmail.com>
Date: Sun, 22 Jun 2025 01:21:11 +0400
X-Gm-Features: AX0GCFufcxGWGjcZEll2Xq2W_jHEGrGbUvaVEyzR1eAfX_oRD7rszR37No9EbuQ
Message-ID: <CABjd4YyaNF1zosFFi6hEsZanPDxoaa1h4Dpd6uTPRwA3BZn0=w@mail.gmail.com>
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

On Sat, Jun 21, 2025 at 11:44=E2=80=AFPM Heiko Stuebner <heiko@sntech.de> w=
rote:
>
> Am Samstag, 21. Juni 2025, 21:35:56 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Alexey Charkov:
> > On Fri, Jun 20, 2025 at 8:02=E2=80=AFPM Alexey Charkov <alchark@gmail.c=
om> wrote:
> > >
> > > On Wed, Jun 18, 2025 at 6:48=E2=80=AFPM Alexey Charkov <alchark@gmail=
.com> wrote:
> > > >
> > > > On Wed, Jun 18, 2025 at 6:06=E2=80=AFPM Nicolas Frattaroli
> > > > <nicolas.frattaroli@collabora.com> wrote:
> > > > >
> > > > > Hello,
> > > > >
> > > > > +Cc Jonas Karlman as he is intimately familiar with RK3576 clock =
shenanigans by now,
> > > > >
> > > > > On Wednesday, 18 June 2025 15:51:45 Central European Summer Time =
Alexey Charkov wrote:
> > > > > > On Sun, Jun 15, 2025 at 8:00=E2=80=AFPM Piotr Oniszczuk
> > > > > > <piotr.oniszczuk@gmail.com> wrote:
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > > Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@=
gmail.com> w dniu 9 cze 2025, o godz. 16:05:
> > > > > > > >
> > > > > > > > On Sun, Jun 8, 2025 at 11:24=E2=80=AFAM Piotr Oniszczuk
> > > > > > > > <piotr.oniszczuk@gmail.com> wrote:
> > > > > > > >>> Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchar=
k@gmail.com> w dniu 5 cze 2025, o godz. 15:42:
> > > > > > > >>>> Alexey,
> > > > > > > >>>> I see you are using rk3576 board like me (nanopi-m5)
> > > > > > > >>>> Have you on your board correctly working cpu dvfs?
> > > > > > > >>>> I mean: [1][desired clocks reported by kernel sysfs are =
in pair with [2[]cur clocks?
> > > > > > > >>>> In my case i see mine cpu lives totally on it=E2=80=99s =
own with dvfs:
> > > > > > > >>>
> > > > > > > >>> Hi Piotr,
> > > > > > > >>>
> > > > > > > >>> I haven't tried to validate actual running frequencies vs=
. requested
> > > > > > > >>> frequencies, but subjective performance and power consump=
tion seem to
> > > > > > > >>> be in line with what I expect.
> > > > > > > >>
> > > > > > > >> well - my subjective l&f is that  - currently - my rk3576 =
seems =E2=80=9Eslower" than i.e. 4xA53 h618.
> > > > > > > >
> > > > > > > > In my experience, native compilation of GCC 14 using 8 thre=
ads on
> > > > > > > > RK3576 (mainline with passive cooling and throttling enable=
d): 2 hours
> > > > > > > > 6 minutes, on RK3588 (mainline with passive cooling via Rad=
xa Rock 5B
> > > > > > > > case and throttling enabled but never kicking in): 1 hour 1=
0 minutes
> > > > > > >
> > > > > > > by curiosity i looked randomly on 3576 vs 3588:
> > > > > > > multithread passmark: 3675 (https://www.cpubenchmark.net/cpu.=
php?cpu=3DRockchip+RK3576&id=3D6213)
> > > > > > > multithread passmark: 4530 (https://www.cpubenchmark.net/cpu.=
php?cpu=3DRockchip+RK3588&id=3D4906)
> > > > > > >
> > > > > > > assuming 3588 as baseline, 3576 is approx 20% slower on multi=
thread passmark (has ~0,8 comp power of 3588)
> > > > > > > 70 min compile on 3588 should take something like ~86min on 3=
576.
> > > > > > > In your case 126min compile on 3576 shows 3576 offers 0,55 co=
mp power of 3588.
> > > > > > > Roughly 3576 should do this task in 40min less than you curre=
ntly see i think
> > > > > > >
> > > > > > >
> > > > > > > > Can't see how u-boot would affect CPU speed in Linux, as lo=
ng as you
> > > > > > > > use comparable ATF images. Do you use the same kernel and d=
tb in all
> > > > > > > > these cases? Also, what's your thermal setup?
> > > > > > >
> > > > > > > yes. in all cases only change was: uboot & atf
> > > > > > > thermal is based on recent collabora series (+ recent pooling=
 fix for clocks return from throttling)
> > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > > Not sure UX is a particularly good measure of CPU performan=
ce, as long
> > > > > > > > as you've got a properly accelerated DRM graphics pipeline.=
 More
> > > > > > > > likely 2D/3D and memory.
> > > > > > >
> > > > > > > indeed.
> > > > > > > For quantified look i=E2=80=99m looking on v.simple approach =
to estimate real clock is http://uob-hpc.github.io/2017/11/22/arm-clock-fre=
q.html
> > > > > > > by curiosity i looked what it reports on a53/a55/a72/a76 and =
it is surprisingly accurate :-)
> > > > > > > on mine 3576 with collabora uboot+mainline atf is hows 800MHz=
 (and in perf. gov it seems to be constant)
> > > > > > >
> > > > > > > >
> > > > > > > > There might be some difference in how PVTPLL behaves on RK3=
576 vs.
> > > > > > > > RK3588. But frankly first I would check if you are using co=
mparable
> > > > > > > > ATF implementations (e.g. upstream TF-A in both cases), ker=
nels and
> > > > > > > > thermal environment :)
> > > > > > >
> > > > > > > all tests: the same 6.15.2 mainline + some collabora patches
> > > > > > >
> > > > > > > diffs were:
> > > > > > > 1.collabora uboot[1] + mainline atf 2.13
> > > > > > > 2.collabora uboot[1] + rockchip rkbin bl31 blob
> > > > > > > 3.vendor uboot (bin dump from friendlyelec ubuntu image)
> > > > > > >
> > > > > > > on 1/2 i see kind of issue with clock values (i.e. perf gov g=
ives constant 800MHz on mainline atf).
> > > > > > > 3 seems to perform better - (i.e. perf gov gives constant 150=
0MHz so all is snappier/faster)
> > > > > >
> > > > > > There is indeed something weird going on. I've tried running sb=
c-bench
> > > > > > [1], and even though I observe dynamically varying CPU frequenc=
ies
> > > > > > after boot with schedutil governor, once sbc-bench switches the
> > > > > > governor to "performance" and goes through the OPPs in descendi=
ng
> > > > > > frequency order, the CPUs seem to get stuck at the last applied=
 low
> > > > > > frequency. Even after max frequency gets reverted from 408 MHz =
to
> > > > > > something higher, even after I switch the governor to something=
 else -
> > > > > > no matter what. Only a reboot gets the higher frequencies 'unst=
uck'
> > > > > > for me.
> > > > > >
> > > > > > These are all observed at around 55C SoC temperature, so thrott=
ling is
> > > > > > not an issue. Regulators are stuck at 950000 uV - way above 700=
000 uV
> > > > > > that the 408 MHz OPP requires (and power readings seem to match=
: I'm
> > > > > > getting about 2.3W consumption at 408 MHz in idle vs. normal id=
le
> > > > > > reading of 1.4W at around 1 GHz).
> > > > > >
> > > > > > Not sure what's going on here, and I don't remember seeing anyt=
hing
> > > > > > similar on RK3588. Thoughts welcome.
> > > > >
> > > > > This may once again be a "accidentally uses wrong clock IDs" type
> > > > > situation. The other possibility is that we're getting confused
> > > > > between what we think the clock rate is and what SCMI actually se=
t
> > > > > the clock rate to.
> > > > >
> > > > > Things to check is whether the right clock controller (scmi vs cr=
u)
> > > > > and the right clock id (check ATF source for this) is used.
> > > >
> > > > Clock IDs in the kernel seem to match those in ATF, but I've notice=
d
> > > > what appears to be a buffer overflow in some of the SCMI clock name=
s
> > > > defined in the opensource TF-A (thanks GCC 15 and its zealous
> > > > warnings):
> > >
> > > After some more testing, I tend to confirm what Piotr observed
> > > earlier. Namely, frequency scaling acts weird on any ATF version (be
> > > it binary BL31 or opensource TF-A), as long as mainline u-boot is
> > > used. Using the u-boot binary extracted from the ArmSoM QWRT image
> > > does not lead to "stuck" CPU frequencies when running sbc-bench.
> > >
> > > I'm getting this with the exact same kernel build (6.16-rc1 with some
> > > Sige5 related patches, namely v2 of this series, Nicolas' USB
> > > enablement series and TSADC). The only other difference is that the
> > > binary u-boot doesn't have EFI support, so I had to boot into the
> > > ARM64 uncompressed Image instead of vmlinuz.efi, but those were both
> > > taken from the same build.
> > >
> > > What I'm observing during the sbc-bench run:
> > >  - It switches the cpufreq governor from schedutil to performance
> > >  - It goes through all CPU OPPs in descending frequency order
> > >  --- While it does that when booted using mainline u-boot +
> > > vmlinuz.efi: "hardware limits" line in "cpupower -c 0,4
> > > frequency-info" changes with each OPP change (the max frequency
> > > getting reduced sequentially), then it resets to the initial full
> > > range, but the actual frequency stays stuck at the lowest possible
> > > value
> > >  --- While it does that when booted using binary u-boot + Image:
> > > "hardware limits" line in "cpupower -c 0,4 frequency-info" doesn't
> > > change, but the actual frequency gets reduced sequentially. Then afte=
r
> > > the iteration over all OPPs is completed it returns to the highest
> > > possible value, and adjusts dynamically based on thermal throttling a=
s
> > > the benchmark progresses
> >
> > Slight correction: it's not the "hardware limits" line, but rather
> > "current policy".
> >
> > Note that booting mainline u-boot in non-EFI mode (using plain Image)
> > doesn't change the results above.
>
> I'm in a similar boat, while trying to make DSI run on the rk3576.
> Andy from Rockchip was able to make it work "just" by using vendor-
> firmware - while using mainline u-boot (with both mainline TF-A
> or vendor TF-A) produces just black output.
>
> I think when I did the mainline u-boot thing I took the "vendor"-code
> from the armbian rk3576 vendor-u-boot ... but that actually may differ
> from what the vendors provided?

Just tried booting into u-boot built from ArmSoM sources at [1] - same
issues as using mainline. Either I'm doing something stupid building
it (don't know what though), or the binary shipped in ArmSoM images is
indeed different from what the sources are.

FTR, my steps to build the vendor u-boot were:

make rk3576_defconfig
cp ~/rkbin/bin/rk35/rk3576_bl31_v1.15.elf bl31.elf
cp ~/rkbin/bin/rk35/rk3576_bl32_v1.05.bin tee.bin
make -j12
make u-boot.itb
./tools/mkimage -n rk3576 -T rksd -d
~/rkbin/bin/rk35/rk3576_ddr_lp4_2112MHz_lp5_2736MHz_v1.09.bin:spl/u-boot-sp=
l-dtb.bin
idbloader.img

Then I wrote idbloader.img to eMMC starting from sector 64, u-boot.itb
starting from sector 16384. It boots, but exhibits the same "stuck"
CPU frequencies as with mainline u-boot.

FWIW, I've managed to load Rockchip BL32 as OP-TEE with mainline
u-boot too: turns out the right address to load it is 0x48400000 and
not 0x08400000. It didn't help with the problem though.

Best regards,
Alexey

[1] https://github.com/ArmSoM/u-boot/tree/rk3576-6.1-rk3.1
