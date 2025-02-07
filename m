Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4B32417ED
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 11:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738927982; cv=none; b=OrM81XdrqcIEKJGd3hxiQUD8toGwDexlFNaKFunYAsRfnr9SQaRAId+KoNUtj13LUh025Ku70Vv4oD+PXqVZ3UPpln1lP0mWPF9wHUW/Zf1VxciFwvw3tlc9spoJJ3PRT24zHbXHF8tvEsUorIHZwK5B9JiXE9DlyN1NhXfDX4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738927982; c=relaxed/simple;
	bh=yPbCpc9GhZJ7ZubvWj9Nq6sB/bAQG+9/7K4H+EVldjA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EEC+ijTkg00eRHn9nrDbj7AsGSI0+jhyHo/jitcQ2+0tTaYw4KMO7JQjW48j7Xmo06+I9qRV7t233spG/1K87DZrkxio5cAikbW4QGkdKe6eer0imZWkkZC3IW+bhpOfVPh0RmGWCAxqShOj3ddxEm/pdquNfFI3E6Hq5Oyc9gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/lrvzqp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/lrvzqp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81DEBC4CED1;
	Fri,  7 Feb 2025 11:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738927981;
	bh=yPbCpc9GhZJ7ZubvWj9Nq6sB/bAQG+9/7K4H+EVldjA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=O/lrvzqpFKwCz8mmFn2c27sF7vhcuUvSX3hxRNTWkKjVsnODJC/6TT0ZHt6uIz+ok
	 LrZ7lPNVuw+C2jEx0PSaqdMjD7M6W4Fu5PG0zSUkwiGTQ3gKKe3uPNCW7VvDx0brXU
	 McwSM3uYTzNFEnGU2xDHpgmW2M812upbCG9fbeZJA5wCUvthAuOsNZ9z7IKZyWVEbM
	 /qliyqTEW/ebcJBvVzdZa2EsBDd5ow6cuyiblkYE9mbd9cbfxQ+PKMDbShOQA5fBAg
	 LExTVeY2U7OjuhNrILAjyJuEUqdTpTM0qtYnVtKiybJ1nGZheOIyCGTZEOUFU6vBQl
	 BF1/53ruOiaAw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Cheng Ming Lin <linchengming884@gmail.com>,  tudor.ambarus@linaro.org,
  pratyush@kernel.org,  miquel.raynal@bootlin.com,  richard@nod.at,
  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  alvinzhou@mxic.com.tw,  leoyu@mxic.com.tw,
  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH 2/2] mtd: spi-nor: macronix: Add support for Macronix
 NOR Flash
In-Reply-To: <811f5b9d7b2842a3e1293ac6a0bb3b70@kernel.org> (Michael Walle's
	message of "Fri, 07 Feb 2025 09:39:34 +0100")
References: <20250207081846.362919-1-linchengming884@gmail.com>
	<20250207081846.362919-3-linchengming884@gmail.com>
	<811f5b9d7b2842a3e1293ac6a0bb3b70@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Date: Fri, 07 Feb 2025 11:32:58 +0000
Message-ID: <mafs0frkqyoph.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Feb 07 2025, Michael Walle wrote:

> Hi Cheng,
>
>> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
>> Due to incorrect values in the 4-BAIT table for these two flash IDs,
>> it is necessary to add these two flash IDs with fixups.
>
> What's the part number of these flashes?
>
>> --- a/drivers/mtd/spi-nor/macronix.c
>> +++ b/drivers/mtd/spi-nor/macronix.c
>> @@ -127,6 +127,9 @@ static const struct flash_info macronix_nor_parts[] = {
>>  		.size = SZ_128M,
>>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>>  		.fixups = &macronix_qpp4b_fixups,
>> +	}, {
>
> Although we don't have .name anymore, a comment like
>
> /* <partname> */
>
> is recommended.

+1

I have been recommending this in other patches as well. Going through
commit messages can be tricky. This lets us still identify flash entries
easily. Let's recommend this for all patches going forward.

-- 
Regards,
Pratyush Yadav
