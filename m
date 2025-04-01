Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00CBF204855
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743516259; cv=none; b=U2k0Z52MGh1QYj6gjPtYPKg9JVTFmWvCBc75GFPSm3EMXB54OJ1x0H7UJbUYkfev/U7Qx0AZRSIILjG7K65jjpzjOFv6vwpleUYSWpszRdW37tUxlzbqBxXVPfB+/tPo9ZfyZiidicqmucM1vFhBk+2vKtx2xHZRXuuAeA2lSjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743516259; c=relaxed/simple;
	bh=LgZOPHP2fgK+vICxbrc/WSBsDB84drhI4f9DN3hv+wk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XMoN4yHv5uQRy/YvFqOKMgpi4+SW+nsFm28KCOVEwM8xsDJcV2BrAS/lHZyfZ1dmNoV55TjaSay9DB2rsnxc8Fpq2PWGaS0g5dTZNIklu2qS2lTOCj+93Pd9CPqGNX46hwvHr9OQTGg6w7xt/ST8+V/pHyRioLKTmQ8ecbaFUtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A945D1424;
	Tue,  1 Apr 2025 07:04:20 -0700 (PDT)
Received: from [10.57.67.199] (unknown [10.57.67.199])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A48173F63F;
	Tue,  1 Apr 2025 07:04:15 -0700 (PDT)
Message-ID: <d6ccc357-85fe-4b3e-95d0-127c2784ae85@arm.com>
Date: Tue, 1 Apr 2025 15:04:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf: arm-ni: Fix missing platform_set_drvdata()
To: Hongbo Yao <andy.xu@hj-micro.com>, will@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, allen.wang@hj-micro.com, peter.du@hj-micro.com
References: <20250401054248.3985814-1-andy.xu@hj-micro.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250401054248.3985814-1-andy.xu@hj-micro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-04-01 6:42 am, Hongbo Yao wrote:
> Add missing platform_set_drvdata in arm_ni_probe(), otherwise
> calling platform_get_drvdata() in remove returns NULL.

Oops, indeed. Not sure how that got lost...

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Fixes: 4d5a7680f2b4 ("perf: Add driver for Arm NI-700 interconnect PMU")
> Signed-off-by: Hongbo Yao <andy.xu@hj-micro.com>
> ---
>   drivers/perf/arm-ni.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
> index ee85577e86b9..da1907b7391d 100644
> --- a/drivers/perf/arm-ni.c
> +++ b/drivers/perf/arm-ni.c
> @@ -666,6 +666,7 @@ static int arm_ni_probe(struct platform_device *pdev)
>   	ni->num_cds = num_cds;
>   	ni->part = part;
>   	ni->id = atomic_fetch_inc(&id);
> +	platform_set_drvdata(pdev, ni);
>   
>   	for (int v = 0; v < cfg.num_components; v++) {
>   		reg = readl_relaxed(cfg.base + NI_CHILD_PTR(v));

