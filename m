Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5DA221DA8
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 16:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749745298; cv=none; b=epw2KsXFVrFx656dA6dsgmGmo19zVV2PlvXqecy2ZGL1RQ/ox985lkzyUG8eNx4rUnmgiR0J75MnSvxm0w2r4qKKrAUYSY51r/0uLTI+5bjSejyK07qXLbrGKUvN7XlhdixccmiFNzW3bBdbWD7g/pcljCsDR/NccCit71AtRcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749745298; c=relaxed/simple;
	bh=b9Hf0WPhn4uw3DVMdJKhxVedk7FYy5EqXqMjYHx2F6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JSdInBgN1LBJMfUT6mI9WWwTjEcnMJxTU9FK5UuVQziLKkQvP7ZuTVhbfNJpj59AiM8sneDrqZJy/qL9vI23lljhXZhEDLu5YcfTxtgCY59yUN21Uc1ngVL/bWUc/wNyHDlORCoxP8ON3etnEsmt49qdmSlpl+PN4q7sdnkVedQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K2tHT2pj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2tHT2pj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A41C4CEEA;
	Thu, 12 Jun 2025 16:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749745297;
	bh=b9Hf0WPhn4uw3DVMdJKhxVedk7FYy5EqXqMjYHx2F6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K2tHT2pjNNFyGTI7QqFHYxO7jPygLm+ZPhIaIk6lAiIgNavT3XHHy22/3gYN1wOre
	 Pi3xQLnycnlxVyIANsgk9o5ZaHa80lN3u7tdLrgbGRNVfGnIUaGTJz8UB/Qzp+lss4
	 VALutvube9kFU1MjAlxyJdTs2nAo43jfUylbtZST1BKfjlm8ebuS/Ql2OV1XGXitMV
	 sgXFf1gf7uzGkdPNCjLxy6XBox/GtLISdMASHkBaPvDbzsAV/e3jJOVppnfPekR9aA
	 Z8LjtYm+IoaYdznsutv/8a9k7ifoZqw/ziDcAN2p5bpPn+lDphBhywT9T+hDLVyxsl
	 HwEaLBfujsu8Q==
Date: Thu, 12 Jun 2025 17:21:33 +0100
From: Will Deacon <will@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64/mm: Ensure lazy_mmu_mode never nests
Message-ID: <20250612162132.GB13202@willie-the-truck>
References: <20250606135654.178300-1-ryan.roberts@arm.com>
 <aEgeQCCzRt-B8_nW@arm.com>
 <3cad01ea-b704-4156-807e-7a83643917a8@arm.com>
 <aEhKSq0zVaUJkomX@arm.com>
 <b567a16a-8d80-4aab-84c2-21cbc6a6a35d@arm.com>
 <20250612145906.GB12912@willie-the-truck>
 <066fa735-98ad-45f4-9316-b983d2e5a3d3@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <066fa735-98ad-45f4-9316-b983d2e5a3d3@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Jun 12, 2025 at 05:00:51PM +0100, Ryan Roberts wrote:
> On 12/06/2025 15:59, Will Deacon wrote:
> > To be honest, I don't think the proposal in this series is really
> > improving what we have. Either we support nested lazy mode or we don't;
> > having __kernel_map_pages() mess around with the lazy mmu state because
> > it somehow knows that set_memory_valid() is going to use it is fragile
> > and ugly.
> > 
> > So I'm incined to leave the current code as-is, unless we can remove it
> > in favour of teaching the core code how to handle it instead.
> 
> Yeah fair enough. I'm not going to have time to do the proper nesting support
> thing. But I'll see if I can find someone internally that I might be able to
> convince. If not, we'll just leave as is.

Sounds fine by me, thanks Ryan.

Will
