Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D7B4409;
	Mon, 23 Jun 2025 20:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750711545; cv=none; b=PLdlnlerK+400vbIYMrWic2AJqpCmoom+gu27Ga4iozw+WHfTaHQeeStAbVjs8QjOQA21+xqQYD8IAQ5DI/v4YvLztk1gYdFkJSMVHgnV3rpcLdO9+wMogc0xM1Bpy1AzMtop5/7E+cMTea0YtfwPDf9GOCwDPlbB0JicGFtRXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750711545; c=relaxed/simple;
	bh=LXUcBbx555l5k/9ZvU/yQO1Jww+F76kR3LE+FHDDLfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tnvl77B8VhfZB9QORQe/jWozGtCoX/QKVTKpzUxYEDw7v0KMTzY4nWNfwYG2QNq65nBB2dbuWu922OicK5YFM7LTxek4M2UvrkYxncBtq9dspYD0gnsq704JUurXe9Btlja7fjxXVG4gjBWFLLB+KHg6HICtz8ccP13V5sRzqac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=aE8df9Cd; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="aE8df9Cd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=qKxUj3mSqe2ylrvojKPzYZcY3zgpPlBo94eym74T81o=; b=aE8df9CdEzwmZkDOLdi+H4GjIY
	ay2wlqzEmQB1G3fXGj4TwjHX4kJWu3JD0XC0AQtyWtWzOhOCsVyDTCr4PVIjum6WqZC4F0Ng6dMTo
	lylP3y2LTMecyqf1FLH5EyqymMXLviNX3SADRJptj8kZuWHK1URqZFmZ+pd9TM2MW+3UfJIA1Q4BY
	ASYtrc+QkjhflVa8g1di97WGFF2P3eg44LmrrqTGI49Mja8O7ZHjp1qlVGSe8dVEwEr+u/4MhCR8Y
	dkt/iNkYHfcwhynJVgPj7QMo5nTtVVlpB2eNA60AxT2uQfPF/NnuXBtUgABvliSRhXItfYsPaEI0j
	r69evLJQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTo2o-00000004Z4k-0bjY;
	Mon, 23 Jun 2025 20:45:34 +0000
Message-ID: <50e80a33-30cc-4231-87ad-c0fa392acf45@infradead.org>
Date: Mon, 23 Jun 2025 13:45:31 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] nvmet: Remove redundant assignment of error code in
 nvmet_ns_enable()
To: Alok Tiwari <alok.a.tiwari@oracle.com>, linux-nvme@lists.infradead.org,
 kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
 kch@nvidia.com, nilay@linux.ibm.com, corbet@lwn.net
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250623064036.4187788-2-alok.a.tiwari@oracle.com>
 <20250623064036.4187788-4-alok.a.tiwari@oracle.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250623064036.4187788-4-alok.a.tiwari@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/22/25 11:40 PM, Alok Tiwari wrote:
> removing the unnecessary ret = -EMFILE; assignment since it is
> immediately overwritten by the result of nvmet_bdev_ns_enable()
> The initial value(-EMFILE) is redundant because it has no effect
> on the code logic or outcome.
> 
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/nvme/target/core.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
> index 175c5b6d4dd58..884286f90688a 100644
> --- a/drivers/nvme/target/core.c
> +++ b/drivers/nvme/target/core.c
> @@ -581,8 +581,6 @@ int nvmet_ns_enable(struct nvmet_ns *ns)
>  	if (ns->enabled)
>  		goto out_unlock;
>  
> -	ret = -EMFILE;
> -
>  	ret = nvmet_bdev_ns_enable(ns);
>  	if (ret == -ENOTBLK)
>  		ret = nvmet_file_ns_enable(ns);

-- 
~Randy
