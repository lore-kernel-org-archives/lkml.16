Received: from server4.hayhost.am (server4.hayhost.am [2.56.206.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCA7224AEB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 09:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=2.56.206.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744016443; cv=none; b=LuS5ffNWcNSE6dAVLP8ApANBkBHUSsQd/5VAMqoAVscmi0Ug6UBdoV6XkgOfHEhNukhV3JV+N/M/DUGFGXbwDlSJTDDRerSD/hS7yE1/vH3cbK247yCqTnlhED1zH9qUNPoxZSYQCDFzeOzxmhHPcgXkAGDxz9MrU+DWDbFwIo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744016443; c=relaxed/simple;
	bh=jNMFcGjZLIcyutmB9liZXrs9rJ1lCzkI0lvQN9KoIYQ=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=llFwo5ci4sWa4PzJy0mVEkh9xo7P7fY+HqkpSQ2svior6wKqUVDAnrM29v/w59fYiGIG/MUzTsvoA6IzkRVK0wXjroAl85KJjZSYxym1j7vbEUfdcXEdIJFQjNCTBCWB4jzoPhqr8GzZoCNZXLs2PWnarhK3x9TKVT3n4I8O6FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beldev.am; spf=pass smtp.mailfrom=beldev.am; dkim=pass (2048-bit key) header.d=beldev.am header.i=@beldev.am header.b=NBI53TGT; arc=none smtp.client-ip=2.56.206.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beldev.am
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=beldev.am
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beldev.am header.i=@beldev.am header.b="NBI53TGT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=beldev.am;
	s=default; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ljSyNAuYGohSbshxTS9XTcjO7JEBGhx1+FyVdogr/qQ=; b=NBI53TGTTf/WaZ2EhQFah7duOX
	pIBrDiFkuHoMKvVROddQ1q8JlX/auH8WvCzBehZsipfkBVBUq0uYUMnqa7DkLhmN37VhtVRQVPNCy
	wKfCOYKgLiQLuGrxyV6Zshs8d5EBuBo0KjA3ZKH4VK378VTcYEpJKXz1l+MPGFuYIqElqS4/iczV3
	C3EaeTXMoElHoTzrkBK6ZudftOSkXV0nrf1w6rNGZaL+TrOE8ES5xlw+yUR7JBqia8wSAY/1MMR4X
	p5G3nDz8TokieZjatKg1/LSc0AIts2doEI8pzkEbRHtLss8T+L4R+CiC8buwz8/35m7L3Oz+43DID
	SpQAvddQ==;
Received: from [::1] (port=27272 helo=server4.hayhost.am)
	by server4.hayhost.am with esmtpa (Exim 4.98.1)
	(envelope-from <igor.b@beldev.am>)
	id 1u1iLO-000000000F3-1gIu;
	Mon, 07 Apr 2025 13:00:38 +0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 07 Apr 2025 13:00:36 +0400
From: Igor Belousov <igor.b@beldev.am>
To: vitaly.wool@konsulko.se
Cc: Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org, Nhat Pham
 <nphamcs@gmail.com>, Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v2] mm: add zblock allocator
In-Reply-To: <0dbbbe9d17ed489d4a7dbe12026fc6fd@beldev.am>
References: <1743810988579.7.125720@webmail-backend-production-7b88b644bb-5mmj8>
 <0dbbbe9d17ed489d4a7dbe12026fc6fd@beldev.am>
User-Agent: Roundcube Webmail/1.6.9
Message-ID: <f8063d3fa7e148fecdda82e40b36e10a@beldev.am>
X-Sender: igor.b@beldev.am
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server4.hayhost.am
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - beldev.am
X-Get-Message-Sender-Via: server4.hayhost.am: authenticated_id: igor.b@beldev.am
X-Authenticated-Sender: server4.hayhost.am: igor.b@beldev.am


>>> Do you have zswap/zswapped meminfo metrics from these tests?
>> Yep, and those look somewhat similar:
>>  - zblock:
>> Zswap:            234128 kB
>> Zswapped:         733216 kB
>> -  zsmalloc:
>> Zswap:            286080 kB
>> Zswapped:         774688 kB
> 
> I tested the kernel build on a 4-core virtual machine with allocated 4 
> GB RAM running on a Ryzen 9.
> 
> The results are the following:
[...]

Now what's funny is that when I tried to compare how 32 threaded build 
would behave on a 8-core VM I couldn't do it because it OOMs with 
zsmalloc as zswap backend. With zblock it doesn't, though, and the 
results are:
real	12m14.012s
user	39m37.777s
sys	14m6.923s
Zswap:            440148 kB
Zswapped:         924452 kB
zswpin 594812
zswpout 2802454
zswpwb 10878

/Igor
