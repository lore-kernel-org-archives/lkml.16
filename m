Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB2C211499;
	Tue,  4 Feb 2025 12:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738670660; cv=none; b=bjtxaUgqR74hhRTCjkO6Jvgr7dV9baMMwjsLjKmhFmy4M+ZI6wQtK0/ioAVouW8Q2sM2FCRIwv1bxDtLmDFYy/YcJkcj7uFxc6m76hM5q2vp8l7c/DmExTNZNL+4a9U5bepKw92LN8f42lW0tpyGZeMxFFC1sePQ1+fP2E7z6/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738670660; c=relaxed/simple;
	bh=omV+qai0C4CUP4OsvQDmxq1tpbs+PK7ywZKq2iNrKK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JcXQTa2od06NodooDif/JA9Y493UnOLgFYakmTD9P1dsJnhIdq1k5C7KfVPXbURN4ZYoqFbG22eU+UKQPF7NIiVcmCCStClEjKVgzoY1IlkeEO0ByTD1Z7gFChGVXRflyB22uPaMp5yqTzLAtyGESevL2YYGz5/kNamw74d6Z+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W1GVri76; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W1GVri76"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF9CC4CEDF;
	Tue,  4 Feb 2025 12:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738670659;
	bh=omV+qai0C4CUP4OsvQDmxq1tpbs+PK7ywZKq2iNrKK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W1GVri76AWuyn/tlUqkOC8bO3tIQckV61zl+CmUFesQfqBsxp38JYqfjfhCknfcJD
	 WU9YxIyV6X2KRd9IJpc0ZuI/zMYHu6JgGJBucKp8QPIoDqwsq5/5M31GMuFODhxYZw
	 M1JWFOZQNHWH1ckDzNBkY3YG9FZnZt5YOEYv3a+59ZjmTnOXO+oKn4eVuI/aCxrzB+
	 V3Gxc+e8HxyF2Rb1mOzY+UBBPWY9hgG5ZL3ln2RbdLbbaLkuuTZCerCxUoEbBtD26A
	 Oh1c+B6GRSCw4+FfnLtXaKCxrZTjWSlVhcAo+8gJ99mVCSu3BeByg6c64409as45ZV
	 8FDHCujEU/a5w==
Date: Tue, 4 Feb 2025 13:04:13 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
	Lyude Paul <lyude@redhat.com>,
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
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/5] driver core: add a faux bus for use when a simple
 device/bus is needed
Message-ID: <Z6ICPc3A5Cy1dgw_@cassiopeiae>
References: <2025020421-poster-moisture-534b@gregkh>
 <2025020424-retrain-recharger-407c@gregkh>
 <Z6H9g_bvvMf5pPyc@cassiopeiae>
 <2025020435-earwig-zesty-87ea@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020435-earwig-zesty-87ea@gregkh>

On Tue, Feb 04, 2025 at 12:52:34PM +0100, Greg Kroah-Hartman wrote:
> On Tue, Feb 04, 2025 at 12:44:03PM +0100, Danilo Krummrich wrote:
> > On Tue, Feb 04, 2025 at 12:09:13PM +0100, Greg Kroah-Hartman wrote:
> > > Many drivers abuse the platform driver/bus system as it provides a
> > > simple way to create and bind a device to a driver-specific set of
> > > probe/release functions.  Instead of doing that, and wasting all of the
> > > memory associated with a platform device, here is a "faux" bus that
> > > can be used instead.
> > > 
> > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > ---
> > >  v2: - renamed bus and root device to just "faux" thanks to Thomas
> > >      - removed the one-driver-per-device and now just have one driver
> > >        entirely thanks to Danilo
> > >      - kerneldoc fixups and additions and string handling bounds checks
> > >        hanks to Andy
> > >      - coding style fix thanks to Jonathan
> > >      - tested that the destroy path actually works
> > > 
> > >  drivers/base/Makefile       |   2 +-
> > >  drivers/base/base.h         |   1 +
> > >  drivers/base/faux.c         | 196 ++++++++++++++++++++++++++++++++++++
> > >  drivers/base/init.c         |   1 +
> > >  include/linux/device/faux.h |  31 ++++++
> > >  5 files changed, 230 insertions(+), 1 deletion(-)
> > >  create mode 100644 drivers/base/faux.c
> > >  create mode 100644 include/linux/device/faux.h
> > 
> > I really like it, it's as simply as it can be.
> > 
> > Please find one nit below, otherwise
> > 
> > Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> > 
> > > 
> > > +/**
> > > + * faux_device_destroy - destroy a faux device
> > > + * @faux_dev: faux device to destroy
> > > + *
> > > + * Unregister and free all memory associated with a faux device that was
> > > + * previously created with a call to faux_device_create().
> > 
> > Can we really claim that this frees all memory? Someone can still have a
> > reference to the underlying struct device, right?
> 
> That "someone" is the person that had the original device pointer passed
> to it, so if that person then calls faux_device_destroy(), yes, that
> should all be properly cleaned up.
> 
> But even if it isn't, the device is destroyed and gone from sysfs, and
> whenever that final final put_device() is called, the memory will then
> be freed by the driver core itself.

Oh indeed, the code here is perfectly fine. I just wanted to say that calling
faux_device_destroy() is not a guarantee that "all memory associated with a
faux device" is actually freed, as the kernel-doc comment above says (or at
least implies).

So, the concern only was that the comment could be confusing, as in "How can
faux_device_destroy() free the memory, if I still have a separate reference to
this thing?" (which it clearly would not).
