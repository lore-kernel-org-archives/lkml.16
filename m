Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D6A278E5D
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 14:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746541456; cv=none; b=Dwmb+c9zXdjU6TUwsso134YkdicuEWL8obvHyqs4WzCwgAHLxnD6B9wFdwf24LywIw2/uXqXJlGr1c1oMOPJvfaldGa9LFCybd8s3ybPL9UFyY4mlCi7cFR6Fz3sN8EwjxtT2+eFuDlCRoYojZtu0TZz9dz1fFMQ58cRrerip4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746541456; c=relaxed/simple;
	bh=SIDu9KjZl+RAlSKNfkPNDbvT/d8AwagvxUw9hu2coNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uvfpgm/hXHs02aqd0Q2S1eNOtQtunJgGVp+X5N4FkuA7Qf0J49lh1b/XrBaHY2yPUtYd2Wqz75K3I++YQL1b0aVXpOhuqCp8f7EF+TLRYz3gC3rYoiSKU3xHdeZrtaI+iV9u4s9M/wXfVpkm7lwQAuFsflYbcNMf71rIBmvUJTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pjVC536y; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pjVC536y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rlxk6vargPW74gj3cnwo4pVYgiEKEKPtQf0RtmjfsfQ=; b=pjVC536yUS3btrmOG/7L6Qs3YP
	jfQ0pIfs7JOLyh9Tcd4jRbZt+akdWNvPjb4jgQ8+H978plm1uRHiE7suZUc6Zz4iN0OA+ig2wQEEo
	UU1xXEknnTEaABCdzztP6LucCVs7g/FerGyW5833VYDpGYq0cA4jCF4MmDyu1ErkS9JD4l1ROrDXx
	0lNmehqfloNhl1gUD33DoGhXeZC5dvzwCDH3nAl3GfJ09kCBXw5dK3djDZT/cU4LRDQ/angebijTn
	W0iCOqJ7wWAOWJ/mB+nHi3H2T4YC8rYQJGoxLG+4Y6j6J3VGv72EZvlY4mpe23JnnghVpPTP4kMRB
	8EbuTqzQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uCJDQ-0000000Feff-2zc7;
	Tue, 06 May 2025 14:24:12 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4508C300348; Tue,  6 May 2025 16:24:12 +0200 (CEST)
Date: Tue, 6 May 2025 16:24:12 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [patch V2 00/45] genirq: Cleanups and conversion to lock guards
Message-ID: <20250506142412.GZ4439@noisy.programming.kicks-ass.net>
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429065337.117370076@linutronix.de>

On Tue, Apr 29, 2025 at 08:54:47AM +0200, Thomas Gleixner wrote:
> This is V2 of the generic interrupt locking overhaul. V1 can be found here:
> 
>    https://lore.kernel.org/all/20250313154615.860723120@linutronix.de
> 
> The generic interrupt core code has accumulated quite some inconsistencies
> over time and a common pattern in various API functions is:
> 
>     unsigned long flags;
>     struct irq_desc *desc = irq_get_desc_[bus]lock(irq, &flags, mode);
> 
>     if (!desc)
>        return -EINVAL;
>     ....
>     irq_put_desc_[bus]unlock(desc, flags);
> 
> That's awkward and requires gotos in failure paths.
> 
> This series provides conditional lock guards and converts the core code
> over to use those guards. Along with that it converts the other open coded
> lock/unlock pairs and fixes up coding and kernel doc formatting.  The
> conversions were partially done with Coccinelle where possible.


So while my eyes glazed over near the end of the series, the general
shape of things looks right.

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Jiri found a few nice cases where mixing the conditional scoped guard
with return variables went side-ways. I did a quick scan to see if I
could find more of that same pattern, but I think that's all of them.

