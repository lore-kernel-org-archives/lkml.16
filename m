Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0FD1D5ABA
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 15:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749052196; cv=none; b=lZMXxAMr1fo0i5X1rc9vIfEHLFDfZeM6/Ogs6h3mRUQRtGsLut4Ko0qoX1Z7f3Pyg0+Ny7NJDnoG0lZcGEOtSv/7x4zEnrpKYwvq6dUo3MdTs7cNRr2SBkvMtVIQad8uRRfntXdF5sHXiNOGg9tP3halWsC+2pZ5WR94MwYJYzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749052196; c=relaxed/simple;
	bh=6G5JxN/BVDCcwydBLM00eHdMpYDGWh6mGgRQXDJ2llg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=seJ8pyH6G4xXQDg7o29sCibgQwYWS3qMELPn6qkVqczdPcZ6EOk4QWUXT+/1w3hMELb6xILLHMPN1OB4mkIQ3auKipbIYYnFVBT+68/5AuIPQOtOp3ko002fuAVO7dHpvLajhoRbFsvImq5MCrnrOD5ANGJJMAF2YWtphaBxU2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KzcHHVug; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KzcHHVug"
Date: Wed, 4 Jun 2025 08:49:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749052192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=va3tPoFKvEZvnM+DL5DLzHoxmXtQwY1XyzpbkHe61Io=;
	b=KzcHHVugoFfkefRf47HU3usVKdW0NqhvWH9TCHKIPBCJm9OajrSbQyqBMxB/46I1yHYkcp
	UhtddbC8ziUjBCE0lZxtHO6EHO3InWGXbm8PaGzYPplYwCUWyTjcKWPU+tg7ASo7wui0uk
	m9fd3AX2hvu2o2bmlX2XZUx7QgpbgnA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, 
	vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	hannes@cmpxchg.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, 
	Konstantin Khlebnikov <koct9i@gmail.com>
Subject: Re: [PATCH] mm/vmstat: Fix build with MEMCG=y and VM_EVENT_COUNTERS=n
Message-ID: <hwn7s3xjgpfdtvjtnywvv4wwqqxh3ojha7nblp7vy4zfee4epb@25rgcpyhebb5>
References: <20250604095111.533783-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604095111.533783-1-kirill.shutemov@linux.intel.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Jun 04, 2025 at 12:51:11PM +0300, Kirill A. Shutemov wrote:
> When compiling with MEMCG enabled but VM_EVENT_COUNTERS disabled,
> BUILD_BUG_ON() is triggered in vmstat_start because the vmstat_text
> array is larger than NR_VMSTAT_ITEMS.
> 
> This issue arises because some elements of the vmstat_text array are
> present when either MEMCG or VM_EVENT_COUNTERS is enabled, but
> NR_VMSTAT_ITEMS only accounts for these elements if VM_EVENT_COUNTERS is
> enabled.
> 
> The recent change in the BUILD_BUG_ON() check made it more strict,
> disallowing extra elements in the array, which revealed the issue.
> 
> Instead of adjusting the NR_VMSTAT_ITEMS definition to account for
> MEMCG, make MEMCG select VM_EVENT_COUNTERS. VM_EVENT_COUNTERS is
> enabled in most configurations anyway.
> 
> There is no need to backport this fix to stable trees. Without the
> strict BUILD_BUG_ON(), the issue is not harmful. The elements in
> question would only be read by the memcg code, not by /proc/vmstat.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Fixes: ebc5d83d0443 ("mm/memcontrol: use vmstat names for printing statistics")
> Cc: Konstantin Khlebnikov <koct9i@gmail.com>

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
