Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092D310942
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 20:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747600493; cv=none; b=ZRSogG9v7smLvRZm2u1cohHDF+63y1awHcQ8e44LInl9vblM3z544g+9sN2SKwb29zW+MYPrHEiwqzHwAHCbZqNfFX5wjVZTRob+5+sEpRMFDUKYfi2N/ZRH6UnY7kz0Eqw+FxwMcsJuwwVM/FsqE5HRI46y+2Hf2fYDZPmATuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747600493; c=relaxed/simple;
	bh=WSsNm01pxkeftF3NCITGa6J1OdqzEuuSG7CXdoDV7gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F2yWd6J713O125v/lWvVZKTAkcC3ttdNvpdpiywJXGktLvHp4Dg1oNl+stZv0A9J+AwMfUXa03PqrstZmXFAZ8T85oDhL/uYFucV8kjk36vsAK9EqLq7dainPkpqEJi+f4c6/nqQtVnuSf7hBDOVG7IX8T5DmVRHCD4PKUK5ank=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JG7XNDgD; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JG7XNDgD"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-30f0d8628c8so50485a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 13:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747600491; x=1748205291; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWhNfCK4LdUuP3r7G4UlkaN5kQmi7d0prUgJmFJpIeA=;
        b=JG7XNDgDIqcn7EhUQ/dPePK3gAFzP6/QC4gYTpIjkSITaxIhu0Yb5CHaybz6p3qKRI
         7dazSaBX1K0jW+OiLX7fizJye3FJIp9gTFBgvg1X6ucdfQffIVy976Vhufd9b1UaNvh1
         V0IM6SHHQVQDngH+YTa4BZQeaiXHGVx/2CWZKhJRs06uwEV3DewKzjHV2dHPSMilv/Dy
         J26JT2BxyAc9IlHaNlg6LdhRJcbVXJO1IhTqElm1xIgG9/eYIsh7vLDyrfDX6Ob3fA71
         ce+RoyMmJmZOv6b+pYgILt5LMhTqYm9jv97uKZqltI0p6m28mMbPh+C+3KDNyD56Jj+U
         ANKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747600491; x=1748205291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EWhNfCK4LdUuP3r7G4UlkaN5kQmi7d0prUgJmFJpIeA=;
        b=avZdp0dzOY26qNc/KtXuHDuuwBPX/YaN3Iq+MpmUpYYldRLb1jYUqgbbU1mH4UW5e/
         pVLujnP4ynuIar2B54sgPjrWAv1OL7felIaJ6Q9bpaKQZrm2FUXNjWsRqjF1VpWpZx+K
         ocf1JXmpO6M0BTGd+f0iK5Cx/5ypoOTY/tcEnaXGTQ/ra1LI0QrQvi12wshrVxlFQ1tj
         0t1DuWH07dKoPUCw0FFEI/iEfLqbB9yHPOQ1T82DnBsTx+lOv72aCzxcUzllokRyHRbp
         sfoJd8VJF7qtzlaCn475sVTO0Vi++HCdUMUPH/mpSeZW1adOarKSa5ppAA+KaJzLf0u3
         xZ5A==
X-Forwarded-Encrypted: i=1; AJvYcCXHH6PG8mc5yuv0/SbFuzsnUq0CtVF23Jt5Eg0MyQzbMiO9mfAINmAJz20Vbtf9MntPAQr6UlqI8OBZp18=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+ENVjzkCxvMtHlyPEYCDoDyzn7h5llKFDVvThv6D5CqmFuQNO
	oNOlp3kNNYbH4UmqXkptXQEXd1ZaUHBfery21Vya0PhKHX7G93MKNJeGPE6fwB85wnnmmzMuIWQ
	uwYKTYYK3gXKrT0O00udZzkSTVDl2ZAY=
X-Gm-Gg: ASbGncsqSoeg/75zVryc5+W6QeBNBz4VQ9sM0Osid5E+f5wOulh6BHnHOU5suSuoqpu
	MQVgW16KwBG1iVEhGzwABjdT37Zby5rsDs4s6mFMki48JZ/urtXlLWXWAeGV/9tUvXBupWEY0mc
	adaZ2dcrJcK75u4h5sQanfgP8t7nwHPOMvIZXANcTvBEbAJXROzBvBzlgq2CH4Ztm4vUArJzpWk
	5Op
X-Google-Smtp-Source: AGHT+IHEp5gFBOTlrC1gFe3XsvR8vSroE5NqTQqNjLnr0QWv5krnL8KC2quosC5pX4/eNyFWy+5I0xYkXAQrBFPR4dA=
X-Received: by 2002:a17:90a:d443:b0:30a:3e8e:ea30 with SMTP id
 98e67ed59e1d1-30e4dbb703cmr20309842a91.11.1747600491006; Sun, 18 May 2025
 13:34:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515050759.1016697-1-noltari@gmail.com> <87o6vsd3tb.fsf@bootlin.com>
In-Reply-To: <87o6vsd3tb.fsf@bootlin.com>
From: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Date: Sun, 18 May 2025 22:34:18 +0200
X-Gm-Features: AX0GCFueMbRuv_RmP-te6KhcSEUkExFNQiwMHNEtyly-HvLbWYtEfOPF5gZn4DY
Message-ID: <CAKR-sGfyHRzN5s8K10=g=kT_j2KLvfMSYyoPsLN_Q2n7pOhp+A@mail.gmail.com>
Subject: Re: [PATCH v4] mtd: rawnand: brcmnand: legacy exec_op implementation
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

Hi Miquel,

El vie, 16 may 2025 a las 16:32, Miquel Raynal
(<miquel.raynal@bootlin.com>) escribi=C3=B3:
>
> Hello Alvaro,
>
> On 15/05/2025 at 07:07:59 +02, =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@=
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
>
> Since you have a precise list of what is supported and what's not, I'd
> have expected the rest of the behavior to be identical. Are these
> controllers so different in how to program them? Can't we use the
> existing exec_op() implementation without some of the opcodes?

As David confirmed, the low level operation registers aren't working
on v4.0 controllers and they don't even exist on v2.1/2.2 controllers.
BTW, I don't have a precise list of what's supported, I'm just playing
trial and error here in order to get older controllers working again.

>
>
> > +/* Native command conversion */
>
> Should mention "legacy" somewhere I guess, and even what legacy means in
> this context, which is version(controller) < XXX.

Ok, I will add it on v5.

>
> > +static const u8 native_cmd_conv[] =3D {
> > +     [NAND_CMD_READ0]        =3D CMD_NOT_SUPPORTED,
> > +     [NAND_CMD_READ1]        =3D CMD_NOT_SUPPORTED,
> > +     [NAND_CMD_RNDOUT]       =3D CMD_PARAMETER_CHANGE_COL,
> > +     [NAND_CMD_PAGEPROG]     =3D CMD_NOT_SUPPORTED,
> > +     [NAND_CMD_READOOB]      =3D CMD_NOT_SUPPORTED,
> > +     [NAND_CMD_ERASE1]       =3D CMD_BLOCK_ERASE,
> > +     [NAND_CMD_STATUS]       =3D CMD_NOT_SUPPORTED,
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
> > @@ -2490,14 +2519,152 @@ static int brcmnand_op_is_reset(const struct n=
and_operation *op)
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
>
> Could we use a switch case here? Seems more appropriate.

I would rather keep this as an if/else in order to prevent more
indentation or having to define the variables on top.

>
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
>
> Waitfunc is a legacy interface, are you sure this is the correct
> function call here?

I guess this is correct because brcmnand_waitfunc is still used after
each brcmnand_send_cmd call that we still have on the current code...

>
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
> > +                              * Must cache the FLASH_CACHE now, since =
changes in
> > +                              * SECTOR_SIZE_1K may invalidate it
> > +                              */
> > +                             for (j =3D 0; j < FC_WORDS; j++)
> > +                                     /*
> > +                                      * Flash cache is big endian for =
parameter pages, at
> > +                                      * least on STB SoCs
> > +                                      */
> > +                                     flash_cache[j] =3D be32_to_cpu(br=
cmnand_read_fc(ctrl, j));
> > +
> > +                             brcmnand_soc_data_bus_unprepare(ctrl->soc=
, true);
> > +                     }
> > +             } else if (instr->type =3D=3D NAND_OP_DATA_IN_INSTR) {
> > +                     u8 *in =3D instr->ctx.data.buf.in;
> > +
> > +                     if (last_cmd =3D=3D CMD_DEVICE_ID_READ) {
> > +                             u32 val;
> > +
> > +                             if (instr->ctx.data.len > 8) {
> > +                                     dev_err(ctrl->dev, "unsupported l=
en=3D%u\n",
> > +                                             instr->ctx.data.len);
> > +                                     ret =3D -EOPNOTSUPP;
> > +                                     break;
> > +                             }
> > +
> > +                             for (j =3D 0; j < instr->ctx.data.len; j+=
+) {
> > +                                     if (j =3D=3D 0)
> > +                                             val =3D brcmnand_read_reg=
(ctrl, BRCMNAND_ID);
> > +                                     else if (j =3D=3D 4)
> > +                                             val =3D brcmnand_read_reg=
(ctrl, BRCMNAND_ID_EXT);
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
> > +                                             nand_change_read_column_o=
p(chip, addr, NULL, 0,
> > +                                                                      =
  false);
> > +
> > +                                     in[j] =3D ctrl->flash_cache[offs]=
;
> > +                             }
> > +                     }
> > +             } else if (instr->type =3D=3D NAND_OP_WAITRDY_INSTR) {
> > +                     ret =3D bcmnand_ctrl_poll_status(host, NAND_CTRL_=
RDY, NAND_CTRL_RDY, 0);
> > +                     if (ret)
> > +                             break;
> > +             } else {
> > +                     dev_err(ctrl->dev, "unsupported instruction type:=
 %d\n", instr->type);
> > +                     ret =3D -EINVAL;
>
> EOPNOTSUPP I guess?

Ok, I will change that on v5.

>
> > +                     break;
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
> [adding one more context line]
>                  return 0;
>
> There is a lot that is unsupported, and this is okay, but you need to
> control all these earlier and implement a function that does all the
> checks when exec_op() is called with the check_only parameter set (just
> above). The support for the old SoCs *must* not return 0 by default and
> instead check the validity of the op when requested.

Ok, I will add that in v5.

>
> > @@ -2525,11 +2692,7 @@ static int brcmnand_exec_op(struct nand_chip *ch=
ip,
> >       if (op->deassert_wp)
> >               brcmnand_wp(mtd, 0);
> >
> > -     for (i =3D 0; i < op->ninstrs; i++) {
> > -             ret =3D brcmnand_exec_instr(host, i, op);
> > -             if (ret)
> > -                     break;
> > -     }
> > +     ret =3D ctrl->exec_instr(chip, op);
> >
> >       if (op->deassert_wp)
> >               brcmnand_wp(mtd, 1);
> > @@ -3142,6 +3305,12 @@ int brcmnand_probe(struct platform_device *pdev,=
 struct brcmnand_soc *soc)
> >       if (ret)
> >               goto err;
> >
> > +     /* Only v5.0+ controllers have low level ops support */
> > +     if (ctrl->nand_version >=3D 0x0500)
>
> Did I just read that 4 or 4.1 was the correct boundary instead of 5?

David has confirmed that this is correct.

>
> > +             ctrl->exec_instr =3D brcmnand_exec_instructions;
> > +     else
> > +             ctrl->exec_instr =3D brcmnand_exec_instructions_legacy;
> > +
> >       /*
> >        * Most chips have this cache at a fixed offset within 'nand' blo=
ck.
> >        * Some must specify this region separately.
>
> Thanks,
> Miqu=C3=A8l
