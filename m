Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E611D9A54
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 09:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743415053; cv=none; b=EygzDm6zrF3Un+XglZyt0tqOg9e+3xsWhy7VfiufPZslmwWpAr7MeWG8yvpQ/wZJyZL8EigDmIfI8eBfLgKpSa+nQDAntaUVQ+zpMgTGaTA9tQsJsURZUd1g/aMe5oqyqH0A+ArtMBc0vMqkkk8A+QKcCPRA2ERqg/XxS53xr5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743415053; c=relaxed/simple;
	bh=e5xYJr+RfkkFxJzm7aSrMdi4mWDFoGWRx+q3hKNqtoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LWSX9Xc8uygu8284un0kCIIB540TxgcuiRPMRWCApGmeVKrVl1SfAEIMjKXL1Hw6Y+ekLRaSjevTCKvwzFPfRP3KpGVynXNbkjWi78c2uM99J/7ZTZAkFPQwIX86MJEi6UkwLnaWGWygivfEnewsr7RmuYrHrptBDxATTa5suPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BXHTe6Jl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BXHTe6Jl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A73FC4CEE3;
	Mon, 31 Mar 2025 09:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743415053;
	bh=e5xYJr+RfkkFxJzm7aSrMdi4mWDFoGWRx+q3hKNqtoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BXHTe6JlRHJI012S0SuvFLn9uaAIOB7VWzPs3Fc2RrvXQY5D4HDVHpRkj47d9XWrR
	 Rqmv8FGCbZmOY3AnKFP18XjGJGyiWGrQvL9LpD5uhTF+5Mm03Ufbe/sK93++OBqyK8
	 P4QODxqj6N9VjEz+gQ7LbzBBhN/beCq5B7ALE2qhb2mFxfLuCZpa072Ob8MofZGULg
	 VUzUfHZpICSgKKpG6xGbj3UzgNOVTY86wBWkdV6YuxNx1XFcdsAMB2JPp5icQuUL1o
	 +GD9dfjNQ9fZ3XbVLlPNOQeQnk673Tqfu0q1pBZKAYFZN8YTDPyMNaEpSqR8sOZzZt
	 CUy1bSrbsGcHQ==
Date: Mon, 31 Mar 2025 11:57:28 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Baoquan He <bhe@redhat.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, yanjun.zhu@linux.dev, x86@kernel.org
Subject: Re: [PATCH v2 6/7] x86/mm: remove p4d_leaf definition
Message-ID: <Z-pnCLaAp43kJVCM@gmail.com>
References: <20250331081327.256412-1-bhe@redhat.com>
 <20250331081327.256412-7-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331081327.256412-7-bhe@redhat.com>


* Baoquan He <bhe@redhat.com> wrote:

> There's no p4d huge page support yet, let's use the generic definition.
> 
> And also update the BUILD_BUG_ON() in pti_user_pagetable_walk_pmd()
> because p4d_leaf() returns boolean value.


> -#define p4d_leaf p4d_leaf
> -static inline bool p4d_leaf(p4d_t p4d)
> -{
> -	/* No 512 GiB pages yet */
> -	return 0;
> -}

This comment was also incorrect I believe:

1 PTE entry on x86-64 covers 4K virtual memory, 512 PTE entries make up 
a 4K pagetable page, and each level of paging adds another level of 512 
pagetable entries:

 - level 0:                 4K pages
 - level 1: 512x    4K =   2MB 'large' pages
 - level 2: 512x   2MB =   1GB 'huge' pages
 - level 3: 512x   1GB = 512GB 'PGD' pages
 - level 4: 512x 512GB = 256TB 'P4D' pages

So the above comment should have said '256 TB' pages, unless there's 
some naming weirdness I missed.

Thanks,

	Ingo
