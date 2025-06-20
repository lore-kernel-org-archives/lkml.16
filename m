Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E9328368A;
	Fri, 20 Jun 2025 09:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750411723; cv=none; b=Fgpl557wdC78Ye0vg3pD9jsifHnM+tMyRYE+RNf4w78W0dNWHVqDkLSqEKowewqMexHfy5oUbc1wuh393iGLlGE3LaEep1S0Z7Zqg7zP6cHJ5KAPlI0OLX0hXNSQ1GowXpCIL7ZqfO1n1bfha8yJ7JHSMKiG6YoxD8/1MtP8pA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750411723; c=relaxed/simple;
	bh=4ue4BfPZID9I3f6U5y5QbcfTOCdGiPQZSWwbzpUYfGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQo0NngOBsXfHvKi+6wq+grHvMYarKWSwu4spFBEtK+E5IdpJQlfr9UGYZO3atOsEQEGINLLKjQ4GpW3zwfrPjqDamJ8JwNLOUS+4Gwa7M2GBFTqw6Ta3IMnbUbpx2ruqEW+iAvWrxmRvJXCPQOIJeiJ17upIQI8ZqADbzNe3kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WwVce9c2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WwVce9c2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B49BDC4CEED;
	Fri, 20 Jun 2025 09:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750411723;
	bh=4ue4BfPZID9I3f6U5y5QbcfTOCdGiPQZSWwbzpUYfGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WwVce9c2149y83b4VkdwTlu4cLgxauWK6/UpYrkGz2K+CyDXri6IzlQ6DF1OfFq5w
	 Q2aB5LweFsyt2PRfpUBORIL26C6Zq5RfdPrEfEVaaFg15AJhsh4GLtiDF8/Lu63KDs
	 gl2wUD8/VyMoCjHduUBxPDNTrScPTsgD/xKdUVNI=
Date: Fri, 20 Jun 2025 11:27:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Zongmin Zhou <min_halo@163.com>
Cc: shuah@kernel.org, valentina.manea.m@gmail.com, i@zenithal.me,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	zhouzongmin@kylinos.cn
Subject: Re: [PATCH v2] usbip: convert to use faux_device
Message-ID: <2025062004-navy-emboss-4743@gregkh>
References: <2a327b520760271471717fff9b222cdc34967489.1746662386.git.zhouzongmin@kylinos.cn>
 <20250604065410.76069-1-min_halo@163.com>
 <2025061926-paycheck-footnote-a2b8@gregkh>
 <c7a2cc26-794e-49e1-bf8c-35617bb8060f@163.com>
 <2025062010-hardiness-flashily-cb0f@gregkh>
 <9d95bb75-586c-48dc-9e34-432cc13fd99f@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d95bb75-586c-48dc-9e34-432cc13fd99f@163.com>

On Fri, Jun 20, 2025 at 05:19:33PM +0800, Zongmin Zhou wrote:
> 
> On 2025/6/20 12:29, Greg KH wrote:
> > On Fri, Jun 20, 2025 at 10:16:16AM +0800, Zongmin Zhou wrote:
> > > On 2025/6/19 19:01, Greg KH wrote:
> > > > On Wed, Jun 04, 2025 at 02:54:10PM +0800, Zongmin Zhou wrote:
> > > > > From: Zongmin Zhou <zhouzongmin@kylinos.cn>
> > > > > 
> > > > > The vhci driver does not need to create a platform device,
> > > > > it only did so because it was simple to do that in order to
> > > > > get a place in sysfs to hang some device-specific attributes.
> > > > > Now the faux device interface is more appropriate,change it
> > > > > over to use the faux bus instead.
> > > > > 
> > > > > Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
> > > > > ---
> > > > > Changes in v2:
> > > > > - don't change faux create api,just call probe on vhci_hcd_init.
> > > > > 
> > > > >    drivers/usb/usbip/vhci.h             |  4 +-
> > > > >    drivers/usb/usbip/vhci_hcd.c         | 86 +++++++++++-----------------
> > > > >    drivers/usb/usbip/vhci_sysfs.c       | 68 +++++++++++-----------
> > > > >    tools/usb/usbip/libsrc/vhci_driver.h |  2 +-
> > > > >    4 files changed, 72 insertions(+), 88 deletions(-)
> > > > I get the following build errors from this patch:
> > > > 
> > > > drivers/usb/usbip/vhci_hcd.c:1462:12: error: ‘vhci_hcd_resume’ defined but not used [-Werror=unused-function]
> > > >    1462 | static int vhci_hcd_resume(struct faux_device *fdev)
> > > >         |            ^~~~~~~~~~~~~~~
> > > > drivers/usb/usbip/vhci_hcd.c:1418:12: error: ‘vhci_hcd_suspend’ defined but not used [-Werror=unused-function]
> > > >    1418 | static int vhci_hcd_suspend(struct faux_device *fdev, pm_message_t state)
> > > >         |            ^~~~~~~~~~~~~~~~
> > > > cc1: all warnings being treated as errors
> > > > 
> > > > Are you sure you tested this?
> > > I apologize for not enabling -Werror, which resulted in missing this error
> > > warning.
> > > I have tested usbip feature use the new patch,but not test system
> > > suspend/resume.
> > > The faux bus type don't add pm function,and vhci-hcd driver can't register
> > > it.
> > > Maybe have to add suspend/resume for it.like below:
> > > static const struct bus_type faux_bus_type = {
> > >      .name        = "faux",
> > >      .match        = faux_match,
> > >      .probe        = faux_probe,
> > >      .remove        = faux_remove,
> > >      .resume     = faux_resume,
> > >      .suspend    = faux_suspend,
> > > };
> > > 
> > > Is that right?
> > > Your expertise would be greatly valued.
> > As this is not real hardware, why do you need the suspend/resume
> > callbacks at all?  What is happening here that requires them?
> @greg,
> The vhci_hcd_suspend/vhci_hcd_resume interfaces are not designed for this
> faux device, but rather to
> manipulate the HCD_FLAG_HW_ACCESSIBLE bit in the hcd flags associated with
> the faux device.
> For example:
> During system standby: clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags)
> During system wakeup: set_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags)
> 
> Previously, these two functions were registered through platform_driver,
> but faux bus does not have the relevant interface, so they were not called,
> resulting in this compilation warning error.
> 
> This raises the question: Should the faux bus implement PM-related
> interface?
> I'm uncertain whether these functions are essential for the vhci-hcd driver
> or if they can be safely removed.
> 
> However, during system standby/wakeup tests with remote USB devices bound to
> the vhci-hcd driver,
> I observed consistent failure scenarios across both the original platform
> bus and faux bus patch implementations.
> 
> Failure Modes
> a.Failed standby with auto-wakeup(Log excerpt):
> [ 1449.065592][T10238] PM: suspend entry (s2idle)
> [ 1449.106146][T10238] Filesystems sync: 0.040 seconds
> [ 1449.216189][T10238] Freezing user space processes
> [ 1449.219474][T10238] Freezing user space processes completed (elapsed
> 0.002 seconds)
> [ 1449.219887][T10238] OOM killer disabled.
> [ 1449.220090][T10238] Freezing remaining freezable tasks
> [ 1469.222372][T10238] Freezing remaining freezable tasks failed after
> 20.002 seconds (0 tasks refusing to freeze, wq_busy=1):
> [ 1469.225038][T10238] Showing freezable workqueues that are still busy:
> [ 1469.226176][T10238] workqueue events_freezable_pwr_efficient: flags=0x86
> [ 1469.227453][T10238]   pwq 20: cpus=0-3 node=0 flags=0x4 nice=0 active=1
> refcnt=2
> [ 1469.227463][T10238]     in-flight: 268:disk_events_workfn
> [ 1469.233559][T10238] Restarting kernel threads ... done.
> [ 1469.235119][T10238] OOM killer enabled.
> [ 1469.235849][T10238] Restarting tasks ... done.
> [ 1469.240121][T10238] random: crng reseeded on system resumption
> [ 1469.241176][T10238] PM: suspend exit
> 
> b.Failed standby with black screen freeze:
> [ 1820.667073][T11454] PM: suspend entry (s2idle)

Are you sure this is the usbip driver causing suspend to not work?  If
you unbind the usbip devices does suspend/resume work?

I would think that we would have gotten some reports by now if this
didn't work at all :)

thanks,

greg k-h
