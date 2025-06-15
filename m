Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3F127A46A;
	Sun, 15 Jun 2025 16:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750003211; cv=none; b=U4lo0ou5IOcZkeGYTux/yqoLmDEQGqZ8WN5MLrtgdjzR9CencPZMYeYMvA9kQcPS/d150bcFokSJH6WSjutzgN2vU/lShVkJB9Lui15nK9miK+u6kF9q2y0yo2l+N8E0uHDBJ77zLYCrVkHDMSayXYrch+H1bphMiSGvkVuaBeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750003211; c=relaxed/simple;
	bh=dXqb/D7Oksel9lkH3rc275tYS/80IwotwQOrfUUl6Bc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=COB50sH3eQd+EM9+WUHxOqljLB86DQMDrD0v7X+OrQSi9nwO8dY8A6wkORRee4q+pIskW/FL0LJtZ/G//tpYWLdVIeHgzGEQdc4CW4LrpzegmKKzhbuuxtXGY7kSNB8A7qRNDIMRxuSLXM8TCjv6KFJj6VC0em8jmquYayxnGsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dlHaBlAB; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dlHaBlAB"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-adfb562266cso149181166b.0;
        Sun, 15 Jun 2025 09:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750003206; x=1750608006; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/42QMcL77lI71D+Z1SeldcA7X3YrhfS5BoiK/HqtWsg=;
        b=dlHaBlABVLWLMvbUxolnjV358NyZZ1PV36v2OJGdIqM7qpus+prWu5K67UYpkGrQdA
         aXAY8dPxlc693cOP8Qwu2U/hu6mupCcab7k1ZkW6Hpgp5pwLE3bBiNLqmbVliwi+KRJe
         1VPqqLJQ9I3b3AA/xIZBX/W0Er533/UbgrLnXJjQnKUyhUingfrFr0VrUieZd4YH0Ojd
         yrTtsh09PJ3QzEu9hZK4dj8j6sZpOYEynTE84ir1d7QW1gk56Dr1A1xfa/4pun4oO6t0
         XNcIMtwzJi60hmnnt6aWlt38E7kWp/tiCyxxn5SehLnVKVdCcdA4GmAsn4KJh57BLG4j
         hP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750003206; x=1750608006;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/42QMcL77lI71D+Z1SeldcA7X3YrhfS5BoiK/HqtWsg=;
        b=Qe+frgX0qkZsvbuHPMPeON4PALiR3CZd7BP9hp1huG0zea/Zcw367Eer9YxA2GRLb2
         ncGtUm7Z9cXY9mXUnGFTuRs2/0dB7FZd2z60jT9u3v70TsqHywNoq57i/uSXtJ7ktOXz
         aP/s1D4DhL747crpq2U7joAqVdckdwi8LSPi3c8EWD0YDD1/i88y6IaRXxFgO09+sEdD
         c7B7c7bRDlWcuex56Tb4iAM1hvZKxgfOiX6wV+vPpv8zD7SfAMePF8H9n68UbX40+My7
         wnvb4hezgsRNGO/R/gRHnxRtOA2n6g8pQk8R6QJ+GP3MYl2fZ8f1yFVIpE/up35asyAZ
         Usqw==
X-Forwarded-Encrypted: i=1; AJvYcCUoEaGpNjmtsZHU5Ny5xkF9bGVE75rATbPtZA/6gWF7i0hIXlDyt2wgHfUZs292lUOqFv9pNijuPDwS@vger.kernel.org, AJvYcCXVJnZLtuDXKJ11wxNnzgjPmzNEC3O3xGqPDNTM/DrER6UKQeNxxshUvQiwg6/tnIz7D/cXfv8TrkoDdMKM@vger.kernel.org
X-Gm-Message-State: AOJu0YxzBfFXEGK/Uaam+EJ/gMiZwCdaYfupKHQFcDyBrzakd+ytfjGO
	1jMQjrswy07W46Aj4KyV8TUnFoSc44xsmfZkVPba4LxhmC5PRlA1fBFe
X-Gm-Gg: ASbGncvgNbiq7olYthjypf6mOBvJsSu1cpBpJ0cLTD40k82lFbpjzeNF2vJURElPkl+
	1+QhpIqhy3NQEn7Rc4ig3bQLomK8cbftYyuh6oDICumrmKpYQmmbEBqb0KoZkNL6zFxlHC03gTc
	PZ6KICAG24U3snv+N0VKcjXI3MQaMJTu1KaPOQOgG/1N3FYkmVSvv3iYZLpIm51x360gHtoj4e5
	UCr4SmS+wA0xO9fsmN921Mi1GuKl+9pk0BuyXx8Toe91eKnXHB6+uSvffCzYmUqrtKm0UH/AeGl
	IBCqZSiZRbjS9UZMrczeOqzJoCihavV3Cw9ZH0R54MZC4xL2QwH1SHSoUoTnlgvhqI0v9UBB4vg
	lin075scwBQ==
X-Google-Smtp-Source: AGHT+IHpsM22I+XbsRa2AQVigP0aFeEOrTL+GwdNlPuSMf2S91xq+3A6gFHO3jgYBg2+RbyfLoc5HA==
X-Received: by 2002:a17:907:fd18:b0:add:fa4e:8a7e with SMTP id a640c23a62f3a-adfad4104cemr513285866b.32.1750003206157;
        Sun, 15 Jun 2025 09:00:06 -0700 (PDT)
Received: from smtpclient.apple ([89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81b8a3fsm501587166b.38.2025.06.15.09.00.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Jun 2025 09:00:05 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM
 Sige5
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <CABjd4Yw3FyVS0MBk2WdWKb24vkqrb09Tx3tj6B-xsmG1-Csk7w@mail.gmail.com>
Date: Sun, 15 Jun 2025 17:59:54 +0200
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <80ACAAAE-F522-4199-9048-ADE69F6E1128@gmail.com>
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <20250603-sige5-updates-v1-1-717e8ce4ab77@gmail.com>
 <6656934.DvuYhMxLoT@workhorse>
 <CABjd4Yx05SCm+03jWbsEP-A5AuhL14wLj=+VdKyQgqMbnxi3xQ@mail.gmail.com>
 <512E950E-E8CB-443B-8E47-79F073D217E8@gmail.com>
 <CABjd4YxGQP=rH15EX12w36b7+82Dedf+rVH3v5V6gBwNv3V3iw@mail.gmail.com>
 <90218D7B-0CF5-4F5D-969A-909A44E6044F@gmail.com>
 <CABjd4Yw3FyVS0MBk2WdWKb24vkqrb09Tx3tj6B-xsmG1-Csk7w@mail.gmail.com>
To: Alexey Charkov <alchark@gmail.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)



> Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gmail.com> =
w dniu 9 cze 2025, o godz. 16:05:
>=20
> On Sun, Jun 8, 2025 at 11:24=E2=80=AFAM Piotr Oniszczuk
> <piotr.oniszczuk@gmail.com> wrote:
>>> Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov =
<alchark@gmail.com> w dniu 5 cze 2025, o godz. 15:42:
>>>> Alexey,
>>>> I see you are using rk3576 board like me (nanopi-m5)
>>>> Have you on your board correctly working cpu dvfs?
>>>> I mean: [1][desired clocks reported by kernel sysfs are in pair =
with [2[]cur clocks?
>>>> In my case i see mine cpu lives totally on it=E2=80=99s own with =
dvfs:
>>>=20
>>> Hi Piotr,
>>>=20
>>> I haven't tried to validate actual running frequencies vs. requested
>>> frequencies, but subjective performance and power consumption seem =
to
>>> be in line with what I expect.
>>=20
>> well - my subjective l&f is that  - currently - my rk3576 seems =
=E2=80=9Eslower" than i.e. 4xA53 h618.
>=20
> In my experience, native compilation of GCC 14 using 8 threads on
> RK3576 (mainline with passive cooling and throttling enabled): 2 hours
> 6 minutes, on RK3588 (mainline with passive cooling via Radxa Rock 5B
> case and throttling enabled but never kicking in): 1 hour 10 minutes

by curiosity i looked randomly on 3576 vs 3588:
multithread passmark: 3675 =
(https://www.cpubenchmark.net/cpu.php?cpu=3DRockchip+RK3576&id=3D6213)
multithread passmark: 4530 =
(https://www.cpubenchmark.net/cpu.php?cpu=3DRockchip+RK3588&id=3D4906)

assuming 3588 as baseline, 3576 is approx 20% slower on multithread =
passmark (has ~0,8 comp power of 3588)
70 min compile on 3588 should take something like ~86min on 3576.
In your case 126min compile on 3576 shows 3576 offers 0,55 comp power of =
3588.
Roughly 3576 should do this task in 40min less than you currently see i =
think
=20

> Can't see how u-boot would affect CPU speed in Linux, as long as you
> use comparable ATF images. Do you use the same kernel and dtb in all
> these cases? Also, what's your thermal setup?

yes. in all cases only change was: uboot & atf
thermal is based on recent collabora series (+ recent pooling fix for =
clocks return from throttling)=20

>=20
>=20
> Not sure UX is a particularly good measure of CPU performance, as long
> as you've got a properly accelerated DRM graphics pipeline. More
> likely 2D/3D and memory.

indeed.
For quantified look i=E2=80=99m looking on v.simple approach to estimate =
real clock is http://uob-hpc.github.io/2017/11/22/arm-clock-freq.html
by curiosity i looked what it reports on a53/a55/a72/a76 and it is =
surprisingly accurate :-)
on mine 3576 with collabora uboot+mainline atf is hows 800MHz (and in =
perf. gov it seems to be constant)

>=20
> There might be some difference in how PVTPLL behaves on RK3576 vs.
> RK3588. But frankly first I would check if you are using comparable
> ATF implementations (e.g. upstream TF-A in both cases), kernels and
> thermal environment :)
=20
all tests: the same 6.15.2 mainline + some collabora patches

diffs were:=20
1.collabora uboot[1] + mainline atf 2.13
2.collabora uboot[1] + rockchip rkbin bl31 blob
3.vendor uboot (bin dump from friendlyelec ubuntu image)  =20

on 1/2 i see kind of issue with clock values (i.e. perf gov gives =
constant 800MHz on mainline atf).
3 seems to perform better - (i.e. perf gov gives constant 1500MHz so all =
is snappier/faster)=20

as pvtpll is trying to reach target freq and ends with stable oper. freq =
for given cpu_vdd/temp/fab.cut - possible theory is: if cpu_vdd is =
wrongly driven, pvtpll programmed freq will way diff from req. (i.e. way =
too low).
monitoring vdd_big/vdd_lit shows constant 950mv for perf.gov (read from =
sysfs; not verified with multimeter as i don=E2=80=99t have pcb pdf with =
components layout so can=E2=80=99t identify i.e. vdd_big filtering caps =
c1007/c1008 to measure)

(.dxf file provided by friendlyelec [1] seems to be lacking comp. =
numbering) =20

[1]: =
https://wiki.friendlyelec.com/wiki/images/e/e1/NanoPi_M5_2411_DXF.zip

