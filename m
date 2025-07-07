Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3AE293C5F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 10:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751883475; cv=none; b=UY6GIc71NKiKIftqhojXHxEIldTb6MfKEHztYoZnQhW82M1HDHLbcn8zAMVmKfIb6yp+MyxivNIFfw4lPnEyVgvQ6ndll+d/FC+SZZHQRhk9GBj+fhJUrr5uKIBUX0nif/5HPQx2GPmckw2z5ctHW8u468JChZHb0Ix47F+RvPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751883475; c=relaxed/simple;
	bh=qextegIrdMsAbMykbMsppoJIVL2Ma6RZE/Siw6pqjWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BHUl4+YbAjlnuNBcEgO8WcspDj0v6Qa0gSXEdTAQFacSQCa86bKzwkqxsR81xW2AVdAl/ME/Eg3SqEozF72Ypm2ZhAiJ9sEWx9JEZYxlkOOnjgmNpp9mVtAmVLH4VzlILGtYWiwGBWna19PuUDFUq8znI1+pDBLUKaaUu1XRSHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=CTonjlLW; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="CTonjlLW"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751883470; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Bji7LAvBySu+UkXIYAKQCCtk6TOYzFoTM8HXHtwzswk=;
	b=CTonjlLWFfFHDeluf+E0Jsan40CZIEtk6o9jcckI3khP90FVcxYWj0pXBFJ9jv59AMUUe2BDHf6SChQsmY1nhdWf9+XgpUCmluGhNoh3nXgyPFDzQIhCJXDlhFYbgizVEUYV9PxznuWfXUyaCm8nIzvSm6S7f3+KUjXRl26z//s=
Received: from 30.170.233.0(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0Wi5uWjj_1751883468 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 07 Jul 2025 18:17:49 +0800
Message-ID: <c911e159-d216-4b0f-865b-f4524e6f8f0f@linux.alibaba.com>
Date: Mon, 7 Jul 2025 18:17:48 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] erofs: fix to add missing tracepoint in erofs_readahead()
To: Chao Yu <chao@kernel.org>, xiang@kernel.org
Cc: linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 Sandeep Dhavale <dhavale@google.com>, Hongbo Li <lihongbo22@huawei.com>
References: <20250707084832.2725677-1-chao@kernel.org>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250707084832.2725677-1-chao@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/7/7 16:48, Chao Yu wrote:
> Commit 771c994ea51f ("erofs: convert all uncompressed cases to iomap")
> converts to use iomap interface, it removed trace_erofs_readahead()
> tracepoint in the meantime, let's add it back.
> 
> Fixes: 771c994ea51f ("erofs: convert all uncompressed cases to iomap")

Thanks Chao, btw, should we add tracepoint to erofs_read_folio() too?

Thanks,
Gao Xiang

> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>   fs/erofs/data.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/fs/erofs/data.c b/fs/erofs/data.c
> index 6a329c329f43..534ac359976e 100644
> --- a/fs/erofs/data.c
> +++ b/fs/erofs/data.c
> @@ -356,6 +356,9 @@ static int erofs_read_folio(struct file *file, struct folio *folio)
>   
>   static void erofs_readahead(struct readahead_control *rac)
>   {
> +	trace_erofs_readahead(rac->mapping->host, readahead_index(rac),
> +					readahead_count(rac), true);
> +
>   	return iomap_readahead(rac, &erofs_iomap_ops);
>   }
>   

