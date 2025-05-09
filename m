Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE927238C23;
	Fri,  9 May 2025 15:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746806221; cv=none; b=OpqFm63dszWuS46a5fus9PfXBx69GgnRvDHT35kcT9QScQHDtC1GeiGuucVTMsEu7BQr2f72HBba4C0D8hE1KFVQJftRoPeYVfSZ8F7hANK0RLFAPAjeKgg+xDo7vMjKHdaWpJJgSm4uhU4QCcHPmaVvWrPWAivAaxa1zPpTlco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746806221; c=relaxed/simple;
	bh=4mMQi+ar9Y/XRchAO1PB++JgRz1WqhE7rHNK/vjvPhw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hY6SOkfXYAWau5dLsyhbAABMH8KMbreUIeRw6l994v6u2UobOOVeX3prHpXhm3sn1o78cbwLZHkNvWy0yfzd9YXzV6p+GIY85HwtE1OtD6QlBFC9fMH4s7jFzx1A/okqaAwi6WLoG1lJrNIoL+wc70mx8d+gq248uRH79/sIIn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M4coL7tC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M4coL7tC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746806220; x=1778342220;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4mMQi+ar9Y/XRchAO1PB++JgRz1WqhE7rHNK/vjvPhw=;
  b=M4coL7tCGevKOTAQgjPEl7xjBS8ecWSlKTJLc1fg6Ee2PWNUHCp4eB77
   5mh8EnGGdTD6xIUZdFui36xx4ZdjLE5pCMrrxJkb1VReaGyS+yhQW1QDK
   p8+xSCVMJm2h5zz9wQ9Ce/mnKVesDALS784J+se14tN2MbJkTJda+ieCa
   qD49LSunF8R6kvskGZlbjWvXnQvA2oM1SqhE87KdcMXemuvry8Ago/2bx
   6g1LMZ4TxRJWgFXI6Bw74dwG443Dk5zm+qVOXYbUCeFw7CuKaogJesHOZ
   dLfxsoodl9PM4yVir2mbzdL/TO754NeCWTSctDAZFmIPN/D7EvjrPTNrM
   w==;
X-CSE-ConnectionGUID: L9T1+ZiJRPqrhDZRgPA7lg==
X-CSE-MsgGUID: cCa+x9UyQqWMgmn6ZQxXgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="47895757"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="47895757"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 08:57:00 -0700
X-CSE-ConnectionGUID: ikP0s5dKQR2cjqsQJ53lHw==
X-CSE-MsgGUID: lQ1Qrnz6SpuURTaGT2JcMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="136531157"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.244.219]) ([10.245.244.219])
  by orviesa010.jf.intel.com with ESMTP; 09 May 2025 08:56:58 -0700
Message-ID: <fb21da77-e27a-4a33-935a-d8a89ad398ce@intel.com>
Date: Fri, 9 May 2025 18:56:57 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH V6] usb:xhci: Add debugfs support for xHCI port
 bandwidth
To: raoxu <raoxu@uniontech.com>, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250509070712.276578-1-raoxu@uniontech.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@intel.com>
In-Reply-To: <20250509070712.276578-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Raoxu

On 9.5.2025 10.07, raoxu wrote:
> Hi
> 
> On 2025/4/2 20:31, Mathias Nyman  wrote:
>> We are currently in the middle of the merge window.
>> I'll try this series out on top of 6.15-rc1 once its released, and
>> then send it forward if everything works as expected
> 
> thanks Mathias Nyman,
> Is there any problems with the patch? If you find any problems
> during testing,please let me know so I can optimize and update
> the patch.

Patch is in my for-usb-next branch and will be sent forward upstream
with the rest of the features to the next kernel.

https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/commit/?h=for-usb-next&id=466b2e856fa25f517c37549fbbcea8b32fea57fd

Thanks
Mathias
