Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D541A38F9;
	Fri,  6 Jun 2025 15:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749225515; cv=none; b=pFFbO3F7i4VRMHynhyYlXvLT77Gss/m9GV8P4lYb61POiNlbaGiy+EaPaq8o5GF4xnU45tUd6SMdpLnZGM4IvTIaadLxGmxzJzdLndptrIvrNKQGWPGUqIX4gDTYfAY+kefWJpRMRMzQI7vK9dazB0bee75RpjJC+uje7+0T+38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749225515; c=relaxed/simple;
	bh=AL9QLyGrPiB1rKESmOFNM9nstIUPTufyq9r7kW0msVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PyBdFD2WS0Ib28V65a6L5GtEVXaVmJfIafGpgJjGAD09wUmvKY5MDgSqfUW3zvfoVL+O7NPLLSaIhgkXCJzqXFHG7yMI/jP/Wx2rnZ0ZnhTd6sUvdeENiR5h+nUyw2Yvot7/9z9W5bbPso+HMSkvjPmSXkpClQ2GcF9ViUHgBK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OFTt35IO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OFTt35IO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C3C9C4CEEB;
	Fri,  6 Jun 2025 15:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749225513;
	bh=AL9QLyGrPiB1rKESmOFNM9nstIUPTufyq9r7kW0msVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OFTt35IOAIC/mybfp6f42KZChNyZFl6qHw3JH5bSMseFWQa4H75nB9oZDpHrI+apS
	 WvY/aG3eIw4e6QK4eGF2a4YLhB51rwFsRqRsWsdCQiH1E4SDEC1MvaD9SZDYC5xShi
	 CyB0/xr5WMe/6zW0JcZbpjPh5ZOmGSXCIu6cv6zA=
Date: Fri, 6 Jun 2025 17:58:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
Cc: arnd@arndb.de, conor+dt@kernel.org, devicetree@vger.kernel.org,
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v3 2/3] misc: add driver for ST M24LR series RFID/NFC
 EEPROM chips
Message-ID: <2025060657-nemeses-perpetual-c70f@gregkh>
References: <2025060650-tried-widen-4443@gregkh>
 <20250606142456.3140225-1-abd.masalkhi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606142456.3140225-1-abd.masalkhi@gmail.com>

On Fri, Jun 06, 2025 at 02:24:56PM +0000, Abd-Alrhman Masalkhi wrote:
> >> +	if (unlikely(!is_power_of_2(reg_size) || reg_size > 8)) {
> >> +		dev_dbg(dev,
> >> +			"Invalid register size: must be a power of 2 and <= 8 bytes (%u)\n",
> >> +			reg_size);
> >> +		return -EIO;
> >
> > Not -EINVAL?  This isn't an I/O error.
> 
> The last if statement is primarily for debugging purposes. The reg_size
> value is specified internally by the driver (not user-controlled), so
> this check helps catch potential mistakes in the driver's sysfs entry
> definitions. That's why I used -EIO instead of -EINVAL, as it's not due
> to invalid user input but rather an internal misconfiguration.

But you just leaked your internal check to userspace in a potential
error code, so you must justify why userspace would ever see it and what
it should do with it :)

Just make it EINVAL please.  And if this is something that can't
actually happen, don't check it at all.

> >> +		for (i = 0; i < n_sss; i++) {
> >> +			char *name = devm_kasprintf(dev, GFP_KERNEL, "sss%d", i);
> >> +
> >> +			sss[i].reg_size = 1;
> >> +			sss[i].reg_addr = i;
> >> +			sss[i].attr.attr.name = name;
> >> +			sss[i].attr.attr.mode = 0600;
> >> +			sss[i].attr.show = m24lr_ctl_show;
> >> +			sss[i].attr.store = m24lr_ctl_store;
> >> +
> >> +			err = device_create_file(dev, &sss[i].attr);
> >
> > You just raced with userspace and lost. This is not how to do this,
> > please do not dynamically create attributes (hint, this should have
> > errored out as you didn't correctly initialize them), but also:
> 
> I didn't fully understand where the race condition comes from. Is
> the issue caused by calling device_create_file() from within the
> probe() function, or is it due to the fact that the attributes
> are being allocated dynamically rather than defined statically?

From calling device_create_file() at any point in time.  The driver core
should be doing that, not individual drivers.

thanks,

greg k-h
