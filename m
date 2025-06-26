Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EEC204592
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750954540; cv=none; b=lByt3wSgXczJ7fFySpwHTExJAgzjxLCQ8g2yLzbGKIithTWE3zSVbBLJVTgH1svYxgdFrW3zbUFK0TN+uOBLiatwmfEBIw/4veHub5ewWQlZQpLcJFudGLnkepbbARxRiBy02q2NegoGpwxoGElWwAdqPOBOlT51Fs6sMORdjoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750954540; c=relaxed/simple;
	bh=o8VQ8+8CJGEHkeDMRr7T3pOyyVTC3U1Lk0WKGSPXzaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=POPyjb8vWVlF9HLVyowX3KRU3hbwbE1nQCbFUhjRzxRk2V7/WtnndvjcaLAjJV5MrVC9SzaMo84uRflGkmkYOyhL3/+e6iy1ZzMsUUAPHeXgz2jAhDeoLAwVLltxg2/n3WQQ6LEfuOR0PPoZkb2YtApznopeUEqW0OwWImJpDU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=O7YvioW2; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="O7YvioW2"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b2ed1bc24fcso165943a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 09:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750954535; x=1751559335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKzLrHYraf6yeSmiUx6vfx+1oVu56Z/cUATG0PrPZP8=;
        b=O7YvioW2iNOu0PBRostmNMPOuGFsFH9bD8S16mC2VLRcF3+qEVosfjCaYlVwZTpBVR
         AAB5SsTSnY/fKIYkwWbgXWkIdPbQD21hDfGkrGmwlAZyqs1WAK/npOqO2NEJOPIA85kZ
         FiUggnAIIDxHCmxLAMd0JvNJpRptXq3J/D0Dk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750954535; x=1751559335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MKzLrHYraf6yeSmiUx6vfx+1oVu56Z/cUATG0PrPZP8=;
        b=KZa7sEN71r/8oqSG9rxHjTMhaBQjZrd8jmMguo6T+qCfaYaYaNSglneyaT5/TG3HPz
         C38ldI05AQTg40Q2k/apPPPpxWuF+701CYsrf/P7Mzt+xKJSuesORLa3kXs6J8clwxvT
         zq7NJzcQV1CdJ6LDIhUMk5aQUmpsXipTnC/ivLF2qto80k0sRfSyaU6hT0vT4OlFBAR1
         AM8SPFHSev5nZ9pWXzvWFzhEcEnLj3g0PWq65eQOPgQnGhsWElMhUmBG+OCMSPHf3xvE
         u5cQOvZmRArqcwqAkvuECSMx73lNllNuTsKABSrWA0w7mGOTw4evAc4V66Hp69WoGaJI
         miPA==
X-Forwarded-Encrypted: i=1; AJvYcCXhvCIgDTYUO9iaFYgZ1MVKTu1C3Y9coEP4RckEkHS5G/1hk5gJagHVbMAPQXMOAxzcRh8hDxgQiHwiT3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVzA/e8rFF+YhbRZX3bFDXLm9VnvD3kjvjiR20f8YZavA2Ox4g
	vspwV4WLnh8rg18B2C5XT1WndxCQQrjdJZ5BxrZ/IrClOfGzvlFAJAUdvSYVBOaHUuPpFLfpvfU
	cloMHntd1fdBoutE3dzuEtcjKOA1AEMnCYq6E+XGz
X-Gm-Gg: ASbGncvFgnIjcfahe68Z7CTOZsrdDoW+5/EyqV1F7IcCpXM8c8tLl6lXeS8yg6brsyi
	LA34asT5OsLb3t857P+U3PQMiDkSyuN8GPyvTduYHhwrOdvg5FqlY3PSGIcgtrMNoPMEck8qlLA
	gXMnrRrJWqWdAqQRiUblYfKS4zM+n08QvqgkndA0KZvEOz
X-Google-Smtp-Source: AGHT+IHAq2BMz5HBsTEaGf9d6XcLKcgsJCBdZZbcKm2hHMv1pLi4nkVLWp8CibBt7DW181Ub9E4IvTlCGVk0ukhDgwg=
X-Received: by 2002:a17:90b:55ce:b0:312:25dd:1c8b with SMTP id
 98e67ed59e1d1-315f25caa86mr4267612a91.2.1750954534911; Thu, 26 Jun 2025
 09:15:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606165756.1531164-1-dregan@broadcom.com> <8734c9z2ye.fsf@bootlin.com>
 <CAA_RMS7EB2v_h44Ysdoe0=WjC+T4G_5_4O-9DbCBE5OyRNArkg@mail.gmail.com> <87h60dmn86.fsf@bootlin.com>
In-Reply-To: <87h60dmn86.fsf@bootlin.com>
From: David Regan <dregan@broadcom.com>
Date: Thu, 26 Jun 2025 09:15:23 -0700
X-Gm-Features: Ac12FXzQOO1LpL16QspufftBMVW-eA3WfxjCnjDrwT5m-7eeC7t9VwEB78sWgS0
Message-ID: <CAA_RMS68+U9KB5YxhqM6T2s-cJLEe9FvqAzFZckyMWYd1q=2YA@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: nand: brcmnand: fix mtd corrected bits stat
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: David Regan <dregan@broadcom.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org, 
	bcm-kernel-feedback-list@broadcom.com, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Kamal Dasu <kamal.dasu@broadcom.com>, 
	Dan Beygelman <dan.beygelman@broadcom.com>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, 
	rafal@milecki.pl, computersforpeace@gmail.com, frieder.schrempf@kontron.de, 
	Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, 
	Boris Brezillon <bbrezillon@kernel.org>, kdasu.kdev@gmail.com, 
	JaimeLiao <jaimeliao.tw@gmail.com>, Adam Borowski <kilobyte@angband.pl>, 
	Jonas Gorski <jonas.gorski@gmail.com>, dgcbueu@gmail.com, dregan@mail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miqu=C3=A8l,

On Wed, Jun 18, 2025 at 2:07=E2=80=AFAM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
> Hello David,
>
...
> Here however there is something wrong. We do expect a read failure,
> instead of returning wrong data. There is still a problem, I do not know
> if this problem was there before though, but this must be fixed.

This was user error as I picked the wrong partition to test. There's a
hardware limitation in which the first ECC chunk in page zero of block
zero is ECC protected however the hardware flag to signify an ECC
problem does not trigger (as can be seen by the result.) This
limitation only affects page 0 of block 0 where it is typically a
bootloader raw partition that is not under the management of the Linux
file system, and in addition we have extra checksum/signature
verification and loader redundancies to account for this limitation.

Here is the result of the nandbiterrs test using a different partition:

# insmod mtd_nandbiterrs.ko dev=3D2
[   30.670312]
[   30.671853] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
[   30.677713] mtd_nandbiterrs: MTD device: 2
[   30.681818] mtd_nandbiterrs: MTD device size 8388608,
eraseblock=3D262144, page=3D4096, oob=3D216
[   30.690175] mtd_nandbiterrs: Device uses 1 subpages of 4096 bytes
[   30.696273] mtd_nandbiterrs: Using page=3D0, offset=3D0, eraseblock=3D0
[   30.703951] mtd_nandbiterrs: incremental biterrors test
[   30.709242] mtd_nandbiterrs: write_page
[   30.713851] mtd_nandbiterrs: rewrite page
[   30.718562] mtd_nandbiterrs: read_page
[   30.722708] mtd_nandbiterrs: verify_page
[   30.726711] mtd_nandbiterrs: Successfully corrected 0 bit errors per sub=
page
[   30.733764] mtd_nandbiterrs: Inserted biterror @ 0/5
[   30.738733] mtd_nandbiterrs: rewrite page
[   30.743443] mtd_nandbiterrs: read_page
[   30.747588] mtd_nandbiterrs: Read reported 1 corrected bit errors
[   30.753686] mtd_nandbiterrs: verify_page
[   30.757688] mtd_nandbiterrs: Successfully corrected 1 bit errors per sub=
page
[   30.764741] mtd_nandbiterrs: Inserted biterror @ 0/2
[   30.769710] mtd_nandbiterrs: rewrite page
[   30.774475] mtd_nandbiterrs: read_page
[   30.778620] mtd_nandbiterrs: Read reported 2 corrected bit errors
[   30.784718] mtd_nandbiterrs: verify_page
[   30.788721] mtd_nandbiterrs: Successfully corrected 2 bit errors per sub=
page
[   30.795773] mtd_nandbiterrs: Inserted biterror @ 0/0
[   30.800743] mtd_nandbiterrs: rewrite page
[   30.805502] mtd_nandbiterrs: read_page
[   30.809647] mtd_nandbiterrs: Read reported 3 corrected bit errors
[   30.815745] mtd_nandbiterrs: verify_page
[   30.819748] mtd_nandbiterrs: Successfully corrected 3 bit errors per sub=
page
[   30.826801] mtd_nandbiterrs: Inserted biterror @ 1/7
[   30.831770] mtd_nandbiterrs: rewrite page
[   30.836480] mtd_nandbiterrs: read_page
[   30.840625] mtd_nandbiterrs: Read reported 4 corrected bit errors
[   30.846723] mtd_nandbiterrs: verify_page
[   30.850725] mtd_nandbiterrs: Successfully corrected 4 bit errors per sub=
page
[   30.857777] mtd_nandbiterrs: Inserted biterror @ 1/5
[   30.862746] mtd_nandbiterrs: rewrite page
[   30.867457] mtd_nandbiterrs: read_page
[   30.871602] mtd_nandbiterrs: Read reported 5 corrected bit errors
[   30.877700] mtd_nandbiterrs: verify_page
[   30.881702] mtd_nandbiterrs: Successfully corrected 5 bit errors per sub=
page
[   30.888754] mtd_nandbiterrs: Inserted biterror @ 1/2
[   30.893722] mtd_nandbiterrs: rewrite page
[   30.898433] mtd_nandbiterrs: read_page
[   30.902581] mtd_nandbiterrs: Read reported 6 corrected bit errors
[   30.908679] mtd_nandbiterrs: verify_page
[   30.912681] mtd_nandbiterrs: Successfully corrected 6 bit errors per sub=
page
[   30.919734] mtd_nandbiterrs: Inserted biterror @ 1/0
[   30.924704] mtd_nandbiterrs: rewrite page
[   30.929412] mtd_nandbiterrs: read_page
[   30.929808] mtd_nandbiterrs: Read reported 7 corrected bit errors
[   30.929810] mtd_nandbiterrs: verify_page
[   30.929887] mtd_nandbiterrs: Successfully corrected 7 bit errors per sub=
page
[   30.929889] mtd_nandbiterrs: Inserted biterror @ 2/6
[   30.929891] mtd_nandbiterrs: rewrite page
[   30.960226] mtd_nandbiterrs: read_page
[   30.964374] mtd_nandbiterrs: Read reported 8 corrected bit errors
[   30.970476] mtd_nandbiterrs: verify_page
[   30.974480] mtd_nandbiterrs: Successfully corrected 8 bit errors per sub=
page
[   30.981533] mtd_nandbiterrs: Inserted biterror @ 2/5
[   30.986528] mtd_nandbiterrs: rewrite page
[   30.991289] mtd_nandbiterrs: read_page
[   30.996228] bcmbca_nand ff801800.nand-controller: uncorrectable
error at 0x1f700000
[   31.003892] mtd_nandbiterrs: error: read failed at 0x0
[   31.009035] mtd_nandbiterrs: After 9 biterrors per subpage, read
reported error -74
[   31.018263] mtd_nandbiterrs: finished successfully.
[   31.023146] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
[   31.051035]
[   31.052530] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
[   31.058369] mtd_nandbiterrs: MTD device: 2
[   31.062475] mtd_nandbiterrs: MTD device size 8388608,
eraseblock=3D262144, page=3D4096, oob=3D216
[   31.070832] mtd_nandbiterrs: Device uses 1 subpages of 4096 bytes
[   31.076931] mtd_nandbiterrs: Using page=3D0, offset=3D0, eraseblock=3D0
[   31.083751] mtd_nandbiterrs: incremental biterrors test
[   31.089041] mtd_nandbiterrs: write_page
[   31.093643] mtd_nandbiterrs: rewrite page
[   31.098354] mtd_nandbiterrs: read_page
[   31.102496] mtd_nandbiterrs: verify_page
[   31.106498] mtd_nandbiterrs: Successfully corrected 0 bit errors per sub=
page
[   31.113549] mtd_nandbiterrs: Inserted biterror @ 0/5
[   31.113552] mtd_nandbiterrs: rewrite page
[   31.114250] mtd_nandbiterrs: read_page
[   31.127333] mtd_nandbiterrs: Read reported 1 corrected bit errors
[   31.133431] mtd_nandbiterrs: verify_page
[   31.137435] mtd_nandbiterrs: Successfully corrected 1 bit errors per sub=
page
[   31.144509] mtd_nandbiterrs: Inserted biterror @ 0/2
[   31.149480] mtd_nandbiterrs: rewrite page
[   31.154240] mtd_nandbiterrs: read_page
[   31.158385] mtd_nandbiterrs: Read reported 2 corrected bit errors
[   31.164483] mtd_nandbiterrs: verify_page
[   31.168486] mtd_nandbiterrs: Successfully corrected 2 bit errors per sub=
page
[   31.175552] mtd_nandbiterrs: Inserted biterror @ 0/0
[   31.180522] mtd_nandbiterrs: rewrite page
[   31.185282] mtd_nandbiterrs: read_page
[   31.189428] mtd_nandbiterrs: Read reported 3 corrected bit errors
[   31.195524] mtd_nandbiterrs: verify_page
[   31.195602] mtd_nandbiterrs: Successfully corrected 3 bit errors per sub=
page
[   31.195604] mtd_nandbiterrs: Inserted biterror @ 1/7
[   31.195606] mtd_nandbiterrs: rewrite page
[   31.196304] mtd_nandbiterrs: read_page
[   31.196696] mtd_nandbiterrs: Read reported 4 corrected bit errors
[   31.196698] mtd_nandbiterrs: verify_page
[   31.196776] mtd_nandbiterrs: Successfully corrected 4 bit errors per sub=
page
[   31.196778] mtd_nandbiterrs: Inserted biterror @ 1/5
[   31.196780] mtd_nandbiterrs: rewrite page
[   31.197477] mtd_nandbiterrs: read_page
[   31.197869] mtd_nandbiterrs: Read reported 5 corrected bit errors
[   31.197871] mtd_nandbiterrs: verify_page
[   31.197948] mtd_nandbiterrs: Successfully corrected 5 bit errors per sub=
page
[   31.197950] mtd_nandbiterrs: Inserted biterror @ 1/2
[   31.197952] mtd_nandbiterrs: rewrite page
[   31.278059] mtd_nandbiterrs: read_page
[   31.282207] mtd_nandbiterrs: Read reported 6 corrected bit errors
[   31.288323] mtd_nandbiterrs: verify_page
[   31.292327] mtd_nandbiterrs: Successfully corrected 6 bit errors per sub=
page
[   31.299380] mtd_nandbiterrs: Inserted biterror @ 1/0
[   31.304349] mtd_nandbiterrs: rewrite page
[   31.309059] mtd_nandbiterrs: read_page
[   31.313207] mtd_nandbiterrs: Read reported 7 corrected bit errors
[   31.319306] mtd_nandbiterrs: verify_page
[   31.323308] mtd_nandbiterrs: Successfully corrected 7 bit errors per sub=
page
[   31.330360] mtd_nandbiterrs: Inserted biterror @ 2/6
[   31.335335] mtd_nandbiterrs: rewrite page
[   31.340045] mtd_nandbiterrs: read_page
[   31.344194] mtd_nandbiterrs: Read reported 8 corrected bit errors
[   31.350291] mtd_nandbiterrs: verify_page
[   31.354294] mtd_nandbiterrs: Successfully corrected 8 bit errors per sub=
page
[   31.361347] mtd_nandbiterrs: Inserted biterror @ 2/5
[   31.366316] mtd_nandbiterrs: rewrite page
[   31.371076] mtd_nandbiterrs: read_page
[   31.376011] bcmbca_nand ff801800.nand-controller: uncorrectable
error at 0x1f700000
[   31.383674] mtd_nandbiterrs: error: read failed at 0x0
[   31.388818] mtd_nandbiterrs: After 9 biterrors per subpage, read
reported error -74
[   31.398046] mtd_nandbiterrs: finished successfully.
[   31.402928] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

> Cheers,
> Miqu=C3=A8l

Thanks!

-Dave
