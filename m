Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C6D182BC;
	Tue, 24 Jun 2025 13:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750770676; cv=none; b=Rzk65K3GsYhG6x8dsxM+iYFw0XmiUb4U0+NcmLbQZPGbm3jBoqkHxmmdVj+EM9B4MsKtIiqtV932mRMApZ0q93dJ/RNnDmGjSAW1J8xk93+ch/kiXPSF2qvxG0OJQN7TYzeEVYIVXpsUXosXbEcRh/HVVSu84Cp+Oi3rt33v03w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750770676; c=relaxed/simple;
	bh=pf7V8ZFHSDFoTFDOVEOJ17/2ksxrzCweglUWuq25TSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VatK7qF6W8a8IPsVSpUh1Kqh4xdin00pso6OcOjUYQG9onojwD0s1U8ah4sgQkpihz23Hz9rGOugeciajVVQ5yA0oylpQGimhBohtt1N2maXtjtYFZPWTCphfwUZ/0fZQRBjsTkUL3Clrms2CM7YtMnjkAvkwDgEH64vcjV7v9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WkBzP0hC; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WkBzP0hC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BFg+UglFBXSDH09z4reIXqlceEQivXupwjdKDxA9w1s=; b=WkBzP0hCZtOxKo4teppSjK+dzU
	x3EAIuJi6DcR70CzRnVNPzz+XvfYus7Xy5emq8VwDnaVCN9PYUPF4b3ZJD80h5j+ix6ILv82cH6Jf
	0t+CcA20J+dn3TGQPiC/DQOcon9+ZSUxc9dN+HO3Q8/x30MHFFM5+oMes6xeINMyfG6gk/p5yWI81
	RY/Z0XFz2mjuOTHyxtG+r1MgCWj1aj79E4kObBeSUkdWpsHV1DauD4dmBx4OiVX7yauY+3DUpL2BU
	ALGEAJxfAjMLGJy6SncR4EVJz7L6eVk7KB7YadazhlPKfTtW51LrOdm7SX/uE3n7uTNYzTTXfeaSO
	GqaSWL3Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3Qa-00000006eUv-29ID;
	Tue, 24 Jun 2025 13:11:08 +0000
Date: Tue, 24 Jun 2025 14:11:08 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [RFC 1/2] lib/vsprintf: Add support for pte_t
Message-ID: <aFqj7CYRcEHFAi2e@casper.infradead.org>
References: <20250618041235.1716143-1-anshuman.khandual@arm.com>
 <20250618041235.1716143-2-anshuman.khandual@arm.com>
 <aFQP8LzVMctf6XH5@casper.infradead.org>
 <d5a86ef8-a58c-4abc-8312-08406c847edc@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5a86ef8-a58c-4abc-8312-08406c847edc@arm.com>

On Fri, Jun 20, 2025 at 01:42:53PM +0530, Anshuman Khandual wrote:
> On 19/06/25 6:56 PM, Matthew Wilcox wrote:
> > Unfortunately, the one example you've converted shows why this is a bad
> > idea.  You're passing a pmd_t pointer to a function which is assuming a
> > pte_t pointer.  And a pmd_t and a pte_t are sometimes different sizes!
> > (eg sometimes one is 64 bit and the other 32 bit).
> 
> As discussed on a separate thread, this might be addressed via separate
> printf formats for each page table level e.g %ppte, %ppmd, and %ppud etc. 

There's still no typechecking!
