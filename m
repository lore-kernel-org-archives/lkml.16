Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0632701C1
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 19:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746474946; cv=none; b=sGfyLt7cLkOIYspo/tOFBzgz7CRDxVXIUmgc7k/G6LusIvLKEG6SCtcTWeKc2+BWWEVnG0m4g3Rwt1/M/vq7FVhv6Jkxa+38CxsfO/piIMyf0EA+WBrErzUNuR77whjI7acpV0NVYw+GRG3C2SP1FWRQkKuzag03mvv6iKcs4M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746474946; c=relaxed/simple;
	bh=L4cJBh4QadWxFwm5BsV9IjkPITHxKnQJC5NAzh+MdqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSeXLhDTXpIa0R82rHr/f9g1I3DleNmy8y6FLtsFCXZE1NKeIp+ljhxWRg8xLrvOk7REqJz9ZrRNxPKKPpvmoXWccXMZj4XV+mWv3570HSjkExaE7v8hft/H+ukBwjL4ZsoNipZwAl45u9FHjO7M4zU9X1lBmRHemA+fVN/EO2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=W4m1nZTj; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="W4m1nZTj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=j2SQb8hZ6DGcQpl9C/t6T558dF/akXvjLFqV7DWs3n4=; b=W4m1nZTjTijhwcW+7mKbAmy8Lq
	bEbGdVTnv5ReeahvpTxU/dnh2ZodkVkQC5l/onTpn7LL8rgDkDgsdCJzuhFEydPNc5rvKm10pZKZr
	5D9PK+M9WaCL1CZzAZYlLyOKY/Ism0gYyj+YtN9LT9IocgPPSiLrVi8sySHu9nsEyo7DHVfXDKfDm
	WGL8v6BOttamPOIkvFg+PLB4o+yWi7Kukrk53OXS0jXEApz6KMpiZHrbgLveXtexrnPSW6/6+INDp
	U/wa5krBqIdxXrwNBKpEnLEGama4gyoQOjFajZuWBZPxDRVv/llB6NtH/z/zFVyx4pYmdudUEvcyx
	rQvFjHxw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC1ue-0000000Gwtg-33nY;
	Mon, 05 May 2025 19:55:40 +0000
Date: Mon, 5 May 2025 20:55:40 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Juan Yescas <jyescas@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, tjmercier@google.com,
	isaacmanjarres@google.com, surenb@google.com,
	kaleshsingh@google.com, Vlastimil Babka <vbabka@suse.cz>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Minchan Kim <minchan@kernel.org>
Subject: Re: [PATCH v2] mm: Add ARCH_FORCE_PAGE_BLOCK_ORDER to select page
 block order
Message-ID: <aBkXvB2jcxVf95uN@casper.infradead.org>
References: <20250505185642.2377724-1-jyescas@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505185642.2377724-1-jyescas@google.com>

On Mon, May 05, 2025 at 11:56:21AM -0700, Juan Yescas wrote:
> Solution: Add a new config ARCH_FORCE_PAGE_BLOCK_ORDER that
> allows to set the page block order in all the architectures.

... but it's no longer per-ARCH, so this should not be in the ARCH_
namespace.

>  /* If huge pages are not used, group by MAX_ORDER_NR_PAGES */
> -#define pageblock_order		MAX_PAGE_ORDER
> +#define pageblock_order		PAGE_BLOCK_ORDER

You need to update the comment too.

