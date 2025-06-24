Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274DB17A2F8
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 03:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750735520; cv=none; b=ZGHAPi4Bl9mB0+fLmBUoOZRbaedQ5FMs3x4P3LgWVc6m/mA/7YkK/azxHMRxEaIkEo3pJzKaaYPtb++i5M2lGoh0A90vXaQab6Zx5RC8tTAk6lkO6vpoPKipi6cWtIBWEN3S/8kUESTWn2TS4UCsQf0FPfaPfAIoa+7zqh7vXtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750735520; c=relaxed/simple;
	bh=CucvO7iLDIMDWZ7saFNdpJtyJDEpvnZmX1BGLn/ZtPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WzUiAIe9HLKupfD4KctHmijMptQcKOOwrNxaU22MXkqC4pmLITa/ST+YU1V82knmRCcqbrAo1ODYGLGhFBsAfjoYB9nUcYtEqQFGAB371PPBbOniX2tb4kwyqnixvPCZNY8q10JmroJZXrrS2SZ3sXD3BBDCES4KJECUaSAB5Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Di8weWX0; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Di8weWX0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750735519; x=1782271519;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CucvO7iLDIMDWZ7saFNdpJtyJDEpvnZmX1BGLn/ZtPI=;
  b=Di8weWX0RX4bpIIhcGDVO7HKc3n5HjLILJQv+QQsOIhuqub0fGEl+udI
   JHNGVVVkchq6Lfeccy6x07xXyC6M1bO1SNeu+X7Vv8WAjM7Ok19LnVKP+
   81TBGwY9PUxw8s2SA1aG+1g8WpIhO/s/wpW4LEk1UOYJuy3LVqh8uCwND
   XtYtmzfNu14jiXEgYfJ+G9h4j04FK60vC5XwfnxuX6fM0zs73KeCRcslx
   1eMhuD+gk/nQlY2IbqJLl0KVnba/suaM9XnK3WOZbMXP0Ha1eJKcjD80s
   R87VzkxKWOvJEijoHsPiqo6rlZi5jdiVn/NF6AbHkVZMx7utW1JPsWRLC
   g==;
X-CSE-ConnectionGUID: /EXhM0j4Q9mliHo+iicKYg==
X-CSE-MsgGUID: 4CX33MHoRH+q9MUURciTdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52185383"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="52185383"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 20:25:18 -0700
X-CSE-ConnectionGUID: 61opIpQ0RnWrR8slq7h5mw==
X-CSE-MsgGUID: MPs3SNIvSviu5Yle71xmlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="156078863"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 20:25:15 -0700
Message-ID: <ff1a3fc1-3671-4cff-917f-5ea44bd2451e@linux.intel.com>
Date: Tue, 24 Jun 2025 11:24:02 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] iommufd/viommu: Fix the uninitialized
 iommufd_vdevice::ictx
To: Xu Yilun <yilun.xu@linux.intel.com>, jgg@nvidia.com, jgg@ziepe.ca,
 kevin.tian@intel.com, will@kernel.org, aneesh.kumar@kernel.org
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, joro@8bytes.org,
 robin.murphy@arm.com, shuah@kernel.org, nicolinc@nvidia.com, aik@amd.com,
 dan.j.williams@intel.com, yilun.xu@intel.com
References: <20250623094946.1714996-1-yilun.xu@linux.intel.com>
 <20250623094946.1714996-3-yilun.xu@linux.intel.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20250623094946.1714996-3-yilun.xu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/23/25 17:49, Xu Yilun wrote:
> Fix the uninitialized iommufd_vdevice::ictx. No code was using this
> field before, but later vdevice will use it to sync up with idevice on
> destroy paths.
> 
> Fixes: 0ce5c2477af2 ("iommufd/viommu: Add IOMMUFD_OBJ_VDEVICE and IOMMU_VDEVICE_ALLOC ioctl")
> Cc:<stable@vger.kernel.org>
> Signed-off-by: Xu Yilun<yilun.xu@linux.intel.com>
> ---
>   drivers/iommu/iommufd/viommu.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
> index 01df2b985f02..4577b88c8560 100644
> --- a/drivers/iommu/iommufd/viommu.c
> +++ b/drivers/iommu/iommufd/viommu.c
> @@ -130,6 +130,7 @@ int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd)
>   		goto out_put_idev;
>   	}
>   
> +	vdev->ictx = ucmd->ictx;

iommufd_vdevice::ictx has been removed by this commit:

6e235a772199 ("iommufd: Drop unused ictx in struct iommufd_vdevice")

in linux-next.

Thanks,
baolu
