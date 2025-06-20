Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2FC2BD5BF
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750434134; cv=none; b=hzwrNvGEHfwXHHnPAZEkrFrLKQTbDeMP1xJFt3p1MPPY3EY7KwglG2dTXDtkbyzN/247EjCy8vfXJT84ejbJbBPSyaByJ+qC5P2nfumprW9snCOZAPvFcOzaek0t4RuJuUJI/5BRGUPEkmKkIfB0yEIaY22lR9Bxm50etxLi/hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750434134; c=relaxed/simple;
	bh=cLUxPPjYkBw7STQusnQiKUISqYoRPP4aoEc3f3wxNRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UaLeD8V8lRVazhh4jDOnaIHnnN1cqP8cep2bITw32ubc1vIk3yRIlh+HAWmoLzOaP9qyJVEn4wZyhZIYPFG3/r99YKGFTdsk4iZWbzt/3iilA7ldiUTfzCt1ziCzGQCgRfGydomseI1XSlcmSXN0XCTCJNbnl8EeZQPwNuWXeW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=I8GAJEjt; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="I8GAJEjt"
Message-ID: <56f52836-545a-45aa-8a6b-04aa589c2583@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750434131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5vxNedAjVSukjlPsPkPSM2hsqyg7r1pIanZ7gFNuJhA=;
	b=I8GAJEjtP32F6Q/LrmgaBIS5PQsFSM5HwZwx0rWj3XnRmwTe/El0Ii75HYP9sLU6d/ZOJ1
	cVI/VZ6Wu44tRXNFU6169t1XuPyIfdInIkwtFErnMxZeu+yhZmUbYey44qlIToRwds80dF
	1U8WRtNlQekNfmts8HlBdehctnL7cJ0=
Date: Fri, 20 Jun 2025 11:41:52 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net 0/4] net: axienet: Fix deferred probe loop
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Michal Simek <michal.simek@amd.com>,
 Saravana Kannan <saravanak@google.com>, Leon Romanovsky <leon@kernel.org>,
 Dave Ertman <david.m.ertman@intel.com>, linux-kernel@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, linux-arm-kernel@lists.infradead.org,
 Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
References: <20250619200537.260017-1-sean.anderson@linux.dev>
 <2025062004-sandblast-overjoyed-6fe9@gregkh>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <2025062004-sandblast-overjoyed-6fe9@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 6/20/25 01:10, Greg Kroah-Hartman wrote:
> On Thu, Jun 19, 2025 at 04:05:33PM -0400, Sean Anderson wrote:
>> Upon further investigation, the EPROBE_DEFER loop outlined in [1] can
>> occur even without the PCS subsystem, as described in patch 4/4. The
>> second patch is a general fix, and could be applied even without the
>> auxdev conversion.
>> 
>> [1] https://lore.kernel.org/all/20250610183459.3395328-1-sean.anderson@linux.dev/
> 
> I have no idea what this summary means at all, which isn't a good start
> to a patch series :(
> 
> What problem are you trying to solve?

See patch 4/4.

> What overall solution did you come up with?

See patch 4/4.

> Who is supposed to be reviewing any of this?

Netdev. Hence "PATCH net".

And see [1] above for background. I will quote it more-extensively next time.

--Sean


