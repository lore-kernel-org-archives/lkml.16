Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4FC2E11DB
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 07:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749972784; cv=none; b=Wer3VsI02V50r9m8EmVTxXo5XiZI+eNzMlGBuOTUVqHDOUrpjXIZRQ5LEX9WBOUkH2bhICUHybRHhTBFAd6paxnEOhyssdjL7fZ07lTJZWAeH1+ASMTzvY+4tJQspFjybUbBTyN49MDrG/C3ramNw+CUj4KWlqj9TtG8IYnyEmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749972784; c=relaxed/simple;
	bh=ykudC0+no0iilN4butkJwk8mXZbTEnB+zY/KM0JFPEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PUpFhgaLtA6EwY/79u9zoCXB2Fqw1P7dhclc4XOAzzJFLu/0Hc00O2UYGAxEUGZNGBQp525mFBtGtAx4DB0kfu6Q0Yg0oCSFyWUiy1s49A2u6olJGbMfL18c88JR52NmnhDXwG26hCLY2tETwgf1DHWlidUy9tN1O1Ta0Y445q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IJuElzMU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJuElzMU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 208D4C4CEE3;
	Sun, 15 Jun 2025 07:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749972783;
	bh=ykudC0+no0iilN4butkJwk8mXZbTEnB+zY/KM0JFPEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IJuElzMUTv8SfPQxgLvhjHzJ3f9fOBrzL+zteUNVUtl4xBR8FZL2lgfNDLQBXGMQ7
	 0zUJt93LVEtexmyyc26exBRT/Zznt3xjQXl6o4d4xYLYriKfRdzKIWZ9vEm7lZeqeC
	 9NSHNEz0c59zdQUgFm9u3ThPQjXn+bSmqIoKhgvSv/OcAwoH/XW4R5nJtW5BMIwJiv
	 TVd8mkbVwEERuR6VGAHcnhdcMVJuxy9C3VUfLcm4dH4PAb499sl/yY/RkpGnI7TROa
	 Aplxjxbgav6cylupbND1LduzSHFqAkZsKqpc6M1gsxOVr0e1Oan/l4lHkxYtI7yc2g
	 ZtNUkhSSPzK7Q==
Date: Sun, 15 Jun 2025 10:32:54 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, catalin.marinas@arm.com,
	will@kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, surenb@google.com,
	mhocko@suse.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	suzuki.poulose@arm.com, steven.price@arm.com, gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org, yang@os.amperecomputing.com,
	ryan.roberts@arm.com, anshuman.khandual@arm.com
Subject: Re: [PATCH v3 1/2] arm64: pageattr: Use pagewalk API to change
 memory permissions
Message-ID: <aE53Jp7ZGgTxtxwG@kernel.org>
References: <20250613134352.65994-1-dev.jain@arm.com>
 <20250613134352.65994-2-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613134352.65994-2-dev.jain@arm.com>

On Fri, Jun 13, 2025 at 07:13:51PM +0530, Dev Jain wrote:
> -/*
> - * This function assumes that the range is mapped with PAGE_SIZE pages.
> - */
> -static int __change_memory_common(unsigned long start, unsigned long size,
> +static int ___change_memory_common(unsigned long start, unsigned long size,
>  				pgprot_t set_mask, pgprot_t clear_mask)
>  {
>  	struct page_change_data data;
> @@ -61,9 +140,28 @@ static int __change_memory_common(unsigned long start, unsigned long size,
>  	data.set_mask = set_mask;
>  	data.clear_mask = clear_mask;
>  
> -	ret = apply_to_page_range(&init_mm, start, size, change_page_range,
> -					&data);
> +	arch_enter_lazy_mmu_mode();
> +
> +	/*
> +	 * The caller must ensure that the range we are operating on does not
> +	 * partially overlap a block mapping. Any such case should either not
> +	 * exist, or must be eliminated by splitting the mapping - which for
> +	 * kernel mappings can be done only on BBML2 systems.
> +	 *
> +	 */
> +	ret = walk_kernel_page_table_range_lockless(start, start + size,
> +						    &pageattr_ops, NULL, &data);

x86 has a cpa_lock for set_memory/set_direct_map to ensure that there's on
concurrency in kernel page table updates. I think arm64 has to have such
lock as well.

> +	arch_leave_lazy_mmu_mode();
> +
> +	return ret;
> +}

-- 
Sincerely yours,
Mike.
