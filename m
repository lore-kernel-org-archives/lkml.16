Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6DC1E376E;
	Fri, 20 Jun 2025 04:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750393781; cv=none; b=cwTwJE2R9fNyIJ96t/DJadqPy0tHjri85EQkyrrUkz3JnWd2RcZC2YgRETdrp8F8+ncV20NnVx/JjdaGi/M2pAvYj23HDHfqGLbkfYldCmK8WdZvEuZJb/QanQWsMgoJzsmosWRyLpvbet1bbKxKz/SDx8RSsoXouk8/ZHJ7nv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750393781; c=relaxed/simple;
	bh=6xjHdq3+8GeIYmGoNXg8Sb7EjScZbbPi8vugBxeQkkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gNxSRXEj6dRXRXsp7iOy2OjmWSY4fF143RlbGXituXZbOW4W+2RnmN4B6rEXjFQY4c8ON6d2paC8hYLlVVZEalj9idWxoAxCM8oY/BQO/fomaLju5X1PDqxB4tw2DRzWdDWkWQZppqbygv0m3Th6vDoqyonZmoAoqMhIQlkEGGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Z4ned6lB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Z4ned6lB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0B3DC4CEE3;
	Fri, 20 Jun 2025 04:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750393780;
	bh=6xjHdq3+8GeIYmGoNXg8Sb7EjScZbbPi8vugBxeQkkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z4ned6lBe4terW135Wq0aOvEvs9s/NsHzfMMc5s36uF8lLKPsqJOgbe3y5DyTuDuQ
	 9Hf9DNprN4ZVK/BJ1jdG/OsVFDH6rId4HnFA1KxglkQ2m72drj/aJERIR72KyLNvBS
	 ghlpVLKdjSoSQ73b1iubjNI1turGiOhzDXw2eQWk=
Date: Fri, 20 Jun 2025 06:29:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Zongmin Zhou <min_halo@163.com>
Cc: shuah@kernel.org, valentina.manea.m@gmail.com, i@zenithal.me,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	zhouzongmin@kylinos.cn
Subject: Re: [PATCH v2] usbip: convert to use faux_device
Message-ID: <2025062010-hardiness-flashily-cb0f@gregkh>
References: <2a327b520760271471717fff9b222cdc34967489.1746662386.git.zhouzongmin@kylinos.cn>
 <20250604065410.76069-1-min_halo@163.com>
 <2025061926-paycheck-footnote-a2b8@gregkh>
 <c7a2cc26-794e-49e1-bf8c-35617bb8060f@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c7a2cc26-794e-49e1-bf8c-35617bb8060f@163.com>

On Fri, Jun 20, 2025 at 10:16:16AM +0800, Zongmin Zhou wrote:
> 
> On 2025/6/19 19:01, Greg KH wrote:
> > On Wed, Jun 04, 2025 at 02:54:10PM +0800, Zongmin Zhou wrote:
> > > From: Zongmin Zhou <zhouzongmin@kylinos.cn>
> > > 
> > > The vhci driver does not need to create a platform device,
> > > it only did so because it was simple to do that in order to
> > > get a place in sysfs to hang some device-specific attributes.
> > > Now the faux device interface is more appropriate,change it
> > > over to use the faux bus instead.
> > > 
> > > Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
> > > ---
> > > Changes in v2:
> > > - don't change faux create api,just call probe on vhci_hcd_init.
> > > 
> > >   drivers/usb/usbip/vhci.h             |  4 +-
> > >   drivers/usb/usbip/vhci_hcd.c         | 86 +++++++++++-----------------
> > >   drivers/usb/usbip/vhci_sysfs.c       | 68 +++++++++++-----------
> > >   tools/usb/usbip/libsrc/vhci_driver.h |  2 +-
> > >   4 files changed, 72 insertions(+), 88 deletions(-)
> > I get the following build errors from this patch:
> > 
> > drivers/usb/usbip/vhci_hcd.c:1462:12: error: ‘vhci_hcd_resume’ defined but not used [-Werror=unused-function]
> >   1462 | static int vhci_hcd_resume(struct faux_device *fdev)
> >        |            ^~~~~~~~~~~~~~~
> > drivers/usb/usbip/vhci_hcd.c:1418:12: error: ‘vhci_hcd_suspend’ defined but not used [-Werror=unused-function]
> >   1418 | static int vhci_hcd_suspend(struct faux_device *fdev, pm_message_t state)
> >        |            ^~~~~~~~~~~~~~~~
> > cc1: all warnings being treated as errors
> > 
> > Are you sure you tested this?
> I apologize for not enabling -Werror, which resulted in missing this error
> warning.
> I have tested usbip feature use the new patch,but not test system
> suspend/resume.
> The faux bus type don't add pm function,and vhci-hcd driver can't register
> it.
> Maybe have to add suspend/resume for it.like below:
> static const struct bus_type faux_bus_type = {
>     .name        = "faux",
>     .match        = faux_match,
>     .probe        = faux_probe,
>     .remove        = faux_remove,
>     .resume     = faux_resume,
>     .suspend    = faux_suspend,
> };
> 
> Is that right?
> Your expertise would be greatly valued.

As this is not real hardware, why do you need the suspend/resume
callbacks at all?  What is happening here that requires them?

thanks,

greg k-h
