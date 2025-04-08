Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9D01CAA86
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744152514; cv=none; b=RhwHOAL0vTYgyTUotNHlA7emawngf0kjNhmgrotGX+VgW1c57Wk4O9oC6y325skkxOb+523UxtY1EY2Ft7wEMU8RcxVraw0qrSxG5VfBEtHAX6D+MYgUgMJvAj11KAASaxipmAMa9HW+TFywBpkX5EKrodJyAw96uoxNZWxq868=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744152514; c=relaxed/simple;
	bh=prozXevKzEFPeI4skV5Mr12FJCIqh0bNJbYahYXGSEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OVuMI2IQrw4mFXxJCmuboqt7coL1XR/GiNUk+WuHTu9qgp+3EUwSPpcof89MMB+fCa6g9jY5TLy4P8N7qa2DAUk09U3Xd8vPoSv2yAfFW9IDXflVK/2fHeEoLlcyl8HH1TB/FB3Z7ypkJWwu8dcmedwNJBMD1fOxVpxHzpTqKWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QrWrmJjI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QrWrmJjI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744152513; x=1775688513;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=prozXevKzEFPeI4skV5Mr12FJCIqh0bNJbYahYXGSEk=;
  b=QrWrmJjIUzc05rOBa447Z5wMdm2Zz4S671qaVotfKJ38kzg9YmKP6/HI
   EPhWIEhE0FoQ8wnixk1ttpZyzNM/XBXwhTZN0GT29kj0AXGSEKGjZCxQe
   4EAnPU61D90tn548IRtzXsQTv7VnmyWRGPwXreAnzBGuwRWExsuv5wZpi
   QNTHh/CRLGeHDAH8FBFgIzPDvyPPSR7+G6bFnhfmm/7jgY7jnFNBauWa5
   smq/00TZyl6gX2VPmiG3A7M8ylHyCkch3OId40iYALncqhWqhUIzLGGkY
   auAj3ZFl6NPQFvzberCQ29N3Y3O9UV9FpCwhX7ekFc4or9eoZGV9n1FDe
   g==;
X-CSE-ConnectionGUID: /pPi3UD6TPWGQ4NvzFSBgQ==
X-CSE-MsgGUID: gw0+YmGZS6GbKa53YWPDkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45769890"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="45769890"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 15:48:32 -0700
X-CSE-ConnectionGUID: tKeTXejQQ3m6gjfa3IHtgw==
X-CSE-MsgGUID: fDDCOOowTCOCZGfRBCXS8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="132531402"
Received: from tjmaciei-mobl5.ger.corp.intel.com (HELO [10.125.111.184]) ([10.125.111.184])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 15:48:31 -0700
Message-ID: <2311746f-4116-4df6-81b8-d9f30071af8e@intel.com>
Date: Tue, 8 Apr 2025 15:48:30 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH fwctl] fwctl: fix repeated device word in log message
To: Shannon Nelson <shannon.nelson@amd.com>, jgg@nvidia.com,
 saeedm@nvidia.com, Jonathan.Cameron@huawei.com, linux-kernel@vger.kernel.org
References: <20250408223300.24561-1-shannon.nelson@amd.com>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20250408223300.24561-1-shannon.nelson@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/8/25 3:33 PM, Shannon Nelson wrote:
> Remove the repeated word "device" from a dev_warn() message.
> 
> Signed-off-by: Shannon Nelson <shannon.nelson@amd.com>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>

> ---
>  drivers/fwctl/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/fwctl/main.c b/drivers/fwctl/main.c
> index cb1ac9c40239..bc6378506296 100644
> --- a/drivers/fwctl/main.c
> +++ b/drivers/fwctl/main.c
> @@ -105,7 +105,7 @@ static int fwctl_cmd_rpc(struct fwctl_ucmd *ucmd)
>  		if (!test_and_set_bit(0, &fwctl_tainted)) {
>  			dev_warn(
>  				&fwctl->dev,
> -				"%s(%d): has requested full access to the physical device device",
> +				"%s(%d): has requested full access to the physical device",
>  				current->comm, task_pid_nr(current));
>  			add_taint(TAINT_FWCTL, LOCKDEP_STILL_OK);
>  		}

