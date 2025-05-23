Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A8025760
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748023771; cv=none; b=llkM5+0029l9xCajgAPom5RQwEZXN1ZsOjQGRG2AEonTGqiJlpifRn2jItuya+JP4RMu5uz0GgvI27rI9JvcIXFfC8bJhmxzNs8selcgPbq0ouVUZazChBXo8pn1Mti0bZm2IH/zFXxXDzKWkmxEQDRazRIiZKqG7Xe8Q/+CwGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748023771; c=relaxed/simple;
	bh=E45fh6sVYRwvVo/1a4CMh9FPnXlGhJZP+J6/OwpMgCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vb6R7TgFjpedtmq8hQDnmCrft9Azjybv65UNmgiDhRHr1ssaiC5fWIaLws8iXHTKjP/n62jBlALvDdRBsRw9eNjvVX3Eniz3V1J8hUBEVsHg6Pj/m7Uk2Xy6HqaXajX8BO1XH7FGLRYbyApEzge3ruFpmQNnU2sfu0pWuEu3lWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cg8cEuIV; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cg8cEuIV"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b2c02e79d31so89494a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 11:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748023769; x=1748628569; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3PSAm/dz4qE3w58GPb642xKbKrw4osSp9d6WGa3IFOc=;
        b=Cg8cEuIVjhSu/9XwYy8BgKVEeaeN1rSRGQokICoBfi8GNNf/VuMkwcjONA6TZc4FBk
         drjN932SZVli2/YGeKoCMX9WP1ciSQuXl/boE/j474AzcFBeLbUfftzMBm95bPsopY66
         cd68POMCqTtleGX2TaJEoOXVtHjcI3i23j8HM7Q8NC7EJAjFt+SM/UfvnORlbmosIZy5
         c61bZp7tl4vIJCyW8vDhYuGYz50ZTZ7qoL3lcIhZziLV35sTLqxts5r4POYcZPOipmaz
         5AHm/PoM166f+XIUxg2YZYFyhHE3pk9OSWYq66ZVhHTBod0VdMyOL1n7kwz1Bu+C8OYd
         KYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748023769; x=1748628569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3PSAm/dz4qE3w58GPb642xKbKrw4osSp9d6WGa3IFOc=;
        b=RB8XfBfWmmpvVXyU/kwPR8gVvSfB33kQO+hSrjrJo0BSqMBssAi9yrwnEKzmI871ov
         VE0WtNePa/JH6b9in8zwLbBDXgDbOJt0w/BOI7WrlQDJ5ws9XImABhKwLk9tVso5SWzh
         Hx75rzxDNIVMFDw7DV4qZNxj23QzZmecAaCLBAhPADpkOJMa3V91aAR9nang7uNMNTA0
         FVhKAZ/nNT43fEbVNnOL6FSe4Vcm6KQyMEGc8sE5yYTdtNTIyOWeh8WMerDasYTEs/fb
         fHzYsVb/itjXk017RxqhO/t+jY56qt8nkKYeUIZ6dl4Oz6KlGJhD591s+Vako9F5RNGn
         vavw==
X-Forwarded-Encrypted: i=1; AJvYcCWK3oxDyo498yHaDjAtsSycUNO2NLyUBLDdiUexpFzAyyjHGgO5kzI+OzGUHVBl0Ch8pWioTIvHM5zbF84=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjqR2LU3vkRKxCb6zS9C91ibhuaLcNZ0rBtX89Y37BR9qjGC7J
	BQ2f1oSyUhWe14K+sOylLUSGCvb8ezcVpbxL4yvlH2OfeWB1oJMFkKI9/mkyZ6zKBDUxYba2VaN
	L9ry/Ovl2qINrlnlqPCFwec086ttBD44=
X-Gm-Gg: ASbGncs3XccP1bp5amPCoaWxwrpo9vAIkBsaQxAjY178XJJw9jUUqWcgGx0iR+DGzi3
	VbRNU0fqcvlDBw+gjCPxWUi7xs9bNKtwiKd1uBdyDSfivrMukY4HuAYAxNLGBtfLN57qmofWCgH
	u5Le0CfUzgH0e2Ylje+B40QIxUnuuV5TAFsZYxPayT3o5Gr1LDsnVvr4QBhIsIwI42Hw==
X-Google-Smtp-Source: AGHT+IEhdWBRRXcbHG9nhqMGxviXTWnxY5rMQJCfRX7t4KBkxl1C8mVIhgTCDvIHp+BcGZXaQC7Hhr9HVhliQGJKb4U=
X-Received: by 2002:a17:90b:4c0e:b0:310:8d73:c54b with SMTP id
 98e67ed59e1d1-3110f0f1340mr78082a91.8.1748023769328; Fri, 23 May 2025
 11:09:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521080325.581366-1-noltari@gmail.com> <87wma74ceh.fsf@bootlin.com>
In-Reply-To: <87wma74ceh.fsf@bootlin.com>
From: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Date: Fri, 23 May 2025 20:08:56 +0200
X-Gm-Features: AX0GCFsjrJL9r_aUrdKh5hSAxN7Sfdl5PHDMGUlP9_F21fDnjANEA-PzRnYV5Xc
Message-ID: <CAKR-sGeUGpUFBf_Zvg=7ro0EpGKy0dQVF58mAQt27YX+79qv1A@mail.gmail.com>
Subject: Re: [PATCH v5] mtd: rawnand: brcmnand: legacy exec_op implementation
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, dregan@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, florian.fainelli@broadcom.com, 
	rafal@milecki.pl, computersforpeace@gmail.com, kamal.dasu@broadcom.com, 
	dan.beygelman@broadcom.com, william.zhang@broadcom.com, 
	frieder.schrempf@kontron.de, linux-kernel@vger.kernel.org, vigneshr@ti.com, 
	richard@nod.at, bbrezillon@kernel.org, kdasu.kdev@gmail.com, 
	jaimeliao.tw@gmail.com, kilobyte@angband.pl, jonas.gorski@gmail.com, 
	dgcbueu@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miqu=C3=A8l,

El vie, 23 may 2025 a las 16:42, Miquel Raynal
(<miquel.raynal@bootlin.com>) escribi=C3=B3:
>
> On 21/05/2025 at 10:03:25 +02, =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@=
gmail.com> wrote:
>
> > Commit 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation")
> > removed legacy interface functions, breaking < v5.0 controllers support=
.
> > In order to fix older controllers we need to add an alternative exec_op
> > implementation which doesn't rely on low level registers.
> >
> > Fixes: 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation")
> > Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> > Reviewed-by: David Regan <dregan@broadcom.com>
> > ---
> >  drivers/mtd/nand/raw/brcmnand/brcmnand.c | 222 ++++++++++++++++++++++-
> >  1 file changed, 215 insertions(+), 7 deletions(-)
> >
> >  v5: add changes requested by Miqu=C3=A8l Raynal:
> >   - Mention and explain legacy in native_cmd_conv.
> >   - EOPNOTSUPP instead of EINVAL for instr->type else.
> >   - Implement missing check_only functionality.
> >
> >  v4: add changes requested by Jonas Gorski:
> >   - Add missing breaks in brcmnand_exec_instructions_legacy.
> >   - Restore missing ret assignment in brcmnand_exec_op.
> >
> >  v3: add changes requested by Florian and other improvements:
> >   - Add associative array for native command conversion.
> >   - Add function pointer to brcmnand_controller for exec_instr
> >     functionality.
> >   - Fix CMD_BLOCK_ERASE address.
> >   - Drop NAND_CMD_READOOB support.
> >
> >  v2: multiple improvements:
> >   - Use proper native commands for checks.
> >   - Fix NAND_CMD_PARAM/NAND_CMD_RNDOUT addr calculation.
> >   - Remove host->last_addr usage.
> >   - Remove sector_size_1k since it only applies to v5.0+ controllers.
> >   - Remove brcmnand_wp since it doesn't exist for < v5.0 controllers.
> >   - Use j instead of i for flash_cache loop.
> >
>
> ...
>
> > +static int brcmnand_check_instructions_legacy(struct nand_chip *chip,
> > +                                           const struct nand_operation=
 *op)
> > +{
> > +     const struct nand_op_instr *instr;
> > +     unsigned int i;
> > +     u8 cmd;
> > +
> > +     for (i =3D 0; i < op->ninstrs; i++) {
> > +             instr =3D &op->instrs[i];
> > +
> > +             switch (instr->type) {
> > +             case NAND_OP_CMD_INSTR:
> > +                     cmd =3D native_cmd_conv[instr->ctx.cmd.opcode];
> > +                     if (cmd =3D=3D CMD_NOT_SUPPORTED)
> > +                             return -EOPNOTSUPP;
> > +                     break;
> > +             case NAND_OP_ADDR_INSTR:
> > +             case NAND_OP_DATA_IN_INSTR:
>
> No NAND_OP_DATA_OUT_INSTR?

AFAIK, the legacy functions were only using it for
NAND_CMD_SET_FEATURES, which we don't support:
https://github.com/torvalds/linux/blob/c86b63b82fde4f96ee94dde827a5f28ff5ad=
eb57/drivers/mtd/nand/raw/brcmnand/brcmnand.c#L1922-L1938

The other uses I could find are already covered by our
chip->ecc.read/write functions.

In any case I've tested the patch for reading, erasing and writing the
NAND and so far I haven't found any unsupported error apart from
NAND_CMD_GET_FEATURES with a Macronix NAND in the Sercom H500-s
(BCM63268).
I believe it's used for unlocking the NAND, which isn't needed in that devi=
ce.

>
> > +             case NAND_OP_WAITRDY_INSTR:
> > +                     break;
> > +             default:
> > +                     return -EOPNOTSUPP;
> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
>
> Rest lgtm.
>
> Thanks,
> Miqu=C3=A8l

Best regards,
=C3=81lvaro.
