Received: from mailrelay-egress12.pub.mailoutpod2-cph3.one.com (mailrelay-egress12.pub.mailoutpod2-cph3.one.com [46.30.211.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1968A217730
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750673453; cv=none; b=YvTjJQPu3Sn/Dm/UI0VmlofoRUiyAahPo2BbBcVIqKoZ3MmJChwV+aWSM0atfDGgxYDgiYEdLIrhPnBCxrWOvS//0uw9Fm8neAmfM8GSiawLu2ZMGdUN0qkH5/CRTvjYjRAP7a8149Sst4YxyeWFX1jZTTLy9Lsh6choAnMN2WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750673453; c=relaxed/simple;
	bh=i9Hpy5KuYP/My0o1RPn21zno2K2uXm5iOUSaR9BtUv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dRFWIikEDquGx+qddw4g6gqsrFpq1eFRAcF8c19pX0r78DWmXMpgwfy63SlqhiWxzy6wFO01FQ6wGEP0PAgyBBSdQ365BsiriUSyCo7mAE/J04y/96y8ChUqDQusKHe5G4QDraRShl8Ndywegh4dYSsY/2RIDtLzkE19+VYm04Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=1QQ8GrHH; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=pFgAp1px; arc=none smtp.client-ip=46.30.211.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="1QQ8GrHH";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="pFgAp1px"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1750673441; x=1751278241;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
	 subject:mime-version:date:message-id:from;
	bh=e/4wAU2MMN25qAei27JXFenl3y/9Bx6y37wunFoJlec=;
	b=1QQ8GrHH2kVU413eR4MZvv37v+nN43qoniSktmfPwtmwC4zchTKWiG/EkTaB85v4LhU8S7K1WsEs8
	 khWWu9OqD+YM3G7EXqOzjDQ7nuRl+dd5yeJyQlIx5rLPVhETGDGon1nRYxdJIoSSpU5j9Ryp40z+V7
	 x3u7ONtc03DST5+wePFfMl0v9/4b1emtF2wgNmA12/kTls55ahYof/wCTdLNYg2ibF5vsr+wKskU/W
	 f/K5GlGSusBfYcfhxxOEqzBk3UKj54s+Fc4+iZ9iBGxerFSAp9roFuDAomG79S0/86UxvwLdhzSgSd
	 9MXPp/qIMPYqeqxNZw+gmp/35zvfKhg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1750673441; x=1751278241;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
	 subject:mime-version:date:message-id:from;
	bh=e/4wAU2MMN25qAei27JXFenl3y/9Bx6y37wunFoJlec=;
	b=pFgAp1pxldR1nK5Zc8BySWAC1b4XH1lCaoMsA2F6oRMQ5Y/3SbamBasRCBRQWfK2TdJCL+ocWS8gw
	 quYZxpCCw==
X-HalOne-ID: 50105f82-501a-11f0-a817-f78b1f841584
Received: from [192.168.10.245] (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay1.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 50105f82-501a-11f0-a817-f78b1f841584;
	Mon, 23 Jun 2025 10:10:40 +0000 (UTC)
Message-ID: <24bacfdd-ec42-4819-9b2d-f94e29fb1fbe@konsulko.se>
Date: Mon, 23 Jun 2025 12:10:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/zswap: export zswap API to modules
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, Igor Belousov <igor.b@beldev.am>
References: <20250620193552.2772125-1-vitaly.wool@konsulko.se>
 <aFW6xI4m15JepI8Y@casper.infradead.org>
Content-Language: en-US
From: Vitaly Wool <vitaly.wool@konsulko.se>
In-Reply-To: <aFW6xI4m15JepI8Y@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/20/25 21:47, Matthew Wilcox wrote:
> On Fri, Jun 20, 2025 at 09:35:52PM +0200, Vitaly Wool wrote:
>> There is no reason to not let modules use zswap capabilies to
>> densely store unused pages in RAM. This will allow to remove some
>> homebrew solutions for e.g. GPU drivers in favor of plainly using
>> zswap pool.
> 
> I really think these should be _GPL exports.  And I'm not sure why the
> GPU drivers are using "homebrew solutions" instead of using the shmem
> APIs which work whether zswap is configured in or not.

shmem API adds an extra copy which would be nice to avoid. Changing 
exports to _GPL I have indeed no problem with.

~Vitaly
