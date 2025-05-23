Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBCD128819
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 14:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748011324; cv=none; b=S/S51kv3igkn+Xv9cCdaOfaWcRFzEusuqlXQpL7cKhZrSWnFxxkFLGSPOceuUOx6Ii1mF+8evx8HERkw9oxk8eTINGIVSrppbqhMeRaw4WUSJcS/ZjyWH8p6UYdLRIgsKsbZBAHn+JvgJ0CyaZ5svKLgUmfLGOexvmQnepv6M0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748011324; c=relaxed/simple;
	bh=TJVmDWtF8ogHcPybe5MPS/1F53dHtYzA+KTELhmEMR8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=O/xR5ScXqN9lDTpKcljP5dC6bj0nm/hwcoy/pJrYtYMcApI0mdNa5ddnkipWSbFnvZMT24YcIG+EDdyrLNqft1feTAMVclzAJZ3XKJEdrM1dzXnLPfwZSZgiUPjDuiGguK4RbZplOw3oucbgWQqrqjQEengoEN87Na4QnL3jXaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bnzEE4vT; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bnzEE4vT"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5BF6143E93;
	Fri, 23 May 2025 14:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748011320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mSFnLqPW+tl6sHrtOhCJPYLdIIPpPKykLbxeoUP2BcA=;
	b=bnzEE4vT5y16PkwydBazGFiX9oeF8E8gnnWYCjcpjdqfsmhja1TWueJ24ZBC21l0esGzTH
	Nj8xhsCQhDWPyvE1zv5jp/hm0V+d12CS7HedfiohMvSiHuuVbrou7rxUSNAHyu/yecWej/
	O3kMvX5liYzvmaHVWsCCtb1We5KxRTzjWHELoJcRhE/w2mW3LNLfc6/6xLy55/rlEKBoUH
	73x1/sikXgai8TkUz1znjpV7oKmKWWJkEw9yK/jW+Gkez2tWnaqZJCv8HnvwtMbm5Guqcv
	/l3DGtVzRDWEB94Gb5BDJ9bmhaVJRQL+/p83WWVKRI8Vil4K4HY4WQTw5ij77w==
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
Subject: Re: [PATCH v5] mtd: rawnand: brcmnand: legacy exec_op implementation
In-Reply-To: <20250521080325.581366-1-noltari@gmail.com> (=?utf-8?Q?=22?=
 =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez?=
	Rojas"'s message of "Wed, 21 May 2025 10:03:25 +0200")
References: <20250521080325.581366-1-noltari@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 23 May 2025 16:41:58 +0200
Message-ID: <87wma74ceh.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdeluddvucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeelvddrudekgedrleekrddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrdelkedrtddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtohepnhholhhtrghrihesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepughrvghgrghnsegsrhhorggutghomhdrtghomhdprhgtphhtthhopegstghmqdhkvghrnhgvlhdqfhgvvggusggrtghkqdhlihhsthessghrohgruggtohhmrdgtohhmpdhrtghpthhtohepfhhlohhrihgrnhdrfhgrihhnvghllhhisegsrhhor
 ggutghomhdrtghomhdprhgtphhtthhopehrrghfrghlsehmihhlvggtkhhirdhplhdprhgtphhtthhopegtohhmphhuthgvrhhsfhhorhhpvggrtggvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhgrmhgrlhdruggrshhusegsrhhorggutghomhdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com

On 21/05/2025 at 10:03:25 +02, =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gm=
ail.com> wrote:

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

...

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

No NAND_OP_DATA_OUT_INSTR?

> +		case NAND_OP_WAITRDY_INSTR:
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	}
> +
> +	return 0;
> +}

Rest lgtm.

Thanks,
Miqu=C3=A8l
