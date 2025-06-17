Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E842E9730
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750174522; cv=none; b=LJi8JgZ0b5rh3iPKFJR9Jp+vKu2re05MtsXwEUxvmnQolEMP67hgl1DZmJMQPjTGmpPsfKrLECeYNyWKA3BFIRFEx797oEnqYzxJqf/2oa7eO3oM85UNWin+H2SFIyYnOrvUeJJnzdgU14eILCJ2AQVtdFnnxxBuPcBf1mrzZL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750174522; c=relaxed/simple;
	bh=tZBwgMNGQe1HuvXkzjozd6+oITz9+vz04Ka8Ald9TLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nTYa7zfkuNc1NhZDE9v80/niEDqiKkPAX4RBOMSOzcyKe1/MAltZlbulxaHis7A9c+fU3Q5bkx64yzR9WwQAB1ZrmOKex74zq1F+PPRaqHJ+pjWNZl92hs1qFaWHqbBm7Ix3wbM/4zPKkJ3W/ajtHUEhXftMn++0QIi/X2qVlNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=d9JAvAWV; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="d9JAvAWV"
Message-ID: <0ee2f641-c3f3-4a3a-87b4-e1279a862d68@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750174508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oj/kkgMTMqIVrNM3QaF6B1LYz4c3ipKEcY+sL9Pu3sg=;
	b=d9JAvAWVkzszJpLwaNP3Tm8Qn4aY+d1hz7rcqZ783tXiRmT0xMKhx4Sl4ZejXMTIBmg/uq
	e9tfjtFGWWenSxGK64MGzcW+bPOtU+rnbXnJ+3lANWybGQB5d+CKfATO99xyZ3rltFoY+z
	ylYV3BhEevlSv4blKy3FtqhL+FkiI+M=
Date: Tue, 17 Jun 2025 11:35:04 -0400
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
 <7d6d8789-e10b-4b06-aa99-5c1a1bdd3b4c@linux.dev>
 <CAGETcx9E5DB4UtdjjAO2=XfTNXdXocj7uk0JkVZ8hf9YadwNcA@mail.gmail.com>
 <70958a2e-abc8-4894-b99a-f2981db9981f@linux.dev>
 <2025061700-unmapped-labrador-a8c9@gregkh>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <2025061700-unmapped-labrador-a8c9@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 6/17/25 04:50, Greg Kroah-Hartman wrote:
> On Thu, Jun 12, 2025 at 04:40:48PM -0400, Sean Anderson wrote:
>> On 6/12/25 13:56, Saravana Kannan wrote:
>> > On Thu, Jun 12, 2025 at 8:53 AM Sean Anderson <sean.anderson@linux.dev> wrote:
>> >>
>> >> On 6/11/25 08:23, Greg Kroah-Hartman wrote:
>> >> > On Tue, Jun 10, 2025 at 07:44:27PM -0400, Sean Anderson wrote:
>> >> >> On 6/10/25 19:32, Saravana Kannan wrote:
>> >> >> > On Tue, Jun 10, 2025 at 11:35 AM Sean Anderson <sean.anderson@linux.dev> wrote:
>> >> >> >>
>> >> >> >> A deferred probe loop can occur when a device returns EPROBE_DEFER after
>> >> >> >> registering a bus with children:
>> >> >> >
>> >> >> > This is a broken driver. A parent device shouldn't register child
>> >> >> > devices unless it is fully read itself. It's not logical to say the
>> >> >> > child devices are available, if the parent itself isn't fully ready.
>> >> >> > So, adding child devices/the bus should be the last thing done in the
>> >> >> > parent's probe function.
>> >> >> >
>> >> >> > I know there are odd exceptions where the parent depends on the child,
>> >> >> > so they might add the child a bit earlier in the probe
>> >> >>
>> >> >> This is exactly the case here. So the bus probing cannot happen any
>> >> >> later than it already does.
>> >> >
>> >> > Please fix the driver not to do this.
>> >>
>> >> How? The driver needs the PCS to work. And the PCS can live on the MDIO
>> >> bus.
>> > 
>> > Obviously I don't know the full details, but you could implement it as
>> > MFD. So the bus part would not get removed even if the PCS fails to
>> > probe. Then the PCS can probe when whatever it needs ends up probing.
>> 
>> I was thinking about making the MDIO bus a separate device. But I think
>> it will be tricky to get suspend/resume working correctly. And this
>> makes conversions more difficult because you cannot just add some
>> pcs_get/pcs_put calls, you have to split out the MDIO bus too (which is
>> invariably created as a child of the MAC).
>> 
>> And what happens if a developer doesn't realize they have to split off
>> the MDIO bus before converting? Everything works fine, except if there
>> is some problem loading the PCS driver, which they may not test. Is this
>> prohibition against failing after creating a bus documented anywhere? I
>> don't recall seeing it...
> 
> What do you mean "failing after creating a bus"?  If a bus is failed to
> be created, you fail like normal, no difference here.

Creating the bus is successful, but there's an EPROBE_DEFER failure after
that. Which induces the probe loop as described in my initial email.

> And if MFD doesn't work, there's always the aux-bus code, perhaps that
> should be used here instead?

I will have a look. However, I expect both of these approaches to
require fairly invasive conversions for existing drivers. Ideally, I
would like to keep conversions simple.

--Sean
