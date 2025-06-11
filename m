Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EB4276031;
	Wed, 11 Jun 2025 12:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749644624; cv=none; b=FYokkZ0TxdHS2V3m/aYEpQFnebF59ALfVyZGAywciFjQDIpL3OAo66EnpnTwNRlWqBjS4AvvMp9wa40saX2rk12jyIqVlc9y/QMjBSGbkeYhUK902sIau71wasbQTp7MtNY2FFtz5K8sxJqZ50kJJL63SZPAwURjSaj9HCmk46g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749644624; c=relaxed/simple;
	bh=qU0EWVOHmyfXZmfiha9iuQgF+i0AoLy669DcGhO9gIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hu63T0L8YCsXSk3zUkqaZ2PQ2+hnPhJsx1tXGp/GZpGJPKkd1EErQ1I0kRIiMmkzYHB0rFKB7V4DcVYks3ZQzEr8xpSvmtrIrdimj1wSDq1Jrp82MFs1r3NwD/462apatzKK5gKvlPg0rgO4StHR9Z5hzTi97DIM1Cj843E+zCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AgMQE4jt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AgMQE4jt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1424EC4CEEE;
	Wed, 11 Jun 2025 12:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749644623;
	bh=qU0EWVOHmyfXZmfiha9iuQgF+i0AoLy669DcGhO9gIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AgMQE4jtWqqtRUJxAK6BFIAAXJhbZkkrolQBU7+As75rDmuS0vyTQhCgUvTruVlHn
	 43W3brK7eMurkPyu9Zp06nMoVqCTH2KjP3nHwwy2kLANVeX/HfM1p1cEmBYI6xHPe8
	 WWOOlE1fHWTsu9YI2+yKj9bRzuDElqvFr/gaaM4s=
Date: Wed, 11 Jun 2025 08:23:40 -0400
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Saravana Kannan <saravanak@google.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	Rob Herring <robh+dt@kernel.org>,
	Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH] driver core: Prevent deferred probe loops
Message-ID: <2025061147-squishier-oversleep-80cd@gregkh>
References: <cb354fd2-bece-42ef-9213-de7512e80912@linux.dev>
 <20250610183459.3395328-1-sean.anderson@linux.dev>
 <CAGETcx-koKBvSXTHChYYF-qSU-r1cBUbLghJZcqtJOGQZjn3BA@mail.gmail.com>
 <a52c513c-ff93-4767-a370-3f7c562df7bd@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a52c513c-ff93-4767-a370-3f7c562df7bd@linux.dev>

On Tue, Jun 10, 2025 at 07:44:27PM -0400, Sean Anderson wrote:
> On 6/10/25 19:32, Saravana Kannan wrote:
> > On Tue, Jun 10, 2025 at 11:35 AM Sean Anderson <sean.anderson@linux.dev> wrote:
> >>
> >> A deferred probe loop can occur when a device returns EPROBE_DEFER after
> >> registering a bus with children:
> > 
> > This is a broken driver. A parent device shouldn't register child
> > devices unless it is fully read itself. It's not logical to say the
> > child devices are available, if the parent itself isn't fully ready.
> > So, adding child devices/the bus should be the last thing done in the
> > parent's probe function.
> >
> > I know there are odd exceptions where the parent depends on the child,
> > so they might add the child a bit earlier in the probe
> 
> This is exactly the case here. So the bus probing cannot happen any
> later than it already does.

Please fix the driver not to do this.

> > but in those cases, the parent's probe should still do all the checks
> > ahead of time.
> 
> Such as what? How is the parent going to know the resource is missing
> without checking for it?
>  
> > Can you be more specific about the actual failure you are seeing?
> 
> MAC is looking for a PCS that's on its internal MDIO bus, but that PCS's
> driver isn't loaded. The PCS has to be loaded at probe time because
> phylink_create needs it, and phylink is necessary to register the
> netdev. The latter situation is not ideal, but it would be quite a bit
> of work to untangle.

Please untangle, don't put stuff in the driver core for broken
subsystems.  That is just pushing the maintaince of this from the driver
authors to the driver core maintainers for the next 20+ years :(

thanks,

greg k-h
