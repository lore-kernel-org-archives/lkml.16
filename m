Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCD42C3250
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 21:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748901322; cv=none; b=sR/B2YT2ZdXtfgVETsgbPaaTKpiYwKgn3lFtxIaH9+ek4QridHelJ5JGMuPGIih+zIorTy4hQMsfF5FOy9g1OjQukGxcJVRu9aYBpuJLnpHUxiscxR9NaoI2TYvyHw7f/DzN+YvZZh3t3PnWYoQrVv2d8FQ41//H0QdbxyJbHdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748901322; c=relaxed/simple;
	bh=oo3I4f30jXyErZDGdaAuUMEz0xSs68rR1L+FyYncphg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RAuW0j2T9f5+pqIcNYfwLwmvtYCU7C2FPOUwDM5/+nfseMcQKUdM7Qe2tUidkvNgIlQwDlsMy6GoW/2Knc0NYtA0Lu3vLm1IzEaTL8OMx1kkMxdzmj66HYSjWEKwxXdOGBTj2M9KHa8fWhwFkyi9d3S/V3tsUCk/e6hS6RIV6WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jpIjGecw; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jpIjGecw"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748901316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oo3I4f30jXyErZDGdaAuUMEz0xSs68rR1L+FyYncphg=;
	b=jpIjGecwXp0f/ZnGZp/RUblspujfr4DhcN1BFhelkLBby5XZXJl2R1Z5jxzBJLieK9wOd9
	uSRhsKulxKoUbfbRbcHq2f3/oQc5xs2TpnGxSt5dY/yiDRYNGCIDWPQKs5GQAoXSU4PeTX
	MOB4k8hrNplMguBNPuG+K9eilzEk+D8=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Christoph Lameter <cl@linux.com>,  David Rientjes <rientjes@google.com>,
  Andrew Morton <akpm@linux-foundation.org>,  Harry Yoo
 <harry.yoo@oracle.com>,  Matthew Wilcox <willy@infradead.org>,
  linux-mm@kvack.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mm, slab: restore NUMA policy support for large
 kmalloc
In-Reply-To: <20250602-frozen-pages-for-large-kmalloc-v2-1-84a21f2c3640@suse.cz>
	(Vlastimil Babka's message of "Mon, 02 Jun 2025 13:02:12 +0200")
References: <20250602-frozen-pages-for-large-kmalloc-v2-0-84a21f2c3640@suse.cz>
	<20250602-frozen-pages-for-large-kmalloc-v2-1-84a21f2c3640@suse.cz>
Date: Mon, 02 Jun 2025 21:54:21 +0000
Message-ID: <7ia4tt4xvmgi.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT

Vlastimil Babka <vbabka@suse.cz> writes:

> The slab allocator observes the task's NUMA policy in various places
> such as allocating slab pages. Large kmalloc() allocations used to do
> that too, until an unintended change by c4cab557521a ("mm/slab_common:
> cleanup kmalloc_large()") resulted in ignoring mempolicy and just
> preferring the local node. Restore the NUMA policy support.
>
> Fixes: c4cab557521a ("mm/slab_common: cleanup kmalloc_large()")
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

Acked-by: Roman Gushchin <roman.gushchin@linux.dev>

Thanks!
