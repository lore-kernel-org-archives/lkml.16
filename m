Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA0835280
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 17:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743960512; cv=none; b=Utc0dPZKQ9NP9qHGYnEgaeGEpLRJOPSpuupcopEAD91EMpnKaFt1uA4G6Dp71JZ+XiMj8c/f92BBru6bbvN+GWBc4K/kQvkcHEXJuMC5HeAAzzJoQ7mAfilJTEx0s1UXntXRUtPQwIaoEKiFuL+JaI6ykYXiBuefwMroWZaGxmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743960512; c=relaxed/simple;
	bh=58mtqSTGdgNysZaZJX7gbCy7325pGGcOPw98Ok5a05s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQBv1sR/m512FTNxGt4bXxuavb0IxZ8imz5LOoPmaMnx7CLf0HLSZxiS2G08deJNrk21BwCdDQklMpyjoqgjygiOvPHbrLPWD/OoHG1I7TjhgN9umZV5/TLZMhuXUshOry7AChMzEJAPQFS+vhqzOEAHp2n71irVqsaUKYErHn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PfN9vnz7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PfN9vnz7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A9CC4CEE3;
	Sun,  6 Apr 2025 17:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743960512;
	bh=58mtqSTGdgNysZaZJX7gbCy7325pGGcOPw98Ok5a05s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PfN9vnz7ygbTzSU5lvomEV+7w81NKGKUpG75BD99DiZIVomzjzT02Mn7lHW8VttS/
	 DeLT7AfByymCYaxNHfXgNwken8bIjTpZ5cB4+lg7WE4L5nxTIDnHByPwOVYuUK0bZH
	 +7yaYoVk+Pgww4HtTM7Do3GHV+kTqnYd0OLYp2gK4gu+U5746+PAosEfrLlLBUgE9x
	 9dYQo7eRQ0y3vC295VL5Rg+ruFZFTVcC7cxfB1uA794YEJd3pa8Zzh/7gcfuhZxErT
	 cKWEW01Qr+x346OdNB50QtZAKnAh5h3Fa7hRWdFnPdrzh0Mg/UR+r5P+0qvJEfbiQ+
	 BmjFIBWekRvfA==
Date: Sun, 6 Apr 2025 19:28:25 +0200
From: Ingo Molnar <mingo@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Rik van Riel <riel@surriel.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1] x86/mm/pat: (un)track_pfn_copy() fix + improvements
Message-ID: <Z_K5uW2eu7GInRxs@gmail.com>
References: <20250404124931.2255618-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404124931.2255618-1-david@redhat.com>


* David Hildenbrand <david@redhat.com> wrote:

> We got a late smatch warning and some additional review feedback.
> 
> 	smatch warnings:
> 	mm/memory.c:1428 copy_page_range() error: uninitialized symbol 'pfn'.

> -	if (!(src_vma->vm_flags & VM_PAT))
> +	if (!(src_vma->vm_flags & VM_PAT)) {
> +		*pfn = 0;
>  		return 0;
> +	}

>  static inline int track_pfn_copy(struct vm_area_struct *dst_vma,
>  		struct vm_area_struct *src_vma, unsigned long *pfn)
>  {
> +	*pfn = 0;
>  	return 0;
>  }

That's way too ugly. There's nothing wrong with not touching 'pfn' in 
the error path: in fact it's pretty standard API where output pointers 
may not get set on errors.

If Smatch has a problem with it, Smatch should be fixed, or the false 
positive warning should be worked around by initializing 'pfn' in the 
callers.

Thanks,

	Ingo
