Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EBF1F0E25
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750085427; cv=none; b=sQZdhTyr5NPOHEYQHQv/YtCIZxbDCK8UAHQ+W/J4QXlpIAr5W8chyaAvFLpXKma6nxzNnZuNNjiJpslALMNyYFrw9qTFC2938/kSTLF7MFLuRaK4JTjLqQ9zp9/i8Y1VgIcl7nD4bQ/ph/Tt/xFsAd/KhcX1bH10PXCVUHUcDII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750085427; c=relaxed/simple;
	bh=NLHb6i+qfakh3m/2nUmEanwAnL7MqTRL1fFLISGJsfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFC6bYUD5ks4+clTqRC97ulw0vuY2Red2YZnW4zNuk24fa/awp0+oGT0/xpyozO0XNsCv0UtjbHFDPLgaYF7yWnmo0dErCD3GcdniJVUb+noEpZw1BplsHVQbbaVXE4cAlfG7i/q27OFs2vDVCr5oVwXXE5oFcWGNqpQ28XtN+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=IJ6JZT0d; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IJ6JZT0d"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NLHb6i+qfakh3m/2nUmEanwAnL7MqTRL1fFLISGJsfE=; b=IJ6JZT0dcI9doVtkpQ1MU4ZIRg
	HXgnl/4XnBwbXVkR+gur94H1RK5EM/DErrK8zGCZkO/Vsjk6xqEQ3RN+Grv4GITduD+mGVA6ocBfg
	EWylcsKgU4aTBT19cT1mSo9Lvhagpt3GkUlm/wkhp3cwKIMvnOeroe+Flz3Hi+NZaHzoS6RC1wRzH
	233FNkwRk+POciJSuvtLmRzwHLIOXtaif6PvbisOoHRoDF1/+4ycsvnaEi1wctOQNf+37L6nATdYN
	GnfV6d9EDonlWPgTSWH3c7GQSm9IDYCSfGu5V29rVYDKu8oURAoBwXNdSnvdUdzrLfHczqOrNPGRh
	BfVe3H0Q==;
Received: from 2001-1c00-8d82-d000-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d82:d000:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBA2-00000003cLU-0Als;
	Mon, 16 Jun 2025 14:50:10 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4255930D552; Mon, 16 Jun 2025 16:50:07 +0200 (CEST)
Date: Mon, 16 Jun 2025 16:50:07 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org, akpm@linux-foundation.org,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	mingo@redhat.com, mjguzik@gmail.com, luto@kernel.org,
	acme@kernel.org, namhyung@kernel.org, tglx@linutronix.de,
	willy@infradead.org, jon.grimm@amd.com, bharata@amd.com,
	raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: Re: [PATCH v4 13/13] x86/folio_zero_user: Add multi-page clearing
Message-ID: <20250616145007.GF1613376@noisy.programming.kicks-ass.net>
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

> To me, that's deserving of an ARCH_HAS_FOO bit that we can set on the
> x86 side that then cajoles the core mm/ code to use the fancy new
> clear_pages_resched() implementation.

Note that we should only set this bit with either full or lazy
preemption selected. Haven't checked the patch-set to see if that
constraint is already taken care of.
