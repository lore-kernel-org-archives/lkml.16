Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5101721C184
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 16:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750349974; cv=none; b=UC7FQm0st8SoUxCRqIyeLhpkN+r1us7i3F/9tlIbb2D5+FHJX35gYLGbi1xdUgxoNdAkqa0GTLJNPLA8uWtbeYU82YG7Y0YfwwEhZWvKyEzy80xW6cYQ/JTWtHHfxpRvkEaf74D6VuULKSyQgeFZJ2mr1vldJmdTluYoeShUxmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750349974; c=relaxed/simple;
	bh=H0ev4YTGdT5Inv2bovVKvHYprggpynPPmC71UiQ3zPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pt+FfqeEg51BSIuqfej11L+W2w/Hya16Qyv8AwMB0v8L8ZAwpE6VQZVgTxjJD9r069O+AOgysEhhJu+BAuKNrG2zo1kkGF3GB+OJilWoqfagYO13XqwzVjokvZIcDlT+v7pQzFDG8QMY2G3k/2frjZfiV0WmPhm1wWPwZ1mRU7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mqw+9OXl; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mqw+9OXl"
Message-ID: <6d14a0fb-2bf3-4ca5-9356-b94517ddfb14@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750349967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jjmy14KdtUGXxjll71XuQpqDflBtLFFz5WxBq5DW78k=;
	b=mqw+9OXl9vv+1OwkbxkqJ3uRvGBNrLQx9HgCHPwUVy26XgABo/e/PnPJPK2BHY11F+g8Oe
	+L2g4li6SAUWha7MV3Fe39h+CqLUEIvgefpYR71Z1HZvqhONfeq8BHaN0WhmmWc5pWrY5+
	u0VFqqsI+l9e/0d+lpEXyVVYxW6jcT8=
Date: Thu, 19 Jun 2025 12:19:23 -0400
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
References: <CAGETcx-koKBvSXTHChYYF-qSU-r1cBUbLghJZcqtJOGQZjn3BA@mail.gmail.com>
 <a52c513c-ff93-4767-a370-3f7c562df7bd@linux.dev>
 <2025061147-squishier-oversleep-80cd@gregkh>
 <7d6d8789-e10b-4b06-aa99-5c1a1bdd3b4c@linux.dev>
 <CAGETcx9E5DB4UtdjjAO2=XfTNXdXocj7uk0JkVZ8hf9YadwNcA@mail.gmail.com>
 <70958a2e-abc8-4894-b99a-f2981db9981f@linux.dev>
 <2025061700-unmapped-labrador-a8c9@gregkh>
 <0ee2f641-c3f3-4a3a-87b4-e1279a862d68@linux.dev>
 <2025061740-banter-acclaim-2006@gregkh>
 <24a0f3fa-2121-4de3-89fd-482b217ab98d@linux.dev>
 <2025061929-produce-petticoat-8e0f@gregkh>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <2025061929-produce-petticoat-8e0f@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 6/19/25 04:21, Greg Kroah-Hartman wrote:
> On Tue, Jun 17, 2025 at 01:14:31PM -0400, Sean Anderson wrote:
>> On 6/17/25 11:49, Greg Kroah-Hartman wrote:
>> > On Tue, Jun 17, 2025 at 11:35:04AM -0400, Sean Anderson wrote:
>> >> On 6/17/25 04:50, Greg Kroah-Hartman wrote:
>> >> > On Thu, Jun 12, 2025 at 04:40:48PM -0400, Sean Anderson wrote:
>> >> >> On 6/12/25 13:56, Saravana Kannan wrote:
>> >> >> > On Thu, Jun 12, 2025 at 8:53 AM Sean Anderson <sean.anderson@linux.dev> wrote:
>> >> >> >>
>> >> >> >> On 6/11/25 08:23, Greg Kroah-Hartman wrote:
>> >> >> >> > On Tue, Jun 10, 2025 at 07:44:27PM -0400, Sean Anderson wrote:
>> >> >> >> >> On 6/10/25 19:32, Saravana Kannan wrote:
>> >> >> >> >> > On Tue, Jun 10, 2025 at 11:35 AM Sean Anderson <sean.anderson@linux.dev> wrote:
>> >> >> >> >> >>
>> >> >> >> >> >> A deferred probe loop can occur when a device returns EPROBE_DEFER after
>> >> >> >> >> >> registering a bus with children:
>> >> >> >> >> >
>> >> >> >> >> > This is a broken driver. A parent device shouldn't register child
>> >> >> >> >> > devices unless it is fully read itself. It's not logical to say the
>> >> >> >> >> > child devices are available, if the parent itself isn't fully ready.
>> >> >> >> >> > So, adding child devices/the bus should be the last thing done in the
>> >> >> >> >> > parent's probe function.
>> >> >> >> >> >
>> >> >> >> >> > I know there are odd exceptions where the parent depends on the child,
>> >> >> >> >> > so they might add the child a bit earlier in the probe
>> >> >> >> >>
>> >> >> >> >> This is exactly the case here. So the bus probing cannot happen any
>> >> >> >> >> later than it already does.
>> >> >> >> >
>> >> >> >> > Please fix the driver not to do this.
>> >> >> >>
>> >> >> >> How? The driver needs the PCS to work. And the PCS can live on the MDIO
>> >> >> >> bus.
>> >> >> > 
>> >> >> > Obviously I don't know the full details, but you could implement it as
>> >> >> > MFD. So the bus part would not get removed even if the PCS fails to
>> >> >> > probe. Then the PCS can probe when whatever it needs ends up probing.
>> >> >> 
>> >> >> I was thinking about making the MDIO bus a separate device. But I think
>> >> >> it will be tricky to get suspend/resume working correctly. And this
>> >> >> makes conversions more difficult because you cannot just add some
>> >> >> pcs_get/pcs_put calls, you have to split out the MDIO bus too (which is
>> >> >> invariably created as a child of the MAC).
>> >> >> 
>> >> >> And what happens if a developer doesn't realize they have to split off
>> >> >> the MDIO bus before converting? Everything works fine, except if there
>> >> >> is some problem loading the PCS driver, which they may not test. Is this
>> >> >> prohibition against failing after creating a bus documented anywhere? I
>> >> >> don't recall seeing it...
>> >> > 
>> >> > What do you mean "failing after creating a bus"?  If a bus is failed to
>> >> > be created, you fail like normal, no difference here.
>> >> 
>> >> Creating the bus is successful, but there's an EPROBE_DEFER failure after
>> >> that. Which induces the probe loop as described in my initial email.
>> > 
>> > Then don't allow a defer to happen :)
>> 
>> Well, I could require all PCS drivers to be built-in I guess. But I suspect
>> users will want them to be modules to reduce kernel size.
> 
> True, then just auto-load them as needed like all other busses do.
> 
>> > Or better yet, just succeed and spin up a new thread for the new bus to
>> > attach it's devices to.  That's what many other busses do today.
>> 
>> Sorry, I'm not sure I follow. How can you attach a device to a thread? Do
>> you have an example for this?
> 
> Busses discover their devices in a thread, which then calls probe for
> them when needed.  A device isn't being attached to a thread, sorry for
> the confusion.

OK, just to clarify, the subsystem I linked above is not a bus, it's an
internal API. Think GPIO or PWM. The devices typically live on an MDIO
bus (although a platform bus wouldn't be out of the question). So it's
"not our job" to load the module; that should be done by the bus. From
our perspective, if we look up a device and it's not there we don't
really know if it's ever going to show up.

Regarding the auxiliary bus, I tried it out and it works. The conversion
is around +50 lines, which is not ideal. Ideally I would like to push
complexity into subsystem code rather than making drivers deal with it,
but I don't really see a good way to do this in the subsystem. There are
just a lot of assumptions along the line of "when you register the
device you must know what capabilities it supports." For example, fixed
links (MAC to MAC) are validated when the phylink is created and the
whole process fails if there's an incompatibility. Which can occur if
the late-binding component is the thing that adds support for the fixed
link.

--Sean
