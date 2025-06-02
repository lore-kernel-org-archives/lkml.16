Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7F023CE
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 20:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748895745; cv=none; b=Jzho7nJY83VtQFIv/FbYp7awQS0eE/lwTl0CWTsGI1/i9d0wWXxa+hFolxObqvxpYNpG4icbCM115hkGvWDUFOytTA+YjywuE4JtkcNUKtNgMwIB/+Yee1jrtRxMYZEYHBVbxT0GSh5miw7uas1shrkx0M8WLmvLRUli1hNwjfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748895745; c=relaxed/simple;
	bh=y1soRdZahNavteXC2sd3gvDjCRkP6H6eajqNnhVjSbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BkLqHV36gXjvidxITtCjlwigE99ApUPebnMmJHDfLd6taSO57/xWwiw4xYb3kVEK/P9YWYE0/hAIYO3HhF3OxMSju4iq9Ki440Xe7Jlrsp6fvHQThW9I+cBif6hRvXlv8kj63XOYkjdpyrGRMBnlqbjYPl+WaPYkPdAHJcLxkQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fNvfYif7; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fNvfYif7"
Date: Mon, 2 Jun 2025 13:22:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748895739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TUEcXRzrJ5OOaqI/DtIPnnQdjyAU6AFqVQV1LcXLTsM=;
	b=fNvfYif70dCfiDORxut+7j6OAb70x21QDSEpcQo5odCCclR93GvbSeiQpitsT5H/pFbk4i
	9O95bWsE13lrsEPzxOIjLN70+MLnXhR9hxn1AtKqIGDNKgUgVEc4Q7q7nHnYskBLVVc1Qs
	UXCrAGhbyrDjne+L10zjQ5NLI6DX08s=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Jann Horn <jannh@google.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	stable@kernel.org, Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH] mm/madvise: handle madvise_lock() failure during race
 unwinding
Message-ID: <gua7br6rrowuqqloyergoefo6dgya4mt6zrlqcpfkziozlyyjt@gavqvhano4af>
References: <20250602174926.1074-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602174926.1074-1-sj@kernel.org>
X-Migadu-Flow: FLOW_OUT

On Mon, Jun 02, 2025 at 10:49:26AM -0700, SeongJae Park wrote:
> When unwinding race on -ERESTARTNOINTR handling of process_madvise(),
> madvise_lock() failure is ignored.  Check the failure and abort
> remaining works in the case.
> 
> Fixes: 4000e3d0a367 ("mm/madvise: remove redundant mmap_lock operations from process_madvise()")
> Cc: stable@kernel.org
> Reported-by: Barry Song <21cnbao@gmail.com>
> Closes: https://lore.kernel.org/CAGsJ_4xJXXO0G+4BizhohSZ4yDteziPw43_uF8nPXPWxUVChzw@mail.gmail.com
> Signed-off-by: SeongJae Park <sj@kernel.org>

Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
