Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849D12E403;
	Sun,  1 Jun 2025 15:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748793024; cv=none; b=k2J2AdSU4aF+pjuLziLw+jC7ikvw7MfYlEM2Abvg0oJbkjGX5pGPmO8XkevzE/DrnBF76IRtuv/vRTmzgqoCBSbr/Vie9lp7nS8I/uQgYEleEGPev9pb8Hw0Iuq45HGbSrCoxqaLrdb8TxeozZwjGZcsrs6HkOU3zTBoe1AIwN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748793024; c=relaxed/simple;
	bh=hejXRJNQ1k7b8RshQgCr/Kt+JdsgfhgO5GvA7uBuh4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y0YUrOIBO6mWSF8goovCICuYrn97UFwlzDWysvhbEhOg66nBgBwMxz1VWYG5fleoJKmQ20nMqF4mG720Zt4rZX5R9pjQFgtOMe6BckPbgTwBysepvTqwtwBdguRazGBEQz++ZDK+tQUuZpED0oczyp8TbHukneZ2141M64y1vyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=z3yVYMWL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="z3yVYMWL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8F2C4CEE7;
	Sun,  1 Jun 2025 15:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748793024;
	bh=hejXRJNQ1k7b8RshQgCr/Kt+JdsgfhgO5GvA7uBuh4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=z3yVYMWLmFi/6YtEYobMeAHLqfiWlVHo1TfUmJm1b8nixgMiKrvw7s7LumDTR0kNY
	 SyqfN/J2M7kLU/h3Y6tkApY4eThOoBfppdusZvrE4GiUT3rwriLTXvU6Cm6kNy4PQA
	 /YSwns/K/X3VJ4jiCw+rb6/EbfQXv9zyoYgciy1U=
Date: Sun, 1 Jun 2025 17:50:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, arnd@arndb.de,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v2 0/3] Add control driver for ST M24LR RFID/NFC EEPROM
 chips
Message-ID: <2025060109-renderer-revisable-a135@gregkh>
References: <20250601153022.2027919-1-abd.masalkhi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250601153022.2027919-1-abd.masalkhi@gmail.com>

On Sun, Jun 01, 2025 at 03:30:18PM +0000, Abd-Alrhman Masalkhi wrote:
> This patch series adds support for the control interface of STMicroelectronics 
> M24LR RFID/NFC EEPROM devices, such as the M24LR04E-R. The chip exposes two 
> I2C addresses and two distinct address spaces: one for the system parameter 
> sector and another for the EEPROM memory. These address spaces overlap (both
> start at address 0). Due to this overlap, the chip cannot be represented by a
> single Device Tree node and handled by the standard at24 driver.
> 
> While it might be possible to model the system parameter sector and EEPROM
> as two separate DT nodes, each handled by the standard at24 driver, this
> leads to synchronization problems. For example, if a multi-page EEPROM write
> is in progress and a control command (e.g., a i2c write lock) is issued
> concurrently, it can result in incomplete or inconsistent writeing.
> 
> To overcome these issues, while maintaining a clean architecture and ensuring
> synchronization, the chip is managed by two drivers:
> 
> 1- The first driver exposes the system parameter sector and acts as an I2C mux
>    (gate) for EEPROM access. Using an I2C mux solves the synchronization issue.
>    This patch series implements this driver.
> 2- The second is the standard at24 driver, which handles the EEPROM.
> 
> Tested on: M24LR04E-R using Yocto on Raspberry Pi 4
> 
> Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
> 
> Abd-Alrhman Masalkhi (3):
>   dt-bindings: eeprom: Add ST M24LR control interface
>   misc: add sysfs control driver for ST M24LR series RFID/NFC chips
>   ABI: sysfs: document control attributes for ST M24LR
> 
>  .../testing/sysfs-bus-i2c-devices-m24lr_ctl   |  96 +++
>  .../devicetree/bindings/eeprom/st,m24lr.yaml  |  72 ++
>  drivers/misc/Kconfig                          |  15 +
>  drivers/misc/Makefile                         |   1 +
>  drivers/misc/m24lr_ctl.c                      | 677 ++++++++++++++++++
>  5 files changed, 861 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-m24lr_ctl
>  create mode 100644 Documentation/devicetree/bindings/eeprom/st,m24lr.yaml
>  create mode 100644 drivers/misc/m24lr_ctl.c
> 
> -- 
> 2.43.0
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
