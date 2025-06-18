Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AE527F163
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750237679; cv=none; b=A/djQ40N1TzIrtLfV+4+gprcrJN+vNbpajzBZrebGgFRYmKCanQk946pdYlPqPgh+7j7t5X9br9cIXTZJrUgW4vkNiwhBdracRUxK3nGyfXKCzNTVDNDp8pbILt6CnHJELFaUYpulvi59C8P18X1mTrYdJ3Wwaa5+55Djjofk0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750237679; c=relaxed/simple;
	bh=qMDXctjl3RrGqRpvuvl/oTWHNNTjYNjaf7sDj1ZaU54=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NxeYFsqmUJtrDE8KHSbFobPgF8V3gHOAA8rKeElQ0N/x+XGIACtk+U5pAhpjNpoHkAvvbDM9UISzIWzd0JUDBXdXhTHmljMrhx6lwtEnHnrVWfGKq72LlQL3SEPPxZqOTjK86qbSV1Q8o2Nj4v1SFc6Nkt09vbEvmaCKgCLYB9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ReQwIoka; arc=none smtp.client-ip=217.70.178.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ReQwIoka"
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE4AF44A28;
	Wed, 18 Jun 2025 09:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750237674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5YKCS0p2mX1jUvgRQVTRJkGPc02swV2tS4F99SUfUWw=;
	b=ReQwIokambRFmDeygohyji4QXGAAi8EdLiXoArdG4vI2pzUdN/EttUF4i+BLn8j6JBhre4
	iBpFsGqF8QF58KvjqqkZNxXy+ALsOj2lBKWSp5YlEu5bb8kox0MVx9EPAJGkxApOddw/lW
	7ql9/Rd4E+5yetDDxPE6WleRqZRfLpdhSoPtmtrkRjjaexWC7+JyDKfSstgeY4c5GbUzHp
	sMxwI9PeXeECeCuJCkLLvmpdtCn4M9m57orT4FbbfRuVhIhdsKLDpS/VNgcPsNupJnl1oi
	pLZkokmy8O1iUjfkWyOOfPMEYJpRMeVOQo2VgD1wP84szH7UHI0h14uwyAc/Uw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Regan <dregan@broadcom.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
  linux-mtd@lists.infradead.org,  bcm-kernel-feedback-list@broadcom.com,
  William Zhang <william.zhang@broadcom.com>,  Anand Gore
 <anand.gore@broadcom.com>,  Florian Fainelli
 <florian.fainelli@broadcom.com>,  Kamal Dasu <kamal.dasu@broadcom.com>,
  Dan Beygelman <dan.beygelman@broadcom.com>,  =?utf-8?Q?=C3=81lvaro_Fern?=
 =?utf-8?Q?=C3=A1ndez?= Rojas
 <noltari@gmail.com>,  rafal@milecki.pl,  computersforpeace@gmail.com,
  frieder.schrempf@kontron.de,  Vignesh Raghavendra <vigneshr@ti.com>,
  Richard Weinberger <richard@nod.at>,  Boris Brezillon
 <bbrezillon@kernel.org>,  kdasu.kdev@gmail.com,  JaimeLiao
 <jaimeliao.tw@gmail.com>,  Adam Borowski <kilobyte@angband.pl>,  Jonas
 Gorski <jonas.gorski@gmail.com>,  dgcbueu@gmail.com,  dregan@mail.com
Subject: Re: [PATCH v2] mtd: nand: brcmnand: fix mtd corrected bits stat
In-Reply-To: <CAA_RMS7EB2v_h44Ysdoe0=WjC+T4G_5_4O-9DbCBE5OyRNArkg@mail.gmail.com>
	(David Regan's message of "Tue, 10 Jun 2025 17:44:09 -0700")
References: <20250606165756.1531164-1-dregan@broadcom.com>
	<8734c9z2ye.fsf@bootlin.com>
	<CAA_RMS7EB2v_h44Ysdoe0=WjC+T4G_5_4O-9DbCBE5OyRNArkg@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 18 Jun 2025 11:07:53 +0200
Message-ID: <87h60dmn86.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvvddprhgtphhtthhopegurhgvghgrnhessghrohgruggtohhmrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegstghmqdhkvghrnhgvlhdqfhgvvggusggrtghkqdhlihhsthessghrohgruggtohhmrdgtohhmpdhrtghpthhto
 hepfihilhhlihgrmhdriihhrghnghessghrohgruggtohhmrdgtohhmpdhrtghpthhtoheprghnrghnugdrghhorhgvsegsrhhorggutghomhdrtghomhdprhgtphhtthhopehflhhorhhirghnrdhfrghinhgvlhhlihessghrohgruggtohhmrdgtohhmpdhrtghpthhtohepkhgrmhgrlhdruggrshhusegsrhhorggutghomhdrtghomh

Hello David,

> I'm not familiar with nandbiterrs but here's the results from
> mtd_nandbiterrs.ko on my NAND set to BCH8:
>
> # insmod mtd_nandbiterrs.ko dev=3D0
> [  676.097190]
> [  676.098760] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> [  676.104609] mtd_nandbiterrs: MTD device: 0
> [  676.108732] mtd_nandbiterrs: MTD device size 2097152,
> eraseblock=3D262144, page=3D4096, oob=3D216
> [  676.117089] mtd_nandbiterrs: Device uses 1 subpages of 4096 bytes
> [  676.123188] mtd_nandbiterrs: Using page=3D0, offset=3D0, eraseblock=3D0
> [  676.130863] mtd_nandbiterrs: incremental biterrors test
> [  676.136154] mtd_nandbiterrs: write_page
> [  676.140761] mtd_nandbiterrs: rewrite page
> [  676.145473] mtd_nandbiterrs: read_page
> [  676.149621] mtd_nandbiterrs: verify_page
> [  676.153625] mtd_nandbiterrs: Successfully corrected 0 bit errors per s=
ubpage
> [  676.160678] mtd_nandbiterrs: Inserted biterror @ 0/5
> [  676.165647] mtd_nandbiterrs: rewrite page
> [  676.170363] mtd_nandbiterrs: read_page
> [  676.174508] mtd_nandbiterrs: Read reported 1 corrected bit errors
> [  676.180606] mtd_nandbiterrs: verify_page
> [  676.184609] mtd_nandbiterrs: Successfully corrected 1 bit errors per s=
ubpage
> [  676.191662] mtd_nandbiterrs: Inserted biterror @ 0/2
> [  676.196631] mtd_nandbiterrs: rewrite page
> [  676.201342] mtd_nandbiterrs: read_page
> [  676.205487] mtd_nandbiterrs: Read reported 2 corrected bit errors
> [  676.211586] mtd_nandbiterrs: verify_page
> [  676.215588] mtd_nandbiterrs: Successfully corrected 2 bit errors per s=
ubpage
> [  676.222641] mtd_nandbiterrs: Inserted biterror @ 0/0
> [  676.227608] mtd_nandbiterrs: rewrite page
> [  676.228356] mtd_nandbiterrs: read_page
> [  676.228749] mtd_nandbiterrs: Read reported 3 corrected bit errors
> [  676.228751] mtd_nandbiterrs: verify_page
> [  676.228829] mtd_nandbiterrs: Successfully corrected 3 bit errors per s=
ubpage
> [  676.228831] mtd_nandbiterrs: Inserted biterror @ 1/7
> [  676.228833] mtd_nandbiterrs: rewrite page
> [  676.229530] mtd_nandbiterrs: read_page
> [  676.229922] mtd_nandbiterrs: Read reported 4 corrected bit errors
> [  676.229924] mtd_nandbiterrs: verify_page
> [  676.230001] mtd_nandbiterrs: Successfully corrected 4 bit errors per s=
ubpage
> [  676.230003] mtd_nandbiterrs: Inserted biterror @ 1/5
> [  676.230005] mtd_nandbiterrs: rewrite page
> [  676.294177] mtd_nandbiterrs: read_page
> [  676.298337] mtd_nandbiterrs: Read reported 5 corrected bit errors
> [  676.304436] mtd_nandbiterrs: verify_page
> [  676.308441] mtd_nandbiterrs: Successfully corrected 5 bit errors per s=
ubpage
> [  676.315494] mtd_nandbiterrs: Inserted biterror @ 1/2
> [  676.320464] mtd_nandbiterrs: rewrite page
> [  676.325174] mtd_nandbiterrs: read_page
> [  676.329327] mtd_nandbiterrs: Read reported 6 corrected bit errors
> [  676.335426] mtd_nandbiterrs: verify_page
> [  676.339429] mtd_nandbiterrs: Successfully corrected 6 bit errors per s=
ubpage
> [  676.346483] mtd_nandbiterrs: Inserted biterror @ 1/0
> [  676.351452] mtd_nandbiterrs: rewrite page
> [  676.356162] mtd_nandbiterrs: read_page
> [  676.360308] mtd_nandbiterrs: Read reported 7 corrected bit errors
> [  676.366407] mtd_nandbiterrs: verify_page
> [  676.370409] mtd_nandbiterrs: Successfully corrected 7 bit errors per s=
ubpage
> [  676.377462] mtd_nandbiterrs: Inserted biterror @ 2/6
> [  676.382432] mtd_nandbiterrs: rewrite page
> [  676.387142] mtd_nandbiterrs: read_page
> [  676.391287] mtd_nandbiterrs: Read reported 8 corrected bit errors
> [  676.397385] mtd_nandbiterrs: verify_page
> [  676.401388] mtd_nandbiterrs: Successfully corrected 8 bit errors
> per subpage

So far the reporting looks good (and the nandflipbits output looks
correct as well).

> [  676.408441] mtd_nandbiterrs: Inserted biterror @ 2/5
> [  676.413411] mtd_nandbiterrs: rewrite page
> [  676.418122] mtd_nandbiterrs: read_page
> [  676.422267] mtd_nandbiterrs: verify_page
> [  676.426194] mtd_nandbiterrs: Error: page offset 0, expected 25, got 00
> [  676.432727] mtd_nandbiterrs: Error: page offset 1, expected a5, got 00
> [  676.439260] mtd_nandbiterrs: Error: page offset 2, expected 65, got 05
> [  676.445868] mtd_nandbiterrs: ECC failure, read data is incorrect
> despite read success

Here however there is something wrong. We do expect a read failure,
instead of returning wrong data. There is still a problem, I do not know
if this problem was there before though, but this must be fixed.

Hello Florian, if you have time, I'd welcome you opinion on this patch :)

Cheers,
Miqu=C3=A8l
