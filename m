Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A4DC2EF
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 06:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749449329; cv=none; b=QX7DcpufYi0ywhWKFIt5E+V9lvNfuQIp+PGvSGjPPFav9cFhvn9FnU6XbTyZXnIW+4+TQvf+VROtTdEskRXvUDAUeaRhehWu/fOgn27G0S0YPU00CkGsLanjaAx6taDrVvrKM98JEmh+Hkxhle8pTmWgzh5ntR9nEod6ulXC6BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749449329; c=relaxed/simple;
	bh=py+Z21F18hw5F/xaLQNSwpDjs2abEEU+GCqNo0gghg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Znseud0cCWU5y77TtGM5Rjjp62gpweh7Bf0iCS89TMlwMDDAT2JZh6t7WN8aQMt0R7KZlz0HCrcA4NNpRBBxOWWOQ9kH4Yu9SnnphIBy72MhZiTO74upQs741mamKiyf70XzuIKLuIUoY0ZZVzHcqcOh9q5awMymDp27oftblE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tFt3+5Au; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tFt3+5Au"
Message-ID: <177e1f6b-50f0-4c0a-bb0b-514283e009a2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749449324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vfAvyAuRWliibUaARgdBDzm75P3vNxLwJns/0rYb7pE=;
	b=tFt3+5Au/OlayXrj2ggXiz1eoKI28pkLjPGGTh+ROelRyDBxTX9zJF5KHMTZOMaMUmPwIG
	BrlpkjC551DEgMIsRG3TdKy0sPwIN+43YNGKXlT8CZL5mWOfjkFA4vYfh1qLcQMe9nABrj
	Y7gIYExQKOMak6diMZom51l9cp4llvY=
Date: Mon, 9 Jun 2025 14:08:03 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] mm/alloc_tag: add the ARCH_NEEDS_WEAK_PER_CPU macro when
 statically defining the percpu variable alloc_tag_counters.
To: Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Kent Overstreet <kent.overstreet@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Hao Ge <gehao@kylinos.cn>
References: <20250529073537.563107-1-hao.ge@linux.dev>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <20250529073537.563107-1-hao.ge@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 2025/5/29 15:35, Hao Ge wrote:
> From: Hao Ge <gehao@kylinos.cn>
>
> Recently discovered this entry while checking kallsyms on ARM64:
> ffff800083e509c0 D _shared_alloc_tag
>
> If ARCH_NEEDS_WEAK_PER_CPU is not defined,there's no need to statically
> define the percpu variable alloc_tag_counters.
>
> Therefore,add therelevant macro guards at the appropriate location.
>
> Fixes: 22d407b164ff ("lib: add allocation tagging support for memory allocation profiling")
> Signed-off-by: Hao Ge <gehao@kylinos.cn>
> ---
>   lib/alloc_tag.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> index c7f602fa7b23..d1dab80b70ad 100644
> --- a/lib/alloc_tag.c
> +++ b/lib/alloc_tag.c
> @@ -24,8 +24,10 @@ static bool mem_profiling_support;
>   
>   static struct codetag_type *alloc_tag_cttype;
>   
> +#ifdef ARCH_NEEDS_WEAK_PER_CPU
>   DEFINE_PER_CPU(struct alloc_tag_counters, _shared_alloc_tag);
>   EXPORT_SYMBOL(_shared_alloc_tag);
> +#endif /* ARCH_NEEDS_WEAK_PER_CPU */
>   
>   DEFINE_STATIC_KEY_MAYBE(CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT,
>   			mem_alloc_profiling_key);

Hi Suren


I'm sorry to bother you. As mentioned in my commit message,

in fact, on the ARM64 architecture, the _shared_alloc_tag percpu 
variable is not needed.

In my understanding, it will create a copy for each CPU.

  The alloc_tag_counters variable will occupy 16 bytes,

and as the number of CPUs increases, more and more memory will be wasted 
in this segment.

I realized that this modification was a mistake. It resulted in a build 
error, and the link is as follows:

https://lore.kernel.org/all/202506080448.KWN8arrX-lkp@intel.com/

After I studied the comments of DECLARE_PER_CPU_SECTION, I roughly 
understood why this is the case.

But so far, I haven't come up with a good way to solve this problem. Do 
you have any suggestions?


Thanks

Best Regards

Hao




