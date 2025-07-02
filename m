Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 945C6307AE7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470045; cv=none; b=Hcq1WBeAjG94RcwcIelPIUyw+7DWuQjwe0OnKQWjcAfHeATlTFEYpzF+jfbVC+gz4LXgC5Gw6XbTbq35Ap0XC3fgrJdB5a0y5my9qHKe0XLxKbbJXlqEtZJZLeDBsU2Op8nvs39Qh7UC6hzTue6buRgAnz3+cR/RPAUsCij75c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470045; c=relaxed/simple;
	bh=M3/80kpsa4xWwNqVJyJW0/eXqUkX09OuOdKOgEXibd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVXL9C0C8m38IwDYF7lnFXJOSq58JLCkPrBCh/YfXyPC1PkK3UOWfZACRwZ7tOdoC/Dfv9dPTqlaX+Mm8EbwIvZR+GXm6lGYW845b0O1UjdZH0GUuadSMSQdDlN99pYTN/4Vsb3Wzt85EL4SJwDyRU9wUx+ZtI3k6kkt1naOQRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19A2A3024;
	Wed,  2 Jul 2025 08:27:08 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 689C43F6A8;
	Wed,  2 Jul 2025 08:27:22 -0700 (PDT)
Date: Wed, 2 Jul 2025 16:27:20 +0100
From: Leo Yan <leo.yan@arm.com>
To: Junhao He <hejunhao3@huawei.com>
Cc: suzuki.poulose@arm.com, james.clark@arm.com, anshuman.khandual@arm.com,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linuxarm@huawei.com,
	jonathan.cameron@huawei.com, yangyicong@huawei.com,
	prime.zeng@hisilicon.com
Subject: Re: [PATCH v2 1/3] coresight: tmc: Add missing doc of
 tmc_drvdata::reading
Message-ID: <20250702152720.GA794930@e132581.arm.com>
References: <20250620075412.952934-1-hejunhao3@huawei.com>
 <20250620075412.952934-2-hejunhao3@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620075412.952934-2-hejunhao3@huawei.com>

On Fri, Jun 20, 2025 at 03:54:10PM +0800, Junhao He wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> tmc_drvdata::reading is used to indicate whether a reading process
> is performed through /dev/xyz.tmc. Document it.
> 
> Reviewed-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> Signed-off-by: Junhao He <hejunhao3@huawei.com>
> ---
>  drivers/hwtracing/coresight/coresight-tmc.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index 6541a27a018e..3ca0d40c580d 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -220,6 +220,7 @@ struct tmc_resrv_buf {
>   * @pid:	Process ID of the process that owns the session that is using
>   *		this component. For example this would be the pid of the Perf
>   *		process.
> + * @reading:	buffer's in the reading through "/dev/xyz.tmc" entry

Are you working on the latest code base? For example, the mainline
kernel or coresight next branch.

The latest code already has comment for reading, and I saw a duplicated
"reading" field in tmc_drvdata.

The tmc_resrv_buf structure does not have the fields "pid",
"stop_on_flush", "buf", etc. They have been moved into the tmc_drvdata
structure.

Thanks,
Leo

>   * @stop_on_flush: Stop on flush trigger user configuration.
>   * @buf:	Snapshot of the trace data for ETF/ETB.
>   * @etr_buf:	details of buffer used in TMC-ETR
> -- 
> 2.33.0
> 
