Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0AD176ADE;
	Tue, 15 Apr 2025 13:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744724451; cv=none; b=n1JfP9ESrvQToGApZEQTrqJdMDN4agVHjaFLVUt7pNYu5ft1lNmovZa/0UG4/6rVBy40XD/5JRn9aUIarIhU7kkLdHXtIWJnwvbDrloZFMvUv/d0Xr4N8gbY9wK1mBK8cyx5HbIE3HInTjSYWR3s3/TRQ7kRXdy4J5YCcOirfhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744724451; c=relaxed/simple;
	bh=44KbcDQY4m4EebPQFhUrXy2B9r9zyd1SD5Pa89kigz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VFtrSg7JyZLD7QbR46ExuZRnm/xeWnB0bmWIFWoxnhnuO1JIU5YKI9PRJWNC0D1/tXYn2gNSDpa/n7RXtKhoRCdF8YcZD7oJ+Hd14K2Lh7sE12jxezrBOk4slvuOs/blp4oSI67J/EcJh+E9/RTHhohAjS7DjavmHpSdQesfrRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jkbIHr1E; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jkbIHr1E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744724449; x=1776260449;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=44KbcDQY4m4EebPQFhUrXy2B9r9zyd1SD5Pa89kigz4=;
  b=jkbIHr1E9NGQVcSu9EaauuDQ381uvha7UsCjyAOFUzmFZm/tH1MAn9G4
   AhES8DYtzhLnPUHf6o+//Sqr3e4pCzY8PH3J4XDa3ZhUdbs1oZGO1E6nT
   RaA+BQnmINe/LlfQPkZU0a36plOoA3lNaxw05WTx/OgUG3+RD/NSQZ8BK
   eOaCPkhMiihQZW3m2Yh2r2EIM9tW3efO0gg4CnhOvDefxKksSyjakA8vD
   dEmxEj8XM3K6q75nAp6kJC0ngWfmEyXAm0uHEVNOpwujY1VSyjpont6jI
   psUYbcF5doOpRlSR5Lvetxr/oXtK7sinfzRiCwlq+T84vEL1SwoJTvYlB
   Q==;
X-CSE-ConnectionGUID: B2OKmQ/4R5aGwKVaCnUVzw==
X-CSE-MsgGUID: C/zu0EUUSdq4wnpb9CiaJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="56892439"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="56892439"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 06:40:40 -0700
X-CSE-ConnectionGUID: r7U1cCYyRWmTO9PRROwqIA==
X-CSE-MsgGUID: fRojk1b0RfK2rCfMG1E8wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="130151149"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa007.fm.intel.com with SMTP; 15 Apr 2025 06:40:37 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 15 Apr 2025 16:40:36 +0300
Date: Tue, 15 Apr 2025 16:40:36 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH] usb: typec: mux: fsa4480: add regulator support
Message-ID: <Z_5h1G-jzA4glFsV@kuha.fi.intel.com>
References: <20250404-ml-topic-typec-mux-fs4480-v1-1-475377ef22a3@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404-ml-topic-typec-mux-fs4480-v1-1-475377ef22a3@pengutronix.de>

On Fri, Apr 04, 2025 at 01:02:20AM +0200, Michael Grzeschik wrote:
> The fsa4480 vcc lane could be driven by some external regulator.
> This patch is adding support to enable the regulator before probing.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/mux/fsa4480.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/typec/mux/fsa4480.c b/drivers/usb/typec/mux/fsa4480.c
> index f71dba8bf07c9..c54e42c7e6a16 100644
> --- a/drivers/usb/typec/mux/fsa4480.c
> +++ b/drivers/usb/typec/mux/fsa4480.c
> @@ -12,6 +12,7 @@
>  #include <linux/regmap.h>
>  #include <linux/usb/typec_dp.h>
>  #include <linux/usb/typec_mux.h>
> +#include <linux/regulator/consumer.h>
>  
>  #define FSA4480_DEVICE_ID	0x00
>   #define FSA4480_DEVICE_ID_VENDOR_ID	GENMASK(7, 6)
> @@ -273,6 +274,10 @@ static int fsa4480_probe(struct i2c_client *client)
>  	if (IS_ERR(fsa->regmap))
>  		return dev_err_probe(dev, PTR_ERR(fsa->regmap), "failed to initialize regmap\n");
>  
> +	ret = devm_regulator_get_enable_optional(dev, "vcc");
> +	if (ret && ret != -ENODEV)
> +		return dev_err_probe(dev, ret, "Failed to get regulator\n");
> +
>  	ret = regmap_read(fsa->regmap, FSA4480_DEVICE_ID, &val);
>  	if (ret)
>  		return dev_err_probe(dev, -ENODEV, "FSA4480 not found\n");
> 
> ---
> base-commit: a1b5bd45d4ee58af4f56e49497b8c3db96d8f8a3
> change-id: 20250404-ml-topic-typec-mux-fs4480-392407f94f84
> 
> Best regards,
> -- 
> Michael Grzeschik <m.grzeschik@pengutronix.de>
> 

-- 
heikki
