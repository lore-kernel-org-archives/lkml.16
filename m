Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF762BD1B
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 03:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750045235; cv=none; b=fEgF8jeXn8w/eTp5Qh6cHdk+95HzZhhovU14LFUdHv+EY32vdRhibBJCknUnkJBP6+hJjS+QOtK/oubM6iuAKEULySbsJUV++x2iJg7ppw/j1SWsJFX6a2D892LmxSzeHMNg9wnu00bLZey9CAaZ0btP7KKMBqoC3AKcU8wOO24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750045235; c=relaxed/simple;
	bh=W4SIuUzkT5mVE1RrHAn0vG7LinbBzbTWL07K/Yv8C2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKY5FpyYhVHdBfiGBZVIoa3Hb50XL1O+9LWCuxt05pRLtTV6vEExKVF0dTEa+DW96Pv0wyIuCyh8cDApKVX8cO5sq7yugPoUO9hvpMAWD4eqjiXpS7cREwJloYbidqiWTKkPU754WbMUs5D9cAJkrKN5K3HOT7PTtTP6gaA5vv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=b7//YpT8; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="b7//YpT8"
Date: Sun, 15 Jun 2025 23:40:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750045229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M9RfW2nEE+0kGLXPH3AFsKi1E6NDrayrZ4jmqmjVjj0=;
	b=b7//YpT8dFWW5uGmVDNMa1r6x35hfPi94C990VZASQjFQkgq0t5Wr9msvjLYReyjQ05+BG
	CslOmSdtr99RZZazz/BkzOSRozMPJUcuzwI/jCeJNYDLOmMv/oPovu8txjZ9u7YUqJnMQz
	/NM3wwtmNmWb9UKLTMOHVowVCMtrVyM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Matthew Wilcox <willy@infradead.org>
Cc: Hao Ge <hao.ge@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, Mike Rapoport <rppt@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org, Hao Ge <gehao@kylinos.cn>
Subject: Re: [PATCH v3 1/2] mm: Optimize the ARCH_NEEDS_WEAK_PER_CPU logic
 for s390/alpha architectures
Message-ID: <tb3jmhwt2ftchoual2futd7g4ltkswpwvmwei2ff5grmxrovub@ftna7njmn34u>
References: <cover.1750040317.git.gehao@kylinos.cn>
 <57e110be6d8387e403b4ef1f3b10714c36afbb51.1750040317.git.gehao@kylinos.cn>
 <aE-L81GzxzWBTfPb@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aE-L81GzxzWBTfPb@casper.infradead.org>
X-Migadu-Flow: FLOW_OUT

On Mon, Jun 16, 2025 at 04:13:55AM +0100, Matthew Wilcox wrote:
> On Mon, Jun 16, 2025 at 10:29:17AM +0800, Hao Ge wrote:
> > +++ b/mm/Kconfig
> > @@ -929,6 +929,10 @@ config ARCH_SUPPORTS_PUD_PFNMAP
> >  	def_bool y
> >  	depends on ARCH_SUPPORTS_HUGE_PFNMAP && HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
> >  
> > +# s390 and alpha should be enabled,see comments for DECLARE_PER_CPU_SECTION
> 
> This comment is inappropriate and should be removed.

Inappropriate? That's not a word I'm accustomed to hearing as an
engineering justification.

It's referring the reader to context they might want to know about, and
other comments they might want to read. Looks like a good comment to me,
if perhaps a bit terse.
