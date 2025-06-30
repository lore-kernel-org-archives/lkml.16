Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5038F54
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751304470; cv=none; b=KnPGrzQheMej/jhco5n5HP0IBqjRnphtMq3pENeo7+d2HuKCaFboRZuWisBMvbuQqBGySeA1t3eAxZpe0/kwITLmV9007VDx5phP5SJC7eCeZ8LRPv+aZyZvSDTRGFScgSstH5mwuGC2IYkDcjAnkAGVhvTYOUpHa/tQcG55XAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751304470; c=relaxed/simple;
	bh=YCbHZEpIXZjy1jxWCAr3ksBnmXEcq4E+jG1I2WWdpTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dH9cNGmkBKEJSpfmKq4lyGANOemCoGhpvVX31R1qHpvw5lSbZcEikDYSdrpmDyDski6/icqKFhZ6WjtGUFOHWu4jkJZ0sMCNyuWz0bUvO9JajpLM/w+TVB8zppdvSxnnqeh/EulLZnNibT+oFsS5GpBNVUfGwVx7t8azNB6mq3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tpvwRlWq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tpvwRlWq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF223C4CEE3;
	Mon, 30 Jun 2025 17:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751304470;
	bh=YCbHZEpIXZjy1jxWCAr3ksBnmXEcq4E+jG1I2WWdpTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tpvwRlWq/kHENwrzP2osQniwZ61N7e9DO+wfKTsjruIKmv4zAxK7vtAoIylexNWN6
	 bIC8lC7cZ7YmZlNzpLCBVUVoEgdrOBEiP9R0iDsCdHXwe1dHsVbvroROVDWt6tOXb2
	 OoSgiI7gvedOH5f0ugdIPkg8h/KG5Hh8OdUVPs8o=
Date: Mon, 30 Jun 2025 19:27:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [char-misc-next v2 5/5] mei: create dedicated device object
Message-ID: <2025063045-bronchial-veggie-8288@gregkh>
References: <20250630091942.2116676-1-alexander.usyskin@intel.com>
 <20250630091942.2116676-6-alexander.usyskin@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630091942.2116676-6-alexander.usyskin@intel.com>

On Mon, Jun 30, 2025 at 12:19:42PM +0300, Alexander Usyskin wrote:
> mei_device lifetime is managed by devm procedure of parent device.

Ick, what could go wrong...

Hint, devm is not a good thing to ever use for other reference counted
structures that can be incremented/decremented independently.  This is
probably never going to work.

> But such memory is freed on device_del.
> Mei_device object is used by client object that may be alive after
> parent device is removed.
> It may lead to use-after-free if discrete graphics driver
> unloads mei_gsc auxiliary device while user-space holds
> open handle to mei character device.

Ah, are you trying to explain what happens today?  This isn't obvious.

> Add dedicated device object to control driver
> private data lifetime.

But where is that device in sysfs now?

> Rename exising parent device pointer from
> dev to parent to avoid misuse.

Why not do this rename first?

> Leave power management on parent device as
> user-space is expecting it there.

Why?  That feels totally wrong.

How does sysfs look before/after this change?  Is the bus still
addressed properly?

> 
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>  drivers/misc/mei/bus-fixup.c    |   6 +-
>  drivers/misc/mei/bus.c          |  24 ++++---
>  drivers/misc/mei/client.c       |  82 +++++++++++-----------
>  drivers/misc/mei/client.h       |   6 +-
>  drivers/misc/mei/dma-ring.c     |   8 +--
>  drivers/misc/mei/gsc-me.c       |  13 ++--
>  drivers/misc/mei/hbm.c          | 121 +++++++++++++++-----------------
>  drivers/misc/mei/hw-me.c        | 101 +++++++++++++-------------
>  drivers/misc/mei/hw-txe.c       |  62 ++++++++--------
>  drivers/misc/mei/init.c         |  85 +++++++++++++++-------
>  drivers/misc/mei/interrupt.c    |  45 ++++++------
>  drivers/misc/mei/main.c         |   9 ++-
>  drivers/misc/mei/mei_dev.h      |  11 +--
>  drivers/misc/mei/pci-me.c       |  12 ++--
>  drivers/misc/mei/pci-txe.c      |  10 ++-
>  drivers/misc/mei/platform-vsc.c |  18 ++---
>  16 files changed, 331 insertions(+), 282 deletions(-)
> 
> diff --git a/drivers/misc/mei/bus-fixup.c b/drivers/misc/mei/bus-fixup.c
> index 90dba20b2de7..e6a1d3534663 100644
> --- a/drivers/misc/mei/bus-fixup.c
> +++ b/drivers/misc/mei/bus-fixup.c
> @@ -386,7 +386,7 @@ static int mei_nfc_if_version(struct mei_cl *cl,
>  	ret = __mei_cl_send(cl, (u8 *)&cmd, sizeof(cmd), 0,
>  			    MEI_CL_IO_TX_BLOCKING);
>  	if (ret < 0) {
> -		dev_err(bus->dev, "Could not send IF version cmd ret = %d\n", ret);
> +		dev_err(&bus->dev, "Could not send IF version cmd ret = %d\n", ret);
>  		return ret;
>  	}
>  
> @@ -401,14 +401,14 @@ static int mei_nfc_if_version(struct mei_cl *cl,
>  	bytes_recv = __mei_cl_recv(cl, (u8 *)reply, if_version_length, &vtag,
>  				   0, 0);
>  	if (bytes_recv < 0 || (size_t)bytes_recv < if_version_length) {
> -		dev_err(bus->dev, "Could not read IF version ret = %d\n", bytes_recv);
> +		dev_err(&bus->dev, "Could not read IF version ret = %d\n", bytes_recv);
>  		ret = -EIO;
>  		goto err;
>  	}
>  
>  	memcpy(ver, reply->data, sizeof(*ver));
>  
> -	dev_info(bus->dev, "NFC MEI VERSION: IVN 0x%x Vendor ID 0x%x Type 0x%x\n",
> +	dev_info(&bus->dev, "NFC MEI VERSION: IVN 0x%x Vendor ID 0x%x Type 0x%x\n",
>  		 ver->fw_ivn, ver->vendor_id, ver->radio_type);

When drivers are working, they should be quiet :)

thanks,

greg k-h
