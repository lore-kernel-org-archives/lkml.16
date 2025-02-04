Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8E913635E
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 00:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738630029; cv=none; b=oxj7qFNLByy0NsS95ghx+7C7SLbgk1kMF6NjNjXMRcP9WEZUWGuxy4xRh11ifypQtqXHVm5aoPpWwKAyWQq2npVHyP7u6lJBMnd+oZDhJZsRqgEJYCyht958Bwq2JI55Yubi2d2HGarG7MuxY+dkG+RbbDBoNrN0CrRgDeSCdRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738630029; c=relaxed/simple;
	bh=YnWbh7h5l4+9/p4QGCOmAkkiwzNcXmS3BINFyzpB5ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fzsEf74iA2HFqXSSuKO+Owq357fhtmkQxO796n3Cfbtb4kcs8XiAR/bj28/v73mAjUowV1rC27FFysUnil/f4+lIeuDCilNA5C9bbJ78TFXOnSO/MdtwDP6WzUcEwSKOEEH6I6jz7LBMt8HlUak+xrXUwluk0zcRPUo7ERnpfh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HfbB7FW6; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HfbB7FW6"
Date: Mon, 3 Feb 2025 16:46:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738630020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8DsDNf12aNGhGMAP9HmQLoKNK17L8iA6wkGRGPP11ic=;
	b=HfbB7FW6N3oL+2xH0NdMVOVOm8cUGA4nyyOJn0f/3HU6nnid9Nmpl2OV/xc5Rq6A7ysCQo
	ElnDCsBg4rxDdSFWwZaRP/emC9vPcAcP8ElAMaK2Qmn79X15egvu7M2kFxyhaEk9QGi5/d
	PE7y/XHbScxWB5vInR7fnCWPpGI++iY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, vbabka@suse.cz, 
	rostedt@goodmis.org, peterz@infradead.org, yuzhao@google.com, minchan@google.com, 
	souravpanda@google.com, pasha.tatashin@soleen.com, 00107082@163.com, 
	quic_zhenhuah@quicinc.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] alloc_tag: uninline code gated by
 mem_alloc_profiling_key in page allocator
Message-ID: <uz6j7wba2gk2wfn6foxs7v3wqdi5kwqnbolcdp3g7kzkw53a56@t7cyo3nyp2oa>
References: <20250201231803.2661189-1-surenb@google.com>
 <20250201231803.2661189-3-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250201231803.2661189-3-surenb@google.com>
X-Migadu-Flow: FLOW_OUT

On Sat, Feb 01, 2025 at 03:18:02PM -0800, Suren Baghdasaryan wrote:
> When a sizable code section is protected by a disabled static key, that
> code gets into the instruction cache even though it's not executed and
> consumes the cache, increasing cache misses. This can be remedied by
> moving such code into a separate uninlined function.
> On a Pixel6 phone, page allocation profiling overhead measured with
> CONFIG_MEM_ALLOC_PROFILING=y and profiling disabled is:
> 
>              baseline             modified
> Big core     4.93%                1.53%
> Medium core  4.39%                1.41%
> Little core  1.02%                0.36%
> 
> This improvement comes at the expense of the configuration when profiling
> gets enabled, since there is now an additional function call. The overhead
> from this additional call on Pixel6 is:
> 
> Big core     0.24%
> Middle core  0.63%
> Little core  1.1%
> 
> However this is negligible when compared with the overall overhead of the
> memory allocation profiling when it is enabled.
> On x86 this patch does not make noticeable difference because the overhead
> with mem_alloc_profiling_key disabled is much lower (under 1%) to start
> with, so any improvement is less visible and hard to distinguish from the
> noise. The overhead from additional call when profiling is enabled is also
> within noise levels.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>

One question: Is there any plan to enable MEM_ALLOC_PROFILING by default
in future?

