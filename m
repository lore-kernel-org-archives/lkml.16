Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E050322AE5E
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 15:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748531255; cv=none; b=f8O2xsR8zmxJ7re6b3EU7DZJowIZsB8qgvYC+R2z8Lzi3njg5YopemoHM48oIK0nvFFWmg5emT9KRMtVQnic4WV/woyGKuVHatquegaZ/GNsfPRIHDPRbkiAqKzZS/C1phWndM3A9uXO/CajD6Bd5PQ71ljqlj46Wjs9zwzVI+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748531255; c=relaxed/simple;
	bh=nRqV/m3gANnnW7jwp4ZVNLa3vDIOYWrPSDQCnpgN7n4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JfsOm0ObtyzTfZKV2wAuwlscluqTNR8+tLBkL02Uq2FhKQ5yxDAUDd527qyOXbMCmSyL5wNi4f7XUz3e19QzshV03umB1juYp09AO6fVGvHQ4Nu4842oiClTyH9Eks8EJ2tfRxT5oG7yzgjAi8w04Mqk5F7vrvtFSkQkSyTy7To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=io46lwWB; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="io46lwWB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1748530644;
	bh=nRqV/m3gANnnW7jwp4ZVNLa3vDIOYWrPSDQCnpgN7n4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=io46lwWB5b6mfowKjoQYKbImgvorQ/ro5x7XuJIuSurDSsH1iRVvHDNHpSIJy/oVW
	 iP24cdf3GuleGETRgkMQzHOQE277nqS8LPxg3q62cRJpe5nHhzHU8ggCybZg5+Dz28
	 V3lnWlwuLTvuo/e+PyPHCyyiMP8xP5DFHoL06FNk=
Received: by gentwo.org (Postfix, from userid 1003)
	id 4DFCD400C6; Thu, 29 May 2025 07:57:24 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 49651400C4;
	Thu, 29 May 2025 07:57:24 -0700 (PDT)
Date: Thu, 29 May 2025 07:57:24 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Vlastimil Babka <vbabka@suse.cz>
cc: David Rientjes <rientjes@google.com>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Roman Gushchin <roman.gushchin@linux.dev>, 
    Harry Yoo <harry.yoo@oracle.com>, Matthew Wilcox <willy@infradead.org>, 
    linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mm, slab: support NUMA policy for large kmalloc
In-Reply-To: <20250529-frozen-pages-for-large-kmalloc-v1-2-b3aa52a8fa17@suse.cz>
Message-ID: <e391fe8a-6bef-4067-86d8-b75ece441b75@gentwo.org>
References: <20250529-frozen-pages-for-large-kmalloc-v1-0-b3aa52a8fa17@suse.cz> <20250529-frozen-pages-for-large-kmalloc-v1-2-b3aa52a8fa17@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 May 2025, Vlastimil Babka wrote:

> The slab allocator observes the task's numa policy in various places
> such as allocating slab pages. Large kmalloc allocations currently do
> not, which seems to be an unintended omission. It is simple to correct
> that, so make ___kmalloc_large_node() behave the same way as
> alloc_slab_page().

Large kmalloc allocation lead to the use of the page allocator which
implements the NUMA policies for the allocations.

This patch is not necessary.
