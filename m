Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4548C2459F0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744615229; cv=none; b=QpCfrLHLznwxCZIPY+n14DrLxBO1KxOaEXsk0V/hY+kDzx+iuat1OqGg77tVmGOqOKohPfqPtCg1XYATCZz+KuGdjKUj+paGidbN2YOxs8YYyI3a3mdfDlIpEpRHOttIq42nDPYFEhVvOBNF7/Zb+FErQIT8G05sUAhtLQR2Vkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744615229; c=relaxed/simple;
	bh=uFoWM9q4E7X76y8QE6Eu+Tar2Fc9Aw1hWYzHfghTThg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WlxmJ/mV7xV2+FsfRn4ojYnsyJCAZUJ9zWn/Kr+5DmYOm4YSFQdbR5sApWmhU6g2IvIUUqfV5zM3SbaAMkQJDMZn1Zv00eYjXLAQFFELugUDoec58gnjzRg1GaCA5F+9pjraJ1BpR/lH6iihBpIANJxIijwfdCbBmFEHSmB5Rt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pQomUQrB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pQomUQrB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 233C5C4CEE2;
	Mon, 14 Apr 2025 07:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744615228;
	bh=uFoWM9q4E7X76y8QE6Eu+Tar2Fc9Aw1hWYzHfghTThg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pQomUQrBXhpt0EwxfEc6U7Pc8iHjpL2w1M181TxJj+YxxSoLq3NRSil8mWY6tNd2B
	 xatywP/9s4jJoyvaa0wC62MJVs6HiOr49e+FduyAMTFdKfy80YZRNDdoDCULml1Jhy
	 6P2nDRvBcYbFo4JH+8hmL2tc0GxIFpDSrLs2gNa8LLPCSVkrOJgAjRG1iErMHUTPvS
	 JGHwsTq6yVGAxEL3FVcXWMahXQ0AitfGZkq+e8+Ntsw+pH3NL9fO/+X5fp51KHWTju
	 JmaJX3vvqUklc1L8YUWx/4YugbdqoFB2db9sjIdVDXAYlM5Q/nT4SkNnACsRiRuSCl
	 HTbulrdSn2PTA==
Date: Mon, 14 Apr 2025 09:20:24 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: linux-kernel@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] genksyms: Handle typeof_unqual keyword and __seg_{fs,gs}
 qualifiers
Message-ID: <Z_y3OIQECdVo6YJL@gmail.com>
References: <20250413220749.270704-1-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250413220749.270704-1-ubizjak@gmail.com>


* Uros Bizjak <ubizjak@gmail.com> wrote:

> Handle typeof_unqual, __typeof_unqual and __typeof_unqual__ keywords
> using TYPEOF_KEYW token in the same way as typeof keyword.
> 
> Also ignore x86 __seg_fs and __seg_gs named address space qualifiers
> using X86_SEG_KEYW token in the same way as const, volatile or
> restrict qualifiers.
> 
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Closes: https://lore.kernel.org/lkml/81a25a60-de78-43fb-b56a-131151e1c035@molgen.mpg.de/
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Borislav Petkov <bp@alien8.de>
> ---
>  scripts/genksyms/keywords.c | 7 +++++++
>  scripts/genksyms/parse.y    | 5 ++++-
>  2 files changed, 11 insertions(+), 1 deletion(-)

Thanks, applied to tip:core/urgent.

I've also added this tag for context:

  Fixes: ac053946f5c4 ("compiler.h: introduce TYPEOF_UNQUAL() macro")


	Ingo
