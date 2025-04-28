Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C91725F996
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745832438; cv=none; b=qdV42JX8frdVt5whmlirJbiIyxFYlAAkqjtdU0JdCFqzDvKhtNJ2+62kvubmm0hLS4fzVkAiNF4+FkpnYPPgla+0cjk5+bSOWGd+wysIOXKq0k4LWPMCosQ2jaES0efSdkhlmxrM/2HapsRFFTPpFJbMuSCRxPGHKdQ9qj6vdxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745832438; c=relaxed/simple;
	bh=UVd/rZR8AOYdXyQtZJAfNFYpT83jERDleZoZwn1jpHI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=JiDb6r63PEyeCEGQ0W2KpYI/X0aE1FI9esrGbLo+cXsvLZ1Le4M0ImfTVApWTvblFAJ8CWITkJWRoL/TI/npcou4KRtSGNKtBLkmt+AgwntsuUkKtM0pOCkXIPY7EMUP2LAwnvGhMSt7UVgTFc31yh+0dsixNZT1Wjy6mHOb8RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=pgW8Tc3B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="pgW8Tc3B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4123C4CEE9;
	Mon, 28 Apr 2025 09:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1745832437;
	bh=UVd/rZR8AOYdXyQtZJAfNFYpT83jERDleZoZwn1jpHI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pgW8Tc3Blxaz/ouF3jFGGuHxZnfmv5VdmsIFhZq7gRB/LI9sACW5nzH4FwIpgNAUc
	 cLeQv6K4j+6zt45EM7nSYHaVUKyROi5gR/MiMvNrEbsU8OjEIP1DlQEEDdDYg2Rftj
	 1qaIWmKL1X+NcIPg/8HrWBjXNFgVNzD/uXTmo+gs=
Date: Mon, 28 Apr 2025 02:27:16 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Igor Belousov <igor.b@beldev.am>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, hannes@cmpxchg.org,
 minchan@kernel.org, nphamcs@gmail.com, senozhatsky@chromium.org,
 shakeel.butt@linux.dev, yosry.ahmed@linux.dev
Subject: Re: [PATCH mm-new] mm/zblock: avoid failing the build
Message-Id: <20250428022716.99ee57590fe7878dccfaa6a0@linux-foundation.org>
In-Reply-To: <20250428065727.57990-1-igor.b@beldev.am>
References: <20250428065727.57990-1-igor.b@beldev.am>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 28 Apr 2025 08:57:27 +0200 Igor Belousov <igor.b@beldev.am> wrote:

> Don't break the build for a PAGE_SIZE that is not fully supported,
> just print out a warning in that case.
> 

I queued these two patches and this fix:

--- a/mm/zblock.h~mm-zblock-avoid-failing-the-build-fix
+++ a/mm/zblock.h
@@ -21,7 +21,7 @@
 /* max 256 slots per block, max table size 64 */
 #define SLOT_BITS 8
 #else
-#warn This PAGE_SIZE is not quite supported yet
+#warning This PAGE_SIZE is not quite supported yet
 #define SLOT_BITS 8
 #endif
 

But please be aware that I consider the zblock zeries to be stuck until
there is clarity that zblock is something we should add to Linux. 
Let's continue to address this in the main thread(s), please.

Or perhaps to restart things, do a full resend after having reworked
the [0/N] changelog to fully address the issues which have thus far
been raised.  And Cc'ing the various individuals who have thus far
commented.

Thanks.
