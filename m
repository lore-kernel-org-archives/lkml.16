Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E541123A9BD
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 19:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747076598; cv=none; b=LdGkJCU+r1n54Ya24bTBl7lWXI+eaGZHSftalfdG7kOVOpqOrCzJT9DAW5hFgKbCMTquNOqzRlczmAFskp6541Q0sLt28rXO4/aaZnHEYCfxxqGv3B1Mmo37pKKxFAjLLat/a+L2igWgp4wcxCkw1wcmuvvC/PPmr0IOeblztm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747076598; c=relaxed/simple;
	bh=O4H8iAzwOwN+yTMHteguWKtTAD4YhTkV/H8oa2wjqkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b5LEzmBHHEmGOhfH1RAmmezdbjPnmRtHBs9CaEdME/aNP9to8q6OnGej/+lDbRb1kS+9PwhNwSw73dd4bhbmiAZEup4BPXqS+zBGDuduhv/kO/DR7KEp7JMp+wvZI23b7BIo+Tfr/T18IzTkj2QK614djRw05s8Wcfk+v9hv2dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=m8nKzx19; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="m8nKzx19"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6TU8lovtR+mIfquQ2rCbk6fwLvKUBUsDQ9Gbh5JlI78=; b=m8nKzx198g557xXfy33UFRw+Kr
	qoyVHoc5J/ZHQWHjy+CmISnWIg9QilqxqRc8j5FTIC44xRVH68NBsZBcQtK0pJzqoGQ8aNBSUKezj
	4AoX90aHZB39mu2IfgjZn4nJg61ODpbKGnlMQGDPjujcsDYFgY2ao9ddJgjrhc3+qC7gpe6Ow9ytz
	9EpqnIuyHFh+fWWZZLlL6mGmjat0WVnJ7Fth3pWkzPpGj9onP41kYaYjM5iKCJngX659kfFbAtkxU
	oi6USOiKVK6s1Y9R8W5CYVaxs50SuOTOrGBQA/Cd64UgKVuoz5Ju26v890On9g7o86334/Ia0xUI3
	LwARxIjg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEYQh-0000000AAGr-304E;
	Mon, 12 May 2025 19:03:11 +0000
Date: Mon, 12 May 2025 20:03:11 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Nhat Pham <nphamcs@gmail.com>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, yosryahmed@google.com,
	yosry.ahmed@linux.dev, chengming.zhou@linux.dev, linux-mm@kvack.org,
	kernel-team@meta.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] page_io: zswap: do not crash the kernel on
 decompression failure
Message-ID: <aCJF74ILruXJOAkQ@casper.infradead.org>
References: <20250306205011.784787-1-nphamcs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306205011.784787-1-nphamcs@gmail.com>

On Thu, Mar 06, 2025 at 12:50:10PM -0800, Nhat Pham wrote:
> -static void zswap_decompress(struct zswap_entry *entry, struct folio *folio)
> +static bool zswap_decompress(struct zswap_entry *entry, struct folio *folio)

Hm, why do it this way?  I had it as:

-static void zswap_decompress(struct zswap_entry *entry, struct folio *folio)
+static int zswap_decompress(struct zswap_entry *entry, struct folio *folio)
...
+       err = crypto_acomp_decompress(acomp_ctx->req);
+       err = crypto_wait_req(err, &acomp_ctx->wait);
+       if (!err && acomp_ctx->req->dlen != PAGE_SIZE)
+               err = -EIO;

which allows us to return something more meaningful than -EIO.  Or is
doing that a bad idea and we should squash all decompression failures
to EIO?

(also i really dislike the chained approach:

        decomp_ret = crypto_wait_req(crypto_acomp_decompress(acomp_ctx->req), &acomp_ctx->wait);

that's much harder to understand than the two lines i have above)
