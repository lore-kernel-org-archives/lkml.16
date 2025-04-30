Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676581F941
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 13:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746020745; cv=none; b=GDYMpcZmMfjgFi+1RzLfP/MrGoLD+PiVCP9O0pA4Ui8yaYXPMlTgJVs0+0BdqJOg+hVohzcl1y6pqvqu6/FlR5ONP24dK1Clq2BqQpNrk4wRQpfaM1qiQbLoyKeZLGGQI9p2oSYMY8d3R7qN5TuvF9A4Bnl7/OAa7N5ayCF8B0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746020745; c=relaxed/simple;
	bh=ZF9Yw2FW09cI+JGsUcloL/6gJ8Tx3hLerPQi/1EF8Uk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XEU2DjQzB+mYaZJdnWyPbJkL1ehNsB0+OAN/hEXpXlaBwKXKDqcH5w518HkimqlU47yTYTEmuETIJdb4TJi5tADvf4iuP1edht+ww2suzTjTsXaXzL2YEUtwpz8+DPzrcd1+Nqq/yxi4yf7l3JPQ/dbXdcKxYCBiBbuB7FrOR/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FB0D106F;
	Wed, 30 Apr 2025 06:45:35 -0700 (PDT)
Received: from [10.1.33.69] (Suzukis-MBP.cambridge.arm.com [10.1.33.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 06E303F5A1;
	Wed, 30 Apr 2025 06:45:40 -0700 (PDT)
Message-ID: <f2ffb9fd-ec59-4e67-83a3-437b986ece73@arm.com>
Date: Wed, 30 Apr 2025 14:45:40 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] coresight: core: Disable helpers for devices that
 fail to enable
Content-Language: en-GB
To: Yabin Cui <yabinc@google.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
 Jie Gan <quic_jiegan@quicinc.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250429231301.1952246-1-yabinc@google.com>
 <20250429231301.1952246-3-yabinc@google.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250429231301.1952246-3-yabinc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/04/2025 00:13, Yabin Cui wrote:
> When enabling a SINK or LINK type coresight device fails, the
> associated helpers should be disabled.
> 
> Signed-off-by: Yabin Cui <yabinc@google.com>
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Reviewed-by: James Clark <james.clark@linaro.org>
> Reviewed-by: Mike Leach <mike.leach@linaro.org>

Again, this should have :

Fixes: 6148652807ba ("coresight: Enable and disable helper devices 
adjacent to the path")

I have added it locally

Rest looks good to me


Suzuki


> ---
>   drivers/hwtracing/coresight/coresight-core.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index dabec7073aed..d3523f0262af 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -465,7 +465,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>   		/* Enable all helpers adjacent to the path first */
>   		ret = coresight_enable_helpers(csdev, mode, path);
>   		if (ret)
> -			goto err;
> +			goto err_disable_path;
>   		/*
>   		 * ETF devices are tricky... They can be a link or a sink,
>   		 * depending on how they are configured.  If an ETF has been
> @@ -486,8 +486,10 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>   			 * that need disabling. Disabling the path here
>   			 * would mean we could disrupt an existing session.
>   			 */
> -			if (ret)
> +			if (ret) {
> +				coresight_disable_helpers(csdev, path);
>   				goto out;
> +			}
>   			break;
>   		case CORESIGHT_DEV_TYPE_SOURCE:
>   			/* sources are enabled from either sysFS or Perf */
> @@ -497,16 +499,19 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>   			child = list_next_entry(nd, link)->csdev;
>   			ret = coresight_enable_link(csdev, parent, child, source);
>   			if (ret)
> -				goto err;
> +				goto err_disable_helpers;
>   			break;
>   		default:
> -			goto err;
> +			ret = -EINVAL;
> +			goto err_disable_helpers;
>   		}
>   	}
>   
>   out:
>   	return ret;
> -err:
> +err_disable_helpers:
> +	coresight_disable_helpers(csdev, path);
> +err_disable_path:
>   	coresight_disable_path_from(path, nd);
>   	goto out;
>   }

