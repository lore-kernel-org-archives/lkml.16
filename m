Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0C5214815
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 23:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746575843; cv=none; b=lsNd/vKhyaLjgOCO99YEZF2ZQlv2NHmRZp4Ci4S07QBRKqPwpTTHFRSGZnxx7bfrvFydWtFUG4lxyJssRICF2CLD2TS+PDvO/pX5jbqhcpmfZyCDhWLSsTsk0soeJ/m7hH0fUyv8LAp1ozX9GY8nVxswvZIlfxbn8DX+siesfLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746575843; c=relaxed/simple;
	bh=yxSEOOrKIkvEzMKukyHAhQPQyFWYQHJ/8Utird1u5bU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ivPTszKI4ccwrlsH9zRUxp9O4olOnw2S+XIv8yhlGid71tSCnUM+e3DKSe6ihbDb3AXSucLiwdjcPMu5GSykP10yUZHTEYSkLCOJzN16MCWR4adFweaEXAfXtq5aFXLysVLYPY9RRnpcB+kWYtu5THIG4XdGl2GABblMmVI8A00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JVYJz8oN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JVYJz8oN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 630FFC4CEE4;
	Tue,  6 May 2025 23:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746575843;
	bh=yxSEOOrKIkvEzMKukyHAhQPQyFWYQHJ/8Utird1u5bU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JVYJz8oNyKONT9+TOS6KyHKoWQjF7wfPUuYUryFI+j3cj7KUTD2WcFnIwXu97KDjW
	 3wti9Pkvrm9RPyaLMMR3/kBorRBltIwgDy8FbIKVwa5ce+cGxZGojuJmgwSAe/xhY/
	 q6bmhV6AGQbA08ocA5xJPlbhyFXGn0NjgxqrLmL4LLnX7dHwQhK2JYdwZwZgM89YfU
	 LY3LXL/psSODAFl4P0+DxsBrKQHnQuYLmHEn8zqEvRjKY7p+I6ZDj2B9PtIFaqcyLW
	 o/cLWkYAg4QHE1QeZnhQWUblcEK9x0GuXfuAFRsedb1Oesz/tJthqXgWXMmgjAbzjb
	 ZUSz2W3tbkVSA==
Date: Tue, 6 May 2025 16:57:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] xenbus: Allow PVH dom0 a non-local xenstore
In-Reply-To: <20250506204456.5220-1-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505061657080.3879245@ubuntu-linux-20-04-desktop>
References: <20250506204456.5220-1-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 May 2025, Jason Andryuk wrote:
> Make xenbus_init() allow a non-local xenstore for a PVH dom0 - it is
> currently forced to XS_LOCAL.  With Hyperlaunch booting dom0 and a
> xenstore stubdom, dom0 can be handled as a regular XS_HVM following the
> late init path.
> 
> Ideally we'd drop the use of xen_initial_domain() and just check for the
> event channel instead.  However, ARM has a xen,enhanced no-xenstore
> mode, where the event channel and PFN would both be 0.  Retain the
> xen_initial_domain() check, and use that for an additional check when
> the event channel is 0.
> 
> Check the full 64bit HVM_PARAM_STORE_EVTCHN value to catch the off
> chance that high bits are set for the 32bit event channel.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Change-Id: I5506da42e4c6b8e85079fefb2f193c8de17c7437
> ---
> v2:
> Re-add xen_initial_domain() check to avoid breaking ARM's xen,enhanced
> no-xenstore mode where event channel and PFN are both 0.

Thanks for the catch!

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


>  drivers/xen/xenbus/xenbus_probe.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
> index 22d3f90ee205..b12cbd9663e3 100644
> --- a/drivers/xen/xenbus/xenbus_probe.c
> +++ b/drivers/xen/xenbus/xenbus_probe.c
> @@ -969,9 +969,15 @@ static int __init xenbus_init(void)
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
> +		if (!v && xen_initial_domain())
> +			xen_store_domain_type = XS_LOCAL;
> +	}
>  	if (xen_pv_domain() && !xen_start_info->store_evtchn)
>  		xen_store_domain_type = XS_LOCAL;
>  	if (xen_pv_domain() && xen_start_info->store_evtchn)
> @@ -990,10 +996,6 @@ static int __init xenbus_init(void)
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
