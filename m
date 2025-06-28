Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393C523B621
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 12:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751112637; cv=none; b=YzhWgGt0kibQQASNfQqw259aeYXFkkP0ewvVm825dBrZRMCnBzr8bsXbxBrOVeaG8nPSSz5re+cHcRBwXGLqlybxu/c5Y0vNk9A2l0x4p5PQ1sVUxUA3G98j3CfZgUQGKr//si09DCqYzJaMpcAwi0n6VxVIY4u9BAGNnbeX1DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751112637; c=relaxed/simple;
	bh=qoyAWaQudWyDJZacu3sHFbDrqDG+a9VP9HmNC1j3bnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTnEqfQZtFl7oVU5vtwzKCSKK63X8AmBKK79pYgaymgDGrWDc2JNC//snoMWCS0GdH+yp0w7cwmcx3r8h4B/TmAwwu3oRrOUZM76O6ReQmQCEUWVpdJ7foD9lsk53na1brnKDQwyPpDa8iv5kiQTssiG/bPwUtjGOAexgWfEbSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SicAehmL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SicAehmL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AAA0C4CEEE;
	Sat, 28 Jun 2025 12:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751112636;
	bh=qoyAWaQudWyDJZacu3sHFbDrqDG+a9VP9HmNC1j3bnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SicAehmLV26pVotno99i4fsPMj3KnM/9f194z/adq/W3cbpZXX4YOK260Zz44cgtd
	 XGG4gp81I43rnWc/oDFyUEYsPcncmiZAY4j0HheT63jTTECvmBRuWQC2VwdU1K3Mvu
	 FB5jkdsfNPVHz/IXv1xeCK00E9arMrsAgwIsh0IA=
Date: Sat, 28 Jun 2025 14:10:32 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [char-misc-next v2] mei: bus: fix device leak
Message-ID: <2025062836-twentieth-kudos-1148@gregkh>
References: <20250624110520.1403597-1-alexander.usyskin@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624110520.1403597-1-alexander.usyskin@intel.com>

On Tue, Jun 24, 2025 at 02:05:20PM +0300, Alexander Usyskin wrote:
> The bus rescan function creates bus devices for all clients.
> The fixup routine is executed on all devices, unneeded
> devices are removed and fully initialized once set
> is_added flag to 1.

I don't understand why the mei bus is so special that it has to have
this type of flag, when no other bus has that for its devices.  The bus
code should know if the device has been properly added or not, if not,
then no release function can be called and the structure isn't even
viable to be used or touched at all.

So why is this needed?

> 
> If link to firmware is reset right after all devices are
> initialized, but before fixup is executed, the rescan tries
> to remove devices.
> The is_added flag is not set and the mei_cl_bus_dev_destroy
> returns prematurely.
> Allow to clean up device when is_added flag is unset to
> account for above scenario.
> 
> Fixes: 6009595a66e4 ("mei: bus: link client devices instead of host clients")
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>  drivers/misc/mei/bus.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/misc/mei/bus.c b/drivers/misc/mei/bus.c
> index 67176caf5416..f2e5d550c6b4 100644
> --- a/drivers/misc/mei/bus.c
> +++ b/drivers/misc/mei/bus.c
> @@ -1430,17 +1430,14 @@ static void mei_cl_bus_dev_stop(struct mei_cl_device *cldev)
>   */
>  static void mei_cl_bus_dev_destroy(struct mei_cl_device *cldev)
>  {
> -
>  	WARN_ON(!mutex_is_locked(&cldev->bus->cl_bus_lock));
>  
> -	if (!cldev->is_added)
> -		return;
> -
> -	device_del(&cldev->dev);
> +	if (cldev->is_added) {
> +		device_del(&cldev->dev);
> +		cldev->is_added = 0;
> +	}

How can destroy be called here if the device has not been added before?
How can it be hanging around in memory at all if the device_add() call
was not successful when it was originally called?

confused,

greg k-h
