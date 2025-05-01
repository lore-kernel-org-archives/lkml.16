Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8418211C
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 18:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746124747; cv=none; b=MSKufKo5hVMFG5ubc7DqcI1wu6Oizqo3BqDqRkaElWLySE4VQQ7QEE5rWYqWa8G9bo/gufmzESNfFI81z679uKN9C5Gn3zO8pul4O/JMB1yjRAdcQgov5P5tFEIkHO/kii2248/u+HZF+7ELwaZu4tmhNyH8DvN3ytXo2KjD6t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746124747; c=relaxed/simple;
	bh=Goye1x/HyHip0UrVYbT2JZFfKNXpUJQqQJ9Ln9SeZ7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=foBPF53z4ojDI6+7QNjqXjcOTaw3uQfoj0tYMXMPL0MpUw+jkMAGlArEgrpuuSkWXlO6nFsXevcQZY+phxaI/WPyLCz0DSJ/38PYGmE8zdF9xl67Ywfh91PL+U7n/tT2cIcC+LWt0KwBoiP0nWm2cFrsdYFD6H9nDepIgxuTeJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Dzu19DB+; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Dzu19DB+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZRGNnZIibSpQ4Mgi891kL5PuMPNjxsoIayZPZFiUSA8=; b=Dzu19DB+UuRCz7HSqaOtKYImi+
	6UyQ7BtWPDSVCV8lRzh6nOrPbePI3MqXWkp7bsr186yx15qq8g11qR7f0JORQ6dxlSRLz4HHHzf66
	AD4spY2/bSYSrm6kpGq2lY+YakjNlmFIS/UufZ2IkPvych1wzKDkyhL1XTQIe4yUNgLkMDJHw6m2N
	dWRRf/7tdpSifsKT8ugr6/csSeT3MVkYwrKrtUKsGqVQ+fA++/YzG+LZWhjTajISfHME8suR1jS8+
	6Jna9s7jnqgd1RYIxR9cB4EcAXDEAEidGbBn3zkboyWsK6s5P6J1zd7Nw75M4FgMznKDBzi+GGYRI
	r/iicqWg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAYnV-00000005ULO-3bFC;
	Thu, 01 May 2025 18:38:13 +0000
Date: Thu, 1 May 2025 19:38:13 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Juan Yescas <jyescas@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, tjmercier@google.com, isaacmanjarres@google.com,
	surenb@google.com, kaleshsingh@google.com,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Minchan Kim <minchan@kernel.org>
Subject: Re: [PATCH] mm: Add ARCH_FORCE_PAGE_BLOCK_ORDER to select page block
 order
Message-ID: <aBO_laRsZDYgjEfL@casper.infradead.org>
References: <20250501052532.1903125-1-jyescas@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501052532.1903125-1-jyescas@google.com>

On Wed, Apr 30, 2025 at 10:25:11PM -0700, Juan Yescas wrote:
> Problem: On large page size configurations (16KiB, 64KiB), the CMA
> alignment requirement (CMA_MIN_ALIGNMENT_BYTES) increases considerably,
> and this causes the CMA reservations to be larger than necessary.
> This means that system will have less available MIGRATE_UNMOVABLE and
> MIGRATE_RECLAIMABLE page blocks since MIGRATE_CMA can't fallback to them.
> 
> The CMA_MIN_ALIGNMENT_BYTES increases because it depends on
> MAX_PAGE_ORDER which depends on ARCH_FORCE_MAX_ORDER. The value of
> ARCH_FORCE_MAX_ORDER increases on 16k and 64k kernels.

Sure, but why would any architecture *NOT* want to set this?
This seems like you're making each architecture bump into the problem
by itself, when the real problem is that the CMA people never thought
about this and should have come up with better defaults.
