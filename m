Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A351531C5;
	Mon,  7 Apr 2025 13:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033819; cv=none; b=JYjCyaNBSdXTTkMlZ7Z3BfMjIkg//nTjVZlrJgVYnVR2QbAMOSfkpCFv4+6EyFZpR38mW6Z4JFAxKGaLmEWQOBHCYO1raPu8v5UvVnqWFtObZFGp1Se8wcgk1/OWUm76KOrnKptqGg6of0uplRLWTIy2VPUrpPkOmp8RIXt9Gp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033819; c=relaxed/simple;
	bh=A1UzUe+zGPW63dqcR62WgQaMDeReDJC0hjEAe4fREE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R16/MeSjGXkJ+ZzbtN0A5ezA2qcsXD2u9T9nKg5k45cS/z7Rey8fxlT3fA+qKgQpHwsfOKVpE25lf0V4/syeF2da8OIHsJUIgEnLcKQuUhS2HLxFHiUig0JXW2tdkQSvqd0tZs2+g5iYC9dyV4mIwicpoahEDF/dzmdgmt7ZiNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jg52u1JD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jg52u1JD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744033817; x=1775569817;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A1UzUe+zGPW63dqcR62WgQaMDeReDJC0hjEAe4fREE0=;
  b=jg52u1JDMymflBipSrNEcLDHqQO0udW07m6RvZ+o/p3jGVMdfam5VERt
   2B6BfiQlXVXurN4JVo3b1guuz4mYQN3s/PIG5BqgmJ6a981Vu6OSagRoz
   o3+z44COB+L29e5N9Qwxa86JzF2+Z+O51Ef7f0aWHly0HOFOsGXNRwE7i
   /PqYElJqEzFKOP1M+M3+DlN7ZYL11lxil+dXXB3BcpHRKZ4baz0nvPx/3
   1myxwMw+wcTTQrKHlsyUkfAm47R003l3MjqxGlNLQbpfIC0WA+1Co6QuI
   7X5vj6wvT1jhomEgOGx8eO7V7z6BuZsuHAmnAH7SIRc6RYq2rklgpTYtp
   g==;
X-CSE-ConnectionGUID: /z+tLe2NQMuQpq8bBlIiaw==
X-CSE-MsgGUID: 0muffSn5SV6f9tvbPGAtpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="70797038"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="70797038"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:50:16 -0700
X-CSE-ConnectionGUID: faZGuwsGSvG6iv/gAs2B1w==
X-CSE-MsgGUID: hGLh2kZARzWb61yh/1Cs8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="132815360"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa003.jf.intel.com with SMTP; 07 Apr 2025 06:50:14 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 07 Apr 2025 16:50:13 +0300
Date: Mon, 7 Apr 2025 16:50:13 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de, Badhri Jagan Sridharan <badhri@google.com>
Subject: Re: [PATCH 3/3] usb: typec: tcpm: allow switching to mode accessory
 to mux properly
Message-ID: <Z_PYFT7IGMhX7gLO@kuha.fi.intel.com>
References: <20250404-ml-topic-tcpm-v1-0-b99f44badce8@pengutronix.de>
 <20250404-ml-topic-tcpm-v1-3-b99f44badce8@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404-ml-topic-tcpm-v1-3-b99f44badce8@pengutronix.de>

+Badhri

On Fri, Apr 04, 2025 at 12:43:06AM +0200, Michael Grzeschik wrote:
> The funciton tcpm_acc_attach is not setting the proper state when
> calling tcpm_set_role. The function tcpm_set_role is currently only
> handling TYPEC_STATE_USB. For the tcpm_acc_attach to switch into other
> modal states tcpm_set_role needs to be extended by an extra state
> parameter. This patch is handling the proper state change when calling
> tcpm_acc_attach.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 27 ++++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 01714a42f848a..784fa23102f90 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -1153,7 +1153,7 @@ static int tcpm_set_attached_state(struct tcpm_port *port, bool attached)
>  				     port->data_role);
>  }
>  
> -static int tcpm_set_roles(struct tcpm_port *port, bool attached,
> +static int tcpm_set_roles(struct tcpm_port *port, bool attached, int state,
>  			  enum typec_role role, enum typec_data_role data)
>  {
>  	enum typec_orientation orientation;
> @@ -1190,7 +1190,7 @@ static int tcpm_set_roles(struct tcpm_port *port, bool attached,
>  		}
>  	}
>  
> -	ret = tcpm_mux_set(port, TYPEC_STATE_USB, usb_role, orientation);
> +	ret = tcpm_mux_set(port, state, usb_role, orientation);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -4355,7 +4355,8 @@ static int tcpm_src_attach(struct tcpm_port *port)
>  
>  	tcpm_enable_auto_vbus_discharge(port, true);
>  
> -	ret = tcpm_set_roles(port, true, TYPEC_SOURCE, tcpm_data_role_for_source(port));
> +	ret = tcpm_set_roles(port, true, TYPEC_STATE_USB,
> +			     TYPEC_SOURCE, tcpm_data_role_for_source(port));
>  	if (ret < 0)
>  		return ret;
>  
> @@ -4530,7 +4531,8 @@ static int tcpm_snk_attach(struct tcpm_port *port)
>  
>  	tcpm_enable_auto_vbus_discharge(port, true);
>  
> -	ret = tcpm_set_roles(port, true, TYPEC_SINK, tcpm_data_role_for_sink(port));
> +	ret = tcpm_set_roles(port, true, TYPEC_STATE_USB,
> +			     TYPEC_SINK, tcpm_data_role_for_sink(port));
>  	if (ret < 0)
>  		return ret;
>  
> @@ -4555,6 +4557,7 @@ static int tcpm_acc_attach(struct tcpm_port *port)
>  	int ret;
>  	enum typec_role role;
>  	enum typec_data_role data;
> +	int state = TYPEC_STATE_USB;
>  
>  	if (port->attached)
>  		return 0;
> @@ -4563,7 +4566,13 @@ static int tcpm_acc_attach(struct tcpm_port *port)
>  	data = tcpm_port_is_sink(port) ? tcpm_data_role_for_sink(port)
>  				       : tcpm_data_role_for_source(port);
>  
> -	ret = tcpm_set_roles(port, true, role, data);
> +	if (tcpm_port_is_audio(port))
> +		state = TYPEC_MODE_AUDIO;
> +
> +	if (tcpm_port_is_debug(port))
> +		state = TYPEC_MODE_DEBUG;
> +
> +	ret = tcpm_set_roles(port, true, state, role, data);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -5349,7 +5358,7 @@ static void run_state_machine(struct tcpm_port *port)
>  		 */
>  		tcpm_set_vconn(port, false);
>  		tcpm_set_vbus(port, false);
> -		tcpm_set_roles(port, port->self_powered, TYPEC_SOURCE,
> +		tcpm_set_roles(port, port->self_powered, TYPEC_STATE_USB, TYPEC_SOURCE,
>  			       tcpm_data_role_for_source(port));
>  		/*
>  		 * If tcpc fails to notify vbus off, TCPM will wait for PD_T_SAFE_0V +
> @@ -5381,7 +5390,7 @@ static void run_state_machine(struct tcpm_port *port)
>  		tcpm_set_vconn(port, false);
>  		if (port->pd_capable)
>  			tcpm_set_charge(port, false);
> -		tcpm_set_roles(port, port->self_powered, TYPEC_SINK,
> +		tcpm_set_roles(port, port->self_powered, TYPEC_STATE_USB, TYPEC_SINK,
>  			       tcpm_data_role_for_sink(port));
>  		/*
>  		 * VBUS may or may not toggle, depending on the adapter.
> @@ -5505,10 +5514,10 @@ static void run_state_machine(struct tcpm_port *port)
>  	case DR_SWAP_CHANGE_DR:
>  		tcpm_unregister_altmodes(port);
>  		if (port->data_role == TYPEC_HOST)
> -			tcpm_set_roles(port, true, port->pwr_role,
> +			tcpm_set_roles(port, true, TYPEC_STATE_USB, port->pwr_role,
>  				       TYPEC_DEVICE);
>  		else
> -			tcpm_set_roles(port, true, port->pwr_role,
> +			tcpm_set_roles(port, true, TYPEC_STATE_USB, port->pwr_role,
>  				       TYPEC_HOST);
>  		tcpm_ams_finish(port);
>  		tcpm_set_state(port, ready_state(port), 0);
> 
> -- 
> 2.39.5

-- 
heikki
