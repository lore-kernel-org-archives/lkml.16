Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D474728315A
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 15:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746546423; cv=none; b=NyjLfTpmfr4pVCsF9yEo0E/Jzn19LdtRztkGmqkrs8ymYdfvQas7QjoaWvko3C8em0gouwlTcYBPxqdH2gmGmzgw1Rp6FLpPVM+901c/ZeC39ht61/sf0/CJtpmEM2bsrjTrAc6gtEqHonV0q3CUVkD/G0JPKBTlZBBmk8AJKRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746546423; c=relaxed/simple;
	bh=1kOTEB+XotqMQtGZyzuTL2CzKhbLpX1xkyCPEPsG3VY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKzqh8C42ZaMsMxr58/dEmJcX8/BwqWon3sQHQ3MA5T7liYAGOYpQ2+V1YTVuDcc/ZQEyjW/OWIlgYe3gxkXyPXWNaTu9ss7Sak4fIveul4i8+iEMS+S+ZdaLuy/k7zkzHsHum+kkmF3D3uTIlI/Xix4EG5Zd1t0ZLTb+uaLxEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=m6jASJtV; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="m6jASJtV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3HBGcSU1ag8kdhmbzKBu+ZaOAcgBI9VSpgvysRkMghw=; b=m6jASJtVPwIQsM9PpXilPbY/Qf
	TN3LXuNIpar9SAPINGO84PBgldOKuGcrlb0WpiokVF6OIkI7d8CJ97uvNI1nnA/eo1tK9GRG+lu4J
	XSbzTDCqpjSkrHOORxGwihokgkUJobXOfX/LGD6AsJM7yTcKNstBGarYXkndhA91ApkyhhibF54F9
	OkRiS1l0Nfu59uNlPnShs02k4DDVXiIBndejRjpjIqyt60BENfO+pUwaS6DQwNTGOXLiWfkaW/g+l
	xsdCX+zPqTE5gccXYIPa6pAR7nX2atuWGMcP40O9kXJdjF+oWbqECoe8Niya4ybs9JCEvKhKeIpQ8
	nUEhEFvQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKVK-00000005RYW-3lJC;
	Tue, 06 May 2025 15:46:46 +0000
Date: Tue, 6 May 2025 16:46:46 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com, vbabka@suse.cz, jannh@google.com,
	pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	david@redhat.com, peterx@redhat.com, ryan.roberts@arm.com,
	mingo@kernel.org, libang.li@antgroup.com, maobibo@loongson.cn,
	zhengqi.arch@bytedance.com, baohua@kernel.org,
	anshuman.khandual@arm.com, ioworker0@gmail.com,
	yang@os.amperecomputing.com
Subject: Re: [PATCH 2/3] mm: Add generic helper to hint a large folio
Message-ID: <aBou5i71eiLSvzUU@casper.infradead.org>
References: <20250506050056.59250-1-dev.jain@arm.com>
 <20250506050056.59250-3-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506050056.59250-3-dev.jain@arm.com>

On Tue, May 06, 2025 at 10:30:55AM +0530, Dev Jain wrote:
> +	return unlikely(pte_pfn(next_pte) - pte_pfn(pte) == PAGE_SIZE);

umm ... PFN is in units of PAGE_SIZE.  Did you mean == 1?
