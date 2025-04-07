Received: from server4.hayhost.am (server4.hayhost.am [2.56.206.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728EB20A5CB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=2.56.206.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744044258; cv=none; b=Jozk7+QPbcz4D0XYxE5AzBu60deBKpaWv3wXMCUpE3qIB9dcNUUv4adUGQWjzUtUvXlO1pcAVMp1TVJa80mcUAEqwmlZ34G250RpdPU2NPt1PAdkr34EgMvyPSnahLwFA6TDslfCTdZdIgtcJjbUn9LXH2KB2MtKWjvCwGwIoWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744044258; c=relaxed/simple;
	bh=b890hTciczeQEKKYTzkqwPoz9VZzrnBug0lJh6V8AIY=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=gIVqAAHJEBVgrIqKgUocfTnEewE/anYjhZvVzE53utq3WpsOXpr+pzhX9FQ6O31yET7uxpta2aC/KtHqKBsVRktq9+lygQprBw8daecp0poQeeVXUjNUo/vxup4u+Ki+950W8c/96XcB6csr+GN6F0JAbRJb2sTgIIlrv1X6GhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beldev.am; spf=pass smtp.mailfrom=beldev.am; dkim=pass (2048-bit key) header.d=beldev.am header.i=@beldev.am header.b=1s1Uznkl; arc=none smtp.client-ip=2.56.206.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beldev.am
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=beldev.am
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beldev.am header.i=@beldev.am header.b="1s1Uznkl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=beldev.am;
	s=default; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=T72k/24DD9l/9ol7Qak+3wwHRfLCHCmxeIZJ1DWlpls=; b=1s1Uznklw5dmbDf15DWYF8RdUL
	wpbmNH/6slW94Tb0jqJvMMp2+Ii4BgM8VM+1P872CZnjYAkNgx8oEu2e0WdaxLsOTfMFG+0DDhMAV
	UqhqFTmxBE0i0698VaXxvXQ6oBxDz6K+p6IuS843pQKfD7Mw4tGEBett9bAbby/7tH9faAgoh0n2L
	tIQWBaVxT3t2NAlv69aBrLeKuABYDh/HQ6FFruiwAHOorg6OA5wKrjo1cigwdOoLAjqtTgzw7s+SY
	ygPJS4Suias6SmgxYpcDfpEi+EmmYFKm0p67IcaWiJm2wW7xgbfEZufYnsHZDJZsuiga6uOysPJqP
	O+dFgeMA==;
Received: from [::1] (port=53900 helo=server4.hayhost.am)
	by server4.hayhost.am with esmtpa (Exim 4.98.1)
	(envelope-from <igor.b@beldev.am>)
	id 1u1pa7-000000006MP-1ay0;
	Mon, 07 Apr 2025 20:44:19 +0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 07 Apr 2025 20:44:17 +0400
From: Igor Belousov <igor.b@beldev.am>
To: Nhat Pham <nphamcs@gmail.com>
Cc: vitaly.wool@konsulko.se, Johannes Weiner <hannes@cmpxchg.org>,
 linux-mm@kvack.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v2] mm: add zblock allocator
In-Reply-To: <CAKEwX=NMjfC1bKTVsB+C7eq3y=O0x3v8MW7KxUfhpg6UUr23rw@mail.gmail.com>
References: <1743810988579.7.125720@webmail-backend-production-7b88b644bb-5mmj8>
 <0dbbbe9d17ed489d4a7dbe12026fc6fd@beldev.am>
 <f8063d3fa7e148fecdda82e40b36e10a@beldev.am>
 <CAKEwX=NMjfC1bKTVsB+C7eq3y=O0x3v8MW7KxUfhpg6UUr23rw@mail.gmail.com>
User-Agent: Roundcube Webmail/1.6.9
Message-ID: <f023ba8341f9b44610cc4ac00cf0ee33@beldev.am>
X-Sender: igor.b@beldev.am
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server4.hayhost.am
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - beldev.am
X-Get-Message-Sender-Via: server4.hayhost.am: authenticated_id: igor.b@beldev.am
X-Authenticated-Sender: server4.hayhost.am: igor.b@beldev.am

Hi Nhat,

2025-04-07 19:51 skrev Nhat Pham:
> On Mon, Apr 7, 2025 at 2:00 AM Igor Belousov <igor.b@beldev.am> wrote:
>> 
>> 
>> >>> Do you have zswap/zswapped meminfo metrics from these tests?
>> >> Yep, and those look somewhat similar:
>> >>  - zblock:
>> >> Zswap:            234128 kB
>> >> Zswapped:         733216 kB
>> >> -  zsmalloc:
>> >> Zswap:            286080 kB
>> >> Zswapped:         774688 kB
>> >
>> > I tested the kernel build on a 4-core virtual machine with allocated 4
>> > GB RAM running on a Ryzen 9.
>> >
>> > The results are the following:
>> [...]
>> 
>> Now what's funny is that when I tried to compare how 32 threaded build
>> would behave on a 8-core VM I couldn't do it because it OOMs with
>> zsmalloc as zswap backend. With zblock it doesn't, though, and the
>> results are:
>> real    12m14.012s
>> user    39m37.777s
>> sys     14m6.923s
>> Zswap:            440148 kB
>> Zswapped:         924452 kB
>> zswpin 594812
>> zswpout 2802454
>> zswpwb 10878
>> 
>> /Igor
> 
> May I ask what compression algorithm you are using?

It's LZ4 for all the test runs.

> And does the zswpwb come from zswap shrinker?

Haven't looked into that, to be honest.

/Igor
