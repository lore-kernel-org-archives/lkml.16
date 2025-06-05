Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40A81A76D4
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 05:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749101042; cv=none; b=Px4nnB5Pl3M5vHtjaRAdBK4YHCChr0PkbsXfZsVDec9yjOuXg7MXZfxHU56l3d2yOr9BMMu+983apNu6DvgSeL0ehy0QbWL+BIm4jOaazt7qzaHmvZvHCqR6YZW0xnO1p8AYqDF9qqAIiSqwZqPDmP+4NEe0LRRKzDexi4v/oM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749101042; c=relaxed/simple;
	bh=CZDeq+zUBIlx9SSAEqsUxOQKyUy2jcu6QFtDsZAPNDg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=VTLrp806klq3mJS8tw+OWRBxuC+P6D6J3qvHa0RFa3QcC5z4/Yxl7Ht84JVdkSlHaOJuppWyzXebpEjX4bcr10pjrHj5RjHCRafy85cGGn6Y7n3J3zuYIgoP0cjB0KXhxlmyQfuf2f6mu4l+tWDjrrf7ait3SWcbzVxJQQSQ2Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=lNJRtVHh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="lNJRtVHh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3374C4CEE7;
	Thu,  5 Jun 2025 05:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1749101042;
	bh=CZDeq+zUBIlx9SSAEqsUxOQKyUy2jcu6QFtDsZAPNDg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lNJRtVHh2E+FGF5dlIa1C06EUkGQzCI7y5pQGEx4k+SHydyKQdn5R3hDv2g6ombH7
	 THOggm4mXRx6WsvFWE4RwYkYgW6z699GKFyNo0Dx5fb2EQDxdDz/2PyM1sx/zcrrtw
	 tGwC3N0mLF8Di+4UvOJpY/2KgaAkGsCIE7cQhkv0=
Date: Wed, 4 Jun 2025 22:24:00 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Hyesoo Yu <hyesoo.yu@samsung.com>
Cc: janghyuck.kim@samsung.com, zhaoyang.huang@unisoc.com,
 jaewon31.kim@gmail.com, david@redhat.com, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mm: gup: avoid CMA page pinning by retrying
 migration if no migratable page
Message-Id: <20250604222400.63203f9b10ae5b4c25f6de0b@linux-foundation.org>
In-Reply-To: <20250605051131.GA3407065@tiffany>
References: <20250605033210.3184521-1-hyesoo.yu@samsung.com>
	<CGME20250605033432epcas2p4c024a9d05246b18c217f3562b3f53551@epcas2p4.samsung.com>
	<20250605033210.3184521-3-hyesoo.yu@samsung.com>
	<20250604204323.95a646ae67f6800069a11e36@linux-foundation.org>
	<20250605051131.GA3407065@tiffany>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 5 Jun 2025 14:11:31 +0900 Hyesoo Yu <hyesoo.yu@samsung.com> wrote:

> We have confirmed that this regression causes CMA pages to be pinned
> in our kernel 6.12-based environment.
> 
> In addition to CMA allocation failures, we also observed GUP longterm
> failures in cases where the same VMA was accessed repeatedly.
> 
> Specifically, the first GUP longterm call would pin a CMA page, and a second
> call on the same region would fail the migration due to the cma page already
> being pinned.
> 
> After reverting commit 1aaf8c122918, the issue no longer reproduced.
> 
> Therefore, this fix is important to ensure reliable behavior of GUP longterm
> and CMA-backed memory, and should be backported to stable.

Great, thanks.  Please add this to the patch's changelog.


The problem is, this series combines a non-urgent cleanup with an
important, backportable regression fix.  We shouldn't backport the
cleanup into earlier kernels - that just adds undesirable noise.

So can I ask you to prepare a single standalone fix for the regression
against current -linus and to later propose the cleanup patch for
6.17-rc1?

In other words, pleas reverse the patching order, send the patches
separately and test the regression fix without the presence of the
cleanup?

(I could do these manipulations locally but then what I have for the
regression fix wasn't standalone tested by yourself).

Thanks.
