Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90B1245029;
	Thu, 17 Apr 2025 13:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744897046; cv=none; b=WZHRavQsSm2u0UYz53G0BsTtLBAoWb/TnvrT+neiHzr392tg2JIIRy517RznQoDNBEpItvw2sTGPplUB6m/rT71DcAy8M1sV8eGKex04Nuj1UDpleT7Z9R62H59IeXfvtUXmuhB2/htsoNN6skkZq2wU2kE9duurcNTXil1fxOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744897046; c=relaxed/simple;
	bh=fUyLr8YgHE9WXqKlS1L6XVZ6KXlv9caX9LxOVPeiOJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWeejBpPtzVKVcqzIZkuJbEvRlU8H9xZI/Mxs6VXNRIZSB8xjdXRIgFDDC2ewrkfJ9shNvJHdOZ6Fj3dluxg636keMc9pNOSiEz2PgZRarBGNmi0Jqam2iT3rQrIJlbbT6I2EywVXr6C08s++11HmLsfjLW8eNoQsFIUjXh+c0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bwX44Z2K; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bwX44Z2K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744897044; x=1776433044;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fUyLr8YgHE9WXqKlS1L6XVZ6KXlv9caX9LxOVPeiOJo=;
  b=bwX44Z2Kp1uKT4HMF5NnTKl6eM3ZXq+auEXx3wXv97mvLyCknv19ZrfV
   l+IS1YnhEluN/wlyKwi2ODuTx0tUkTKuv6x/45LfFXEs8QzGRkaUjEDSI
   WHwg7M5ZHHMQJxtD5atgAMeuq2dWrGAUiJHdMqqlBLs/llOWffsJ8govB
   6q7WUwihJeVi6jrRn10xneA+3zo6iNeI3HeLHtGNItG/wIEPfgxspdoOT
   5BcWvZYnXldjTsLxoMqIr4Y07xmxfVLflr+cQaMki4fEAXIvusBhJawGF
   1e5qmdS1BMCU2rM8wF0tQjZb3d7O2PQ4AHkw9UmflS4SqZk4ElKrMjN0d
   w==;
X-CSE-ConnectionGUID: lqvrhAA1T7KMy3sTjiI8Hw==
X-CSE-MsgGUID: vpZna2sUTLiw1UvN2OoXPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57477612"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="57477612"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 06:37:03 -0700
X-CSE-ConnectionGUID: x3HdXonzSD6GKnSQB1/slw==
X-CSE-MsgGUID: pEpsii+HTtSbi9Pb5NZRNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="131346918"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa010.fm.intel.com with SMTP; 17 Apr 2025 06:36:59 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 17 Apr 2025 16:36:58 +0300
Date: Thu, 17 Apr 2025 16:36:58 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@linaro.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: huawei_gaokun: add error checking
Message-ID: <aAED-hlyVvbSXoJn@kuha.fi.intel.com>
References: <20250415172006.126740-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415172006.126740-1-mitltlatltl@gmail.com>

On Wed, Apr 16, 2025 at 01:20:05AM +0800, Pengyu Luo wrote:
> 'cci' may be uninitialized, adding error checking to fix it.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/Z_44zoTyLLdXNkKT@stanley.mountain
> Fixes: 00327d7f2c8c ("usb: typec: ucsi: add Huawei Matebook E Go ucsi driver")
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> index 344aa7aeaf..7b5222081b 100644
> --- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> +++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> @@ -359,6 +359,7 @@ static int gaokun_ucsi_notify(struct notifier_block *nb,
>  			      unsigned long action, void *data)
>  {
>  	u32 cci;
> +	int ret;
>  	struct gaokun_ucsi *uec = container_of(nb, struct gaokun_ucsi, nb);
>  
>  	switch (action) {
> @@ -368,7 +369,10 @@ static int gaokun_ucsi_notify(struct notifier_block *nb,
>  		return NOTIFY_OK;
>  
>  	case EC_EVENT_UCSI:
> -		gaokun_ucsi_read_cci(uec->ucsi, &cci);
> +		ret = gaokun_ucsi_read_cci(uec->ucsi, &cci);
> +		if (ret)
> +			return NOTIFY_DONE;
> +
>  		ucsi_notify_common(uec->ucsi, cci);
>  		if (UCSI_CCI_CONNECTOR(cci))
>  			gaokun_ucsi_handle_no_usb_event(uec, UCSI_CCI_CONNECTOR(cci) - 1);
> -- 
> 2.49.0

-- 
heikki
