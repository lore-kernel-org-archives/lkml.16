Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF361487F6
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744767288; cv=none; b=BffOdlDyIAQC9pB6K99pNOZJqYx4sWsWG76zXKCOHxM6FEEIu0uHt6S3oHGn/s2k9qB6VefTYOVOwqHnwOeO07TrsVmid+7Lsz8PH2I1cTlUtt91iiNzuTPmp6n0KToB+vf53+9kn5bQuHZE7IyaaxWZ2/DrCqw7XiBF6bWX660=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744767288; c=relaxed/simple;
	bh=G7qJ+O6AudU15nAQNGAyxHo/Rn7ubP77f07kony7XBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c6WIPkI8ODvvehgh76X30nrpUwVQRwTj9SnsuTEh8mvHo8PLkCgzo9v8YTqxlLOliCqImfc6Q8zjdsTNX0OG4CVuVibDzntAD7tV4jGdGKmZrtI3+5LHiW6bRf976J2wpVdW+7XgEaRzWniNpOmbXFbNkDyFGjoGIb57WWk89e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=q2Y4RuaI; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="q2Y4RuaI"
Message-ID: <0696eaac-943f-4116-b682-f9b15de6aeaf@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744767283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G7qJ+O6AudU15nAQNGAyxHo/Rn7ubP77f07kony7XBE=;
	b=q2Y4RuaI3nFA3ccoh2YiR/vE3O+lp7fMvmRU+IQuehiurj350KmQnc7L7x5TmIWyOiJwH6
	ia1SczifUTw+LEi2T8vdfPJSn72x+Dc80MWoTwzrgJo9I5LG491N6/mjbGyUl6wke32sYJ
	xmKCTr1lfqi0lp2cJhwYJsweIUqeQTE=
Date: Wed, 16 Apr 2025 09:34:30 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] mm/rmap: Move anon_vma initialization to anon_vma_ctor()
To: Harry Yoo <harry.yoo@oracle.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Ye Liu <liuye@kylinos.cn>
References: <20250415092548.271718-1-ye.liu@linux.dev>
 <Z_5C7YNDwZ4pdwQn@harry>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ye Liu <ye.liu@linux.dev>
In-Reply-To: <Z_5C7YNDwZ4pdwQn@harry>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2025/4/15 19:28, Harry Yoo 写道:
> On Tue, Apr 15, 2025 at 05:25:48PM +0800, Ye Liu wrote:
>> From: Ye Liu <liuye@kylinos.cn>
>>
>> Currently, some initialization of anon_vma is performed in
>> anon_vma_alloc(). Move the initialization to anon_vma_ctor()
>> so that all object setup is handled in one place.
>>
>> Signed-off-by: Ye Liu <liuye@kylinos.cn>
>> ---
> NACK unless the patch explains how the object's initial state
> ('constructed state') is preserved between uses.
>
> anon_vma_ctor() is a slab constructor. That means it is called only once
> when a slab (folio) is allocated, and not called again when an anon_vma
> is allocated from an existing slab (folio). In other words it is not called
> everytime an object allocated via kmem_cache_alloc() interface.
Thank you for the feedback. You're absolutely right — I misunderstood
how the slab constructor (ctor) works. I had assumed it would be called
every time an object is allocated via kmem_cache_alloc(), but I now
realize it is only called once when a new slab is initialized, not on
every object allocation.
> This patch looks very dangerous to me and makes me question whether you
> tested it before submission.
>
Appreciate you catching this — and yes, I'll test it more thoroughly
before submitting other patches.

Drop it.

Thanks,
Ye                                                                     

