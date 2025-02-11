Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE2B26BD94;
	Tue, 11 Feb 2025 08:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739263642; cv=none; b=TJScU8zeOW0g1y7VZ46sPGyI+/M3sQt4Cx0FaCd2oB1FDM2upaK8TsBY6jesnGzcuUPkd6gabHZR6rJKuHTnppUcz4D/nLlR7pdZs7DoyS0ot2JsYGhwNs9O+I+saIQK0VmCdgrArmt74SKp4W9R9t7WDjY4lfWTuSdHYzyuftI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739263642; c=relaxed/simple;
	bh=O2n4k7Gt1NVYYJ2SAPrLTlEttn/2uOimh2XBrjHMAOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sM2uMCJQW7RmQdUfHoaCoEoxxGWTh4pYtdn6gXewBscw4Xqwfb492u1/OeWUhZP0eM77J200xP93DAIoJFx/56BJutEvE1vVcu7PtU6qGT4N0oASMFSPNlkkREHDCt+nPtk9tdRXmLkUIvxYggH9cmFm8oyUVSSnrHjyuae9MPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NWhTf39D; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NWhTf39D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739263641; x=1770799641;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=O2n4k7Gt1NVYYJ2SAPrLTlEttn/2uOimh2XBrjHMAOk=;
  b=NWhTf39D0uOtxD/FEn09BIAe59uKCCRBlzWMm4Y7fMt0vNLgDwg3T+ka
   WkezHWwJeZeL2MHpMHoc/W1i7EIx38LyteuAov5Ho1guOkVnyOd5ytkGS
   5ZogBRN2rZR90fXZLAQto5oWzCBy1dmw7D76LkbOSC9mOMQFBoJKKWgMd
   dYDQzmbYoppTRLGLY+si+AjSUGb+CM4hNv1qMb8LjbsrTAmQCi57jpRSP
   KoGdFgt7PbR6fRWu/Xt9AGbsShQvm/1riA8aqY4xWzvOGU1E1nLN+U2QT
   W2FgYOGbHiLxX1v8IoQYqFzcwAtNkMJ0YQJB/SbabFAUSo46rm6x7BUfm
   g==;
X-CSE-ConnectionGUID: IxQBbiFTQ2myHXnRo7ZqKA==
X-CSE-MsgGUID: GPQutLocRiW4wPqv1Sig4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50099554"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="50099554"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 00:47:20 -0800
X-CSE-ConnectionGUID: fc5CPoz5SYuvotnO9i1Nuw==
X-CSE-MsgGUID: 3e5LvWukQHyPSy2STXvTRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="112662467"
Received: from unknown (HELO [10.217.160.151]) ([10.217.160.151])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 00:47:18 -0800
Message-ID: <d459faf0-a180-496a-a809-db5b5a247e94@linux.intel.com>
Date: Tue, 11 Feb 2025 09:47:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/amdxdna: Add missing include linux/slab.h
To: Su Hui <suhui@nfschina.com>, min.ma@amd.com, lizhi.hou@amd.com,
 ogabbay@kernel.org
Cc: quic_jhugo@quicinc.com, George.Yang@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20250211015354.3388171-1-suhui@nfschina.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250211015354.3388171-1-suhui@nfschina.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 2/11/2025 2:53 AM, Su Hui wrote:
> When compiling without CONFIG_IA32_EMULATION, there can be some errors:
> 
> drivers/accel/amdxdna/amdxdna_mailbox.c: In function ‘mailbox_release_msg’:
> drivers/accel/amdxdna/amdxdna_mailbox.c:197:2: error: implicit declaration
> of function ‘kfree’.
>   197 |  kfree(mb_msg);
>       |  ^~~~~
> drivers/accel/amdxdna/amdxdna_mailbox.c: In function ‘xdna_mailbox_send_msg’:
> drivers/accel/amdxdna/amdxdna_mailbox.c:418:11: error:implicit declaration
> of function ‘kzalloc’.
>   418 |  mb_msg = kzalloc(sizeof(*mb_msg) + pkg_size, GFP_KERNEL);
>       |           ^~~~~~~
> 
> Add the missing include.
> 
> Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
> v2:
>  - move the header to the include block above and keep it sorted(Jacek Lawrynowicz).
> 
>  drivers/accel/amdxdna/amdxdna_mailbox.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
> index 814b16bb1953..e5301fac1397 100644
> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
> @@ -8,6 +8,7 @@
>  #include <linux/bitfield.h>
>  #include <linux/interrupt.h>
>  #include <linux/iopoll.h>
> +#include <linux/slab.h>
>  #include <linux/xarray.h>
>  
>  #define CREATE_TRACE_POINTS

