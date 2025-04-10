Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2F863B9
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 00:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744243959; cv=none; b=avmppBv4+2zzt7j9rrhwcHXOnWsux/6d8v9zuBHM6nU9lFr3p+NdoL0TPNVW3tV+IM6A57qzTcLsHC8PtvsKBdjR/i12rcHtX/DknYGO7wFU7NTdOuxdNVuXncHWT/z3Df3Kioy8kqRrNqTX//7TncqgHWCTF8cDNn2/5ii/br0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744243959; c=relaxed/simple;
	bh=nLOWCvHZoWzgjEvppluyiSsl07wM63eUSZJ6MazbjHs=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ANQo3BDMTp5CEQBBbNqNfC3AL6JiJ5jZHmOX/by96PkRzGZG45S6qs2C4h52TLl4hL4/GiS86OAvFFGD/Xg8chCIc2ChrxYObjsUffA/zGATz2fGl8XflGo5Zm5yDCZMQIhrc7wGM2oeVQyAR8A/SZLesyZSYGIBLRvJPRiwUyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=caEs1Kh4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="caEs1Kh4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A132C4CEE2;
	Thu, 10 Apr 2025 00:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744243959;
	bh=nLOWCvHZoWzgjEvppluyiSsl07wM63eUSZJ6MazbjHs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=caEs1Kh44EGMrsFutHyQ9jQiTL10e5+gsdtXRaNIWovIRFFssom0XQy6MKwxC2h0C
	 bUCjx9+KZQtIMqPH5Gz5FabtElII5CJcAXDgz5CNv9Dbev9ABZVxBtHq8VU+QbwJmP
	 3NTbIhfFTFuC8KykCxltiT0IM5E4j5NrFZfEYcwc=
Date: Wed, 9 Apr 2025 17:12:38 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: surenb@google.com, kent.overstreet@linux.dev, janghyuck.kim@samsung.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] alloc_tag: handle incomplete bulk allocations in
 vm_module_tags_populate
Message-Id: <20250409171238.494fd49979b4607bff9791b7@linux-foundation.org>
In-Reply-To: <20250409225111.3770347-1-tjmercier@google.com>
References: <20250409225111.3770347-1-tjmercier@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  9 Apr 2025 22:51:11 +0000 "T.J. Mercier" <tjmercier@google.com> wrote:

> alloc_pages_bulk_node may partially succeed and allocate fewer than the
> requested nr_pages. There are several conditions under which this can
> occur, but we have encountered the case where CONFIG_PAGE_OWNER is
> enabled causing all bulk allocations to always fallback to single page
> allocations due to commit 187ad460b841 ("mm/page_alloc: avoid page
> allocator recursion with pagesets.lock held").
> 
> Currently vm_module_tags_populate immediately fails when
> alloc_pages_bulk_node returns fewer than the requested number of pages.
> When this happens memory allocation profiling gets disabled, for example
> 
> [   14.297583] [9:       modprobe:  465] Failed to allocate memory for allocation tags in the module scsc_wlan. Memory allocation profiling is disabled!
> [   14.299339] [9:       modprobe:  465] modprobe: Failed to insmod '/vendor/lib/modules/scsc_wlan.ko' with args '': Out of memory
> 
> This patch causes vm_module_tags_populate to retry bulk allocations for
> the remaining memory instead of failing immediately which will avoid the
> disablement of memory allocation profiling.
> 

Thanks.  I'm assuming we want cc:stable on this?

btw, it looks like the "Clean up and error out" code in
vm_module_tags_populate() could use release_pages().

