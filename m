Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03CFA2701A9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745400782; cv=none; b=riouL/5noOJA9XxSVyiEk2aIPoPjVv3PeNHzLLWJSur/wwRXHjMwuwk1syrM/tWIekCT1/QfZjh5nPUvfRbJXs3J6M+zZ/HERxqfdjVHr1A1d40DtWtLpfFWdPH8ivYhqamkk6P0XUKmNQFFu0GXnLasbk33rS0kGn5FgPWRfoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745400782; c=relaxed/simple;
	bh=33BbAT6/1qxjnI2XqvwfHxGaPmBgL6Xpr/nonop6o1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YYI2/uKjLF8HTIl/n5RH+SZfdjzvDoRJWl44nS5UChf3aY6B3ENeWXhKqP3H7BUT/AvM7fOIHKzbsoGBwbLaGBegEcugAkKOKCCq2TrbpkFbgMVRCbaTfOdAU5ljrWnAZSh5BM7XzWE9+TQKZiudEEkInJYfduCaT7NsIWA+m9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EE562B;
	Wed, 23 Apr 2025 02:32:54 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 80F933F66E;
	Wed, 23 Apr 2025 02:32:58 -0700 (PDT)
Date: Wed, 23 Apr 2025 10:32:53 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yabin Cui <yabinc@google.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Jie Gan <quic_jiegan@quicinc.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] coresight: core: Disable helpers for devices that
 fail to enable
Message-ID: <20250423093253.GK28953@e132581.arm.com>
References: <20250415184649.356683-1-yabinc@google.com>
 <20250415184649.356683-3-yabinc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415184649.356683-3-yabinc@google.com>

On Tue, Apr 15, 2025 at 11:46:49AM -0700, Yabin Cui wrote:
> When enabling a SINK or LINK type coresight device fails, the
> associated helpers should be disabled.
> 
> Signed-off-by: Yabin Cui <yabinc@google.com>
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-core.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index fb43ef6a3b1f..d9fcea69d221 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -486,8 +486,10 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>  			 * that need disabling. Disabling the path here
>  			 * would mean we could disrupt an existing session.
>  			 */
> -			if (ret)
> +			if (ret) {
> +				coresight_disable_helpers(csdev, path);

I think we can do better for code consolidation - we can use a central
place for error handling.  I will give details below.

>  				goto out;
> +			}
>  			break;
>  		case CORESIGHT_DEV_TYPE_SOURCE:
>  			/* sources are enabled from either sysFS or Perf */
> @@ -497,15 +499,17 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>  			child = list_next_entry(nd, link)->csdev;
>  			ret = coresight_enable_link(csdev, parent, child, source);
>  			if (ret)
> -				goto err;
> +				goto err_disable_helpers;
>  			break;
>  		default:
> -			goto err;
> +			goto err_disable_helpers;

I know this is not a problem introduced by your patch - for an error
case, it returns 0.  This will hide unexpected issues.  I would like
to suggest to return -EINVAL for unknown types.

>  		}
>  	}
>  
>  out:
>  	return ret;
> +err_disable_helpers:
> +	coresight_disable_helpers(csdev, path);
>  err:
>  	coresight_disable_path_from(path, nd);
>  	goto out;

I am just wandering if we can handle errors in a unified way and
without using goto.  I would change the code as below.

The point is to use a general flow for error handling, include a
sink error.  For sink error, we still invoke
coresight_disable_path_from() for an empty operation.

Also, I think we need an additional patch for error handling in
coresight_enable_helpers(). If any errors are detected while enabling
a helper, we should disable the helpers that have already been
enabled.

Please let me know if you have any questions.

Thanks,
Leo

---8<---

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fb43ef6a3b1f..cf2a3708a05e 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -465,7 +465,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 		/* Enable all helpers adjacent to the path first */
 		ret = coresight_enable_helpers(csdev, mode, path);
 		if (ret)
-			goto err;
+			goto err_disable_path;
 		/*
 		 * ETF devices are tricky... They can be a link or a sink,
 		 * depending on how they are configured.  If an ETF has been
@@ -487,7 +487,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 			 * would mean we could disrupt an existing session.
 			 */
 			if (ret)
-				goto out;
+				goto err_disable_helpers;
 			break;
 		case CORESIGHT_DEV_TYPE_SOURCE:
 			/* sources are enabled from either sysFS or Perf */
@@ -497,18 +497,21 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 			child = list_next_entry(nd, link)->csdev;
 			ret = coresight_enable_link(csdev, parent, child, source);
 			if (ret)
-				goto err;
+				goto err_disable_helpers;
 			break;
 		default:
-			goto err;
+			ret = -EINVAL;
+			goto err_disable_helpers;
 		}
 	}
 
-out:
-	return ret;
-err:
+	return 0;
+
+err_disable_helpers:
+	coresight_disable_helpers(csdev, path);
+err_disable_path:
 	coresight_disable_path_from(path, nd);
-	goto out;
+	return ret;
 }
 
> -- 
> 2.49.0.604.gff1f9ca942-goog
> 
