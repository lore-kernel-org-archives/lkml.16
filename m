Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D471629A9E1
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749741544; cv=none; b=GM5SAeqIPYEvdbn71wYbhYYTSXSUO5dhTlkHXl7AcCRm/owXrwZGW/0iZpt7VWu9nyacBUs5+mY1KkUnA/4t0Ux3MJsYFsixF9ejwDI/Uxf8HAqCBW1Au0jl8pwlR9LNq67Lkn6LIjeVnOX6mkbjWje8+Tcn9ejH4ab8ZSnd8Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749741544; c=relaxed/simple;
	bh=ph4NrsjjtamLfSRGSV8IrWFOeVnkUjNMXGKpS7G1gOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GJimNtIEORAyQiPcccSQZMmW4jlwfKUyD3zYvC27njmnJJ3eJTOSSyb/uDB2vlvlCld5l+6edgk7kKkYT/nJZhSVivG1rwEpEHOZ3jYrgW8/U1/LgIctQafl7t5AYc8DAMsdD30Gtngt0Z6qtsE/9hLvunakK3aPbZ3RD9hhImY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KxnDutY6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KxnDutY6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E28CFC4CEEA;
	Thu, 12 Jun 2025 15:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749741544;
	bh=ph4NrsjjtamLfSRGSV8IrWFOeVnkUjNMXGKpS7G1gOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KxnDutY6UJEe6l2TzebzS3WVZS27DCvR2GXMecLqwD6dU1rOKbP6mMgNjjTFDEQ8r
	 mietXp/OMOfHCfBPBIDifj860usNRyGuFVBXTXYg0NWuEcEQ4GKNKfKZS/iAVLutrL
	 ENCgfSxNVkJyhwkitubz6H9t//6MbpbXfZkz34NvZlr4FcJIH0YPHihmt6D0XL0Rb3
	 nWDdL5JO3AlpOMVa15tcXaAKEJG3YWYnE3fUqqhPHR+d9759WY4X3RMy6IbAvTItzu
	 Dk/1VGJP79u6HvSRfd3hpUbYBE5sR+Y4CnS8mkitcdMYNEQZJGzTm+YYp4DqXAr/0m
	 +mqRWtxhFhypQ==
Date: Thu, 12 Jun 2025 16:18:59 +0100
From: Will Deacon <will@kernel.org>
To: Dylan Hatch <dylanbhatch@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Song Liu <song@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
Subject: Re: [PATCH v7] arm64/module: Use text-poke API for late relocations.
Message-ID: <20250612151859.GD12912@willie-the-truck>
References: <20250603223417.3700218-1-dylanbhatch@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603223417.3700218-1-dylanbhatch@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Jun 03, 2025 at 10:34:17PM +0000, Dylan Hatch wrote:
> To enable late module patching, livepatch modules need to be able to
> apply some of their relocations well after being loaded. In this
> scenario however, the livepatch module text and data is already RX-only,
> so special treatment is needed to make the late relocations possible. To
> do this, use the text-poking API for these late relocations.
> 
> This patch is partially based off commit 88fc078a7a8f6 ("x86/module: Use
> text_poke() for late relocations").
> 
> Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
> Acked-by: Song Liu <song@kernel.org>
> ---
>  arch/arm64/kernel/module.c | 101 +++++++++++++++++++++----------------
>  1 file changed, 57 insertions(+), 44 deletions(-)

Thanks for sticking with this, Dylan:

Acked-by: Will Deacon <will@kernel.org>

Catalin, I assume you'll pick this up for 6.17.

Cheers,

Will
