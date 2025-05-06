Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044DC215F7F
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 23:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746575437; cv=none; b=GjMUUkqNWvNs1p0f+OYKx1GybU2gkvvcgPGTR2nICg/16bT7Ggrw3HlPfbpOyeUrAuaR8MrAmapSZPOHHPBzBcDY0Dz36rNK9M2LLlHmbU4JH7La5pb+OYRUoi5eKqoWTaqHSd+uCe5zgQlOm11EgWGxMmE/73G0Ttgn7nK0GsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746575437; c=relaxed/simple;
	bh=K2EpZFZm5KmhUkaGNC7dpG3OXzxxMH7yltZGwwMxS2M=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YjY+wpNd6TrpFh1DR1yETljQx3wVJcux6frY0x5McDjU94vXPmwEQDS4XJe0fC5YN0Q9qbdCqP+IbaYI/bnJ30e5wQEBESNP3XEypKNQk+em/Xy2tSry3lSbHUpY4XVn0KOLj45IPgPicE8RPfoqzOq/Cwi0XFDcaYpJigkuILs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HU9q6mEr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HU9q6mEr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5876C4CEE4;
	Tue,  6 May 2025 23:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746575436;
	bh=K2EpZFZm5KmhUkaGNC7dpG3OXzxxMH7yltZGwwMxS2M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HU9q6mErzeytk8DcWlsZQatn9YR63FLL7AWA6n5+PNC+GxYihjLpwvKGnIXcwvwDU
	 lee5X5I3uXYHoemea/mDaZB5JH/C/cydo3u25nZWCjhNnExzUBtemZQVsGMf78ssKu
	 KbIl8t8vrCStdOnsvbbRtD/dhqzZZksS0eP3H1/NgNr6aE4QTqR0adJ0dzrbYi7EOL
	 a6kTMxnH8sHQYV1ugHQQcRDlzJU713upAbTwfnnZ8yWfhJ454mM4pzigPNKe9bZ6B4
	 7AIW1BM4uaSzKWXmUY14kTbgn1QqC8YfMf7k8mFWLpJxR84zWYoxV9s2GnEqmMJQH/
	 Py6YfMDvDHTYg==
Date: Tue, 6 May 2025 16:50:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Juergen Gross <jgross@suse.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xenbus: Allow PVH dom0 a non-local xenstore
In-Reply-To: <63d6ff3c-bed5-4a7f-bd3e-50b99b5a6f4b@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505061648590.3879245@ubuntu-linux-20-04-desktop>
References: <20250503131935.1885-1-jason.andryuk@amd.com> <alpine.DEB.2.22.394.2505051343080.3879245@ubuntu-linux-20-04-desktop> <63d6ff3c-bed5-4a7f-bd3e-50b99b5a6f4b@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 May 2025, Jason Andryuk wrote:
> On 2025-05-05 16:44, Stefano Stabellini wrote:
> > On Sat, 3 May 2025, Jason Andryuk wrote:
> > > Make xenbus_init() allow a non-local xenstore for a PVH dom0 - it is
> > > currently forced to XS_LOCAL.  With Hyperlaunch booting dom0 and a
> > > xenstore stubdom, dom0 can be handled as a regular XS_HVM following the
> > > late init path.
> > > 
> > > Drop the use of xen_initial_domain() and just check for the event
> > > channel instead.  This matches the PV case where there is no check for
> > > initial domain.
> > > 
> > > Check the full 64bit HVM_PARAM_STORE_EVTCHN value to catch the off
> > > chance that high bits are set for the 32bit event channel.
> > > 
> > > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> > 
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Thanks, Stefano.  But I'm wondering if this might break ARM enhanced
> no-xenstore.
> 
> > 
> > > ---
> > >   drivers/xen/xenbus/xenbus_probe.c | 14 ++++++++------
> > >   1 file changed, 8 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/xen/xenbus/xenbus_probe.c
> > > b/drivers/xen/xenbus/xenbus_probe.c
> > > index 6d32ffb01136..7604f70ee108 100644
> > > --- a/drivers/xen/xenbus/xenbus_probe.c
> > > +++ b/drivers/xen/xenbus/xenbus_probe.c
> > > @@ -966,9 +966,15 @@ static int __init xenbus_init(void)
> > >   	if (xen_pv_domain())
> > >   		xen_store_domain_type = XS_PV;
> > >   	if (xen_hvm_domain())
> > > +	{
> > >   		xen_store_domain_type = XS_HVM;
> 
> ARM would have everything set to XS_HVM...
> 
> > > -	if (xen_hvm_domain() && xen_initial_domain())
> > > -		xen_store_domain_type = XS_LOCAL;
> 
> ...and only dom0 set to XS_LOCAL.
> 
> > > +		err = hvm_get_parameter(HVM_PARAM_STORE_EVTCHN, &v);
> > > +		if (err)
> > > +			goto out_error;
> > > +		xen_store_evtchn = (int)v;
> > > +		if (!v)
> > > +			xen_store_domain_type = XS_LOCAL;
> > > +	}
> > >   	if (xen_pv_domain() && !xen_start_info->store_evtchn)
> > >   		xen_store_domain_type = XS_LOCAL;
> > >   	if (xen_pv_domain() && xen_start_info->store_evtchn)
> > > @@ -987,10 +993,6 @@ static int __init xenbus_init(void)
> > >   		xen_store_interface = gfn_to_virt(xen_store_gfn);
> > >   		break;
> > >   	case XS_HVM:
> > > -		err = hvm_get_parameter(HVM_PARAM_STORE_EVTCHN, &v);
> > > -		if (err)
> > > -			goto out_error;
> > > -		xen_store_evtchn = (int)v;
> > >   		err = hvm_get_parameter(HVM_PARAM_STORE_PFN, &v);
> > >   		if (err)
> > >   			goto out_error;
>                 /*
>                  * Uninitialized hvm_params are zero and return no error.
>                  * Although it is theoretically possible to have
>                  * HVM_PARAM_STORE_PFN set to zero on purpose, in reality it
> is
>                  * not zero when valid. If zero, it means that Xenstore hasn't
>                  * been properly initialized. Instead of attempting to map a
>                  * wrong guest physical address return error.
>                  *
>                  * Also recognize all bits set as an invalid/uninitialized
> value.
>                  */
>                 if (!v) {
>                         err = -ENOENT;
>                         goto out_error;
>                 }
> 
> IIUC, this !v check is for enhanced no-xenstore to end up in XS_UNKNOWN.  I'll
> have to re-work to handle that case.

I was wondering about that when reviewing this patch, because the
removal of this check was the main change introduced I wasn't sure
about. Looking around I (wrongly) convinced myself that removing the
check was OK. Thank you for spotting this on your own.
