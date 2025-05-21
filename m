Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0456B25DB0B;
	Wed, 21 May 2025 13:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747834498; cv=none; b=Hg2sU74fTpg5Xskm5FFzkz8NrRUcSsXf6cwzQ3B06MVOmajvhKXWPOggfp3F8jRxtfCMopy68VaY0mOINw9LRT6XFZ04ID9wzfI8qhlgOjV5S8CVVh5SnLvXvl4MgZZCWg3xpHW1E/y7p7s5WR+E3K8sAMqwn3LxUXWjj2Q0XdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747834498; c=relaxed/simple;
	bh=0d0faT2B5banWdiZ/l3sqpErt6iqic34exHZVRuvENE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=udDO9LNxZ2PBYsEcMOnLebZmBnpSOXG1JElI+bsb2NtF2uBmrpUcSpMayqQbFL69ZNxNfxysNSfarlQmsB6OwzzikYniOd5+MmJ+CgaLuNeDjH5GRrIp9FGesD0CX1deJG0arH6mj3g1bz63e3l/7t7c7pU80LvolOiMG+jgUyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=THbvQWhv; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="THbvQWhv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747834497; x=1779370497;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=0d0faT2B5banWdiZ/l3sqpErt6iqic34exHZVRuvENE=;
  b=THbvQWhvBjDpKTcA6S3hsXQKYn8cijTQbHT7r1j53HsGe7r5ibIlvz6T
   kb6ThncIuepfke06Eq/5rXctoqUZLaCFxs4VelgTMJBL4phqLQ9APxZrH
   FVR2MPDgxVzgmQBqnwmjfR56vrBWNwEqPtqv3OkmZQrY+mZU1yPDlmLpf
   MIH4DIauxoFELlWQ216QujgUDKkUPlEXN75OqmAcNFVkCNpdrcUgJH5Vw
   ImpRUacOZyJJ+16v1x8sShOKMhUB363c7oC8smDHheTlt16bNnGCJ75MV
   gufHjDUyVNuMlwTeIYYzbVeL9hE6hUHvZ7RqV8L4g1DcR9oaBzwoUE53E
   A==;
X-CSE-ConnectionGUID: WnpJsLq7Q4SwsI4X//DzPw==
X-CSE-MsgGUID: F+P8RXt3QBa5secefUiL3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="61152631"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="61152631"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 06:34:56 -0700
X-CSE-ConnectionGUID: 0PtHDCRUSA2NvCJLTieJEg==
X-CSE-MsgGUID: cES3DGrXQEKFVBo9shEVnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="139927235"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa006.jf.intel.com with ESMTP; 21 May 2025 06:34:54 -0700
Message-ID: <f22dd1b0-fe1a-49a4-931d-15d57589b03b@linux.intel.com>
Date: Wed, 21 May 2025 16:34:53 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] USB: core: add a memory pool to urb caching
 host-controller private data
To: David Wang <00107082@163.com>, Mathias Nyman <mathias.nyman@intel.com>
Cc: gregkh@linuxfoundation.org, oneukum@suse.com, stern@rowland.harvard.edu,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250517083819.6127-1-00107082@163.com>
 <e6f782db-5818-4d6c-99e0-bcf300fc5b4f@intel.com>
 <49228bf7.a1d1.196f303aa15.Coremail.00107082@163.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <49228bf7.a1d1.196f303aa15.Coremail.00107082@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.5.2025 16.23, David Wang wrote:

>> Won't this still allocate a lot of unnecessary memory for the roothub urbs?
>> i.e. the ones queued with rh_urb_enqueue(hcd, urb).
>> The host drivers don't use the urb->hcpriv of those URBs.
>>
> The mempool slot is alloced on demand when hcd request private data with its urb.
> If a urb is  ever used by hcd and the  hcd requests private data with it, a  memory would be alloced
> and this memory will not be released until the urb is destroyed.

Ok, thanks for the clarification.
Roothubs URBs should be fine then.

Thanks
Mathias
