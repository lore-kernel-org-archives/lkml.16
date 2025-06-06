Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E846128E0F;
	Fri,  6 Jun 2025 12:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749212914; cv=none; b=KimRJKEIYh/msldVPK+S2DVUUMAp02ZE3P6ieQhglvIt8tKI+7J9O7NRLbZqBkdMuuZdBt6xEJVuk2/LMBNMVvJXaHrQsppFEQKnJrIL0bzdTQMK99iWF8ZnZZt/LYSxo4r9tzE2q20yO9eLP0cetdZvtzj08d7ptvx6a8lMaDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749212914; c=relaxed/simple;
	bh=jAkYL4VXVnMBgY+eRaXVCeLOmNfQxDZf8QjlfRZ3Fnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EiJSJ0/WHHL8SZHHbUqPzitmJ2sBico3AFCFcDHtrH7dQ4JrALm2ng09xp2QPbIwdeRqcwYo9ENypn4xl9MMVEJhdsyUcRqydzpzpazHJPEX7euXNmwrRuZmyQHdkg8kXmEmr7OiVQi96W+4M4SZilK29AhGdZtgq9IGaW4vDug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ynoObLXa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ynoObLXa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06B72C4CEEB;
	Fri,  6 Jun 2025 12:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749212913;
	bh=jAkYL4VXVnMBgY+eRaXVCeLOmNfQxDZf8QjlfRZ3Fnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ynoObLXaB/tB8TrJbEjSXuDCG94H2eGnP9qg7EnWf0qd/vD7UlXkIdV22PtIuZX+o
	 IlVPlPpIa5mof3pTFKdeuBZy1qcwF8Cwr9jAsmt3HbGtehFBkdmzplU6LiX75lE8Ed
	 6eNVn8fHcuG8FbfiGekTd4OrcRwONJ11oQP9aCdE=
Date: Fri, 6 Jun 2025 14:28:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, arnd@arndb.de,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3 3/3] ABI: sysfs: add documentation for ST M24LR EEPROM
 and control interface
Message-ID: <2025060632-luridness-carpool-bf90@gregkh>
References: <20250606120631.3140054-1-abd.masalkhi@gmail.com>
 <20250606120631.3140054-4-abd.masalkhi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606120631.3140054-4-abd.masalkhi@gmail.com>

On Fri, Jun 06, 2025 at 12:06:31PM +0000, Abd-Alrhman Masalkhi wrote:
> Add sysfs ABI documentation for the STMicroelectronics M24LR device,
> covering both the control interface (e.g., unlock, password update, UID,
> memory size, and SSS entries) and EEPROM access via the nvmem subsystem.
> 
> Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
> ---
> Changes in v3:
>  - Updated sysfs entry paths to use <busnum>-<primary-addr> to reflect the
>    control address.
> 
> Changes in v2:
>  - Added initial sysfs ABI documentation.
> ---
>  .../ABI/testing/sysfs-bus-i2c-devices-m24lr   | 96 +++++++++++++++++++
>  1 file changed, 96 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-m24lr
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-i2c-devices-m24lr b/Documentation/ABI/testing/sysfs-bus-i2c-devices-m24lr
> new file mode 100644
> index 000000000000..53b6fe39162c
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-i2c-devices-m24lr
> @@ -0,0 +1,96 @@
> +What:           /sys/bus/i2c/devices/<busnum>-<primary-addr>/unlock
> +Date:           2025-05-31

It's later than this.

> +KernelVersion:  6.16

This will not be showing up in 6.16, sorry, it's too late for that.

> +Contact:        Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
> +Description:
> +                Write-only attribute used to present a password and unlock
> +                access to protected areas of the M24LR chip, including
> +                configuration registers such as the Sector Security Status
> +                (SSS) bytes. A valid password must be written to enable write
> +                access to these regions via the I2C interface.
> +
> +                Format:
> +                  - Hexadecimal string representing a 32-bit (4-byte) password
> +                  - Accepts 1 to 8 hex digits (e.g., "c", "1F", "a1b2c3d4")
> +                  - No "0x" prefix, whitespace, or trailing newline
> +                  - Case-insensitive
> +
> +                Behavior:
> +                  - If the password matches the internal stored value,
> +                    access to protected memory/configuration is granted
> +                  - If the password does not match the internally stored value,
> +                    it will fail silently

Why is the kernel in the business of adding passwords to devices?  That
feels wrong, and a way to just flood the device with a "try all the
values" attempt if needed.

> +What:           /sys/bus/i2c/devices/<busnum>-<primary-addr>/sss<N>
> +Date:           2025-05-31
> +KernelVersion:  6.16
> +Contact:        Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
> +Description:
> +                Read/write attribute representing the Sector Security Status
> +                (SSS) byte for EEPROM sector <N> in the M24LR chips. Each sector
> +                has one SSS byte, which defines I2c and RF access control via a
> +                combination of protection and password settings.
> +
> +                Format:
> +                  - Read: returns a 8-bit hexadecimal value followed by a
> +                          newline
> +                  - Write: requires exactly one or two hexadecimal digits
> +                      - No "0x" prefix, whitespace, or trailing newline
> +                      - Case-insensitive
> +
> +                Notes:
> +                  - Refer to the M24LR chip datasheet for full bit definitions
> +                    and usage
> +                  - Write access requires prior password authentication in I2C
> +                    mode

How "deep" does this sysfs tree get here?  This feels like the wrong api
for read/write to the device, just do it with a single binary file if
you really want a "passthrough" way to get to the hardware.

thanks,

greg k-h
