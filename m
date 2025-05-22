Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C0B2629D
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747902874; cv=none; b=a39yakrIvajETWd8Sq8GKkTHf4XyZ6t+8upr5xuEXdXTPLBznVnCTGwqeI3UHJ/Aru5/CTvl1do4dt3ASiigVSaidXjj9eMNd7ugwRdE3Ens99Iagp2zARZVh8CERacnCeXxn5KaPdXInbakW7paCLCEISTFBcyUzKU5T9T3Ei0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747902874; c=relaxed/simple;
	bh=t0LpYOCzYmf2oMtJg8jcs4N4G7oDD+1BVUGaHnEbwQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L9Q65KhcwePWQkRoHswpImKZT2po/1LpVI6nXVbp+ttrxbT09qtdNXzeEYbH3dsNGOH6flhMOKMB0jttHNS7sC4WnFcj7pyYSRrIre5xAHEc4xiJCt13sgYYAQ9OJcvYQ3Evi/Up6uUOOK8nMb/fc4LMAQO1veBQK0KBqIzshsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=seXao2HL; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="seXao2HL"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747902868; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=KUGgemjCNoc+n3/4dsLp3BrhWvshg2iuaiRUeDCi01w=;
	b=seXao2HLJobazGzs0uDRJu1wNj8bDKF98p7y1EKlEu6C/5le96zjq3zi5rS8GtHd1IrLY9U5gMErSyhg//dnuSk0/1JHHTDJa1M5oO9bIqrcDw7fUBIAsGw/A8EI/gRlay+fnYNWMipVW7divYNNWkUft3N8FzhgUgGHdO1+BK0=
Received: from 30.170.233.0(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WbV5-qC_1747902867 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 22 May 2025 16:34:28 +0800
Message-ID: <c4829613-1fea-488d-9d58-373e0d3b6bc1@linux.alibaba.com>
Date: Thu, 22 May 2025 16:34:27 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] erofs: support deflate decompress by using Intel QAT
To: Bo Liu <liubo03@inspur.com>, xiang@kernel.org, chao@kernel.org
Cc: linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250522081433.16812-1-liubo03@inspur.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250522081433.16812-1-liubo03@inspur.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/5/22 16:14, Bo Liu wrote:

...

> +
> +static int __z_erofs_crypto_decompress(struct z_erofs_decompress_req *rq,
> +				struct crypto_acomp *tfm)
> +{
> +	struct sg_table st_src, st_dst;
> +	struct acomp_req *req;
> +	struct crypto_wait wait;
> +	u8 *headpage;
> +	int ret;
> +
> +	headpage = kmap_local_page(*rq->in);
> +	ret = z_erofs_fixup_insize(rq, headpage + rq->pageofs_in,
> +				min_t(unsigned int, rq->inputsize,
> +							rq->sb->s_blocksize - rq->pageofs_in));

Please fix the alignment of this line.

Thanks,
Gao Xiang
