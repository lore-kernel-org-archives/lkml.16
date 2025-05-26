Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AD2136349
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 07:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748244495; cv=none; b=ED1Ulqq32Nm04UZh3IZQkyhV9xT3VYV6PdkYBu2EJO6HhjBFJYeqBqCN6ZeZcX6IfTgY7uc7MqIFSsYDcdTFsfO81n/yYwWeZBJfYXpLk8dkSxc7KrCQEcmlBCXsPZvOZHzLOAg6U5ZI6ditvKgGLA9ki1aHaOcr18O/K9nOcwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748244495; c=relaxed/simple;
	bh=UcDt4cPcuwjvzRJGvPkjzQK+Ga5UNyPVtCkAy/5rP2c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lFpeffVw8J9Wh5HsAuntqDF0+2xAFIJ18j1FLoxYh5JLHMzEM++4qw6jilN98b7wgAc0H0WbS67qARcsVF70a5B5g3tTSLzAjhxl3VFnkXM7eTCidobM4xSCDUKlR+3U1D5cxzfAsQ0jM943DIJX5sXymcZtijl5OKGrVTkrkkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=m/nJKWzi; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="m/nJKWzi"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 115C71FD57;
	Mon, 26 May 2025 07:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748244486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JXhPQXCLhDCgYneej08WV86s5Giw6eGuE0pYiMGU66g=;
	b=m/nJKWziJhOQY9nl6l4s/wHgvsOUsW31W/CsW1ew99KrW/l8fWBmJq2Wlhztpa6lI7B3HT
	/NfHNwsT1rkc+/YgVCkWNLlbmmVIqaeM7wblJ/ZLiJPuke6FEITyLiCK05dSpIaJXVqpNR
	EOVhDdqBEfRetefABhjzpfOrIsK3UcVTlmp3862g6yloKHB/JpGkGX0brDclxszaaomYPo
	qnHlAjfD7L7pZTJcnlWqNsStcGrcOTp+CGe1NmdVK6EaYiOpJHjkTkFZ3gkKbQW29dWD5S
	LKCh7JIE10cAwk7+x7yPuUfQ8NDKuoulLmP/kSnre4EWXSSCVm3mk33sDGQzLg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez?= Rojas <noltari@gmail.com>
Cc: linux-mtd@lists.infradead.org,  dregan@broadcom.com,
  bcm-kernel-feedback-list@broadcom.com,  florian.fainelli@broadcom.com,
  rafal@milecki.pl,  computersforpeace@gmail.com,  kamal.dasu@broadcom.com,
  dan.beygelman@broadcom.com,  william.zhang@broadcom.com,
  frieder.schrempf@kontron.de,  linux-kernel@vger.kernel.org,
  vigneshr@ti.com,  richard@nod.at,  bbrezillon@kernel.org,
  kdasu.kdev@gmail.com,  jaimeliao.tw@gmail.com,  kilobyte@angband.pl,
  jonas.gorski@gmail.com,  dgcbueu@gmail.com
Subject: Re: [PATCH v5] mtd: rawnand: brcmnand: legacy exec_op implementation
In-Reply-To: <CAKR-sGeUGpUFBf_Zvg=7ro0EpGKy0dQVF58mAQt27YX+79qv1A@mail.gmail.com>
	(=?utf-8?Q?=22=C3=81lvaro_Fern=C3=A1ndez?= Rojas"'s message of "Fri, 23 May
 2025 20:08:56
	+0200")
References: <20250521080325.581366-1-noltari@gmail.com>
	<87wma74ceh.fsf@bootlin.com>
	<CAKR-sGeUGpUFBf_Zvg=7ro0EpGKy0dQVF58mAQt27YX+79qv1A@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 26 May 2025 09:28:02 +0200
Message-ID: <874ix74yrh.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduieelvdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeftdehieelledvveduudelieeggeehkedvheeikeelkefhkeelffetffeitdethfenucffohhmrghinhepghhithhhuhgsrdgtohhmpdgvtggtrdhrvggrugenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopehnohhlthgrrhhisehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegurhgvghgrnhessghrohgruggtohhmrdgtohhmpdhrtghpthhtohepsggtmhdqkhgvrhhnvghlqdhfvggvuggsrggtkhdqlhhishhtsegsrhhorggutghom
 hdrtghomhdprhgtphhtthhopehflhhorhhirghnrdhfrghinhgvlhhlihessghrohgruggtohhmrdgtohhmpdhrtghpthhtoheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhrtghpthhtoheptghomhhpuhhtvghrshhfohhrphgvrggtvgesghhmrghilhdrtghomhdprhgtphhtthhopehkrghmrghlrdgurghsuhessghrohgruggtohhmrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com

On 23/05/2025 at 20:08:56 +02, =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gm=
ail.com> wrote:

> Hi Miqu=C3=A8l,
>
> El vie, 23 may 2025 a las 16:42, Miquel Raynal
> (<miquel.raynal@bootlin.com>) escribi=C3=B3:
>>
>> On 21/05/2025 at 10:03:25 +02, =C3=81lvaro Fern=C3=A1ndez Rojas <noltari=
@gmail.com> wrote:
>>
>> > Commit 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation")
>> > removed legacy interface functions, breaking < v5.0 controllers suppor=
t.
>> > In order to fix older controllers we need to add an alternative exec_op
>> > implementation which doesn't rely on low level registers.
>> >
>> > Fixes: 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation")
>> > Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>> > Reviewed-by: David Regan <dregan@broadcom.com>
>> > ---
>> >  drivers/mtd/nand/raw/brcmnand/brcmnand.c | 222 ++++++++++++++++++++++-
>> >  1 file changed, 215 insertions(+), 7 deletions(-)
>> >
>> >  v5: add changes requested by Miqu=C3=A8l Raynal:
>> >   - Mention and explain legacy in native_cmd_conv.
>> >   - EOPNOTSUPP instead of EINVAL for instr->type else.
>> >   - Implement missing check_only functionality.
>> >
>> >  v4: add changes requested by Jonas Gorski:
>> >   - Add missing breaks in brcmnand_exec_instructions_legacy.
>> >   - Restore missing ret assignment in brcmnand_exec_op.
>> >
>> >  v3: add changes requested by Florian and other improvements:
>> >   - Add associative array for native command conversion.
>> >   - Add function pointer to brcmnand_controller for exec_instr
>> >     functionality.
>> >   - Fix CMD_BLOCK_ERASE address.
>> >   - Drop NAND_CMD_READOOB support.
>> >
>> >  v2: multiple improvements:
>> >   - Use proper native commands for checks.
>> >   - Fix NAND_CMD_PARAM/NAND_CMD_RNDOUT addr calculation.
>> >   - Remove host->last_addr usage.
>> >   - Remove sector_size_1k since it only applies to v5.0+ controllers.
>> >   - Remove brcmnand_wp since it doesn't exist for < v5.0 controllers.
>> >   - Use j instead of i for flash_cache loop.
>> >
>>
>> ...
>>
>> > +static int brcmnand_check_instructions_legacy(struct nand_chip *chip,
>> > +                                           const struct nand_operatio=
n *op)
>> > +{
>> > +     const struct nand_op_instr *instr;
>> > +     unsigned int i;
>> > +     u8 cmd;
>> > +
>> > +     for (i =3D 0; i < op->ninstrs; i++) {
>> > +             instr =3D &op->instrs[i];
>> > +
>> > +             switch (instr->type) {
>> > +             case NAND_OP_CMD_INSTR:
>> > +                     cmd =3D native_cmd_conv[instr->ctx.cmd.opcode];
>> > +                     if (cmd =3D=3D CMD_NOT_SUPPORTED)
>> > +                             return -EOPNOTSUPP;
>> > +                     break;
>> > +             case NAND_OP_ADDR_INSTR:
>> > +             case NAND_OP_DATA_IN_INSTR:
>>
>> No NAND_OP_DATA_OUT_INSTR?
>
> AFAIK, the legacy functions were only using it for
> NAND_CMD_SET_FEATURES, which we don't support:
> https://github.com/torvalds/linux/blob/c86b63b82fde4f96ee94dde827a5f28ff5=
adeb57/drivers/mtd/nand/raw/brcmnand/brcmnand.c#L1922-L1938
>
> The other uses I could find are already covered by our
> chip->ecc.read/write functions.
>
> In any case I've tested the patch for reading, erasing and writing the
> NAND and so far I haven't found any unsupported error apart from
> NAND_CMD_GET_FEATURES with a Macronix NAND in the Sercom H500-s
> (BCM63268).
> I believe it's used for unlocking the NAND, which isn't needed in that
> device.

Well, you are restoring an old behavior so I won't ask for a better
support, but you should normally allow software ECC engines (and even no
engine at all) and in this case the core will require a write path. I
honestly think it is not very complex to implement but if someone is
lacking this feature it can be added later.

Please just fix the braces in the for loop that was reported, but no
hurry, I'll only take this after -rc1.

Thanks,
Miqu=C3=A8l
