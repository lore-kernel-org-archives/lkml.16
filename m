Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3F12063F0
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747209044; cv=none; b=gkMAkBuXjkWTpranXxj2Y08f+Joa2Exb83WNG0/V8uNRPju7c+cWNWV2M0ZN+phkXKWwke6zIqYUMuEhO7n3/6jcRpav4rMUQUj2x5YmEccGG5rn7lsWw/xOKX4KcRdcrfF93GBKgpuJagVfchmFGnWmKx7YPlu69Xn2yrWTIAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747209044; c=relaxed/simple;
	bh=V1iOZdoMZHugSJlelk+uvJow+WTnaaFyaZ41KnihrRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qwUhM14a/GaKLdBuh1SMWai8Os0S9fOzNURAJ9D8lqHvb6enGfxLzQuRf3Qz6ZNG2yt9emPOGgsjIhpheLkUNcKe0UFEYewK/WbxeFnDJqgJqUqMOnbuwGglILb8mpA9YPAud5ySDKekWE1KpF0fvr6tHTealWrz2vhk3sUNXIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gujf1BiJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gujf1BiJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B64C4CEE9;
	Wed, 14 May 2025 07:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747209043;
	bh=V1iOZdoMZHugSJlelk+uvJow+WTnaaFyaZ41KnihrRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gujf1BiJ2fzF3cb3dPHpvhREfd/7wDh/wbh3gD3cI/ZKPzZhPmYtHA6vm/vGcpEge
	 RoSNu4ARjXMPkH5DbwPUpa2EhOi5usclzqE/7YHSEPMO/QODHJ1CYpv/JKI7o/g4m6
	 ToXtaZqBBuONH+ifk8miO2xIH+3jSJ1zTlnefFaGIy0/DeuZG68RtMl1Sv/Y8eW45X
	 VdljsApSenE10oBxY00saZL/IJdFblENeksEg5grx6AhIdwH2H+pbZmrNEfjEH5Fu/
	 E0et+HikS9GZNwtPazCZw4L93EHWEAEXJl5M16VW1kxLe8eZee7/9JSMKy2Qg5du1V
	 5MvT6vWMWssug==
Date: Wed, 14 May 2025 09:50:39 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH] fixup! x86/sev: Share implementation of MSR-based page
 state change
Message-ID: <aCRLT3C9zthX9g5r@gmail.com>
References: <20250512190834.332684-23-ardb%2Bgit%40google.com>
 <20250513141744.905614-2-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513141744.905614-2-ardb+git@google.com>


* Ard Biesheuvel <ardb+git@google.com> wrote:

> From: Ard Biesheuvel <ardb@kernel.org>
> 
> This is a fixup for the mentioned patch in principle but it applies to
> the end of the v3 series so all subsequent conflicts have already been
> resolved.
> 
> Without it, PVALIDATE will be passed the PA instead of the VA, which
> will break if the early page state API is used after the 1:1 mapping is
> unmapped.
> 
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Tom Lendacky <thomas.lendacky@amd.com>
> ---
>  arch/x86/boot/compressed/sev.c      | 6 +++---
>  arch/x86/boot/startup/sev-shared.c  | 8 ++++----
>  arch/x86/boot/startup/sev-startup.c | 2 +-
>  3 files changed, 8 insertions(+), 8 deletions(-)

Thanks!

I folded this fix back into the originating patch and rolled forward 
the changes and resolved the conflicts, the updated series can be found 
at:

   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.x86/boot

Thanks,

	Ingo
