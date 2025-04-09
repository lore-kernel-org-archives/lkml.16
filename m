Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859F2250EC;
	Wed,  9 Apr 2025 15:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744211565; cv=none; b=o4MCXBdLU+AlLuyUXC5yNFaXAysY5o4w1tguCVgGnHPFD464e9gGUsiaEW/bhn558Vb0Wu7EG+3fx00ZSnyPY+dIAeI6zDw0JMay7LaSuV2gVvGSvsHOfve4EGhAPfYKGCB2PFiOykQyTe7pE6A3hpwToySdNalmX/mVP89ILMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744211565; c=relaxed/simple;
	bh=9140GaBgy6fgn/QI0/uafqxMKXjHWrEbDczt/LhuP1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u90sZhNnLZsZuea6wO2wUt5HtRyzBegapqZDNzIfUS42AFrEZEeajmsbTKvCyUZdwk6UD+iIjAUa52u9xCar8XjBxsAgA/Rm5XlXzp3vHB4GgyPZtq4T4mkLYDLgp4OdTZuYnTU957WQGr4OwIEmf8wwm+EerGurm1f5HALA3EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jYDdJ7MF; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYDdJ7MF"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e6deb3eb7dbso5696911276.0;
        Wed, 09 Apr 2025 08:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744211562; x=1744816362; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3t5xZS49XjT5IHZqDdWvkf/l+hWK8lS0z1Xx2S6w7M=;
        b=jYDdJ7MFtwOZ2z7qdHtvoLabAgYseclf3xAxtw11CpTjC8W80W42Nm87rGBOPx9uDW
         FE8iodRtsQS2AIJ47WBL+MyIiMYq4mgtg5Fmy768ncLh6ERIKbh4Lug7KHaVKwPCav48
         N0v25rnLqfI8Ks+73TCSb6qLJDV9aHdII89qey3RyZjJaKGeH2TzQ7eE9ItjUlCLToKq
         xTNv6uGah2Fix9dKf7/c0INUx9oGlKmUOVniokEmE9sjltZDxDYdbysrDfJ5KWGrun3P
         kvnVXLy6BcdbJ1oxxL17vYWTCrOxRrS2ksRYfySlxaNDCDe6ReHIQOooh9hP4KRrBG1j
         JZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744211562; x=1744816362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3t5xZS49XjT5IHZqDdWvkf/l+hWK8lS0z1Xx2S6w7M=;
        b=MXb4CrFiSZJRUMoq/iqUOVqKeEGE7Js3AUJZXpCZJpXiMTUfO2HtNGkcb1Y3D3qKRU
         5xBwjoJopwDhvw7+dNxvAWnlJG7z0RXWldHqTD8jFko3WsgO0UvYFfpsDV8IMcvXVK1M
         QdywnbQRKpKotUnuxEos8ZLRkmsLPVOVEW8hb+Gq6b1SsgF9V8eSKqUTMhsnabKfLZ+l
         iwCy7NfRENb1eUEn1l/JapHP2YKMowcM8z9/JIGxdAKMtZrNhx1GdfK+Rz2GEqOX65h5
         ZwbSiiC6MqeO2+bGxaLfX3Ng0CFSQlvnbqeZsirqHyfuYmtbS+f8PHZcRD1fbPAru9I3
         xb4A==
X-Forwarded-Encrypted: i=1; AJvYcCU5iEYeRxas3a5LOUMnbG/5AuBuHDt11mUlLL33WeYxUH0kQRsARKOOsnTvxTnDpsbG7Yf/6URupryAHsC6@vger.kernel.org, AJvYcCUDcK5SnogB2sLkb5FmF1aXWGns1gRAGIqD/RwPmF7+vSL2fguAw+EUjCCXhJx12NGx2pKyDDGlNnLt@vger.kernel.org
X-Gm-Message-State: AOJu0YxO9PkSqfQ+xu5seULa0ZHeRqTH/up0B3eb1lNDu360AaRCwS/k
	LkUgF8sIH74kav7FVro6j2GANOp0YQIiFmvWjmBB4oeX+jWmbGdb9fvTdM3nZqSJTqsXEOM4JRZ
	HhqEVvsv/iOx1EeMEwYaoZHZg3QegEYSw
X-Gm-Gg: ASbGnctAHNltKF5Fsaiw9gqLx7FZ1A/BHZ7QZ/7jHRNvhwCgvNGBrMXyNhGhzkhFqzZ
	hIC3Tx93kdbCIIVmyMtaLF2IKHJ+Oitb7uZLSpkBwImcRSIfJe6BsDYSwvZtw3JLIu+Oyp+GXeu
	OjJ22euoK9ut8igIh4PRxCbLk=
X-Google-Smtp-Source: AGHT+IEtbvGJrrFXv25Gz57HIgc1gLvZRGhMj8AoGDVCzx3Fj69chrAsSUhsTsd9FbtyZvKBVg6n7dOfUO6WzMaeVGQ=
X-Received: by 2002:a05:6902:490a:b0:e6d:f3ca:3e0b with SMTP id
 3f1490d57ef6-e702eefaa45mr5087126276.5.1744211562312; Wed, 09 Apr 2025
 08:12:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408231823.826163-1-robertcnelson@gmail.com>
 <20250408231823.826163-2-robertcnelson@gmail.com> <CAOCHtYhFKO=LRN8qp-w+rkTGKJ8t-LnqgqbQW9P6CO3=EeuufA@mail.gmail.com>
 <20250409130918.d3cyzv3to65oktv2@vision>
In-Reply-To: <20250409130918.d3cyzv3to65oktv2@vision>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Wed, 9 Apr 2025 10:12:14 -0500
X-Gm-Features: ATxdqUEC0KlsZO8TP_kymKqCuyolVUFgP7e-PUwC17eiA6gRnsKRAKv1w5DZHMo
Message-ID: <CAOCHtYgpkBXZmZEDz6gUCO2x+WGA_paKHFHS-Br=ypo+AFrBmw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: ti: Add k3-am62-pocketbeagle2
To: Nishanth Menon <nm@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Andrew Davis <afd@ti.com>, Roger Quadros <rogerq@kernel.org>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Judith Mendez <jm@ti.com>, Andrei Aldea <a-aldea@ti.com>, 
	Dhruva Gole <d-gole@ti.com>, Jason Kridner <jkridner@beagleboard.org>, 
	Deepak Khatri <lorforlinux@beagleboard.org>, Ayush Singh <ayush@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 8:09=E2=80=AFAM Nishanth Menon <nm@ti.com> wrote:
>
> On 18:19-20250408, Robert Nelson wrote:
> > On Tue, Apr 8, 2025 at 6:18=E2=80=AFPM Robert Nelson <robertcnelson@gma=
il.com> wrote:
> > >
> > > BeagleBoard.org PocketBeagle 2 is an upgraded version of the popular
> > > PocketBeagle.  It is based on Texas Instruments AM6232 or AM6254 SoC.
> > > Its dual or quad A53 cores can provide higher performance than classi=
c
> > > PocketBeagle. The new design comes with pre-soldered headers, a 3-pin
> > > JST-SH 1.00mm UART debug port, a USB-C port, Texas Instruments
> > > MSPM0L1105 Cortex-M0+ MCU for ADC, 512MB RAM, and a LiPo Battery char=
ger.
> > >
> > > https://www.beagleboard.org/boards/pocketbeagle-2
> > > https://openbeagle.org/pocketbeagle/pocketbeagle-2
> >
> > dmesg:
> >
> > https://gist.github.com/RobertCNelson/c68c96a8a1dc6e4d39d8c48fc13ca1c1
> >
>
>
>
> Any idea why we are crashing?
> https://gist.github.com/RobertCNelson/c68c96a8a1dc6e4d39d8c48fc13ca1c1#fi=
le-gistfile1-txt-L311
>
> I don't see the same crash in beagleplay:
> https://gist.github.com/nmenon/5709a8714d3ab31cac5c00b515d04752

On 6.14.x i have a little more, info...

I've got all the CRYPTO stuff enabled, pretty sure that comes from
CONFIG_CRYPTO_MANAGER

CONFIG_CRYPTO_MANAGER=3Dy
CONFIG_CRYPTO_MANAGER2=3Dy
CONFIG_CRYPTO_USER=3Dy
# CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
# CONFIG_CRYPTO_MANAGER_EXTRA_TESTS is not set

https://openbeagle.org/RobertCNelson/arm64-multiplatform/-/blob/v6.15.x-arm=
64-k3/patches/defconfig?ref_type=3Dheads#L9578

[    2.940076] alg: aead: authenc(hmac(sha256),cbc(aes))-sa2ul
encryption test failed (wrong result) on test vector 0, cfg=3D"uneven
misaligned splits, may sleep"
[    2.940183] alg: self-tests for authenc(hmac(sha256),cbc(aes))
using authenc(hmac(sha256),cbc(aes))-sa2ul failed (rc=3D-22)
[    2.940191] ------------[ cut here ]------------
[    2.940194] alg: self-tests for authenc(hmac(sha256),cbc(aes))
using authenc(hmac(sha256),cbc(aes))-sa2ul failed (rc=3D-22)
[    2.940276] WARNING: CPU: 1 PID: 207 at crypto/testmgr.c:6026
alg_test+0x4f8/0x610
[    2.940303] Modules linked in:
[    2.940317] CPU: 1 UID: 0 PID: 207 Comm: cryptomgr_test Not tainted
6.14.0-arm64-k3-r10 #1bookworm
[    2.940328] Hardware name: BeagleBoard.org PocketBeagle2 (DT)
[    2.940334] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[    2.940343] pc : alg_test+0x4f8/0x610
[    2.940351] lr : alg_test+0x4f8/0x610
[    2.940359] sp : ffff800083e13d10
[    2.940363] x29: ffff800083e13d10 x28: 000000000000000e x27: 00000000000=
0000d
[    2.940375] x26: 0000000000000000 x25: ffff80008151ce08 x24: ffff8000826=
25e40
[    2.940386] x23: 000000000000000e x22: 0000000000001183 x21: ffff000004e=
37880
[    2.940397] x20: ffff000004e37800 x19: 000000000000000d x18: 00000000fff=
ffffe
[    2.940408] x17: 636e656874756120 x16: 676e697375202929 x15: ffff800083e=
13900
[    2.940419] x14: 0000000000000000 x13: ffff8000825c3ad2 x12: 65742d666c6=
57320
[    2.940430] x11: 0000000000000001 x10: 0000000000000029 x9 : ffff8000801=
4d9e4
[    2.940441] x8 : 0000000000000029 x7 : 0000000000000002 x6 : 00000000000=
00029
[    2.940452] x5 : ffff00001da6c508 x4 : 0000000000000000 x3 : 00000000000=
00027
[    2.940462] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000004e=
e4a00
[    2.940475] Call trace:
[    2.940480]  alg_test+0x4f8/0x610 (P)
[    2.940492]  cryptomgr_test+0x2c/0x50
[    2.940502]  kthread+0x138/0x220
[    2.940518]  ret_from_fork+0x10/0x20
[    2.940531] ---[ end trace 0000000000000000 ]---

Maybe enable iwd support will trigger it, as iwd needs built-in kernel
support: https://git.kernel.org/pub/scm/network/wireless/iwd.git/

#iwd
./scripts/config --enable CONFIG_CRYPTO_USER_API_SKCIPHER
./scripts/config --enable CONFIG_CRYPTO_USER_API_HASH
./scripts/config --enable CONFIG_CRYPTO_HMAC
./scripts/config --enable CONFIG_CRYPTO_CMAC
./scripts/config --enable CONFIG_CRYPTO_MD4
./scripts/config --enable CONFIG_CRYPTO_MD5
./scripts/config --enable CONFIG_CRYPTO_SHA256
./scripts/config --enable CONFIG_CRYPTO_SHA512
./scripts/config --enable CONFIG_CRYPTO_AES
./scripts/config --enable CONFIG_CRYPTO_ECB
./scripts/config --enable CONFIG_CRYPTO_DES
./scripts/config --enable CONFIG_CRYPTO_CBC
./scripts/config --enable CONFIG_KEY_DH_OPERATIONS

Regards,

--=20
Robert Nelson
https://rcn-ee.com/
