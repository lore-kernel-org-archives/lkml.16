Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F13A23535A
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 17:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747071244; cv=none; b=Fo5BBBkD+giJTl/nHDSY0v1XHsdFjGvsgXyL+B71L9c4gXay2gHRDYlzXJZ2YLbqReVXJdC8AZFxbPyJRddtAHXMF+l7gVgBgyBNUVW1mSV2li7HAmk2UggQqNno4FOo0AMxIyFDUQVaBjuLmdoPGrx+uEWNJfP2lJ4LTc5m+0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747071244; c=relaxed/simple;
	bh=2YWVMIK3XK/lp1Vr+Ggv7PIZlucmRn7NvBJdjk2PBTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Kb71dhgEq8Rq8NbJLxFnjvATFsJYUxwSfIJarbEb1xY9mm1dGFqr8Esf19xbXyWBorPNxPVh+9p8HeDlAClZ8vYOztdDGQWUPSJofUECdYgjkUsldC5viPkOqydmYX6qXBciRUcWzGcE0zGoV4huyt5nXPB7q9DQi4IH1l4jMAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bogn823y; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bogn823y"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7423fadbe77so3202939b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 10:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747071242; x=1747676042; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oYBv6U2tPknvwR6dnoneleSx9dqs2CF9olaCjpbsa8A=;
        b=Bogn823yLwzVUNYYKaXNLPWvEQQzoDYuwbStbNp+dayc7PEdbOS+y0X+lBGjuKCqpN
         UHKj0ovyl5VCnc9Nm39xounMMtvgGzpmqI7JD9yN01WoBVBlw7YGst5z+20mZP2U9WAU
         Q0OhCNwwzrFoyEBLQjgWr4E7ukuQIgaZrI28tAd0T0v706DDLuAXoW8257F7W2eBH2rW
         WrCXwchGZoyvlZMfmqYMJG6P+EapVRlomYiqLWfgar5zVlxe0rEniCq2SgU51aJ5Rh2i
         11KHOyeMvwimZtcyeNNAqwaTnZ8CYYx7Wl+1gqcC5obRVsSipIwU7k94bX5ocDLzmBvD
         ZMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747071242; x=1747676042;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oYBv6U2tPknvwR6dnoneleSx9dqs2CF9olaCjpbsa8A=;
        b=YsaI4aC338dEwUkChGIErimOGIqSmueYJCyWW2uLafgLRb5ZVvb0/y2rk1GIFQVGA8
         ZikgQj6uY4DK8zBXZok+aAZ6MN+2017jskVgNHnZQ634xw/2HO7EWBW+we8hS6q50M+S
         U4ROnrhm9O/qASertp0T1JxthCDQl+PEmXMcQGgaVmaimsD4gg8E6/U1CC7ex1GU1DEn
         i/dY70zWak31ToeR/8Kd4y49axn86VDq2spbG5ZXNO175an7aK+iYumhWkLqnqRqPXj1
         ez7XmfRIYbpZaktpBXKVethpObPHPtrBMVefsSAnE0Gkt/JxtNX7GybXc5BCh+htOYqX
         g5uQ==
X-Forwarded-Encrypted: i=1; AJvYcCWj1oewTCx1Q3EVA6pN++cxAoL+y0oSblfRlp+n98C0MLdWpyIeu7XBTkxibEGd3UDroUQdpAYzeCf0I4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYcdFnWc1I3ke3Q425UWdSc9JLfNqdU2By5kvXi72QRs88Yn1W
	EZ6CKPufv8nKfH28PA80ExQT0H7oDxePDg/yrqricvSgx/boAWdw+Tk+4eS46lQRUGvcmimoAEZ
	3u1HgoLKAwJ4miqxJMlMIsQqZU8k=
X-Gm-Gg: ASbGncsMxNh2vJfXsm+s0UZN2cugBbENKPGy1/cppdmbqBKpaVxBAGnWwrDVrIV4Ww8
	2Q5IeEAGV7xl6RcXq8ekWlNIRVfLuUgXW1pDTsAUeJX6DLHjbIg1luKGBlqovv0oqBieG1t/icl
	hrDm1x0UqclamgXnmNAibt/xC292wGC5jWvXIOypu8440JKnTnVWOVYT+ZT54KTbqf
X-Google-Smtp-Source: AGHT+IFtEtA5pD1IKvtT6jtUfN2bIGFypfuHyagdS2yrhXxfFth+rxARtk7hVe9ouZ7icNR0m56kAOj+HqbXigUwkaY=
X-Received: by 2002:a17:90b:3509:b0:2ff:7b28:a51a with SMTP id
 98e67ed59e1d1-30c3d3e2408mr24482766a91.17.1747071241521; Mon, 12 May 2025
 10:34:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512162226.415154-1-noltari@gmail.com>
In-Reply-To: <20250512162226.415154-1-noltari@gmail.com>
From: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Date: Mon, 12 May 2025 19:33:26 +0200
X-Gm-Features: AX0GCFvyyXxPmN5a_8DcpKRoAodxbi-GPk92sP9tCWzzFppKed2sCrJnTeiWa2U
Message-ID: <CAKR-sGf3SbFtZyRuJmT=gKbL1VZtqJb0pet5SER6WhNqDCuEOg@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: brcmnand: legacy exec_op implementation
To: linux-mtd@lists.infradead.org, dregan@broadcom.com, 
	miquel.raynal@bootlin.com, bcm-kernel-feedback-list@broadcom.com, 
	florian.fainelli@broadcom.com, rafal@milecki.pl, computersforpeace@gmail.com, 
	kamal.dasu@broadcom.com, dan.beygelman@broadcom.com, 
	william.zhang@broadcom.com, frieder.schrempf@kontron.de, 
	linux-kernel@vger.kernel.org, vigneshr@ti.com, richard@nod.at, 
	bbrezillon@kernel.org, kdasu.kdev@gmail.com, jaimeliao.tw@gmail.com, 
	kilobyte@angband.pl, jonas.gorski@gmail.com, dgcbueu@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El lun, 12 may 2025 a las 18:22, =C3=81lvaro Fern=C3=A1ndez Rojas
(<noltari@gmail.com>) escribi=C3=B3:
>
> Commit 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation")
> removed legacy interface functions, breaking < v5.0 controllers support.
> In order to fix older controllers we need to add an alternative exec_op
> implementation which doesn't rely on low level registers.
>
> Fixes: 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation")
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> ---
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c | 174 ++++++++++++++++++++++-
>  1 file changed, 168 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/=
raw/brcmnand/brcmnand.c
> index 17f6d9723df9..919e322189d5 100644
> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> @@ -2490,14 +2490,177 @@ static int brcmnand_op_is_reset(const struct nan=
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
> +       int cmd =3D CMD_NULL, last_cmd =3D CMD_NULL;
> +       int ret =3D 0;
> +
> +       for (i =3D 0; i < op->ninstrs; i++) {
> +               instr =3D &op->instrs[i];
> +
> +               if (instr->type =3D=3D NAND_OP_CMD_INSTR) {
> +                       if (instr->ctx.cmd.opcode =3D=3D NAND_CMD_READID)=
 {
> +                               cmd =3D CMD_DEVICE_ID_READ;
> +                       } else if (instr->ctx.cmd.opcode =3D=3D NAND_CMD_=
READOOB) {
> +                               cmd =3D CMD_SPARE_AREA_READ;
> +                       } else if (instr->ctx.cmd.opcode =3D=3D NAND_CMD_=
ERASE1) {
> +                               cmd =3D CMD_BLOCK_ERASE;
> +                               brcmnand_wp(mtd, 0);
> +                       } else if (instr->ctx.cmd.opcode =3D=3D NAND_CMD_=
ERASE2) {
> +                               cmd =3D CMD_NULL;
> +                       } else if (instr->ctx.cmd.opcode =3D=3D NAND_CMD_=
PARAM) {
> +                               cmd =3D CMD_PARAMETER_READ;
> +                       } else if (instr->ctx.cmd.opcode =3D=3D NAND_CMD_=
RNDOUT) {
> +                               cmd =3D CMD_PARAMETER_CHANGE_COL;
> +                       } else if (instr->ctx.cmd.opcode =3D=3D NAND_CMD_=
RNDOUTSTART) {
> +                               cmd =3D CMD_NULL;
> +                       } else {
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
> +                       if (cmd =3D=3D CMD_PARAMETER_CHANGE_COL) {
> +                               addr &=3D ~((u64)(FC_BYTES - 1));
> +
> +                               if (brcmnand_get_sector_size_1k(host)) {
> +                                       host->hwcfg.sector_size_1k =3D
> +                                               brcmnand_get_sector_size_=
1k(host);
> +                                       brcmnand_set_sector_size_1k(host,=
 0);
> +                               }
> +                       }
> +
> +                       host->last_addr =3D addr;
> +
> +                       brcmnand_set_cmd_addr(mtd, addr);
> +                       brcmnand_send_cmd(host, cmd);
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
> +                               for (i =3D 0; i < FC_WORDS; i++)
> +                                       /*
> +                                        * Flash cache is big endian for =
parameter pages, at
> +                                        * least on STB SoCs
> +                                        */
> +                                       flash_cache[i] =3D be32_to_cpu(br=
cmnand_read_fc(ctrl, i));
> +
> +                               brcmnand_soc_data_bus_unprepare(ctrl->soc=
, true);
> +
> +                               /* Cleanup from HW quirk: restore SECTOR_=
SIZE_1K */
> +                               if (host->hwcfg.sector_size_1k)
> +                                       brcmnand_set_sector_size_1k(host,
> +                                                                   host-=
>hwcfg.sector_size_1k);
> +                       } else if (last_cmd =3D=3D NAND_CMD_ERASE1) {
> +                               brcmnand_wp(mtd, 1);
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
> +                       } else if (last_cmd =3D=3D CMD_SPARE_AREA_READ) {
> +                               for (j =3D 0; j < instr->ctx.data.len; j+=
+)
> +                                       in[j] =3D oob_reg_read(ctrl, j);
> +                       } else if (last_cmd =3D=3D NAND_CMD_PARAM || last=
_cmd =3D=3D NAND_CMD_RNDOUT) {
> +                               u64 addr;
> +                               u32 offs;
> +
> +                               for (j =3D 0; j < instr->ctx.data.len; j+=
+) {
> +                                       addr =3D host->last_addr =3D j;

This line should be:
addr =3D host->last_addr + j;
(To be fixed when I send v2)

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
> +               } else {
> +                       dev_err(ctrl->dev, "unsupported instruction type:=
 %d\n", instr->type);
> +                       ret =3D -EINVAL;
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
> @@ -2525,11 +2688,10 @@ static int brcmnand_exec_op(struct nand_chip *chi=
p,
>         if (op->deassert_wp)
>                 brcmnand_wp(mtd, 0);
>
> -       for (i =3D 0; i < op->ninstrs; i++) {
> -               ret =3D brcmnand_exec_instr(host, i, op);
> -               if (ret)
> -                       break;
> -       }
> +       if (ctrl->nand_version >=3D 0x500)
> +               brcmnand_exec_instructions(chip, op);
> +       else
> +               brcmnand_exec_instructions_legacy(chip, op);
>
>         if (op->deassert_wp)
>                 brcmnand_wp(mtd, 1);
> --
> 2.39.5
>
