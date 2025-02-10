Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422551F8BBD;
	Mon, 10 Feb 2025 14:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739198964; cv=none; b=StLNc0dCN+ugQ5aV1m0ixkWupwIDVFNXST9kz8mJAlbLd5e35DKuahrzEYUjxSWNIk/Iaoogyp8+Pi7qx9gqhUGTyak/XbfYZ7j0hE6/RcZaqYxpF2GScrVsvVPrgVkU9bFCCZzSvF2grThdfsvWKeaHEgU8bk1OZyombceGef4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739198964; c=relaxed/simple;
	bh=/6RA5f0SloJlgfutepE42BrzZDcaWwvdcr/ZGQtyrB0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pdqOX08wf1pVVWBa1scWNi9/iL7MSX+a+0rxuvRkldL70Z59xhjpAkWWImCV8Ax52z0NOAo5NH9SVgS9rpbYaMS84Sdbs7pM20MOVAnZylVsitDIG87QLniyPcLuULLJAbVAuj7KWsr2KAhylMUVfMQJIV0afnRXML6RRGrO1Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zIMpPwX1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zIMpPwX1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1086AC4CED1;
	Mon, 10 Feb 2025 14:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739198963;
	bh=/6RA5f0SloJlgfutepE42BrzZDcaWwvdcr/ZGQtyrB0=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=zIMpPwX1lKzONYFv2pSy7Iw90SJdqC0w25m3jqQpQVX/0WHKOjpYB2M6J31nJSf9s
	 dwL57MePPnZZj0zib017epaZ2ywcUsaCrJWOE+Ah8qDU7QF64MyHJTWFL98LB1gLwZ
	 3mHo4k9id+g4ttzls6qiyI0ILYKQA2LPDrddCs9Q=
Date: Mon, 10 Feb 2025 15:49:20 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org, Lyude Paul <lyude@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 9/9] drm/vkms: convert to use faux_device
Message-ID: <2025021012-outback-greeter-d65c@gregkh>
References: <2025021023-sandstorm-precise-9f5d@gregkh>
 <2025021029-snout-swivel-9a45@gregkh>
 <Z6oPNmRo4XQQVEI8@louis-chauvet-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6oPNmRo4XQQVEI8@louis-chauvet-laptop>

On Mon, Feb 10, 2025 at 03:37:42PM +0100, Louis Chauvet wrote:
> On 10/02/25 - 13:30, Greg Kroah-Hartman wrote:
> > The vkms driver does not need to create a platform device, as there is
> > no real platform resources associated it,  it only did so because it was
> > simple to do that in order to get a device to use for resource
> > management of drm resources.  Change the driver to use the faux device
> > instead as this is NOT a real platform device.
> > 
> > Cc: Louis Chauvet <louis.chauvet@bootlin.com>
> > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > Cc: Simona Vetter <simona@ffwll.ch>
> > Cc: Melissa Wen <melissa.srw@gmail.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> Thanks for the modification, it seems to work.

Great, thanks for testing!

greg k-h
