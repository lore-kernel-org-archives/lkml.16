Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F68196C7C
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 18:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747246341; cv=none; b=mmm0kYfTlxuiKTD+y0hofgkv0AB852ohFU4wRinrDRvjZ1itiQ1kX5/MJ0uSnjOAg1t4suTdISzFlYjhMbHhQNq6gkqKgxy59gRDptmSi3f8NJY3Xyp+We6nb1ucMWM8INV/GAtmv1R4+t7oPkDDT7qcbhZp/FSUSsZYYQi7klk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747246341; c=relaxed/simple;
	bh=gi5nSIvf5C+5BfvwX3RKfwsJVFRMtoxSfLJcqLq12vo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=noYxp5oV+shPTmEww/F/8JLu1llepo0gmgsMBFUIslNXZr4aOimtCm3LCyNEmWo+yglMYFq2GlkT6ZDKIUcCB++4zrNNHS/8sd4Pv8SMVRf05AQQnPxb2gJ1THxzaKZSMYo1rKLK4Ezlqv5gGkfOSv9BtAktZH8OJtM8HHckfEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtECPhT2; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtECPhT2"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7086dcab64bso848937b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 11:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747246336; x=1747851136; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gu6FJWX9Z5qDSrYHcwCyqqMTlQW5GxqSFu3qqdEDqY=;
        b=WtECPhT236WJ9UedKNOpoeeABBj8cn6jQKKuLF+aQl4nWr42TS2ztEb37BHRtRXDSR
         fhMwmqEGqHGzzWziwvaudLAaMnMv/Z/wdJ0nWKi2ppDDdDxJaU9N7ceMXc3RAbuWGJTP
         m/dDvaRNYW9I+Ef5ZVUoN8fbSR5/e1VNZiG7wk/KPkJYL6Y+Yq1WC3HePcw/9H2l8Jcz
         JpkKxipsThFFM/ovz34nnYd4Am4l09p9/YB1ZfrK5aIQ/J6sTfCqSS5Dhkb4Xis26jYq
         JFQ8bQ346RLPXEr+0lSFuI8YWxpJZMtHlVaC+uTQElt2YbrnrquHe5RNCFI9MNwJAzT3
         uO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747246336; x=1747851136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gu6FJWX9Z5qDSrYHcwCyqqMTlQW5GxqSFu3qqdEDqY=;
        b=H/+V8SROSBxrTruyJZ8eSaZnUaHuyeNsJO8ZEKQlvEOAxoDBjDf06qUKNSISRISXNz
         09QtRNL97O+D7zFZTKqnXfeUZUzg8bs1sLsPWhxP6Q+fxbgJrZ1eiiyRQ2oO28Zf3hA5
         aRLTaQK47/bNFY8d9HlPF1KNlVBAJey9kjA/wIZFB08OzffEvK9gIHn4UXnDBap/pJMB
         JZLNxpB/H4eW6keYMdA66JC/v57mbHGtMMpN169SAwCz3lyRoly7vpWJInxhQfZX1FpA
         nJ5vs54Wh1S3IilTy5bbcyGC9lZQy0x/UkXrzqrMG4Pv5vStsVxAOCck9XZdut+yBjbz
         3Avw==
X-Forwarded-Encrypted: i=1; AJvYcCU4yvNOJl7myF7r+WswX8/nNGZa1hdOjwhpVPhLv2H1OgixQdPVv4DKa3joSjdheY8n4NzJXGLSxpUTCkI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy15SJkdySGtVceiF5fjv+FELStM0VY8vTAU+dDLh9QR+4dRS4E
	Q11IGwU9gTdDd6HkR8njQ1uopVaPkvaL2um/uYFJp0fDHCElLZ7UkxE812A7TeIDFw+c2+HBghp
	zDjtAN95lun7BenldKAsjf5YCr4+4CBxV
X-Gm-Gg: ASbGnct5I1Y+CGkeqLcqXsg5NIqcxwJvi4UuCd3bUGsQBSfPXx8IFGJkRJKMlvpeCId
	xvTg7HagdCPQaUnJl9XGIQOB7mEkfeglH5zNZMj26H3tGEk7Q3hTTTsWdERngNySUqqbFQPVk6K
	aI2k3ATKypHMNFkUzBQU9vwWUbx3ibHeY=
X-Google-Smtp-Source: AGHT+IGDX9ZC0232yUtlZqpbwbbbrVmi9lRf2CgWrAQSM1TUSI5rXKWmc2qEqfA7wCXppfmKNfRdoztcvwaCrbZo2sI=
X-Received: by 2002:a05:690c:338d:b0:6fd:359a:8fd2 with SMTP id
 00721157ae682-70c7f224367mr65119447b3.26.1747246336254; Wed, 14 May 2025
 11:12:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514062341.774919-1-noltari@gmail.com>
In-Reply-To: <20250514062341.774919-1-noltari@gmail.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Wed, 14 May 2025 20:12:04 +0200
X-Gm-Features: AX0GCFuZIedrHi8UR7cORnfR1i7wyU_yi6L92E1ApDGcSeq7ajGmswOPggTbPKA
Message-ID: <CAOiHx=nvjcZYjA-FLmTwG3Z-JHTh_7K-mEK2tPWDOb5xomANBA@mail.gmail.com>
Subject: Re: [PATCH v3] mtd: rawnand: brcmnand: legacy exec_op implementation
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc: linux-mtd@lists.infradead.org, dregan@broadcom.com, 
	miquel.raynal@bootlin.com, bcm-kernel-feedback-list@broadcom.com, 
	florian.fainelli@broadcom.com, rafal@milecki.pl, computersforpeace@gmail.com, 
	kamal.dasu@broadcom.com, dan.beygelman@broadcom.com, 
	william.zhang@broadcom.com, frieder.schrempf@kontron.de, 
	linux-kernel@vger.kernel.org, vigneshr@ti.com, richard@nod.at, 
	bbrezillon@kernel.org, kdasu.kdev@gmail.com, jaimeliao.tw@gmail.com, 
	kilobyte@angband.pl, dgcbueu@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 14, 2025 at 8:23=E2=80=AFAM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:
>
> Commit 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation")
> removed legacy interface functions, breaking < v5.0 controllers support.
> In order to fix older controllers we need to add an alternative exec_op
> implementation which doesn't rely on low level registers.
>
> Fixes: 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation")
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> ---
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c | 178 ++++++++++++++++++++++-
>  1 file changed, 172 insertions(+), 6 deletions(-)
>
>  v3: add changes requested by Florian and other improvements:
>   - Add associative array for native command conversion.
>   - Add function pointer to brcmnand_controller for exec_instr
>     functionality.
>   - Fix CMD_BLOCK_ERASE address.
>   - Drop NAND_CMD_READOOB support.
>
>  v2: multiple improvements:
>   - Use proper native commands for checks.
>   - Fix NAND_CMD_PARAM/NAND_CMD_RNDOUT addr calculation.
>   - Remove host->last_addr usage.
>   - Remove sector_size_1k since it only applies to v5.0+ controllers.
>   - Remove brcmnand_wp since it doesn't exist for < v5.0 controllers.
>   - Use j instead of i for flash_cache loop.
>
> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/=
raw/brcmnand/brcmnand.c
> index 17f6d9723df9..f4fabe7ffd9d 100644
> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> @@ -65,6 +65,7 @@ module_param(wp_on, int, 0444);
>  #define CMD_PARAMETER_READ             0x0e
>  #define CMD_PARAMETER_CHANGE_COL       0x0f
>  #define CMD_LOW_LEVEL_OP               0x10
> +#define CMD_NOT_SUPPORTED              0xff
>
>  struct brcm_nand_dma_desc {
>         u32 next_desc;
> @@ -199,6 +200,30 @@ static const u16 flash_dma_regs_v4[] =3D {
>         [FLASH_DMA_CURRENT_DESC_EXT]    =3D 0x34,
>  };
>
> +/* Native command conversion */
> +static const u8 native_cmd_conv[] =3D {
> +       [NAND_CMD_READ0]        =3D CMD_NOT_SUPPORTED,
> +       [NAND_CMD_READ1]        =3D CMD_NOT_SUPPORTED,
> +       [NAND_CMD_RNDOUT]       =3D CMD_PARAMETER_CHANGE_COL,
> +       [NAND_CMD_PAGEPROG]     =3D CMD_NOT_SUPPORTED,
> +       [NAND_CMD_READOOB]      =3D CMD_NOT_SUPPORTED,
> +       [NAND_CMD_ERASE1]       =3D CMD_BLOCK_ERASE,
> +       [NAND_CMD_STATUS]       =3D CMD_NOT_SUPPORTED,
> +       [NAND_CMD_SEQIN]        =3D CMD_NOT_SUPPORTED,
> +       [NAND_CMD_RNDIN]        =3D CMD_NOT_SUPPORTED,
> +       [NAND_CMD_READID]       =3D CMD_DEVICE_ID_READ,
> +       [NAND_CMD_ERASE2]       =3D CMD_NULL,
> +       [NAND_CMD_PARAM]        =3D CMD_PARAMETER_READ,
> +       [NAND_CMD_GET_FEATURES] =3D CMD_NOT_SUPPORTED,
> +       [NAND_CMD_SET_FEATURES] =3D CMD_NOT_SUPPORTED,
> +       [NAND_CMD_RESET]        =3D CMD_NOT_SUPPORTED,
> +       [NAND_CMD_READSTART]    =3D CMD_NOT_SUPPORTED,
> +       [NAND_CMD_READCACHESEQ] =3D CMD_NOT_SUPPORTED,
> +       [NAND_CMD_READCACHEEND] =3D CMD_NOT_SUPPORTED,
> +       [NAND_CMD_RNDOUTSTART]  =3D CMD_NULL,
> +       [NAND_CMD_CACHEDPROG]   =3D CMD_NOT_SUPPORTED,
> +};
> +
>  /* Controller feature flags */
>  enum {
>         BRCMNAND_HAS_1K_SECTORS                 =3D BIT(0),
> @@ -237,6 +262,10 @@ struct brcmnand_controller {
>         /* List of NAND hosts (one for each chip-select) */
>         struct list_head host_list;
>
> +       /* Function to be called from exec_op */
> +       int (*exec_instr)(struct nand_chip *chip,
> +                         const struct nand_operation *op);
> +
>         /* EDU info, per-transaction */
>         const u16               *edu_offsets;
>         void __iomem            *edu_base;
> @@ -2490,14 +2519,149 @@ static int brcmnand_op_is_reset(const struct nan=
d_operation *op)
>         return 0;
>  }
>
> +static int brcmnand_exec_instructions(struct nand_chip *chip,
> +                                     const struct nand_operation *op)
> +{
> +       struct brcmnand_host *host =3D nand_get_controller_data(chip);
> +       unsigned int i;
> +       int ret =3D 0;
> +
> +       for (i =3D 0; i < op->ninstrs; i++) {
> +               ret =3D brcmnand_exec_instr(host, i, op);
> +               if (ret)
> +                       break;
> +       }
> +
> +       return ret;
> +}
> +
> +static int brcmnand_exec_instructions_legacy(struct nand_chip *chip,
> +                                            const struct nand_operation =
*op)
> +{
> +       struct mtd_info *mtd =3D nand_to_mtd(chip);
> +       struct brcmnand_host *host =3D nand_get_controller_data(chip);
> +       struct brcmnand_controller *ctrl =3D host->ctrl;
> +       const struct nand_op_instr *instr;
> +       unsigned int i, j;
> +       u8 cmd =3D CMD_NULL, last_cmd =3D CMD_NULL;
> +       int ret =3D 0;
> +       u64 last_addr;
> +
> +       for (i =3D 0; i < op->ninstrs; i++) {
> +               instr =3D &op->instrs[i];
> +
> +               if (instr->type =3D=3D NAND_OP_CMD_INSTR) {
> +                       cmd =3D native_cmd_conv[instr->ctx.cmd.opcode];
> +                       if (cmd =3D=3D CMD_NOT_SUPPORTED) {
> +                               dev_err(ctrl->dev, "unsupported cmd=3D%d\=
n",
> +                                       instr->ctx.cmd.opcode);
> +                               ret =3D -EOPNOTSUPP;
> +                               break;
> +                       }
> +               } else if (instr->type =3D=3D NAND_OP_ADDR_INSTR) {
> +                       u64 addr =3D 0;
> +
> +                       if (cmd =3D=3D CMD_NULL)
> +                               continue;
> +
> +                       if (instr->ctx.addr.naddrs > 8) {
> +                               dev_err(ctrl->dev, "unsupported naddrs=3D=
%u\n",
> +                                       instr->ctx.addr.naddrs);
> +                               ret =3D -EOPNOTSUPP;
> +                               break;
> +                       }
> +
> +                       for (j =3D 0; j < instr->ctx.addr.naddrs; j++)
> +                               addr |=3D (instr->ctx.addr.addrs[j]) << (=
j << 3);
> +
> +                       if (cmd =3D=3D CMD_BLOCK_ERASE)
> +                               addr <<=3D chip->page_shift;
> +                       else if (cmd =3D=3D CMD_PARAMETER_CHANGE_COL)
> +                               addr &=3D ~((u64)(FC_BYTES - 1));
> +
> +                       brcmnand_set_cmd_addr(mtd, addr);
> +                       brcmnand_send_cmd(host, cmd);
> +                       last_addr =3D addr;
> +                       last_cmd =3D cmd;
> +                       cmd =3D CMD_NULL;
> +                       brcmnand_waitfunc(chip);
> +
> +                       if (last_cmd =3D=3D CMD_PARAMETER_READ ||
> +                           last_cmd =3D=3D CMD_PARAMETER_CHANGE_COL) {
> +                               /* Copy flash cache word-wise */
> +                               u32 *flash_cache =3D (u32 *)ctrl->flash_c=
ache;
> +
> +                               brcmnand_soc_data_bus_prepare(ctrl->soc, =
true);
> +
> +                               /*
> +                                * Must cache the FLASH_CACHE now, since =
changes in
> +                                * SECTOR_SIZE_1K may invalidate it
> +                                */
> +                               for (j =3D 0; j < FC_WORDS; j++)
> +                                       /*
> +                                        * Flash cache is big endian for =
parameter pages, at
> +                                        * least on STB SoCs
> +                                        */
> +                                       flash_cache[j] =3D be32_to_cpu(br=
cmnand_read_fc(ctrl, j));
> +
> +                               brcmnand_soc_data_bus_unprepare(ctrl->soc=
, true);
> +                       }
> +               } else if (instr->type =3D=3D NAND_OP_DATA_IN_INSTR) {
> +                       u8 *in =3D instr->ctx.data.buf.in;
> +
> +                       if (last_cmd =3D=3D CMD_DEVICE_ID_READ) {
> +                               u32 val;
> +
> +                               if (instr->ctx.data.len > 8) {
> +                                       dev_err(ctrl->dev, "unsupported l=
en=3D%u\n",
> +                                               instr->ctx.data.len);
> +                                       ret =3D -EOPNOTSUPP;
> +                                       break;
> +                               }
> +
> +                               for (j =3D 0; j < instr->ctx.data.len; j+=
+) {
> +                                       if (j =3D=3D 0)
> +                                               val =3D brcmnand_read_reg=
(ctrl, BRCMNAND_ID);
> +                                       else if (j =3D=3D 4)
> +                                               val =3D brcmnand_read_reg=
(ctrl, BRCMNAND_ID_EXT);
> +
> +                                       in[j] =3D (val >> (24 - ((j % 4) =
<< 3))) & 0xff;
> +                               }
> +                       } else if (last_cmd =3D=3D CMD_PARAMETER_READ ||
> +                                  last_cmd =3D=3D CMD_PARAMETER_CHANGE_C=
OL) {
> +                               u64 addr;
> +                               u32 offs;
> +
> +                               for (j =3D 0; j < instr->ctx.data.len; j+=
+) {
> +                                       addr =3D last_addr + j;
> +                                       offs =3D addr & (FC_BYTES - 1);
> +
> +                                       if (j > 0 && offs =3D=3D 0)
> +                                               nand_change_read_column_o=
p(chip, addr, NULL, 0,
> +                                                                        =
  false);
> +
> +                                       in[j] =3D ctrl->flash_cache[offs]=
;
> +                               }
> +                       }
> +               } else if (instr->type =3D=3D NAND_OP_WAITRDY_INSTR) {
> +                       ret =3D bcmnand_ctrl_poll_status(host, NAND_CTRL_=
RDY, NAND_CTRL_RDY, 0);

Should here be a check for success and break/abort otherwise so you
don't continue if there are more instructions?

> +               } else {
> +                       dev_err(ctrl->dev, "unsupported instruction type:=
 %d\n", instr->type);
> +                       ret =3D -EINVAL;

Should here be a break so you don't continue if there are more instructions=
?

> +               }
> +       }
> +
> +       return ret;
> +}
> +
>  static int brcmnand_exec_op(struct nand_chip *chip,
>                             const struct nand_operation *op,
>                             bool check_only)
>  {
>         struct brcmnand_host *host =3D nand_get_controller_data(chip);
> +       struct brcmnand_controller *ctrl =3D host->ctrl;
>         struct mtd_info *mtd =3D nand_to_mtd(chip);
>         u8 *status;
> -       unsigned int i;
>         int ret =3D 0;
>
>         if (check_only)
> @@ -2525,11 +2689,7 @@ static int brcmnand_exec_op(struct nand_chip *chip=
,
>         if (op->deassert_wp)
>                 brcmnand_wp(mtd, 0);
>
> -       for (i =3D 0; i < op->ninstrs; i++) {
> -               ret =3D brcmnand_exec_instr(host, i, op);
> -               if (ret)
> -                       break;
> -       }
> +       ctrl->exec_instr(chip, op);

You are ignoring the return value now, so ret will stay at 0 even if
exec_instr() returns an error.

>
>         if (op->deassert_wp)
>                 brcmnand_wp(mtd, 1);

Best regards,
Jonas
