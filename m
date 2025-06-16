Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9644F2AD00
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 03:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750044508; cv=none; b=OKkSCQiMSr1MMivtP3PdfNt7DZhyhfMxIa3B9zX7n4UcsRSK6TGdnjWObVjMTv+UiHYmWUC5DSh8nAPW6iS//rdhFae4i3YoyyC1vjt25PkK6tAMDEBw5WuTjV/a35i3NiSTBsdaS/fVb94I1fuFSY4vf2B+YkUmjrls3Lp/+ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750044508; c=relaxed/simple;
	bh=3crnHZWWyc6HQi2ObquKyXrIRR65iwUXK5eb9xDLGyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=unMOejC0Ex/vin/JBGpCspKWxv6z9pUEC1tow4swHa3a7OVMd8yhs1rsbuvt6uc1OOradkXTFNiIH4z5zB4F7JvIL0LMp08VWXOa4Cffim5qkTzi6vdKRszdOnxVP/IoMy+PVsWwsbX9CvlrhtJx4iYYngTp5H6PZ459Dqu9y+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EW9NooF9; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EW9NooF9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750044508; x=1781580508;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3crnHZWWyc6HQi2ObquKyXrIRR65iwUXK5eb9xDLGyE=;
  b=EW9NooF9pmxgluspd83m3qHhL1VOyrOei5pTHRpEfLJZ5XsU5KO+lfBR
   Vh9pyF3JQKs702uPJ1p7//Nm5S60aTg5SOmOukrIFNW7bAe0+4FZqllDB
   rFKAB8xUECVgUrbi/cmt+ZXUT6WKzpdYAe6yjso7VWcMztRtEghk+Kexm
   ZQKUGVOOWhEMj9vDUNjDL1u5bblEvkCMjUgpEr9YTFEufyPnma9U1eOIb
   EUM3O8tPCG8XgNCYkuUTVGmTq7bUHopucpXwfDoEWiXFej7nPO+C4rx4V
   +bBf3cMY4SWNE8suN4D3LMXu4rgSJimiV8+q67zNVP6HOPKAcRreVwBQF
   w==;
X-CSE-ConnectionGUID: 5KFwAqa3TZOWqLLP3bRB9Q==
X-CSE-MsgGUID: BG9l1FgjSBGEiIUzJL9VSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="69621984"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="69621984"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 20:28:27 -0700
X-CSE-ConnectionGUID: U7O3D45sRme+/EgWHKETWw==
X-CSE-MsgGUID: aL3V/0EgTX2OJibq0nW3Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="152177197"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 20:28:24 -0700
Message-ID: <e27acc05-3d31-42c3-8674-4891122ba833@linux.intel.com>
Date: Mon, 16 Jun 2025 11:27:24 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/14] iommufd: Apply the new iommufd_object_alloc_ucmd
 helper
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, kevin.tian@intel.com
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, praan@google.com,
 yi.l.liu@intel.com, peterz@infradead.org, jsnitsel@redhat.com,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <107b24a3b791091bb09c92ffb0081c56c413b26d.1749882255.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <107b24a3b791091bb09c92ffb0081c56c413b26d.1749882255.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/14/25 14:35, Nicolin Chen wrote:
> Now the new ucmd-based object allocator eases the finalize/abort routine,
> apply this to all existing allocators that aren't protected by any lock.
> 
> Upgrade the for-driver vIOMMU alloctor too, and pass down to all existing
> viommu_alloc op accordingly.
> 
> Note that __iommufd_object_alloc_ucmd() builds in some static tests that
> cover both static_asserts in the iommufd_viommu_alloc(). Thus drop them.
> 
> Suggested-by: Jason Gunthorpe<jgg@nvidia.com>
> Reviewed-by: Jason Gunthorpe<jgg@nvidia.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
