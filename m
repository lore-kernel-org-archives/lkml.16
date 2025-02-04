Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDB44D8A3
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 00:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738629166; cv=none; b=SmFTkGCDg0kPDRyj6j2/epP6K/eMkCrnD8H+iZSmxMRk1d3TogQZC3G2U6eaGbO/SaRNN3hMFsAkLo0FnSH9EFvuxjsRXuiwDhucXzgXrffalHBO1kcsTqZP+7RqpbYF3ov4NH6MP9H4uBLqxQTeWTNj5n7pUA9NcpZmdd28iDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738629166; c=relaxed/simple;
	bh=Yb9jiw1bvUhOEt0Mr97ixhAwHuX7pofVqjCEijgRr4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gw6Bw1vA5vC1SsIogyF3F35p5aFah5gURTtG8RkefjA/1Ja18JmZYfoYPU+3FEfJUrZA48TCZXJl/MiBwPB+7v4TQ4RoCjOuVqwCQvuq/iMiOGOeZhzRQGtqUxgKmHeTY2ZoV3TMi7j94TeOjc8oJ7UTuD9jFJbfGbIEB93XWhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rKKCGm4P; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rKKCGm4P"
Date: Mon, 3 Feb 2025 16:32:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738629161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xAZHlvn5+j4HmWUtVIumIb370QKvKcdO26YMFxguj4Q=;
	b=rKKCGm4Pc1brPRvQaQlpqY/yLSej/YMS49pezQnfR348MhvvwzPveBhGJs2d9WzjfhS8b+
	w/r1iJxr8OO61l/IJTJbuSXFisSPUlz3gsHt1lwKCf1213IDXptLn3zsiD1VGe0fQkyRCj
	tV7HZaP/glGCTtp2C+AAU74XNFTvStw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, vbabka@suse.cz, 
	rostedt@goodmis.org, peterz@infradead.org, yuzhao@google.com, minchan@google.com, 
	souravpanda@google.com, pasha.tatashin@soleen.com, 00107082@163.com, 
	quic_zhenhuah@quicinc.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] alloc_tag: uninline code gated by
 mem_alloc_profiling_key in slab allocator
Message-ID: <wgiuavdyth5w2adxrmnmghnmig5nvbnx2rlfeppooicr34iadm@3oti3yapgetz>
References: <20250201231803.2661189-1-surenb@google.com>
 <20250201231803.2661189-2-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250201231803.2661189-2-surenb@google.com>
X-Migadu-Flow: FLOW_OUT

On Sat, Feb 01, 2025 at 03:18:01PM -0800, Suren Baghdasaryan wrote:
> When a sizable code section is protected by a disabled static key, that
> code gets into the instruction cache even though it's not executed and
> consumes the cache, increasing cache misses. This can be remedied by
> moving such code into a separate uninlined function.
> On a Pixel6 phone, slab allocation profiling overhead measured with
> CONFIG_MEM_ALLOC_PROFILING=y and profiling disabled is:
> 
>              baseline             modified
> Big core     3.31%                0.17%
> Medium core  3.79%                0.57%
> Little core  6.68%                1.28%
> 
> This improvement comes at the expense of the configuration when profiling
> gets enabled, since there is now an additional function call. The overhead
> from this additional call on Pixel6 is:
> 
> Big core     0.66%
> Middle core  1.23%
> Little core  2.42%
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
