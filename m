Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A0542A8F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 16:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748883140; cv=none; b=t0JX8xIupRHM31HzUSnqPytteQkUKlMdrGCG2ZPA6R72ZOkgbmBTFvqKTXRY955qrNAPbEzhLUZ4zOuoIY7mgIKV3eZQ2JJTX1kx3r06IX445fzgEnExR6v05yqIIRMbWvyjaTR0sbksqHa05+/4iF0t1eU6ujryJmcti3+fPpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748883140; c=relaxed/simple;
	bh=FnIUHVIw4lAF33BWUwvSfUcznZGc7dHrCz/J6PnpDgs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FmRFjVFBDqEYnMwJT2xopXowV4KrkqqndV3Fb37d2nP+EsSPGHmFwxW5MDple1JJtHSijufFeUz7JkR+w2xoMFWUdszolY3MwuDkDxbbcFZUm9elwekd0+b2B5QVx2iY9hOx64fPZ+bGAI3cRDtJo8KgiCmMywfcXV035Yo3e6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=jjHnXVzH; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="jjHnXVzH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1748883130;
	bh=FnIUHVIw4lAF33BWUwvSfUcznZGc7dHrCz/J6PnpDgs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jjHnXVzHtYUf/iM/1G98+1/vqaJe2XT882cFZXh7dZueWX35II4CpDXLz17ZNGSJm
	 RiDoNNlvAUB1ngJaE5gwRFMJRsl6Q8EQQmnLNoBO5CRgFH2tzuWGmwWYRkWIR3IGBE
	 wn4tvvIh8D8kTXhWkGMNL8kUqTIqnAz4rMr53EBw=
Received: by gentwo.org (Postfix, from userid 1003)
	id 422A9401E1; Mon,  2 Jun 2025 09:52:10 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 3EB0F40190;
	Mon,  2 Jun 2025 09:52:10 -0700 (PDT)
Date: Mon, 2 Jun 2025 09:52:10 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Vlastimil Babka <vbabka@suse.cz>
cc: David Rientjes <rientjes@google.com>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Roman Gushchin <roman.gushchin@linux.dev>, 
    Harry Yoo <harry.yoo@oracle.com>, Matthew Wilcox <willy@infradead.org>, 
    linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mm, slab: restore NUMA policy support for large
 kmalloc
In-Reply-To: <20250602-frozen-pages-for-large-kmalloc-v2-1-84a21f2c3640@suse.cz>
Message-ID: <a96ec09c-03e6-fcec-58c5-b9398d2333e4@gentwo.org>
References: <20250602-frozen-pages-for-large-kmalloc-v2-0-84a21f2c3640@suse.cz> <20250602-frozen-pages-for-large-kmalloc-v2-1-84a21f2c3640@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 2 Jun 2025, Vlastimil Babka wrote:

> The slab allocator observes the task's NUMA policy in various places
> such as allocating slab pages. Large kmalloc() allocations used to do
> that too, until an unintended change by c4cab557521a ("mm/slab_common:
> cleanup kmalloc_large()") resulted in ignoring mempolicy and just
> preferring the local node. Restore the NUMA policy support.

Acked-by: Christoph Lameter (Ampere) <cl@gentwo.org>

