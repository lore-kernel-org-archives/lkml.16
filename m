Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BDA2F5305
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750243587; cv=none; b=t2Wqdq6RRDB18nErLg68b8lM/MB46jO9w3ogevHbIg8UbjD2ho2xJRjCBDyEvOkFLog2LbAkx/CypN3qRCPboe7enKyO+oipawzXqDfPonz+/Yjcf2sfHFz8Nk5XkJAuWfMau493Ky+B2WL3YZxjvpYUbMX8Wbbo0VFez9zgEiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750243587; c=relaxed/simple;
	bh=es9BfANLseL9NpqC6prshZ5Xa9uFnJPtegUrbFEagU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g4UmGk91Fmv3gUbkWL34A9suwGhPb8bphfniKw5vXDFe9mtKaiSAo0EBsGiiiSo5M4rY7pMwpI13wMQ9i8TuyJfZZUqxGtIMz0IgMyS/D6LJP2nr+gpIqWe6dUIO3oqJq2DjFplUzUPZcpSCrt3opIYO9HS0PtACuYAmi5EED78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=AX8Rv5jd; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="AX8Rv5jd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1750243583;
	bh=es9BfANLseL9NpqC6prshZ5Xa9uFnJPtegUrbFEagU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AX8Rv5jdep0Ua0r3qidzhP5/uPgvEnoqKfxjXea2Ws+q42WBcX9EHN1safYPrWx6U
	 ZBlXkoRI+LddB/EYsH2hmJmqH2+dagvSOIKww/JCFUH1mKxrFeploYuGvJg6TM9C8f
	 Z833g5OJMFo+s9DrnI5QOr1WqGF//qb2DbPkCrK8=
Date: Wed, 18 Jun 2025 12:46:23 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] sysfs: finalize the constification of 'struct
 bin_attribute'
Message-ID: <c1a71cd1-3922-4f73-b441-eb9a7bc7771c@t-8ch.de>
References: <20250530-sysfs-const-bin_attr-final-v3-0-724bfcf05b99@weissschuh.net>
 <fa9b1cb8-28a7-4ae0-89c8-8e3f9f149c56@t-8ch.de>
 <2025061702-retention-lion-48c3@gregkh>
 <9797efed-0ece-4817-9a37-9ff225a5df6d@t-8ch.de>
 <2025061841-vixen-smuggler-9cc4@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025061841-vixen-smuggler-9cc4@gregkh>

On 2025-06-18 09:50:07+0200, Greg Kroah-Hartman wrote:
> On Tue, Jun 17, 2025 at 04:06:48PM +0200, Thomas Weißschuh wrote:
> > On 2025-06-17 10:48:00+0200, Greg Kroah-Hartman wrote:
> > > On Sat, Jun 14, 2025 at 08:23:24AM +0200, Thomas Weißschuh wrote:
> > > > friendly ping. You wanted to send this to Linux at around -rc1.
> > > > The changes should now apply cleanly to mainline.
> > > 
> > > I've taken the first 4 patches into driver-core-testing at the moment
> > > (will move to driver-core-next if it passes 0-day testing).  The last 2
> > > I'll hold off of for the next -rc1 as I was way too late here, sorry, my
> > > fault.  I blame travel, which I had to do a bunch of the past few weeks :(
> > 
> > Works for me.
> > 
> > On the other hand it should be possible to take all patches through the
> > normal -next process right now. This is not a flag-day conversion. The final
> > const variants are already in v6.16-rc1, so everybody can just use those.
> 
> There is a flag-day in that new patches could be using the old types,
> right?

They could; but this should always the case, no?

For me a flag-day conversion means that there is no way for users to
be compatible with the old and new API at the same time.
So everything needs to happen at once.

But here users of the old API can adapt their code to be compatible
with both the old and new APIs at the same time.
Not that there are any users of the old API in -next anyways.

However if you want to stick to a out-of-cycle patch, that works for me, too.
