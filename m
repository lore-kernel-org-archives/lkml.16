Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF808230264
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 18:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748542452; cv=none; b=EyKHHtEWfiC8SetBn4WQ5Xgrh14aUb/PFZONRqxbS8lUjcgg1n4XllF7nQeXbJs1ZnZnqgz8Asvc/TeRVQnHo+VjzfA6EZXKYcqpaw5CSNEf5Fi4B9gIlkLZ+kedSe31h/r9uc02WVKyosA0GQlEBYznVirXBX4d3rHrNN+TZO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748542452; c=relaxed/simple;
	bh=NemdL54bnOcp0tP6a+ElySUO8zbK/K1HzrBb2hqa4yE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ReTra0AJfZVoB4GY6ZXiW04OFVzBseaIiIFeS0NKHXEG9ygp5Byib4BETrWYOowNdMgeqM9jZd2uf0nX70l/1w0Cqz1Vppvari6yaNA7tYFtRnkyyPFXFYWif5A0cCecMKzajUvNQd5jW3M+qJHvrL9+ab6TYeFtaYaWx8DnTLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sbjEQdxp; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sbjEQdxp"
Date: Thu, 29 May 2025 11:13:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748542437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AX+Z+FU7v3e67d6zdoj3TbbyWOI/VVebECq9cL7CD2s=;
	b=sbjEQdxp2oh7NLmxDQfyE3K6ahSO5JIX4xvan1uNCVM+YUU6vqzQBNHtoX7/RYvpJhldEQ
	hAWVaJuERmfTZkudZNofLJj7eCfCiUbSszeKfrJ5g7KXWSaEjZySh8oaJUBGOW8FRrUFSX
	7Cdcyqh2TpNbGRcihf/J11DMxdCV+sw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, 
	vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Hongyu Ning <hongyu.ning@linux.intel.com>, stable@vger.kernel.org, Christoph Hellwig <hch@lst.de>, 
	Hannes Reinecke <hare@suse.de>, Johannes Thumshirn <johannes.thumshirn@wdc.com>, 
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] mm: Fix vmstat after removing NR_BOUNCE
Message-ID: <fhpxqctusqtn5cpyihf6z2esmujofi2ra7gknelms2ta4p2riv@3s7bxucy6quf>
References: <20250529103832.2937460-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529103832.2937460-1-kirill.shutemov@linux.intel.com>
X-Migadu-Flow: FLOW_OUT

On Thu, May 29, 2025 at 01:38:32PM +0300, Kirill A. Shutemov wrote:
> Hongyu noticed that the nr_unaccepted counter kept growing even in the
> absence of unaccepted memory on the machine.
> 
> This happens due to a commit that removed NR_BOUNCE: it removed the
> counter from the enum zone_stat_item, but left it in the vmstat_text
> array.
> 
> As a result, all counters below nr_bounce in /proc/vmstat are
> shifted by one line, causing the numa_hit counter to be labeled as
> nr_unaccepted.
> 
> To fix this issue, remove nr_bounce from the vmstat_text array.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Reported-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> Fixes: 194df9f66db8 ("mm: remove NR_BOUNCE zone stat")
> Cc: stable@vger.kernel.org
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Hannes Reinecke <hare@suse.de>
> Cc: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> Cc: Jens Axboe <axboe@kernel.dk>

Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>

Can we put BUILD_BUG_ON() to avoid this situation in the future?

