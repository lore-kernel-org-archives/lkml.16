Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB7928F52A;
	Tue, 15 Apr 2025 10:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744714408; cv=none; b=rOhECZlqcCHazPEwhOtvsaD+gzVs5nt2fCpFXV4cwfVGUJgUynxtl27l+d09v5s8ts88pN91AVirrVLJ2WqvUd/46CsxnpzxLd6x8L1mgd9KMKOh3iMvpzBzsfA5bITt8qS8b+m16NAlC+JSpyXlazLzZiWtqojBDaQwdgqDfBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744714408; c=relaxed/simple;
	bh=VX0wWt7bMqD9bUsByc+tN/8oYkNBL3uj3eMZ1AatQDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDCq75Q8xywMVqgZfeeCz8uWLu+IhdWMFIQkg5Me6fGg0MA1ZS94+QTjntwol1OtPTAwGofM70Sl7N/ukii+UcM9bF1FGct+BdnGQ6aYce7rkVl1rit/8HmwUcmsevv7ukZBpdntoZsU/VFUzMH8cewE65LOU7brYcYC0QXb++w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A46QmxFU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A46QmxFU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744714407; x=1776250407;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VX0wWt7bMqD9bUsByc+tN/8oYkNBL3uj3eMZ1AatQDM=;
  b=A46QmxFUg8FyEJyST0d7uhqBhs6kQKqn33pA6LvqpMq2QycZfaaGmX3/
   xIkqVJMLpHlvNlmv8O8WMjuMxBfEZZsOOWZi9Ogo4xBUmksySmDUX96WE
   C9ojM98S7DH5yr4Ar8/MDD5k/ToLtc2yTm0U6XfcjoycucTJRrGOyTfJS
   h1riORgH6oA5zEW6zBKpsnzYZsWm9zenqZTK8nsjxr6WDiw69UQpih4XB
   uTeOPOtiqAW9G6QiP0LgUEakEvgUaBKX+RvVaYxR85iuquoC0QrPcm7WG
   jMAil0O1yMc0vgJstLt3uA1mx/EZqKne8qZSNTls3N2Ew0bp8MsSeQL/x
   w==;
X-CSE-ConnectionGUID: 7mPV8F2SRu2SGPAK6lEaDQ==
X-CSE-MsgGUID: jtshkiSVSKupDnocrpMh4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="57208920"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="57208920"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 03:53:27 -0700
X-CSE-ConnectionGUID: A9iQzyZvTyaZpPYzhsod5g==
X-CSE-MsgGUID: UTw1h2zgTXGM8W/TNRaWmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="130055440"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa006.jf.intel.com with SMTP; 15 Apr 2025 03:53:23 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 15 Apr 2025 13:53:22 +0300
Date: Tue, 15 Apr 2025 13:53:22 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andrei Kuchynski <akuchynski@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] usb: typec: class: Unlocked on error in
 typec_register_partner()
Message-ID: <Z_46or5827D8xKm3@kuha.fi.intel.com>
References: <Z_44tOtmml89wQcM@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_44tOtmml89wQcM@stanley.mountain>

On Tue, Apr 15, 2025 at 01:45:08PM +0300, Dan Carpenter wrote:
> We recently added some locking to this function but this error path
> was accidentally missed.  Unlock before returning.
> 
> Fixes: ec27386de23a ("usb: typec: class: Fix NULL pointer access")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/class.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 3df3e3736916..67a533e35150 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -1056,6 +1056,7 @@ struct typec_partner *typec_register_partner(struct typec_port *port,
>  	ret = device_register(&partner->dev);
>  	if (ret) {
>  		dev_err(&port->dev, "failed to register partner (%d)\n", ret);
> +		mutex_unlock(&port->partner_link_lock);
>  		put_device(&partner->dev);
>  		return ERR_PTR(ret);
>  	}
> -- 
> 2.47.2
> 

-- 
heikki
