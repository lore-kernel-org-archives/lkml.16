Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E891EB18F
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 06:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747118068; cv=none; b=K3wecT/4/3IfZLMVCpwx1AraurBlpyKqotDb+FPDK/6jaX9llWDLyKKDpOHu/HNPXbhWTDfmRPRYKFkvYJY1l44MkyXNdPxT/FFhZfzqToXSW1Cds0JJuiyt5yoIDoC/y6jCbKhqClaK4BPg17kZ2tSYrfV3y+cXsNGypYzcj68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747118068; c=relaxed/simple;
	bh=ORgLMITxeIyffJ4kFtLu1h4Mh8Q9hlUWYLleES2f2lE=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mpDnK7PxTtfDvrfWhm5BzitXaXt+jqp/CBgdAY4CH8R/ouj9t0xhz4cg6Xo+GcUq/kc9NcgtwHLrAMRcnPDlh1/Dif1Qie1bSf3n2TbR88z435so6dB4vYtHu/GpvBCm+gc8Y5UMNFYfvkeZAukGoppJzMts1rBBWASxC7mRBuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UGocXwC0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UGocXwC0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4945BC4CEED;
	Tue, 13 May 2025 06:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747118068;
	bh=ORgLMITxeIyffJ4kFtLu1h4Mh8Q9hlUWYLleES2f2lE=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=UGocXwC0ochsFRNKa9jZYXMnu8vntCsPFMbXh6206Pj8y7En90phD0RdyN/LxzLCE
	 82J36pPxSCwjacFcvpBRrF8IDjQlEqacV6O1sKl0tlTAl6Y4h0qvL+PMd2QA1CLush
	 BS17XOqXNwKt88vXoWhWhNbEQ52P9B6lVkIlEY8+T3ibDhcFIAWAklZbLT4xLwdnbc
	 TdA//RZn9tf7Vp++nxjG306X7RWiTH447MBVIYyTyxkTfSmCyPWkH4MQs0m8hR0Eco
	 iGb2iSvmWXHbZiDxohPrDrVwgYoxzjS7vye79OWyCtCbxXXesvY/eW1cnjxPxmOZTT
	 4vDeMLVhzA0kw==
Message-ID: <ba2bc9bf-7cec-4871-b603-8130c84fc917@kernel.org>
Date: Tue, 13 May 2025 14:34:25 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH 1/2] f2fs: use vmalloc instead of kvmalloc in
 .init_{,de}compress_ctx
To: Christoph Hellwig <hch@infradead.org>
References: <20250513055721.2918793-1-chao@kernel.org>
 <aCLgPLUiFsiCzSBK@infradead.org>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <aCLgPLUiFsiCzSBK@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/13/25 14:01, Christoph Hellwig wrote:
> On Tue, May 13, 2025 at 01:57:20PM +0800, Chao Yu wrote:
>> .init_{,de}compress_ctx uses kvmalloc() to alloc memory, it will try
>> to allocate physically continuous page first, it may cause more memory
>> allocation pressure, let's use vmalloc instead to mitigate it.
> 
> Shouldn't this be handled in kvmalloc instead of working around it in
> callers?

kvmalloc() will allocate physically continuous page first, so it may race
w/ other physically continuous page allocator who uses kmalloc(), in
scenario of there are few physically continuous pages.

Thanks,

