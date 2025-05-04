Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0882470838;
	Sun,  4 May 2025 08:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746346103; cv=none; b=iq0Q4JQVHXT1aVSd0zISS6jcEdUP0SyinxyseNVHuCxAh5UinTF53FynhUwRYLtJr5VUmzoTyGmoOH+VqbvF9z+Ya559z1T7a5EZkkb477ugSRvaWgC+9pcOxiEkYwoF5hFY8WHYnfHjJ4b9fc5AlC9UcELmyNyRKtONcZDXI4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746346103; c=relaxed/simple;
	bh=w7yqJQzhtrCr7oJzbIyngnZxO005T0pYH5OnmXj4nE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OIMvwN2RAibt4zH/r6pQnIdOoytZdTY6e77vaBAJq+3RlLfQn6/NsE8ndoDsEIxdLWp6JdW/ZVXglF6yU9LLsgURwDPO5QZsa93ExmZ/w96SnKATKl7saSuZGHU6+ZgllLb3LJLoZo3Wl7zVg7djpEVKznILNcTX7iKaIl3Hzks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=CBTccOj3; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="CBTccOj3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=mLP3R30hC3fxPu/ombNn8VmQhzKUIdMsoZzomOMeaIc=; b=CBTccOj3ebdyLaZrgxA4aknmOw
	R6+83tJkR8QqIMcWoSaVIyPPMKofb3EaUPoOji0nKrPwRLE2rgXm8S2iSRbv69b0GZ7tKNEYxUbSP
	i+bhJg4/g34NytT+GrHHArCTRAw4EP9lojtdyd0O0/+FH7geg7vhuGVKMqRVYP96wrQfq9rz0LWVz
	UQHalGbPRXHW2ftKJkVtEGXRWMdDId3JgPzboiK8ZpNcTAYcTyKgksZ2tScxbtx0CLXX+nDlW5rbq
	nd3+3aLAdbMOT7zjKdSgf8ZiL6/bAmQ8Wd4Gd7UFVtOR9xBOwCnOtJsQhnD1KuGA6ZYYEza1IRhzO
	PO6pKR5w==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBUOQ-0006Ou-II; Sun, 04 May 2025 10:08:10 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: John Clark <inindev@gmail.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 detlev.casanova@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, John Clark <inindev@gmail.com>,
 sebastian.reichel@collabora.com
Subject:
 Re: [PATCH v1 0/3] Add Luckfox Omni3576 Carrier Board support for RK3576
Date: Sun, 04 May 2025 10:08:09 +0200
Message-ID: <3352030.oiGErgHkdL@diego>
In-Reply-To: <7462454.lOV4Wx5bFT@workhorse>
References:
 <20250502205533.51744-1-inindev@gmail.com> <7462454.lOV4Wx5bFT@workhorse>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

Am Sonntag, 4. Mai 2025, 01:39:56 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Nicolas Frattaroli:
> On Friday, 2 May 2025 22:55:30 Central European Summer Time John Clark wr=
ote:
> > Disabled features:
> > - eMMC: Not populated on the tested board; believed to be functional bu=
t disabled.
> > - HDMI: Disabled due to mainline driver maturity issues (basic 1080p ou=
tput works; audio and 4K untested).
>=20
> that's not a good reason to disable the node, in my eyes. HDMI 2.0 4K out=
put=20
> should work AFAIK, HDMI audio will land with the already posted SAI audio=
=20
> controller patch set. Is there any specific issue like an SoC lock-up you=
 ran=20
> into that is keeping you from enabling it? If so, please do let the maili=
ng list=20
> know.

Also a more general point, Devicetree is supposed to describe the hardware
and both emmc and hdmi do work on a hw-level and have reviewed bindings,
so the node can be enabled and also any functionality improvement should
just affect the kernel driver-side.

And in my testing on the rk3576 firefly, I also got a working 3440x1440
on my display. So not a full 4k, but nearly there :-) .


> - RK3576 USB Type-C OTG stuff: the USB 2 PHY driver needed some changes t=
o make
>   this work. I've yet to send out v2 that reworks the way we detect a typ=
e-C
>   port, but that part of the code is already done. I was basically just l=
etting
>   it stew on my local machine for a bit longer to see if I can figure out=
 why
>   superspeed only works in one cable orientation,

That is probably the same issue, I have on rk3588, the type-c phy not
changing its settings and waiting for the dwc3 to re-start, which it never
does.

See [0], [1] ... but importantly Ond=C5=99ej Jirman's response on why my ap=
proach
is probably wrong [2].

At this time, I don't know when I get around to look at that again, so
if someone wants to give it a try, feel free to :-)


Heiko


[0] https://lore.kernel.org/r/20250225184519.3586926-1-heiko@sntech.de
[1] https://lore.kernel.org/r/20250226103810.3746018-1-heiko@sntech.de
[2] https://lore.kernel.org/r/h57ok2hw6os7bcafqkrqknfvm7hnu25m2oe54qmrsuzdw=
qlos3@m4och2fcdm7s



