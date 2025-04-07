Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B414A21;
	Mon,  7 Apr 2025 13:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744034301; cv=none; b=qlK7yTYUqnb+K5fFGMmLlR2rs1/alUKkDCQ20HPWQxaFVRA+Cx+BCQqILR9TexLWRhGGEMSSv+xvVDdGh2KXom+Vda0tOD3DNkY6lsUry5A0OehDT1dzjcv6r/qNoxC0UWgs/guIHmzDjuDJ/ubcNQfsw/jxi05tIeh8sp4RyZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744034301; c=relaxed/simple;
	bh=9LcCqgFye581untHJfCQUR7Br3ttqzyaascOgr5Ojt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UB0TgGcxiSaGtpi/t+//U6t82mU4HE8Guy6lBJXHbJzyMm5HOiXOfs33WF0WBFLK4nhpWWSEVuWrw2UPPJ6rcDBrJFeZrtwzJVpZ3pP92ANMllAUIKkaBdB9I/ldKwVpsOywyCEfPQsyEAqr5cgvRIgCD0V+qPHkqUa9+rk7+FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZbTfmyP; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZbTfmyP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744034300; x=1775570300;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9LcCqgFye581untHJfCQUR7Br3ttqzyaascOgr5Ojt0=;
  b=iZbTfmyPACn8pyW8Yz44aQd9Yp7SfRrwd0yDTzYEIFdqZjMizv5znI2l
   KL7D+P9/ZlBPEA7/WdAot5wQwvaO+j7XEqSxOoYf4S0L+eIpjKk7/+k8H
   mWDY0zSncardgmQY6WQp/QNwKmpfELt2DLvIEun9Y0+z/0qVHXMZhsIvA
   qgMuzhOMZhK7GbdntMAv6bz8VgomS+77SYvpHQIywNTTttsFW75uUDn0T
   gQPwcjyAw+2yFPjaiWySO7ucwYSsX/SdEHPWIJ4Qo/wtypfJRudZ5H8g4
   F4/4WdVULaPX5804+2x+tuHIhRDEmBxVCFaby19cOvwb/+fvhlUTdL/eN
   w==;
X-CSE-ConnectionGUID: AGJiJPVxT7OBhXwuRXHrYw==
X-CSE-MsgGUID: ksUE/jl6RNC5f/bdfIwTJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56789209"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56789209"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:58:19 -0700
X-CSE-ConnectionGUID: n5f30ISiQgG7Dcd58pI+XA==
X-CSE-MsgGUID: IBgiIsYwTyaAZ8r7djSHAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="151153788"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa002.fm.intel.com with SMTP; 07 Apr 2025 06:58:18 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 07 Apr 2025 16:58:16 +0300
Date: Mon, 7 Apr 2025 16:58:16 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: typec: tipd: Fix wakeup source leaks on device
 unbind
Message-ID: <Z_PZ-KHlY-T9YMc6@kuha.fi.intel.com>
References: <20250406204051.63446-1-krzysztof.kozlowski@linaro.org>
 <20250406204051.63446-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250406204051.63446-2-krzysztof.kozlowski@linaro.org>

On Sun, Apr 06, 2025 at 10:40:51PM +0200, Krzysztof Kozlowski wrote:
> Device can be unbound, so driver must also release memory for the wakeup
> source.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

The same comment here - this should be tagged as a fix.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tipd/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index 7ee721a877c1..dcf141ada078 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -1431,7 +1431,7 @@ static int tps6598x_probe(struct i2c_client *client)
>  
>  	tps->wakeup = device_property_read_bool(tps->dev, "wakeup-source");
>  	if (tps->wakeup && client->irq) {
> -		device_init_wakeup(&client->dev, true);
> +		devm_device_init_wakeup(&client->dev);
>  		enable_irq_wake(client->irq);
>  	}
>  
> -- 
> 2.45.2

-- 
heikki
