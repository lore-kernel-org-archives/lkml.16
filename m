Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8B72D5400
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 00:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749602663; cv=none; b=aZw2Ck+1Sul8zCAcX1hlKI3gyQdPZwyP/eEsrvrsFqSd8ue4WgMq8g/RPDRf1mM75SYEb/s4tbT17GWDEVJYA6OLWWZk1wfw2GEfk+pjSUM4VIqWiC0AVIyvKW7ZuW2nG1jiXnIPquRE9scXr1IBDDObcatI9rbTKJvmhvBfwhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749602663; c=relaxed/simple;
	bh=FWFxEAS3V2Wu3ms/v4Xwl9g8YH8SVKfIP4vkKqO4HBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K19LU2hTfkXbaJcb1mIQviYTm6WY/HEAKEGGGxWUaFq/leEkPlJRiMFR0mfPVl8Yng5lzB2wvAIWNfewOqVA09/fuxeCI0e+XvXzeaHIoOFJNiS5QTKMTs/11h7Src8XEnyzvxp4Vcsv54Dnv1/B/9ggx9mHdf9aUDbeknHNSTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=UlKQxqhi; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="UlKQxqhi"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-31308f52248so1989a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 17:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749602660; x=1750207460; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGx/uCHHAtCYCHccXZtNaXi0QffrpIq3Ylrqh+q4S4c=;
        b=UlKQxqhiEoi+cLkWRK6atJcij4ROvogmbj4o6HCWIFFS0NQlQukOd6g/vm77hVqExD
         opv3tNhBWMyn/g51dIG7wb1P8X/dPcKeC37gEYhF1BJS2UwbVTd6HLTvvdqtuu+HZK2a
         d8k3wJXkNfSpa0MzU6QYhKV/fJk4w2p1LrOX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749602660; x=1750207460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGx/uCHHAtCYCHccXZtNaXi0QffrpIq3Ylrqh+q4S4c=;
        b=siNUmwt2XHPLtMF5PASmfKwxp+pdrDAmCvB2OZAm1TcwsE2cDFSom4x51FgJx7dW/B
         xZXhEIY7YJZCNxSxBT+IyLxwVUqpZS34co9nLcyzebhAJcu8/GqoG3QjZ8yPh1dYNGdB
         TlymGEcvarXhA+50QsX9Q/8+eGU6RPze7iaubtikEJ8+eGm4y5aZLE9nAUHrhQ7keT/Y
         gZYtwT9YJMdw/WaOoBoR1Uf9nSEJ820iaRoObcUpFOBt2QhNZ5cqXNggGGCP0XKebA/0
         NxbsdorWoizQhkMdE23nzMDevoDuKd5MQ479mcWeLO8TXUSsnUUhJ+rz/lXbWQPONn90
         k0Vg==
X-Forwarded-Encrypted: i=1; AJvYcCV1f3N889nJrjUQsEbGLibwf98Eho6g9LINJxcIY64HvEeTnTD5GaJsZvskHnZ6eCT/NSMJ68qReJhCYAI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrY5NtDdOTvJpZ+Jhg6Tz2jaez3WwUoMziTQXbtzEP2i7YSaLr
	I/P1TkuWoAhHMd3hq7bVhyPkwrutG4pZ5FjcbozR78LPuVdbukFdnspWbnibcduv5vZyCTr0ZiP
	xSPZgLKFFBDXp/D+f1kXzhm//XeN224zcLM6hUnnF
X-Gm-Gg: ASbGnctabdVY8oPgoXDkhJW4P/cjrl88pr0ID5lM/QI9pa9EIHvB+uZIwCKWysWRFja
	++zdPSPsA8MFbkelhX6ahh6lfpTpoBsDlMR5fCXppYkyrHO9t6MseLw65jrMOGOPhMG7rwosl+y
	U6deCjW8/gpTBfERTbmd1G+J3DnZGFOqQEh61QKoLOOR7/
X-Google-Smtp-Source: AGHT+IGBSVoZfa3qQL1YBcAUbT0iqwM/S2Nc70m7JsMIDjOnWT5IjHsSV4/OI4FfkkiVmEr6hUTeXq8OFbND4kUoVAk=
X-Received: by 2002:a17:90b:2f8b:b0:313:14b5:2521 with SMTP id
 98e67ed59e1d1-313af1e1bfdmr834790a91.5.1749602660483; Tue, 10 Jun 2025
 17:44:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606165756.1531164-1-dregan@broadcom.com> <8734c9z2ye.fsf@bootlin.com>
In-Reply-To: <8734c9z2ye.fsf@bootlin.com>
From: David Regan <dregan@broadcom.com>
Date: Tue, 10 Jun 2025 17:44:09 -0700
X-Gm-Features: AX0GCFstmDZbiVL4FUmIqIFG1ZaXBu3PVuMtuXgogaDlU7qPFmTGxMc8VjcfM-k
Message-ID: <CAA_RMS7EB2v_h44Ysdoe0=WjC+T4G_5_4O-9DbCBE5OyRNArkg@mail.gmail.com>
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

On Mon, Jun 9, 2025 at 2:20=E2=80=AFAM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> On 06/06/2025 at 09:57:03 -07, David Regan <dregan@broadcom.com> wrote:
>
> > Currently we attempt to get the amount of flipped bits from a hardware
> > location which is reset on every subpage. Instead obtain total flipped
> > bits stat from hardware accumulator. In addition identify the correct
> > maximum subpage corrected bits.
> >
> > Signed-off-by: David Regan <dregan@broadcom.com>
> > Reviewed-by: William Zhang <william.zhang@broadcom.com>
> > ---
>
> Hello,
>
> Can you please give the output of nandbiterrs -i /dev/mtdX?

I'm not familiar with nandbiterrs but here's the results from
mtd_nandbiterrs.ko on my NAND set to BCH8:

# insmod mtd_nandbiterrs.ko dev=3D0
[  676.097190]
[  676.098760] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
[  676.104609] mtd_nandbiterrs: MTD device: 0
[  676.108732] mtd_nandbiterrs: MTD device size 2097152,
eraseblock=3D262144, page=3D4096, oob=3D216
[  676.117089] mtd_nandbiterrs: Device uses 1 subpages of 4096 bytes
[  676.123188] mtd_nandbiterrs: Using page=3D0, offset=3D0, eraseblock=3D0
[  676.130863] mtd_nandbiterrs: incremental biterrors test
[  676.136154] mtd_nandbiterrs: write_page
[  676.140761] mtd_nandbiterrs: rewrite page
[  676.145473] mtd_nandbiterrs: read_page
[  676.149621] mtd_nandbiterrs: verify_page
[  676.153625] mtd_nandbiterrs: Successfully corrected 0 bit errors per sub=
page
[  676.160678] mtd_nandbiterrs: Inserted biterror @ 0/5
[  676.165647] mtd_nandbiterrs: rewrite page
[  676.170363] mtd_nandbiterrs: read_page
[  676.174508] mtd_nandbiterrs: Read reported 1 corrected bit errors
[  676.180606] mtd_nandbiterrs: verify_page
[  676.184609] mtd_nandbiterrs: Successfully corrected 1 bit errors per sub=
page
[  676.191662] mtd_nandbiterrs: Inserted biterror @ 0/2
[  676.196631] mtd_nandbiterrs: rewrite page
[  676.201342] mtd_nandbiterrs: read_page
[  676.205487] mtd_nandbiterrs: Read reported 2 corrected bit errors
[  676.211586] mtd_nandbiterrs: verify_page
[  676.215588] mtd_nandbiterrs: Successfully corrected 2 bit errors per sub=
page
[  676.222641] mtd_nandbiterrs: Inserted biterror @ 0/0
[  676.227608] mtd_nandbiterrs: rewrite page
[  676.228356] mtd_nandbiterrs: read_page
[  676.228749] mtd_nandbiterrs: Read reported 3 corrected bit errors
[  676.228751] mtd_nandbiterrs: verify_page
[  676.228829] mtd_nandbiterrs: Successfully corrected 3 bit errors per sub=
page
[  676.228831] mtd_nandbiterrs: Inserted biterror @ 1/7
[  676.228833] mtd_nandbiterrs: rewrite page
[  676.229530] mtd_nandbiterrs: read_page
[  676.229922] mtd_nandbiterrs: Read reported 4 corrected bit errors
[  676.229924] mtd_nandbiterrs: verify_page
[  676.230001] mtd_nandbiterrs: Successfully corrected 4 bit errors per sub=
page
[  676.230003] mtd_nandbiterrs: Inserted biterror @ 1/5
[  676.230005] mtd_nandbiterrs: rewrite page
[  676.294177] mtd_nandbiterrs: read_page
[  676.298337] mtd_nandbiterrs: Read reported 5 corrected bit errors
[  676.304436] mtd_nandbiterrs: verify_page
[  676.308441] mtd_nandbiterrs: Successfully corrected 5 bit errors per sub=
page
[  676.315494] mtd_nandbiterrs: Inserted biterror @ 1/2
[  676.320464] mtd_nandbiterrs: rewrite page
[  676.325174] mtd_nandbiterrs: read_page
[  676.329327] mtd_nandbiterrs: Read reported 6 corrected bit errors
[  676.335426] mtd_nandbiterrs: verify_page
[  676.339429] mtd_nandbiterrs: Successfully corrected 6 bit errors per sub=
page
[  676.346483] mtd_nandbiterrs: Inserted biterror @ 1/0
[  676.351452] mtd_nandbiterrs: rewrite page
[  676.356162] mtd_nandbiterrs: read_page
[  676.360308] mtd_nandbiterrs: Read reported 7 corrected bit errors
[  676.366407] mtd_nandbiterrs: verify_page
[  676.370409] mtd_nandbiterrs: Successfully corrected 7 bit errors per sub=
page
[  676.377462] mtd_nandbiterrs: Inserted biterror @ 2/6
[  676.382432] mtd_nandbiterrs: rewrite page
[  676.387142] mtd_nandbiterrs: read_page
[  676.391287] mtd_nandbiterrs: Read reported 8 corrected bit errors
[  676.397385] mtd_nandbiterrs: verify_page
[  676.401388] mtd_nandbiterrs: Successfully corrected 8 bit errors per sub=
page
[  676.408441] mtd_nandbiterrs: Inserted biterror @ 2/5
[  676.413411] mtd_nandbiterrs: rewrite page
[  676.418122] mtd_nandbiterrs: read_page
[  676.422267] mtd_nandbiterrs: verify_page
[  676.426194] mtd_nandbiterrs: Error: page offset 0, expected 25, got 00
[  676.432727] mtd_nandbiterrs: Error: page offset 1, expected a5, got 00
[  676.439260] mtd_nandbiterrs: Error: page offset 2, expected 65, got 05
[  676.445868] mtd_nandbiterrs: ECC failure, read data is incorrect
despite read success
[  676.474929]
[  676.476425] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
[  676.482264] mtd_nandbiterrs: MTD device: 0
[  676.486367] mtd_nandbiterrs: MTD device size 2097152,
eraseblock=3D262144, page=3D4096, oob=3D216
[  676.494721] mtd_nandbiterrs: Device uses 1 subpages of 4096 bytes
[  676.494724] mtd_nandbiterrs: Using page=3D0, offset=3D0, eraseblock=3D0
[  676.496298] mtd_nandbiterrs: incremental biterrors test
[  676.496361] mtd_nandbiterrs: write_page
[  676.497123] mtd_nandbiterrs: rewrite page
[  676.497820] mtd_nandbiterrs: read_page
[  676.498210] mtd_nandbiterrs: verify_page
[  676.498287] mtd_nandbiterrs: Successfully corrected 0 bit errors per sub=
page
[  676.498289] mtd_nandbiterrs: Inserted biterror @ 0/5
[  676.498291] mtd_nandbiterrs: rewrite page
[  676.547860] mtd_nandbiterrs: read_page
[  676.552005] mtd_nandbiterrs: Read reported 1 corrected bit errors
[  676.558104] mtd_nandbiterrs: verify_page
[  676.562107] mtd_nandbiterrs: Successfully corrected 1 bit errors per sub=
page
[  676.569160] mtd_nandbiterrs: Inserted biterror @ 0/2
[  676.574130] mtd_nandbiterrs: rewrite page
[  676.578842] mtd_nandbiterrs: read_page
[  676.582987] mtd_nandbiterrs: Read reported 2 corrected bit errors
[  676.589085] mtd_nandbiterrs: verify_page
[  676.593088] mtd_nandbiterrs: Successfully corrected 2 bit errors per sub=
page
[  676.600141] mtd_nandbiterrs: Inserted biterror @ 0/0
[  676.605111] mtd_nandbiterrs: rewrite page
[  676.609821] mtd_nandbiterrs: read_page
[  676.613967] mtd_nandbiterrs: Read reported 3 corrected bit errors
[  676.620065] mtd_nandbiterrs: verify_page
[  676.624068] mtd_nandbiterrs: Successfully corrected 3 bit errors per sub=
page
[  676.631122] mtd_nandbiterrs: Inserted biterror @ 1/7
[  676.636091] mtd_nandbiterrs: rewrite page
[  676.640802] mtd_nandbiterrs: read_page
[  676.644947] mtd_nandbiterrs: Read reported 4 corrected bit errors
[  676.651045] mtd_nandbiterrs: verify_page
[  676.655048] mtd_nandbiterrs: Successfully corrected 4 bit errors per sub=
page
[  676.662100] mtd_nandbiterrs: Inserted biterror @ 1/5
[  676.667070] mtd_nandbiterrs: rewrite page
[  676.671780] mtd_nandbiterrs: read_page
[  676.675925] mtd_nandbiterrs: Read reported 5 corrected bit errors
[  676.682025] mtd_nandbiterrs: verify_page
[  676.686028] mtd_nandbiterrs: Successfully corrected 5 bit errors per sub=
page
[  676.693082] mtd_nandbiterrs: Inserted biterror @ 1/2
[  676.698051] mtd_nandbiterrs: rewrite page
[  676.702762] mtd_nandbiterrs: read_page
[  676.706907] mtd_nandbiterrs: Read reported 6 corrected bit errors
[  676.713005] mtd_nandbiterrs: verify_page
[  676.717008] mtd_nandbiterrs: Successfully corrected 6 bit errors per sub=
page
[  676.724076] mtd_nandbiterrs: Inserted biterror @ 1/0
[  676.729047] mtd_nandbiterrs: rewrite page
[  676.733758] mtd_nandbiterrs: read_page
[  676.737904] mtd_nandbiterrs: Read reported 7 corrected bit errors
[  676.744003] mtd_nandbiterrs: verify_page
[  676.748006] mtd_nandbiterrs: Successfully corrected 7 bit errors per sub=
page
[  676.755059] mtd_nandbiterrs: Inserted biterror @ 2/6
[  676.760029] mtd_nandbiterrs: rewrite page
[  676.764739] mtd_nandbiterrs: read_page
[  676.768884] mtd_nandbiterrs: Read reported 8 corrected bit errors
[  676.774982] mtd_nandbiterrs: verify_page
[  676.778986] mtd_nandbiterrs: Successfully corrected 8 bit errors per sub=
page
[  676.786039] mtd_nandbiterrs: Inserted biterror @ 2/5
[  676.791009] mtd_nandbiterrs: rewrite page
[  676.795719] mtd_nandbiterrs: read_page
[  676.799864] mtd_nandbiterrs: verify_page
[  676.803791] mtd_nandbiterrs: Error: page offset 0, expected 25, got 00
[  676.810324] mtd_nandbiterrs: Error: page offset 1, expected a5, got 00
[  676.816857] mtd_nandbiterrs: Error: page offset 2, expected 65, got 05
[  676.823463] mtd_nandbiterrs: ECC failure, read data is incorrect
despite read success

>
> >  v2: Add >=3D v4 NAND controller support as requested by Jonas.
> >      mtd->ecc_stats.corrected accumulates instead of set to total.
> >      Remove DMA specific flipped bits count.
>
> The changelog does not mention the fact that you return the maximum
> number of corrected bitflips as I requested, and the diff does not show
> a straightforward implementation of that. It is very important to get
> this right.

I'm a little unclear on what sort of verbiage you would like, I mentioned
in the original and v2 patches summary: "In addition identify the correct
maximum subpage corrected bits", would you like me to maybe change
it to something such as "In addition this change fixes the maximum
number of bitflips from all the subpages" ?

>
> If we take the following example of a page with 4 ECC steps, if we get
> respectively: 0, 2, 3, 0 bitflips per step, the returned value shall be
> 3.
>
> To be very certain that this is correct, you can use the nandflipbit
> tool from the mtd-utils test suite. You can manually insert bitflips in
> various areas of a page and then read the page again with ECC enabled
> and see how many bit errors are reported.

I'm not aware if there is a tool which reads the maximum returned ECC
bits directly, however during my testing I have put in debug code which
will hopefully make things more clear which shows the maximum
amount of ECC chunk corrected bits being returned. We will return the
maximum subpage corrected bits from brcmnand_read only when we
cross a threshold (in this case 6 of a possible 8 bits) because this will
trigger an EUCLEAN at a higher level. Here is my debug messages
highlighting the values (flipped bits in each subpage: 0, 2, 3, 0, 0, 6, 7,=
 0):

nandflipbits /dev/mtd2 0@512 1@513 2@1024 3@1025 4@1026
nandflipbits /dev/mtd2 1@2560 2@2561 3@2562 4@2563 5@2564 6@2565
nandflipbits /dev/mtd2 1@3072 2@3073 3@3074 4@3075 5@3076 6@3077 7@3078

cat /sys/class/mtd/mtd2/corrected_bits
0

# cat /dev/mtd2 > /dev/null
[  394.422696] subpage 0, bitflips detected 0, max subpage bitflips detecte=
d 0
[  394.422764] subpage 1, bitflips detected 2, max subpage bitflips detecte=
d 0
[  394.422818] subpage 2, bitflips detected 3, max subpage bitflips detecte=
d 0
[  394.422869] subpage 3, bitflips detected 0, max subpage bitflips detecte=
d 0
[  394.422919] subpage 4, bitflips detected 0, max subpage bitflips detecte=
d 0
[  394.422974] subpage 5, bitflips detected 6, max subpage bitflips detecte=
d 6
[  394.423028] subpage 6, bitflips detected 7, max subpage bitflips detecte=
d 7
[  394.423079] subpage 7, bitflips detected 0, max subpage bitflips detecte=
d 7
[  394.423085] bitflip threshold exceeded, returning 7 bitflips
[  394.423161] subpage 0, bitflips detected 0, max subpage bitflips detecte=
d 0
[  394.423212] subpage 1, bitflips detected 0, max subpage bitflips detecte=
d 0
[  394.423263] subpage 2, bitflips detected 0, max subpage bitflips detecte=
d 0
[  394.423313] subpage 3, bitflips detected 0, max subpage bitflips detecte=
d 0
[  394.423363] subpage 4, bitflips detected 0, max subpage bitflips detecte=
d 0
[  394.423414] subpage 5, bitflips detected 0, max subpage bitflips detecte=
d 0
[  394.423464] subpage 6, bitflips detected 0, max subpage bitflips detecte=
d 0
[  394.423514] subpage 7, bitflips detected 0, max subpage bitflips detecte=
d 0
...

cat /sys/class/mtd/mtd2/corrected_bits
18

>
> Thanks,
> Miqu=C3=A8l

Thanks!

-Dave
