Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037CA22F14D
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747390281; cv=none; b=qwI/Cyj32QHJ173ptOJ+W3+sIx3h53Siv4a4MwYWf65c+qMyYw61X0ZwEzXtzqxwOZ80LFIR5YtoWxkRiTEIz/H57NJ8JNAQcc/gSCs7vp2eB1htUxc4Ke0NE0LLB75w5eEkNONKAYmiQHPXZlYdbVRrhlJoqkysxhSbdA1g6TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747390281; c=relaxed/simple;
	bh=y2qNjTh3pVCado4aiIfEGuoqb7LAKqgmxfuR67aVl/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PdO1ioW6XD7pZMPG9M6K7sXmRGA8F3HMqKtQWezZfAs6eKvcqsTCBnjbVqrBk1PNLatn/EqVxtfrw383pahgzfFhwR7RNoZhUWdFs0VwcLWl/ABDHxjBy/7oeUBZoBotLBWt5vk5RgtXf0RE7owc3wHOpcskejnVXx5CG58c+Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ya7JQhds; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ya7JQhds"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE80FC4CEE4;
	Fri, 16 May 2025 10:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747390280;
	bh=y2qNjTh3pVCado4aiIfEGuoqb7LAKqgmxfuR67aVl/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ya7JQhdshgN9wufIdHXLba8qucqNk/kCRemOsOukAAN5ytl7Z7s7lt3ppiOWfnzw2
	 jQEeTAWy0T3IAbYBgJkLCzJ3rQoEhHt8VE/p2VT3THLpVqPhhN1suH2b7FFFLrblxc
	 2Dg45+z0uiaLrOd9nX2xfcoQJnea7wM6w0ktAEaUr7J4XohrYnP2x7wg+JpGwm94t6
	 J9tpyg1ldQaIWOfIQC752BNNC5BqJMh7KsaeYJISqY8lp0GyOkPWBOsKrHYP7sgTsO
	 jOADjdrE5oIQ2s53LiU93nQpz4337wFbtsUtpn22pif+M6nhIGu2I04qPbntgZ7OTN
	 04bDZ2cztwJHA==
Date: Fri, 16 May 2025 13:11:12 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Donet Tom <donettom@linux.ibm.com>
Cc: David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
	Ritesh Harjani <ritesh.list@gmail.com>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	Dave Jiang <dave.jiang@intel.com>
Subject: Re: [PATCH v4 4/4] drivers/base : Rename
 register_memory_blocks_under_node() and remove context argument
Message-ID: <aCcPQMfLavFUn3Us@kernel.org>
References: <f94685be9cdc931a026999d236d7e92de29725c7.1747376551.git.donettom@linux.ibm.com>
 <bb7bbc113a2f6d3b700f7e73eafd911f77748bbb.1747376551.git.donettom@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb7bbc113a2f6d3b700f7e73eafd911f77748bbb.1747376551.git.donettom@linux.ibm.com>

On Fri, May 16, 2025 at 03:19:54AM -0500, Donet Tom wrote:
> The function register_memory_blocks_under_node() is now only called from
> the memory hotplug path, as register_memory_blocks_under_node_early()
> handles registration during early boot. Therefore, the context argument
> used to differentiate between early boot and hotplug is no longer needed
> and was removed.
> 
> Since the function is only called from the hotplug path, we renamed
> register_memory_blocks_under_node() to
> register_memory_blocks_under_node_hotplug()
> 
> Acked-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
> 
> v3->v4
> 
> Added Acked-by tag
> 
> v3 - https://lore.kernel.org/all/b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com/
> v2 - https://lore.kernel.org/all/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com/
> v1 - https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com/
> ---
>  drivers/base/node.c  |  5 ++---
>  include/linux/node.h | 11 +++++------
>  mm/memory_hotplug.c  |  5 ++---
>  3 files changed, 9 insertions(+), 12 deletions(-)
> 

-- 
Sincerely yours,
Mike.
