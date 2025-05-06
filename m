Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6982283FFA
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 16:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746548620; cv=none; b=M5YXee3VEGsMJlWSOoCMX2XjfGiaoxTTeCsOgdcJDFHZXTqH2tdDen+ieeTUa8NJsxXia64yCntzPQefPKVzYmXYP6uHnx/Il6l5QuFJtgT2YgoranG3sjXjW2GFxJ68UtcKLRBRnaykH3SfO1xMzFnk7xoMJPGZKr5WgpRHggQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746548620; c=relaxed/simple;
	bh=701UnYDcVbEDGaRQY7wmhFr+nJp1bCiPUr2hODKeX98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QOjE1kfy9B12KJaDOo8mq+dfEMqQ2XVxuzKQivEZHHv2BBLqGaOFND1mHmCrfpPPCeuiZ4Ji30MpxoTEVTa1GfXQBrQmw/arnhtM6U6m6Uxa1vg0rJY0gkTxSSIf2Q4otVxjvBZvfR9a7oTK0iuACSY+IY7HF6G7SZzVOIJHs8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CGcmUjZz; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CGcmUjZz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=btB7v32iOtkPnjE82G1pR3gHE5orNYbXznqK0OzF1Tk=; b=CGcmUjZz4iKAFYVIoj/eD2mJpL
	vvNG+xtJ1NIHDZLBjQXkDzN2K21pIJ/EeB5lM/IYnUEu/5+T+vcDY4+XvJ1gLD/uOcxOnF4tBdZ7J
	MhhM90EQ9VL7Y+cspNK6tvPc5KkdSU4P2yC3gBq6bCqXC1/z0XtjKUNQFbtXnopq3Oa5QnZMD8UI7
	AlEMjBTVaHEJS4OQJuQv18tPsTMCtv4QKdz453+KSmAphCh647WUs8sRP3yeCDlniHGCOhBhH2/sr
	DnGc5vC89wAomqBPRFc7zuKPLpeN/zbRv6SW+cHZC31Sx1WD+b9uPGmujCrsZ1TLYif89mGqPw67C
	056b79tg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCL4F-00000006KQn-1RbP;
	Tue, 06 May 2025 16:22:51 +0000
Date: Tue, 6 May 2025 17:22:51 +0100
From: Matthew Wilcox <willy@infradead.org>
To: WangYuli <wangyuli@uniontech.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, yuzhao@google.com,
	stevensd@chromium.org, kaleshsingh@google.com,
	zhanjun@uniontech.com, niecheng1@uniontech.com,
	guanwentao@uniontech.com
Subject: Re: [PATCH] mm: vmscan: Avoid signedness error for GCC 5.4
Message-ID: <aBo3W5HNMxLdtV2p@casper.infradead.org>
References: <85050791B887DC13+20250506160238.799984-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85050791B887DC13+20250506160238.799984-1-wangyuli@uniontech.com>

On Wed, May 07, 2025 at 12:02:38AM +0800, WangYuli wrote:
> To the compiler, (MAX_NR_TIERS - 1) (i.e., (4U - 1)) is unsigned,
> whereas tier is a signed integer.
> 
> GCC 5.4 does not permit the minimum operation on such
> type-inconsistent operands.

1. This has nothing to do with the compiler version; the type-checking
is built into min().
2. We have min_t for a reason
3. Why is a signed min the right answer instead of an unsigned min?
