Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A502F2705
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 10:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751625244; cv=none; b=NybarJk2dixkQ2RYN8dsuE7V22vcevpjM006NU+D394QEjuVYyL5yRrR4LVHZNBKRKFBUCMjBugCgUh2r4MTE+QKwFhjhzl44XYXZMJuYiH+VVzdP8GC8C69p4C8J2a0tLAPEhoU6EM+cTs9GMJQr1itvNvejvA7BgQ2y6nPYo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751625244; c=relaxed/simple;
	bh=s9H3urHY7KsjMSrb7cdjXRt0vO3W3YR4v83fB4ZzWO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ep6pxrtaiE4BDf0+X0GhejJtpO6QrvFPSMMegOhAOr1/zLpc13uDYcDhaqzFPee+MPBGe0vxiFsq3Erhlw7XvM735O56HLCsnLWR3B259Z8Zh/mYCVKKO3nSJ0U33FKPOSEE1DA2U+XixEKOjMdzgLuwUBz1YPq/Wl4YPZfL6Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OJ6fFCFn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OJ6fFCFn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86470C4CEE3;
	Fri,  4 Jul 2025 10:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751625244;
	bh=s9H3urHY7KsjMSrb7cdjXRt0vO3W3YR4v83fB4ZzWO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OJ6fFCFnhHQto411XNNpW/dZjk3PyLkOF+tJWnyRanWCvX0KoJZXO90zinyoc7QmI
	 kC33DUv6LkTW6A2Ok7ZM0NmueM1LSHhdHIZNAlQ8/4cBYYIhXN1T8AG+C4O0N12LIk
	 jFfJJtbDLXZdsBZMV0fyLLuKlE64EhNxYjRENCSc=
Date: Fri, 4 Jul 2025 12:34:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com, alexander.usyskin@intel.com,
	daniele.ceraolospurio@intel.com
Subject: Re: [PATCH v6 02/10] mei: late_bind: add late binding component
 driver
Message-ID: <2025070452-rendering-passover-9f8c@gregkh>
References: <20250703193106.954536-1-badal.nilawar@intel.com>
 <20250703193106.954536-3-badal.nilawar@intel.com>
 <2025070421-cattishly-buffed-d992@gregkh>
 <0b40eadc-c763-4cbc-910d-cbeb03b432d4@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b40eadc-c763-4cbc-910d-cbeb03b432d4@intel.com>

On Fri, Jul 04, 2025 at 03:59:40PM +0530, Nilawar, Badal wrote:
> 
> On 04-07-2025 10:44, Greg KH wrote:
> > On Fri, Jul 04, 2025 at 01:00:58AM +0530, Badal Nilawar wrote:
> > > From: Alexander Usyskin <alexander.usyskin@intel.com>
> > > 
> > > Add late binding component driver.
> > > It allows pushing the late binding configuration from, for example,
> > > the Xe graphics driver to the Intel discrete graphics card's CSE device.
> > > 
> > > Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> > > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > > Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > > ---
> > >   drivers/misc/mei/Kconfig                    |   1 +
> > >   drivers/misc/mei/Makefile                   |   1 +
> > >   drivers/misc/mei/late_bind/Kconfig          |  13 +
> > >   drivers/misc/mei/late_bind/Makefile         |   9 +
> > >   drivers/misc/mei/late_bind/mei_late_bind.c  | 272 ++++++++++++++++++++
> > Why do you have a whole subdir for a single .c file?  What's wrong with
> > just keepign it in drivers/misc/mei/ ?
> 
> There is separate subdir for each component used by i915/xe, so one was
> created for late_bind as well. Should we still drop late_bind subdir?
> 
> cd drivers/misc/mei/
>       gsc_proxy/ hdcp/      late_bind/ pxp/

For "modules" that are just a single file, yeah, that's silly, don't do
that.

> > > +/**
> > > + * struct csc_heci_late_bind_req - late binding request
> > > + * @header: @ref mkhi_msg_hdr
> > > + * @type: type of the late binding payload
> > > + * @flags: flags to be passed to the firmware
> > > + * @reserved: reserved field
> > Reserved for what?  Set to what?
> 
> Reserved by firmware for future use, default value set to 0, I will update
> above doc.
> 
> > 
> > > + * @payload_size: size of the payload data in bytes
> > > + * @payload: data to be sent to the firmware
> > > + */
> > > +struct csc_heci_late_bind_req {
> > > +	struct mkhi_msg_hdr header;
> > > +	u32 type;
> > > +	u32 flags;
> > > +	u32 reserved[2];
> > > +	u32 payload_size;
> > As these cross the kernel boundry, they should be the correct type
> > (__u32), but really, please define the endiness of them (__le32) and use
> > the proper macros for that.
> If we go with __le32 then while populating elements of structure
> csc_heci_late_bind_req  I will be using cpu_to_le32().
> 
> When mapping the response buffer from the firmware with struct
> csc_heci_late_bind_rsp, there's no need to use le32_to_cpu() since the
> response will already be in little-endian format.

How do you know?  Where is that defined?  Where did the conversion
happen?

> Are you fine with this?

Please be explicit.

> > > +	ret = (int)rsp.status;
> > > +end:
> > > +	mei_cldev_disable(cldev);
> > > +	kfree(req);
> > > +	return ret;
> > > +}
> > > +
> > > +static const struct late_bind_component_ops mei_late_bind_ops = {
> > > +	.owner = THIS_MODULE,
> > I thought you were going to drop the .owner stuff?
> > 
> > Or if not, please implement it properly (i.e. by NOT forcing people to
> > manually set it here.)
> 
> Somehow I missed this. I will drop it.

And from the structure definition please.

thanks,

greg k-h
