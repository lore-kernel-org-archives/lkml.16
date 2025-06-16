Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A230721CC62
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750085911; cv=none; b=amPSpIOg+zAlbTMqSty9znaxzy/R42v3bnlGW8PgYyIuhNNZ7k7+TIp2xHj9oP3TCJYgKzDmzsJYH9G/9XHSSZlhd2BfWW5h4hJ0Qune/rESslcDNwXFdX5ZiCd0C13ttVtzphVyyJiaQ+gQQOEFf3zH68J1siTZ2proBbzzjdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750085911; c=relaxed/simple;
	bh=mwKKLHRDWleY5Bx+V9PkDR0ezRaFRqXe2spQND4s/r8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hpXzqXWci4ALvRh9wHkBICY6/u1ddg1TKbbDLmuadI9EUguWbWM9GQMgON0yRZuOa+91kh+eWxkf/VUX/7B7mH4v9WSjj/fY6pbDDox8qgsuwSWC4Q8GRdN6x1X3vRfnqRM5H3PvPA5/Zjze7MD4cMd+Ld59rbjKlhzEjMOf/74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hLmnDTsM; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hLmnDTsM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dyBQUAInGU3lGevMO5dRke5gOvctTg4sbZdLaGpdqLI=; b=hLmnDTsM7ylDVncjqFVj63Zv/G
	vv7T3Wn3v4VhSf/MtxkiYEnBGINjpkmOuyjKX5AnSfJTUpw+ea99J1HD8vE+9yCEgOPqbpW8RlCZi
	C5aLJ65+OwhJNB7QGsPdYauFWdhPEwJyRgreCAQXPh3CUJrhHixuD2qZfMCItfkI+AAKWtFbQahWt
	X03chMj/j3ciI7+oQKAZued0wsGqcLF3o3kdFyHWeOzz5UHtx0/jUdEQ17owIxcV//MYOwVFCfwwv
	4Aw8OVELkID4sva7HTd3+robjn6w2tV/rV4o7dqbKSpPWA5M+GUMN9QYbF/KH6lHCT4hUPpKGfMqW
	wcOXjg/Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBI1-0000000G4hW-2yuW;
	Mon, 16 Jun 2025 14:58:25 +0000
Date: Mon, 16 Jun 2025 15:58:25 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org, akpm@linux-foundation.org,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	mingo@redhat.com, mjguzik@gmail.com, luto@kernel.org,
	peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
	tglx@linutronix.de, jon.grimm@amd.com, bharata@amd.com,
	raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: Re: [PATCH v4 13/13] x86/folio_zero_user: Add multi-page clearing
Message-ID: <aFAxEdZCW_uQpfqN@casper.infradead.org>
References: <20250616052223.723982-1-ankur.a.arora@oracle.com>
 <20250616052223.723982-14-ankur.a.arora@oracle.com>
 <1c0d3994-1397-4bc6-bb55-9c26acdcb477@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c0d3994-1397-4bc6-bb55-9c26acdcb477@intel.com>

On Mon, Jun 16, 2025 at 07:44:13AM -0700, Dave Hansen wrote:
> To me multi-page means "more than one 'struct page'". But this series is
> clearly using multi-page clearing to mean clearing >PAGE_SIZE in one
> clear. But oh well.

I'm not sure I see the distinction you're trying to draw.  struct page
refers to a PAGE_SIZE aligned, PAGE_SIZE sized chunk of memory.  So
if you do something to more than PAGE_SIZE bytes, you're doing something
to multiple struct pages.

