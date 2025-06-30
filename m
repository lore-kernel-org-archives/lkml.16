Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00F8E56A
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 05:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751260369; cv=none; b=nBGjdGseQPq4X0jFODWbBXWoXObfjQWzM8d3QFSPkRe9035kI9q801bXuyVs88L2XemFuK3SJSqvzkFOfOR309iTxrYIBZtK507cr6b1b9DVEny5WA1SR0QJJkW1KlV3WhHDsI6AEUupKmJS3Ycrchtm5OrAVfbCNrESY7INPuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751260369; c=relaxed/simple;
	bh=TXHvDMtP4fFiFPmwe6XUctKI3tikSjkxZwf72We4moY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VSWQVziqavt9+jnQtcClY9FlW3Fsr2dSB3GjF6wzmm9NhlVA1YLYsCpA1OJkUxtAAIsJJ4oIkt7+dlzswLJhT/z8eiknFIsgK01cbfaectw0gPL7YguSX7WMithNoOee8KrVd3qZftfz28w0ZxZ0z/XAMQfIUUhMBcTuU14bLSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RL2kS+h2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RL2kS+h2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751260367; x=1782796367;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TXHvDMtP4fFiFPmwe6XUctKI3tikSjkxZwf72We4moY=;
  b=RL2kS+h2ciXEWYXchfDQPijFrupk2LzN+dkyKreAg+KTsUwl7z+FHuTV
   5eVhETgoO//VlE6t/a/lGKxsA5RGC/l8MRZVn6n0izkSArWRHX5LdPadX
   PWNuAkcnU9fksHfBpxjYi16PJjKVi/Q6uyq9aUdTHCBSKRrEdiO4flJkN
   uocVcXsNK9vAWzLkLgi/tbLi0Ele71RTyqD+SwoJQAa2n9vRcMu7lBKj4
   jGy6FFzwqBX8tnvwywQR/om9+ytlvuyXDdfxiNqg7wDEO0gjVijX7hFoW
   lHQEcGC/+GE/bApRtEHyKy/QPOUpMu8/PJuhsjsdiNoO5fhmR/hZrNTYL
   Q==;
X-CSE-ConnectionGUID: kAtVX0wySautmfnC++t+PA==
X-CSE-MsgGUID: 6AafoAM9TJCZkZXD5txlNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53568270"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53568270"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 22:12:46 -0700
X-CSE-ConnectionGUID: nlddMux1QVuWksapdiBNFw==
X-CSE-MsgGUID: iOgeKmEOSsqCp28zWYCVLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="157378756"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 22:12:43 -0700
Message-ID: <22789824-bc09-4351-a7c5-5d917ebfcdaf@linux.intel.com>
Date: Mon, 30 Jun 2025 13:11:19 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] iommufd/vdevice: Remove struct device reference
 from struct vdevice
To: Xu Yilun <yilun.xu@linux.intel.com>, jgg@nvidia.com, jgg@ziepe.ca,
 kevin.tian@intel.com, will@kernel.org, aneesh.kumar@kernel.org
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, joro@8bytes.org,
 robin.murphy@arm.com, shuah@kernel.org, nicolinc@nvidia.com, aik@amd.com,
 dan.j.williams@intel.com, yilun.xu@intel.com
References: <20250627033809.1730752-1-yilun.xu@linux.intel.com>
 <20250627033809.1730752-4-yilun.xu@linux.intel.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20250627033809.1730752-4-yilun.xu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/27/25 11:38, Xu Yilun wrote:
> Remove struct device *dev from struct vdevice.
> 
> The dev pointer is the Plan B for vdevice to reference the physical
> device. As now vdev->idev is added without refcounting concern, just
> use vdev->idev->dev when needed.
> 
> Signed-off-by: Xu Yilun<yilun.xu@linux.intel.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
