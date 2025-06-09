Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52BA23A9;
	Mon,  9 Jun 2025 10:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464176; cv=none; b=iX/J5wcgxuUUC6VhmRY+hnSMielGkrD5CAVEXiOle3B5TC61+/dHPiabnMC6LdwCbkK2XaAJDdcpDVn6MpOazaxYiQMGLxgzIh4Y5jWnoN6dwZt4C00UsoPlnF1hrjLXu67cO8HB6V4xC6Mt1Rcv7XZu7ipiT4DW8Ve+h80GppQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464176; c=relaxed/simple;
	bh=O+bBROqKabz2CTBu7yCmVbU0VYYotr7u/Co52EE2nRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V1BAIkwgXivDiuAjyw8kX/1L8W8MaJCgX8VpMpjdLBeLII+OUnQEY8NTBpAWUo15Yz8stVQMCazWFzfR0lA39i1rrvyMi4QZsEQx1BkxxtaQJ+sVqp8wnP0VJA5bZk3nOfz/SC/CPtaWdoq7v9o57TjzYkuKYUOiQkstHEkuRsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e8JKJCfo; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e8JKJCfo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749464175; x=1781000175;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O+bBROqKabz2CTBu7yCmVbU0VYYotr7u/Co52EE2nRE=;
  b=e8JKJCfo1Rxm50e/mQywoNCnXLgOtOsPbswfHuwTvJUUZMgMLGT0qGat
   pp2pEbIlkZqcOlieFidH8+yKuNZbmDDmBNSZx4S7gXFcLGcyIbtZcw9at
   xfJEKHU4fGnDtGpERry1LTkJG6Ln8uMFptBMOWcojxfpvqM6xu+9Ar9dX
   tZkPSlX8Sx6c14oXZkz8aIR4ZxItcTNpoml43hH3L+SNF1UnlBSbRLsT1
   C43eBEsL9nkMJhiiGQt01Y32t7JBDwe8S6cxKIuF3bJ0iQZBsnolx2ma5
   h7GBTPNrWeR+wZMcZejxue1MkL4CRMMZu5FUo+TcxlO39mve6t63cTc4f
   g==;
X-CSE-ConnectionGUID: JjVvG96nTBe+/QIWUc/Ktg==
X-CSE-MsgGUID: TvYSt3sBSvOR+GpFEkGDeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="51413977"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="51413977"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 03:16:14 -0700
X-CSE-ConnectionGUID: 6jH5CW9iTEmgrisEa5mwTw==
X-CSE-MsgGUID: 8GvoBy6NQQeAFJKh+hEsIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="183657815"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa001.jf.intel.com with SMTP; 09 Jun 2025 03:16:12 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 09 Jun 2025 13:16:11 +0300
Date: Mon, 9 Jun 2025 13:16:11 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: linux@treblig.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: Remove unused ucsi_cci_str
Message-ID: <aEa0ayPAAqgjprEm@kuha.fi.intel.com>
References: <20250609004319.209143-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609004319.209143-1-linux@treblig.org>

On Mon, Jun 09, 2025 at 01:43:19AM +0100, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> ucsi_cci_str() last use was removed in 2019 by
> commit 2ede55468ca8 ("usb: typec: ucsi: Remove the old API")
> 
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/trace.c | 17 -----------------
>  drivers/usb/typec/ucsi/trace.h |  1 -
>  2 files changed, 18 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/trace.c b/drivers/usb/typec/ucsi/trace.c
> index 596a9542d401..13a38422743a 100644
> --- a/drivers/usb/typec/ucsi/trace.c
> +++ b/drivers/usb/typec/ucsi/trace.c
> @@ -33,23 +33,6 @@ const char *ucsi_cmd_str(u64 raw_cmd)
>  	return ucsi_cmd_strs[(cmd >= ARRAY_SIZE(ucsi_cmd_strs)) ? 0 : cmd];
>  }
>  
> -const char *ucsi_cci_str(u32 cci)
> -{
> -	if (UCSI_CCI_CONNECTOR(cci)) {
> -		if (cci & UCSI_CCI_ACK_COMPLETE)
> -			return "Event pending (ACK completed)";
> -		if (cci & UCSI_CCI_COMMAND_COMPLETE)
> -			return "Event pending (command completed)";
> -		return "Connector Change";
> -	}
> -	if (cci & UCSI_CCI_ACK_COMPLETE)
> -		return "ACK completed";
> -	if (cci & UCSI_CCI_COMMAND_COMPLETE)
> -		return "Command completed";
> -
> -	return "";
> -}
> -
>  static const char * const ucsi_recipient_strs[] = {
>  	[UCSI_RECIPIENT_CON]		= "port",
>  	[UCSI_RECIPIENT_SOP]		= "partner",
> diff --git a/drivers/usb/typec/ucsi/trace.h b/drivers/usb/typec/ucsi/trace.h
> index 41701dee7056..9554a0207276 100644
> --- a/drivers/usb/typec/ucsi/trace.h
> +++ b/drivers/usb/typec/ucsi/trace.h
> @@ -10,7 +10,6 @@
>  #include <linux/usb/typec_altmode.h>
>  
>  const char *ucsi_cmd_str(u64 raw_cmd);
> -const char *ucsi_cci_str(u32 cci);
>  const char *ucsi_recipient_str(u8 recipient);
>  
>  DECLARE_EVENT_CLASS(ucsi_log_command,
> -- 
> 2.49.0

-- 
heikki
