Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3566E201270;
	Mon,  3 Feb 2025 15:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738597139; cv=none; b=KgXZSeDNnWbG4hI+PcDfjCJUKsQ+MH5loH0+ytvc5eO8qUopvB7aFzMEKZUxMKXKsw+zccPmIPEH7jEacI+wHqMChWslrQ3ZXXLIKq+SqI3BK+NBIb9SGj+IIJTAGQkwwPlqtQWLhXoUwkAsmU/dEy5auFwoGsWMUVZykRwLaYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738597139; c=relaxed/simple;
	bh=mBrowxIe3mOOj7xhRVhGk443vYz/k79XNOi746e8AiQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LDLn2EJpbuF61fdYWFKBhMWnktGsKve89fCjUmENIpCsfR5h6pGBL+n/+5JZK1w2Bq4MD46RkUw0zllLB9eBuajiPrDhkvfzvJX3ZOhh+9X3yPbMZW4/iDsQ/aAYUwcwQN+bOGVNI4lf9xWqvZ2GGquTsFntSqdSPtHjXO9wRBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ILpBIPxB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ILpBIPxB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F5AC4CED2;
	Mon,  3 Feb 2025 15:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738597138;
	bh=mBrowxIe3mOOj7xhRVhGk443vYz/k79XNOi746e8AiQ=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=ILpBIPxBqx7qyMNDhPLts0fVvjOfex0kEJF8Uf3n2qJnoSCOj7ijMIkVuL/Z07jdi
	 kkFb6/GFIdL8z396agnCgyMQgWZ101G8SwMdPNr20lW3orAJrse18M0bDCoBsW2qiv
	 JJcP1ilNw98EypgaA3Lcd3yKsLmN3VL7ejtaR2Oc=
Date: Mon, 3 Feb 2025 16:38:55 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [RFC] driver core: add a virtual bus for use when a simple
 device/bus is needed
Message-ID: <2025020312-magician-decipher-ea5c@gregkh>
References: <20250130212843.659437-1-lyude@redhat.com>
 <2025013159-shabby-professor-515b@gregkh>
 <2025013140-propeller-dirtiness-6cb4@gregkh>
 <Z50ZuzrDn-GQWOuP@cassiopeiae>
 <2025020106-avert-senorita-4181@gregkh>
 <2025020306-overhang-glider-7d42@gregkh>
 <Z6Ch8O-0oY70Jhi6@pollux>
 <2025020307-cavalier-knapsack-7f89@gregkh>
 <2025020300-carol-emblem-07ff@gregkh>
 <Z6DhlC2t4R5vHtam@phenom.ffwll.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6DhlC2t4R5vHtam@phenom.ffwll.local>

On Mon, Feb 03, 2025 at 04:32:36PM +0100, Simona Vetter wrote:
> On Mon, Feb 03, 2025 at 03:33:32PM +0100, Greg Kroah-Hartman wrote:
> > On Mon, Feb 03, 2025 at 12:25:23PM +0100, Greg Kroah-Hartman wrote:
> > > > The more I think about it, the less I think it's a good idea, since it'd
> > > > probably trick people into coming up with questionable constructs...
> > > 
> > > No, I think it will work, let me do some replacements later today after
> > > I get some other work done, I think it does make sense, don't doubt
> > > yourself :)
> > 
> > New version is now at:
> > 	https://lore.kernel.org/r/2025020324-thermal-quilt-1bae@gregkh
> > 
> > I've renamed it from "virtual" to "faux" as virtual can easily get
> > confused with virtio stuff, and we already have a /sys/devices/virtual/
> > that is for something else at the moment.
> > 
> > Let me know if there's anything I can change that would make a rust
> > binding simpler.
> 
> I think this should work, for vkms we can prefix the names with "vkms-"
> and then add whatever the user used as name in configfs (the instance
> directory name or whatever it's called) and it should all work out. Unless
> the user does something stupid, in which case it's not our problem.

Sounds good!

And now you just reinforced Andy's complaint about me not checking the
length of the string passed into the api, as it sounds you want to take
user-provided names here.  I'll go fix that up :)

thanks,

greg k-h
