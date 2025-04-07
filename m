Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0019C3FB0E;
	Mon,  7 Apr 2025 13:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033699; cv=none; b=JvlRXh+a6pO2DvjsqH3dduJ2Jiw3xrG/m9AxFO1QVcYmkT1/OQvfiBGesBFrn2d2upVV7UIuVWkchqv797iBf45Fc+OhgP6gxxZgURvZ9P52MxbKiKr5bt4zJPs8iU79rWKXvHGboS7ofxpp1diYgK+SPVxgK6EJFLOnuDTcSS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033699; c=relaxed/simple;
	bh=whXxLvXFtWpjQOYQaStEv117F7Xp+BAD7ZL1ORaR2SM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNRnOw8tuZQqbczJK5kRHnLMP/uNTaUgotvYEoW5H7IspOy9ZOb7lKTppf6KJSjfmKdQKVje20ehZ/drWbZICj+CLcrVKvoVPYIthramfKOjOXm5XCyK+o9V86ZNd5QV53IvyW7jXHZKCWxGCCuRSn2bzzwAVNL8hs3J2Qpk15o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZPMWinCE; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZPMWinCE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744033698; x=1775569698;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=whXxLvXFtWpjQOYQaStEv117F7Xp+BAD7ZL1ORaR2SM=;
  b=ZPMWinCESY7HTN3UP3VhNMGHI5WJQf56QNZ3z+oHtxac9Xk8xlYFphKF
   5Ttuq+Ou7btSkNuZE7sZGmjrYhu/DD7L8esZ06XT85/PQVLIwYOPhLz0C
   uUe3tE8mCKWasMhKb7Z9eQdX2BYb8hSxqDE8ojFV4njZJeKeIEFXWGHbh
   Cf7TsbuQ5SLGpnGFJzCYke7i6p0yPbthQpgXpfD34SdDO4R64gbdJ/+AF
   a49enZqHleHdEm/xhxLJj9W0TzbbitEg9KwUHHkj3HlCcnnJPUQL5LFUz
   JLblG2NOr0orXfEORdANZcn2tT4mnSpWiaqSRpCBprcQnvl4I1S66/RvX
   Q==;
X-CSE-ConnectionGUID: z3IljXm1T86uI2EHouIzTw==
X-CSE-MsgGUID: xc0X2E0uSFaQoD9TroyDEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45132023"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45132023"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:48:15 -0700
X-CSE-ConnectionGUID: xP/mgxlETKGEpYu9qbtAUw==
X-CSE-MsgGUID: lXCAbrDPRJW4eSeDFIEa/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127967787"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa007.fm.intel.com with SMTP; 07 Apr 2025 06:48:12 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 07 Apr 2025 16:48:11 +0300
Date: Mon, 7 Apr 2025 16:48:11 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de, Badhri Jagan Sridharan <badhri@google.com>
Subject: Re: [PATCH 2/3] usb: typec: tcpm: allow sink (ufp) to toggle into
 accessory mode debug
Message-ID: <Z_PXm5XbFk52jq_-@kuha.fi.intel.com>
References: <20250404-ml-topic-tcpm-v1-0-b99f44badce8@pengutronix.de>
 <20250404-ml-topic-tcpm-v1-2-b99f44badce8@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404-ml-topic-tcpm-v1-2-b99f44badce8@pengutronix.de>

+Badhri

On Fri, Apr 04, 2025 at 12:43:05AM +0200, Michael Grzeschik wrote:
> This patch extends the is_debug macro to cover the sink case (ufp). It
> also handles the transition to access the DEBUG_ACC_ATTACHED state in
> the sink case. It also handles the debounce case in which the cc
> pins are not immediately valid after the plug event.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 34 +++++++++++++++++++++++++++++-----
>  1 file changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 839697c14265e..01714a42f848a 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -67,6 +67,7 @@
>  						\
>  	S(ACC_UNATTACHED),			\
>  	S(DEBUG_ACC_ATTACHED),			\
> +	S(DEBUG_ACC_DEBOUNCE),			\
>  	S(AUDIO_ACC_ATTACHED),			\
>  	S(AUDIO_ACC_DEBOUNCE),			\
>  						\
> @@ -621,7 +622,8 @@ static const char * const pd_rev[] = {
>  	  !tcpm_cc_is_source((port)->cc1)))
>  
>  #define tcpm_port_is_debug(port) \
> -	(tcpm_cc_is_source((port)->cc1) && tcpm_cc_is_source((port)->cc2))
> +	((tcpm_cc_is_source((port)->cc1) && tcpm_cc_is_source((port)->cc2)) || \
> +	 (tcpm_cc_is_sink((port)->cc1) && tcpm_cc_is_sink((port)->cc2)))
>  
>  #define tcpm_port_is_audio(port) \
>  	(tcpm_cc_is_audio((port)->cc1) && tcpm_cc_is_audio((port)->cc2))
> @@ -4969,7 +4971,13 @@ static void run_state_machine(struct tcpm_port *port)
>  			tcpm_set_state(port, SRC_UNATTACHED, PD_T_DRP_SRC);
>  		break;
>  	case SNK_ATTACH_WAIT:
> -		if ((port->cc1 == TYPEC_CC_OPEN &&
> +		if (tcpm_port_is_debug(port))
> +			tcpm_set_state(port, DEBUG_ACC_ATTACHED,
> +				       PD_T_CC_DEBOUNCE);
> +		else if (tcpm_port_is_audio(port))
> +			tcpm_set_state(port, AUDIO_ACC_ATTACHED,
> +				       PD_T_CC_DEBOUNCE);
> +		else if ((port->cc1 == TYPEC_CC_OPEN &&
>  		     port->cc2 != TYPEC_CC_OPEN) ||
>  		    (port->cc1 != TYPEC_CC_OPEN &&
>  		     port->cc2 == TYPEC_CC_OPEN))
> @@ -4983,6 +4991,12 @@ static void run_state_machine(struct tcpm_port *port)
>  		if (tcpm_port_is_disconnected(port))
>  			tcpm_set_state(port, SNK_UNATTACHED,
>  				       PD_T_PD_DEBOUNCE);
> +		else if (tcpm_port_is_debug(port))
> +			tcpm_set_state(port, DEBUG_ACC_ATTACHED,
> +				       PD_T_CC_DEBOUNCE);
> +		else if (tcpm_port_is_audio(port))
> +			tcpm_set_state(port, AUDIO_ACC_ATTACHED,
> +				       PD_T_CC_DEBOUNCE);
>  		else if (port->vbus_present)
>  			tcpm_set_state(port,
>  				       tcpm_try_src(port) ? SRC_TRY
> @@ -5281,7 +5295,10 @@ static void run_state_machine(struct tcpm_port *port)
>  	/* Accessory states */
>  	case ACC_UNATTACHED:
>  		tcpm_acc_detach(port);
> -		tcpm_set_state(port, SRC_UNATTACHED, 0);
> +		if (port->port_type == TYPEC_PORT_SRC)
> +			tcpm_set_state(port, SRC_UNATTACHED, 0);
> +		else
> +			tcpm_set_state(port, SNK_UNATTACHED, 0);
>  		break;
>  	case DEBUG_ACC_ATTACHED:
>  	case AUDIO_ACC_ATTACHED:
> @@ -5289,6 +5306,7 @@ static void run_state_machine(struct tcpm_port *port)
>  		if (ret < 0)
>  			tcpm_set_state(port, ACC_UNATTACHED, 0);
>  		break;
> +	case DEBUG_ACC_DEBOUNCE:
>  	case AUDIO_ACC_DEBOUNCE:
>  		tcpm_set_state(port, ACC_UNATTACHED, port->timings.cc_debounce_time);
>  		break;
> @@ -5880,7 +5898,8 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
>  		}
>  		break;
>  	case SNK_UNATTACHED:
> -		if (tcpm_port_is_sink(port))
> +		if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) ||
> +		    tcpm_port_is_sink(port))
>  			tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
>  		break;
>  	case SNK_ATTACH_WAIT:
> @@ -5943,7 +5962,12 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
>  
>  	case DEBUG_ACC_ATTACHED:
>  		if (cc1 == TYPEC_CC_OPEN || cc2 == TYPEC_CC_OPEN)
> -			tcpm_set_state(port, ACC_UNATTACHED, 0);
> +			tcpm_set_state(port, DEBUG_ACC_DEBOUNCE, 0);
> +		break;
> +
> +	case DEBUG_ACC_DEBOUNCE:
> +		if (tcpm_port_is_debug(port))
> +			tcpm_set_state(port, DEBUG_ACC_ATTACHED, 0);
>  		break;
>  
>  	case SNK_TRY:
> 
> -- 
> 2.39.5

-- 
heikki
