Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9929B15C0
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 00:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747182527; cv=none; b=n13Jp8Y6qyUAQ8W37qjRVWiHocdSt/dbRAG/6+BtSKkTjX+1SCICPNxgTwVuNw3Y7bhw+PYVRDz3T3DzJ3b6+cLUHFX5Fpl/yFbpE9dNMQ1BZde4pTNvOvzBHUUz48logylSUk9nvuK3HtnAK5KnYyUks0xEMYuBDY/uf2ZlAQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747182527; c=relaxed/simple;
	bh=RJdTXy3O6fVGghc66PHeMpt+sTguOoLMO0trGavJx00=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=n+YCjQheO/UmdWXj45ZQgV78akKVpQeSk3K8JtMWLGHnMP36WhCKqntab1rZzcKgq3jQjq04U5ZrUKsJY4VVlNdL3myaY8rqdG/8ARmuHlq//CeSHRc7ojkQ4dw8HRrWxouGXCoNBE9bUoHhK8ZnF0ZYEX9E2Xk4ErVydeNk6RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=slEYT9T6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="slEYT9T6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4731C4CEE4;
	Wed, 14 May 2025 00:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1747182526;
	bh=RJdTXy3O6fVGghc66PHeMpt+sTguOoLMO0trGavJx00=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=slEYT9T6viA7pHeeXFxxYNy2KlvNOtxKraIFWbhM/v8JSx93mKp5yf5XuAtLO1/tJ
	 cX7rMJPMQrwD0MwN2a1GRXs4EkZC3cbMIWHC5DqvbgWIq+q40Y2vuPQnFVJVcKH8CG
	 BiKylFeFwuKfuusrAbAuK7hXShYtbjd4Csq9kNX8=
Date: Tue, 13 May 2025 17:28:45 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Nitesh Shetty <nj.shetty@samsung.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>,
 Christian Brauner <brauner@kernel.org>, Keith Busch <kbusch@kernel.org>,
 gost.dev@samsung.com, nitheshshetty@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] iov_iter: Use iov_offset for length calculation in
 iov_iter_aligned_bvec
Message-Id: <20250513172845.48d1bf39307a543d4a36a1ed@linux-foundation.org>
In-Reply-To: <20250428095849.11709-1-nj.shetty@samsung.com>
References: <CGME20250428100738epcas5p3eb82b4ea94b229634f9319d23d7d7e14@epcas5p3.samsung.com>
	<20250428095849.11709-1-nj.shetty@samsung.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 28 Apr 2025 15:28:48 +0530 Nitesh Shetty <nj.shetty@samsung.com> wrote:

> If iov_offset is non-zero, then we need to consider iov_offset in length
> calculation, otherwise we might pass smaller IOs such as 512 bytes, in
> below scenario[1].
> This issue is reproducible using lib-uring test/fixed-seg.c application
> with fixed buffer on a 512 LBA formatted device.
> 
> [1]
> At present we pass the alignment check,
> for 512 LBA formatted devices, len_mask = 511
> when IO is smaller, i->count = 512
> has an offset, i->io_offset = 3584
> with bvec values, bvec->bv_offset = 256, bvec->bv_len = 3840.
> In short, the first 256 bytes are in the current page,
> next 256 bytes are in the another page.
> Ideally we expect to fail the IO.

Thanks.  Can you please send us a description of the userspace-visible
effects of this issue?  That will help others to determine whether a
-stable backport is desirable and it will be helpful to people who are
wondering whether this patch will fix an issue they are experiencing.


