Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1E81F0E5C;
	Tue, 11 Feb 2025 09:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739266338; cv=none; b=Le/uM3j9yWYWc4jcRJnYWEySiqL2yHYYjaSELoZ/+lmoQBemBA0H0pRiGe9McbKQPARvhZZYU3spbC7iTvIfFKbzbcl8eTufVfyAkbaYwBMZEbYOMED2+QqSBQhojXJQ4rCqCQLPSxlZR5T3Le/HVqwuAsnQgZleJFTXIY2+nUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739266338; c=relaxed/simple;
	bh=CXY4oZKEr08bh1QgoV1j2Naijh4UikruZi1ZxhYnnco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UwOqEjDrj7CSBM2eq0LmhkKAh1txGWP2bgZ1+EyC3WKVZTqjFBVnqojJfMAs7VsP7fAwxtSKa3bCn5sA7+952mDnACMNtWc6SQyZt9JUJXDOONuU1Nd0EIM+Op/IszbPGGsUOHuOKmFN8cA+QGevi7FQu7SZ2xi3owt+Fn9AYhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yk4fFFUK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yk4fFFUK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E10C4CEDD;
	Tue, 11 Feb 2025 09:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739266338;
	bh=CXY4oZKEr08bh1QgoV1j2Naijh4UikruZi1ZxhYnnco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yk4fFFUKCcHBtPIJZth3C34QOMcLSuWN5ECkie366LnF71pvP959Ezve2OfvMji7I
	 KFsLkoJ1i2vYe8SxlqUu6Qp+3vZ15ASHvwpYck0pQC3q7jNylhTnX8e9bxvXRHyOkw
	 h9Erk0YMsEVZWVJFhqUg4BPXwOPKNqQcmuzinkR4=
Date: Tue, 11 Feb 2025 10:32:14 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: Tony Chung <tony467913@gmail.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 4/6] drivers: usb: serial: mos7840: using '__func__'
 to replace function name in dbg message
Message-ID: <2025021133-smooth-villain-bed8@gregkh>
References: <202410250141.AEkzzW60-lkp@intel.com>
 <20241025061711.198933-5-tony467913@gmail.com>
 <Z6sYclmvaAQ93bEI@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6sYclmvaAQ93bEI@hovoldconsulting.com>

On Tue, Feb 11, 2025 at 10:29:22AM +0100, Johan Hovold wrote:
> On Fri, Oct 25, 2024 at 02:17:14PM +0800, Tony Chung wrote:
> > fix warning of Prefer '"%s...",__func__' to using 'function name'.
> > 
> > Signed-off-by: Tony Chung <tony467913@gmail.com>
> > ---
> >  drivers/usb/serial/mos7840.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
> > index b48a26468..31ec2cf1b 100644
> > --- a/drivers/usb/serial/mos7840.c
> > +++ b/drivers/usb/serial/mos7840.c
> > @@ -230,7 +230,7 @@ static int mos7840_set_reg_sync(struct usb_serial_port *port, __u16 reg,
> >  	struct usb_device *dev = port->serial->dev;
> >  
> >  	val = val & 0x00ff;
> > -	dev_dbg(&port->dev, "mos7840_set_reg_sync offset is %x, value %x\n", reg, val);
> > +	dev_dbg(&port->dev, "%s offset is %x, value %x\n", __func__, reg, val);
> 
> I suggest you just leave this as is.

__func__ should NEVER be added to dev_dbg() lines as it is already
available if the user want it.  Adding it explicitly to the string is
just redundant.

thanks,

greg k-h
