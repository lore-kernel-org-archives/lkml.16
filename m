Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EF21F1313;
	Tue, 11 Feb 2025 09:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739266260; cv=none; b=TkYGXvk8GDPAeutdNN13bq6rnRh0FLa0mcNq7SNdeOgHFvHHR0FenHiQ941nioCRXYonRD2l9P5RXO+E7nZXqtepVefb6QK++562e8HjNbR8226HzXWlXdP1DEJO6fxDFH46YEB6bYZs8L1OcxmI2+ItN0Hyk4oIdGBtaTfo6Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739266260; c=relaxed/simple;
	bh=elcajnG12yaM/35Z1qSu/KU1kBet/j16pUgrNasrxhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sjSbmgU5YLk5cFzIaMV4P/op0Gd93R7D1BfWxh1m1LYsL2PFn4ckfnZqaF9q6S6mR41uDmFsdR1NdCXZgREyb3z3+VHcua62+ORU8W8+llulcYFWS4JrDamrPhbja3/uuFo6Bzhu2375inYuUD1bkSrrd+K0HHV64S2W4eaPbuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DBPR3rfa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DBPR3rfa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B48F0C4CEE4;
	Tue, 11 Feb 2025 09:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739266259;
	bh=elcajnG12yaM/35Z1qSu/KU1kBet/j16pUgrNasrxhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DBPR3rfagYKbF3XeSVubk2rK2NKZ2adnCGODrVLpWBenJmQL5xjfT2km+DL5HU8xY
	 XUSRqo5pd2WrixYKn6phSTByJIVyXFFXGf5QpoYws1PIh6S7YgzSZy2LGAW9qvHT+y
	 1DR7n6twsExKEF8FkWZwSGtXfkrPifdtyrtgboZ+BvtRkZzsab5+pVg7CojPRyspQl
	 pOd9NN1+X39SpRZvp6Ri63U2O5BpPcnfQusMWkoaT7OSTw4h2HJtNQzsbFrhbHVfeH
	 XR7LEEbLFObwX6ZBXgDg6gTZbYowEhMq0gR927YC9mi2zDKLOWAGqfbi9d03ioD6bV
	 2ddV6ij6t48sg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1thmbi-000000007Gz-46T4;
	Tue, 11 Feb 2025 10:31:07 +0100
Date: Tue, 11 Feb 2025 10:31:06 +0100
From: Johan Hovold <johan@kernel.org>
To: Tony Chung <tony467913@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 5/6] drivers: usb: serial: mos7840: replace 'unsigned'
 w/ 'unsigned int'
Message-ID: <Z6sY2lO3lmFCrKeb@hovoldconsulting.com>
References: <202410250141.AEkzzW60-lkp@intel.com>
 <20241025061711.198933-6-tony467913@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025061711.198933-6-tony467913@gmail.com>

On Fri, Oct 25, 2024 at 02:17:16PM +0800, Tony Chung wrote:
> Fix coding style "Prefer 'unsigned int' to bare use of 'unsigned'"
> 
> Signed-off-by: Tony Chung <tony467913@gmail.com>
> ---
>  drivers/usb/serial/mos7840.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
> index 31ec2cf1b..d2cae6619 100644
> --- a/drivers/usb/serial/mos7840.c
> +++ b/drivers/usb/serial/mos7840.c
> @@ -1201,7 +1201,7 @@ static void mos7840_change_port_settings(struct tty_struct *tty,
>  {
>  	struct usb_serial_port *port = mos7840_port->port;
>  	int baud;
> -	unsigned cflag;
> +	unsigned int cflag;

Just drop this one too.

You can follow this style suggestion in your own code, but there's
really no need to go around changing perfectly valid code just to
silence checkpatch.

Johan
