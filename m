Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5392A1BD9D2;
	Tue, 11 Feb 2025 09:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739266713; cv=none; b=UFW8XNC9vI3EWsx9ISRAyxgkcrYvkJhGBuYmnbYSKgjy9OAk5rzismBdqMK0F1sBQfyQpVaScfaqv9blazow9/HHZICEtiagNOTUvdWmlVkfdAiRwGEbXjT2juDdJeNVNTVRJuB+bGftBktQkdUVPxXv3hdnvPtLdnktFG/AZiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739266713; c=relaxed/simple;
	bh=L6DJj97sTP9FMTBli3K7axoJAYLa4k2vsVXW8nIylpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mpsqAnqeFi3Ie8K8VZvThlWpGfKTzfoMP8CijS7Jp3sZTpZ2TCucwzXuHpONO6YegD+JWLE1HVQquFinB0JouTa6oVPRYc2rvF/cRrmYvV7I1/e0ilfEMROI1/vzj8dTjzeADRH0rt+i9vAvIYCT27MmjBaIfXUd78OH7I7G0pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ArzjbDIX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ArzjbDIX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C78BAC4CEE4;
	Tue, 11 Feb 2025 09:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739266712;
	bh=L6DJj97sTP9FMTBli3K7axoJAYLa4k2vsVXW8nIylpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ArzjbDIXNKPburqOPiQP8pvczQTaPQgbQtlIOklYY7vn0B3BqMtZDfhr7Y2iRDa6q
	 6opbofGpdFNO6bgV4/Ibdx9pl8FYAxlI1zQdgtNuktn0b+fdE3nxr2ahwilOpAVFp+
	 lh4nnVTFs1q3hLZC0uEoaKqE1t8E0PIFFKebd794+hQUoKHfrX/NtTPI1e82ImdVK2
	 LDyAwwVbgbB/6979J3zEYK6B2hJ5ytzI7BWF39Wj+eRaR+DkM5dY4nQIGYPLM++bfk
	 h2GQUDu4+F4V6vIS3qkCP6t3tkiC0jkXgf/o6ykoR6Qoguclmu57NNGawChY/pcTXV
	 sXfrjMLv/Zh5w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1thmj2-000000007QL-0FEx;
	Tue, 11 Feb 2025 10:38:40 +0100
Date: Tue, 11 Feb 2025 10:38:40 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Tony Chung <tony467913@gmail.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 4/6] drivers: usb: serial: mos7840: using '__func__'
 to replace function name in dbg message
Message-ID: <Z6saoGpHtGial-Jw@hovoldconsulting.com>
References: <202410250141.AEkzzW60-lkp@intel.com>
 <20241025061711.198933-5-tony467913@gmail.com>
 <Z6sYclmvaAQ93bEI@hovoldconsulting.com>
 <2025021133-smooth-villain-bed8@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025021133-smooth-villain-bed8@gregkh>

On Tue, Feb 11, 2025 at 10:32:14AM +0100, Greg Kroah-Hartman wrote:
> On Tue, Feb 11, 2025 at 10:29:22AM +0100, Johan Hovold wrote:
> > On Fri, Oct 25, 2024 at 02:17:14PM +0800, Tony Chung wrote:
> > > fix warning of Prefer '"%s...",__func__' to using 'function name'.
> > > 
> > > Signed-off-by: Tony Chung <tony467913@gmail.com>
> > > ---
> > >  drivers/usb/serial/mos7840.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
> > > index b48a26468..31ec2cf1b 100644
> > > --- a/drivers/usb/serial/mos7840.c
> > > +++ b/drivers/usb/serial/mos7840.c
> > > @@ -230,7 +230,7 @@ static int mos7840_set_reg_sync(struct usb_serial_port *port, __u16 reg,
> > >  	struct usb_device *dev = port->serial->dev;
> > >  
> > >  	val = val & 0x00ff;
> > > -	dev_dbg(&port->dev, "mos7840_set_reg_sync offset is %x, value %x\n", reg, val);
> > > +	dev_dbg(&port->dev, "%s offset is %x, value %x\n", __func__, reg, val);
> > 
> > I suggest you just leave this as is.
> 
> __func__ should NEVER be added to dev_dbg() lines as it is already
> available if the user want it.  Adding it explicitly to the string is
> just redundant.

It can sometimes be useful to allow for compact but self-contained debug
messages that makes sense also when the generic function prefix is not
printed (I tend not to enable those myself).

But in general, try to follow the style of the driver you're changing.

Johan
