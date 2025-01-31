Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7318913A3ED
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 07:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738307355; cv=none; b=Cu7K4v57fIp+w4Xdy8iGxPhBH7IAe4sjhjYOHavgvaRUNHxQ3la5ruMmHJCCyESbQZDtuWNXixZKmKez1tPe2l9U1/LnwEjg/krWKjh9XNxtzeR+UDUPR2Mktey08e+AkAqhtexkku2NWuXKr7O+Q3ZGoANZQpMVEUQ/1f6599A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738307355; c=relaxed/simple;
	bh=+sLwQVDQYWrP1ByPWEKmPZQIo5NOdga04/OjPIuxojg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qmF1zi5NGGTT9rQDivfEsHtayGf4aWbuOdMkUglYz6exX8tIUzCXUdng+6HkLttonlt7zl/WEKRZzHOQ6lEG4182gE9RZqwejv8emNCcl3/cMrqTDBDkXUFVQt9MW5hperOvTYGcELbckjyxx5RmA0bwPRAFO3FkucS72gFzs5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=19USrSK8; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="19USrSK8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bFZeVzxc3dnxjC50vEGlk+B1OaTDn6eywIz+QQYfG18=; b=19USrSK8nOecNvKzEcmCroOnUg
	QP/xAC4fvv+9djwMr0UGK61nUGfO3q3MID7qK9ZXob1FwQeI9ueLnyXdMQF8M25jtI8uGmiDflsHi
	wdTQmJs1KDrPtCj8nemA4YsMYPRf2bwj/R2KKIpwULmP1gGwgKi/BKKP0RieMxlbxP/dZWzcMyx/L
	zL4nyEp6HPYDPoIW2E78qWsWSzWaPjFbcgkI1x4ZVHgLPxd7/F3Kq8YcJu3AQPWi2vpkdzzI1ieRq
	oKmYqcqTgb9HKxb6zV8t3t9HZBhFVmUYnWCgQRQFr4rnpA/ehytqcSe1HO2c7Z2jzggDltGM6W3zs
	AczPQwIA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tdl9N-0000000A5Rn-48B8;
	Fri, 31 Jan 2025 07:09:13 +0000
Date: Thu, 30 Jan 2025 23:09:13 -0800
From: Christoph Hellwig <hch@infradead.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, hch@infradead.org, urezki@gmail.com,
	intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/2] mm/vmalloc: Introduce vmap_file()
Message-ID: <Z5x3GQAzN3S-plD9@infradead.org>
References: <20250131001806.92349-1-vishal.moola@gmail.com>
 <20250131001806.92349-2-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131001806.92349-2-vishal.moola@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Jan 30, 2025 at 04:18:05PM -0800, Vishal Moola (Oracle) wrote:
> +	rcu_read_lock();
> +	xas_for_each(&xas, folio, last) {

This only maps folios currently in the page cache, which makes it
usefull for everything except ramfs-style purely in-memory file systems.
I.e. for the shmem use case in the second patch it fails to swap in
swapped out tmpfs folios.

> +EXPORT_SYMBOL(vmap_file);

EXPORT_SYMBOL_GPL for any advances vmalloc-layer functionality, please.

