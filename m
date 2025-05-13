Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE96D28640E;
	Tue, 13 May 2025 13:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747143551; cv=none; b=O3YggUW94MZxaoVEAa6yL0QYwbn2Ysxkt5WND38QCxpYC0IfLvNGjQ2UGLjaX0inANj5y2GntIxPQGqkitskP8zI3PvtXxYQZ7hz/f6lKlhpfVPu3lfLDH8btuN6o2oV3RBlO2UO5NoGW9Zo5F9+h7qEeCqRniHj5WAMnc4SC6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747143551; c=relaxed/simple;
	bh=msob1qipX3+JtDxisx9UwJX1EHZgMW1H2/X4woFM/wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ictDEUiQhJRdRuq4j924DEZ+biXwdYahEezatzQWKAmLl4Lx1LejtxVcN2CrWdpQt5xJDRr4lMwZQfrJLlvZMo+UAQvyafV0X8U6dmx0K/xbAClCb2iPV0ZXt+nFWDrMk/x2b0ymVnH7h5O5uLk/mX7aAGjWPS0cbHjASPPYxMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fxu/sVpo; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fxu/sVpo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747143550; x=1778679550;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=msob1qipX3+JtDxisx9UwJX1EHZgMW1H2/X4woFM/wk=;
  b=Fxu/sVpoMttpulczGwVtxNwYojabnbdQZk6QYdKgGIUzutCABwz8sv5G
   LMtx8Chg9xI5O525BOFYBGYwH7oKcSqZ0vCF1d+wEF2gkvrWuSkogcxaV
   SS1nTx4NFXz8nglmyXLYNxWA2ic9dCDgEpReYlgYex3wGL+2IrGtqO4Hy
   gripm3Ogho6e5nXd57LmI6OX9lBcGRjnY6afN3xSzprUC2MxphbbtvU7Z
   37747hb/j2ShTc0Hd4fIrsoyEZei0JJk8Bdjp/9sdLMMDqIJC46mPRKSk
   wW9NebOrjsbXskJb3DcH79DaNf2SV3erztQ9jBrOpWzde9wTOFdAv3eGx
   w==;
X-CSE-ConnectionGUID: dDKLXlc3QQyO+y5Sanmkww==
X-CSE-MsgGUID: NugCQfIzRvmshIzAMDpnmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="36615448"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="36615448"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 06:39:09 -0700
X-CSE-ConnectionGUID: r3WxKfrgSp6+nGbmN2CTuA==
X-CSE-MsgGUID: k3lOBvBySteJTy+gX2ylGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="137635515"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa006.jf.intel.com with SMTP; 13 May 2025 06:39:06 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 13 May 2025 16:39:05 +0300
Date: Tue, 13 May 2025 16:39:05 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Cosmo Chou <chou.cosmo@gmail.com>
Cc: badhri@google.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	cosmo.chou@quantatw.com
Subject: Re: [PATCH v2] usb: typec: tcpm: Use configured PD revision for
 negotiation
Message-ID: <aCNLeX1k34BSgPOV@kuha.fi.intel.com>
References: <20250513130834.1612602-1-chou.cosmo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513130834.1612602-1-chou.cosmo@gmail.com>

On Tue, May 13, 2025 at 09:08:34PM +0800, Cosmo Chou wrote:
> Initialize negotiated_rev and negotiated_rev_prime based on the port's
> configured PD revision (rev_major) rather than always defaulting to
> PD_MAX_REV. This ensures ports start PD communication using their
> appropriate revision level.
> 
> This allows proper communication with devices that require specific
> PD revision levels, especially for the hardware designed for PD 1.0
> or 2.0 specifications.
> 
> Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
> ---
> Change log:
> 
> v2:
>   - Add PD_CAP_REVXX macros and use switch-case for better readability.
> 
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 8adf6f954633..48e9cfc2b49a 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -313,6 +313,10 @@ struct pd_data {
>  	unsigned int operating_snk_mw;
>  };
>  
> +#define PD_CAP_REV10	0x1
> +#define PD_CAP_REV20	0x2
> +#define PD_CAP_REV30	0x3
> +
>  struct pd_revision_info {
>  	u8 rev_major;
>  	u8 rev_minor;
> @@ -4665,6 +4669,25 @@ static void tcpm_set_initial_svdm_version(struct tcpm_port *port)
>  	}
>  }
>  
> +static void tcpm_set_initial_negotiated_rev(struct tcpm_port *port)
> +{
> +	switch (port->pd_rev.rev_major) {
> +	case PD_CAP_REV10:
> +		port->negotiated_rev = PD_REV10;
> +		break;
> +	case PD_CAP_REV20:
> +		port->negotiated_rev = PD_REV20;
> +		break;
> +	case PD_CAP_REV30:
> +		port->negotiated_rev = PD_REV30;
> +		break;
> +	default:
> +		port->negotiated_rev = PD_MAX_REV;
> +		break;
> +	}
> +	port->negotiated_rev_prime = port->negotiated_rev;
> +}

Do we need this? Couldn't you just add one to rev_major?

        port->negotiated_rev = port->pd_rev.rev_major + 1;
        port->negotiated_rev_prime = port->pd_rev.rev_major + 1;

Or am I missing something?

thanks,

>  static void run_state_machine(struct tcpm_port *port)
>  {
>  	int ret;
> @@ -4782,8 +4805,7 @@ static void run_state_machine(struct tcpm_port *port)
>  		typec_set_pwr_opmode(port->typec_port, opmode);
>  		port->pwr_opmode = TYPEC_PWR_MODE_USB;
>  		port->caps_count = 0;
> -		port->negotiated_rev = PD_MAX_REV;
> -		port->negotiated_rev_prime = PD_MAX_REV;
> +		tcpm_set_initial_negotiated_rev(port);
>  		port->message_id = 0;
>  		port->message_id_prime = 0;
>  		port->rx_msgid = -1;
> @@ -5048,8 +5070,7 @@ static void run_state_machine(struct tcpm_port *port)
>  					      port->cc2 : port->cc1);
>  		typec_set_pwr_opmode(port->typec_port, opmode);
>  		port->pwr_opmode = TYPEC_PWR_MODE_USB;
> -		port->negotiated_rev = PD_MAX_REV;
> -		port->negotiated_rev_prime = PD_MAX_REV;
> +		tcpm_set_initial_negotiated_rev(port);
>  		port->message_id = 0;
>  		port->message_id_prime = 0;
>  		port->rx_msgid = -1;
> -- 
> 2.43.0

-- 
heikki
