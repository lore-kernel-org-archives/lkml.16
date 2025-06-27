Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F962E8E08
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039083; cv=none; b=FCzGCItNsa79N5BlmRb1bWQyoDCuCWZqJMoWjtSxkwhrxLvuT1XaxAzZmesVACrxf/x4c6wVg7eqOrD0MyWGYx/4mLC2kpkPwTDFcZxOU6bGvUOW0ng47Mnkp7E1Kk3nAVWa2frs7G62oAy0s0HI6JG9ID6f4GsC0WD648noCJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039083; c=relaxed/simple;
	bh=LURfJhqAl+8BHurWPCQDTi9LgUDBYI8WDX+YxZQ2m1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e5tLjIW/GfqB0jAr1iCKzqCYrvqWE3TYI5qZ44ilRZEIHzAt5mijTJxX+tHpN16bPNwxFOTRxYjT6caki620ssafq8Eo6dVwuurw4Bh/zi1XKZ6QBgvxHZ699Co487AUBl7SQI0I2IxLtT8B/bGzIdC1vXAIOC1U/k+7e5fptK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nRHm3PrB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nRHm3PrB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7FD1C4CEE3;
	Fri, 27 Jun 2025 15:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751039081;
	bh=LURfJhqAl+8BHurWPCQDTi9LgUDBYI8WDX+YxZQ2m1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nRHm3PrBp3xrpjPdG/q3p1NN7SbpFRbY/cp2+Yg1U1LXnX+Mjt5k+cl/vRUD7I+cY
	 s+Rg8PwhUP65NeKOB6jURqCNvtRneCRwpgSwQPLuvaqMdf+N7XGZRV/E1R7Z8QBIrV
	 9k4ceP/niRzMxW/m0bv63AOJG2IRq0Z7Wbre+QO3B+FTyoqD5z27HlQHAc7as7Kz7k
	 hjtfp8hG1pBlBUc1z5NXaEUhvWZqCiucngIAKy1Ap3o61mV1b+N9Ah15GISkrStWjd
	 uqv+huheXwTEGoDhnJiGwLF7tmVIjRsBWcTPRmP+8hChd0zBPq/u35P8sv1YtLgwEs
	 lpOrxiQSkA03Q==
Date: Fri, 27 Jun 2025 16:44:35 +0100
From: Will Deacon <will@kernel.org>
To: Huang Shijie <shijie@os.amperecomputing.com>
Cc: catalin.marinas@arm.com, anshuman.khandual@arm.com, corbet@lwn.net,
	patches@amperecomputing.com, cl@linux.com,
	akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
	xiongwei.song@windriver.com, ardb@kernel.org,
	inux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/2 fix-v2 ] arm64: refactor the rodata=xxx
Message-ID: <aF68Y5aQFBqShtjD@willie-the-truck>
References: <20241212082426.4110-2-shijie@os.amperecomputing.com>
 <20241217071715.24797-1-shijie@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217071715.24797-1-shijie@os.amperecomputing.com>

Digging up an old thread...

On Tue, Dec 17, 2024 at 03:17:15PM +0800, Huang Shijie wrote:
> As per admin guide documentation, "rodata=on" should be the default on
> platforms. Documentation/admin-guide/kernel-parameters.txt describes
> these options as
> 
>    rodata=         [KNL,EARLY]
>            on      Mark read-only kernel memory as read-only (default).
>            off     Leave read-only kernel memory writable for debugging.
>            full    Mark read-only kernel memory and aliases as read-only
>                    [arm64]
> 
> But on arm64 platform, "rodata=full" is the default instead. This patch
> implements the following changes.
> 
>  - Make "rodata=on" behaviour same as the original "rodata=full"
>  - Make "rodata=noalias" (new) behaviour same as the original "rodata=on"
>  - Drop the original "rodata=full"
>  - Add comment for arch_parse_debug_rodata()
>  - Update kernel-parameters.txt as required
> 
> After this patch, the "rodata=on" will be the default on arm64 platform
> as well.
> 
> Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
> ---
> Add more comment for "rodata=noalias" in arch_parse_debug_rodata() from Ard.
> ---
>  .../admin-guide/kernel-parameters.txt         |  2 +-
>  arch/arm64/include/asm/setup.h                | 28 +++++++++++++++++--
>  2 files changed, 27 insertions(+), 3 deletions(-)

Sorry, but I'd missed this as you'd sent it as a reply to an existing
series. When you send a new version of a patch, please can you post it
as a new thread with an updated version?

I think the idea of this series is good, so if you send a v5 against
mainline then I can review it.

Thanks,

Will
