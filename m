Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E2E1422AB
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 09:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750584066; cv=none; b=Ji8zpA8N0R7ePDtprDUTsneNjHg99vg9WZGGaPDEOQl6z94n5D6BaFMAEMMq1erOzVtx463GZWwkHDkNLVYdg8HZLqz4bz9ztBXyZFkz58jO+m3SK8cu2RyX5Y/GalcSF6BYZxxcin1sKGppV623nHJEraEstxAbpZ1GVm8Q5NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750584066; c=relaxed/simple;
	bh=uPCcKNw39APpT9a5z3o0j5VJKViLZ8IDLffZEb2tfXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9CRqKWndAfNjnU16E3GhG+CKUcqLcYY+4u9l3U4vVBbMULv5gUsOP3TAxEeXEjNAH5v1uHBWCCGdOX8Eps8vDphTtcBXFm5rfevQLsJTStotVGxTTRwQFy71Qwk5oBRKKgPBI4UQu8bIBf5P9dgjsHbJwU2/kuEjiPIhyY3WeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kegJ5IWp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kegJ5IWp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7268C4CEE3;
	Sun, 22 Jun 2025 09:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750584066;
	bh=uPCcKNw39APpT9a5z3o0j5VJKViLZ8IDLffZEb2tfXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kegJ5IWpXcDRd1UwtFqP2+A0jM15+/hg8c9fffQ64MytrZRt9jb+buiXC7nJp5WHM
	 94uDkOyH3H73bfffR0aW2fzB+hDt3vqP6L6HAHi0K0xFVTuQwkbPRqATAy7rdxlzI8
	 GCNT12jA0SIbqtrP/0ynnfWJ8xVP2FiZSrDy1JnY=
Date: Sun, 22 Jun 2025 11:21:03 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: "Abliyev, Reuven" <reuven.abliyev@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [char-misc-next 1/3] mei: refcount mei_device
Message-ID: <2025062232-ion-onstage-fbd4@gregkh>
References: <20250618095433.3943546-1-alexander.usyskin@intel.com>
 <20250618095433.3943546-2-alexander.usyskin@intel.com>
 <2025062107-riding-stress-48a4@gregkh>
 <CY5PR11MB6366721138AC774A10698250ED7EA@CY5PR11MB6366.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY5PR11MB6366721138AC774A10698250ED7EA@CY5PR11MB6366.namprd11.prod.outlook.com>

On Sun, Jun 22, 2025 at 09:14:10AM +0000, Usyskin, Alexander wrote:
> > Subject: Re: [char-misc-next 1/3] mei: refcount mei_device
> > 
> > On Wed, Jun 18, 2025 at 12:54:31PM +0300, Alexander Usyskin wrote:
> > > mei_device lifetime is managed by devm procedure of parent device.
> > > But such memory is freed on device_del.
> > > Mei_device object is used by client object that may be alive after
> > > parent device is removed.
> > > It may lead to use-after-free if discrete graphics driver
> > > unloads mei_gsc auxiliary device while user-space holds
> > > open handle to mei character device.
> > >
> > > Replace devm lifetime management with reference counting
> > > to eliminate the use-after-free.
> > 
> > Overall, I like the end result, but note that if you just apply this
> > patch then:
> > 
> > > --- a/drivers/misc/mei/mei_dev.h
> > > +++ b/drivers/misc/mei/mei_dev.h
> > > @@ -474,6 +474,8 @@ struct mei_dev_timeouts {
> > >   * @cdev        : character device
> > >   * @minor       : minor number allocated for device
> > >   *
> > > + * @refcnt      : struct reference count
> > > + *
> > >   * @write_list  : write pending list
> > >   * @write_waiting_list : write completion list
> > >   * @ctrl_wr_list : pending control write list
> > > @@ -560,6 +562,8 @@ struct mei_device {
> > >  	struct cdev cdev;
> > >  	int minor;
> > >
> > > +	struct kref refcnt;
> > > +
> > >  	struct list_head write_list;
> > >  	struct list_head write_waiting_list;
> > >  	struct list_head ctrl_wr_list;
> > 
> > You now have 2 reference counts controling the lifespan of this
> > structure, and it will be a mess.
> > 
> 
> It is about cdev? But static cdev (like before third patch) is not refcounted.
> What is the second reference counter?

Yes, it is cdev, that is a reference counted object.

> > Yes, you clean it up in the last patch, so overall it's ok, this is just
> > a worrying step.
> > 
> > Also, why are you using a kref?  Why not use the real struct device if
> > you want to have a reference counted device structure?  That is what
> > should be happening here, what's wrong with the struct device * that you
> > already have?  Why not have that take over ownership instead of making a
> > newer intermediate reference counted object?
> > 
> 
> The device *dev in mei_device is the parent device.

Ah, how about naming it "parent"?

> On auxiliary bus it can be removed while driver is still active.

That's not ok.

> The device_del removes all memory allocated with devm_*.
> I can't find a way how to keep driver private memory alive
> till last reference to parent device still held.

Make it a real device please.

> This why I've resorted to manual kref.
> I'm feeling that I'm missing something here.
> Is there any other way to do it?

Yes, make it a real device.

thanks,

greg k-h
