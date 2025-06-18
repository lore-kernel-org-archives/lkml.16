Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35437944F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 07:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750233011; cv=none; b=JlaMDz5nFO7XeBUS/LWgKm0LRlXLFCOld1CT03faip4oe+uXevek340EpibKxN858QWFhEYh+QTlcaQRlVo6CiyBAk1spSorXMakwWXhU3KBGPcL5hVlvOlQbrJWIFwZcylBg7UfdqKdIVHu5WmY+Zkl8dKlU7FREWW8ThcOYHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750233011; c=relaxed/simple;
	bh=YYKoGhWqK8k0effHYwtutxoOlYs/CifAQAorgm0Tr2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IEieP24/6DtP11IpJcIJFTbOS72YHZNIRPTq1WalgONaCCMGxD/ivYcJC0Ap8d9XpSXdHGifGOJotX5mVF5/251vR+lQEquvgyenuoXlJNxA/+oP0iKmRd0F18XNYUKE9b4k/v8by8iou6FlIMHGEFjijHX7AHssABwvI1hfKXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1RyW1auO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1RyW1auO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 502F6C4CEE7;
	Wed, 18 Jun 2025 07:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750233010;
	bh=YYKoGhWqK8k0effHYwtutxoOlYs/CifAQAorgm0Tr2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1RyW1auOGtOzYsMDO5i9kuU/vWfsRF8RCsTR0//cg27OMshN454EpV97EE1wN//Gp
	 Ib2nEsAOrsP3yNYFIRWbIiGLs9l+uooc+blofu2z5852+eB9FeWiAZnVKHq95O+dcl
	 ZeNusYfPhhPCXqrQTlh8fRUkad/JmdZhwSsmFMCM=
Date: Wed, 18 Jun 2025 09:50:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] sysfs: finalize the constification of 'struct
 bin_attribute'
Message-ID: <2025061841-vixen-smuggler-9cc4@gregkh>
References: <20250530-sysfs-const-bin_attr-final-v3-0-724bfcf05b99@weissschuh.net>
 <fa9b1cb8-28a7-4ae0-89c8-8e3f9f149c56@t-8ch.de>
 <2025061702-retention-lion-48c3@gregkh>
 <9797efed-0ece-4817-9a37-9ff225a5df6d@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9797efed-0ece-4817-9a37-9ff225a5df6d@t-8ch.de>

On Tue, Jun 17, 2025 at 04:06:48PM +0200, Thomas Weißschuh wrote:
> On 2025-06-17 10:48:00+0200, Greg Kroah-Hartman wrote:
> > On Sat, Jun 14, 2025 at 08:23:24AM +0200, Thomas Weißschuh wrote:
> > > friendly ping. You wanted to send this to Linux at around -rc1.
> > > The changes should now apply cleanly to mainline.
> > 
> > I've taken the first 4 patches into driver-core-testing at the moment
> > (will move to driver-core-next if it passes 0-day testing).  The last 2
> > I'll hold off of for the next -rc1 as I was way too late here, sorry, my
> > fault.  I blame travel, which I had to do a bunch of the past few weeks :(
> 
> Works for me.
> 
> On the other hand it should be possible to take all patches through the
> normal -next process right now. This is not a flag-day conversion. The final
> const variants are already in v6.16-rc1, so everybody can just use those.

There is a flag-day in that new patches could be using the old types,
right?

thanks,

greg k-h
