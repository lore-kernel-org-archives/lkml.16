Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC2021B910
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 00:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747353605; cv=none; b=h468LM1oe3YZ++Oh0rQnL5TRCWOt0eSBoKbOR4yiqVx1t621pQxoe2V6qLzaB2yvHurKh8C5CIt8y/O+QZUTwR1oY5ipgYcT25VExG2uvs/Cnq/RwXYy64rvCv0DOFHDWD0+VKMAt4Ea7W7KgbLlBhlfHZOYu1nP7swHrHyH5+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747353605; c=relaxed/simple;
	bh=6wFZgjz6aEN5togpOLyW6bp2BVhVsPc2KTJP118Xguw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oe5oj05pn2m8tvkINta9IZJHgn8PFdwGAlsnckrS0+zXa3kY+YA+o1hiYrA654hFebKnYk/BUqJIUPDSC1Zziwx337/5hE8n9oxXXDa9NyBchQxDAvF2Z3hpr34nhnvsTi6TtbDQHDl6Kn9g1HisKYeUCwu2yGXMJc2KEkSxZhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=DVZ+Z9Q2; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="DVZ+Z9Q2"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30c5a5839e3so327269a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747353602; x=1747958402; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ifl3v29Ei7qGP5DnHQRCWGNpzP72wsqZc2kAtN9QkPA=;
        b=DVZ+Z9Q2yuh/hM8PE67s9qI1ot2A7ctp09FbuE/IJFznD55vihsBVLlEGymLrdy5h+
         sIuOEjxIXhT9Kyky6yYVm/L7hh1eEoRQs9FF/13WeGBKm1tutP0NwruGg/wDwIeTVWbU
         4NFvbW83IYOJObtMG10tIDMYYrZSXbookP/P8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747353602; x=1747958402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ifl3v29Ei7qGP5DnHQRCWGNpzP72wsqZc2kAtN9QkPA=;
        b=IBJ0AQY3b9UwD7yaLNdiiq1qPGpTn2Wl6xtXL6lJq+9bmf3KGKYzv6VqW+cbqHd+X7
         kY4IPX4HSm5259JCvfSxSfGygx6RDnQHf3mM8sRhfkkcQHZYa2QjfqUH9zLnV8S8HnCB
         iKBfqTbzBc/hhs/rbYDJupKdqvUcQuze4eR69ThwlxhHChp/CWMHkQnvBIyLLB5U4nqu
         z8BxwGP4oNmHwBe0LoCl0hTsYvPthQYXkwiGNcj4jbKBPPMZmNTpj8eW1u6X0qeIiOJo
         L3DQ5gUIiiphoqoMdnXWeQ79HEfyeUajBN8e6B57cmJBrgxi9BgXsLZ0+5rYot5v6s6u
         4oVA==
X-Forwarded-Encrypted: i=1; AJvYcCUzwTVuYLoNGn5/PB7lTC/C0dbwUa72UDP9F/29Wxm42OJknMB73rAwMGo1eQT7rly08QSYYQF8lsLELKE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvVzSRnAIYdDpc5s5+gXj9R61B/EZXvpExGC1XOmv69toGUBXr
	/GI7bAQs5i9H7ux/vXDdTs1v4DVwahnS3hezvAD2gDkzraIYopkPX/oNUaEwe9hcWXa+umjCnl8
	b3JTFM82NFRjuHYpuRhVGzxhAj/lJi5MbRhvdfkRJ
X-Gm-Gg: ASbGncupIDJUejUxhT3QybXB0Qu2rvbD8nQLkDgOZL8KD3HUcc5fKG2jXzP6oLrM75I
	ZlpTgYizdvmMzScvH/k2Rzz8k64djdgETQrryj+SE+yanEv08pPa01A67ot1wMBj49rGSXX6p6N
	K+nZdwQxPojAtMGl43InyZphIGWrFfia5TNQ==
X-Google-Smtp-Source: AGHT+IH9m7rZtOgTj9kt1A4BgEbCTwbV7Gfa8ppWM/DMG743Yx9SRn4TbQDRNRWkdUybZDbXdaj//0LolPfjuiPpZ5Y=
X-Received: by 2002:a17:90b:4d10:b0:2fe:7f51:d2ec with SMTP id
 98e67ed59e1d1-30e7d2dcca2mr659702a91.0.1747353601984; Thu, 15 May 2025
 17:00:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514062341.774919-1-noltari@gmail.com> <b11623aeea01338715215084fc34107d@mail.gmail.com>
 <CAKR-sGcg5yCiQFV5yriD+Lv1MiV1wXVQo1_q_Eh-=UNAP-idxA@mail.gmail.com> <1cc01fd7-79fd-462d-923e-5ff0bf61b489@broadcom.com>
In-Reply-To: <1cc01fd7-79fd-462d-923e-5ff0bf61b489@broadcom.com>
From: David Regan <dregan@broadcom.com>
Date: Thu, 15 May 2025 16:59:51 -0700
X-Gm-Features: AX0GCFsoh_2xbloNSQu0GbuyRicwlXiUa-SFXY8RsOXUH_Uq_yBYdyj237ZOXoY
Message-ID: <CAA_RMS5vPa5euktwnPHcz0Td+eVfAj_Q9d9xzyk==jcGOGxYhQ@mail.gmail.com>
Subject: Re: [PATCH v3] mtd: rawnand: brcmnand: legacy exec_op implementation
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, 
	William Zhang <william.zhang@broadcom.com>, linux-mtd@lists.infradead.org, 
	David Regan <dregan@broadcom.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	bcm-kernel-feedback-list@broadcom.com, rafal@milecki.pl, 
	computersforpeace@gmail.com, Kamal Dasu <kamal.dasu@broadcom.com>, 
	Dan Beygelman <dan.beygelman@broadcom.com>, frieder.schrempf@kontron.de, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>, kdasu.kdev@gmail.com, 
	JaimeLiao <jaimeliao.tw@gmail.com>, Adam Borowski <kilobyte@angband.pl>, jonas.gorski@gmail.com, 
	dgcbueu@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi =C3=81lvaro,

On Thu, May 15, 2025 at 12:52=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
>
>
> On 5/15/2025 7:06 AM, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
> > Hi William
> >
> > El jue, 15 may 2025 a las 3:42, William Zhang
> > (<william.zhang@broadcom.com>) escribi=C3=B3:
> >>
> >> Hi Alvaro,
> >>
> >>> -----Original Message-----
> >>> From: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> >>> Sent: Tuesday, May 13, 2025 11:24 PM
> >>> To: linux-mtd@lists.infradead.org; dregan@broadcom.com;
> >>> miquel.raynal@bootlin.com; bcm-kernel-feedback-list@broadcom.com;
> >>> florian.fainelli@broadcom.com; rafal@milecki.pl;
> >>> computersforpeace@gmail.com; kamal.dasu@broadcom.com;
> >>> dan.beygelman@broadcom.com; william.zhang@broadcom.com;
> >>> frieder.schrempf@kontron.de; linux-kernel@vger.kernel.org;
> >>> vigneshr@ti.com;
> >>> richard@nod.at; bbrezillon@kernel.org; kdasu.kdev@gmail.com;
> >>> jaimeliao.tw@gmail.com; kilobyte@angband.pl; jonas.gorski@gmail.com;
> >>> dgcbueu@gmail.com
> >>> Cc: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> >>> Subject: [PATCH v3] mtd: rawnand: brcmnand: legacy exec_op implementa=
tion
> >>>
> >>> Commit 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation"=
)
> >>> removed legacy interface functions, breaking < v5.0 controllers suppo=
rt.
> >>> In order to fix older controllers we need to add an alternative exec_=
op
> >>> implementation which doesn't rely on low level registers.
> >>>
> >>> Fixes: 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation"=
)
> >>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> >>> ---
> >>>   drivers/mtd/nand/raw/brcmnand/brcmnand.c | 178
> >>> ++++++++++++++++++++++-
> >>>   1 file changed, 172 insertions(+), 6 deletions(-)
> >>>
> >>>   v3: add changes requested by Florian and other improvements:
> >>>    - Add associative array for native command conversion.
> >>>    - Add function pointer to brcmnand_controller for exec_instr
> >>>      functionality.
> >>>    - Fix CMD_BLOCK_ERASE address.
> >>>    - Drop NAND_CMD_READOOB support.
> >>>
> >>>   v2: multiple improvements:
> >>>    - Use proper native commands for checks.
> >>>    - Fix NAND_CMD_PARAM/NAND_CMD_RNDOUT addr calculation.
> >>>    - Remove host->last_addr usage.
> >>>    - Remove sector_size_1k since it only applies to v5.0+ controllers=
.
> >>>    - Remove brcmnand_wp since it doesn't exist for < v5.0 controllers=
.
> >>>    - Use j instead of i for flash_cache loop.
> >>>
> >>> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> >>> b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> >>> index 17f6d9723df9..f4fabe7ffd9d 100644
> >>> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> >>> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> >>> @@ -65,6 +65,7 @@ module_param(wp_on, int, 0444);
> >>>   #define CMD_PARAMETER_READ           0x0e
> >>>   #define CMD_PARAMETER_CHANGE_COL     0x0f
> >>>   #define CMD_LOW_LEVEL_OP             0x10
> >>> +#define CMD_NOT_SUPPORTED            0xff
> >>>
> >>>   struct brcm_nand_dma_desc {
> >>>        u32 next_desc;
> >>> @@ -199,6 +200,30 @@ static const u16 flash_dma_regs_v4[] =3D {
> >>>        [FLASH_DMA_CURRENT_DESC_EXT]    =3D 0x34,
> >>>   };
> >>>
> >>> +/* Native command conversion */
> >>> +static const u8 native_cmd_conv[] =3D {
> >>> +     [NAND_CMD_READ0]        =3D CMD_NOT_SUPPORTED,
> >>> +     [NAND_CMD_READ1]        =3D CMD_NOT_SUPPORTED,
> >>> +     [NAND_CMD_RNDOUT]       =3D CMD_PARAMETER_CHANGE_COL,
> >>> +     [NAND_CMD_PAGEPROG]     =3D CMD_NOT_SUPPORTED,
> >>> +     [NAND_CMD_READOOB]      =3D CMD_NOT_SUPPORTED,
> >>> +     [NAND_CMD_ERASE1]       =3D CMD_BLOCK_ERASE,
> >>> +     [NAND_CMD_STATUS]       =3D CMD_NOT_SUPPORTED,
> >> Do we not need to support nand_status_op()?
> >
> > We do, but NAND_CMD_STATUS and NAND_CMD_RESET are handled in brcmnand_e=
xec_op():
> > https://github.com/torvalds/linux/blob/546bce579204685a0b204beebab98c3a=
a496e651/drivers/mtd/nand/raw/brcmnand/brcmnand.c#L2506-L2523
> >
> >
> >
> >>
> >>> +     [NAND_CMD_SEQIN]        =3D CMD_NOT_SUPPORTED,
> >>> +     [NAND_CMD_RNDIN]        =3D CMD_NOT_SUPPORTED,
> >>> +     [NAND_CMD_READID]       =3D CMD_DEVICE_ID_READ,
> >>> +     [NAND_CMD_ERASE2]       =3D CMD_NULL,
> >>> +     [NAND_CMD_PARAM]        =3D CMD_PARAMETER_READ,
> >>> +     [NAND_CMD_GET_FEATURES] =3D CMD_NOT_SUPPORTED,
> >>> +     [NAND_CMD_SET_FEATURES] =3D CMD_NOT_SUPPORTED,
> >>> +     [NAND_CMD_RESET]        =3D CMD_NOT_SUPPORTED,
> >>> +     [NAND_CMD_READSTART]    =3D CMD_NOT_SUPPORTED,
> >>> +     [NAND_CMD_READCACHESEQ] =3D CMD_NOT_SUPPORTED,
> >>> +     [NAND_CMD_READCACHEEND] =3D CMD_NOT_SUPPORTED,
> >>> +     [NAND_CMD_RNDOUTSTART]  =3D CMD_NULL,
> >>> +     [NAND_CMD_CACHEDPROG]   =3D CMD_NOT_SUPPORTED,
> >>> +};
> >>> +
> >>>   /* Controller feature flags */
> >>>   enum {
> >>>        BRCMNAND_HAS_1K_SECTORS                 =3D BIT(0),
> >>> @@ -237,6 +262,10 @@ struct brcmnand_controller {
> >>>        /* List of NAND hosts (one for each chip-select) */
> >>>        struct list_head host_list;
> >>>
> >>> +     /* Function to be called from exec_op */
> >>> +     int (*exec_instr)(struct nand_chip *chip,
> >>> +                       const struct nand_operation *op);
> >>> +
> >>>        /* EDU info, per-transaction */
> >>>        const u16               *edu_offsets;
> >>>        void __iomem            *edu_base;
> >>> @@ -2490,14 +2519,149 @@ static int brcmnand_op_is_reset(const struct
> >>> nand_operation *op)
> >>>        return 0;
> >>>   }
> >>>
> >>> +static int brcmnand_exec_instructions(struct nand_chip *chip,
> >>> +                                   const struct nand_operation *op)
> >>> +{
> >>> +     struct brcmnand_host *host =3D nand_get_controller_data(chip);
> >>> +     unsigned int i;
> >>> +     int ret =3D 0;
> >>> +
> >>> +     for (i =3D 0; i < op->ninstrs; i++) {
> >>> +             ret =3D brcmnand_exec_instr(host, i, op);
> >>> +             if (ret)
> >>> +                     break;
> >>> +     }
> >>> +
> >>> +     return ret;
> >>> +}
> >>> +
> >>> +static int brcmnand_exec_instructions_legacy(struct nand_chip *chip,
> >>> +                                          const struct nand_operatio=
n *op)
> >>> +{
> >>> +     struct mtd_info *mtd =3D nand_to_mtd(chip);
> >>> +     struct brcmnand_host *host =3D nand_get_controller_data(chip);
> >>> +     struct brcmnand_controller *ctrl =3D host->ctrl;
> >>> +     const struct nand_op_instr *instr;
> >>> +     unsigned int i, j;
> >>> +     u8 cmd =3D CMD_NULL, last_cmd =3D CMD_NULL;
> >>> +     int ret =3D 0;
> >>> +     u64 last_addr;
> >>> +
> >>> +     for (i =3D 0; i < op->ninstrs; i++) {
> >>> +             instr =3D &op->instrs[i];
> >>> +
> >>> +             if (instr->type =3D=3D NAND_OP_CMD_INSTR) {
> >>> +                     cmd =3D native_cmd_conv[instr->ctx.cmd.opcode];
> >>> +                     if (cmd =3D=3D CMD_NOT_SUPPORTED) {
> >>> +                             dev_err(ctrl->dev, "unsupported cmd=3D%=
d\n",
> >>> +                                     instr->ctx.cmd.opcode);
> >>> +                             ret =3D -EOPNOTSUPP;
> >>> +                             break;
> >>> +                     }
> >>> +             } else if (instr->type =3D=3D NAND_OP_ADDR_INSTR) {
> >>> +                     u64 addr =3D 0;
> >>> +
> >>> +                     if (cmd =3D=3D CMD_NULL)
> >>> +                             continue;
> >>> +
> >>> +                     if (instr->ctx.addr.naddrs > 8) {
> >>> +                             dev_err(ctrl->dev, "unsupported naddrs=
=3D%u\n",
> >>> +                                     instr->ctx.addr.naddrs);
> >>> +                             ret =3D -EOPNOTSUPP;
> >>> +                             break;
> >>> +                     }
> >>> +
> >>> +                     for (j =3D 0; j < instr->ctx.addr.naddrs; j++)
> >>> +                             addr |=3D (instr->ctx.addr.addrs[j]) <<=
 (j << 3);
> >>> +
> >>> +                     if (cmd =3D=3D CMD_BLOCK_ERASE)
> >>> +                             addr <<=3D chip->page_shift;
> >>> +                     else if (cmd =3D=3D CMD_PARAMETER_CHANGE_COL)
> >>> +                             addr &=3D ~((u64)(FC_BYTES - 1));
> >>> +
> >>> +                     brcmnand_set_cmd_addr(mtd, addr);
> >>> +                     brcmnand_send_cmd(host, cmd);
> >>> +                     last_addr =3D addr;
> >>> +                     last_cmd =3D cmd;
> >>> +                     cmd =3D CMD_NULL;
> >>> +                     brcmnand_waitfunc(chip);
> >>> +
> >>> +                     if (last_cmd =3D=3D CMD_PARAMETER_READ ||
> >>> +                         last_cmd =3D=3D CMD_PARAMETER_CHANGE_COL) {
> >>> +                             /* Copy flash cache word-wise */
> >>> +                             u32 *flash_cache =3D (u32 *)ctrl->flash=
_cache;
> >>> +
> >>> +                             brcmnand_soc_data_bus_prepare(ctrl->soc=
, true);
> >>> +
> >>> +                             /*
> >>> +                              * Must cache the FLASH_CACHE now, sinc=
e
> >>> changes in
> >>> +                              * SECTOR_SIZE_1K may invalidate it
> >>> +                              */
> >>> +                             for (j =3D 0; j < FC_WORDS; j++)
> >>> +                                     /*
> >>> +                                      * Flash cache is big endian fo=
r parameter
> >>> pages, at
> >>> +                                      * least on STB SoCs
> >>> +                                      */
> >>> +                                     flash_cache[j] =3D
> >>> be32_to_cpu(brcmnand_read_fc(ctrl, j));
> >>> +
> >>> +                             brcmnand_soc_data_bus_unprepare(ctrl->s=
oc,
> >>> true);
> >>> +                     }
> >>> +             } else if (instr->type =3D=3D NAND_OP_DATA_IN_INSTR) {
> >>> +                     u8 *in =3D instr->ctx.data.buf.in;
> >>> +
> >>> +                     if (last_cmd =3D=3D CMD_DEVICE_ID_READ) {
> >>> +                             u32 val;
> >>> +
> >>> +                             if (instr->ctx.data.len > 8) {
> >>> +                                     dev_err(ctrl->dev, "unsupported
> >>> len=3D%u\n",
> >>> +                                             instr->ctx.data.len);
> >>> +                                     ret =3D -EOPNOTSUPP;
> >>> +                                     break;
> >>> +                             }
> >>> +
> >>> +                             for (j =3D 0; j < instr->ctx.data.len; =
j++) {
> >>> +                                     if (j =3D=3D 0)
> >>> +                                             val =3D brcmnand_read_r=
eg(ctrl,
> >>> BRCMNAND_ID);
> >>> +                                     else if (j =3D=3D 4)
> >>> +                                             val =3D brcmnand_read_r=
eg(ctrl,
> >>> BRCMNAND_ID_EXT);
> >>> +
> >>> +                                     in[j] =3D (val >> (24 - ((j % 4=
) << 3))) & 0xff;
> >>> +                             }
> >>> +                     } else if (last_cmd =3D=3D CMD_PARAMETER_READ |=
|
> >>> +                                last_cmd =3D=3D CMD_PARAMETER_CHANGE=
_COL) {
> >>> +                             u64 addr;
> >>> +                             u32 offs;
> >>> +
> >>> +                             for (j =3D 0; j < instr->ctx.data.len; =
j++) {
> >>> +                                     addr =3D last_addr + j;
> >>> +                                     offs =3D addr & (FC_BYTES - 1);
> >>> +
> >>> +                                     if (j > 0 && offs =3D=3D 0)
> >>> +
> >>>        nand_change_read_column_op(chip, addr, NULL, 0,
> >>> +                                                                    =
    false);
> >>> +
> >>> +                                     in[j] =3D ctrl->flash_cache[off=
s];
> >>> +                             }
> >>> +                     }
> >>> +             } else if (instr->type =3D=3D NAND_OP_WAITRDY_INSTR) {
> >>> +                     ret =3D bcmnand_ctrl_poll_status(host, NAND_CTR=
L_RDY,
> >>> NAND_CTRL_RDY, 0);
> >>> +             } else {
> >>> +                     dev_err(ctrl->dev, "unsupported instruction typ=
e: %d\n",
> >>> instr->type);
> >>> +                     ret =3D -EINVAL;
> >>> +             }
> >>> +     }
> >>> +
> >>> +     return ret;
> >>> +}
> >>> +
> >>>   static int brcmnand_exec_op(struct nand_chip *chip,
> >>>                            const struct nand_operation *op,
> >>>                            bool check_only)
> >>>   {
> >>>        struct brcmnand_host *host =3D nand_get_controller_data(chip);
> >>> +     struct brcmnand_controller *ctrl =3D host->ctrl;
> >>>        struct mtd_info *mtd =3D nand_to_mtd(chip);
> >>>        u8 *status;
> >>> -     unsigned int i;
> >>>        int ret =3D 0;
> >>>
> >>>        if (check_only)
> >>> @@ -2525,11 +2689,7 @@ static int brcmnand_exec_op(struct nand_chip *=
chip,
> >>>        if (op->deassert_wp)
> >>>                brcmnand_wp(mtd, 0);
> >>>
> >>> -     for (i =3D 0; i < op->ninstrs; i++) {
> >>> -             ret =3D brcmnand_exec_instr(host, i, op);
> >>> -             if (ret)
> >>> -                     break;
> >>> -     }
> >>> +     ctrl->exec_instr(chip, op);
> >>>
> >>>        if (op->deassert_wp)
> >>>                brcmnand_wp(mtd, 1);
> >>> @@ -3142,6 +3302,12 @@ int brcmnand_probe(struct platform_device *pde=
v,
> >>> struct brcmnand_soc *soc)
> >>>        if (ret)
> >>>                goto err;
> >>>
> >>> +     /* Only v5.0+ controllers have low level ops support */
> >>> +     if (ctrl->nand_version >=3D 0x0500)

We can probably change this to >=3D 0x0400 since as Florian mentioned
LLOP was added
with version 4.

> >>> +             ctrl->exec_instr =3D brcmnand_exec_instructions;
> >>> +     else
> >>> +             ctrl->exec_instr =3D brcmnand_exec_instructions_legacy;
> >>> +
> >>>        /*
> >>>         * Most chips have this cache at a fixed offset within 'nand' =
block.
> >>>         * Some must specify this region separately.
> >>> --
> >>> 2.39.5
> >
> > BTW, can anyone from Broadcom confirm any of the following?
> > 1. There are no low level registers on v2.1 and v2.2 controllers.
>
> Correct.
>
> > 2. Do low level registers exist on v4.0 controllers? They are defined
> > on 63268_map_part.h but the NAND drivers I could find never use them.
>
> They exist. The changelog for the NAND controller indicates that
> starting from v4.0 onwards, the NAND LL operation is supported.
>
> > 3. Are the low level registers bugged on v4.0 controllers?
> > 4. Should the low level registers be handled differently on v4.0 contro=
llers?
> > The issue is that trying to use them on v4.0 controllers for
> > GET_FEATURES would leave the NAND controller in a weird state that
> > results in hangs or timeouts while trying to read the NAND.
> > This happens on the Sercomm H500-s, which is a BCM63268 with a
> > Macronix NAND that tries to unlock through ONFI.

I don't yet know the answer to this and not sure exactly which NAND
part you are using
but if you have just a regular standard NAND that doesn't do anything
unusual does that
work with a 63268 through the non-legacy brcmnand_exec_op
brcmnand_exec_instructions
path (>=3D 5) that you split out?

Does the data that comes back from LLOP operations look legitimate?

>
> That I do not know however, William and David hopefully do know.
> --
> Florian
>

-Dave
