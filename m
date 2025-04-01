Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC6A1F09B1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743517912; cv=none; b=eEIxGetsJ/noEUWa9HEjw/BqHhjBHg7BLTWhjuOw9uG3HzrLSlCSeqHdab2MlqTRpkObQrhCEjTp8kldgupWBsYK4MzVm24kSjA54qqtVUsG42Mekbzs2I0EF8eIiiRe9fvBk3ANfSZmSgaYzun3Whsn0HzFWdbvImdaZoa4Wmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743517912; c=relaxed/simple;
	bh=WUPWe4RqDcz5MxZ35VTnTUaOsTvjJ/p1Nw9d3nqUnVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CRQEmllqvwlbNBJXuVLgqYm3A5bu95IAmreLS8900YuS9/QZ8eGZQNykXOcRK4bDCfy7w0ZuvxjDkwlYT/fv0PrtQPGeRZaNvW3FvpnUfyNBmjCXUu39SnEXw1EcnxDZarsUof42FYyfKsECm1Q+56sqgBpwsU98srfXiBVptlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=LAJnR2cB; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LAJnR2cB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=otGvAB3ybIvfsmP1ruv4Pq/7f1v3M6qFu0TvU66v7pc=; b=LAJnR2cBfSv7iRhl6cp/Ppej6N
	uRbcjKtFT6KG4+3DvnrZ1r099JRtQ7a2/4Y8nzVYInbIcSq+mAFdNoKI0mrUd4/93zkFSmk+mjBor
	QMHlzk/4/i9s0lmteH/Ys6KXPayTRTsceh3rZZ8u+QFX5q2ygTGT1EwOa6TVwWaTk0wIGkQ9OkDqI
	b+peqSzBl+IM56EOQsPHnOU4ceJKzgiRhpnVYmEVuIuSPxxEyEeGOIzBoqOW4bE+8SlAmgC6UCTvg
	RI6d04xG0+a473k6FujSpMFqYYoUeYo3VgZ3Nkyf/fIxQWtcWxZMk5lcRa5gQTWFsKRcj+bHVLaTR
	SsyIY7bA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzcea-00000006pb2-3ghu;
	Tue, 01 Apr 2025 14:31:49 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7FD5D3003FA; Tue,  1 Apr 2025 16:31:48 +0200 (CEST)
Date: Tue, 1 Apr 2025 16:31:48 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH -v2 00/49] Simplify, reorganize and clean up the x86
 text-patching code (alternative.c)
Message-ID: <20250401143148.GH5880@noisy.programming.kicks-ass.net>
References: <20250328132704.1901674-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328132704.1901674-1-mingo@kernel.org>

On Fri, Mar 28, 2025 at 02:26:15PM +0100, Ingo Molnar wrote:
> This tree can also be found at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip WIP.x86/alternatives

Can you please use your own tree for WIP stuff?
