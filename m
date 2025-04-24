Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0BD213240
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745486629; cv=none; b=dG/t08jC4vOFxijApFu71ApRADEqCtyaS3daft7CdFkA8EGHalCNaDEI5bb9K4JtF0fPoMzrLzdlI9999D4ndmw76IZgjWp6VR4St+3NeD6YcBmk1XIrbRRGy0UNdx3YDALU1oXeIHxbFI+PXTv25oDBsqce5HJf6EAVVJZZiJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745486629; c=relaxed/simple;
	bh=wuAGatnekiiKeyZxayhIFl+BETI1JkPzVLJOix1FXRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFSFrVyzlhxoRnNKHqAO5DvRyycxG9nXzi/lBJccUjCVlLnx+r3gLCcX+n9f7aten2vDGbDK6qIqAVKnW8Ru3rkzyuXgQ9y7twmvXA55bKk1f2p7S7lg3fbeM3q9viYLtRLRBr1mgU4l1ItJB4UHfQacwOLVKVsFCDZtdyVANpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dTLu3Bmw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dTLu3Bmw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE357C4CEE3;
	Thu, 24 Apr 2025 09:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745486628;
	bh=wuAGatnekiiKeyZxayhIFl+BETI1JkPzVLJOix1FXRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dTLu3Bmw5/R5xsMffASSreafRiQ2D60Koj59TitTCCcgNRyppbSSkVxzlc0J0FzSR
	 irScHG8vKiZ2gVv+12n6DT5OMXs1yoMm63K3sWLuaf5A7X8kVsFnQ9SAeQdSVa5sIo
	 Z34CvbYDnuSjTm9bDq1EiMEe5M5fgSYCV2fRxS7XjmFVp9jADZm51BHgYPZ4isUhb1
	 Hs/6KLRWSL75o+8tWU8D9VofD/sUHFSDWldxBat/kDJRVClmTgeENZMkpZxh8Rl2qQ
	 cMNq5wXGCMBK0yNFPn2n0w17qVtr3Mj6JA3xO6gxm99Gpaq36+xbl1DgfbX1HC8OCf
	 fu94eNnzvtkvg==
Date: Thu, 24 Apr 2025 10:23:44 +0100
From: Simon Horman <horms@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Alexander Graf <graf@amazon.com>, Mike Rapoport <rppt@kernel.org>,
	Changyuan Lyu <changyuanl@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kexec: include asm/early_ioremap.h
Message-ID: <20250424092344.GC3042781@horms.kernel.org>
References: <20250423162924.2213664-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423162924.2213664-1-arnd@kernel.org>

On Wed, Apr 23, 2025 at 06:29:18PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The early_memremap() function is decleared in a header that is only indirectly
> included here:
> 
> kernel/kexec_handover.c:1116:8: error: call to undeclared function 'early_memremap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>  1116 |         fdt = early_memremap(fdt_phys, fdt_len);
>       |               ^
> 
> Fixes: 4bfe738ce89a ("kexec: add KHO support to kexec file loads")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Hi Arnd,

I didn't try to reproduce this problem. And perhaps this isn't particularly
important. But, naively, I would have expected the following as it is
the commit the introduces calls to early_memremap() in exec_handover.c.

Fixes: b0a311dba688 ("kexec: add KHO parsing support")
