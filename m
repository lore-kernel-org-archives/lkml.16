Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8B11E1C36
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744254228; cv=none; b=PeH3DCbeFANyrXEchdibq51zrvwXnFQYHIgJLK6uzX7+NFKgihzpAonXK7c9yXaeME3bJTJHXkQm9cUW2rCBDg25L2Mmlged9/toCR7EA6gEHrGrHH1GIdKYcsxbuGbRLlecfA6Uqww+BIRCGPRWgDZ1a+C6XUy5IvuljWHMSiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744254228; c=relaxed/simple;
	bh=IirMqiAB81c7mdHKfJBFfeG72poTirxHI+/B8Se38RE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iP5YsOabYTHbHgwGb5je/0pzyLdhanda7CtSF/QJMt81Fk49/mshruAIel60DhksLrcawR81ZxrtmFg7aotUAZsOmdv0FLJ8/rZ6KSMjlFBwsV6Hmvquc6psPbLnhusSL7lSrBNW9hGIC+5V0MsrpOlKcJg0p6anBFKoLvvy8MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fCX0fpeJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fCX0fpeJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744254226; x=1775790226;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=IirMqiAB81c7mdHKfJBFfeG72poTirxHI+/B8Se38RE=;
  b=fCX0fpeJpSNulxGwUrY/9hWlFtU/897MgLtwqzTJzYXqQJ30sV4c6sfW
   YG+VRSB7SJSU8GjExlDjM+todMoQWpW6cHqNJDLPPh0Lzq1qciG2dEJVZ
   gMfIdu29PS8fcSl+jDpzvxXI91NvdsH9f7JK2cFWG6EUjcsZ+YqIG64NW
   LVFsl+HwjUiklfaybTkIVBG7Z5Q8HUTMVUx94jHbq8mO2Ezfp8QVsVabw
   IE011bbpupe1l+591ZpesfYJixkvuI9ZWiiqGLR/nq6F00w3WqtY+RmFk
   pufHhc/Ek4Cuq2zKvZX0bFc62+qTRy2yK4xxGacHvMjHHZNFWqoUWE+4H
   g==;
X-CSE-ConnectionGUID: QjnvgZ7DTM6cDo25PLuE/w==
X-CSE-MsgGUID: L04dgsRMSACtviYc3J1M1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="56736359"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="56736359"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 20:03:45 -0700
X-CSE-ConnectionGUID: C4F746iETWO0hWsvM/Pjog==
X-CSE-MsgGUID: 4TIJoEi/S8+L/7oQBmToMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="165983752"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 20:03:44 -0700
Message-ID: <5543e3a5-dda5-49b5-aa59-fbc599d24bab@linux.intel.com>
Date: Thu, 10 Apr 2025 10:59:51 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/vt-d: Remove an unnecessary call set_dma_ops()
To: =?UTF-8?B?UGV0ciBUZXNhxZnDrWs=?= <petr@tesarici.cz>, iommu@lists.linux.dev
Cc: Petr Tesarik <ptesarik@suse.com>, David Woodhouse <dwmw2@infradead.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Tom Murphy <murphyt7@tcd.ie>,
 linux-kernel@vger.kernel.org
References: <20250403165605.278541-1-ptesarik@suse.com>
 <20250409174430.00ff4a09@meshulam.tesarici.cz>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20250409174430.00ff4a09@meshulam.tesarici.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/9/25 23:44, Petr Tesařík wrote:
> On Thu,  3 Apr 2025 18:56:05 +0200
> Petr Tesarik<ptesarik@suse.com> wrote:
> 
>> Do not touch per-device DMA ops when the driver has been converted to use
>> the dma-iommu API.
>>
>> Fixes: c588072bba6b ("iommu/vt-d: Convert intel iommu driver to the iommu ops")
>> Signed-off-by: Petr Tesarik<ptesarik@suse.com>
> Does anyone agree? Or see any issues?

This change looks good to me. The iommu driver should not call
set_dma_ops() anyway. I will queue this for v6.15-rc.

I ever wondered whether we could clean up dev->dma_iommu when the device
is released by the iommu core. But, iommu_release_device() is only
called in the device removal path, so keeping dev->dma_iommu set doesn't
impose any functional impact AFAICS.

Thanks,
baolu
