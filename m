Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440A035972;
	Mon,  7 Apr 2025 13:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744034220; cv=none; b=J0ISte1BkxxENFUQJXLU5DU7Q2SBkMOQQMUy17E8Vzti9tbO3cWWq6ZlDQMtCgMwaA3kzBhcWW33JTn5oUZVrVuIbo4glGRLLrORugX2isR+yoqXNX3KaOoFc4+ytBrQCAGLQzlxBKn1mHGY4Hd1SrEbIqYgVaPacUo6hjdNcWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744034220; c=relaxed/simple;
	bh=8rrW/8LF+uQZ+ilbW3GuDDQbfeborWsQoNXyo+zSF8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zgg25HZjz7xqbriM9w0pKl3lO7MuIkZtu/4xPX4p35kYnnpbPFSaZMtxe75fUN6LXsZexY/gDgJn2fBSnQQFN/FP9p620L9X3Tfs/kaKDl5ugEZ+3A9Lwd2G3N+ASebMPMdEwQYTQKrFshiu6clv0GFQWQY30OgcYPhpjl33Fgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NUuV+LDb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NUuV+LDb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744034219; x=1775570219;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8rrW/8LF+uQZ+ilbW3GuDDQbfeborWsQoNXyo+zSF8A=;
  b=NUuV+LDbBxzYFyaICS7PRngUKjZiYVSTKFRKeemk2/JW1PhPVlOQ9lyH
   BDTPGB+dUDQ5ghYfrnFIYPM+rUqCSneSQs82U2uyOcooQ0qUwIwk2Z8Z5
   857Xph4CghszgauHNfFK9qlAd13Qhf79zbcGreu7oMQ4vRQSTFL95O5ti
   8nEOuOKPokNL5s0ilBwLyThEQDvjN8V5zUuodlMXuk0DtFVbaToktmuuN
   4Shvu1ZU66VZ2TRMJuMrK0aCn0ink22+ATVvIRj5jSRTWeJN9w3cznb9+
   MvHTYlEC+WT0rO1i5Ez/Ele1bUU/6j8sEc5Q16JLO1kGmjT7nXpljKdSd
   Q==;
X-CSE-ConnectionGUID: ij2YuH9HSqaehxwCBMMSOg==
X-CSE-MsgGUID: sqUJSoPfS+qMGYEEaexRfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="70797736"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="70797736"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:56:58 -0700
X-CSE-ConnectionGUID: AYLFC7sWTmqvatay9tLaMA==
X-CSE-MsgGUID: HAxXgHPoTfeGbJ09f9lxHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="132816801"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa003.jf.intel.com with SMTP; 07 Apr 2025 06:56:56 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 07 Apr 2025 16:56:55 +0300
Date: Mon, 7 Apr 2025 16:56:55 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: typec: tcpci: Fix wakeup source leaks on device
 unbind
Message-ID: <Z_PZp4pL8MVS_QMv@kuha.fi.intel.com>
References: <20250406204051.63446-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250406204051.63446-1-krzysztof.kozlowski@linaro.org>

On Sun, Apr 06, 2025 at 10:40:50PM +0200, Krzysztof Kozlowski wrote:
> Device can be unbound, so driver must also release memory for the wakeup
> source.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I this should be marked as a fix. In any case, FWIW:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpci_maxim_core.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> index fd1b80593367..29a4aa89d1a1 100644
> --- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> +++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> @@ -536,7 +536,10 @@ static int max_tcpci_probe(struct i2c_client *client)
>  		return dev_err_probe(&client->dev, ret,
>  				     "IRQ initialization failed\n");
>  
> -	device_init_wakeup(chip->dev, true);
> +	ret = devm_device_init_wakeup(chip->dev);
> +	if (ret)
> +		return dev_err_probe(chip->dev, ret, "Failed to init wakeup\n");
> +
>  	return 0;
>  }
>  
> -- 
> 2.45.2

-- 
heikki
