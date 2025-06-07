Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DD2288A8
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 04:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749269114; cv=none; b=X26NycpM8GoYS0bm/oN6lb3vU7FrqpcEfVbKT+AoucTBP91Z+fWPRrkDsaK3F+fplTr6nL/uJzbvjb7+tF4tahMTnlSXIFoFgPPiRRMdz5La8Y2SDyQaFEwLMBMdd7dAU5Ws1oZh7Ly1zA8lT51CoDxcyhrJJe8SzSlh9i9fZbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749269114; c=relaxed/simple;
	bh=s1nyGX+yiOHg/ea2tBEev02lgZAf6ZoRa1j+eEQvAbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YhLWAnhf+z+cs0bLxAWVBkYVZ0XYl12QQhsU2wP53jbxfrc8a9cd5SSfSuDQw3nHlQEQ5Cn3v8FEADeI1+eXeIebMup5JxsRBELKpMc6OyfExMKNKuWl2TOAdOdfEz+pA+puayozAOi+CZylPN44esD04Fg3UlUQvRvZ1qa6edA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=J3eA7QlS; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="J3eA7QlS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aCm3lArCll2eN1r1FMfyoXRwFZB8N6NKtTqs5sutnAo=; b=J3eA7QlSlSrL+SAc0+Xb3ApBH9
	Kb9ZTGQ0sZeZ8mLYqtxMSigiSXHM2+0ErwYh6BQ/vf3oirdjsfH9Wngk6J3DQYBWk56t04/1SbC8L
	TJRdRRvz6dFS5/zRinR+O0AOMvY2b0Ta5CHy5YxhlBIA3KjWKnzLdt4P1iYwd18tFAJ9hnZqcZmJU
	Du4988U+qESXIddjcvDY6psG7y5qEvwKTwbCLRTgo7fmbaJaNoBeXo/TBA0gNLs9BMfKsrc6L9wLh
	tU6RFhmU5kVktEkr1kwL3dWtpmrJENYjE2iePzQZyEREIewEkuR3QEKg/k4BQN9cuw8FUPOS0c0ww
	kR60dsAA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNkni-000000064On-3tKE;
	Sat, 07 Jun 2025 04:04:58 +0000
Date: Sat, 7 Jun 2025 05:04:58 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Lokesh Gidra <lokeshgidra@google.com>,
	Tangquan Zheng <zhengtangquan@oppo.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v3] mm: use per_vma lock for MADV_DONTNEED
Message-ID: <aEO6asiCu9oG1z8o@casper.infradead.org>
References: <20250607004623.8896-1-21cnbao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607004623.8896-1-21cnbao@gmail.com>

On Sat, Jun 07, 2025 at 12:46:23PM +1200, Barry Song wrote:
> To simplify handling, the implementation falls back to the standard
> mmap_lock if userfaultfd is enabled on the VMA, avoiding the complexity of
> userfaultfd_remove().

This feels too complex to me.  Why do we defer grabbing the vma lock
so late, instead of grabbing it at the start like the fault handler does?

