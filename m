Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1762FFC08
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743517264; cv=none; b=gvPxTeEtp9Ba1yhPLWZ3dhlbGIbePfB9XmEGzDIBPROGAt23ndnr4A3opBAHee3jta20H52CVtQSU5UcDXtLeBNjkdC75A7/OBhbeDQD0jB6DE8Csb3hmhK0OHB1z6JkNk5fC0o2pdedlqDFv2fbRfaXYRBQ/LRGSB1Rm93jpEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743517264; c=relaxed/simple;
	bh=Lj8cpPI4mAvrrNdSYlxR82GzFBselQ6y+YLSJNP8QUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B7gpaLwgA9PdLDTlnlfrznzN4LK/2wB/NjiavXsVajUBuQ1ZOG7Z4xviuHPfVBxmZBwO+oT2pg6nRCBbyJVyYdUUuX6LnE4fHUjz3d/VE9/pZQ0KhBAWZcoWqzcEkWcB8LuGitBv79mqcWjqnLtIJNa66NYHnLMcgTqBDyMQcFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Drz4ajBp; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Drz4ajBp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ltOtCaRPgpct1suR55MyDOdCq8oY5KhavoZoWUOxPjs=; b=Drz4ajBplB3SoAKnze7cFgI/4L
	a+mwBCOvx5VcySfJsI0lxy35udhVN4D0ofscY/ulqgsceZfwcMn1uSy1qHPH/jLvl0mZ8DrDk4vdn
	3oBmKh6/T+a0JK2sxOI9W1Yey61nHszednnu6EUA2+5BslM48W/zL44mA1OM0Xsp3UZqbDnHT63bu
	UZOAU07HBwMQqiDQ48L3Tf2V9McojE/bVVDfmS+qbPF0MegrMyMKfIiKI7ZbdWenXozQYX2oJJN0E
	y93AY8Myyd04E1thm8hSZIsCGebmUIL6ljQrbI0Sd5XQr6aZ2HgMIaSYc0O2DDmnPxgwy/U0yUla8
	l/zVtYjA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzcU1-00000007SmX-3tmE;
	Tue, 01 Apr 2025 14:20:54 +0000
Date: Tue, 1 Apr 2025 15:20:53 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Sheng Yong <shengyong2021@gmail.com>
Cc: akpm@linux-foundation.org, vbabka@suse.cz, linux-kernel@vger.kernel.org,
	linux-mm@archiver.kernel.org, Sheng Yong <shengyong1@xiaomi.com>
Subject: Re: [PATCH] lib/iov_iter: fix to increase non slab folio refcount
Message-ID: <Z-v2ReHKyFIXQlKs@casper.infradead.org>
References: <20250401140255.1249264-1-shengyong1@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401140255.1249264-1-shengyong1@xiaomi.com>

On Tue, Apr 01, 2025 at 10:02:55PM +0800, Sheng Yong wrote:
> When testing EROFS file-backed mount over v9fs on qemu, I encounter
> a folio UAF and page sanity check reports the following call trace.
> Fix it by increasing non slab folio refcount correctly.

This report needs to say what the problem _is_, which is that pages may
be coalesced across a folio boundary.

> +++ b/lib/iov_iter.c
> @@ -1191,8 +1191,7 @@ static ssize_t __iov_iter_get_pages_alloc(struct iov_iter *i,
>  			return -ENOMEM;
>  		p = *pages;
>  		for (int k = 0; k < n; k++) {
> -			struct folio *folio = page_folio(page);
> -			p[k] = page + k;
> +			struct folio *folio = page_folio(p[k] = page + k);

Never write code this ugly.

-			struct folio *folio = page_folio(page);
+			struct folio *folio = page_folio(page + k);
			p[k] = page + k;

is much more readable.

