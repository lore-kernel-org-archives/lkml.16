Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A27826F47E;
	Fri, 11 Apr 2025 09:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744363576; cv=none; b=AAOgSKC9vqIiTGJeFcwVUpusPjMgO2bLcKRe0mHZPCubMjicZ/tfmA3OcillQv0x6RTDNdPfhGZaDjHQJAvINiZY2RdG6WM0Zb1SHl4Mz/kl7IDb3TkQv6JAYTktAptgOhR9ScsPnePzz9+JeImDTsAE6shnjP+tLEB2g+Euojg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744363576; c=relaxed/simple;
	bh=1GA7LREm/BQkDsrQ0uQwA8w5OKgH4R1/3Ayr87qT8ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iqx9z2xIoULOV/lpCGx2L2cj3yLjZ7WyNzUh2DfBWyJ2Mw24QEGQdx5bY5iVgGJwjUjlzc+YnCuGgzcxPPRViRUfuQPnwplp0O9rRTuhhr7WF/yN3kL8H47LdVK5BirbSCkjO99ZZCtLq/lVzNrBH3hdmzZJF/xhQny4cAKVTro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A+KobQ49; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A+KobQ49"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 832D5C4CEE2;
	Fri, 11 Apr 2025 09:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744363575;
	bh=1GA7LREm/BQkDsrQ0uQwA8w5OKgH4R1/3Ayr87qT8ak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A+KobQ492J08CL9brj4qTrdUl/AkYvPJXaLsKlIQ7nujBoigwX5i3xDXQ+6x7UmWq
	 bkOW5wqFpi27G+tF9kJNOgU0o86vdzuypB+pElRDPnktAtRrGe2J1bqg7Tulj5xT9I
	 mFZfIzIABt42JjE1Y4XyhF8CoCYUx/wSGXWFcxZ2s7FBT3kHwFmoQ4x+J9blspCWqu
	 0kSl2NLm8tzFvteMPRgLFbz21XmSza0ehkkPu27Bug3KqKErMbPbnxPEqdWDz9pdlQ
	 79/GSgjL2kqhtzQuHYp2rfU8NbQWKV2g2Y1oLKXUm/5YXc8zLc8ce/rjX37i2WXo3M
	 z1dJZjMXzilXQ==
Date: Fri, 11 Apr 2025 11:26:07 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Liam.Howlett@oracle.com, ast@kernel.org
Subject: Re: [PATCH 20/24] irqchip/gic-v5: Add GICv5 LPI/IPI support
Message-ID: <Z/jgL52ZVdcxTEkP@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-20-1f26db465f8d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408-gicv5-host-v1-20-1f26db465f8d@kernel.org>

[+Liam, Alexei, since I mentioned to them this maple tree "usage"
in the past, in case they see a point in chiming in]

On Tue, Apr 08, 2025 at 12:50:19PM +0200, Lorenzo Pieralisi wrote:

[...]

> The LPI INTID namespace is managed using a maple tree which encodes
> ranges, add code to alloc/free LPI INTIDs.
> 
> Maple tree entries are not used by the driver, only the range tracking
> is required - therefore the driver first finds an empty area large
> enough to contain the required number of LPIs then checks the
> adjacent (and possibly occupied) LPI ranges and try to merge them
> together, reducing maple tree slots usage.

The maple tree usage for this purpose is an RFC at this stage.

Added Alexei because I know BPF arena used the maple tree in
a similar way in the past and moved to a range tree because
the BPF arena requires a special purpose mem allocator.

As Thomas already pointed out a plain bitmap could do even though
it requires preallocating memory up to 2MB (or we can grow it
dynamically).

We could allocate IDs using an IDA as well, though that's 1 by 1,
we allocate LPI INTIDs 1 by 1 - mostly, upon MSI allocation, so
using an IDA could do (AFAIU it works for 0..INT_MAX we need
0..2^24 worst case).

I don't want to abuse the maple tree for this purpose, opinions
welcome, it is just to understand if there are core code structures
that can be reused.

IDs allocation snippet below.

[...]

> +static struct maple_tree lpi_mt;
> +static u32 num_lpis;
> +
> +void __init gicv5_init_lpi(u32 lpis)
> +{
> +	mt_init_flags(&lpi_mt, MT_FLAGS_ALLOC_RANGE);
> +	num_lpis = lpis;
> +}
> +
> +void __init gicv5_free_lpi(void)
> +{
> +	mtree_destroy(&lpi_mt);
> +	num_lpis = 0;
> +}
> +
> +#define MT_ENTRY	((void *)&lpi_mt) /* Unused - just a valid pointer */
> +
> +static int alloc_lpi_range(u32 lpis, u32 *base)
> +{
> +	int ret;
> +	void *entry;
> +	unsigned long lpi_base, startp, lastp;
> +
> +	MA_STATE(mas, &lpi_mt, 0, 0);
> +
> +	if (!num_lpis)
> +		return -ENODEV;

s/ENODEV/ENOSPC

> +
> +	mtree_lock(&lpi_mt);
> +	ret = mas_empty_area(&mas, 0, num_lpis - 1, lpis);
> +	if (ret) {

//Fixed
+		mtree_unlock(&lpi_mt);

> +		pr_err("Failed to perform a dynamic alloc in the LPI MT!\n");
> +		return ret;
> +	}
> +
> +	lpi_base = mas.index;
> +
> +	/*
> +	 * We don't really care about the entry itself, only about
> +	 * allocation of a maple tree ranges describing in use LPIs.
> +	 * That's why, upon allocation, we try to merge slots adjacent
> +	 * with the empty one we are allocating to minimize the number
> +	 * of slots we take from maple tree nodes for nothing, all
> +	 * we need to keep track of is in use ranges.
> +	 */
> +	startp = mas.index;
> +	lastp = mas.last;
> +
> +	entry = mas_next(&mas, num_lpis - 1);
> +	if (entry && mas.index == lastp + 1)
> +		lastp = mas.last;
> +
> +	entry = mas_prev(&mas, 0);
> +	if (entry)
> +		startp = mas.index;
> +	mas_set_range(&mas, startp, lastp);
> +	mas_store_gfp(&mas, MT_ENTRY, GFP_KERNEL);
> +	mtree_unlock(&lpi_mt);
> +
> +	// startp is the index at which we allocated, i.e. the base LPI.
> +	*base = lpi_base;
> +
> +	return 0;
> +}
> +
> +// Drop entries between min and max (inclusive)
> +static int release_lpi_range(u32 min, u32 max)
> +{
> +	return mtree_store_range(&lpi_mt, min, max, NULL, GFP_KERNEL);
> +}

Thanks,
Lorenzo
