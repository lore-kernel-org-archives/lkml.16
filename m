Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2330A223710
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748019763; cv=none; b=ZG4s4JFpVMdh2f6CJNlqGCh2PDoEQmXboKSWZ6APkN4ULk52volTcdWpVYnPtI1mYB5J5NDpfvQGRcKjS0Wn0n4rUjPmVmEnPwStecqF/meNuHwwdYCHCqchnQljkJd0aksc4kWatFQH3w1z7268rLHwXkPKu7s2T5GYbRIYPnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748019763; c=relaxed/simple;
	bh=TJjGIgp8MsqpjAsSk7Ic1hO/PZ/rdAHh6OJg32+mQig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VnxYYtQv4Ub1VliGZq+iOJKiwpx6Le5fGR+CnhA/gawsZBln3vmdg0bQw0YU7luErT7ZkeXweBjo8n/E4BTj9DHc8+OyFLgozcvDfhXcMHBtLysjnQQcLWtEVjTMOn67muC8efABMkiqoKC8D99aRVdgg4ZnAI/Gzc2ZotT6dnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=QKsPhlpq; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="QKsPhlpq"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-742a6f94f4aso27661b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748019761; x=1748624561; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MY8lTPJOsiUsHLg6F+w+QXIZRwaDibEsHnrAq4Ix5us=;
        b=QKsPhlpqFcPH8Rqe6oTl2jwob7jr5g0naTHhhSLhKe9a4GgC9Vs6S/yOT9iWs5IYT7
         2vSg2DbZwUj7XvVBNqbMbEeXBZDUGDmproKiNJdaPxZLlvuOj+iPVaLCjx6lNjm6ankW
         uVCFVe6366XE/M6eJOCToZg0/JdOS/16gIeac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748019761; x=1748624561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MY8lTPJOsiUsHLg6F+w+QXIZRwaDibEsHnrAq4Ix5us=;
        b=WoXsrD062Ik/4yCFVcUSdYlLB0Qts484JLrRGg7Bx6VO19YT4ICKtUc/LsQf4+H2dZ
         UUBTvfVmiJv1qQKZeoNOqDhpb1TRZmxRF4sdyTD4Rr177j8LoS4bvX4DkSym2X6LWWZx
         OHQhJi1iq7WE/Q15Dee65AB+OOxFjLlxA2NAv1zpykV7+ynkNwFvplq08DW1mSflv0vb
         4MrWuHH9HT8tHnbR2sHqYJZk/zheYavliRIbUqwZWXtoBDSbYIAHQyKW3dYuHaeFVnqb
         /2vEEyxd1czI8ORUloKHiElzfC0t9Tj/2sL+CoeK/SOYBuZpC/B6oFZoaf7IkmqhjL4c
         1cMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkDgPQh2VtC2sW8rdLkVNRUBE31hLpslMW9SMIIY4F+e/1BRXBApTcZTpTkoJPCDImSzUn9DYoM/qG2UI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOUlWzyj/KFjwqrQ2z5m9Mho+em75ntMirGoXQc9C9LdM7pEVf
	ycHqi29T1vKr/itAMrW5Ix6h4H4uooZtzabwGfD9fa8nxLVpAOPJgEewCCjizGhyiBaToB+rXxI
	swmDzJbIIKr+mUnouxIbUuXsEWR02Y5Rw/eZh902J
X-Gm-Gg: ASbGncujSOO8YgSHmX9YaXqKlPebPFH0PKgbF7MECQSNggmDOPHGPhNI0lJXZKECCxK
	rGheJYdu+rj12nIx0aH3y95jOcmzaBdceR95+ksryi/5h5kuycYquCk1ZB1K3FaAFgkdMHVL9TX
	Pmk6igYlOW9NOzC4EpHimbnG96zLx/pK885Q==
X-Google-Smtp-Source: AGHT+IFQF9KO0X5zZLm1ioD9SWuR2AHzlvLfWehjusjT4hWfoTiUtuL37CZl2msia+Sbqe7XwM5jY9iwmITdltW46AI=
X-Received: by 2002:a05:6a21:790:b0:20e:f37e:14 with SMTP id
 adf61e73a8af0-2187c2e42a4mr2066392637.10.1748019761103; Fri, 23 May 2025
 10:02:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521080325.581366-1-noltari@gmail.com>
In-Reply-To: <20250521080325.581366-1-noltari@gmail.com>
From: David Regan <dregan@broadcom.com>
Date: Fri, 23 May 2025 10:02:30 -0700
X-Gm-Features: AX0GCFsIxy3wt3pDNmRTYww4_BlZJwM6ZkaR9KIWuon4uh8Y-EATMWy5vJ-ZM7I
Message-ID: <CAA_RMS7zKOy2w4fw=nbq0rJ8MnO1W_W3fB3WDgxcUCpEP10fnA@mail.gmail.com>
Subject: Re: [PATCH v5] mtd: rawnand: brcmnand: legacy exec_op implementation
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc: linux-mtd@lists.infradead.org, dregan@broadcom.com, 
	miquel.raynal@bootlin.com, bcm-kernel-feedback-list@broadcom.com, 
	florian.fainelli@broadcom.com, rafal@milecki.pl, computersforpeace@gmail.com, 
	kamal.dasu@broadcom.com, dan.beygelman@broadcom.com, 
	william.zhang@broadcom.com, frieder.schrempf@kontron.de, 
	linux-kernel@vger.kernel.org, vigneshr@ti.com, richard@nod.at, 
	bbrezillon@kernel.org, kdasu.kdev@gmail.com, jaimeliao.tw@gmail.com, 
	kilobyte@angband.pl, jonas.gorski@gmail.com, dgcbueu@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi =C3=81lvaro,

On Wed, May 21, 2025 at 1:03=E2=80=AFAM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:
>
> Commit 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation")
> removed legacy interface functions, breaking < v5.0 controllers support.
> In order to fix older controllers we need to add an alternative exec_op
> implementation which doesn't rely on low level registers.
>
> Fixes: 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation")
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Reviewed-by: David Regan <dregan@broadcom.com>
> ---
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c | 222 ++++++++++++++++++++++-
>  1 file changed, 215 insertions(+), 7 deletions(-)
>
>  v5: add changes requested by Miqu=C3=A8l Raynal:
>   - Mention and explain legacy in native_cmd_conv.
>   - EOPNOTSUPP instead of EINVAL for instr->type else.
>   - Implement missing check_only functionality.
>
>  v4: add changes requested by Jonas Gorski:
>   - Add missing breaks in brcmnand_exec_instructions_legacy.
>   - Restore missing ret assignment in brcmnand_exec_op.
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
> index 299dd2bca5b4..5ed79ffa271c 100644
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
> +/* Native command conversion for legacy controllers (< v5.0) */
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
> @@ -237,6 +262,12 @@ struct brcmnand_controller {
>         /* List of NAND hosts (one for each chip-select) */
>         struct list_head host_list;
>
> +       /* Functions to be called from exec_op */
> +       int (*check_instr)(struct nand_chip *chip,
> +                          const struct nand_operation *op);
> +       int (*exec_instr)(struct nand_chip *chip,
> +                         const struct nand_operation *op);
> +
>         /* EDU info, per-transaction */
>         const u16               *edu_offsets;
>         void __iomem            *edu_base;
> @@ -2478,18 +2509,190 @@ static int brcmnand_op_is_reset(const struct nan=
d_operation *op)
>         return 0;
>  }
>
> +static int brcmnand_check_instructions(struct nand_chip *chip,
> +                                      const struct nand_operation *op)
> +{
> +       return 0;
> +}
> +
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
> +static int brcmnand_check_instructions_legacy(struct nand_chip *chip,
> +                                             const struct nand_operation=
 *op)
> +{
> +       const struct nand_op_instr *instr;
> +       unsigned int i;
> +       u8 cmd;
> +
> +       for (i =3D 0; i < op->ninstrs; i++) {
> +               instr =3D &op->instrs[i];
> +
> +               switch (instr->type) {
> +               case NAND_OP_CMD_INSTR:
> +                       cmd =3D native_cmd_conv[instr->ctx.cmd.opcode];
> +                       if (cmd =3D=3D CMD_NOT_SUPPORTED)
> +                               return -EOPNOTSUPP;
> +                       break;
> +               case NAND_OP_ADDR_INSTR:
> +               case NAND_OP_DATA_IN_INSTR:
> +               case NAND_OP_WAITRDY_INSTR:
> +                       break;
> +               default:
> +                       return -EOPNOTSUPP;
> +               }
> +       }
> +
> +       return 0;
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

Forgot to mention, not critical, but if you end up releasing a follow
on patch could you
please put braces around this part?

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
> +                       if (ret)
> +                               break;
> +               } else {
> +                       dev_err(ctrl->dev, "unsupported instruction type:=
 %d\n", instr->type);
> +                       ret =3D -EOPNOTSUPP;
> +                       break;
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
> -               return 0;
> +               return ctrl->check_instr(chip, op);
>
>         if (brcmnand_op_is_status(op)) {
>                 status =3D op->instrs[1].ctx.data.buf.in;
> @@ -2513,11 +2716,7 @@ static int brcmnand_exec_op(struct nand_chip *chip=
,
>         if (op->deassert_wp)
>                 brcmnand_wp(mtd, 0);
>
> -       for (i =3D 0; i < op->ninstrs; i++) {
> -               ret =3D brcmnand_exec_instr(host, i, op);
> -               if (ret)
> -                       break;
> -       }
> +       ret =3D ctrl->exec_instr(chip, op);
>
>         if (op->deassert_wp)
>                 brcmnand_wp(mtd, 1);
> @@ -3130,6 +3329,15 @@ int brcmnand_probe(struct platform_device *pdev, s=
truct brcmnand_soc *soc)
>         if (ret)
>                 goto err;
>
> +       /* Only v5.0+ controllers have low level ops support */
> +       if (ctrl->nand_version >=3D 0x0500) {
> +               ctrl->check_instr =3D brcmnand_check_instructions;
> +               ctrl->exec_instr =3D brcmnand_exec_instructions;
> +       } else {
> +               ctrl->check_instr =3D brcmnand_check_instructions_legacy;
> +               ctrl->exec_instr =3D brcmnand_exec_instructions_legacy;
> +       }
> +
>         /*
>          * Most chips have this cache at a fixed offset within 'nand' blo=
ck.
>          * Some must specify this region separately.
> --
> 2.39.5
>

Reviewed-by: David Regan <dregan@broadcom.com>

Thanks!

-Dave
