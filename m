Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAEF173;
	Tue,  3 Jun 2025 04:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748924388; cv=none; b=LwPaH/x94kJROKMk8RNGdZBo4ZsbMagYo3jKHj1EtTNekBYSwOn5nkoq0PRFuuxk1qiMN23erbkdqyAqfoSMlJPLaRHufB+i+NxJo+CDXkKghr62VYOwFQLYQgYZQmK4tJq3miAxeh1dRZdIUNGAUmiIsYGFAxGsfMQNFMLCNvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748924388; c=relaxed/simple;
	bh=phYCs0zFBYWqHjj30gw1zW5eFZwI1o8rpsapA3My3jo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gUZC+AIHiCDqysAYbIj7G/D2ZujjJg1ru/u6mRIDtq578YNUp5hstz673PsJaRfMEcfiRS57fBAp9TgirzG8u+WajxpjuFsF/tgYnhpKQXMV05iOn/c1zJBwaRJ5Fvg6aJxInZcZ5zumqC3c9qUaDHC3WbWfvbqEdf4rOYHMtwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JxXsdVNL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JxXsdVNL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CC8FC4CEED;
	Tue,  3 Jun 2025 04:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748924387;
	bh=phYCs0zFBYWqHjj30gw1zW5eFZwI1o8rpsapA3My3jo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JxXsdVNLZEbn46WTMHKuX7VhfV4fEmUWmUUU1X8TkS8bM7wPd3/WZwqCrAvaYgiXc
	 afttOuqD1DqB68dTTEhXDMYgBT9cK1FgKKvMOc7Ak4sq1rGYEJdFT8AWrSmVQFjEsD
	 ppRHyVIgNEcIuZC1kZGGHUY6HshDvtWMQv+F/u+8=
Date: Tue, 3 Jun 2025 06:19:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: hsyemail2@gmail.com
Cc: Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, Sheng-Yuan Huang <syhuang3@nuvoton.com>
Subject: Re: [PATCH v1 1/1] USB: serial: nct_usb_serial: add support for
 Nuvoton USB adapter
Message-ID: <2025060325-everyone-padlock-931a@gregkh>
References: <20250603032057.5174-1-syhuang3@nuvoton.com>
 <20250603032057.5174-2-syhuang3@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603032057.5174-2-syhuang3@nuvoton.com>

At quick glance, this looks good, but one thing overall stood out:

On Tue, Jun 03, 2025 at 11:20:57AM +0800, hsyemail2@gmail.com wrote:
> +	if (size > NCT_MAX_VENDOR_READ_SIZE)
> +		dev_err(dev, NCT_DRVNAME ": %s - failed to read [%04x]: over size %d\n",
> +			__func__, cmd.p.cmd, size);

When using dev_*() functions, you do not need a "driver prefix" here
like NCT_DRVNAME as it already is in the string that is sent to the
kernel log.  So that all can be removed from all of these.

Also:

> +	dev_dbg(&intf->dev, NCT_DRVNAME ": %s tty baud: 0x%X\n", __func__,
> +		(cflag & CBAUD));

The __func__ is already in the dev_dbg() output, so no need to repeat it
again please.

This should be done for all of the calls like this in the driver.

> +	dev_info(&intf->dev, NCT_DRVNAME ": %s Enabled devices mask:%X\n",
> +		 __func__, buf[0]);

When drivers are working properly, they are quiet, so no need for this
line at all.

thanks,

greg k-h
