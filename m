Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2539125B68D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746017882; cv=none; b=HqNP4ew+3p+lO/n1y7coxuNMNQewp2AclbY5k5aVj4+QrAelHZxtIU0Jia3LqZdoR4+2qNcoTb4Mh2LrzhAirjbH9OVi4a1UPLUkSWHSufEixBFArQ4daPrjROXwmu8VDI8TU0BwN3EiubYmDVnVzK+Qk6FH/dY8s9tx4CeJHZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746017882; c=relaxed/simple;
	bh=C7o8omRFWq4tRVxnvDIcMWxHM8hlKm5GEHJf5zm4A4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idsqM1sy5C24wlD9r9edRvAIi8Qf8co7iuK5MkM2iTqKgv3luIxBGzNcN2Hw/6nVngRlTh8NhuI0qr0FFzLf148kGXniDZXzGzGasLzMTK1JDpnIbastYTRcDW53oJNZM3p381wj9rvwZOZqBC1qzV3fBjeZQlmpUrVRqSPmYWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 001CC106F;
	Wed, 30 Apr 2025 05:57:52 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ADBDD3F5A1;
	Wed, 30 Apr 2025 05:57:58 -0700 (PDT)
Date: Wed, 30 Apr 2025 13:57:56 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yabin Cui <yabinc@google.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Jie Gan <quic_jiegan@quicinc.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] coresight: core: Disable helpers for devices that
 fail to enable
Message-ID: <20250430125756.GK551819@e132581.arm.com>
References: <20250429231301.1952246-1-yabinc@google.com>
 <20250429231301.1952246-3-yabinc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429231301.1952246-3-yabinc@google.com>

On Tue, Apr 29, 2025 at 04:13:00PM -0700, Yabin Cui wrote:
> When enabling a SINK or LINK type coresight device fails, the
> associated helpers should be disabled.
> 
> Signed-off-by: Yabin Cui <yabinc@google.com>
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Reviewed-by: James Clark <james.clark@linaro.org>
> Reviewed-by: Mike Leach <mike.leach@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  drivers/hwtracing/coresight/coresight-core.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index dabec7073aed..d3523f0262af 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -465,7 +465,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>  		/* Enable all helpers adjacent to the path first */
>  		ret = coresight_enable_helpers(csdev, mode, path);
>  		if (ret)
> -			goto err;
> +			goto err_disable_path;
>  		/*
>  		 * ETF devices are tricky... They can be a link or a sink,
>  		 * depending on how they are configured.  If an ETF has been
> @@ -486,8 +486,10 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>  			 * that need disabling. Disabling the path here
>  			 * would mean we could disrupt an existing session.
>  			 */
> -			if (ret)
> +			if (ret) {
> +				coresight_disable_helpers(csdev, path);
>  				goto out;
> +			}
>  			break;
>  		case CORESIGHT_DEV_TYPE_SOURCE:
>  			/* sources are enabled from either sysFS or Perf */
> @@ -497,16 +499,19 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>  			child = list_next_entry(nd, link)->csdev;
>  			ret = coresight_enable_link(csdev, parent, child, source);
>  			if (ret)
> -				goto err;
> +				goto err_disable_helpers;
>  			break;
>  		default:
> -			goto err;
> +			ret = -EINVAL;
> +			goto err_disable_helpers;
>  		}
>  	}
>  
>  out:
>  	return ret;
> -err:
> +err_disable_helpers:
> +	coresight_disable_helpers(csdev, path);
> +err_disable_path:
>  	coresight_disable_path_from(path, nd);
>  	goto out;
>  }
> -- 
> 2.49.0.967.g6a0df3ecc3-goog
> 
