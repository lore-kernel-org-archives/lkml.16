Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393E713BAF1
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 20:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745182630; cv=none; b=dAb7yB6pMHIO2U4IgKKt35mAX/sWzImfX8fMz+v163qaZa/bZuJuH2F5BVlZ8ZwkACdJYWMAneqKqkx5lARgA5eU9P7+SsVHHaXOdwlqi0uAKpUnWnqu7So+qzZLeWpU/e+0QDuTDRnN+brICkgojReLAHDWs4Gvu8wgRmUHVh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745182630; c=relaxed/simple;
	bh=Sxde0RTvzDoz/23To40dR0fqqHqU/hEqFdENRbnQG1Q=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=IY9nIM3swlqOUEGRPBLoqcv1v4Iffa2fk6RRCxltCgeaV4Wv91Aq/EGcypCAprvusLx+9SrP4iwcmAxLCr9ese3i/tUPZvGNenRaEwH7yyusfft9XAvO7RWZKGW4kM235sj4VKAHnA2KsccWD2PL0wgkGPASQD2SOnt+BBf6lok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ohEfi8w8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ohEfi8w8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8773C4CEE2;
	Sun, 20 Apr 2025 20:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1745182630;
	bh=Sxde0RTvzDoz/23To40dR0fqqHqU/hEqFdENRbnQG1Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ohEfi8w8ep1dh50B/D20GFW2IFu+vcwFZuFiKG5WXFhLkCujp+I/FSMovGVW/uCBv
	 uNY6X1RD1P5KfErxi0YBzZ3MRIe2LJpH0xcFcMgqXwDWBd1kag3+TEBNf3N4rMvHnc
	 gJhYmaFHrOTOGYtHeHSElxa53r1Ek2MIeeBYiN4Q=
Date: Sun, 20 Apr 2025 13:57:09 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ruihan Li <lrh2000@pku.edu.cn>
Cc: Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/mm_init: Don't iterate pages below
 ARCH_PFN_OFFSET
Message-Id: <20250420135709.732883ee775ad8b41fb668ca@linux-foundation.org>
In-Reply-To: <20250419122801.1752234-1-lrh2000@pku.edu.cn>
References: <20250419122801.1752234-1-lrh2000@pku.edu.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 19 Apr 2025 20:28:01 +0800 Ruihan Li <lrh2000@pku.edu.cn> wrote:

> If ARCH_PFN_OFFSET is very large (e.g., something like 2^64-2GiB if the
> kernel is used as a library and loaded at a very high address), the
> pointless iteration for pages below ARCH_PFN_OFFSET will take a very
> long time, and the kernel will look stuck at boot time.
> 
> This commit sets the initial value of pfn_hole to ARCH_PFN_OFFSET, which
> avoids the problematic and useless iteration mentioned above.
> 
> This problem has existed since commit 907ec5fca3dc ("mm: zero remaining
> unavailable struct pages").
> 
> Signed-off-by: Ruihan Li <lrh2000@pku.edu.cn>
> ---
> Link to v1:
>  - https://lore.kernel.org/linux-mm/20250418162727.1535335-1-lrh2000@pku.edu.cn/
> Changes since v1:
>  - Removed the unnecessary Fixes tag.

Why was the Fixes: considered unnecessary?  It seems to be useful
information?
