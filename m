Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F464228C8D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744847714; cv=none; b=MI/B5hFjAcXdWJb3UppLcrQuXlrbTdBy49d1Uy60QS95zHoie9o+6Rks5zWuncFGBaJ7ZM4hC0vooKAO/GFWyAYSqudv0UIzkb3phd+dTCPq0Ucmp0O/aaSOpDxNFFdKXFCc1hduPNWkLzBrXdA2iF09wmE2RN5iDQhRWgWkxEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744847714; c=relaxed/simple;
	bh=LtchOzCNZtFBnrrpmh5rMiOzCn3LmqC4RxP480yBbIA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=bwjsMl83wRuhbP5v+eSmDJaE1Gv9kWCs5VjvftewjbWgAV53IsydZ0UI9xUSvTGSbHeI/8rljIoRw+zJC4WSpiPRc00gBzVVvzcIiMEZfkIS2HGVXjfMRoGR/41d2pOuzJqaiizExBbz52FvCiOXWS4OyUggXN3fSPlzHK8/Z80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QGNovY6E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QGNovY6E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4584EC4CEE2;
	Wed, 16 Apr 2025 23:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744847713;
	bh=LtchOzCNZtFBnrrpmh5rMiOzCn3LmqC4RxP480yBbIA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QGNovY6Er4oWM8SXuaT5aHzRX7C19JuSa64LZYKnCVcZnd7O0VOsSzTHNu80rmHAw
	 Dt7NVQcElbM7wyrcNZKqtQb3Jcmngry7/MmiDKKpDUvm61PqebdGjS5N3O0atgbNo1
	 RYEFdNsNspuJkwUZoqATsOG6z13EBSb6Sl+F01Nw=
Date: Wed, 16 Apr 2025 16:55:12 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Nitesh Shetty <nj.shetty@samsung.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, axboe@kernel.dk,
 gost.dev@samsung.com, nitheshshetty@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iov_iter: Use iov_offset for length calculation in
 iov_iter_aligned_bvec
Message-Id: <20250416165512.990257538f61be5857e513ab@linux-foundation.org>
In-Reply-To: <20250415181419.16305-1-nj.shetty@samsung.com>
References: <CGME20250415182307epcas5p4853044d013dbc943a8e54dca0f2a39c2@epcas5p4.samsung.com>
	<20250415181419.16305-1-nj.shetty@samsung.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Apr 2025 23:44:19 +0530 Nitesh Shetty <nj.shetty@samsung.com> wrote:

> If iov_offset is non-zero, then we need to consider iov_offset in length
> calculation, otherwise we might pass smaller IOs such as 512 bytes
> with 256 bytes offset.
> 

Please describe the userspace-visible effects of this flaw, if any?

> --- a/lib/iov_iter.c
> +++ b/lib/iov_iter.c
> @@ -820,7 +820,7 @@ static bool iov_iter_aligned_bvec(const struct iov_iter *i, unsigned addr_mask,
>  	size_t size = i->count;
>  
>  	do {
> -		size_t len = bvec->bv_len;
> +		size_t len = bvec->bv_len - skip;
>  
>  		if (len > size)
>  			len = size;
> 

