Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B558A285C9F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 12:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751630451; cv=none; b=rE4ar0BNuSAow0H2gV2hYjFWpb98RvFWFleLlRVxkLHVPsQ4m12YOqrFyqXhdDZE5yovIgom+l+PoYOFiv1Gqg/aIf7QWN4Q6o5ZVTjojgsM5ft/3O8uGRgHhf45+i/fqecZjcYwkQ8oZlY0R5fTKdBpV31bAgfOCqlJCwEFdOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751630451; c=relaxed/simple;
	bh=r5nwI3i9qI0cG9KoOuXIzQTs4rQ+q37g+TXKsFTwsZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O3lO/Psk4KJ0wFUh7UsDh5vpGaZALoOgyE+iD1JKTupTVnso3AUtnNuUBzXNpbEWWYf36RdPsC6hk3koQur56FtBnxgRnJBn2H/2RrIF3/SrHpMhWzboM3g285vfifbVPyXyOFE25NhZW6Ah+PBkfyFCI3roByQLb2JN95TEHao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TJl2sHPg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TJl2sHPg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2741C4CEE3;
	Fri,  4 Jul 2025 12:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751630451;
	bh=r5nwI3i9qI0cG9KoOuXIzQTs4rQ+q37g+TXKsFTwsZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TJl2sHPg8FOyVDegfbyvyZiB/d62bEXHZg3Cj8h9oL1gKI8NTEQf9bcv41Ti883ry
	 qlPd2/02w5xudkvKieDuIKsnPfPFDYwFulHxaHyAjFtmqVa8BGkhuvwYNf47+WLcAH
	 gTFmKtpITjh96crSQ59qr8Q5+Jt+hp34HYGb5URE=
Date: Fri, 4 Jul 2025 14:00:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com, alexander.usyskin@intel.com,
	daniele.ceraolospurio@intel.com
Subject: Re: [PATCH v6 02/10] mei: late_bind: add late binding component
 driver
Message-ID: <2025070445-brilliant-savor-a98e@gregkh>
References: <20250703193106.954536-1-badal.nilawar@intel.com>
 <20250703193106.954536-3-badal.nilawar@intel.com>
 <2025070421-cattishly-buffed-d992@gregkh>
 <0b40eadc-c763-4cbc-910d-cbeb03b432d4@intel.com>
 <2025070452-rendering-passover-9f8c@gregkh>
 <fe774af5-76fb-4056-9eae-e2ccb0e0f078@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe774af5-76fb-4056-9eae-e2ccb0e0f078@intel.com>

On Fri, Jul 04, 2025 at 05:18:46PM +0530, Nilawar, Badal wrote:
> 
> On 04-07-2025 16:04, Greg KH wrote:
> > On Fri, Jul 04, 2025 at 03:59:40PM +0530, Nilawar, Badal wrote:
> > > On 04-07-2025 10:44, Greg KH wrote:
> > > > On Fri, Jul 04, 2025 at 01:00:58AM +0530, Badal Nilawar wrote:
> > > > > From: Alexander Usyskin <alexander.usyskin@intel.com>
> > > > > 
> > > > > Add late binding component driver.
> > > > > It allows pushing the late binding configuration from, for example,
> > > > > the Xe graphics driver to the Intel discrete graphics card's CSE device.
> > > > > 
> > > > > Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> > > > > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > > > > Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > > > > ---
> > > > >    drivers/misc/mei/Kconfig                    |   1 +
> > > > >    drivers/misc/mei/Makefile                   |   1 +
> > > > >    drivers/misc/mei/late_bind/Kconfig          |  13 +
> > > > >    drivers/misc/mei/late_bind/Makefile         |   9 +
> > > > >    drivers/misc/mei/late_bind/mei_late_bind.c  | 272 ++++++++++++++++++++
> > > > Why do you have a whole subdir for a single .c file?  What's wrong with
> > > > just keepign it in drivers/misc/mei/ ?
> > > There is separate subdir for each component used by i915/xe, so one was
> > > created for late_bind as well. Should we still drop late_bind subdir?
> > > 
> > > cd drivers/misc/mei/
> > >        gsc_proxy/ hdcp/      late_bind/ pxp/
> > For "modules" that are just a single file, yeah, that's silly, don't do
> > that.
> Another reason to maintain the sub_dir is to accommodate additional files
> for future platforms. If you still insist, I'll remove the sub_dir.

Move files around when it happens, for now, it's silly and not needed.

> > > > > + * @payload_size: size of the payload data in bytes
> > > > > + * @payload: data to be sent to the firmware
> > > > > + */
> > > > > +struct csc_heci_late_bind_req {
> > > > > +	struct mkhi_msg_hdr header;
> > > > > +	u32 type;
> > > > > +	u32 flags;
> > > > > +	u32 reserved[2];
> > > > > +	u32 payload_size;
> > > > As these cross the kernel boundry, they should be the correct type
> > > > (__u32), but really, please define the endiness of them (__le32) and use
> > > > the proper macros for that.
> > > If we go with __le32 then while populating elements of structure
> > > csc_heci_late_bind_req  I will be using cpu_to_le32().
> > > 
> > > When mapping the response buffer from the firmware with struct
> > > csc_heci_late_bind_rsp, there's no need to use le32_to_cpu() since the
> > > response will already be in little-endian format.
> > How do you know?  Where is that defined?  Where did the conversion
> > happen?
> 
> Sorry, I got confused. Conversion is needed when assigning the response
> structure elements.
> 
> e.g ret = (int)(le32_to_cpu)rsp.status;

But these are read directly from the hardware?  If not, why are they
marked as packed?

thanks,

greg k-h
