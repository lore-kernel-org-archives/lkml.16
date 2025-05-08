Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB232236E1;
	Thu,  8 May 2025 13:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746712188; cv=none; b=k2be4nEYOREOcPAXlOSSaS3p7RgDRfUoiQs40i3boxru+sy70dJVPzRwUGJyCy1fYMHTsgfK/r0Kkl0hFUJtS50VFwyumzWrdgKvw9+O0p9lEN1qqe/FckA8Sl1/R7/bFGphYkCXhApLBcE/iRhVAfewzaJqz7UX7ut2Ij4sifs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746712188; c=relaxed/simple;
	bh=xACFtUu3v8qXhgbi5basp7pkEXN+RSX82+EiPKqtDHI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UJb3jOznvkSWnGeB52GRMYPJa2GOKRZL8xt7YuqllS+pZYp8NwWOMnCdGygYBWkGaNLX3bHUysQFoWa2HFtk6OvFOigWVls+xIOX2f7MOq5F5AkT0c1MDAkoRExuU/7fOQ/TGLfFZcymotJ1Ql3Gwbzv4J4Zt56vIxby9G0dkcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FWyZaO9I; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FWyZaO9I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746712187; x=1778248187;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=xACFtUu3v8qXhgbi5basp7pkEXN+RSX82+EiPKqtDHI=;
  b=FWyZaO9I+3TrDWXWeKHBI79aGy0CUx0WaKe8uHA9zqrycw08n8xbvof4
   8zb2FS0UGIh7TRdFbDOA0tXJiSOKxV5A10Ea98mPCsv79fA+Or0//0dYN
   LLmslxFhTyqlt0g8Rc/EoJ1XtSbq1bMXFYEyOHqzWzRcmvY7rXY3FtExP
   gTFJSxgf7LTFO9Pz2mEhySAJ2SB7xkCozmLqhMtpUWroXiSuRVZuNbFsd
   T+lRBEDBk5iiHdYAMtvlfaU+g74zm+khhip3nRoKs1Cy6GB4EEEdwSYMf
   7w65Y0E8U278pg6cPuYdezpIcRr0dKsfaxWqHFBaVOYfwD2iBQGbBzttG
   g==;
X-CSE-ConnectionGUID: 4wZF+iZdQYG/vIuvIUWjMw==
X-CSE-MsgGUID: kFMBo21XTZ67u8CgTm8AXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52304826"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="52304826"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 06:49:46 -0700
X-CSE-ConnectionGUID: dpjBy9Z7R2ive2NcWv9j1A==
X-CSE-MsgGUID: JmOmzARwQFChPnQ22p1Hww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="136310013"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.196])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 06:49:43 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 8 May 2025 16:49:39 +0300 (EEST)
To: Dan Carpenter <dan.carpenter@linaro.org>
cc: =?ISO-8859-2?Q?Micha=B3_Kope=E6?= <michal.kopec@3mdeb.com>, 
    Hans de Goede <hdegoede@redhat.com>, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] platform/x86: dasharo-acpi: Fix a couple off by
 one bugs
In-Reply-To: <aBtZBLNXxaYxMIMr@stanley.mountain>
Message-ID: <7dac833b-5a47-d168-38b9-ece2d5de2ae5@linux.intel.com>
References: <aBtZBLNXxaYxMIMr@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 7 May 2025, Dan Carpenter wrote:

> These two > comparisons should be >= to prevent reading beyond
> the end of the array.
> 
> Fixes: 2dd40523b7e2 ("platform/x86: Introduce dasharo-acpi platform driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/platform/x86/dasharo-acpi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/dasharo-acpi.c b/drivers/platform/x86/dasharo-acpi.c
> index f10f52e44641..f0c5136af29d 100644
> --- a/drivers/platform/x86/dasharo-acpi.c
> +++ b/drivers/platform/x86/dasharo-acpi.c
> @@ -101,10 +101,10 @@ static int dasharo_read_channel(struct dasharo_data *data, char *method, enum da
>  	acpi_status status;
>  	u64 val;
>  
> -	if (feat > ARRAY_SIZE(data->capabilities))
> +	if (feat >= ARRAY_SIZE(data->capabilities))
>  		return -EINVAL;
>  
> -	if (channel > data->caps_found[feat])
> +	if (channel >= data->caps_found[feat])
>  		return -EINVAL;
>  
>  	obj[0].type = ACPI_TYPE_INTEGER;
> 

Thanks Dan, I've folded this into the original commit as I was rewriting 
history anyway due to some other fixes.

-- 
 i.

