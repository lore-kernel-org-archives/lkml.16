Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FD8EC0
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 03:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738899957; cv=none; b=bu1eomZc3k+TOW+Ft2oRUU0iONBK7oGCUHZS+2RVENN+5GvRjKzVdfW3/6vkFksR8ZOLOMB67fU4N78mbwSBvlIr/U83QfXT/qr2y2DfOZtjmIGk5HW3bpfox3W860ybVnK7ZXWnN6okKA3htIfPitclDgVqBK0Blbbv+UMDvtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738899957; c=relaxed/simple;
	bh=pGMm7HMsMTzSjVZ5wGKb0zb5lRaiuLWmkKvPUytnMW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LbTBox/tC3blR/qCKf3ZRX6LeSYqwpTO/omSpaeFz4YBWQU2D9ivl1XfxdV8o4BIfgVhIj8qPKTe/lLj6TBKI3ScT2sNC0ea8fPjm7/FEgViJR/ccFpWyTsjc+Yo4oZlBUm62vLBG/Y0a0TPl6GWNm6t+ufgdPwzBohIJpuL3Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id AD03768C4E; Fri,  7 Feb 2025 04:45:50 +0100 (CET)
Date: Fri, 7 Feb 2025 04:45:50 +0100
From: Christoph Hellwig <hch@lst.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Bart Van Assche <bvanassche@acm.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>,
	Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org,
	Frank Crawford <frank@crawford.emu.id.au>
Subject: Re: [PATCH RFC 29/33] hwmon: (it87) Check the it87_lock() return
 value
Message-ID: <20250207034550.GC4596@lst.de>
References: <20250206175114.1974171-1-bvanassche@acm.org> <20250206175114.1974171-30-bvanassche@acm.org> <9f0cdbde-957c-44a6-a7ce-d3d412ecfbb4@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f0cdbde-957c-44a6-a7ce-d3d412ecfbb4@roeck-us.net>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Feb 06, 2025 at 02:51:59PM -0800, Guenter Roeck wrote:
>>   -	it87_lock(data);
>> +	int err = it87_lock(data);
>
> I am not going to accept patches with inline variable declarations
> if the patch is fixing an earlier problem, sorry. This only results
> in unnecessary backport failures.

In fact the inline variable declarations should never be used in
"normal" code by Linux coding standards.  The only reason the
warning is disabled is for some of the magic scoping macros.
