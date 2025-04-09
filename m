Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D971388
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 10:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744194734; cv=none; b=f2LeC7+TFBgP4QzfCdIUDv0xly5B16nWGReWlXHZ8Q12JY48ftoqWBEBNJRbvomRJmETld5/Q4VX/Mc2Yp2i+ASP2EKsXoOExm+r72o0HonSCqg0q7Gs4nqJ4MiQHaDS+jXbe8QXdaagMtvc2VLyGdJfH8EeO8kjtvmHF2ekv0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744194734; c=relaxed/simple;
	bh=DpCDEQ0tC11b+rcdxyonTa9Cs3pQdisZcLFTXwhkVPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KN+7ZUEmH8pApeOjwysfOYaLYuHy4hFAVq0X548r5d8Ftx7SlAyfomVEU9JpHgDd8xkJQG6TSNpmgJql4b6lQn8vJL5su6PH8c7b0uDj56wz0MGJqpptiOPYgQodjtxdOtQgtStBOIUSAPuYVd7bcGC3FZPypq6OKBG8JXmv5tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hw6odN15; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hw6odN15"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBBDC4CEE3;
	Wed,  9 Apr 2025 10:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744194734;
	bh=DpCDEQ0tC11b+rcdxyonTa9Cs3pQdisZcLFTXwhkVPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hw6odN15H4JbpY1u2IQdFmT0j+doxFqhpXWblnrJKjT0cbGo8OQ5hNIv/bfmQCRuO
	 j9EWgpKNtlGV5pHlXE7QV4dZBizURUeSrHJXFiiIPMIbofjzUhJUAVpGGXngL4dK29
	 klLkXaJId5ybfrK4tzhlMu0sBeNAeIGkyEu/xqT+ImD1/ePyNwiCzMKQpucU28osrx
	 TjZ5TgzW71ShzmHconzi9by5KJKbzFQCGic8MfUr7FNXm/hLd4vq9QlrfvelAP6qV7
	 SFKTfjbwTLvoDZ6h6tV4fDgsnko+Z6TMTPB4T9t425F3kOSkILxgro7+eELs4pntSQ
	 trEmDGUIueIpA==
Date: Wed, 9 Apr 2025 12:32:08 +0200
From: Ingo Molnar <mingo@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Rik van Riel <riel@surriel.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2] x86/mm/pat: (un)track_pfn_copy() fix + doc
 improvements
Message-ID: <Z_ZMqPvQTxsyhCa9@gmail.com>
References: <20250408085950.976103-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408085950.976103-1-david@redhat.com>


* David Hildenbrand <david@redhat.com> wrote:

> We got a late smatch warning and some additional review feedback.
> 
> 	smatch warnings:
> 	mm/memory.c:1428 copy_page_range() error: uninitialized symbol 'pfn'.
> 
> We actually use the pfn only when it is properly initialized; however,
> we may pass an uninitialized value to a function -- although it will not
> use it that likely still is UB in C.
> 
> So let's just fix it by always initializing pfn in the caller of
> track_pfn_copy(), and improving the documentation of track_pfn_copy().
> 
> While at it, clarify the doc of untrack_pfn_copy(), that internal checks
> make sure if we actually have to untrack anything.

Note that the title isn't accurate anymore, it's not an 'x86/mm/pat' 
patch, but an 'mm' patch.

Thanks,

	Ingo
