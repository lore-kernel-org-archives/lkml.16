Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56601EFF9A
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 05:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747285641; cv=none; b=dHknYNQesbmop9fPkdkIhiG9KZaE0+5q3KPXzSRJN0yLgxqiXx+sV69yvTL5Tb6A5YpvAGYlpNaDBSXvz6Ll8/9GWgpQSrk0WepMsC2SCXZymZQYVUvZf2E7h1GBp5Woc2q6fL7+3EDvbR2bV5e14fkWYohoz9+jTHMyyw5BMIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747285641; c=relaxed/simple;
	bh=8RAtH6vCWjsIVMnTYulcjiNt9cXX2GqGOeTEViI3IVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T7agmmFWKDu0YopQtb2Qvz+Y3xN8vXFxlboOWvVPxsXh6RnVSdmMfKDnVuhDua3dK4Tevz17FFcfAjeqmYA97kGfAWSTXWkVS01BLFUFKSZySlApUAxHLeTQMY1+g4lcHDCSPB8oiIHMUKvhJO/N4X/ZdtcLiPkFx1Ys0zx/ad4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fuBmMw3m; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuBmMw3m"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-30ab344a1d8so492171a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 22:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747285636; x=1747890436; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwiTOmkTKoyt7CtC8F/0Lkzjv5+/zQ+mG3Ry14XOTVo=;
        b=fuBmMw3mSGkjetahbFfnkkUCRCie5H4xM4vPDq19v4TDGv3TGTlG4xZtm94LpJJFQ1
         6LksgQ8PVH6pwjeh38Zu2rBltapgy3GF3mKJESwYFJvWaZ/7mIaOVA9hEuhtPNu0o0CV
         /JnytqWLtWI9x7BQo6UixwmTlndSeryerIVg4Eh6x5xXEGvKX4R03nRC22vNX+02BrRb
         X3hPdp14ecV57QGJ1rGoShqD7MxgGv7enQLoV5GAFunEtUipdWXYpQQYY0WMuCKdlxO9
         LXgWPkvDByRxdI4X6PkiR/MKBYrxG96TLWgWjWvIPuHcvgAoDdDX0qgPcKwtbcI+3on+
         Epvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747285636; x=1747890436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwiTOmkTKoyt7CtC8F/0Lkzjv5+/zQ+mG3Ry14XOTVo=;
        b=mfnYw25VPIIeYEOyN+CLSl5O1t0om0lhg/l6piQVLqu37+yxbRBtaFLTTIlqPFc+MO
         UGb9I0D8D2g812t/XhztWuby8Cx9z5ivguEmoZOS8cEecIr8hHrFMlw3xeShZtnY+UxE
         4bjelpo/GX7huiwp8KQxbMv5ElygxJCjxhbTy6xnfBcTp6WMzXhKwR7kFnZpdqlNvn+5
         ixMrh8PNX84LBhtZud3k/8BBat1Kny9xdPPeqAQMOY1zXtLmjKrg9yOic+fqjrQgwKDQ
         7rsPKBbNDuI5+/8OgdtV/1lupct4rvsnkTPJzKEyCPu/GSqKtwAMetwpJm1gj1JVZCKm
         sgsA==
X-Forwarded-Encrypted: i=1; AJvYcCWvVBKWhZsTDkdSS0xJ6ffmW0cQay6N7L8egW3cqCnKdLH5OzjSVNepw1sB5kyYrUUX7Hm3qSIQrlW1Eb8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBc/FbVl6mOn21dUCgbQkJDcSQko1BsWWdWu3qXXHoTTTBaYnO
	8TxaN8Zy8sHyfV1bVaqBNqTCP6NsyJduSp0DNQ91M/U0HRZuKY2llCFzRdEi2pZ4Xop/0oZ5Yw1
	FUGqk430YA44OSZ8yhEpWKNBL9wk=
X-Gm-Gg: ASbGnctiq+MqB+H4Il4fk8gCL1KVy2gkdiiFCY4UfWnONWi/0BEo1NsU07uFtk8WyZw
	mzqPMjmpR2KHqVUtFOTHohwsXY+7UIzWSt2AZkKmG9Hse+pJTavg8V6N4UDxj4Sc3DdvTt4rKE3
	koAFVayrUwfh+nKJNlrlj9JfQHJCMoSwidNf7HNcegbIN6hw9roitvrB6higW1WQDZmQ==
X-Google-Smtp-Source: AGHT+IEkAq4pwqgnqJ0Rouj+1JpQZACNVO9O3ooNmAFZIr/hqfBB8oCHRwrwkR+ZmxIefGXwQ2IFnslDox5g2opsdWw=
X-Received: by 2002:a17:90b:3d01:b0:2fe:a545:4c84 with SMTP id
 98e67ed59e1d1-30e2e643b4amr7708120a91.34.1747285635761; Wed, 14 May 2025
 22:07:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514062341.774919-1-noltari@gmail.com> <b11623aeea01338715215084fc34107d@mail.gmail.com>
In-Reply-To: <b11623aeea01338715215084fc34107d@mail.gmail.com>
From: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Date: Thu, 15 May 2025 07:06:39 +0200
X-Gm-Features: AX0GCFtVFOWZPjrNsrc_Qza0CmMMvmiiph05-MQLd-G2CNXa4SUksqw65bpDaxE
Message-ID: <CAKR-sGcg5yCiQFV5yriD+Lv1MiV1wXVQo1_q_Eh-=UNAP-idxA@mail.gmail.com>
Subject: Re: [PATCH v3] mtd: rawnand: brcmnand: legacy exec_op implementation
To: William Zhang <william.zhang@broadcom.com>
Cc: linux-mtd@lists.infradead.org, dregan@broadcom.com, 
	miquel.raynal@bootlin.com, bcm-kernel-feedback-list@broadcom.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, rafal@milecki.pl, 
	computersforpeace@gmail.com, Kamal Dasu <kamal.dasu@broadcom.com>, 
	Dan Beygelman <dan.beygelman@broadcom.com>, frieder.schrempf@kontron.de, 
	linux-kernel@vger.kernel.org, vigneshr@ti.com, richard@nod.at, 
	bbrezillon@kernel.org, kdasu.kdev@gmail.com, jaimeliao.tw@gmail.com, 
	kilobyte@angband.pl, jonas.gorski@gmail.com, dgcbueu@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi William

El jue, 15 may 2025 a las 3:42, William Zhang
(<william.zhang@broadcom.com>) escribi=C3=B3:
>
> Hi Alvaro,
>
> > -----Original Message-----
> > From: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> > Sent: Tuesday, May 13, 2025 11:24 PM
> > To: linux-mtd@lists.infradead.org; dregan@broadcom.com;
> > miquel.raynal@bootlin.com; bcm-kernel-feedback-list@broadcom.com;
> > florian.fainelli@broadcom.com; rafal@milecki.pl;
> > computersforpeace@gmail.com; kamal.dasu@broadcom.com;
> > dan.beygelman@broadcom.com; william.zhang@broadcom.com;
> > frieder.schrempf@kontron.de; linux-kernel@vger.kernel.org;
> > vigneshr@ti.com;
> > richard@nod.at; bbrezillon@kernel.org; kdasu.kdev@gmail.com;
> > jaimeliao.tw@gmail.com; kilobyte@angband.pl; jonas.gorski@gmail.com;
> > dgcbueu@gmail.com
> > Cc: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> > Subject: [PATCH v3] mtd: rawnand: brcmnand: legacy exec_op implementati=
on
> >
> > Commit 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation")
> > removed legacy interface functions, breaking < v5.0 controllers support=
.
> > In order to fix older controllers we need to add an alternative exec_op
> > implementation which doesn't rely on low level registers.
> >
> > Fixes: 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation")
> > Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> > ---
> >  drivers/mtd/nand/raw/brcmnand/brcmnand.c | 178
> > ++++++++++++++++++++++-
> >  1 file changed, 172 insertions(+), 6 deletions(-)
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
> > diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> > b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> > index 17f6d9723df9..f4fabe7ffd9d 100644
> > --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> > +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> > @@ -65,6 +65,7 @@ module_param(wp_on, int, 0444);
> >  #define CMD_PARAMETER_READ           0x0e
> >  #define CMD_PARAMETER_CHANGE_COL     0x0f
> >  #define CMD_LOW_LEVEL_OP             0x10
> > +#define CMD_NOT_SUPPORTED            0xff
> >
> >  struct brcm_nand_dma_desc {
> >       u32 next_desc;
> > @@ -199,6 +200,30 @@ static const u16 flash_dma_regs_v4[] =3D {
> >       [FLASH_DMA_CURRENT_DESC_EXT]    =3D 0x34,
> >  };
> >
> > +/* Native command conversion */
> > +static const u8 native_cmd_conv[] =3D {
> > +     [NAND_CMD_READ0]        =3D CMD_NOT_SUPPORTED,
> > +     [NAND_CMD_READ1]        =3D CMD_NOT_SUPPORTED,
> > +     [NAND_CMD_RNDOUT]       =3D CMD_PARAMETER_CHANGE_COL,
> > +     [NAND_CMD_PAGEPROG]     =3D CMD_NOT_SUPPORTED,
> > +     [NAND_CMD_READOOB]      =3D CMD_NOT_SUPPORTED,
> > +     [NAND_CMD_ERASE1]       =3D CMD_BLOCK_ERASE,
> > +     [NAND_CMD_STATUS]       =3D CMD_NOT_SUPPORTED,
> Do we not need to support nand_status_op()?

We do, but NAND_CMD_STATUS and NAND_CMD_RESET are handled in brcmnand_exec_=
op():
https://github.com/torvalds/linux/blob/546bce579204685a0b204beebab98c3aa496=
e651/drivers/mtd/nand/raw/brcmnand/brcmnand.c#L2506-L2523



>
> > +     [NAND_CMD_SEQIN]        =3D CMD_NOT_SUPPORTED,
> > +     [NAND_CMD_RNDIN]        =3D CMD_NOT_SUPPORTED,
> > +     [NAND_CMD_READID]       =3D CMD_DEVICE_ID_READ,
> > +     [NAND_CMD_ERASE2]       =3D CMD_NULL,
> > +     [NAND_CMD_PARAM]        =3D CMD_PARAMETER_READ,
> > +     [NAND_CMD_GET_FEATURES] =3D CMD_NOT_SUPPORTED,
> > +     [NAND_CMD_SET_FEATURES] =3D CMD_NOT_SUPPORTED,
> > +     [NAND_CMD_RESET]        =3D CMD_NOT_SUPPORTED,
> > +     [NAND_CMD_READSTART]    =3D CMD_NOT_SUPPORTED,
> > +     [NAND_CMD_READCACHESEQ] =3D CMD_NOT_SUPPORTED,
> > +     [NAND_CMD_READCACHEEND] =3D CMD_NOT_SUPPORTED,
> > +     [NAND_CMD_RNDOUTSTART]  =3D CMD_NULL,
> > +     [NAND_CMD_CACHEDPROG]   =3D CMD_NOT_SUPPORTED,
> > +};
> > +
> >  /* Controller feature flags */
> >  enum {
> >       BRCMNAND_HAS_1K_SECTORS                 =3D BIT(0),
> > @@ -237,6 +262,10 @@ struct brcmnand_controller {
> >       /* List of NAND hosts (one for each chip-select) */
> >       struct list_head host_list;
> >
> > +     /* Function to be called from exec_op */
> > +     int (*exec_instr)(struct nand_chip *chip,
> > +                       const struct nand_operation *op);
> > +
> >       /* EDU info, per-transaction */
> >       const u16               *edu_offsets;
> >       void __iomem            *edu_base;
> > @@ -2490,14 +2519,149 @@ static int brcmnand_op_is_reset(const struct
> > nand_operation *op)
> >       return 0;
> >  }
> >
> > +static int brcmnand_exec_instructions(struct nand_chip *chip,
> > +                                   const struct nand_operation *op)
> > +{
> > +     struct brcmnand_host *host =3D nand_get_controller_data(chip);
> > +     unsigned int i;
> > +     int ret =3D 0;
> > +
> > +     for (i =3D 0; i < op->ninstrs; i++) {
> > +             ret =3D brcmnand_exec_instr(host, i, op);
> > +             if (ret)
> > +                     break;
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +static int brcmnand_exec_instructions_legacy(struct nand_chip *chip,
> > +                                          const struct nand_operation =
*op)
> > +{
> > +     struct mtd_info *mtd =3D nand_to_mtd(chip);
> > +     struct brcmnand_host *host =3D nand_get_controller_data(chip);
> > +     struct brcmnand_controller *ctrl =3D host->ctrl;
> > +     const struct nand_op_instr *instr;
> > +     unsigned int i, j;
> > +     u8 cmd =3D CMD_NULL, last_cmd =3D CMD_NULL;
> > +     int ret =3D 0;
> > +     u64 last_addr;
> > +
> > +     for (i =3D 0; i < op->ninstrs; i++) {
> > +             instr =3D &op->instrs[i];
> > +
> > +             if (instr->type =3D=3D NAND_OP_CMD_INSTR) {
> > +                     cmd =3D native_cmd_conv[instr->ctx.cmd.opcode];
> > +                     if (cmd =3D=3D CMD_NOT_SUPPORTED) {
> > +                             dev_err(ctrl->dev, "unsupported cmd=3D%d\=
n",
> > +                                     instr->ctx.cmd.opcode);
> > +                             ret =3D -EOPNOTSUPP;
> > +                             break;
> > +                     }
> > +             } else if (instr->type =3D=3D NAND_OP_ADDR_INSTR) {
> > +                     u64 addr =3D 0;
> > +
> > +                     if (cmd =3D=3D CMD_NULL)
> > +                             continue;
> > +
> > +                     if (instr->ctx.addr.naddrs > 8) {
> > +                             dev_err(ctrl->dev, "unsupported naddrs=3D=
%u\n",
> > +                                     instr->ctx.addr.naddrs);
> > +                             ret =3D -EOPNOTSUPP;
> > +                             break;
> > +                     }
> > +
> > +                     for (j =3D 0; j < instr->ctx.addr.naddrs; j++)
> > +                             addr |=3D (instr->ctx.addr.addrs[j]) << (=
j << 3);
> > +
> > +                     if (cmd =3D=3D CMD_BLOCK_ERASE)
> > +                             addr <<=3D chip->page_shift;
> > +                     else if (cmd =3D=3D CMD_PARAMETER_CHANGE_COL)
> > +                             addr &=3D ~((u64)(FC_BYTES - 1));
> > +
> > +                     brcmnand_set_cmd_addr(mtd, addr);
> > +                     brcmnand_send_cmd(host, cmd);
> > +                     last_addr =3D addr;
> > +                     last_cmd =3D cmd;
> > +                     cmd =3D CMD_NULL;
> > +                     brcmnand_waitfunc(chip);
> > +
> > +                     if (last_cmd =3D=3D CMD_PARAMETER_READ ||
> > +                         last_cmd =3D=3D CMD_PARAMETER_CHANGE_COL) {
> > +                             /* Copy flash cache word-wise */
> > +                             u32 *flash_cache =3D (u32 *)ctrl->flash_c=
ache;
> > +
> > +                             brcmnand_soc_data_bus_prepare(ctrl->soc, =
true);
> > +
> > +                             /*
> > +                              * Must cache the FLASH_CACHE now, since
> > changes in
> > +                              * SECTOR_SIZE_1K may invalidate it
> > +                              */
> > +                             for (j =3D 0; j < FC_WORDS; j++)
> > +                                     /*
> > +                                      * Flash cache is big endian for =
parameter
> > pages, at
> > +                                      * least on STB SoCs
> > +                                      */
> > +                                     flash_cache[j] =3D
> > be32_to_cpu(brcmnand_read_fc(ctrl, j));
> > +
> > +                             brcmnand_soc_data_bus_unprepare(ctrl->soc=
,
> > true);
> > +                     }
> > +             } else if (instr->type =3D=3D NAND_OP_DATA_IN_INSTR) {
> > +                     u8 *in =3D instr->ctx.data.buf.in;
> > +
> > +                     if (last_cmd =3D=3D CMD_DEVICE_ID_READ) {
> > +                             u32 val;
> > +
> > +                             if (instr->ctx.data.len > 8) {
> > +                                     dev_err(ctrl->dev, "unsupported
> > len=3D%u\n",
> > +                                             instr->ctx.data.len);
> > +                                     ret =3D -EOPNOTSUPP;
> > +                                     break;
> > +                             }
> > +
> > +                             for (j =3D 0; j < instr->ctx.data.len; j+=
+) {
> > +                                     if (j =3D=3D 0)
> > +                                             val =3D brcmnand_read_reg=
(ctrl,
> > BRCMNAND_ID);
> > +                                     else if (j =3D=3D 4)
> > +                                             val =3D brcmnand_read_reg=
(ctrl,
> > BRCMNAND_ID_EXT);
> > +
> > +                                     in[j] =3D (val >> (24 - ((j % 4) =
<< 3))) & 0xff;
> > +                             }
> > +                     } else if (last_cmd =3D=3D CMD_PARAMETER_READ ||
> > +                                last_cmd =3D=3D CMD_PARAMETER_CHANGE_C=
OL) {
> > +                             u64 addr;
> > +                             u32 offs;
> > +
> > +                             for (j =3D 0; j < instr->ctx.data.len; j+=
+) {
> > +                                     addr =3D last_addr + j;
> > +                                     offs =3D addr & (FC_BYTES - 1);
> > +
> > +                                     if (j > 0 && offs =3D=3D 0)
> > +
> >       nand_change_read_column_op(chip, addr, NULL, 0,
> > +                                                                      =
  false);
> > +
> > +                                     in[j] =3D ctrl->flash_cache[offs]=
;
> > +                             }
> > +                     }
> > +             } else if (instr->type =3D=3D NAND_OP_WAITRDY_INSTR) {
> > +                     ret =3D bcmnand_ctrl_poll_status(host, NAND_CTRL_=
RDY,
> > NAND_CTRL_RDY, 0);
> > +             } else {
> > +                     dev_err(ctrl->dev, "unsupported instruction type:=
 %d\n",
> > instr->type);
> > +                     ret =3D -EINVAL;
> > +             }
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> >  static int brcmnand_exec_op(struct nand_chip *chip,
> >                           const struct nand_operation *op,
> >                           bool check_only)
> >  {
> >       struct brcmnand_host *host =3D nand_get_controller_data(chip);
> > +     struct brcmnand_controller *ctrl =3D host->ctrl;
> >       struct mtd_info *mtd =3D nand_to_mtd(chip);
> >       u8 *status;
> > -     unsigned int i;
> >       int ret =3D 0;
> >
> >       if (check_only)
> > @@ -2525,11 +2689,7 @@ static int brcmnand_exec_op(struct nand_chip *ch=
ip,
> >       if (op->deassert_wp)
> >               brcmnand_wp(mtd, 0);
> >
> > -     for (i =3D 0; i < op->ninstrs; i++) {
> > -             ret =3D brcmnand_exec_instr(host, i, op);
> > -             if (ret)
> > -                     break;
> > -     }
> > +     ctrl->exec_instr(chip, op);
> >
> >       if (op->deassert_wp)
> >               brcmnand_wp(mtd, 1);
> > @@ -3142,6 +3302,12 @@ int brcmnand_probe(struct platform_device *pdev,
> > struct brcmnand_soc *soc)
> >       if (ret)
> >               goto err;
> >
> > +     /* Only v5.0+ controllers have low level ops support */
> > +     if (ctrl->nand_version >=3D 0x0500)
> > +             ctrl->exec_instr =3D brcmnand_exec_instructions;
> > +     else
> > +             ctrl->exec_instr =3D brcmnand_exec_instructions_legacy;
> > +
> >       /*
> >        * Most chips have this cache at a fixed offset within 'nand' blo=
ck.
> >        * Some must specify this region separately.
> > --
> > 2.39.5

BTW, can anyone from Broadcom confirm any of the following?
1. There are no low level registers on v2.1 and v2.2 controllers.
2. Do low level registers exist on v4.0 controllers? They are defined
on 63268_map_part.h but the NAND drivers I could find never use them.
3. Are the low level registers bugged on v4.0 controllers?
4. Should the low level registers be handled differently on v4.0 controller=
s?
The issue is that trying to use them on v4.0 controllers for
GET_FEATURES would leave the NAND controller in a weird state that
results in hangs or timeouts while trying to read the NAND.
This happens on the Sercomm H500-s, which is a BCM63268 with a
Macronix NAND that tries to unlock through ONFI.

Best regards,
=C3=81lvaro.
