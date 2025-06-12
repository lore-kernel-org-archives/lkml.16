Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713C229B76C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749743614; cv=none; b=UsEEOWVjWcdwXBSZhX9PunlOVUjH3HsIeI3oyfDwlQkiDqMKLz9+tslz20R3fDVflYs7PAkLvj0vbi8evLTpCo5MOmEeX+lDv3lWUTsMSEck4Qo/9l8tOth54du6uPurrNu/31WLyn4qo0ouELNZ9BgpeM56+D8k6h855itRULk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749743614; c=relaxed/simple;
	bh=1cRDkeLHzFug3qxAN04q6m0PQr+KA292mN+/J7203SQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sEgkugOZcEsdR2VfAUClZFSRzhPbBIW4SX8WLc14HmLXcduPVb0NbjrmzAg0FYXk1T/sOpt5MtkKl9PAUu+m7gz86yCs1FUlSzGzw/rnP26svZDqsmPGkm8ltKeYnNtOXTeCxyYUzRuNsvKFXLyZfAnmM6RF98wR4RZwFy16EfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tJ9HcDCB; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tJ9HcDCB"
Message-ID: <7d6d8789-e10b-4b06-aa99-5c1a1bdd3b4c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749743609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VtRiob/WK6dB9hiKsBztaXiC/lktTw6wqNhGJ63l+W4=;
	b=tJ9HcDCB7jXNy8vPj1JafBm/OvNXzP9IOqlWuNUgi7F4DcQp+dzc1ukYjMpZz4aqJfvHlc
	8iDFjYtfY04Px4+/pflwCGlg2iuolBe41mxgNLf0xXYbbFNNPm6Z2SQ+jcCmSZat08GsMV
	4C+gdBKGhjcgEAMDybjA+WapeXQZNsU=
Date: Thu, 12 Jun 2025 11:53:26 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] driver core: Prevent deferred probe loops
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Saravana Kannan <saravanak@google.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Rob Herring <robh+dt@kernel.org>,
 Grant Likely <grant.likely@linaro.org>
References: <cb354fd2-bece-42ef-9213-de7512e80912@linux.dev>
 <20250610183459.3395328-1-sean.anderson@linux.dev>
 <CAGETcx-koKBvSXTHChYYF-qSU-r1cBUbLghJZcqtJOGQZjn3BA@mail.gmail.com>
 <a52c513c-ff93-4767-a370-3f7c562df7bd@linux.dev>
 <2025061147-squishier-oversleep-80cd@gregkh>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <2025061147-squishier-oversleep-80cd@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 6/11/25 08:23, Greg Kroah-Hartman wrote:
> On Tue, Jun 10, 2025 at 07:44:27PM -0400, Sean Anderson wrote:
>> On 6/10/25 19:32, Saravana Kannan wrote:
>> > On Tue, Jun 10, 2025 at 11:35 AM Sean Anderson <sean.anderson@linux.dev> wrote:
>> >>
>> >> A deferred probe loop can occur when a device returns EPROBE_DEFER after
>> >> registering a bus with children:
>> > 
>> > This is a broken driver. A parent device shouldn't register child
>> > devices unless it is fully read itself. It's not logical to say the
>> > child devices are available, if the parent itself isn't fully ready.
>> > So, adding child devices/the bus should be the last thing done in the
>> > parent's probe function.
>> >
>> > I know there are odd exceptions where the parent depends on the child,
>> > so they might add the child a bit earlier in the probe
>> 
>> This is exactly the case here. So the bus probing cannot happen any
>> later than it already does.
> 
> Please fix the driver not to do this.

How? The driver needs the PCS to work. And the PCS can live on the MDIO
bus.

>> > but in those cases, the parent's probe should still do all the checks
>> > ahead of time.
>> 
>> Such as what? How is the parent going to know the resource is missing
>> without checking for it?
>>  
>> > Can you be more specific about the actual failure you are seeing?
>> 
>> MAC is looking for a PCS that's on its internal MDIO bus, but that PCS's
>> driver isn't loaded. The PCS has to be loaded at probe time because
>> phylink_create needs it, and phylink is necessary to register the
>> netdev. The latter situation is not ideal, but it would be quite a bit
>> of work to untangle.
> 
> Please untangle, don't put stuff in the driver core for broken
> subsystems.  That is just pushing the maintaince of this from the driver
> authors to the driver core maintainers for the next 20+ years :(

What makes it broken? The "mess" has already been made in netdev. The driver
authors have already pushed it off onto phylink.

And by "quite a bit of work to untangle" I mean the PCS affects settings
(ethtool ksettings, MII IOCTL) that are exposed to userspace as soon as
the netdev is registered. So we cannot move to a "delayed" lookup
without breaking reading/modifying the settings. We could of course fake
it, but what happens when e.g. userspace looks at the settings and
breaks because we are not reporting the right capabilities (which would
have been reported in the past)?

--Sean
