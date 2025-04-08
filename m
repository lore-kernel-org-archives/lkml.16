Received: from server4.hayhost.am (server4.hayhost.am [2.56.206.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0601F263C6B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=2.56.206.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104017; cv=none; b=s0CW09B1hphkJgsaQMXM/Ib4yIR02o/oMEi3LaiOoc5ZKz34JQrCZj0+lWjD8t0Cw0pvc6WkThnFXEvrXHesLRPfcAuU+AXDbIku+bqub2MTbL6I4T08rWSJk/8EM62I7MuZWTjuzg3JIDFp5/JTIxbwp4FK95VHFbxBUGfdtaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104017; c=relaxed/simple;
	bh=64S+PkRIUcFcRN0fVvTv5oJaDycqRQerfUane5nk2yo=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=iV14rgK0vVpL4qwqUqgxU7zDUkFi+SGo3olOqdBDDy7yeaex9hsIaMhoKShEyApXjxL3np2ln88lMxOKPJX5J4gGErtBL1j6Q+D+5wRk/ZX8nwT4HPw4N86A5X7yvsKfOTw9QP1X9X4Q3qPArg17pIjvRt5Wp2Je/NJ1Gxaa1Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beldev.am; spf=pass smtp.mailfrom=beldev.am; dkim=pass (2048-bit key) header.d=beldev.am header.i=@beldev.am header.b=GVPQta/d; arc=none smtp.client-ip=2.56.206.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beldev.am
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=beldev.am
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beldev.am header.i=@beldev.am header.b="GVPQta/d"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=beldev.am;
	s=default; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=FAQWLddjvIhGD1mEzeXztnSrdDH1xu8SvzVV71X0s+Q=; b=GVPQta/duSWT/7npKbIqcotLfD
	rWw3Ak71SAn9sapYmxbgLQO/hwFOKp7lcfl37tYF2A33hKQ3ksQsg7OQx4rL80vnD1QflsfrJ8bxL
	GV+JqQaLHplrdBL6xP7dQgw5RMazLxKDAKunz7yYKr5IO2ROctl+uFrj51X+m270T2HpljIMWxrIE
	B/kk20YoaY96Vq6OasH90PRR0VjpiRuxbqppKqdAXlsIczyovYQgUYhhWSoJ5fAlVsY/Kg2/i/v4c
	dDqS9iw4u7jGn+wou3Tjy89I6x8ouCM5K8DCqe5aWcd9QpNGMM3y/6F/Ru02WQrT6y+pO9K5G9uAd
	loHe2L9A==;
Received: from [::1] (port=60520 helo=server4.hayhost.am)
	by server4.hayhost.am with esmtpa (Exim 4.98.1)
	(envelope-from <igor.b@beldev.am>)
	id 1u257t-000000005Eo-3K7b;
	Tue, 08 Apr 2025 13:20:13 +0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 08 Apr 2025 13:20:11 +0400
From: Igor Belousov <igor.b@beldev.am>
To: Nhat Pham <nphamcs@gmail.com>
Cc: vitaly.wool@konsulko.se, Johannes Weiner <hannes@cmpxchg.org>,
 linux-mm@kvack.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v2] mm: add zblock allocator
In-Reply-To: <CAKEwX=MXD9EB242WkB50ZBmZgV-CwrAHp=_oE+e=7yHDfrMHtg@mail.gmail.com>
References: <1743810988579.7.125720@webmail-backend-production-7b88b644bb-5mmj8>
 <0dbbbe9d17ed489d4a7dbe12026fc6fd@beldev.am>
 <f8063d3fa7e148fecdda82e40b36e10a@beldev.am>
 <CAKEwX=NMjfC1bKTVsB+C7eq3y=O0x3v8MW7KxUfhpg6UUr23rw@mail.gmail.com>
 <f023ba8341f9b44610cc4ac00cf0ee33@beldev.am>
 <CAKEwX=MXD9EB242WkB50ZBmZgV-CwrAHp=_oE+e=7yHDfrMHtg@mail.gmail.com>
User-Agent: Roundcube Webmail/1.6.9
Message-ID: <3f013184c80e254585b56c5f16b7e778@beldev.am>
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


>> >> >>> Do you have zswap/zswapped meminfo metrics from these tests?
>> >> >> Yep, and those look somewhat similar:
>> >> >>  - zblock:
>> >> >> Zswap:            234128 kB
>> >> >> Zswapped:         733216 kB
>> >> >> -  zsmalloc:
>> >> >> Zswap:            286080 kB
>> >> >> Zswapped:         774688 kB
>> >> >
>> >> > I tested the kernel build on a 4-core virtual machine with allocated 4
>> >> > GB RAM running on a Ryzen 9.
>> >> >
>> >> > The results are the following:
>> >> [...]
>> >>
>> >> Now what's funny is that when I tried to compare how 32 threaded build
>> >> would behave on a 8-core VM I couldn't do it because it OOMs with
>> >> zsmalloc as zswap backend. With zblock it doesn't, though, and the
>> >> results are:
>> >> real    12m14.012s
>> >> user    39m37.777s
>> >> sys     14m6.923s
>> >> Zswap:            440148 kB
>> >> Zswapped:         924452 kB
>> >> zswpin 594812
>> >> zswpout 2802454
>> >> zswpwb 10878
>> >>
>> >> /Igor
>> >
>> > May I ask what compression algorithm you are using?
>> 
>> It's LZ4 for all the test runs.
> 
> Can you try zstd and let me know how it goes :)

Sure. zstd/8 cores/make -j32:

zsmalloc:
real	7m36.413s
user	38m0.481s
sys	7m19.108s
Zswap:            211028 kB
Zswapped:         925904 kB
zswpin 397851
zswpout 1625707
zswpwb 5126

zblock:
real	7m55.009s
user	39m23.147s
sys	7m44.004s
Zswap:            253068 kB
Zswapped:         919956 kB
zswpin 456843
zswpout 2058963
zswpwb 3921

>> > And does the zswpwb come from zswap shrinker?
>> 
>> Haven't looked into that, to be honest.
> 
> Can you check:
> 
> /sys/module/zswap/parameters/shrinker_enabled

It's 'Y' so the answer is yes.

/Igor
