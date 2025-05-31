Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E054156F28;
	Sat, 31 May 2025 08:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748679850; cv=none; b=YtEf6lvwnJPRFV5W4B6jVvJ9UoLMr4+VEPwOp+E4W2Mi7X+BeDzzIstsHCJT4i+FCv3XbT3vcebuhlYvdWqZPhybVXCjf7LKyqod/5pQAUOg2skaPSfhG45Pxj9gqqJ8dJC5sfmX/o75oahFX+jTwPZtN2zhiCcB52MGkUvxymo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748679850; c=relaxed/simple;
	bh=ZrQNziy5pLMUUO6PL2SqYbWHdIJAq1F10Q0TiH0CoCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fnv+ZBmPQT9RLu5G3npPX+2w5MpgP3KTXG6nIBYWULvrRkkmgabBp7Cg7zbLbw9rxIJo1OVpOvhOWBUyuOrlRzdHzzTHpPswTm69jXwwY/+BNfKRSjzmkszp0fpR/GVHrgIkvVlRv3W36S/BxqRTWgN5P4VdgO5HxpoA1ZpnbTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=O5Dzxm2c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="O5Dzxm2c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 529D8C4CEE3;
	Sat, 31 May 2025 08:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748679849;
	bh=ZrQNziy5pLMUUO6PL2SqYbWHdIJAq1F10Q0TiH0CoCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O5Dzxm2cPtx0MF/lWLq9+XoLv991VI9Ru6+/bMjvus0trIbNJijNP0Q9O066u5rQQ
	 VPHXNvrGIuFA2zn2/xtp60TwZkB/T25b8/efolBaj4g+Ryx1jaDlgtorJAajG2e/bl
	 iwBWnv70CqNTBAd+kv3dlcC/nbHlQFwA6BxXInzk=
Date: Sat, 31 May 2025 10:24:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	arnd@arndb.de
Subject: Re: [PATCH 2/3] misc: add sysfs control driver for ST M24LR series
 RFID/NFC chips
Message-ID: <2025053131-starship-radiantly-2cd8@gregkh>
References: <20250531081159.2007319-1-abd.masalkhi@gmail.com>
 <20250531081159.2007319-3-abd.masalkhi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531081159.2007319-3-abd.masalkhi@gmail.com>

On Sat, May 31, 2025 at 08:11:58AM +0000, Abd-Alrhman Masalkhi wrote:
> Add a sysfs-based control driver for the STMicroelectronics M24LR
> series RFID/NFC EEPROM chips, such as the M24LR04E-R. It enables
> access to control registers for features such as password
> authentication, memory access, and device configuration. It also
> synchronize access to the device. (The EEPROM uses a separate driver;
> see the note below for details.)
> 
> This driver provides only the control interface for M24LR chips. It
> also acts as an I2C mux (gate) for the EEPROM. Therefore, the EEPROM
> is represented as a child node in the Device Tree and is accessed
> through a separate driver (the standard 'at24' driver). This setup
> is possible because M24LR chips use two I2C addresses: one for
> accessing the system parameter sector, and another for accessing
> the EEPROM.
> 
> Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
> ---
>  drivers/misc/Kconfig     |  15 +
>  drivers/misc/Makefile    |   1 +
>  drivers/misc/m24lr_ctl.c | 677 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 693 insertions(+)
>  create mode 100644 drivers/misc/m24lr_ctl.c

If you are adding sysfs files, you must have Documentation/ABI/ entries
to describe this new user/kernel api that you are creating and must
support for the next 20+ years, and to give us a hint as to how to
review this driver properly.

One minor comment below:

> +	err = i2c_mux_add_adapter(muxc, 0, 0, 0);
> +	if (err)
> +		return err;
> +
> +	dev_info(&client->dev, "control interface initialized for %s\n",
> +		 client->name);

When drivers work properly, they are quiet, no need to spam the kernel
log for a correctly working system.

thanks,

greg k-h
