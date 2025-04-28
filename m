Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F30A55
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 00:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745800288; cv=none; b=ObxvA3OGTaoY+qv2Ip2jyKjKwxmCQRxENTCq+HCCZPQNN5vT2IEF0krIk0pVSzKUOp5PjXxQFSYnSrUFFRb6Q8IECws1NUzVBD/fUTQQNMdEEGrZqdF04807zmRD24gCTU62kzr8X6xqqoeMrSbFYc2KI58XfDKggYwewFKjIQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745800288; c=relaxed/simple;
	bh=ZyEYZLRrL7npFKs1ksQ6MNNDvEyqzdyirzXDZWZc8yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eF4D8eRMdxhhLwL2RGx7zJtEYlifs7TMcCaCjC9K6i8OYd2RizP+EzaC5sa2IODLeKh7/faZctXWXQBcsbbJcJEUz9nydCdV7CaZJLw+tqSFWYSDfBM2tGlVxVZpHtxmuZ+EELLtju8yt8YFpevSswbQ8PIvdvLppAGcLZ5ypb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=VIrqHnlj; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VIrqHnlj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WpG7PAexRsus9OtsXlzjbrRZ/+nTKSDcEDGSlVq9hco=; b=VIrqHnlj2cgwE+KfQ6vU4rNUEJ
	TPXoeQVr/tW4VGXhOlxGcZlwwyHIKUkD39QgGCLW1wcCv/jsdR00dJ94N2f0B13RPbJTBQAh1a84o
	ugmdTsG78aAF59sdw2s2fIsCEsYvd8p7GQRwIBAVQSzZWLBTjzDq+GzjQ2FzikaUT4FhQV5Tpxh3r
	BBH3OvAnVNyp6ih7oSw51FXEzk6hetUKYc9ZibmLxN+/5uxRBW/ZwAYhoe4BAfq9EbjhsdUBb0Sod
	3SFoljZCWGiNUMZpvReH3DKMLHl8ahPb4htIy3tUJclxriFasemlmiSAkTQitluhZtMXAHYP7JIVJ
	atQrX3kA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9COm-00000004Xoe-3iPt;
	Mon, 28 Apr 2025 00:31:04 +0000
Date: Mon, 28 Apr 2025 01:31:04 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Kairui Song <kasong@tencent.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Hugh Dickins <hughd@google.com>, Chris Li <chrisl@kernel.org>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] mm, swap: remove no longer used swap mapping helper
Message-ID: <aA7MSDEbAqBZZjG_@casper.infradead.org>
References: <20250427185908.90450-1-ryncsn@gmail.com>
 <20250427185908.90450-7-ryncsn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427185908.90450-7-ryncsn@gmail.com>

On Mon, Apr 28, 2025 at 02:59:08AM +0800, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> This helper existed to fix the circular header dependency issue
> but it is no longer used, so remove it.

Oh, good catch,  It became unused with my commit 0d40cfe63a2f and
I didn't notice.

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
