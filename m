Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED31D19F111
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917396; cv=none; b=PpvYsHoBhLaLQHVrMhqBF4JKVrRjcwYbmT4HncSElY3LLuaUL8EWNrmpyLBE0asAMd/qSU4Ai50qFQJ20rSWDkARXH9xFeiHVlrNVnj3ns9TfJaeb/dEXxYpJsP6PviL4R9DPA5iyeyPmcgZGP8yTdfW5nsXGS2XgeXQVv4BYVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917396; c=relaxed/simple;
	bh=95R7wtZe+y2DcnVkficYA9or/YfcSNgSUS2n9SAYGs4=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=D/MG59nflpPZVOFzKb3ZtBbW5+WPTtTtsWmNCJtfzUQMjzoI9+6MosIOmaXHuAmxYRvVpr3mpYKds/OREsGUI5eW7ORyU2M4kfx3hm2L1AmW7JBlvX51PEaLoBrgab9SmYxziejbJTwIuK34P+GGHQKmlN7iihsyB8ez8zf3PS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LAUsS20J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LAUsS20J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24C50C4CED1;
	Fri,  7 Feb 2025 08:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738917395;
	bh=95R7wtZe+y2DcnVkficYA9or/YfcSNgSUS2n9SAYGs4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LAUsS20JTtH6AV9OROJt/fNj30Nbuw3DWl80TVd7AaQnxmvSwanZ+MPddNBfbkQe8
	 r3zbXLwCp6AV+4Qjp84/we4L3s1ITPWCp8F0MMLz7QTFZPbiCLhhDSgGFxcKWDc8sA
	 CDbHzbZSnVTf8GGoSrcNgH6cvyPZjU6ML42tYTaGbhOIYhbfa0+TOVFc7CSulngMJ5
	 WNJbPHVhH71hoRhyCFr8tB50cXAdw/fELGtL6PVQmg45Ajz6nbOzwZzv4hQ9vvma/S
	 AN8PEZEpmTbLeoG3CJC52HgFfGjvlLTD+BMUKrAyjEsyHfI2IylNgO0heRShTbBEy2
	 KVA8ZGw485vHQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 07 Feb 2025 09:36:31 +0100
From: Michael Walle <mwalle@kernel.org>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, Cheng Ming Lin
 <chengminglin@mxic.com.tw>
Subject: Re: [PATCH 1/2] mtd: spi-nor: macronix: Add post_sfdp fixups for Quad
 Input Page Program
In-Reply-To: <20250207081846.362919-2-linchengming884@gmail.com>
References: <20250207081846.362919-1-linchengming884@gmail.com>
 <20250207081846.362919-2-linchengming884@gmail.com>
Message-ID: <8901dcd481a2185ad34fa7dd09997b38@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi Cheng,

> Although certain Macronix NOR flash support the Quad Input Page Program
> feature, the corresponding information in the 4-byte Address 
> Instruction
> Table of these flash is not properly filled. As a result, this feature
> cannot be enabled as expected.
> 
> To address this issue, a post_sfdp fixups implementation is required to
> correct the missing information.
> 
> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
> ---
>  drivers/mtd/spi-nor/macronix.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c 
> b/drivers/mtd/spi-nor/macronix.c
> index 830da21eea08..ada17999ccbb 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -45,8 +45,26 @@ mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
>  	return 0;
>  }
> 
> +static int
> +macronix_qpp4b_post_sfdp_fixups(struct spi_nor *nor)
> +{
> +	/* PP_1_1_4_4B is supported but missing in 4BAIT. */
> +	struct spi_nor_flash_parameter *params = nor->params;
> +
> +	params->hwcaps.mask |= SNOR_HWCAPS_PP_1_1_4;
> +	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_1_4],
> +			SPINOR_OP_PP_1_1_4_4B, SNOR_PROTO_1_1_4);
> +
> +	return 0;
> +}
> +
>  static const struct spi_nor_fixups mx25l25635_fixups = {
>  	.post_bfpt = mx25l25635_post_bfpt_fixups,
> +	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
> +};
> +
> +static const struct spi_nor_fixups macronix_qpp4b_fixups = {
> +	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
>  };
> 
>  static const struct flash_info macronix_nor_parts[] = {
> @@ -102,11 +120,13 @@ static const struct flash_info 
> macronix_nor_parts[] = {
>  		.size = SZ_64M,
>  		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  		.fixup_flags = SPI_NOR_4B_OPCODES,
> +		.fixups = &macronix_qpp4b_fixups,
>  	}, {
>  		.id = SNOR_ID(0xc2, 0x20, 0x1b),
>  		.name = "mx66l1g45g",
>  		.size = SZ_128M,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> +		.fixups = &macronix_qpp4b_fixups,
>  	}, {
>  		.id = SNOR_ID(0xc2, 0x23, 0x14),
>  		.name = "mx25v8035f",
> @@ -154,18 +174,21 @@ static const struct flash_info 
> macronix_nor_parts[] = {
>  		.size = SZ_64M,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  		.fixup_flags = SPI_NOR_4B_OPCODES,
> +		.fixups = &macronix_qpp4b_fixups,
>  	}, {
>  		.id = SNOR_ID(0xc2, 0x25, 0x3a),
>  		.name = "mx66u51235f",
>  		.size = SZ_64M,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  		.fixup_flags = SPI_NOR_4B_OPCODES,
> +		.fixups = &macronix_qpp4b_fixups,
>  	}, {
>  		.id = SNOR_ID(0xc2, 0x25, 0x3c),
>  		.name = "mx66u2g45g",
>  		.size = SZ_256M,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  		.fixup_flags = SPI_NOR_4B_OPCODES,
> +		.fixups = &macronix_qpp4b_fixups,
>  	}, {
>  		.id = SNOR_ID(0xc2, 0x26, 0x18),
>  		.name = "mx25l12855e",

Could you also please share the SFDP dumps of these flashes with us?

Thanks,
-michael
