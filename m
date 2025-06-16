Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813BA2AD00
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 03:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750044380; cv=none; b=saKeM3/xvYKcDjb/xT4xXPOKR+amA43eLYx8spcniOIi5xtxg8f8dSLSJ10zMYPelfeKPBYZjns2gvMUUymU9o1gRg2wZ8L7IAzEG4G73RTdrSysEkmQTalAIcwHZ2QcA3wI0NSWwGuLOXsG9z70wKs75Et4483Hk0v+ArsI8Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750044380; c=relaxed/simple;
	bh=uKnRFTsk+pJYACVZEJSmxbfKFT2sXQF4jSkIx9+DZxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ayFlweNYAdO4ety3R5ifzh7HzqP2A5grCWnGnOv3mv0o1T9EM0AqSfo6OR0dRTUbQY2TZb9q9HgjjCWuKkFpq0XOMsjDOltWSjOhFIWjIUSUf21Yne8ipQlG42ta670XEGlkdymRgmGiQLjFSBrqQRTMBkYIm4teEUmfM02XPBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SRDvVBpu; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SRDvVBpu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750044380; x=1781580380;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=uKnRFTsk+pJYACVZEJSmxbfKFT2sXQF4jSkIx9+DZxw=;
  b=SRDvVBpueQFzCjdib6tAXdyhCmanouW+GWzZ+zD59F+b6WfSXvC21Ieq
   2gvKQx6Scd1raAXnSZql6Iryj+CXrF8qL4zMrf/QNDh8gynFHTShKjZUX
   eu6qy7ukLpfEv32/pYJz0BKrvm73if4se7CaKYEaiBVrxNNSsWyXywxE6
   m04phMTR/5fgFRZQD3YMccLkODhp0AtdHt/zWl77d5O5OKhQXrfoc7czN
   dyM4uAi5mAb+ZxKwYKgOlN2eV/jchn6sRfW6i37MLoX/27XnZcFuKtl6G
   K8TvJVpF/fmSiPGY5UU0shQigt9rjUZjbzlb2w0PVbJe/E2x6gRhQ4pTJ
   w==;
X-CSE-ConnectionGUID: 8jiw+4mrTeKgK+IUl9IawA==
X-CSE-MsgGUID: fMPUtiK3Shu5QzYhDED+0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="51889504"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="51889504"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 20:26:19 -0700
X-CSE-ConnectionGUID: prVbeiNhTtmc4WoRu38u7g==
X-CSE-MsgGUID: Efe+tMqcRKuc4eAWZkWqSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="149229808"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 20:26:15 -0700
Message-ID: <118a918f-d549-4a19-8636-3bed2a670852@linux.intel.com>
Date: Mon, 16 Jun 2025 11:25:16 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/14] iommufd: Return EOPNOTSUPP for failures due to
 driver bugs
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, kevin.tian@intel.com
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, praan@google.com,
 yi.l.liu@intel.com, peterz@infradead.org, jsnitsel@redhat.com,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <623bb6f0e8fdd7b9c5745a2f99f280163f9f1f5a.1749882255.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <623bb6f0e8fdd7b9c5745a2f99f280163f9f1f5a.1749882255.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/14/25 14:35, Nicolin Chen wrote:
> It's more accurate to report EOPNOTSUPP when an ioctl failed due to driver
> bug, since there is nothing wrong with the user space side.
> 
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
