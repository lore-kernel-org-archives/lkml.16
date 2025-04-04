Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D9D1F4299
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 14:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743778462; cv=none; b=o5ax1AF6H4+0jmQZuYeUO4k4o+4oZZaJcTiKXQVTpBThWkIMGu4RdJOojID708vxWVpkFljvm0kTy2qUypqFAepsApHwxzWcBA5+pcabj5Q/mAqpWm5RkkHRRgOE620gogQMyZRW6vFZ/UdjCyoDldZ1oIIb6w48pK4Sr5UmrF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743778462; c=relaxed/simple;
	bh=svkucUlganAJo/xVbUO7ayZA0edzMW37/xslNvZp+gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sIgL4kJNnEu2nouQvKEVKZ2Wu9Q6uubG3/YcGhqyryOOYbnCLtD0UpG4s3yNngMfk1InKVxevd/NJFQBS+dBi8F+UeWn7VsvEUMAx2gBQTUR8B+OfzbtUsTvgJMKBhldhNMJHsxEYsvqQivuBPAE3ilyY4Zf5XKUt0h4PV/o5Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=p/hPx0zQ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="p/hPx0zQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3f4sjl0SOnBVfAiT/z6/L3JUzr5aj/BpDpETUoVcQ7w=; b=p/hPx0zQ1us4HKITt3gMYkaQ6l
	KmwoacsdzQzkEtTTkh4xoF04+aBaC3tlXdDC4F98vNs8YWN/qCrmJ298m4CahZN06MLFCrZ6Em/ir
	hDhXi/F/X4T0QQdr2Yoh4TBLz0QNycztJEY8YfFXtIZRkiXLePQQb7O/vLNu1X7uo2RZWuabNI+Bx
	enjCV5ZOPDGOzBgD/lYB9l5U/+wrDcoetIcqBog0wvjQ8EBWvxXFN4aOzasSPhKBw6PJJPnY6FrKp
	cK6a74+0GzxRiciQU00doGzIf6fcILxD7jG25cC8ZHPV308KROsCKkbzbeOx9AI0TLWQiGPOThDY1
	8qfEjWUw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0iQv-0000000Fpp5-0myO;
	Fri, 04 Apr 2025 14:54:13 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id ADFA830049D; Fri,  4 Apr 2025 16:54:12 +0200 (CEST)
Date: Fri, 4 Apr 2025 16:54:12 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>, Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] objtool: Fix SYSCALL instruction handling and
 INSN_CONTEXT_SWITCH
Message-ID: <20250404145412.GP25239@noisy.programming.kicks-ass.net>
References: <41761c1db9acfc34d4f71d44284aa23b3f020f74.1743706046.git.jpoimboe@kernel.org>
 <20250404104938.GO25239@noisy.programming.kicks-ass.net>
 <iqalk74mk6onmntltkpodnbtp7zxxgx3u3ycuipmkizcmz7uvm@b7j7kubwzpl6>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <iqalk74mk6onmntltkpodnbtp7zxxgx3u3ycuipmkizcmz7uvm@b7j7kubwzpl6>

On Fri, Apr 04, 2025 at 07:46:52AM -0700, Josh Poimboeuf wrote:
> On Fri, Apr 04, 2025 at 12:49:38PM +0200, Peter Zijlstra wrote:
> > On Thu, Apr 03, 2025 at 11:48:13AM -0700, Josh Poimboeuf wrote:
> > 
> > > The real problem here is that INSN_CONTEXT_SWITCH is ambiguous.  It can
> > > represent both call semantics (SYSCALL, SYSENTER) and return semantics
> > > (SYSRET, IRET, RETS, RETU).  Those differ significantly: calls preserve
> > > control flow whereas returns terminate it.
> > 
> > Does that not rather suggest we should perhaps have INSN_SYSCALL /
> > INSN_SYSRET to replace the single ambiguous thing?
> 
> Is there any reason to have INSN_SYSCALL in the first place?

This xen hyperclal thing?
