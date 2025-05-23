Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEAC19A
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 00:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747958631; cv=none; b=bjXGXC+GDMH7krmXbzjnp0iU+Xnbws64DdfKXwKwkUf/4bphmdCAfp5ARTj3ZMQYjt7Tpz8zlzyMFDeP7Atd7z5KGtgocX47c90omSPlS3zoxkFI/+45AIPnWSqLi1UGSUj/SBQ/D76wtxhsTHMgMXUdNps46KZcXYM1Vs+eMtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747958631; c=relaxed/simple;
	bh=+9u1SK4z2fhRkG/BcHJvgYtCLM4UZXnXdrOpWJz6ET4=;
	h=From:References:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	 To:Content-Type; b=Ul/j7wQu59iIg4mL3sHEuTmuM/NGy7uHySF6+Ewne7F7gRN7CYlRuND7Wsh7wr5A5k/+/wzztUOAL5v3MOFF4TBmzDpHLm2WhmyVao2ZEw/IZI+kr0ntGDFCsyGyLM7wTZjfvZcq0nfMeNmwFxChOl581Kfe50zqXOHDNiGqWmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Eh7uTdv2; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Eh7uTdv2"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c560c55bc1so835840285a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747958628; x=1748563428; darn=vger.kernel.org;
        h=to:subject:message-id:date:thread-index:mime-version:in-reply-to
         :references:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L57r33p6RdR4V1cblXnd8KW+jMhipzE+3Bd3o8t/hg0=;
        b=Eh7uTdv2ys/i64Nu4Kn7Stp5dW5JUAdZG5hQ91//NM3nv8X8xr/IFRSNtfoASHqd/u
         cOuwC+pRhzQ1VEbV0mCuZAYZA8/obi3od6lA8ud+NTrZpqW5XXavZ0gFWZlfAEwZzOGT
         LHAAzV0d9/+CDAJD9xCsrA4Z6846XkrMR3kuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747958628; x=1748563428;
        h=to:subject:message-id:date:thread-index:mime-version:in-reply-to
         :references:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L57r33p6RdR4V1cblXnd8KW+jMhipzE+3Bd3o8t/hg0=;
        b=jhHWNknOcpEgwUCWRRRxz2gRv4p6OsPIAU9T4p3tPH6iDjZghOvH4nU3GH98Z54RRe
         C51QT2bfrY16fyjhf58lIn9BlqCSgRpG1vWOwEGMfFb+m5KSQi7y4dzkXpzN/q3FvO0c
         IAzJ16N7ndMbgMUiYL3M4WFdicK5H6SPAHE3DH7vzTFXo7OFCY/fzu+5xy3sMh8W0eke
         JCZKwZQFCceNP3hejpGkTDQn0MlcJDh6Cnkp751xDTTdKxbz2m2SvJFFhPbM9w/35L2o
         iRnnLmPjX54ABtLLNhJTf59vhaUzInVmDKimhbE67FUIR+5U/HRwiYkzT9zMFbBP17LZ
         gYSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXfnk/L+6w1H8mXNZQ8dqWoYgYw9N9Wyjmz78OVKD8Orwh+F3GePeer4ZsfACvERw0tTVqzsAuck8g6RU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7FxFy/FcGTaL+hAle49DBIUCYssnyPdhwEIOZ+Vh4H8uvkVpT
	Mb3SjI3WeyPis+oKx7e14blCsNkiQ1n2YhrOFMa8daqI99tL8t3MnW7Pt/j9yHTexVeI+BDlxDR
	RgSVjCtUX2lFP81cqjPl8r2uj4XTH8qpozupVZFoC
X-Gm-Gg: ASbGncv84y+umlr9CwVrSJqq+z0H3EoiTuBQ0FiuS0EzBbhWV3MQH1+qPey+z7099nk
	tddAZ2S1IvDlSCl6woTrRMFwMNsaFze0V+pvzmByNM59E1aqADtZ7xtvFklhR0heKstNgqj2qyr
	FvFHBB9RAQ2qLVojOaEP7wFMsCRc50atNnzfWQVvKoMaku
X-Google-Smtp-Source: AGHT+IHi9XsOKbk7IF//vrYaviFV99YOSxxu+OUOCYnSN6cXsi1Ha0iKoNp1o6aW7SiL6xcmJXoYfGjNXSX1IUn8DuM=
X-Received: by 2002:a05:620a:17a2:b0:7c5:50ab:de07 with SMTP id
 af79cd13be357-7cd46722387mr4138264485a.21.1747958628061; Thu, 22 May 2025
 17:03:48 -0700 (PDT)
From: William Zhang <william.zhang@broadcom.com>
References: <20250521080325.581366-1-noltari@gmail.com>
In-Reply-To: <20250521080325.581366-1-noltari@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEau4l2NieTobi/jvpPRXRGx/ckD7VhdRpg
Date: Thu, 22 May 2025 17:03:46 -0700
X-Gm-Features: AX0GCFuncgF1XPgtLCJIcLqgZHOWWtWNB8O4WMzDpDY2GTxQfZTMmWysLGcd2i8
Message-ID: <7cfd86d84bec5522dec4292605d6828e@mail.gmail.com>
Subject: RE: [PATCH v5] mtd: rawnand: brcmnand: legacy exec_op implementation
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, 
	linux-mtd@lists.infradead.org, dregan@broadcom.com, miquel.raynal@bootlin.com, 
	bcm-kernel-feedback-list@broadcom.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, rafal@milecki.pl, 
	computersforpeace@gmail.com, Kamal Dasu <kamal.dasu@broadcom.com>, 
	Dan Beygelman <dan.beygelman@broadcom.com>, frieder.schrempf@kontron.de, 
	linux-kernel@vger.kernel.org, vigneshr@ti.com, richard@nod.at, 
	bbrezillon@kernel.org, kdasu.kdev@gmail.com, jaimeliao.tw@gmail.com, 
	kilobyte@angband.pl, jonas.gorski@gmail.com, dgcbueu@gmail.com
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000216afa0635c25594"

--000000000000216afa0635c25594
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Sent: Wednesday, May 21, 2025 1:03 AM
> To: linux-mtd@lists.infradead.org; dregan@broadcom.com;
> miquel.raynal@bootlin.com; bcm-kernel-feedback-list@broadcom.com;
> florian.fainelli@broadcom.com; rafal@milecki.pl;
> computersforpeace@gmail.com; kamal.dasu@broadcom.com;
> dan.beygelman@broadcom.com; william.zhang@broadcom.com;
> frieder.schrempf@kontron.de; linux-kernel@vger.kernel.org;
> vigneshr@ti.com;
> richard@nod.at; bbrezillon@kernel.org; kdasu.kdev@gmail.com;
> jaimeliao.tw@gmail.com; kilobyte@angband.pl; jonas.gorski@gmail.com;
> dgcbueu@gmail.com
> Cc: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Subject: [PATCH v5] mtd: rawnand: brcmnand: legacy exec_op implementation
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
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c | 222
> ++++++++++++++++++++++-
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
> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> index 299dd2bca5b4..5ed79ffa271c 100644
> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> @@ -65,6 +65,7 @@ module_param(wp_on, int, 0444);
>  #define CMD_PARAMETER_READ		0x0e
>  #define CMD_PARAMETER_CHANGE_COL	0x0f
>  #define CMD_LOW_LEVEL_OP		0x10
> +#define CMD_NOT_SUPPORTED		0xff
>
>  struct brcm_nand_dma_desc {
>  	u32 next_desc;
> @@ -199,6 +200,30 @@ static const u16 flash_dma_regs_v4[] =3D {
>  	[FLASH_DMA_CURRENT_DESC_EXT]	=3D 0x34,
>  };
>
> +/* Native command conversion for legacy controllers (< v5.0) */
> +static const u8 native_cmd_conv[] =3D {
> +	[NAND_CMD_READ0]	=3D CMD_NOT_SUPPORTED,
> +	[NAND_CMD_READ1]	=3D CMD_NOT_SUPPORTED,
> +	[NAND_CMD_RNDOUT]	=3D CMD_PARAMETER_CHANGE_COL,
> +	[NAND_CMD_PAGEPROG]	=3D CMD_NOT_SUPPORTED,
> +	[NAND_CMD_READOOB]	=3D CMD_NOT_SUPPORTED,
> +	[NAND_CMD_ERASE1]	=3D CMD_BLOCK_ERASE,
> +	[NAND_CMD_STATUS]	=3D CMD_NOT_SUPPORTED,
> +	[NAND_CMD_SEQIN]	=3D CMD_NOT_SUPPORTED,
> +	[NAND_CMD_RNDIN]	=3D CMD_NOT_SUPPORTED,
> +	[NAND_CMD_READID]	=3D CMD_DEVICE_ID_READ,
> +	[NAND_CMD_ERASE2]	=3D CMD_NULL,
> +	[NAND_CMD_PARAM]	=3D CMD_PARAMETER_READ,
> +	[NAND_CMD_GET_FEATURES]	=3D CMD_NOT_SUPPORTED,
> +	[NAND_CMD_SET_FEATURES]	=3D CMD_NOT_SUPPORTED,
> +	[NAND_CMD_RESET]	=3D CMD_NOT_SUPPORTED,
> +	[NAND_CMD_READSTART]	=3D CMD_NOT_SUPPORTED,
> +	[NAND_CMD_READCACHESEQ]	=3D CMD_NOT_SUPPORTED,
> +	[NAND_CMD_READCACHEEND]	=3D CMD_NOT_SUPPORTED,
> +	[NAND_CMD_RNDOUTSTART]	=3D CMD_NULL,
> +	[NAND_CMD_CACHEDPROG]	=3D CMD_NOT_SUPPORTED,
> +};
> +
>  /* Controller feature flags */
>  enum {
>  	BRCMNAND_HAS_1K_SECTORS			=3D BIT(0),
> @@ -237,6 +262,12 @@ struct brcmnand_controller {
>  	/* List of NAND hosts (one for each chip-select) */
>  	struct list_head host_list;
>
> +	/* Functions to be called from exec_op */
> +	int (*check_instr)(struct nand_chip *chip,
> +			   const struct nand_operation *op);
> +	int (*exec_instr)(struct nand_chip *chip,
> +			  const struct nand_operation *op);
> +
>  	/* EDU info, per-transaction */
>  	const u16               *edu_offsets;
>  	void __iomem            *edu_base;
> @@ -2478,18 +2509,190 @@ static int brcmnand_op_is_reset(const struct
> nand_operation *op)
>  	return 0;
>  }
>
> +static int brcmnand_check_instructions(struct nand_chip *chip,
> +				       const struct nand_operation *op)
> +{
> +	return 0;
> +}
> +
> +static int brcmnand_exec_instructions(struct nand_chip *chip,
> +				      const struct nand_operation *op)
> +{
> +	struct brcmnand_host *host =3D nand_get_controller_data(chip);
> +	unsigned int i;
> +	int ret =3D 0;
> +
> +	for (i =3D 0; i < op->ninstrs; i++) {
> +		ret =3D brcmnand_exec_instr(host, i, op);
> +		if (ret)
> +			break;
> +	}
> +
> +	return ret;
> +}
> +
> +static int brcmnand_check_instructions_legacy(struct nand_chip *chip,
> +					      const struct nand_operation *op)
> +{
> +	const struct nand_op_instr *instr;
> +	unsigned int i;
> +	u8 cmd;
> +
> +	for (i =3D 0; i < op->ninstrs; i++) {
> +		instr =3D &op->instrs[i];
> +
> +		switch (instr->type) {
> +		case NAND_OP_CMD_INSTR:
> +			cmd =3D native_cmd_conv[instr->ctx.cmd.opcode];
> +			if (cmd =3D=3D CMD_NOT_SUPPORTED)
> +				return -EOPNOTSUPP;
> +			break;
> +		case NAND_OP_ADDR_INSTR:
> +		case NAND_OP_DATA_IN_INSTR:
> +		case NAND_OP_WAITRDY_INSTR:
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int brcmnand_exec_instructions_legacy(struct nand_chip *chip,
> +					     const struct nand_operation *op)
> +{
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +	struct brcmnand_host *host =3D nand_get_controller_data(chip);
> +	struct brcmnand_controller *ctrl =3D host->ctrl;
> +	const struct nand_op_instr *instr;
> +	unsigned int i, j;
> +	u8 cmd =3D CMD_NULL, last_cmd =3D CMD_NULL;
> +	int ret =3D 0;
> +	u64 last_addr;
> +
> +	for (i =3D 0; i < op->ninstrs; i++) {
> +		instr =3D &op->instrs[i];
> +
> +		if (instr->type =3D=3D NAND_OP_CMD_INSTR) {
> +			cmd =3D native_cmd_conv[instr->ctx.cmd.opcode];
> +			if (cmd =3D=3D CMD_NOT_SUPPORTED) {
> +				dev_err(ctrl->dev, "unsupported cmd=3D%d\n",
> +					instr->ctx.cmd.opcode);
> +				ret =3D -EOPNOTSUPP;
> +				break;
> +			}
> +		} else if (instr->type =3D=3D NAND_OP_ADDR_INSTR) {
> +			u64 addr =3D 0;
> +
> +			if (cmd =3D=3D CMD_NULL)
> +				continue;
> +
> +			if (instr->ctx.addr.naddrs > 8) {
> +				dev_err(ctrl->dev, "unsupported naddrs=3D%u\n",
> +					instr->ctx.addr.naddrs);
> +				ret =3D -EOPNOTSUPP;
> +				break;
> +			}
> +
> +			for (j =3D 0; j < instr->ctx.addr.naddrs; j++)
> +				addr |=3D (instr->ctx.addr.addrs[j]) << (j << 3);
> +
> +			if (cmd =3D=3D CMD_BLOCK_ERASE)
> +				addr <<=3D chip->page_shift;
> +			else if (cmd =3D=3D CMD_PARAMETER_CHANGE_COL)
> +				addr &=3D ~((u64)(FC_BYTES - 1));
> +
> +			brcmnand_set_cmd_addr(mtd, addr);
> +			brcmnand_send_cmd(host, cmd);
> +			last_addr =3D addr;
> +			last_cmd =3D cmd;
> +			cmd =3D CMD_NULL;
> +			brcmnand_waitfunc(chip);
> +
> +			if (last_cmd =3D=3D CMD_PARAMETER_READ ||
> +			    last_cmd =3D=3D CMD_PARAMETER_CHANGE_COL) {
> +				/* Copy flash cache word-wise */
> +				u32 *flash_cache =3D (u32 *)ctrl->flash_cache;
> +
> +				brcmnand_soc_data_bus_prepare(ctrl->soc, true);
> +
> +				/*
> +				 * Must cache the FLASH_CACHE now, since
> changes in
> +				 * SECTOR_SIZE_1K may invalidate it
> +				 */
> +				for (j =3D 0; j < FC_WORDS; j++)
> +					/*
> +					 * Flash cache is big endian for parameter
> pages, at
> +					 * least on STB SoCs
> +					 */
> +					flash_cache[j] =3D
> be32_to_cpu(brcmnand_read_fc(ctrl, j));
> +
> +				brcmnand_soc_data_bus_unprepare(ctrl->soc,
> true);
> +			}
> +		} else if (instr->type =3D=3D NAND_OP_DATA_IN_INSTR) {
> +			u8 *in =3D instr->ctx.data.buf.in;
> +
> +			if (last_cmd =3D=3D CMD_DEVICE_ID_READ) {
> +				u32 val;
> +
> +				if (instr->ctx.data.len > 8) {
> +					dev_err(ctrl->dev, "unsupported
> len=3D%u\n",
> +						instr->ctx.data.len);
> +					ret =3D -EOPNOTSUPP;
> +					break;
> +				}
> +
> +				for (j =3D 0; j < instr->ctx.data.len; j++) {
> +					if (j =3D=3D 0)
> +						val =3D brcmnand_read_reg(ctrl,
> BRCMNAND_ID);
> +					else if (j =3D=3D 4)
> +						val =3D brcmnand_read_reg(ctrl,
> BRCMNAND_ID_EXT);
> +
> +					in[j] =3D (val >> (24 - ((j % 4) << 3))) & 0xff;
> +				}
> +			} else if (last_cmd =3D=3D CMD_PARAMETER_READ ||
> +				   last_cmd =3D=3D CMD_PARAMETER_CHANGE_COL) {
> +				u64 addr;
> +				u32 offs;
> +
> +				for (j =3D 0; j < instr->ctx.data.len; j++) {
> +					addr =3D last_addr + j;
> +					offs =3D addr & (FC_BYTES - 1);
> +
> +					if (j > 0 && offs =3D=3D 0)
> +
> 	nand_change_read_column_op(chip, addr, NULL, 0,
> +									   false);
> +
> +					in[j] =3D ctrl->flash_cache[offs];
> +				}
> +			}
> +		} else if (instr->type =3D=3D NAND_OP_WAITRDY_INSTR) {
> +			ret =3D bcmnand_ctrl_poll_status(host, NAND_CTRL_RDY,
> NAND_CTRL_RDY, 0);
> +			if (ret)
> +				break;
> +		} else {
> +			dev_err(ctrl->dev, "unsupported instruction type: %d\n",
> instr->type);
> +			ret =3D -EOPNOTSUPP;
> +			break;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
>  static int brcmnand_exec_op(struct nand_chip *chip,
>  			    const struct nand_operation *op,
>  			    bool check_only)
>  {
>  	struct brcmnand_host *host =3D nand_get_controller_data(chip);
> +	struct brcmnand_controller *ctrl =3D host->ctrl;
>  	struct mtd_info *mtd =3D nand_to_mtd(chip);
>  	u8 *status;
> -	unsigned int i;
>  	int ret =3D 0;
>
>  	if (check_only)
> -		return 0;
> +		return ctrl->check_instr(chip, op);
>
>  	if (brcmnand_op_is_status(op)) {
>  		status =3D op->instrs[1].ctx.data.buf.in;
> @@ -2513,11 +2716,7 @@ static int brcmnand_exec_op(struct nand_chip *chip=
,
>  	if (op->deassert_wp)
>  		brcmnand_wp(mtd, 0);
>
> -	for (i =3D 0; i < op->ninstrs; i++) {
> -		ret =3D brcmnand_exec_instr(host, i, op);
> -		if (ret)
> -			break;
> -	}
> +	ret =3D ctrl->exec_instr(chip, op);
>
>  	if (op->deassert_wp)
>  		brcmnand_wp(mtd, 1);
> @@ -3130,6 +3329,15 @@ int brcmnand_probe(struct platform_device *pdev,
> struct brcmnand_soc *soc)
>  	if (ret)
>  		goto err;
>
> +	/* Only v5.0+ controllers have low level ops support */
> +	if (ctrl->nand_version >=3D 0x0500) {
> +		ctrl->check_instr =3D brcmnand_check_instructions;
> +		ctrl->exec_instr =3D brcmnand_exec_instructions;
> +	} else {
> +		ctrl->check_instr =3D brcmnand_check_instructions_legacy;
> +		ctrl->exec_instr =3D brcmnand_exec_instructions_legacy;
> +	}
> +
>  	/*
>  	 * Most chips have this cache at a fixed offset within 'nand' block.
>  	 * Some must specify this region separately.
> --
> 2.39.5

Reviewed-by: William Zhang <william.zhang@broadcom.com>

--000000000000216afa0635c25594
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIQYwYJKoZIhvcNAQcCoIIQVDCCEFACAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg3HMIIFDTCCA/WgAwIBAgIQeEqpED+lv77edQixNJMdADANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA5MTYwMDAwMDBaFw0yODA5MTYwMDAwMDBaMFsxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBS
MyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
vbCmXCcsbZ/a0fRIQMBxp4gJnnyeneFYpEtNydrZZ+GeKSMdHiDgXD1UnRSIudKo+moQ6YlCOu4t
rVWO/EiXfYnK7zeop26ry1RpKtogB7/O115zultAz64ydQYLe+a1e/czkALg3sgTcOOcFZTXk38e
aqsXsipoX1vsNurqPtnC27TWsA7pk4uKXscFjkeUE8JZu9BDKaswZygxBOPBQBwrA5+20Wxlk6k1
e6EKaaNaNZUy30q3ArEf30ZDpXyfCtiXnupjSK8WU2cK4qsEtj09JS4+mhi0CTCrCnXAzum3tgcH
cHRg0prcSzzEUDQWoFxyuqwiwhHu3sPQNmFOMwIDAQABo4IB2jCCAdYwDgYDVR0PAQH/BAQDAgGG
MGAGA1UdJQRZMFcGCCsGAQUFBwMCBggrBgEFBQcDBAYKKwYBBAGCNxQCAgYKKwYBBAGCNwoDBAYJ
KwYBBAGCNxUGBgorBgEEAYI3CgMMBggrBgEFBQcDBwYIKwYBBQUHAxEwEgYDVR0TAQH/BAgwBgEB
/wIBADAdBgNVHQ4EFgQUljPR5lgXWzR1ioFWZNW+SN6hj88wHwYDVR0jBBgwFoAUj/BLf6guRSSu
TVD6Y5qL3uLdG7wwegYIKwYBBQUHAQEEbjBsMC0GCCsGAQUFBzABhiFodHRwOi8vb2NzcC5nbG9i
YWxzaWduLmNvbS9yb290cjMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L3Jvb3QtcjMuY3J0MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vcm9vdC1yMy5jcmwwWgYDVR0gBFMwUTALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgEo
CjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAN
BgkqhkiG9w0BAQsFAAOCAQEAdAXk/XCnDeAOd9nNEUvWPxblOQ/5o/q6OIeTYvoEvUUi2qHUOtbf
jBGdTptFsXXe4RgjVF9b6DuizgYfy+cILmvi5hfk3Iq8MAZsgtW+A/otQsJvK2wRatLE61RbzkX8
9/OXEZ1zT7t/q2RiJqzpvV8NChxIj+P7WTtepPm9AIj0Keue+gS2qvzAZAY34ZZeRHgA7g5O4TPJ
/oTd+4rgiU++wLDlcZYd/slFkaT3xg4qWDepEMjT4T1qFOQIL+ijUArYS4owpPg9NISTKa1qqKWJ
jFoyms0d0GwOniIIbBvhI2MJ7BSY9MYtWVT5jJO3tsVHwj4cp92CSFuGwunFMzCCA18wggJHoAMC
AQICCwQAAAAAASFYUwiiMA0GCSqGSIb3DQEBCwUAMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9v
dCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9iYWxTaWduMB4XDTA5
MDMxODEwMDAwMFoXDTI5MDMxODEwMDAwMFowTDEgMB4GA1UECxMXR2xvYmFsU2lnbiBSb290IENB
IC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2JhbFNpZ24wggEiMA0GCSqG
SIb3DQEBAQUAA4IBDwAwggEKAoIBAQDMJXaQeQZ4Ihb1wIO2hMoonv0FdhHFrYhy/EYCQ8eyip0E
XyTLLkvhYIJG4VKrDIFHcGzdZNHr9SyjD4I9DCuul9e2FIYQebs7E4B3jAjhSdJqYi8fXvqWaN+J
J5U4nwbXPsnLJlkNc96wyOkmDoMVxu9bi9IEYMpJpij2aTv2y8gokeWdimFXN6x0FNx04Druci8u
nPvQu7/1PQDhBjPogiuuU6Y6FnOM3UEOIDrAtKeh6bJPkC4yYOlXy7kEkmho5TgmYHWyn3f/kRTv
riBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGj
QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5N
UPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigH
M8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmU
Y/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcy
a5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/
XzCCBU8wggQ3oAMCAQICDDG6HZcbcVdEvVYk4TANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMg
UGVyc29uYWxTaWduIDIgQ0EgMjAyMDAeFw0yMjA5MTAxMTMxNDVaFw0yNTA5MTAxMTMxNDVaMIGQ
MQswCQYDVQQGEwJJTjESMBAGA1UECBMJS2FybmF0YWthMRIwEAYDVQQHEwlCYW5nYWxvcmUxFjAU
BgNVBAoTDUJyb2FkY29tIEluYy4xFjAUBgNVBAMTDVdpbGxpYW0gWmhhbmcxKTAnBgkqhkiG9w0B
CQEWGndpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
CgKCAQEAyKF+RmY29Wvfmfe3L8J4rZNmBIvRmrWKI5td5L0vlpPMCEzUkVhBdL2N9cDP0rPScvWL
CX/9cI1a2BUy/6/ZT5j9PhcUn6A3kwKFGukLY2itfKaDrP3ANVJGhBXPVJ6sx55GF41PkiL2EMnY
7LJGNpl9WHYrw8VqtRediPyXq8M6ZWGPZWxygsE6y1pOkEk9qLpvXTb2Epxk2JWcQFZQCDWVULue
YDZuuBJwnyCzevMoPtVYPharioL5H3BRnQi8YoTXH7/uRo33dewYFm474yFjwwnt82TFtveVZkVq
6h4WIQ4wTcwFfET8zMkELnGzS5SHCl8sPD+lNxxJ1JDZYwIDAQABo4IB2zCCAdcwDgYDVR0PAQH/
BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9i
YWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUF
BzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAy
MDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xv
YmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAlBgNV
HREEHjAcgRp3aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAf
BgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUq65GzwZxydFHjjYEU/9h
xHhPWlwwDQYJKoZIhvcNAQELBQADggEBAA2hGG3JPAdGPH0ZdohGUCIVjKz+U+EFuIDbS6A/5jqX
VhYAxZlzj7tSjUIM7G7IhyfqPC46GKJ/4x+Amz1Z6YxNGy71L68kYD6hIbBcA5AM42QBUufly6Oa
/ppSz3WoflVyFFQ5YXniZ+eU+2/cdnYZg4aVUnFjimOF5o3NfMLzOkhQNxbaDjFUfUYD8hKmU6v4
0vUBj8KZ9Gi1LIagLKUREn8jku0lcLsRbnJ5Ey5ScajC/FESPyYWasOW8j8/1EoJksmhbYGKNS6C
urb/KlmDGfVrIRYDbL0ckhGQIP5c6L+kSQZ2sHnQK0e0WgIaZYxaPYeY5u0GLCOze+3vyRMxggJg
MIICXAIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYD
VQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwxuh2XG3FXRL1W
JOEwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEII3EZravAMUiV0kMsWmRXdQa388Y
ZGLnw7GlGAj9wfI7MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1
MDUyMzAwMDM0OFowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3
DQEBAQUABIIBAG8+10CVDsaOhrnY685GaKP/W1UyVYq3dhjypAQm+XxBxh8gvb0Uji2KVvgCoXTz
5IcWsuLvjQKmo/XTBNrH545LfeMvv2BoW2IEmyOdADqcRlF1xV9SbNVhWpI5zhu0OGURPOH4n2qz
4YDB2tdypeoJVieyIwB2e5iK5aiODXbr17zriYSBw4wLAOFWfgqZ75GQibHVmmwVAXYIQC4mNLZM
kPbG7+xA+Q+B2aeRdD3m2OHjHC8i0gtqYOPV2UqbWiyLa9OjWlg+0BNHNGlYsZllHybc1A2C2CP6
4UqXcbAvwvrk172bsVqWVcNOT26tPrJ4G+64pjFVGxzli9LSfxM=
--000000000000216afa0635c25594--
