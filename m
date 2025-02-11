Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5456D1E500C;
	Tue, 11 Feb 2025 08:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739261830; cv=none; b=ZTrkVaPickQ20OyuqTogVPAG91YHIZM7WCwzpvjH6UxkDFdRQtdojE15sGm7Ng3L5ywMu1i8H1wqLwHxgMF1Z7819DsIV6VciBegG/JPdqtGsjkSqcVsfe7KRzd40Ud0b8avtsztG9iusx0hcpmGRfq+FbwnLYRzatK2AdM4Rm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739261830; c=relaxed/simple;
	bh=pzSfAE4e6QkdYVAeY1Wm2lxfdq+VWOe9wBNOpnrxpCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RSj5sxotTKLcGjdKz6DOzgzX4JnjtAc+y7GJFpT+EZsup0xRwy/NIzR7JONdbU2YZ7hf6Nte0lL5ZBsR6/eBKocaVnLyGvoi8EdF1rVUqpcbDMzW6hPnTq+wwGbHxRDPab6thizFEz8IVLKjmFPsCStKrHjZb7kBQia1fou+l7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XudVIW3j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XudVIW3j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ADD0C4CEDD;
	Tue, 11 Feb 2025 08:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739261830;
	bh=pzSfAE4e6QkdYVAeY1Wm2lxfdq+VWOe9wBNOpnrxpCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XudVIW3jyfUl2oNcHDDicUuuddHsPylBIqJpHE9LXQElLF3QU1Wyjhbaw+ik51T43
	 GWf3Lu8MwrQjFC6YXMNd8zqXPwTafYWGVhTyD67CQ7mziwWjctrWJwteYpLxW1h9JT
	 G/0cZmrlnaAiswctxKbP0bEM/2QswdhQBbGQsuXM=
Date: Tue, 11 Feb 2025 09:17:06 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kurt Borja <kuurtb@gmail.com>
Cc: linux-kernel@vger.kernel.org, Lyude Paul <lyude@redhat.com>,
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
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH v4 1/9] driver core: add a faux bus for use when a simple
 device/bus is needed
Message-ID: <2025021121-chaps-jawline-caf5@gregkh>
References: <2025021023-sandstorm-precise-9f5d@gregkh>
 <2025021026-atlantic-gibberish-3f0c@gregkh>
 <D7OYKAYV14AZ.2D8Q4XP557FSR@gmail.com>
 <2025021111-landowner-gleaming-5971@gregkh>
 <2025021113-hundredth-pandemic-4529@gregkh>
 <D7PG55S1KG10.27S2ZIBE1TCUC@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D7PG55S1KG10.27S2ZIBE1TCUC@gmail.com>

On Tue, Feb 11, 2025 at 02:43:20AM -0500, Kurt Borja wrote:
> On Tue Feb 11, 2025 at 2:33 AM -05, Greg Kroah-Hartman wrote:
> > On Tue, Feb 11, 2025 at 08:27:26AM +0100, Greg Kroah-Hartman wrote:
> >> On Mon, Feb 10, 2025 at 12:56:46PM -0500, Kurt Borja wrote:
> >> I'll work on adding "if probe failed, don't let the device be created"
> >> logic as it's a simple change, BUT it is a functionally different change
> >> from what the current api that this code is replacing is doing (i.e. the
> >> current platform device creation code does this today and no one has
> >> ever hit this in their use of it in the past few decades.)
> >
> > How about something as simple as this change, does that provide what you
> > are thinking about here?  Only compile tested, not runtime tested at
> > all:
> 
> Yes, LGTM. However dev->driver is set to NULL if the probe fails so
> wouldn't
> 
> 	if (!dev->driver)
> 
> do the job?

True, that would work, and be much simpler, I'll go add that AND
actually test it :)

> I understand your point about groups. This of course solves it, although
> isn't there a small windows between device_add() and device_destroy() in
> the failed probe path, in which a show/store/visibility method could
> dereference a NULL drvdata?

Ok, I looked it up and it turns out that the groups wouldn't have even
been created if probe() failed (see the call to call_driver_probe() in
really_probe() in drivers/base/dd.c)  So all should be good here.

thanks,

greg k-h
