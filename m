Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF8919D060;
	Mon,  7 Apr 2025 13:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033931; cv=none; b=tGRdPmlFVhenWJ+CPo/UK1u2J0Im/+zQAQa8+k55ZHIG4PGx25O2dsZ1UMJpdvjwvZRFmA8KBW3qxJw1cVukLDc4CQ0yQvw9KYR675NjijwOKA5kB4vaLw1jTtH9Iy2H4KjLTlNzCEeOveXHiN6jbcQPsGOH1JNpMkpT4EAhjaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033931; c=relaxed/simple;
	bh=y+c8QiAjEMS2q89sfnStlQVZ1zqvw66HAR7EOr7Z5Nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cb7XliVN8eWpUFITpFlrPGP9ApCUUnBCMgWHXp/3c3kgCp8QrVof2sp2/EyeeWKcm3BI4Cw6g/dxL8sC4iEDyzpv3kkbWyzkUoJx35p+NQUo3jovDUIadk32qt0G2rV7orVaxSCSr2rAZetTKdqOP2BilrdmhfOlpvL6h8Txtiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ca47zA+P; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ca47zA+P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744033930; x=1775569930;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y+c8QiAjEMS2q89sfnStlQVZ1zqvw66HAR7EOr7Z5Nc=;
  b=Ca47zA+PCER48nt/+09d3NqApN8JyIRuLWz5m/VbJqzxEJGdZ/xqshcO
   nwHDUlXKSOC6GMWBljjw2HDw8d2wrn0PwoMr8uy0HxGjVtI2HB/nbprSY
   5DOdMstftKcCrv5/AQC1fYVqzmC63Af6DvjI9Lsteh6yc/2UoXioH6C03
   /1iWWY6od1nRtj2frcoX1H8Pu0IKCc5PXbl6xjMEBzvEww6riThzNVzFu
   9IWErpZSM1CnAIGP1iw9XioHWg+CfT86rPmMsea/haZ0LsVS+jihdXo0M
   yjU3QTI5qlClpnSvm7IkzqXLDA+rgmxIm0/kniBStYsHMxfeFomsWYfjd
   A==;
X-CSE-ConnectionGUID: 2nMa9VYSRYiecPDJBdWJQQ==
X-CSE-MsgGUID: YtTUzJK6SN2QYKFaw3v0vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56790797"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56790797"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:52:08 -0700
X-CSE-ConnectionGUID: 89si6OklTNKD+7dbM/wAkA==
X-CSE-MsgGUID: X5NS5+wUQgmFMjGOQAS/kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="165163892"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa001.jf.intel.com with SMTP; 07 Apr 2025 06:52:05 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 07 Apr 2025 16:52:04 +0300
Date: Mon, 7 Apr 2025 16:52:04 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de, Badhri Jagan Sridharan <badhri@google.com>
Subject: Re: [PATCH] usb: typec: tcpci: add regulator support
Message-ID: <Z_PYhMbmNv6dWM4w@kuha.fi.intel.com>
References: <20250404-ml-topic-tcpci-v1-1-4442c7d0ee1e@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404-ml-topic-tcpci-v1-1-4442c7d0ee1e@pengutronix.de>

+Badhri

On Fri, Apr 04, 2025 at 01:17:20AM +0200, Michael Grzeschik wrote:
> The tcpci chip vbus pin is possibly driven by an regulator. This patch
> is adding support to enable an optional vdd regulator before probing.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpci.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index 19ab6647af706..a56e31b20c214 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -17,6 +17,7 @@
>  #include <linux/usb/tcpci.h>
>  #include <linux/usb/tcpm.h>
>  #include <linux/usb/typec.h>
> +#include <linux/regulator/consumer.h>
>  
>  #define	PD_RETRY_COUNT_DEFAULT			3
>  #define	PD_RETRY_COUNT_3_0_OR_HIGHER		2
> @@ -905,6 +906,10 @@ static int tcpci_probe(struct i2c_client *client)
>  	int err;
>  	u16 val = 0;
>  
> +	err = devm_regulator_get_enable_optional(&client->dev, "vdd");
> +	if (err && err != -ENODEV)
> +		return dev_err_probe(&client->dev, err, "Failed to get regulator\n");
> +
>  	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
>  	if (!chip)
>  		return -ENOMEM;
> 
> ---
> base-commit: a1b5bd45d4ee58af4f56e49497b8c3db96d8f8a3
> change-id: 20250404-ml-topic-tcpci-524d1d6bfede
> 
> Best regards,
> -- 
> Michael Grzeschik <m.grzeschik@pengutronix.de>

-- 
heikki
