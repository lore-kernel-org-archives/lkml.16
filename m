Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244278F58
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747390249; cv=none; b=mKIFt1S1Q8WIatdrXF/rTUj8NCyYF9MAjPe+VqLpRJgW7iUcjXvKkwG8Eb4Pe3q7ZE7YNAU/DOild7W0Yrw0HtmyZ67AlycXbNiDbhC85A4mYxmAPQD7umCUh+p1w2fiIrYXaeTXf/m5vumMrd6Ka5sH+lraI+AfYr8tQ0ag8z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747390249; c=relaxed/simple;
	bh=nJMnMk864bD0yjxvNLVC5z9JnUPyx+NfeeAg3CAITUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/wgJkbRa263GpUegT4Zr63HdCAXyAAiiG4X1hj1c9lTqvV+ZVuMbujdeXB5D5gGwUsvtHvL7r2npEixyHXPi4vSJyPx8ee6iJu4JKH2GbGa7am28o9CJclWTnIyl2lpFI3XtC3ZCYyj7D90FVKQiliL+S0bQbBCyhsG7kt9bc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uhny24M/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uhny24M/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 718C4C4CEE4;
	Fri, 16 May 2025 10:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747390248;
	bh=nJMnMk864bD0yjxvNLVC5z9JnUPyx+NfeeAg3CAITUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uhny24M/hraIhlTWniNLaGqBksLnOLG9/E8mftFMioFIReKD6VIcq8NbuEErbZlgR
	 XGb77Exg3Dg+jXzyuc0IFJrr2y8MQh44Ct+QvDbpVKadJMo+GXJac5rdyp0WMd35p1
	 6dc12fNI+zEEuIgIDOen4ev67dv1l1SpuRniHjtAELOzfbOP3w3z0qreEtFiqJ5Abw
	 mddI58Raui5aPsWwTsA1VqB7E8e5d3jWpiisVH+lw+iUP7s4pYcT3/Wpl7qBXNY1Zn
	 mhMy5sCvhWg9MS/4c1wM0xxOMAAwE6QrDADIW2zsD/MRAxXaOZWNZl7uleWGC9d4Rf
	 YuluXlK8Wi69g==
Date: Fri, 16 May 2025 13:10:39 +0300
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
Subject: Re: [PATCH v4 3/4] Remove register_memory_blocks_under_node()
 function call from register_one_node
Message-ID: <aCcPHwjaWxhHr4Nh@kernel.org>
References: <f94685be9cdc931a026999d236d7e92de29725c7.1747376551.git.donettom@linux.ibm.com>
 <e0ef6ae9348f46bcc135f0e6cb7663d763e40b72.1747376551.git.donettom@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0ef6ae9348f46bcc135f0e6cb7663d763e40b72.1747376551.git.donettom@linux.ibm.com>

On Fri, May 16, 2025 at 03:19:53AM -0500, Donet Tom wrote:
> register_one_node() is now only called via cpu_up() → __try_online_node()
> during CPU hotplug operations to online a node. At this stage, the node has
> not yet had any memory added. As a result, there are no memory blocks to
> walk or register, so calling register_memory_blocks_under_node() is
> unnecessary. Therefore, the call to register_memory_blocks_under_node()
> has been removed from register_one_node().
> 
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
> v3->v4
> 
> Addressed Mike's comment by dropping the call to
> register_memory_blocks_under_node() from register_one_node()
> 
> v3 - https://lore.kernel.org/all/b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com/
> v2 - https://lore.kernel.org/all/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com/
> v1 - https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com/
> ---
>  include/linux/node.h | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/include/linux/node.h b/include/linux/node.h
> index 806e62638cbe..8b8f96ca5b06 100644
> --- a/include/linux/node.h
> +++ b/include/linux/node.h
> @@ -137,15 +137,9 @@ static inline int register_one_node(int nid)
>  	int error = 0;
>  
>  	if (node_online(nid)) {
> -		struct pglist_data *pgdat = NODE_DATA(nid);
> -		unsigned long start_pfn = pgdat->node_start_pfn;
> -		unsigned long end_pfn = start_pfn + pgdat->node_spanned_pages;
> -
>  		error = __register_one_node(nid);
>  		if (error)
>  			return error;
> -		register_memory_blocks_under_node(nid, start_pfn, end_pfn,
> -						  MEMINIT_EARLY);
>  	}
>  
>  	return error;
> -- 
> 2.43.5
> 

-- 
Sincerely yours,
Mike.
