Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF13B214A8B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490294; cv=none; b=CpkmqJEkj/PmbjJLQkvJ0qhR4Hor/6wD9GHRC6qu5A5qtZkj6zXxjDc3w5dWDVB3/AQF61F2Hm89wbh8ARAXYah1jFm9zlABRxFkJF380g3gGcbHdQ4OQ+B5ggomzI/NdHANxESg88Nl4sM8MMVUu2+Kl17qOmfvbj/h06jEDOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490294; c=relaxed/simple;
	bh=JLwLcI7WwS0jnO0px40AeAM9JYWJ3GgJp9/uFeouVdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o1PpO3VOUp1DbALhtY6Kuw8c0ChkQRJGh9PCfb8XXSUkr3lwuwDNOWHWZuXIeF3iceTWH+ivVER28opGoqORZrVc+ep7C6xg17Bhs2Z+6n6y+6oJlqDAZf0+dLMmWD8MInaZsSGn6OUQo48YhTF9MDU2bwOfo9WbY/rubsfNy7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gleTAWOA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gleTAWOA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1586C4CEE3;
	Thu, 24 Apr 2025 10:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745490294;
	bh=JLwLcI7WwS0jnO0px40AeAM9JYWJ3GgJp9/uFeouVdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gleTAWOA7aL3F1UujjYWl2mmopCwehHU59xzTQPbLbmd+Hv90dQw6QODRNjyf9I5Z
	 IFmRfq84kaNYGUWzaXUbdThEuOf0/iUzPk12cbOVdcByMORYmqdVp0eqH//h36R/zF
	 s13zlKT+zFwWnzidYccVY3AqQL+n7wGFQvHkFBNs=
Date: Thu, 24 Apr 2025 12:24:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: rafael@kernel.org, dakr@kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] driver core: Introduce dev_err_ret() and dev_warn_ret()
Message-ID: <2025042427-supplier-matchbox-4342@gregkh>
References: <20250424093839.27451-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424093839.27451-1-rf@opensource.cirrus.com>

On Thu, Apr 24, 2025 at 10:38:39AM +0100, Richard Fitzgerald wrote:
> Add two helper functions dev_err_ret() and dev_warn_ret(). These are
> like dev_err_probe() and dev_warn_probe() but there is no special
> handling of EPROBE_DEFER.
> 
> Although dev_{err,warn}_probe() could be used outside of probe(), it
> has the disadvantage that if the error code is unexpectedly EPROBE_DEFER
> it would suppress it and also update the deferred probe reason. If code
> receives a EPROBE_DEFER in a situation where it cannot handle it, that
> really should be logged. There is also the potential for confusion when
> seeing a dev_{err,warn}_probe() inside a function that is not actually
> part of probe.
> 
> They have the same advantage of a standard error message format, and
> returning the error value so that code like:
> 
>   if (err) {
>           dev_err(dev, ..., err);
>           return err;
>   }
> 
> can be replaced with
> 
>   if (err)
>           return dev_err_ret(dev, err, ...);
> 
> The simple cases of dev_err_ret() and dev_warn_ret() could have been
> implemented as a trivial inline function to call dev_{err|warn}() and
> then return the passed error value. But it is useful to keep the same
> message format as dev_{err|warn}_probe() and re-using that code avoids
> scattering duplicate format strings around. Also it should slightly
> reduce the size of the error path code in the kernel because the compiler
> does not have to preserve the error code value for the final return.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
>  drivers/base/core.c        | 112 +++++++++++++++++++++++++++++++++----
>  include/linux/dev_printk.h |   3 +
>  2 files changed, 105 insertions(+), 10 deletions(-)

I'd like to see some users of this before we even review it as we don't
know how it would work, or if it would even save any code anywhere else.

thanks,

greg k-h
