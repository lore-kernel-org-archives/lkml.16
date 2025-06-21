Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9093597E
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 09:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750496832; cv=none; b=hKuJ3N9tMVSOSFbYMD/CDLBoCpIkwQwLR4NAPB16iOw9xQqqRAsijixeHHJU4p8YAwm3Y/+AlnwWpL6xkvE/CcRnDkLZinFWBSkeq2ATAYWsqcmFp4c+jdHcxdc0GEPaZatNxRjr8CjWn8jlsU8s1EpScB78+Flj5oFu9H/S/nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750496832; c=relaxed/simple;
	bh=5UFsYtv8K8dWXACihsTNYNkxxDg7uW8TPCCZJV5XQVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ruHzvxZoHUmG8BoZcFHfjtjizw3J9pRc4TL+TPM8/xAhBdL4/zCo+44vpE6SK4w/JBjBW4F82FjJMQWSwVQJq1vRmafo2dgL5Wi9hM/6w0amLNOgnOzd9oMq1lUMqpb0i4Uk8V6UMdHoIlSuwk4E2pHYiYa5W8N2tbLqwAgnFBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KuZOl5Qm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KuZOl5Qm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFF31C4CEE7;
	Sat, 21 Jun 2025 09:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750496831;
	bh=5UFsYtv8K8dWXACihsTNYNkxxDg7uW8TPCCZJV5XQVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KuZOl5QmTaCZX3ASvElcfr1n+iDPPGsjOu056DQCzS1U3zdlVBAmW2zbsQR2+KZKo
	 PK+EPhh8s5A7h2ptizJj7eUxXyljiaGbAIG1yNLs9NwUbKj/hkK4AtkPrfu4Gx2krj
	 ttXOP1nLQVw0eHGuj6F9C+srMREqKoA1f09faHXE=
Date: Sat, 21 Jun 2025 11:07:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [char-misc-next 1/3] mei: refcount mei_device
Message-ID: <2025062107-riding-stress-48a4@gregkh>
References: <20250618095433.3943546-1-alexander.usyskin@intel.com>
 <20250618095433.3943546-2-alexander.usyskin@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618095433.3943546-2-alexander.usyskin@intel.com>

On Wed, Jun 18, 2025 at 12:54:31PM +0300, Alexander Usyskin wrote:
> mei_device lifetime is managed by devm procedure of parent device.
> But such memory is freed on device_del.
> Mei_device object is used by client object that may be alive after
> parent device is removed.
> It may lead to use-after-free if discrete graphics driver
> unloads mei_gsc auxiliary device while user-space holds
> open handle to mei character device.
> 
> Replace devm lifetime management with reference counting
> to eliminate the use-after-free.

Overall, I like the end result, but note that if you just apply this
patch then:

> --- a/drivers/misc/mei/mei_dev.h
> +++ b/drivers/misc/mei/mei_dev.h
> @@ -474,6 +474,8 @@ struct mei_dev_timeouts {
>   * @cdev        : character device
>   * @minor       : minor number allocated for device
>   *
> + * @refcnt      : struct reference count
> + *
>   * @write_list  : write pending list
>   * @write_waiting_list : write completion list
>   * @ctrl_wr_list : pending control write list
> @@ -560,6 +562,8 @@ struct mei_device {
>  	struct cdev cdev;
>  	int minor;
>  
> +	struct kref refcnt;
> +
>  	struct list_head write_list;
>  	struct list_head write_waiting_list;
>  	struct list_head ctrl_wr_list;

You now have 2 reference counts controling the lifespan of this
structure, and it will be a mess.

Yes, you clean it up in the last patch, so overall it's ok, this is just
a worrying step.

Also, why are you using a kref?  Why not use the real struct device if
you want to have a reference counted device structure?  That is what
should be happening here, what's wrong with the struct device * that you
already have?  Why not have that take over ownership instead of making a
newer intermediate reference counted object?

thanks,

greg k-h
