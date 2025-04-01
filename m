Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585091ACED1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 15:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743520354; cv=none; b=W3PulZ+vZR3T7ylf+QOTdNIUinprnvfBahtFEwO2k7otjXDQJqZ92pGAMIKaUUfI0X5WbAebXZJ5lnc3JHSwnk0f5EwCY/QPKXKKkx2YLmfLpkgicPqjncncNHl0Sm6b57VlZeKg6Zc3Wo+SJ8lv0edBQIS1dvc5q0HyfbPlz7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743520354; c=relaxed/simple;
	bh=CeL7oJXb7tDe4tGboepKkhYBq5pmiiuiG5zBFzcl2B0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b+GNtHNbhDvLT31nRW75Tc7Zu49U9HZBIVqeOSujFXIbEqzCz0ixUe0nvkMJj1SyqgoPraCa2QTR2UYmJfNBjbp9nQ7699bbzg3QBZISepdeyGxX1rX93u7i1+1949sdme4C8C+NPZ4/QgzjGVg07i0diXyisgWi4xg2h74jRAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bX/1/we/; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bX/1/we/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CeL7oJXb7tDe4tGboepKkhYBq5pmiiuiG5zBFzcl2B0=; b=bX/1/we/9xaJ2MuEgs0TtqI77N
	y5PxUYF5Xs/z4sAiOzmETC9yeKjVt6/UHlzBjrumaYB2w9o44g0gJLTdU5xs+Y6Lp73P1ZCZbEi9V
	k/PhpO6ZZTCR5BXeEyMJDamsVwqfYdcsI34S7KTw4eq7wQwmYRJrfVQIWWGMO4f+KDjZtJKI0R81V
	vPko0aHH5QHKCjQ4cBS5qpEvr32rCNwghBHzKpBWqUOMnYwUuD6EA7AdUkt4zjKapm+OCUMUe9y+B
	uNxOEjAGr3AjkgZkGZOE4dC2tgr7vcxWY14uCVkkzBuLEmLhCsuKCkwEfM5vDUyHiicA9SwEmk9Sz
	/IGyR3MA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzdHw-00000007Vmj-2Jlk;
	Tue, 01 Apr 2025 15:12:28 +0000
Date: Tue, 1 Apr 2025 16:12:28 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Sheng Yong <shengyong2021@gmail.com>
Cc: akpm@linux-foundation.org, vbabka@suse.cz, linux-kernel@vger.kernel.org,
	linux-mm@archiver.kernel.org, Sheng Yong <shengyong1@xiaomi.com>
Subject: Re: [PATCH v2] lib/iov_iter: fix to increase non slab folio refcount
Message-ID: <Z-wCXOp9-neYI_9D@casper.infradead.org>
References: <20250401144712.1377719-1-shengyong1@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401144712.1377719-1-shengyong1@xiaomi.com>

On Tue, Apr 01, 2025 at 10:47:12PM +0800, Sheng Yong wrote:
> Fixes: b9c0e49abfca ("mm: decline to manipulate the refcount on a slab page")
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
