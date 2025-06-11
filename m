Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F77282FA;
	Wed, 11 Jun 2025 10:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749637282; cv=none; b=KZ+aa4LoWE0co3OviVWtRCz+3XjNa/fHSdAmAzLDQ/xxLQh3mpOplCh3tWb8ha2gAkD0IKrLaqAel8QsKsyWKQmL1QVm1nz/PHfVZEiARV7HvJmLtWVB4EBP0+s18m1g7BBszDkU65ATA6mhvuO7HhTenD5GMJySvv2cCvStii0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749637282; c=relaxed/simple;
	bh=T9VrFQv/NeLSLK+q9Ecj7niBwwBsl1o+NOb3R8Du03Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gdEFX8EGkzvlAau4k+wV+X4+2ly75xuTHs+R4i5/e6IFBChtFTut71Yl0p5PWtTq3RcZtp2wsl+60SivuZp4rH3v9idcp8W4tGkNmeLf/Ac6kzHJILE+KvXZmcUrAH1tjGmKWYDSNBA+tJOT6RryXRrPkx7PrLhuzBp/eHnG/0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XJ0YgZSU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XJ0YgZSU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749637281; x=1781173281;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T9VrFQv/NeLSLK+q9Ecj7niBwwBsl1o+NOb3R8Du03Y=;
  b=XJ0YgZSUrS50B/qespSNLdWixehhDrG6hcDSDCLFZylLOssqeaHWwIm8
   wCdVwVwJlJJNRikf74eK2MaD071P5OubkIfcY/3deg9f3JrcrMhLrSFiC
   vKdkqpDNeV8hIvmII4AVLkxUF2JMykM+t3pr6q0AJcjcfk3chMMfGCPXt
   U0Ph/rB+1UdVXwNRCssrmf7IVMRy80cWiZY6EWmVlwsX58y5NeP3xusGC
   BYGzLTFMmpUWUeC+drKE3NPPpW36f7sGJaAIlL0wWAdeT+FDBvLVmY01c
   aaAI/XZPO+IiNsMSXFHSY/L95aTzP3NJa5ibau7lehgqEqpAjuxQFLdIR
   Q==;
X-CSE-ConnectionGUID: 6dULxx1XRDKec37zlXFtbA==
X-CSE-MsgGUID: mlnB3qGDRPaYBgDzs1o3fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="69215072"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="69215072"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 03:21:20 -0700
X-CSE-ConnectionGUID: o1L4NfMpQvm7DoQPy7hncg==
X-CSE-MsgGUID: C6eYI9dvRfSlyUXXVpZidg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="184357097"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa001.jf.intel.com with SMTP; 11 Jun 2025 03:21:18 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 11 Jun 2025 13:21:16 +0300
Date: Wed, 11 Jun 2025 13:21:16 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Tomasz Michalec <tmichalec@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Konrad Adamczyk <konrada@google.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, chromeos-krk-upstreaming@google.com
Subject: Re: [PATCH] usb: typec: intel_pmc_mux: Defer probe if SCU IPC isn't
 present
Message-ID: <aElYnJOpoGbrg-6u@kuha.fi.intel.com>
References: <20250610154058.1859812-1-tmichalec@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610154058.1859812-1-tmichalec@google.com>

On Tue, Jun 10, 2025 at 05:40:58PM +0200, Tomasz Michalec wrote:
> If pmc_usb_probe is called before SCU IPC is registered, pmc_usb_probe
> will fail.
> 
> Return -EPROBE_DEFER when pmc_usb_probe doesn't get SCU IPC device, so
> the probe function can be called again after SCU IPC is initialized.
> 
> Signed-off-by: Tomasz Michalec <tmichalec@google.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/mux/intel_pmc_mux.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
> index 65dda9183e6f..1698428654ab 100644
> --- a/drivers/usb/typec/mux/intel_pmc_mux.c
> +++ b/drivers/usb/typec/mux/intel_pmc_mux.c
> @@ -754,7 +754,7 @@ static int pmc_usb_probe(struct platform_device *pdev)
>  
>  	pmc->ipc = devm_intel_scu_ipc_dev_get(&pdev->dev);
>  	if (!pmc->ipc)
> -		return -ENODEV;
> +		return -EPROBE_DEFER;
>  
>  	pmc->dev = &pdev->dev;
>  
> -- 
> 2.50.0.rc0.604.gd4ff7b7c86-goog

-- 
heikki
