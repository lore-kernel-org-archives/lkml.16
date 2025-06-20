Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10E3221DAC
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 19:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750448844; cv=none; b=gnQRs5Uq5q8sZlLVyNM0nRyqgX54PCnmqP51ytO+jUyX+qaNBbWhgG5VKJj+TEsqXq9UDv3Z673CBZjKjRzKjRTs5XYvO6ozbS8Xu4ErEZsTOXzZ3F/naA1NAEVP0JKHjRvsHxszDzmcXGjEM/scApJyokAx5h/8PgdTUC844lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750448844; c=relaxed/simple;
	bh=FB2hqrUhHW7YhmBiIQcmPaWYlcHBB5PbC5dksswEisU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5rftiYlNVm9p/O8+p+LNc4pfJMQnqZUIJFx3gvbLJ0aACFBR5p7VTdEoge9nZHdqlGkWfsRp8Iq6s+ccQeghmi+wB+GJbg1ijCUiGFyUXSYeRSTItS6BhCyKsuO4B/5T4Am/DNOZKtNh6plK3r4te3iX4hqMAzgTUvRtskFiE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=aBunNF6y; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="aBunNF6y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KmCiGDO8SfuEqIsUQex7nb0I3QR6uiE8GqxLx19k12o=; b=aBunNF6y0B9Ra5XO22jaiab1re
	uhuQZwm5D3smEf7mZNPSRNv8ZySQ+oWBwz8BDTHjRDXE2J2cSzSLHQ+ASUxE3oWyEoM3Bzr0mMrjY
	HPe7wsPwpcgE14jxjn0mF8o5mjVRtGJ520Br2q9YfBHxzKcwCY+8BR/JJfx6TWeRci0fzs6z3Qjwq
	j8NshXEUtWMvVBzPux3Ruw1EEuf6iYBv5buFn4PQLtlsQLl0jV0uwDKCxLOHomUjtqWGSxgRVc0X/
	RT7zM383dlZIgz/imQn536Xzd8Ar8QOrfMrlQ+TUqY8w4LdfsXt6VBoNT+tOZBLWRuBeNv6BGkoHp
	TWMxGYBg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uShhk-0000000DV6o-3QPz;
	Fri, 20 Jun 2025 19:47:17 +0000
Date: Fri, 20 Jun 2025 20:47:16 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Igor Belousov <igor.b@beldev.am>
Subject: Re: [PATCH] mm/zswap: export zswap API to modules
Message-ID: <aFW6xI4m15JepI8Y@casper.infradead.org>
References: <20250620193552.2772125-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620193552.2772125-1-vitaly.wool@konsulko.se>

On Fri, Jun 20, 2025 at 09:35:52PM +0200, Vitaly Wool wrote:
> There is no reason to not let modules use zswap capabilies to
> densely store unused pages in RAM. This will allow to remove some
> homebrew solutions for e.g. GPU drivers in favor of plainly using
> zswap pool.

I really think these should be _GPL exports.  And I'm not sure why the
GPU drivers are using "homebrew solutions" instead of using the shmem
APIs which work whether zswap is configured in or not.
