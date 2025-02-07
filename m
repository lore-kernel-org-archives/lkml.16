Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB531A727D
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917579; cv=none; b=u/wIz4+SBRyLBGjlbiFeYgFCT7lCsUPk8dExgYQGHENWBaQL+4XLCjkeOjmmoLIaANQRNpcL0JRsl19teL8VQm5chwdzqhRRoMZvSjtyDyq8exAuOh4Lgf8vx3udiVYEMC3hjzL09owia0GAWcwtdw0EiNm1hmAuzlOJshgAUD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917579; c=relaxed/simple;
	bh=JkXN5D2U7NLeqI0IP0jOonEhjbx2JXNOvVZXrZ10IqA=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=THENQRH7QH1pq/F3xNhqTGk5CUGCTpQgo6ZRgoW9tHFsutV5YK57+XZV+Scea7+5erSyGGfrqUfi8haVV7lj0Gq9Q3euxflzyRG1byh2UPL+cvg0QOd4diAO/54kaQPYRG805qWhQOxoOBqUosmuo2PK8RxC6x8dTS69eYQ/rkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WdWtu5Vm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WdWtu5Vm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E83B6C4CED1;
	Fri,  7 Feb 2025 08:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738917579;
	bh=JkXN5D2U7NLeqI0IP0jOonEhjbx2JXNOvVZXrZ10IqA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WdWtu5VmRtLR8H/yKw9Z6K9uRACmj63TkIPo+Ss3RAZy3MAhtKo1McpqNmM69zBFz
	 TvFfu7Jq3Jl16wpHmTo78QxEo3HOyUl4rApgM4y9m6hQWWxX9B+jldP13I4Uyx30l2
	 w7Jm2pdqNBKrfy+Lfcan+BjjqUfCuFxYQCwF505cgkdsmx54kJKMnOKiH+WqEqHWF3
	 zQf0y3z6UvGcQ2iyDvqU16FG9bsv04R+UAv13PAZmRrwWCsHINmFvpxcn6QP3kEY/i
	 gW+n0mTOJJsoZM/IHyJS3yKgFJeWZyUfpkLhB9fpwm5MB1TYp/q7WSckokvD04pjrg
	 x+Aj0X0oUSIqQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 07 Feb 2025 09:39:34 +0100
From: Michael Walle <mwalle@kernel.org>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, Cheng Ming Lin
 <chengminglin@mxic.com.tw>
Subject: Re: [PATCH 2/2] mtd: spi-nor: macronix: Add support for Macronix NOR
 Flash
In-Reply-To: <20250207081846.362919-3-linchengming884@gmail.com>
References: <20250207081846.362919-1-linchengming884@gmail.com>
 <20250207081846.362919-3-linchengming884@gmail.com>
Message-ID: <811f5b9d7b2842a3e1293ac6a0bb3b70@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi Cheng,

> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> 
> Due to incorrect values in the 4-BAIT table for these two flash IDs,
> it is necessary to add these two flash IDs with fixups.

What's the part number of these flashes?

> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -127,6 +127,9 @@ static const struct flash_info macronix_nor_parts[] 
> = {
>  		.size = SZ_128M,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  		.fixups = &macronix_qpp4b_fixups,
> +	}, {

Although we don't have .name anymore, a comment like

/* <partname> */

is recommended.

> +		.id = SNOR_ID(0xc2, 0x20, 0x1c),
> +		.fixups = &macronix_qpp4b_fixups,
>  	}, {
>  		.id = SNOR_ID(0xc2, 0x23, 0x14),
>  		.name = "mx25v8035f",
> @@ -182,6 +185,9 @@ static const struct flash_info macronix_nor_parts[] 
> = {
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  		.fixup_flags = SPI_NOR_4B_OPCODES,
>  		.fixups = &macronix_qpp4b_fixups,
> +	}, {

same same

> +		.id = SNOR_ID(0xc2, 0x25, 0x3b),
> +		.fixups = &macronix_qpp4b_fixups,
>  	}, {
>  		.id = SNOR_ID(0xc2, 0x25, 0x3c),
>  		.name = "mx66u2g45g",

Thanks,
-michael
