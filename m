Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F602E11CB;
	Sun, 15 Jun 2025 16:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750004469; cv=none; b=scIXTp5gkcFTBkz8qusmJ/C7FJSg5/EO1q2Mm1j59C9N9aoa0Fs0c+FBR+tdWTWKlxsPW8/yVWLjhKf5dmJgDGDXBwViiXkbC0HMVkEXQlDCWXd+29QgdVRa0PAob4p0qOmjX1ynssw4yqoxuekuKBf0B6CWGVT6oL+g5tUBcxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750004469; c=relaxed/simple;
	bh=OM0hbEq6+eK/JG/sB9PUzSaWjX0Oh7h8WFOTRbOEx9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ox1g8GviVhIRPcpk703GApghNr5mLyx9Cqb/4j2fHkJB7YvKf4ghilIsJM7kQHy4RXLWnJ3aRjZOAoaHjbfSjhTRvF+oYThdcK1l6KaNbP1wmMwi9NCto2u+uGDv+rYAKU2wdbsVrTfz/wpNAnCPOLncqeDS/NqN6SNx8DwAWUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NYwGWj7u; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYwGWj7u"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a44b3526e6so50525561cf.0;
        Sun, 15 Jun 2025 09:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750004466; x=1750609266; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jp7O6Jg1aWaKvBHu7wKcv8nngRfkIIG/oXFx1uRaGaE=;
        b=NYwGWj7uctN7Z+3m6dp9/4v1ZzYEW9FSKwajGSRNkbv9rzcxsDHwYvF+viLoaLEgLJ
         lJxteDzEjCtJVnR0KZn5AcxvfrrWhee8EFsg/1pYRK7ux5cFCzPuZJExTe4LCFvmBD2p
         iJyW3V9MMSxSxBXbWFACD6Kkgj5BQ994LvkrnnbhCk5gf3yHon3CR433UAMMMza7/MkH
         rmwdgne5fZQfftWFN5rNsyzdvN2mT7LhbAOcyQJCR3x9+EiyPS1bWuXE4GFd8eEZirYx
         qa4hwODfFZxe6zFVDRNbZaGDvXeegexKgSQNNT/h8pjMDgd06LbhYsSOETuXqvb+XY7k
         Bq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750004466; x=1750609266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jp7O6Jg1aWaKvBHu7wKcv8nngRfkIIG/oXFx1uRaGaE=;
        b=oq+NAzXHxgULgGWQxwpotjm4zXtkTOqjp+BP7GAloEvDFpST55wlqp8X/lXYaJNBqi
         +RX386Yz44cLHM5KYTT549bk61dQrL6o/tbt7fZFXPjm4GH7WxJtb/Z7QLwYs/8i45sb
         v5spL+SLMJHDmPHx/9LQnEhgzEHKT7RJLQ6A1NUuYxH1pnIo+p9VnvkxzqNNp2AhNfS9
         mtAi0qURA8hmT4OOkFpvSbuZfTbqHvkwtmQYJIOMUkaZCNZ+5gViCgvFCiOjz8an7OCr
         OpVoX9Xrif1Zu3xt02EQ+glwEwi/hlsKQpYdkQYJfogoGvlJh5hsrqOL3knNnQhmdjsz
         w02A==
X-Forwarded-Encrypted: i=1; AJvYcCU0NmkzPPCerBW1mbXUl/8+SAz/qryjibUddTzVy9hnYC3O2MjFNuyo3IuOhJv8n0RFQ0+3M05Rg8mUPYNa@vger.kernel.org, AJvYcCU0y32uSMHh85DhuFrCHYa4/NKwtnPL9rEjzQyNTKX38t1gT5X+WL7e3rY0gcdEByAc5Ynt7ZjCBdpg@vger.kernel.org
X-Gm-Message-State: AOJu0YzTOfzaVfFSRvB9GL/1yDHCubryya0hrbpZ6NeBI9oJ7gIzGNer
	ThiWdVCKSKCrSpg3+uVDHWR++YguF5Oq5DeavaFTxY9u9Ib+zfCB/HsyACiExJxJ785mfnhL1AO
	bPQj/ll9R6154i+PGmgDUibG1gxsZ87k=
X-Gm-Gg: ASbGncukSRl1jPg0qPy7f/sXHjelvcXtVfbpFOJUyr5J33dRyzHyFG3+Yf0TLyeYVmr
	ZB9yJ0RACIkg0PC+ng1IdzGrVH0BdNWMWQCkjXjZsmwIEmrAfit781FN2mKcdlPadfFFWM1ME9k
	1+DoSO6oFz3JrdvN40wbqO6xjmp2xyi7oaQgWhjogchWKAGA==
X-Google-Smtp-Source: AGHT+IFRUdBeIVHBLIhhVD74OXQUEBtMxUmA3npaAeY29ycZJNVeDhcqL4fcNY3KiRScIs0cAr7oIkSsjX57Jc/4Llk=
X-Received: by 2002:ac8:5cd2:0:b0:494:a148:b487 with SMTP id
 d75a77b69052e-4a73c47e332mr102634071cf.8.1750004466113; Sun, 15 Jun 2025
 09:21:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <20250603-sige5-updates-v1-1-717e8ce4ab77@gmail.com> <6656934.DvuYhMxLoT@workhorse>
 <CABjd4Yx05SCm+03jWbsEP-A5AuhL14wLj=+VdKyQgqMbnxi3xQ@mail.gmail.com>
 <512E950E-E8CB-443B-8E47-79F073D217E8@gmail.com> <CABjd4YxGQP=rH15EX12w36b7+82Dedf+rVH3v5V6gBwNv3V3iw@mail.gmail.com>
 <90218D7B-0CF5-4F5D-969A-909A44E6044F@gmail.com> <CABjd4Yw3FyVS0MBk2WdWKb24vkqrb09Tx3tj6B-xsmG1-Csk7w@mail.gmail.com>
 <80ACAAAE-F522-4199-9048-ADE69F6E1128@gmail.com>
In-Reply-To: <80ACAAAE-F522-4199-9048-ADE69F6E1128@gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Sun, 15 Jun 2025 20:20:54 +0400
X-Gm-Features: AX0GCFvyfycTOtkz4ezDarF-FdHEZqxgkWW-GdCXjuH2q8WwDdHjjRYYdWxH-Gg
Message-ID: <CABjd4YwQrnoeFU5Nm8Vy-=rFW-tfQuzQfYi+B2zmBdj_=Qh6EQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 15, 2025 at 8:00=E2=80=AFPM Piotr Oniszczuk
<piotr.oniszczuk@gmail.com> wrote:
>
>
>
> > Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gmail.com> w=
 dniu 9 cze 2025, o godz. 16:05:
> >
> > On Sun, Jun 8, 2025 at 11:24=E2=80=AFAM Piotr Oniszczuk
> > <piotr.oniszczuk@gmail.com> wrote:
> >>> Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gmail.com>=
 w dniu 5 cze 2025, o godz. 15:42:
> >>>> Alexey,
> >>>> I see you are using rk3576 board like me (nanopi-m5)
> >>>> Have you on your board correctly working cpu dvfs?
> >>>> I mean: [1][desired clocks reported by kernel sysfs are in pair with=
 [2[]cur clocks?
> >>>> In my case i see mine cpu lives totally on it=E2=80=99s own with dvf=
s:
> >>>
> >>> Hi Piotr,
> >>>
> >>> I haven't tried to validate actual running frequencies vs. requested
> >>> frequencies, but subjective performance and power consumption seem to
> >>> be in line with what I expect.
> >>
> >> well - my subjective l&f is that  - currently - my rk3576 seems =E2=80=
=9Eslower" than i.e. 4xA53 h618.
> >
> > In my experience, native compilation of GCC 14 using 8 threads on
> > RK3576 (mainline with passive cooling and throttling enabled): 2 hours
> > 6 minutes, on RK3588 (mainline with passive cooling via Radxa Rock 5B
> > case and throttling enabled but never kicking in): 1 hour 10 minutes
>
> by curiosity i looked randomly on 3576 vs 3588:
> multithread passmark: 3675 (https://www.cpubenchmark.net/cpu.php?cpu=3DRo=
ckchip+RK3576&id=3D6213)
> multithread passmark: 4530 (https://www.cpubenchmark.net/cpu.php?cpu=3DRo=
ckchip+RK3588&id=3D4906)
>
> assuming 3588 as baseline, 3576 is approx 20% slower on multithread passm=
ark (has ~0,8 comp power of 3588)
> 70 min compile on 3588 should take something like ~86min on 3576.
> In your case 126min compile on 3576 shows 3576 offers 0,55 comp power of =
3588.
> Roughly 3576 should do this task in 40min less than you currently see i t=
hink
>
>
> > Can't see how u-boot would affect CPU speed in Linux, as long as you
> > use comparable ATF images. Do you use the same kernel and dtb in all
> > these cases? Also, what's your thermal setup?
>
> yes. in all cases only change was: uboot & atf
> thermal is based on recent collabora series (+ recent pooling fix for clo=
cks return from throttling)
>
> >
> >
> > Not sure UX is a particularly good measure of CPU performance, as long
> > as you've got a properly accelerated DRM graphics pipeline. More
> > likely 2D/3D and memory.
>
> indeed.
> For quantified look i=E2=80=99m looking on v.simple approach to estimate =
real clock is http://uob-hpc.github.io/2017/11/22/arm-clock-freq.html
> by curiosity i looked what it reports on a53/a55/a72/a76 and it is surpri=
singly accurate :-)
> on mine 3576 with collabora uboot+mainline atf is hows 800MHz (and in per=
f. gov it seems to be constant)
>
> >
> > There might be some difference in how PVTPLL behaves on RK3576 vs.
> > RK3588. But frankly first I would check if you are using comparable
> > ATF implementations (e.g. upstream TF-A in both cases), kernels and
> > thermal environment :)
>
> all tests: the same 6.15.2 mainline + some collabora patches
>
> diffs were:
> 1.collabora uboot[1] + mainline atf 2.13
> 2.collabora uboot[1] + rockchip rkbin bl31 blob
> 3.vendor uboot (bin dump from friendlyelec ubuntu image)
>
> on 1/2 i see kind of issue with clock values (i.e. perf gov gives constan=
t 800MHz on mainline atf).
> 3 seems to perform better - (i.e. perf gov gives constant 1500MHz so all =
is snappier/faster)
>
> as pvtpll is trying to reach target freq and ends with stable oper. freq =
for given cpu_vdd/temp/fab.cut - possible theory is: if cpu_vdd is wrongly =
driven, pvtpll programmed freq will way diff from req. (i.e. way too low).

It is an interesting line of thought. After all, RK3576 boards I
looked at use an I2C connected PMIC, while RK3588 use an SPI connected
one. If there is some bug in the I2C bus glue for the PMIC driver,  it
could theoretically report updated voltage without always updating it
properly.

I still believe it succeeds more often than not though, because I
observe measured power consumption of around 5W under full load vs.
around 1.4W in idle (on ArmSoM Sige5). Which doesn't rule out some
transient weirdness.

> monitoring vdd_big/vdd_lit shows constant 950mv for perf.gov (read from s=
ysfs; not verified with multimeter as i don=E2=80=99t have pcb pdf with com=
ponents layout so can=E2=80=99t identify i.e. vdd_big filtering caps c1007/=
c1008 to measure)

Measuring voltages to within 0.1V precision (not just resolution)
sounds like a big ask of a multimeter IMHO :)

Best,
Alexey
