Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA496FB0;
	Mon,  7 Apr 2025 13:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033611; cv=none; b=UaxPV8D5zzri3inOIaMMC7uaJYT+MQODs8+26fa8WEmkJZffuKOpWLPtUU93Ma2BYKt+5K3Tq0q+HhMCadse+hjyQxlpg4Eb9Ur9UGsytBFMbxClZr8XslVDB0iMSwrawJxSZU2gpS/N/PeCCeMhQWkrW+0FYaEcjYTJZK6AzQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033611; c=relaxed/simple;
	bh=weGawcpgqSXgSdCICLq2nu14LtyVIvpNlEqyxGwRtTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mYl45iX5KDKFmMJQiycwHdwBIJP5QiKjLNV4myQKiPNIJcvmG3Gu9UL4GOrzK2Z4KoF3ynrc+O2SVi7m1O98VAkJzvJgOjbi+ahGHhi4XniuEjylDo4MyCuIZKdohLI30PAIEsBbxiP6110dHxq1EmsHclgrzPl4CFgwSnI75Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N2f3JLgJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N2f3JLgJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744033609; x=1775569609;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=weGawcpgqSXgSdCICLq2nu14LtyVIvpNlEqyxGwRtTM=;
  b=N2f3JLgJN+gKTnA2VOhGPboyCJoA+QbUtZTCXriaF96HGChQwYUIrMHM
   kI+vfD1CZG3QxMu7E3NSdIqBQbhatT64f1+AFph9+IiYhrLw+luLBsLGJ
   ULznqE8uMw40MGvizNJ/lz8xXexXJFa0u2JZx9LyH1hmpFR663HmrhDf5
   hZSXMJ6h9paZIiwXc6MoTFMS1s415i9vwScXBPW+AgNlZljphI6jRBOTH
   YU7IaSaQJvYs3S31lTyAKcipexPptUbHDobYL5U5phGguVTgkv1rPgJyO
   X4DMeyJ2bLCQvHaAACu1O/dvg4T6Uky6o42Q6ReSwdnQ7Xr235BtIq/Oj
   Q==;
X-CSE-ConnectionGUID: e/mVVpYlSYOiH4utVCKr0g==
X-CSE-MsgGUID: zAm/3qAKQVSO+URIACzdVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45131897"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45131897"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:46:49 -0700
X-CSE-ConnectionGUID: lYP5rdUIRAm5Vi1/V0ObKA==
X-CSE-MsgGUID: MbEvAxCgQzWmANqzoVbzwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127967534"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa007.fm.intel.com with SMTP; 07 Apr 2025 06:46:46 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 07 Apr 2025 16:46:45 +0300
Date: Mon, 7 Apr 2025 16:46:45 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de, Badhri Jagan Sridharan <badhri@google.com>
Subject: Re: [PATCH 1/3] usb: typec: tcpm: allow to use sink in accessory mode
Message-ID: <Z_PXRQB9zgmXvpEA@kuha.fi.intel.com>
References: <20250404-ml-topic-tcpm-v1-0-b99f44badce8@pengutronix.de>
 <20250404-ml-topic-tcpm-v1-1-b99f44badce8@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404-ml-topic-tcpm-v1-1-b99f44badce8@pengutronix.de>

+Badhri

On Fri, Apr 04, 2025 at 12:43:04AM +0200, Michael Grzeschik wrote:
> Since the function tcpm_acc_attach is not setting the data and role for
> for the sink case we extend it to check for it first.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index a99db4e025cd0..839697c14265e 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -4551,12 +4551,17 @@ static void tcpm_snk_detach(struct tcpm_port *port)
>  static int tcpm_acc_attach(struct tcpm_port *port)
>  {
>  	int ret;
> +	enum typec_role role;
> +	enum typec_data_role data;
>  
>  	if (port->attached)
>  		return 0;
>  
> -	ret = tcpm_set_roles(port, true, TYPEC_SOURCE,
> -			     tcpm_data_role_for_source(port));
> +	role = tcpm_port_is_sink(port) ? TYPEC_SINK : TYPEC_SOURCE;
> +	data = tcpm_port_is_sink(port) ? tcpm_data_role_for_sink(port)
> +				       : tcpm_data_role_for_source(port);
> +
> +	ret = tcpm_set_roles(port, true, role, data);
>  	if (ret < 0)
>  		return ret;
>  

-- 
heikki
