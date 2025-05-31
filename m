Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BC7237163;
	Sat, 31 May 2025 12:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748694535; cv=none; b=pN9K4hILIACf+WFXGRsY5c5xYoTPSQU5/2Bwl63TYPAWEu8Yv0rjZJNokmbhfUa2w+zGvX96wAz3C9ydFNvEYxJQ0QQ68Xm7YkXW0PivY7L9JKgiX2J2KvAAnV8hH7PIK8s1yzPUCciojMoWODuRH7hkCPmQLkHh9az3FTzboCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748694535; c=relaxed/simple;
	bh=mJoa3x7U+tCizGTJsmPnUc7kjQSy2vvPXrJdvKPHoeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/8+CmY9AWzuh9pn0q/+RJhvwL8QaixPSCseil7yOErNt6sEJEEALkZb8+6BPlnmWWJnhAN8P54ewE5Wt/ZP4drZK5Vzvr1Wtis3nhShZt82pMpL3y9TFOU3HyBLJky2oMUDwi16dV6P8A8WogrlMu+I4GcaeOHGH+Oao9VAChg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HffvQzyw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HffvQzyw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40239C4CEE3;
	Sat, 31 May 2025 12:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748694534;
	bh=mJoa3x7U+tCizGTJsmPnUc7kjQSy2vvPXrJdvKPHoeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HffvQzyw9fIqr5oxn9CbVtKzF85ggXdhgpR4pK0RYiby6LRFVGlaSe/fzsQC5yxiQ
	 fACcbchUKNozF0jMLn5+t8ixE7a46zeYukElndoFIb9KqFQ3lzUsvCKZNptWliwv7K
	 IR4fKm4fP/dkeVJwmqgrMhFG9txj/4UCCJAx8KoY=
Date: Sat, 31 May 2025 14:28:51 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Vankar, Chintan" <c-vankar@ti.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Peter Rosin <peda@axentia.se>,
	s-vadapalli@ti.com, danishanwar@ti.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC PATCH v2 0/2] Extend mmio-mux driver to configure mux with
 new DT property
Message-ID: <2025053121-sterile-doorman-57a0@gregkh>
References: <20250304102306.2977836-1-c-vankar@ti.com>
 <f844e44e-6b71-442a-ae3c-7bbe74a908af@ti.com>
 <2e80f6bc-2fb0-4f0d-9450-cbcf4dddca66@ti.com>
 <2025053128-profound-importer-8436@gregkh>
 <7024867d-91ac-40eb-b41f-eed811032f95@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7024867d-91ac-40eb-b41f-eed811032f95@ti.com>

On Sat, May 31, 2025 at 03:07:14PM +0530, Vankar, Chintan wrote:
> Hello Greg,
> 
> On 5/31/2025 11:22 AM, Greg Kroah-Hartman wrote:
> > On Fri, May 30, 2025 at 10:35:24PM +0530, Vankar, Chintan wrote:
> > > Hello Greg,
> > > 
> > > I have tried to implement Timesync Router node to the suitable
> > > Subsystems (Interrupt controller and Mux-controller). Thomas
> > > has provided a feedback with a reason why Timesync Router is not
> > > suitable for irqchip. But I didn't get a proper feedback for mux-
> > > controller subsystem.
> > 
> > What do you mean "proper feedback"?
> > 
> 
> By proper feedback, I meant, from the comments I was not able to figure
> out whether Timesync Router will be acceptable in the "mux-controller"
> subsystem or not.

Did you submit a real patch to do so?  Note, I know I do not read "RFC"
patches for the most part as that implies the submitter does not feel it
is ready to be merged, when I have other patches that submitters _do_
feel are ready to be merged that are still left to review.

> > > Can you please help me deciding in which subsystem I should implement
> > > it, if not mux-controller can it go in drivers/misc ?
> > 
> > Why not mux?  What's preventing that from happening?  Why would misc be
> > better?
> > 
> 
> Sure, if mux-controller subsystem is acceptable, I will implement the
> Timesync Router with that and post a series.

Try it and see!  We don't normally do "what if I did this" type of
review, we want to see patches that actually work.

thanks,

greg k-h
