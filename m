Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E8225EF9F;
	Wed, 25 Jun 2025 13:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750858126; cv=none; b=sUigTQokxK5SG72qe9t5gXNmovpTgom5vmydk1Kj4a2zZeuVAkNzzOVoe9j3L88cTXGwLQixbi3OJBcyK0o1V/+5nWc/SkOFsqZVK8jwGnr21OIRvYKoNx+NzDfRqGo3PNwSghnHgpIuawPexcX28RdzZYeIu/HXvI2sfExmRug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750858126; c=relaxed/simple;
	bh=62h9+mmR/yqIV+vAcnnuDvb85ZGQRZFNoHQPMh5yS9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dH3ao2y/5y0JF3N9t/233IGltwDjon6ZDg6H/KoBrVc+/rVWM5sZJpuM1jx5Xhnon6Q0RdQSMV4uPZEGJTLKh4FuaX8wjbpnWoFxtrR4trNWGYttxmPCFVWlAo402r31xvWo9QQ98ZCxK/0IW/ppWxv/5M+/PsSSUQkJ/e694bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WmuKIXSd; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WmuKIXSd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750858126; x=1782394126;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=62h9+mmR/yqIV+vAcnnuDvb85ZGQRZFNoHQPMh5yS9Q=;
  b=WmuKIXSdrOZ1AdUhBZzRNjtSnLVR5qaTCqe4H5kqO+dbqBhFNke1YmSM
   HbI+BZTJc1DY0aW1G1oLAV+lA/mCMYJ79XJUqMqH9Kegzogt1rEl3mzZb
   OXOMm+vCzqO/F1CoBGs1UeXaD3W+U8fbmV8S/I62aXzvsLaKPmg/2+ACA
   bL8bJ9dph5gDExqUQ2+gJcABPu+2n96/5icZbJ5Y0XTXPQJpyzeWZcJwN
   QmJtWWty74r7crZo0MOEG/uVwuZSrzzX8G+Pid99Cvg0GWXmbewU0XF7Q
   qMQlcw+wFB/CECBm3L7awor9cre7jU0naTQbnSt31tfahBSBZNLGbv0hz
   w==;
X-CSE-ConnectionGUID: mDlXb/0yTv6WnXh2ljEpmw==
X-CSE-MsgGUID: VR5qCu7HSTucFoKIESzvnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="64188025"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="64188025"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 06:28:45 -0700
X-CSE-ConnectionGUID: oHAUkRg3ShOQmQVsPlkgBg==
X-CSE-MsgGUID: 0YLCkC5LSLGk/UypnOPucQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="156247566"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa003.fm.intel.com with ESMTP; 25 Jun 2025 06:28:43 -0700
Message-ID: <6cc5cda8-80b1-4399-afe1-7c59673d0e64@linux.intel.com>
Date: Wed, 25 Jun 2025 16:28:42 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] usb: xhci: Set avg_trb_len = 8 for EP0 during Address
 Device Command
To: Jay Chen <shawn2000100@gmail.com>
Cc: gregkh@linuxfoundation.org, jay.chen@siemens.com,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 mathias.nyman@intel.com
References: <20250521114047.18001-1-shawn2000100@gmail.com>
 <20250621132205.4617-1-shawn2000100@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250621132205.4617-1-shawn2000100@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21.6.2025 16.21, Jay Chen wrote:
> Hi Greg, maintainers,
> 
> friendly bump — anyone any thoughts?
> 

Added to queue

Thanks
-Mathias

