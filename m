Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF2E23A99F
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 11:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746185861; cv=none; b=L+fBYabKGy+1P4eNP2jztXIkFBCA5EmH8cCBc9fdir5iSIU/veADWPowE49GZ+dV/sGqaJsj5wg0n3de/dKIKauhGcSfqvoYKv8v6GWYisQc4yZhAN6Xz6S3ra3rBBe3hCPcagVrOWoAU1pGdZJl/672dzXCbZr7WfaDUoC0abk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746185861; c=relaxed/simple;
	bh=R20iTsL1Y4YvlVm8x3qRJWYAMGHK+p/fYIgio9JtTZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pmigS6ee26PYttPNE0XgytkeWXgZm15vTssops9OAUvU3I4IWoQ1B7fCsbUDGmAEWup1PCgXVS+/jiZrCay64YcFp3K6QcCaPtsyWpxZT2G3obe1k260f5+jegvSw/6DTtkURJKhuUPRGXZhPadnSdkqX3o7CHRikLd6Xc1ZuII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pahvfXyj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pahvfXyj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B483FC4CEE4;
	Fri,  2 May 2025 11:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746185860;
	bh=R20iTsL1Y4YvlVm8x3qRJWYAMGHK+p/fYIgio9JtTZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pahvfXyjZ5Dvyicm+QYm1c4GBlnYwFUo37WyNHQYg4rZ4tXSLnW6MWu1dQPlqZuh3
	 Arb4MPurEbwWh3sqjgD+XcEbbz65PYsq9QDyAZJZHZ7zU5gA60nId8r+/JC2XdP83/
	 uhjA3vHt1FmyP1oYjidjDE2IZQyOu7AWVW8vQa15ML8P50MSFbcwOW9M3DArL5Lyc6
	 D3uNniMczKv1nS0UMdb1xBui+IOuEmKiicXyMC5FSMR2vAbMsdCDyKeJNbUWb7rMQS
	 o9tpv2WMFJDlw9P4tHoMK0zRX+OK0jWzMb4YDiPxh0PemAoxClRecvz4n0PUBq/xmJ
	 O4J+naEHpBQWQ==
Date: Fri, 2 May 2025 12:37:34 +0100
From: Will Deacon <will@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Juan Yescas <jyescas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
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
Message-ID: <20250502113733.GA29622@willie-the-truck>
References: <20250501052532.1903125-1-jyescas@google.com>
 <aBO_laRsZDYgjEfL@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBO_laRsZDYgjEfL@casper.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, May 01, 2025 at 07:38:13PM +0100, Matthew Wilcox wrote:
> On Wed, Apr 30, 2025 at 10:25:11PM -0700, Juan Yescas wrote:
> > Problem: On large page size configurations (16KiB, 64KiB), the CMA
> > alignment requirement (CMA_MIN_ALIGNMENT_BYTES) increases considerably,
> > and this causes the CMA reservations to be larger than necessary.
> > This means that system will have less available MIGRATE_UNMOVABLE and
> > MIGRATE_RECLAIMABLE page blocks since MIGRATE_CMA can't fallback to them.
> > 
> > The CMA_MIN_ALIGNMENT_BYTES increases because it depends on
> > MAX_PAGE_ORDER which depends on ARCH_FORCE_MAX_ORDER. The value of
> > ARCH_FORCE_MAX_ORDER increases on 16k and 64k kernels.
> 
> Sure, but why would any architecture *NOT* want to set this?
> This seems like you're making each architecture bump into the problem
> by itself, when the real problem is that the CMA people never thought
> about this and should have come up with better defaults.

Yes, I agree. It would be nice if arm64 wasn't the odd duck here. You'd
think Power and Risc-V would benefit from similar treatement, if nothing
else.

Will
