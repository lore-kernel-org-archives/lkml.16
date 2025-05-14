Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F367921C16D
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747213522; cv=none; b=pPjV9F1plA33aujYH6MFBhsayK2eLvHmMU7TlqM929upgpC1+IK5negfslOHbL/QkUFT9W+bgW+3B/x+bx+jESAHzoUJhxe6Quxsyn01cNcceCKauQMaPcSA58EUv0OhEPrLuGw6+9iumcyRltEJ1Mo/A+ueZZPtldEw6fc+pt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747213522; c=relaxed/simple;
	bh=q1PKH9PIsyt3XQ8Ac6kfaa9QBnYSHR9/lTz9UsmPY5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J4K/OW0iuBPMWHFzZW9m1e2hYcMt3psSuadGafq/SK6ex+lRmgyJqRW6qsUgcrurCuLKL0WW8kHduOx+hRTWwhxuntny4IPqVsMJOKpZksMOuPVbyoDZGKSzCmjy+DYMDo4V/0srpkqJp8yjKAwu3SZ7shzb7x+hfwqCaIZ5FjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC237169C;
	Wed, 14 May 2025 02:05:07 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82E663F5A1;
	Wed, 14 May 2025 02:05:18 -0700 (PDT)
Date: Wed, 14 May 2025 10:05:13 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: suzuki.poulose@arm.com, mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] coresight/etm4: fix missing disable active config
Message-ID: <20250514090513.GC26114@e132581.arm.com>
References: <20250513170622.3071637-1-yeoreum.yun@arm.com>
 <20250513170622.3071637-2-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513170622.3071637-2-yeoreum.yun@arm.com>

On Tue, May 13, 2025 at 06:06:20PM +0100, Yeoreum Yun wrote:
> When etm4 device is disabled via sysfs, it should disable its active
> count.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

With adding fix tag:

Fixes: 7ebd0ec6cf94 ("coresight: configfs: Allow configfs to activate configuration")

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 2b8f10463840..f008f87f0801 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1020,6 +1020,9 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
>  	smp_call_function_single(drvdata->cpu, etm4_disable_hw, drvdata, 1);
>  
>  	raw_spin_unlock(&drvdata->spinlock);
> +
> +	cscfg_csdev_disable_active_config(csdev);
> +
>  	cpus_read_unlock();
>  
>  	/*
> -- 
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
> 
