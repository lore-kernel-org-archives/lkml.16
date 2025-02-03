Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E0820ADCF;
	Mon,  3 Feb 2025 14:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738593216; cv=none; b=KWNbMMLaOjtYPiJqRjLekLvZLe+/gs/piWaBSPCCtIIietNYAuaejF+7IJWIWQnmDNpfZqSg28cz1JM2mz+MW+xi96HEHpwFgeAZzS47BnolEfdKUG6anmUqHCljcVLXVOX7WnqjRhLSv5p9DDoofhk7GCWq9554uD4sDJL9pLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738593216; c=relaxed/simple;
	bh=JLavaaOhrnEE9p6owSTsfMaaxQcLSd9qqQap8LGvZfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iTxKy8os7tWQt85HAKSsVgpVRfWvak0F9N9BDA6c1o9BfOoVLkMr5uuM1IfGn0R1w1kzl63KAzVk+kd94Nzjw5PSBCVkaskvfUYDrOzV6dSX2Ym+VdIhY/BtiysMoYse+pnl1PWCjylqb8JNOQfVY+o1/b3Hmwg5hah3czwZnY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XCjSUAM8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XCjSUAM8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F00E7C4CED2;
	Mon,  3 Feb 2025 14:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738593215;
	bh=JLavaaOhrnEE9p6owSTsfMaaxQcLSd9qqQap8LGvZfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XCjSUAM8ygAOvkm9LUK/VPyfWi2YhJRkY1S9M2wyR9Qk/DuzE93kFTC9pCgAaatvx
	 7VJZWEu497BfXRDtSEYGZoKxD8gKYqephW8Oz/xESGibvuClNtdaix8LdpNLGjuyfC
	 rejputx+SgzNE47MoTFrM8/LSvH0aSXAfBuKgKtA=
Date: Mon, 3 Feb 2025 15:33:32 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <bhelgaas@google.com>,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [RFC] driver core: add a virtual bus for use when a simple
 device/bus is needed
Message-ID: <2025020300-carol-emblem-07ff@gregkh>
References: <Z5Nw8kaieLueWyUu@pollux>
 <20250130212843.659437-1-lyude@redhat.com>
 <2025013159-shabby-professor-515b@gregkh>
 <2025013140-propeller-dirtiness-6cb4@gregkh>
 <Z50ZuzrDn-GQWOuP@cassiopeiae>
 <2025020106-avert-senorita-4181@gregkh>
 <2025020306-overhang-glider-7d42@gregkh>
 <Z6Ch8O-0oY70Jhi6@pollux>
 <2025020307-cavalier-knapsack-7f89@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020307-cavalier-knapsack-7f89@gregkh>

On Mon, Feb 03, 2025 at 12:25:23PM +0100, Greg Kroah-Hartman wrote:
> > The more I think about it, the less I think it's a good idea, since it'd
> > probably trick people into coming up with questionable constructs...
> 
> No, I think it will work, let me do some replacements later today after
> I get some other work done, I think it does make sense, don't doubt
> yourself :)

New version is now at:
	https://lore.kernel.org/r/2025020324-thermal-quilt-1bae@gregkh

I've renamed it from "virtual" to "faux" as virtual can easily get
confused with virtio stuff, and we already have a /sys/devices/virtual/
that is for something else at the moment.

Let me know if there's anything I can change that would make a rust
binding simpler.

thanks,

greg k-h


> 
> thanks,
> 
> greg k-h
> 
