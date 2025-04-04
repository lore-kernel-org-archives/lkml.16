Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D33282EE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 15:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743780957; cv=none; b=K6X5rrXd9cWjVrrz5+6ikvcujB35juHCyGP/4nRZSvYaWbWq/yj6S9OTmWioHI0MjSoRBPCx525rkpm9X2++OkaLQySb6CXsrnunh0nnrRpYRNWpBYT33tkgkJdvRb2zZ30TqiWGn8mogivIVpwCuuX7xZb3SNbqFz1FqDHTRVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743780957; c=relaxed/simple;
	bh=MjEW9Pi6SpA7T3ZYiWVe/RftpnMWT4MUcq++csFTqdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BWMR4EeufeokS54yvjh75D1sKFzhGbzGlw2VW262mlhOYQiJGGUD87grXQjecL2pIq+JtA6lv9LeyeNhJe8XfSG+BBUv6MDZN1XQ9G+vuJvvkCIXmH9awytXUP5PnyUhppju55jKJkSK+ipR7H6Vv0rogXvpXl8rc1w+SBFhx44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=os0kemGm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="os0kemGm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0C13C4CEDD;
	Fri,  4 Apr 2025 15:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743780957;
	bh=MjEW9Pi6SpA7T3ZYiWVe/RftpnMWT4MUcq++csFTqdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=os0kemGmrFkLTqpRl4LzNEpjIsYy1vuFy/ffWNeATlagUp/J7xZRQJTv5nDI+diWx
	 Hrn3sGvQnGBXAE4IrZ63pz5E6BzDptcEbd/kV9bUckgt++C6hEJ6ZLyAwD7S9EF2SK
	 bHzbhQFI3LG1Z8A0xbPVCJmu/uHkx9nv0L2SifNu7KhMucCCCJC6IwSGUJJuZ0i6Lx
	 aUUOit9ycMs+rZ291nanwjYfSOfWcVPe1fpP3HbYdbyn3SpMqNsNE9WSGxaXUyHIH4
	 J7HvaWJEFR2hZAkpR9CDKANsFmmedwpZEnpnKw+wKsIW3dLmaE048VP+O+VwfRgqRA
	 T+GhnyeJLfS8w==
Date: Fri, 4 Apr 2025 16:35:52 +0100
From: Lee Jones <lee@kernel.org>
To: Raag Jadav <raag.jadav@intel.com>
Cc: gregkh@linuxfoundation.org, david.m.ertman@intel.com,
	ira.weiny@intel.com, andriy.shevchenko@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mfd: core: Support auxiliary device
Message-ID: <20250404153552.GE372032@google.com>
References: <20250403110053.1274521-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250403110053.1274521-1-raag.jadav@intel.com>

On Thu, 03 Apr 2025, Raag Jadav wrote:

> Extend MFD subsystem to support auxiliary child device. This is useful for
> MFD usecases where parent device is on a discoverable bus and doesn't fit
> into the platform device criteria. Current support is limited to just PCI
> devices, but this can be further extended to support other types like USB
> in the future.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
> 
> I've been cooking this on my spare time during merge window. I'm not
> very confident about this but thought I'd share it. It might be
> controversial since I stole quite a bit from platform infrastructure,
> so please consider this an RFC and let's discuss how to approach this.
> 
> More discussion at [*].
> [*] https://lore.kernel.org/r/2025032609-query-limit-491b@gregkh
> 
> A few things that are still open,
> 
> 1. Since we're doing it for PCI devices (Greg's recommendation), how do
>    we force the existing ones to use their original platform path?
> 
> 2. Should we allow auxiliary drivers to manage their own resources
>    (MEM, IO, IRQ etc)?
> 
>  drivers/base/auxiliary.c      |  23 ++++++
>  drivers/mfd/mfd-core.c        | 137 +++++++++++++++++++++++++++++++---
>  include/linux/auxiliary_bus.h |   7 ++
>  3 files changed, 156 insertions(+), 11 deletions(-)

Honestly, I thought I was going to hate this more than I do.

Besides the obvious duplication of existing code, I think the premise is okay.

I have always viewed the auxiliary bus as an alternative to MFD, rather
than an alternative to platform, but I see where you're coming from with this.

-- 
Lee Jones [李琼斯]
