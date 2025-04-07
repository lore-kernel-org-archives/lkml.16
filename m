Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A65225776
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 06:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744009140; cv=none; b=TxB17NH6xT1ZlwMCu2bZ8zLDC2DjLm0mihn2eAoFJVNJ24cOloek0sFNohFx0c3nKVeItwgfCS5724QU8KrKZxaraFGmFWzPb34oSQTpR6aEyqH2ibk3x9z+vcxiSsJ20YVYNnX0QKCKIA+b99knoaiZt71l1i5UTye7ZmhOQO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744009140; c=relaxed/simple;
	bh=z+jxWqKxyeO5QNJuDToNT3262v1CJ58P5Q9DJ8I/mso=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IYYGJMXBfaEXWuKIeu60CJ6RZjA78MkvArb7+XheHulCqAXFSMlFJjN/a7vVPMSrYMoARbz5v1kxab1rWA4BGJGDXdn/X/cbA7A8SrIoOWwAeGdXo67hnSDyQdTUV1tzdS1BEnoJj2zqNyQNRbvfA4+/19wQ3DofMrWINnjelFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=f4Fxxy8P; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="f4Fxxy8P"
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 87F1C582803
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 06:51:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E0AEA44354;
	Mon,  7 Apr 2025 06:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744008662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CtkCibXJB/RAmbeTC0As2u6SgcfbFFbzL81/+9wXhXA=;
	b=f4Fxxy8P4A8uNP2ya5EyjjqSi8Jlhk+SbkkDPZMSuBCy2I4z7CrB0NoeTp+9wF1ic9GcIo
	ynP4N5mlg/G0CAOwRSnJ7DenxNN7zlKfQM9PrmKyx0KxlmpZRIRXRbYgIL/qB1T9DCySpE
	pmykKA6sWDHCEq5nu0c5+Ke1jflZQvuRve+hcolWZcRJrvAw3RB5IK1FB6NhBEGP4zjyNe
	FNPZK2gmtqi37AvlQiVPxqn1UfrkryW4MrC3T+ydQFlvAqlRikT/UxE68FS5+7gCtcpUOs
	HL5xr6BNP1Re6aLILxxklJgBABEr0J4VsG1A3yBfaKGE8LRnTGnZJRisRZ7jHw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: bcm47xxnflash: Add error handling for
 bcm47xxnflash_ops_bcm4706_ctl_cmd()
In-Reply-To: <20250405143348.2477-1-vulab@iscas.ac.cn> (Wentao Liang's message
	of "Sat, 5 Apr 2025 22:33:47 +0800")
References: <20250405143348.2477-1-vulab@iscas.ac.cn>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 07 Apr 2025 08:51:00 +0200
Message-ID: <875xjgihwr.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleelhedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeelvddrudekgedruddtkedrfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddtkedrfedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehvuhhlrggssehishgtrghsrdgrtgdrtghnpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com

Hello Liang,

On 05/04/2025 at 22:33:47 +08, Wentao Liang <vulab@iscas.ac.cn> wrote:

> The bcm47xxnflash_ops_bcm4706_cmd_ctrl() calls
> bcm47xxnflash_ops_bcm4706_ctl_cmd() without printing error message. A
> proper implementation can be found in
> bcm47xxnflash_ops_bcm4706_write().

This is a problem with cmd_ctrl, but this interface has been deprecated
~5y ago and people encouraged to transition to ->exec_op(). Did you
personally experience issues with that or is this just code analysis? If
you are actually using this driver, I'd highly suggest to update the
driver.

> Add error log to the bcm47xxnflash_ops_bcm4706_ctl_cmd() to prevent
> silent failure.
>
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c b/drivers/m=
td/nand/raw/bcm47xxnflash/ops_bcm4706.c
> index 6487dfc64258..c89129588bb6 100644
> --- a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
> +++ b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
> @@ -182,7 +182,8 @@ static void bcm47xxnflash_ops_bcm4706_cmd_ctrl(struct=
 nand_chip *nand_chip,
>  	if (cmd !=3D NAND_CMD_RESET)
>  		code |=3D NCTL_CSA;
>=20=20
> -	bcm47xxnflash_ops_bcm4706_ctl_cmd(b47n->cc, code);
> +	if (bcm47xxnflash_ops_bcm4706_ctl_cmd(b47n->cc, code))
> +		pr_err("%s ctl_cmd didn't work!\n", __func__);

dev_err() is probably better
__func__ is not needed
If we want to make it a bit usable, I'd say that the return code shall
be there as well.

>  }
>=20=20
>  /* Default nand_select_chip calls cmd_ctrl, which is not used in BCM4706=
 */

Thanks,
Miqu=C3=A8l

