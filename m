Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCF41B4244
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 14:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743172188; cv=none; b=NOaGLTFFxDmrpwiXJM/h/bHEarsEizwCv4bsKbg4z7JOOAw9CI4t/rqgZyqwoPrKCxM60CFdJEus1RcnW90C8GMPNW2aSzdJdOY+6jph8EJ6w0DO9HWG8MubL+CElvXJSS+i92KIid/OEJrjiAIHESx7v/nilMZX1b489Sz7P9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743172188; c=relaxed/simple;
	bh=SVUJXDnk8Q1w8arn6lpxufraWiABsdUivt1gzYkKQBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QlS0/W2sG9sfh4Gons4j+8QYIi5VBTOGN3eS9oSxh3SjHjIujiEIRKZfs2+opg5yAJ4aCvK4ED1NpLFJbRw1cDeXCwFO7BTY/suiblubpuwBb4xOurX4aCSGcH8+PDgo3rwD+Tc1XwCBusOxbGHVDjXetQZwSysa1Ci3reijUyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JxOb0ekQ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JxOb0ekQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tyt/ZAKoHxN92NT1NO7qDEoIvsrs/XPq4582kbmb4HI=; b=JxOb0ekQafhxhp449WSOz+GRZu
	xvKVTQUQP/vQiCcUD8BcLjxaL6zSErgpG0VREOjBPkCiIczsN2RmExgUwuDJawhX1Tm9pRCq9zFoH
	A5hlOpaewWLSQtm8dmkZiBOcEtum38lgwPvip55zVKjMeu2guFT8KHEJ+uFHrDziL5DuoBe00jt/F
	8cA02Ro37jX3N2+XZLyLYVMsrEHcl0IK9GGr+GU9M5Sea5lzDkGQEewgyxZ7Ln2dE11nGpe+n0LiR
	wnJAtebomUO9wO/lXV0WNWrrzpUmZiFY+vvkkZQVpQJ7RzM2swHBM90YUoz8O8hGa/FNgBg0s35KW
	dXT73p0A==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyAiE-00000003TQ9-0q61;
	Fri, 28 Mar 2025 14:29:34 +0000
Date: Fri, 28 Mar 2025 14:29:34 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Ye Liu <ye.liu@linux.dev>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Markus.Elfring@web.de,
	Ye Liu <liuye@kylinos.cn>,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v4] mm/page_alloc: Consolidate unlikely handling in
 page_expected_state
Message-ID: <Z-ayTt8o656AkGfz@casper.infradead.org>
References: <20250328014757.1212737-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328014757.1212737-1-ye.liu@linux.dev>

On Fri, Mar 28, 2025 at 09:47:57AM +0800, Ye Liu wrote:
> Consolidate the handling of unlikely conditions in the 
> page_expected_state() function to reduce code duplication and improve 
> readability.

I don't think this is an equivalent transformation.

Please, stop with these tweaky patches to incredibly sensitive core code.
Fix a problem, or leave it alone.  We are primarily short of reviewer
bandwidth.  You could help with that by reviewing other people's patches.
Sending patches of your own just adds to other people's workload.
