Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF270292906
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751304343; cv=none; b=En45G5j0Je7opJ2Xp2wJrqsdm6oegy07wawTrVEf5T+B3km4SYP+kKhcQ9e3meeWcW5j9hKu4PD+X5Hda2copegTIZ7fjjghdaW3SsditKoqQ0V0z42WXjkXnF860nI6c2prTbaTsNElk53yrrCLh3WYN03xskP606SheIWv5ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751304343; c=relaxed/simple;
	bh=nWwg7sfjrSDVzSTikSa9cZUEacY31p9KvbIQJaC7FPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q6FOwE3efezMlNK4g02rXAtFSdmM08lmfCDzOgxK97DiF6uPNasLOqHrbkgw+D22084G8kjQmjFPg1rXeHbp0RSfm0Knnd1B6i3dvtdu2nT3Q8C9kboSkBRQBQJzua2v9NtT26ROiID2N9RAQvfQJQymXH5ptnJG2KVsNbI3EbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gN8K2Mgx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gN8K2Mgx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1DADC4CEE3;
	Mon, 30 Jun 2025 17:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751304342;
	bh=nWwg7sfjrSDVzSTikSa9cZUEacY31p9KvbIQJaC7FPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gN8K2MgxHF1Nv3YW8VaPtYOCQz7DfH7554KPRjx1BhoLnQPjw3/X9rjWoXFnmNrpx
	 YbvpAdzEJtq/sdbngXLRj085YxxiVYd9USClEzHZP00z8u9h/1n/WDyROXVLq8EeqO
	 dmRYxSlzQ7wVz+JZdzKzadlzyomXuke6/4OLhjgs=
Date: Mon, 30 Jun 2025 19:25:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [char-misc-next v2 4/5] mei: more prints with client prefix
Message-ID: <2025063003-doable-magician-3218@gregkh>
References: <20250630091942.2116676-1-alexander.usyskin@intel.com>
 <20250630091942.2116676-5-alexander.usyskin@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630091942.2116676-5-alexander.usyskin@intel.com>

On Mon, Jun 30, 2025 at 12:19:41PM +0300, Alexander Usyskin wrote:
> Use client-aware print macro instead of
> usual device print in more places.

Why?  This changes the output of the driver.

> 
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>  drivers/misc/mei/hbm.c       | 14 ++++-----
>  drivers/misc/mei/interrupt.c |  2 +-
>  drivers/misc/mei/main.c      | 55 +++++++++++++++++-------------------
>  3 files changed, 34 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/misc/mei/hbm.c b/drivers/misc/mei/hbm.c
> index 026b1f686c16..4fe9a2752d43 100644
> --- a/drivers/misc/mei/hbm.c
> +++ b/drivers/misc/mei/hbm.c
> @@ -510,7 +510,7 @@ int mei_hbm_cl_notify_req(struct mei_device *dev,
>  
>  	ret = mei_hbm_write_message(dev, &mei_hdr, &req);
>  	if (ret)
> -		dev_err(dev->dev, "notify request failed: ret = %d\n", ret);
> +		cl_err(dev, cl, "notify request failed: ret = %d\n", ret);

Why do you have a mei-specific debug printk macro anyway?  You really
shouldn't do that :(

This feels like a step backwards.

thanks,

greg k-h
