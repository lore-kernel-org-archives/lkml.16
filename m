Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EAF14884C
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747405947; cv=none; b=jY3kx3RMqMvIi1aaftc4bqVLJS3mb4WxjWfjAsCVSGsEVFMfdNuki6/ygT2YLzs1csyL9SVyD4RlvskdRG4CxF0sngC0WGOmFBivSvrBLFSKRYpyMbz1EW7+roob9VW+1aMMM9XQ6xhJwdt7l7ZEzEeSC3GAqheQ1ZuHKPuoPps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747405947; c=relaxed/simple;
	bh=AUSWPpp8SI2mmg4oBzYhM6nAv/gioMP9u8pxX9JHqAM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UdhtStEXA+aBkuSJr6XuEs8EUYSyCr9hcqfdQNey6WjLRpozLeYcp3oXaNpb8GB63bugkEOpD7lI5g8eqssW1uq0ZS7poJCYZPSy+UN2OAAF2/iZrUUmRTuKb0aluaj0OYFkXJoVhSs5t1c1Kt6rwZ/txA5t6p5/wdHYndlXR1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oK4UAnTZ; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oK4UAnTZ"
Received: by mail.gandi.net (Postfix) with ESMTPSA id C03B843B63;
	Fri, 16 May 2025 14:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747405937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cx+R6Ss+hRUkdPKaV+SmJaLvjR4vIHIih0chKUPxnCs=;
	b=oK4UAnTZbf3QFQSp7nPHE1kshQcN+92jeNk5DmLXcz3ZnCf5oD4mLLn+nn1FVl5tQ4FqQ8
	SKzN53hHN7Grvbf3dYNhr/my9mH75FZ/nMpxklZJYIU5D6/DS31ZVgY5EYg44BkH8yZ2mG
	hqJYqe8ALXiw2L/HeFt2N/wzwO/bJ5XesgIE40pJxVUYralBRd5CxfUSlLtAfBxGSufVAN
	n+hiavGZsyv2oe496seLHTh70/TMfYXCcKgNSktZbhZVASDUinctI8WGxftoCgE4/PVYuV
	YPunZJJEpzwevwEq2daR1DCInvI7TQAqHnBWSBg7YtW/3sfZ3LcfZuHJkQnMww==
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
Subject: Re: [PATCH v4] mtd: rawnand: brcmnand: legacy exec_op implementation
In-Reply-To: <20250515050759.1016697-1-noltari@gmail.com> (=?utf-8?Q?=22?=
 =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez?=
	Rojas"'s message of "Thu, 15 May 2025 07:07:59 +0200")
References: <20250515050759.1016697-1-noltari@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 16 May 2025 16:32:16 +0200
Message-ID: <87o6vsd3tb.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepueeijeduvefgkeeuveffgeejleegledtvdduveeftdetfeejvdfffedvgfduffeknecuffhomhgrihhnpegsuhhfrdhinhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopehnohhlthgrrhhisehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegurhgvghgrnhessghrohgruggtohhmrdgtohhmpdhrtghpthhtohepsggtmhdqkhgvrhhnvghlqdhfvggvuggsrggtkhdqlhhishhtsegsrhhorggutghomhdrtghomhdprhgtphhtthhopehflhhorhhirghnrdhfrghin
 hgvlhhlihessghrohgruggtohhmrdgtohhmpdhrtghpthhtoheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhrtghpthhtoheptghomhhpuhhtvghrshhfohhrphgvrggtvgesghhmrghilhdrtghomhdprhgtphhtthhopehkrghmrghlrdgurghsuhessghrohgruggtohhmrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com

Hello Alvaro,

On 15/05/2025 at 07:07:59 +02, =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gm=
ail.com> wrote:

> Commit 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation")
> removed legacy interface functions, breaking < v5.0 controllers support.
> In order to fix older controllers we need to add an alternative exec_op
> implementation which doesn't rely on low level registers.
>
> Fixes: 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation")
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>

Since you have a precise list of what is supported and what's not, I'd
have expected the rest of the behavior to be identical. Are these
controllers so different in how to program them? Can't we use the
existing exec_op() implementation without some of the opcodes?


> +/* Native command conversion */

Should mention "legacy" somewhere I guess, and even what legacy means in
this context, which is version(controller) < XXX.

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
> @@ -237,6 +262,10 @@ struct brcmnand_controller {
>  	/* List of NAND hosts (one for each chip-select) */
>  	struct list_head host_list;
>=20=20
> +	/* Function to be called from exec_op */
> +	int (*exec_instr)(struct nand_chip *chip,
> +			  const struct nand_operation *op);
> +
>  	/* EDU info, per-transaction */
>  	const u16               *edu_offsets;
>  	void __iomem            *edu_base;
> @@ -2490,14 +2519,152 @@ static int brcmnand_op_is_reset(const struct nan=
d_operation *op)
>  	return 0;
>  }
>=20=20
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

Could we use a switch case here? Seems more appropriate.

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

Waitfunc is a legacy interface, are you sure this is the correct
function call here?

> +
> +			if (last_cmd =3D=3D CMD_PARAMETER_READ ||
> +			    last_cmd =3D=3D CMD_PARAMETER_CHANGE_COL) {
> +				/* Copy flash cache word-wise */
> +				u32 *flash_cache =3D (u32 *)ctrl->flash_cache;
> +
> +				brcmnand_soc_data_bus_prepare(ctrl->soc, true);
> +
> +				/*
> +				 * Must cache the FLASH_CACHE now, since changes in
> +				 * SECTOR_SIZE_1K may invalidate it
> +				 */
> +				for (j =3D 0; j < FC_WORDS; j++)
> +					/*
> +					 * Flash cache is big endian for parameter pages, at
> +					 * least on STB SoCs
> +					 */
> +					flash_cache[j] =3D be32_to_cpu(brcmnand_read_fc(ctrl, j));
> +
> +				brcmnand_soc_data_bus_unprepare(ctrl->soc, true);
> +			}
> +		} else if (instr->type =3D=3D NAND_OP_DATA_IN_INSTR) {
> +			u8 *in =3D instr->ctx.data.buf.in;
> +
> +			if (last_cmd =3D=3D CMD_DEVICE_ID_READ) {
> +				u32 val;
> +
> +				if (instr->ctx.data.len > 8) {
> +					dev_err(ctrl->dev, "unsupported len=3D%u\n",
> +						instr->ctx.data.len);
> +					ret =3D -EOPNOTSUPP;
> +					break;
> +				}
> +
> +				for (j =3D 0; j < instr->ctx.data.len; j++) {
> +					if (j =3D=3D 0)
> +						val =3D brcmnand_read_reg(ctrl, BRCMNAND_ID);
> +					else if (j =3D=3D 4)
> +						val =3D brcmnand_read_reg(ctrl, BRCMNAND_ID_EXT);
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
> +						nand_change_read_column_op(chip, addr, NULL, 0,
> +									   false);
> +
> +					in[j] =3D ctrl->flash_cache[offs];
> +				}
> +			}
> +		} else if (instr->type =3D=3D NAND_OP_WAITRDY_INSTR) {
> +			ret =3D bcmnand_ctrl_poll_status(host, NAND_CTRL_RDY, NAND_CTRL_RDY, =
0);
> +			if (ret)
> +				break;
> +		} else {
> +			dev_err(ctrl->dev, "unsupported instruction type: %d\n", instr->type);
> +			ret =3D -EINVAL;

EOPNOTSUPP I guess?

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
>=20=20
>  	if (check_only)
[adding one more context line]
                 return 0;

There is a lot that is unsupported, and this is okay, but you need to
control all these earlier and implement a function that does all the
checks when exec_op() is called with the check_only parameter set (just
above). The support for the old SoCs *must* not return 0 by default and
instead check the validity of the op when requested.

> @@ -2525,11 +2692,7 @@ static int brcmnand_exec_op(struct nand_chip *chip,
>  	if (op->deassert_wp)
>  		brcmnand_wp(mtd, 0);
>=20=20
> -	for (i =3D 0; i < op->ninstrs; i++) {
> -		ret =3D brcmnand_exec_instr(host, i, op);
> -		if (ret)
> -			break;
> -	}
> +	ret =3D ctrl->exec_instr(chip, op);
>=20=20
>  	if (op->deassert_wp)
>  		brcmnand_wp(mtd, 1);
> @@ -3142,6 +3305,12 @@ int brcmnand_probe(struct platform_device *pdev, s=
truct brcmnand_soc *soc)
>  	if (ret)
>  		goto err;
>=20=20
> +	/* Only v5.0+ controllers have low level ops support */
> +	if (ctrl->nand_version >=3D 0x0500)

Did I just read that 4 or 4.1 was the correct boundary instead of 5?

> +		ctrl->exec_instr =3D brcmnand_exec_instructions;
> +	else
> +		ctrl->exec_instr =3D brcmnand_exec_instructions_legacy;
> +
>  	/*
>  	 * Most chips have this cache at a fixed offset within 'nand' block.
>  	 * Some must specify this region separately.

Thanks,
Miqu=C3=A8l
