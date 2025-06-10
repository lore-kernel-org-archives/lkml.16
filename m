Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455A221CC7D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749599083; cv=none; b=ZZhtLd4mRrdvFn+xIBWywZu8u0Fu56A8KuklSw9OXzM9WjfXtM2SKxCyzVYJfgmJj9rSxbzsRzV5xrKtlwO/lpJKwHtX7uoDZ7R6xG353B7VIZ+0ezAY1aoc+ANw3ZD+kaN1zThhcgK9YpXT2hY+5Yx89FB1lFeZb3Nzj20JMyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749599083; c=relaxed/simple;
	bh=+NHDg/TZdGaWS46USoZyJNFawAdIOaZjICwQvYlS42Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kjdUVN/gv09d/o9DegksqF0DmCj+nlRkzvcUyPQJFjuoXEHOQM+bZ3IUPGHueq04ITXLl6Iywi77nC6wKz+QTYF7rIy1lNzkuEWakWYJNhHyzSWCbkpJL1/tz8ePj+A+beh625RE8HVfMIMWHnYmpa16KsK2osj7C6vXGn4YAmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=INO9hqen; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="INO9hqen"
Message-ID: <a52c513c-ff93-4767-a370-3f7c562df7bd@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749599070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AXEZaUrWxmsqaTfrveqpH4IHsdKVgloXB+dHWV0moyk=;
	b=INO9hqenzIusKFJVsLMuY/j92TNnowTPdd07otbSZxWmRg2s3Hqc2EEeXOVp1esuYkL+++
	DsL9ozt1z4B2JVFgf4dlVqgIvANYZxqbT0aEiN3W+COhuG2dPiY1oDE8WUNNMyesRFiDrS
	ss6ipPrbmbDWr6t/sjNohRUDtjE8R4U=
Date: Tue, 10 Jun 2025 19:44:27 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] driver core: Prevent deferred probe loops
To: Saravana Kannan <saravanak@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Rob Herring <robh+dt@kernel.org>,
 Grant Likely <grant.likely@linaro.org>
References: <cb354fd2-bece-42ef-9213-de7512e80912@linux.dev>
 <20250610183459.3395328-1-sean.anderson@linux.dev>
 <CAGETcx-koKBvSXTHChYYF-qSU-r1cBUbLghJZcqtJOGQZjn3BA@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <CAGETcx-koKBvSXTHChYYF-qSU-r1cBUbLghJZcqtJOGQZjn3BA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 6/10/25 19:32, Saravana Kannan wrote:
> On Tue, Jun 10, 2025 at 11:35 AM Sean Anderson <sean.anderson@linux.dev> wrote:
>>
>> A deferred probe loop can occur when a device returns EPROBE_DEFER after
>> registering a bus with children:
> 
> This is a broken driver. A parent device shouldn't register child
> devices unless it is fully read itself. It's not logical to say the
> child devices are available, if the parent itself isn't fully ready.
> So, adding child devices/the bus should be the last thing done in the
> parent's probe function.
>
> I know there are odd exceptions where the parent depends on the child,
> so they might add the child a bit earlier in the probe

This is exactly the case here. So the bus probing cannot happen any
later than it already does.

> but in those cases, the parent's probe should still do all the checks
> ahead of time.

Such as what? How is the parent going to know the resource is missing
without checking for it?
 
> Can you be more specific about the actual failure you are seeing?

MAC is looking for a PCS that's on its internal MDIO bus, but that PCS's
driver isn't loaded. The PCS has to be loaded at probe time because
phylink_create needs it, and phylink is necessary to register the
netdev. The latter situation is not ideal, but it would be quite a bit
of work to untangle.

--Sean
