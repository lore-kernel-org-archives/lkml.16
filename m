Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1DB28D85F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750166888; cv=none; b=RAWFmLijArY5r8o1el/hj2QrCWMgrgIG9OoaDE2myV1T0Lf90X24lNVwhbKmBoD951hgWAerpncchh0MGCxy8iMqXb6SLCcfohR05fuPe0ixKps2bF6FzpJsHmhnlWBuDcWNgsxrBSJBxFF0fRPWQGQ7LfNh0FOPfLNTfNsTYic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750166888; c=relaxed/simple;
	bh=slmPbCvNdOgtRAF/GHkxlsdVC4CumGpF4kv+p2UJs3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EMNKxI/VVY4vtKfcKfCIc62lPNGNwDuHtBfT/9KMTxcYwKfrSKDtUvpg06HF31c/al/okB89VkUdZFZn2Vc9jNy+Fdp0rGLqEMwJ/5TxvtCBky6TrveLSbAjMI00h9yWuUaLxZWF5JA5W4awY51NQSy9mgZVvwIxeKJTHwXqv60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88CA8C4CEF0;
	Tue, 17 Jun 2025 13:28:06 +0000 (UTC)
Date: Tue, 17 Jun 2025 14:28:04 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Song Liu <song@kernel.org>
Cc: Will Deacon <will@kernel.org>, Dylan Hatch <dylanbhatch@google.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
Subject: Re: [PATCH v7] arm64/module: Use text-poke API for late relocations.
Message-ID: <aFFtZHixBfFDHv6m@arm.com>
References: <20250603223417.3700218-1-dylanbhatch@google.com>
 <20250612151859.GD12912@willie-the-truck>
 <CAPhsuW5jhwxcd01XBwLJxsP46a+P2sPLcZwtxAX3h7U1=JV_tA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPhsuW5jhwxcd01XBwLJxsP46a+P2sPLcZwtxAX3h7U1=JV_tA@mail.gmail.com>

On Mon, Jun 16, 2025 at 03:35:14PM -0700, Song Liu wrote:
> What's our plan with this set and [1]? Once we land these two sets, I
> will respin [2] which enables livepatch for arm64. We (Meta) are hoping
> to land these in linux-next soon, and back port them to our kernels.
[...] 
> [1] https://lore.kernel.org/linux-arm-kernel/20250521111000.2237470-1-mark.rutland@arm.com/
> [2] https://lore.kernel.org/linux-arm-kernel/20250320171559.3423224-3-song@kernel.org/

I plan to queue (for 6.17) this patch and Mark's reliable stacktrace
series sometime this week.

-- 
Catalin
