Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F6C5336D
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751279872; cv=none; b=jLdExIOqdleoCSBpAQmKAApHID1j86NWWjKS29jzOynaf51dXndwS0JeGxVsgXyp74z5Up7jXAXjyXbdWRTduKs+kLk74o/JQYy1qDwWjQv54JqWCrtqRoV8Hvyh4aS7gg2zl5Cl62pX9pIrLmGeI7jVFqwAwnA0sj3zpkVpstQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751279872; c=relaxed/simple;
	bh=ADqLsBmhOaMmLHWLcnIrBhIrQFf0QuoHBj65mKxXYrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YndEiKqznSrdNTUgEKJ9Uv4qWWaLM99f6T6QYy3nOgidrym4qRiKLNVkBEUcMdB+hycwWIWlTfgBAdq2ZsOjJ4ASmp8OWQ8TJyUMjRk5SSJ/JrHI6Tv9lCEp6U8DExudVUJXvlfhHDC/O+qjfmBtxLyWrNtWfw6OzahAZiwqyQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E3F21D34;
	Mon, 30 Jun 2025 03:37:34 -0700 (PDT)
Received: from [10.57.86.51] (unknown [10.57.86.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EF1783F58B;
	Mon, 30 Jun 2025 03:37:48 -0700 (PDT)
Message-ID: <8feaae24-835a-43e3-bd4a-615390a0ba3b@arm.com>
Date: Mon, 30 Jun 2025 11:37:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: Only register perf symlink for sinks with
 alloc_buffer
Content-Language: en-GB
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250630-etm_perf_sink-v1-1-e4a7211f9ad7@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250630-etm_perf_sink-v1-1-e4a7211f9ad7@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/06/2025 11:26, Yuanfang Zhang wrote:
> Ensure that etm_perf_add_symlink_sink() is only called for devices
> that implement the alloc_buffer operation. This prevents invalid
> symlink creation for dummy sinks that do not implement alloc_buffer.
> 
> Without this check, perf may attempt to use a dummy sink that lacks
> alloc_buffer operationsu to initialise perf's ring buffer, leading
> to runtime failures.
> 
> Fixes: 9d3ba0b6c0569 ("Coresight: Add coresight dummy driver")
> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index fa758cc21827552a5c97b6bdd05d22dec4994b22..fddf04c5ee46eb4d559416296f7e85ce6c5689fa 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -1374,8 +1374,9 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
>   		goto out_unlock;
>   	}
>   
> -	if (csdev->type == CORESIGHT_DEV_TYPE_SINK ||
> -	    csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) {
> +	if ((csdev->type == CORESIGHT_DEV_TYPE_SINK ||
> +	     csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) &&
> +	    sink_ops(csdev)->alloc_buffer) {
>   		ret = etm_perf_add_symlink_sink(csdev);
>   
>   		if (ret) {
> 

Looks good to me, I will queue this

Suzuki

