Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C99522A
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 01:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747444610; cv=none; b=owwfmlKL9cENH8YH8bJhWO/yaKyLkycaV9Z2zIdcSMcdjkwTY3f8no7pu10oCEsu5Radj1W/nz5KuuMFeGub05mTRHnxKnnp9Uqphnh4cyrQYkYTryLjXb/UEybX3KrU0Ty8O8PAROUAJVhnbTn1RDmd2FeGxmQfCB9wpHU+pyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747444610; c=relaxed/simple;
	bh=4KnHempHAvmBMakNUZdNKwSECzYIJ8An8oadwVvsskQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HS478K/OgrI+TQaWOYn0+Wqbqpx6xcMw6HID4zjyT7A8GMiTS8NxCWu5ya5FzdOF7ngrcsuSfQakjmcQVqL/wnY4vQ+u36AP++lTX6MX+TShV99+eDbvyUyfQNh8koyZMRaqKLLb3oQ2hRjKZZg/2Ct1Up6NsayCS+8uq4sL/P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Fii21dry; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Fii21dry"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30c5a5839e3so585967a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 18:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747444607; x=1748049407; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0yD4HXduz6mhgA30m6aCqB09eQJ2ZfA1vlzCMNgoA4=;
        b=Fii21dryFNMGM5tQmrZfVc8jjlJrjI4gF3sWO/k2FN8JN0keDcguQ7bRvg6lkMcp7j
         TnKcmh7aPDNbCRp9Pfmu7NiD0v3JBWmuZIrafjRYTbhucTnJHfYpTQcCHzvHD7N00uC5
         B3rw5MyvkUBj4vq7FRAdmAKwkyTSeXNUic3jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747444607; x=1748049407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0yD4HXduz6mhgA30m6aCqB09eQJ2ZfA1vlzCMNgoA4=;
        b=ExfSZXB/cbr7dia6Qn9qtkcuTh+Ns1F0aIT+6+FbplN1K1UAKIcYK8bEFAzgB+4BHH
         AUolVuXD3sQuR24BoDtuN54gCzwtj5Kvh+XhiIyU8MeV+WfGliiPcZv6wTrmAG95jBAL
         kGuRSIPy2NDyLPUbN1SOuVP37VqY+fHFS6m8+Sitwjqd2333a4ceBN7OoPYMsjkyT3P8
         1QYjRg1RINE7++qi5klJUAz2HPtE7uD/Ug7MABLTTzYbejjVgZ40e5fuGa0EDUG6+k1B
         a3nt4k19dA063Eh/HamlChygs7t/WErpB975WckiFJ00jjrLLxxyvK6enE0gYd8NmkQG
         9c3w==
X-Forwarded-Encrypted: i=1; AJvYcCVHS2hRME64ptUNAaC9ZE3Hd/T0o6HRIo4mXMjEzeWzWpPUphvt/b5iBE8KXUMs/jU0WBzvwv4NYavohY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzltRVipVs67cMXgQKd4r2tG9DYZ3xGnlaht4S3KbJMBkFppdlJ
	ilRo4gPtITxmybvD4CKZt+PDATaljvTCqh2pxNUctfRqed1t5EHAoyURLeSN/SecPE6om0Ro56h
	P1f2p9WhbpuCUFvDkxW8GZ1X4eGZJeJPvn79FXfj2
X-Gm-Gg: ASbGnctx6e3zW6uosIhgWHq1yqNlhaRPQ07Ibsx4fyTf9IxyBciSMiMgY6BDX4FY2PC
	kRdMCE651NKzYw3eMyVCCSajjoDjBpV4NMqJ04kK1iW7FVXRiq4E7hHUZ/xbTE00n26SIu4v4Ts
	ZCANNzYfNLJ5qitFrcTCsL2Kdx+JNODnw2oMZpMob8zdFh
X-Google-Smtp-Source: AGHT+IE1RLHEuRo1MFgA6kRv+LTJae/cIc8OJUZ7iEYB8jffeUXLoKqkaBkUPa8cSkZ1cymFoON3T6MXUUpnfL9GKqo=
X-Received: by 2002:a17:902:f648:b0:231:d162:eeb7 with SMTP id
 d9443c01a7336-231d45265d5mr28615145ad.11.1747444607361; Fri, 16 May 2025
 18:16:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514062341.774919-1-noltari@gmail.com> <b11623aeea01338715215084fc34107d@mail.gmail.com>
 <CAKR-sGcg5yCiQFV5yriD+Lv1MiV1wXVQo1_q_Eh-=UNAP-idxA@mail.gmail.com>
 <1cc01fd7-79fd-462d-923e-5ff0bf61b489@broadcom.com> <CAA_RMS5vPa5euktwnPHcz0Td+eVfAj_Q9d9xzyk==jcGOGxYhQ@mail.gmail.com>
In-Reply-To: <CAA_RMS5vPa5euktwnPHcz0Td+eVfAj_Q9d9xzyk==jcGOGxYhQ@mail.gmail.com>
From: David Regan <dregan@broadcom.com>
Date: Fri, 16 May 2025 18:16:37 -0700
X-Gm-Features: AX0GCFv1ZUr-6_iLVsPZKA2Fmg5JpYWaW2U8onEwD2KkSErAQjLIFK9ekyauwvI
Message-ID: <CAA_RMS5XirF0gUju_BcoB+uS+wAD-vprCjQGTfuNjjwpnRF-Mw@mail.gmail.com>
Subject: Re: [PATCH v3] mtd: rawnand: brcmnand: legacy exec_op implementation
To: David Regan <dregan@broadcom.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, 
	William Zhang <william.zhang@broadcom.com>, linux-mtd@lists.infradead.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, bcm-kernel-feedback-list@broadcom.com, 
	rafal@milecki.pl, computersforpeace@gmail.com, 
	Kamal Dasu <kamal.dasu@broadcom.com>, Dan Beygelman <dan.beygelman@broadcom.com>, 
	frieder.schrempf@kontron.de, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>, kdasu.kdev@gmail.com, 
	JaimeLiao <jaimeliao.tw@gmail.com>, Adam Borowski <kilobyte@angband.pl>, jonas.gorski@gmail.com, 
	dgcbueu@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi =C3=81lvaro,

On Thu, May 15, 2025 at 4:59=E2=80=AFPM David Regan <dregan@broadcom.com> w=
rote:
>
> Hi =C3=81lvaro,
>
> On Thu, May 15, 2025 at 12:52=E2=80=AFAM Florian Fainelli
> <florian.fainelli@broadcom.com> wrote:
> >
> >
> >
> > On 5/15/2025 7:06 AM, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
> > > Hi William
> > >
> > > El jue, 15 may 2025 a las 3:42, William Zhang
> > > (<william.zhang@broadcom.com>) escribi=C3=B3:
> > >>
> > >> Hi Alvaro,
> > >>
> > >>> -----Original Message-----
> > >>> From: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> > >>> Sent: Tuesday, May 13, 2025 11:24 PM
> > >>> To: linux-mtd@lists.infradead.org; dregan@broadcom.com;
> > >>> miquel.raynal@bootlin.com; bcm-kernel-feedback-list@broadcom.com;
> > >>> florian.fainelli@broadcom.com; rafal@milecki.pl;
> > >>> computersforpeace@gmail.com; kamal.dasu@broadcom.com;
> > >>> dan.beygelman@broadcom.com; william.zhang@broadcom.com;
> > >>> frieder.schrempf@kontron.de; linux-kernel@vger.kernel.org;
> > >>> vigneshr@ti.com;
> > >>> richard@nod.at; bbrezillon@kernel.org; kdasu.kdev@gmail.com;
> > >>> jaimeliao.tw@gmail.com; kilobyte@angband.pl; jonas.gorski@gmail.com=
;
> > >>> dgcbueu@gmail.com
> > >>> Cc: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> > >>> Subject: [PATCH v3] mtd: rawnand: brcmnand: legacy exec_op implemen=
tation
> > >>>
> > >>> Commit 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementatio=
n")
> > >>> removed legacy interface functions, breaking < v5.0 controllers sup=
port.
> > >>> In order to fix older controllers we need to add an alternative exe=
c_op
> > >>> implementation which doesn't rely on low level registers.
> > >>>
> > >>> Fixes: 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementatio=
n")
> > >>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> > >>> ---
> > >>>   drivers/mtd/nand/raw/brcmnand/brcmnand.c | 178
> > >>> ++++++++++++++++++++++-
> > >>>   1 file changed, 172 insertions(+), 6 deletions(-)
> > >>>
> > >>>   v3: add changes requested by Florian and other improvements:
> > >>>    - Add associative array for native command conversion.
> > >>>    - Add function pointer to brcmnand_controller for exec_instr
> > >>>      functionality.
> > >>>    - Fix CMD_BLOCK_ERASE address.
> > >>>    - Drop NAND_CMD_READOOB support.
> > >>>
> > >>>   v2: multiple improvements:
> > >>>    - Use proper native commands for checks.
> > >>>    - Fix NAND_CMD_PARAM/NAND_CMD_RNDOUT addr calculation.
> > >>>    - Remove host->last_addr usage.
> > >>>    - Remove sector_size_1k since it only applies to v5.0+ controlle=
rs.
> > >>>    - Remove brcmnand_wp since it doesn't exist for < v5.0 controlle=
rs.
> > >>>    - Use j instead of i for flash_cache loop.
> > >>>
> > >>> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> > >>> b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> > >>> index 17f6d9723df9..f4fabe7ffd9d 100644
> > >>> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> > >>> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> > >>> @@ -65,6 +65,7 @@ module_param(wp_on, int, 0444);
> > >>>   #define CMD_PARAMETER_READ           0x0e
> > >>>   #define CMD_PARAMETER_CHANGE_COL     0x0f
> > >>>   #define CMD_LOW_LEVEL_OP             0x10
> > >>> +#define CMD_NOT_SUPPORTED            0xff
> > >>>
> > >>>   struct brcm_nand_dma_desc {
> > >>>        u32 next_desc;
> > >>> @@ -199,6 +200,30 @@ static const u16 flash_dma_regs_v4[] =3D {
> > >>>        [FLASH_DMA_CURRENT_DESC_EXT]    =3D 0x34,
> > >>>   };
> > >>>
> > >>> +/* Native command conversion */
> > >>> +static const u8 native_cmd_conv[] =3D {
> > >>> +     [NAND_CMD_READ0]        =3D CMD_NOT_SUPPORTED,
> > >>> +     [NAND_CMD_READ1]        =3D CMD_NOT_SUPPORTED,
> > >>> +     [NAND_CMD_RNDOUT]       =3D CMD_PARAMETER_CHANGE_COL,
> > >>> +     [NAND_CMD_PAGEPROG]     =3D CMD_NOT_SUPPORTED,
> > >>> +     [NAND_CMD_READOOB]      =3D CMD_NOT_SUPPORTED,
> > >>> +     [NAND_CMD_ERASE1]       =3D CMD_BLOCK_ERASE,
> > >>> +     [NAND_CMD_STATUS]       =3D CMD_NOT_SUPPORTED,
> > >> Do we not need to support nand_status_op()?
> > >
> > > We do, but NAND_CMD_STATUS and NAND_CMD_RESET are handled in brcmnand=
_exec_op():
> > > https://github.com/torvalds/linux/blob/546bce579204685a0b204beebab98c=
3aa496e651/drivers/mtd/nand/raw/brcmnand/brcmnand.c#L2506-L2523
> > >
> > >
> > >
> > >>
> > >>> +     [NAND_CMD_SEQIN]        =3D CMD_NOT_SUPPORTED,
> > >>> +     [NAND_CMD_RNDIN]        =3D CMD_NOT_SUPPORTED,
> > >>> +     [NAND_CMD_READID]       =3D CMD_DEVICE_ID_READ,
> > >>> +     [NAND_CMD_ERASE2]       =3D CMD_NULL,
> > >>> +     [NAND_CMD_PARAM]        =3D CMD_PARAMETER_READ,
> > >>> +     [NAND_CMD_GET_FEATURES] =3D CMD_NOT_SUPPORTED,
> > >>> +     [NAND_CMD_SET_FEATURES] =3D CMD_NOT_SUPPORTED,
> > >>> +     [NAND_CMD_RESET]        =3D CMD_NOT_SUPPORTED,
> > >>> +     [NAND_CMD_READSTART]    =3D CMD_NOT_SUPPORTED,
> > >>> +     [NAND_CMD_READCACHESEQ] =3D CMD_NOT_SUPPORTED,
> > >>> +     [NAND_CMD_READCACHEEND] =3D CMD_NOT_SUPPORTED,
> > >>> +     [NAND_CMD_RNDOUTSTART]  =3D CMD_NULL,
> > >>> +     [NAND_CMD_CACHEDPROG]   =3D CMD_NOT_SUPPORTED,
> > >>> +};
> > >>> +
> > >>>   /* Controller feature flags */
> > >>>   enum {
> > >>>        BRCMNAND_HAS_1K_SECTORS                 =3D BIT(0),
> > >>> @@ -237,6 +262,10 @@ struct brcmnand_controller {
> > >>>        /* List of NAND hosts (one for each chip-select) */
> > >>>        struct list_head host_list;
> > >>>
> > >>> +     /* Function to be called from exec_op */
> > >>> +     int (*exec_instr)(struct nand_chip *chip,
> > >>> +                       const struct nand_operation *op);
> > >>> +
> > >>>        /* EDU info, per-transaction */
> > >>>        const u16               *edu_offsets;
> > >>>        void __iomem            *edu_base;
> > >>> @@ -2490,14 +2519,149 @@ static int brcmnand_op_is_reset(const stru=
ct
> > >>> nand_operation *op)
> > >>>        return 0;
> > >>>   }
> > >>>
> > >>> +static int brcmnand_exec_instructions(struct nand_chip *chip,
> > >>> +                                   const struct nand_operation *op=
)
> > >>> +{
> > >>> +     struct brcmnand_host *host =3D nand_get_controller_data(chip)=
;
> > >>> +     unsigned int i;
> > >>> +     int ret =3D 0;
> > >>> +
> > >>> +     for (i =3D 0; i < op->ninstrs; i++) {
> > >>> +             ret =3D brcmnand_exec_instr(host, i, op);
> > >>> +             if (ret)
> > >>> +                     break;
> > >>> +     }
> > >>> +
> > >>> +     return ret;
> > >>> +}
> > >>> +
> > >>> +static int brcmnand_exec_instructions_legacy(struct nand_chip *chi=
p,
> > >>> +                                          const struct nand_operat=
ion *op)
> > >>> +{
> > >>> +     struct mtd_info *mtd =3D nand_to_mtd(chip);
> > >>> +     struct brcmnand_host *host =3D nand_get_controller_data(chip)=
;
> > >>> +     struct brcmnand_controller *ctrl =3D host->ctrl;
> > >>> +     const struct nand_op_instr *instr;
> > >>> +     unsigned int i, j;
> > >>> +     u8 cmd =3D CMD_NULL, last_cmd =3D CMD_NULL;
> > >>> +     int ret =3D 0;
> > >>> +     u64 last_addr;
> > >>> +
> > >>> +     for (i =3D 0; i < op->ninstrs; i++) {
> > >>> +             instr =3D &op->instrs[i];
> > >>> +
> > >>> +             if (instr->type =3D=3D NAND_OP_CMD_INSTR) {
> > >>> +                     cmd =3D native_cmd_conv[instr->ctx.cmd.opcode=
];
> > >>> +                     if (cmd =3D=3D CMD_NOT_SUPPORTED) {
> > >>> +                             dev_err(ctrl->dev, "unsupported cmd=
=3D%d\n",
> > >>> +                                     instr->ctx.cmd.opcode);
> > >>> +                             ret =3D -EOPNOTSUPP;
> > >>> +                             break;
> > >>> +                     }
> > >>> +             } else if (instr->type =3D=3D NAND_OP_ADDR_INSTR) {
> > >>> +                     u64 addr =3D 0;
> > >>> +
> > >>> +                     if (cmd =3D=3D CMD_NULL)
> > >>> +                             continue;
> > >>> +
> > >>> +                     if (instr->ctx.addr.naddrs > 8) {
> > >>> +                             dev_err(ctrl->dev, "unsupported naddr=
s=3D%u\n",
> > >>> +                                     instr->ctx.addr.naddrs);
> > >>> +                             ret =3D -EOPNOTSUPP;
> > >>> +                             break;
> > >>> +                     }
> > >>> +
> > >>> +                     for (j =3D 0; j < instr->ctx.addr.naddrs; j++=
)
> > >>> +                             addr |=3D (instr->ctx.addr.addrs[j]) =
<< (j << 3);
> > >>> +
> > >>> +                     if (cmd =3D=3D CMD_BLOCK_ERASE)
> > >>> +                             addr <<=3D chip->page_shift;
> > >>> +                     else if (cmd =3D=3D CMD_PARAMETER_CHANGE_COL)
> > >>> +                             addr &=3D ~((u64)(FC_BYTES - 1));
> > >>> +
> > >>> +                     brcmnand_set_cmd_addr(mtd, addr);
> > >>> +                     brcmnand_send_cmd(host, cmd);
> > >>> +                     last_addr =3D addr;
> > >>> +                     last_cmd =3D cmd;
> > >>> +                     cmd =3D CMD_NULL;
> > >>> +                     brcmnand_waitfunc(chip);
> > >>> +
> > >>> +                     if (last_cmd =3D=3D CMD_PARAMETER_READ ||
> > >>> +                         last_cmd =3D=3D CMD_PARAMETER_CHANGE_COL)=
 {
> > >>> +                             /* Copy flash cache word-wise */
> > >>> +                             u32 *flash_cache =3D (u32 *)ctrl->fla=
sh_cache;
> > >>> +
> > >>> +                             brcmnand_soc_data_bus_prepare(ctrl->s=
oc, true);
> > >>> +
> > >>> +                             /*
> > >>> +                              * Must cache the FLASH_CACHE now, si=
nce
> > >>> changes in
> > >>> +                              * SECTOR_SIZE_1K may invalidate it
> > >>> +                              */
> > >>> +                             for (j =3D 0; j < FC_WORDS; j++)
> > >>> +                                     /*
> > >>> +                                      * Flash cache is big endian =
for parameter
> > >>> pages, at
> > >>> +                                      * least on STB SoCs
> > >>> +                                      */
> > >>> +                                     flash_cache[j] =3D
> > >>> be32_to_cpu(brcmnand_read_fc(ctrl, j));
> > >>> +
> > >>> +                             brcmnand_soc_data_bus_unprepare(ctrl-=
>soc,
> > >>> true);
> > >>> +                     }
> > >>> +             } else if (instr->type =3D=3D NAND_OP_DATA_IN_INSTR) =
{
> > >>> +                     u8 *in =3D instr->ctx.data.buf.in;
> > >>> +
> > >>> +                     if (last_cmd =3D=3D CMD_DEVICE_ID_READ) {
> > >>> +                             u32 val;
> > >>> +
> > >>> +                             if (instr->ctx.data.len > 8) {
> > >>> +                                     dev_err(ctrl->dev, "unsupport=
ed
> > >>> len=3D%u\n",
> > >>> +                                             instr->ctx.data.len);
> > >>> +                                     ret =3D -EOPNOTSUPP;
> > >>> +                                     break;
> > >>> +                             }
> > >>> +
> > >>> +                             for (j =3D 0; j < instr->ctx.data.len=
; j++) {
> > >>> +                                     if (j =3D=3D 0)
> > >>> +                                             val =3D brcmnand_read=
_reg(ctrl,
> > >>> BRCMNAND_ID);
> > >>> +                                     else if (j =3D=3D 4)
> > >>> +                                             val =3D brcmnand_read=
_reg(ctrl,
> > >>> BRCMNAND_ID_EXT);
> > >>> +
> > >>> +                                     in[j] =3D (val >> (24 - ((j %=
 4) << 3))) & 0xff;
> > >>> +                             }
> > >>> +                     } else if (last_cmd =3D=3D CMD_PARAMETER_READ=
 ||
> > >>> +                                last_cmd =3D=3D CMD_PARAMETER_CHAN=
GE_COL) {
> > >>> +                             u64 addr;
> > >>> +                             u32 offs;
> > >>> +
> > >>> +                             for (j =3D 0; j < instr->ctx.data.len=
; j++) {
> > >>> +                                     addr =3D last_addr + j;
> > >>> +                                     offs =3D addr & (FC_BYTES - 1=
);
> > >>> +
> > >>> +                                     if (j > 0 && offs =3D=3D 0)
> > >>> +
> > >>>        nand_change_read_column_op(chip, addr, NULL, 0,
> > >>> +                                                                  =
      false);
> > >>> +
> > >>> +                                     in[j] =3D ctrl->flash_cache[o=
ffs];
> > >>> +                             }
> > >>> +                     }
> > >>> +             } else if (instr->type =3D=3D NAND_OP_WAITRDY_INSTR) =
{
> > >>> +                     ret =3D bcmnand_ctrl_poll_status(host, NAND_C=
TRL_RDY,
> > >>> NAND_CTRL_RDY, 0);
> > >>> +             } else {
> > >>> +                     dev_err(ctrl->dev, "unsupported instruction t=
ype: %d\n",
> > >>> instr->type);
> > >>> +                     ret =3D -EINVAL;
> > >>> +             }
> > >>> +     }
> > >>> +
> > >>> +     return ret;
> > >>> +}
> > >>> +
> > >>>   static int brcmnand_exec_op(struct nand_chip *chip,
> > >>>                            const struct nand_operation *op,
> > >>>                            bool check_only)
> > >>>   {
> > >>>        struct brcmnand_host *host =3D nand_get_controller_data(chip=
);
> > >>> +     struct brcmnand_controller *ctrl =3D host->ctrl;
> > >>>        struct mtd_info *mtd =3D nand_to_mtd(chip);
> > >>>        u8 *status;
> > >>> -     unsigned int i;
> > >>>        int ret =3D 0;
> > >>>
> > >>>        if (check_only)
> > >>> @@ -2525,11 +2689,7 @@ static int brcmnand_exec_op(struct nand_chip=
 *chip,
> > >>>        if (op->deassert_wp)
> > >>>                brcmnand_wp(mtd, 0);
> > >>>
> > >>> -     for (i =3D 0; i < op->ninstrs; i++) {
> > >>> -             ret =3D brcmnand_exec_instr(host, i, op);
> > >>> -             if (ret)
> > >>> -                     break;
> > >>> -     }
> > >>> +     ctrl->exec_instr(chip, op);
> > >>>
> > >>>        if (op->deassert_wp)
> > >>>                brcmnand_wp(mtd, 1);
> > >>> @@ -3142,6 +3302,12 @@ int brcmnand_probe(struct platform_device *p=
dev,
> > >>> struct brcmnand_soc *soc)
> > >>>        if (ret)
> > >>>                goto err;
> > >>>
> > >>> +     /* Only v5.0+ controllers have low level ops support */
> > >>> +     if (ctrl->nand_version >=3D 0x0500)
>
> We can probably change this to >=3D 0x0400 since as Florian mentioned
> LLOP was added
> with version 4.

Sorry we should probably leave this cutoff as it is, version 5, see below..

>
> > >>> +             ctrl->exec_instr =3D brcmnand_exec_instructions;
> > >>> +     else
> > >>> +             ctrl->exec_instr =3D brcmnand_exec_instructions_legac=
y;
> > >>> +
> > >>>        /*
> > >>>         * Most chips have this cache at a fixed offset within 'nand=
' block.
> > >>>         * Some must specify this region separately.
> > >>> --
> > >>> 2.39.5
> > >
> > > BTW, can anyone from Broadcom confirm any of the following?
> > > 1. There are no low level registers on v2.1 and v2.2 controllers.
> >
> > Correct.
> >
> > > 2. Do low level registers exist on v4.0 controllers? They are defined
> > > on 63268_map_part.h but the NAND drivers I could find never use them.
> >
> > They exist. The changelog for the NAND controller indicates that
> > starting from v4.0 onwards, the NAND LL operation is supported.
> >
> > > 3. Are the low level registers bugged on v4.0 controllers?
> > > 4. Should the low level registers be handled differently on v4.0 cont=
rollers?
> > > The issue is that trying to use them on v4.0 controllers for
> > > GET_FEATURES would leave the NAND controller in a weird state that
> > > results in hangs or timeouts while trying to read the NAND.
> > > This happens on the Sercomm H500-s, which is a BCM63268 with a
> > > Macronix NAND that tries to unlock through ONFI.
>

I have confirmed that low level operation registers do not work for
version 4 NAND controller in 63268.

> I don't yet know the answer to this and not sure exactly which NAND
> part you are using
> but if you have just a regular standard NAND that doesn't do anything
> unusual does that
> work with a 63268 through the non-legacy brcmnand_exec_op
> brcmnand_exec_instructions
> path (>=3D 5) that you split out?
>
> Does the data that comes back from LLOP operations look legitimate?
>
> >
> > That I do not know however, William and David hopefully do know.
> > --
> > Florian
> >
>
> -Dave

-Dave
