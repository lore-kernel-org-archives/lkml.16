Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B096295DA6;
	Wed, 18 Jun 2025 13:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750254722; cv=none; b=BfI9wnqMpnMTcoTr3WZr2430YuZtOs5CJ6Et1XgpeDLuY9hCM3BqEYWJfG0Bn8rv+/Vh4sFeLQ2MVEHyS0D3IafHXniebSGuzrKwRSCmCiITmBOsQZX9gmUGeoPylM7Kfw6cTqo/EM4HTTXwbvK00rYpYgz6k2oHvvhod0bXa7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750254722; c=relaxed/simple;
	bh=D7Ir/SoPZy5G5UFUiYJ3uQV6HZ/DJSBvw64XWpe6uaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gTw0Dpf+5fU7dSMbI9NkQREY2FTK5WM39uOF/N105aFgnro1AzrURhaiJHQV9XFEh8xvXUVgV0Y72rvDMk7AaL1T0WllH6O1sltrWM1s3IGX4xPO0fiMkFKf5ena/+WZ6jxWfeRHCVasozSi/HTvLqEEHc6Kg3hdVHv7+mFB9PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/5OGyiQ; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/5OGyiQ"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4a5a196f057so149180261cf.3;
        Wed, 18 Jun 2025 06:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750254716; x=1750859516; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8krqiHD4H6SdO/c1xN2g7T+0SS16eUWDEAWw9hScjck=;
        b=B/5OGyiQHWF9ACwVEhWXDlNE6dlpVYyZHp7y3YhvCblrHtsHnSKI6zRFcZj3AVqCUz
         guVq9ECKcgKTotwS2Z+zjARWeRksIwf/vwhIj0HvSZRoP34zzubok6y7uOPhWTU/5El1
         EVM8gJPl5D3zARz1i2QSAbIawQWga4OmADc3yJT6zyzmq6bfRNTbWcQCI/zLv5f+o3sq
         djZGt+cN/uvnXjY9eg+M0/v3NYgQYgdMqTLCZU5HZHgopXlbrqXusCw9C3tssvsaR+Ei
         Uq9zMJFuTmb7CQ3GLYgF0L7d0tgIVskWGZHzfoJm/WIo0WxQnAlEO7IzlG6N6398Gi8A
         JgEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750254716; x=1750859516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8krqiHD4H6SdO/c1xN2g7T+0SS16eUWDEAWw9hScjck=;
        b=d8RLhz3bGC8OBgK2tuUHn+SDZn0fykG8M5lThv/6gJC6PjFT+nZhGHGVPO4rJLVLzu
         cjYCIoRop+AzJsfv5mwXLxT8bdMvdco8PjE30++4BSL29Sawe5RDlTFaILaPK3+xQ6Yf
         8v1bKQSFXy3W3QftiB98aOn9kvpFfRI/CpaO6t+Si0Ka8oaBNjOizoybhx3oXYl4giQ/
         0FTUwEo5A8Y1rPdjkcWIC0w1/6/tHxeXyl0SdlFjKLr7bFywZcdkMTY33HIzrZrveC2O
         EOFUz6SohLIfhVfwES/81HFClh8tGY1LOvC6MY0mPR3v+XzaaBPKSQ09ewkNYFnxtL7T
         F2uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx7HNDCTLP7gwY0/a01lzd8ByLvcLagZmK/E0Q9CuLFuS/d25fI6lH4qvNg08PsT6m+n1MsRQBNP9ncpwU@vger.kernel.org, AJvYcCX34jDvurYoeJuZ1HPftlkszEd7o0ZeZoVkj5Po6O5Cea4q+r6oEEdgWd107Z0QFFS0hT028gnrjHQf@vger.kernel.org
X-Gm-Message-State: AOJu0YzVhBb8596y0/SVGipJQiUal35BctR99gSs2PP/+h2Bb7U/Ga3F
	Wqaby1yzBe2Bxok4mwycRf37reuDigGl6886z6FwGXjyV7DY+OIef2e5FaMPYdJ/hVaRjCf/ErX
	OfEPaJJE+0RsY/2P0uhz3BYtViyOMSW8=
X-Gm-Gg: ASbGncuMPGbwougdvx3Lxu7BwX9CfHiqYkev1KhWixRAUlcRcKuliC9w5FNAP5G+TG4
	z5b2ZniSpyWF2Mh7Eus3CG7fAiAiMHk8LDb8kBC46xIj6EKJLiUlQ8iqaD/tYnr4OXtfhxlyku0
	wQVB7oe4CAdjOhvUlso2xae+Q1DY5JojJKTHB2gri3twx6
X-Google-Smtp-Source: AGHT+IFjLbj9BEdwTMYyliD/R38NY95P1fawYFekYrWxlx0+R36xCe+ioWLBLqW6E3ETOu7kqPcQGiL5wE4zGwh2p+0=
X-Received: by 2002:ac8:7d56:0:b0:4a7:189a:7580 with SMTP id
 d75a77b69052e-4a73c596fddmr239579821cf.26.1750254716255; Wed, 18 Jun 2025
 06:51:56 -0700 (PDT)
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
Date: Wed, 18 Jun 2025 17:51:45 +0400
X-Gm-Features: AX0GCFvqMvYkd-RNYAsYCTEDXbFxfEzQX2sHnuaUv1aDcfcEAiv314iSEAb7Qg8
Message-ID: <CABjd4YyVJv0NmF9LsGWQ-O44MGjT5=FFeUjbg5rJ6XkNgjxb+g@mail.gmail.com>
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

There is indeed something weird going on. I've tried running sbc-bench
[1], and even though I observe dynamically varying CPU frequencies
after boot with schedutil governor, once sbc-bench switches the
governor to "performance" and goes through the OPPs in descending
frequency order, the CPUs seem to get stuck at the last applied low
frequency. Even after max frequency gets reverted from 408 MHz to
something higher, even after I switch the governor to something else -
no matter what. Only a reboot gets the higher frequencies 'unstuck'
for me.

These are all observed at around 55C SoC temperature, so throttling is
not an issue. Regulators are stuck at 950000 uV - way above 700000 uV
that the 408 MHz OPP requires (and power readings seem to match: I'm
getting about 2.3W consumption at 408 MHz in idle vs. normal idle
reading of 1.4W at around 1 GHz).

Not sure what's going on here, and I don't remember seeing anything
similar on RK3588. Thoughts welcome.

Best regards,
Alexey

[1] https://github.com/ThomasKaiser/sbc-bench
