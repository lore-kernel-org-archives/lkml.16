Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5032701A0
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 20:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746477898; cv=none; b=b2vkYouqi2xwk5hh0JSDDQv/FlAq8/FtHKzBie+2zQ/IOglIBXixoZsjnptlg2s7QYeF8ext3x/HxYDN4SrS8WC84wTPDQ2CCyigmW7utYAP5cge7N9ri4hRiEHWhY77oZvBKbm1VAPSxSYlPeRngXSJqGQyZ2F878QEnaxn8nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746477898; c=relaxed/simple;
	bh=ubdBjhQyfvrlKkg+rzmLXqPA/dVljltrJ12y21NRBts=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UEzrQ1rOW7oiQOgPlzsy/c1+G7WMFwT1RpesKbR2jCvcux6USc3rpCGxGXSMPJlgkoTqvc15JWNkD+ZJyCsaxiV+k7/6v8xDVlZp4DJV0qtdOQ2o4Msj9s8CQltR68ypHFUs4691iNQ7gzWV2IN6Wj/tiwhOZJEAajiQROUWn/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jpT1K7p+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jpT1K7p+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D746C4CEE4;
	Mon,  5 May 2025 20:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746477898;
	bh=ubdBjhQyfvrlKkg+rzmLXqPA/dVljltrJ12y21NRBts=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jpT1K7p+AEBP+oiObyE85RAqOoZ8tHiEgeiYpmZYZJ3hzPrs3CaZ5A1xu0+zboUIa
	 NzIEkxm6GdfknuSmd6WmiRM47EuEbSlQFL+FCTFjtxPD8szjXg8iE/87bK00HjP5zq
	 43W2pRMGkb1sPdACK4xn4gyda55fQ5/nd4Rd/3ikfjc+eogKbil4jR8KMiZ4WrL59i
	 pe8M1Ipz+e68Gj727wssLS1MWG4iEgSZOkofJULqkYKStbDrNPNci+4nUtU9LJ36r1
	 W/sdzh4H19Y+usS0xxWihYuowfIp+gVK6737RDp841QaZ+BIjklthDB9bWUTklzhoB
	 kjKHcfLDENSKQ==
Date: Mon, 5 May 2025 13:44:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xenbus: Allow PVH dom0 a non-local xenstore
In-Reply-To: <20250503131935.1885-1-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505051343080.3879245@ubuntu-linux-20-04-desktop>
References: <20250503131935.1885-1-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 3 May 2025, Jason Andryuk wrote:
> Make xenbus_init() allow a non-local xenstore for a PVH dom0 - it is
> currently forced to XS_LOCAL.  With Hyperlaunch booting dom0 and a
> xenstore stubdom, dom0 can be handled as a regular XS_HVM following the
> late init path.
> 
> Drop the use of xen_initial_domain() and just check for the event
> channel instead.  This matches the PV case where there is no check for
> initial domain.
> 
> Check the full 64bit HVM_PARAM_STORE_EVTCHN value to catch the off
> chance that high bits are set for the 32bit event channel.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  drivers/xen/xenbus/xenbus_probe.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
> index 6d32ffb01136..7604f70ee108 100644
> --- a/drivers/xen/xenbus/xenbus_probe.c
> +++ b/drivers/xen/xenbus/xenbus_probe.c
> @@ -966,9 +966,15 @@ static int __init xenbus_init(void)
>  	if (xen_pv_domain())
>  		xen_store_domain_type = XS_PV;
>  	if (xen_hvm_domain())
> +	{
>  		xen_store_domain_type = XS_HVM;
> -	if (xen_hvm_domain() && xen_initial_domain())
> -		xen_store_domain_type = XS_LOCAL;
> +		err = hvm_get_parameter(HVM_PARAM_STORE_EVTCHN, &v);
> +		if (err)
> +			goto out_error;
> +		xen_store_evtchn = (int)v;
> +		if (!v)
> +			xen_store_domain_type = XS_LOCAL;
> +	}
>  	if (xen_pv_domain() && !xen_start_info->store_evtchn)
>  		xen_store_domain_type = XS_LOCAL;
>  	if (xen_pv_domain() && xen_start_info->store_evtchn)
> @@ -987,10 +993,6 @@ static int __init xenbus_init(void)
>  		xen_store_interface = gfn_to_virt(xen_store_gfn);
>  		break;
>  	case XS_HVM:
> -		err = hvm_get_parameter(HVM_PARAM_STORE_EVTCHN, &v);
> -		if (err)
> -			goto out_error;
> -		xen_store_evtchn = (int)v;
>  		err = hvm_get_parameter(HVM_PARAM_STORE_PFN, &v);
>  		if (err)
>  			goto out_error;
> -- 
> 2.34.1
> 
