Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA9719ABB6;
	Wed, 18 Jun 2025 14:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750258121; cv=none; b=Rq3ylncePgEvOvFbT1ILDT7THA+rb3w4/+uzBXO3SWz2Dk0T7d68RvvgOOqX/i7fIAin+Q2ZOQ0AyCeswUvJUFHZD4K4qwTp0qyTyczF3m/DQsvRRyREtau69mIf6q1W4eeLozPl1trVNTagEaiU/4jn/7CV7ZKI5KKPuD76OGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750258121; c=relaxed/simple;
	bh=Yno15dni2nxubrTcYPTAh7qojMkJ4hRIIIn+p4nqmM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C8JAfgafu60c2e3ZsvzVIi+MxhEwhWByCyL5XJ/j0y1xWtFafVOg38JB2pMEUJiv1t3DHZGyS8DF3y0KEiz/61lRWQnurGIheEqeyxYpZN5FyzV003tvUkZJloTUmfWZkIIBOx2EF+y2Ir0Sbp65Xb2+nYFgND9Z1ti2Ys+8B94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8tZY/bB; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8tZY/bB"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4a3db0666f2so151861321cf.1;
        Wed, 18 Jun 2025 07:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750258119; x=1750862919; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9E/uzw/2mWDqrPKrh3O+mIF43zjnsnolCipqhB98e+4=;
        b=F8tZY/bBPbkNvjMRFWXx5wJXqVFb1Wq2CSw6Z+0Xt5DaX7dJPNTmO/ciPltXwR8bbH
         pOv9b0EJrp16KfsSPXJobaCHtAT1gntRBnkbGVa8JTv29JSGV1ueOhVMD5HL1LcrqxHx
         csl8i9FVFBGq9N4DZKsCgAh95gIlJFYHwfRvTASgUvDq7O8iXiTG9v3QZHmS212d28cF
         EUqpqK2Ph2L6zXIQAI08RRbj8aJ0nCz2v8C3OpzOLmI/bFundShHgZp1T9SRpPi7CCOw
         ZQr5LH69AvXzZ5/zykvdhP/yDQiC6EJpIYZdvUuo7zQaK9H/DI5KTD2JquGKbd1pRfhx
         ug3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750258119; x=1750862919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9E/uzw/2mWDqrPKrh3O+mIF43zjnsnolCipqhB98e+4=;
        b=lt5lBkKlIHR9kAKGDO+MnYxs8tByZYJXdKfswv8mAt+MKnNY7DNU+xk8oN7X11mVIz
         nho50/yufkwhp6HQ/K9UWhW82sAP/47UWi9xDc0cAJPniPSHBKELJ38w/wS/xz+oNdJV
         hQx6M5WmbEQ7QKOBsFMvGhQNskvyofM/eO9+SMGmQXB8F1bBX7+qdqtD8WJRejeW46v5
         jxkmIA9erZZpIdiH4P5gUZ1flZoNgn6bzn/85hL4R+Nv/CI/w0Oan0BdaFCEYcIIGw2S
         Uga6lgEjsGfwotRlXIA1OPx26zQbqWJJeYeT9E7ytVawgp3ySRuDpRk5wMo0UwoFpJHJ
         wj/g==
X-Forwarded-Encrypted: i=1; AJvYcCWZyEqPzmOaorua+vy7b1BK/p864+S+lHmLrgLeGz+9f7CnjKBS1Gsg0ceYN9GS9lRbPVJctY9/okSp@vger.kernel.org, AJvYcCXQhKRvs9lXjF5MqJgb0wyjNyojaGS9SLNXQQApZqBeh8Huk9lGdRF0zxuAvu10sPDhQTEgLGrdKVc8eQ9b@vger.kernel.org
X-Gm-Message-State: AOJu0YxATmyHAGizZuhF0oiUsoWeL+KwOzL5z7gQTrg+yftUarCOUK+1
	FyMnMB7cGAl3XC6XLMDm/fR1MzBMb90GY0+HlX8r5KT2g30xujKenSZCCfSwZJulIcDDcKzCa8h
	eT2fNSvHB2t4ldih+8+cAKGtjhnycYEc=
X-Gm-Gg: ASbGncu8Sf5OByunf1qz1W+CQHJRlflCb/PCiuCmKyEo+1UqF3VJwyP11M370EfRigL
	voO7grqg036FHDgyDzwK4Q/qScO/0wUdFGvX0dHFyQzD/AoAI2J6UEMwFjK7/WWj5N2muHyY7MG
	mC6GPM0zjlAPH4TSY/npiOXHrwF862WnELT1RfTlwC2fmY
X-Google-Smtp-Source: AGHT+IEbIb82kGHtuh6ygsi/4BRy8ZstxcD/xdyUKnyNWJ/L/+rSBgep91TjG1bWb6qk0ezqJmvSXC+ZNxOtpoO/Vl0=
X-Received: by 2002:ac8:7d0e:0:b0:4a6:c5ea:6fc with SMTP id
 d75a77b69052e-4a73c5b0a8bmr237877781cf.42.1750258118686; Wed, 18 Jun 2025
 07:48:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <80ACAAAE-F522-4199-9048-ADE69F6E1128@gmail.com> <CABjd4YyVJv0NmF9LsGWQ-O44MGjT5=FFeUjbg5rJ6XkNgjxb+g@mail.gmail.com>
 <3286422.5fSG56mABF@workhorse>
In-Reply-To: <3286422.5fSG56mABF@workhorse>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 18 Jun 2025 18:48:27 +0400
X-Gm-Features: AX0GCFtn17PCAtrv2cU3B3JX5Fm9l__TWgBDoQ7i4VVK1BJdOUr0X0UJ246hzQw
Message-ID: <CABjd4Yy0rjET+TyA3pNGrzfKd1xKKG1AjWFFLsgb+mgDpu_TRg@mail.gmail.com>
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

On Wed, Jun 18, 2025 at 6:06=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> Hello,
>
> +Cc Jonas Karlman as he is intimately familiar with RK3576 clock shenanig=
ans by now,
>
> On Wednesday, 18 June 2025 15:51:45 Central European Summer Time Alexey C=
harkov wrote:
> > On Sun, Jun 15, 2025 at 8:00=E2=80=AFPM Piotr Oniszczuk
> > <piotr.oniszczuk@gmail.com> wrote:
> > >
> > >
> > >
> > > > Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gmail.co=
m> w dniu 9 cze 2025, o godz. 16:05:
> > > >
> > > > On Sun, Jun 8, 2025 at 11:24=E2=80=AFAM Piotr Oniszczuk
> > > > <piotr.oniszczuk@gmail.com> wrote:
> > > >>> Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gmail.=
com> w dniu 5 cze 2025, o godz. 15:42:
> > > >>>> Alexey,
> > > >>>> I see you are using rk3576 board like me (nanopi-m5)
> > > >>>> Have you on your board correctly working cpu dvfs?
> > > >>>> I mean: [1][desired clocks reported by kernel sysfs are in pair =
with [2[]cur clocks?
> > > >>>> In my case i see mine cpu lives totally on it=E2=80=99s own with=
 dvfs:
> > > >>>
> > > >>> Hi Piotr,
> > > >>>
> > > >>> I haven't tried to validate actual running frequencies vs. reques=
ted
> > > >>> frequencies, but subjective performance and power consumption see=
m to
> > > >>> be in line with what I expect.
> > > >>
> > > >> well - my subjective l&f is that  - currently - my rk3576 seems =
=E2=80=9Eslower" than i.e. 4xA53 h618.
> > > >
> > > > In my experience, native compilation of GCC 14 using 8 threads on
> > > > RK3576 (mainline with passive cooling and throttling enabled): 2 ho=
urs
> > > > 6 minutes, on RK3588 (mainline with passive cooling via Radxa Rock =
5B
> > > > case and throttling enabled but never kicking in): 1 hour 10 minute=
s
> > >
> > > by curiosity i looked randomly on 3576 vs 3588:
> > > multithread passmark: 3675 (https://www.cpubenchmark.net/cpu.php?cpu=
=3DRockchip+RK3576&id=3D6213)
> > > multithread passmark: 4530 (https://www.cpubenchmark.net/cpu.php?cpu=
=3DRockchip+RK3588&id=3D4906)
> > >
> > > assuming 3588 as baseline, 3576 is approx 20% slower on multithread p=
assmark (has ~0,8 comp power of 3588)
> > > 70 min compile on 3588 should take something like ~86min on 3576.
> > > In your case 126min compile on 3576 shows 3576 offers 0,55 comp power=
 of 3588.
> > > Roughly 3576 should do this task in 40min less than you currently see=
 i think
> > >
> > >
> > > > Can't see how u-boot would affect CPU speed in Linux, as long as yo=
u
> > > > use comparable ATF images. Do you use the same kernel and dtb in al=
l
> > > > these cases? Also, what's your thermal setup?
> > >
> > > yes. in all cases only change was: uboot & atf
> > > thermal is based on recent collabora series (+ recent pooling fix for=
 clocks return from throttling)
> > >
> > > >
> > > >
> > > > Not sure UX is a particularly good measure of CPU performance, as l=
ong
> > > > as you've got a properly accelerated DRM graphics pipeline. More
> > > > likely 2D/3D and memory.
> > >
> > > indeed.
> > > For quantified look i=E2=80=99m looking on v.simple approach to estim=
ate real clock is http://uob-hpc.github.io/2017/11/22/arm-clock-freq.html
> > > by curiosity i looked what it reports on a53/a55/a72/a76 and it is su=
rprisingly accurate :-)
> > > on mine 3576 with collabora uboot+mainline atf is hows 800MHz (and in=
 perf. gov it seems to be constant)
> > >
> > > >
> > > > There might be some difference in how PVTPLL behaves on RK3576 vs.
> > > > RK3588. But frankly first I would check if you are using comparable
> > > > ATF implementations (e.g. upstream TF-A in both cases), kernels and
> > > > thermal environment :)
> > >
> > > all tests: the same 6.15.2 mainline + some collabora patches
> > >
> > > diffs were:
> > > 1.collabora uboot[1] + mainline atf 2.13
> > > 2.collabora uboot[1] + rockchip rkbin bl31 blob
> > > 3.vendor uboot (bin dump from friendlyelec ubuntu image)
> > >
> > > on 1/2 i see kind of issue with clock values (i.e. perf gov gives con=
stant 800MHz on mainline atf).
> > > 3 seems to perform better - (i.e. perf gov gives constant 1500MHz so =
all is snappier/faster)
> >
> > There is indeed something weird going on. I've tried running sbc-bench
> > [1], and even though I observe dynamically varying CPU frequencies
> > after boot with schedutil governor, once sbc-bench switches the
> > governor to "performance" and goes through the OPPs in descending
> > frequency order, the CPUs seem to get stuck at the last applied low
> > frequency. Even after max frequency gets reverted from 408 MHz to
> > something higher, even after I switch the governor to something else -
> > no matter what. Only a reboot gets the higher frequencies 'unstuck'
> > for me.
> >
> > These are all observed at around 55C SoC temperature, so throttling is
> > not an issue. Regulators are stuck at 950000 uV - way above 700000 uV
> > that the 408 MHz OPP requires (and power readings seem to match: I'm
> > getting about 2.3W consumption at 408 MHz in idle vs. normal idle
> > reading of 1.4W at around 1 GHz).
> >
> > Not sure what's going on here, and I don't remember seeing anything
> > similar on RK3588. Thoughts welcome.
>
> This may once again be a "accidentally uses wrong clock IDs" type
> situation. The other possibility is that we're getting confused
> between what we think the clock rate is and what SCMI actually set
> the clock rate to.
>
> Things to check is whether the right clock controller (scmi vs cru)
> and the right clock id (check ATF source for this) is used.

Clock IDs in the kernel seem to match those in ATF, but I've noticed
what appears to be a buffer overflow in some of the SCMI clock names
defined in the opensource TF-A (thanks GCC 15 and its zealous
warnings):

alchark@alchark-surface ~/trusted-firmware-a $ make
CC=3Daarch64-unknown-linux-gnu-gcc PLAT=3Drk3576 -j12
Building rk3576
  CC      plat/rockchip/rk3576/scmi/rk3576_clk.c
plat/rockchip/rk3576/scmi/rk3576_clk.c:1102:154: error:
initializer-string for array of =E2=80=98char=E2=80=99 truncates NUL termin=
ator but
destination lacks =E2=80=98nonstring=E2=80=99 attribute (17 chars into 16 a=
vailable)
[-Werror=3Dunterminated-string-initialization]
 1102 | stimer0_root, p_100m_24m, clk_stimer0_root_info,
&clk_scmi_ops_com_critical, rk3576_common_rates, false, true);
      |
                                              ^
plat/rockchip/rk3576/scmi/rk3576_clk.c:246:18: note: in definition of
macro =E2=80=98RK3576_SCMI_CLOCK_COM=E2=80=99
  246 |         .name =3D #_name,
         \
      |                  ^~~~~
plat/rockchip/rk3576/scmi/rk3576_clk.c:1103:154: error:
initializer-string for array of =E2=80=98char=E2=80=99 truncates NUL termin=
ator but
destination lacks =E2=80=98nonstring=E2=80=99 attribute (17 chars into 16 a=
vailable)
[-Werror=3Dunterminated-string-initialization]
 1103 | stimer1_root, p_100m_24m, clk_stimer1_root_info,
&clk_scmi_ops_com_critical, rk3576_common_rates, false, true);
      |
                                              ^
plat/rockchip/rk3576/scmi/rk3576_clk.c:246:18: note: in definition of
macro =E2=80=98RK3576_SCMI_CLOCK_COM=E2=80=99
  246 |         .name =3D #_name,
         \
      |                  ^~~~~
plat/rockchip/rk3576/scmi/rk3576_clk.c:1107:155: error:
initializer-string for array of =E2=80=98char=E2=80=99 truncates NUL termin=
ator but
destination lacks =E2=80=98nonstring=E2=80=99 attribute (17 chars into 16 a=
vailable)
[-Werror=3Dunterminated-string-initialization]
 1107 | ka_crypto_s, p_350m_175m_116m_24m, clk_pka_crypto_s_info,
&clk_scmi_ops_com, rk3576_common_rates, false, true);
      |
                                              ^
plat/rockchip/rk3576/scmi/rk3576_clk.c:246:18: note: in definition of
macro =E2=80=98RK3576_SCMI_CLOCK_COM=E2=80=99
  246 |         .name =3D #_name,
         \
      |                  ^~~~~
cc1: all warnings being treated as errors
make: *** [Makefile:1644:
/home/alchark/trusted-firmware-a/build/rk3576/release/bl31/rk3576_clk.o]
Error 1

And indeed, clock names such as "clk_stimer0_root" don't leave enough
space in .name for the null terminator (given that .name is defined as
char name[SCMI_CLOCK_NAME_LENGTH_MAX]; a.k.a. 16).

Not sure if the binary BL31 has a similar issue and if it can lead to
the observed weirdness in CPU frequency switching. Looping in XiaoDong
Huang who last touched those lines in the opensource TF-A - any
insights would be much appreciated!

Thanks a lot,
Alexey
