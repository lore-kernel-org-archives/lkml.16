Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE8C22DFB5;
	Mon,  7 Apr 2025 12:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744030343; cv=none; b=NUkk477YZonde5uMF2yvJE+JyTAGeTUBI4U18HW+AHd+knvNYIw++sfyr8CyrEtPw8Vpk0tJC3tQpcfCjPe87S2KeNgOv+7QPmeucGxUlfl78pRMH2a1R9jwzq7RbgSgNWHvaTC6vmBP8OibGm5cXOHak13GGlU/ALsVMvgyv2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744030343; c=relaxed/simple;
	bh=sGo3EhVbOBoCOrccBnR2rUVfk/lMIZH29CwNa8zWza8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SzbJBY7hgR7ovfUGsPW5I1KNssYcAOIdzwHcz2w20IhvUeYyqDoARt32gBJjXOczYbBB1MOWcU9hNlD9qnDBCXLRZ3BVx9s7wEn9uwlp4cnwesmB/W9WUGBSO9BEJ7vgvkUOnkRam/gzkDGmZs3AquduGCEC07kiXQkT9BPuxM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FFWGilCJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FFWGilCJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744030342; x=1775566342;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sGo3EhVbOBoCOrccBnR2rUVfk/lMIZH29CwNa8zWza8=;
  b=FFWGilCJsxgs94JLDo4/bkO+AiFsL7/nKzsyD89rcsPqeUlu4G0aX94b
   kwm+SfAD6rhuyCB8mwBYehnS4LmpytIyDqks6Y9d26hNhQBrosl4jH9xB
   4XfuNbwPqw8x+ao88xa3U3BiPujv6RAUPC5HHZvjiZiraPP/zRv1rD8Fe
   JAbqikA5rQiHgL/Y60rnOx0xkdhdujeQl3ojDyDSnk4drEGZ/xLzBZVo7
   ZP0KjZIFDNRSVOnPykBIG35IjLZ2v3GYDJVQjeYci8o/3UUTRtKkqRLRF
   H/CJ4/pl7usOtMNY9JZYuVtW/pPNuV5e5FOWVh2OHG82RalQS/QquY5GH
   Q==;
X-CSE-ConnectionGUID: P9m+MzsjQ4S2Zw86zeVeZg==
X-CSE-MsgGUID: Y2HgsFpsQPWIVP5kfbrCtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56780659"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56780659"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:52:22 -0700
X-CSE-ConnectionGUID: xqEE71+iTrmzcLc8ENbgQQ==
X-CSE-MsgGUID: cPg0NZtIQzSiSLtKp8xAHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127809359"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa006.fm.intel.com with SMTP; 07 Apr 2025 05:52:19 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 07 Apr 2025 15:52:18 +0300
Date: Mon, 7 Apr 2025 15:52:18 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH] usb: typec: mux: do not return on EOPNOTSUPP in {mux,
 switch}_set
Message-ID: <Z_PKgnPDpWPrrEK3@kuha.fi.intel.com>
References: <20250404-ml-topic-typec-mux-v1-1-22c0526381ba@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404-ml-topic-typec-mux-v1-1-22c0526381ba@pengutronix.de>

On Fri, Apr 04, 2025 at 12:21:01AM +0200, Michael Grzeschik wrote:
> Since the typec connectors can have many muxes or switches for different
> lanes (sbu, usb2, usb3) going into different modal states (usb2, usb3,
> audio, debug) all of them will be called on typec_switch_set and
> typec_mux_set. But not all of them will be handling the expected mode.
> 
> If one of the mux or switch will come back with EOPTNOSUPP this is no
> reason to stop running through the next ones. Therefor we skip this
> particular error value and continue calling the next.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/mux.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
> index 49926d6e72c71..182c902c42f61 100644
> --- a/drivers/usb/typec/mux.c
> +++ b/drivers/usb/typec/mux.c
> @@ -214,7 +214,7 @@ int typec_switch_set(struct typec_switch *sw,
>  		sw_dev = sw->sw_devs[i];
>  
>  		ret = sw_dev->set(sw_dev, orientation);
> -		if (ret)
> +		if (ret && ret != -EOPNOTSUPP)
>  			return ret;
>  	}
>  
> @@ -378,7 +378,7 @@ int typec_mux_set(struct typec_mux *mux, struct typec_mux_state *state)
>  		mux_dev = mux->mux_devs[i];
>  
>  		ret = mux_dev->set(mux_dev, state);
> -		if (ret)
> +		if (ret && ret != -EOPNOTSUPP)
>  			return ret;
>  	}

thanks,

-- 
heikki
