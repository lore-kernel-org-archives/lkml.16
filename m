Received: from bisque.elm.relay.mailchannels.net (bisque.elm.relay.mailchannels.net [23.83.212.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F19A935
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.212.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738344707; cv=pass; b=kytWAUdjSbXIgjqZBeFXmfTLd6ARPxNJ4mkpRNUXqhPTrDwTxX+Ba8OfFLI3MU+OUG9AWbDz7ZYWjiJievV4gPLFGG2wiV4yQSpbx0wb7hXGVWBdkwvC2fcMtlBzn6hfCoVJCOi+XS+NVrxTH8fLS4DDw8KwLxOdUHNxoqmduGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738344707; c=relaxed/simple;
	bh=uDGIYzvVvz1Yg61KexnHobDE2HMWuZriExs/LO5tQu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cTYlqmCnNxdBoKLYM3o+X5OJfVDc6YaVz76Lm0KT9KtGi8gLvxdX2DoyugBWJUatQaRktq3QsXfKOScXiC0mB5p6sbfVfNSnxd8OCoyHh5smbQL6B465DBdEFg79DrujfqWPeTu7w0xRQ25LsXWbhGXTzl/21Hk+6HZo/kV+IKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=pass smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=WdPWWh6G; arc=pass smtp.client-ip=23.83.212.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="WdPWWh6G"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 2DBC63227C3;
	Fri, 31 Jan 2025 17:31:38 +0000 (UTC)
Received: from pdx1-sub0-mail-a215.dreamhost.com (100-119-243-17.trex-nlb.outbound.svc.cluster.local [100.119.243.17])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id F07F4321C67;
	Fri, 31 Jan 2025 17:31:35 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1738344696; a=rsa-sha256;
	cv=none;
	b=FaqqvyOBn4qZcHJU44Jzg6sYR8iRzZ8vZ/twSxfaC7rMni8ef/Z3jN3khUnH3M2YmEnOod
	21bGJB2gu23ywMrys75VLV1HKYWtjz6w3cgPsqB0tL9r+5nCvhQtjQ4fakl4sWhpjPHhNj
	wh5EbIli0oyPvdlPZBY7ngnU4PRTl3TZVkkCXoHWj5AA5bp8UCq0YwzM9JG24CMgPM+wwr
	0a+vr1/bOzy5SxCu6WeFskKK42VYdc052pk/jye/6sUZOn+EjBuMDEF14HB+KkO3ag2fLh
	Sg+husL31JX4MMAPCfFaxz0wDLPFqt1tLK7G9SFLLj5MDjbXrdqYKXhIxWJi0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1738344696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=uDGIYzvVvz1Yg61KexnHobDE2HMWuZriExs/LO5tQu0=;
	b=kRWlroGqsRgEv2L805laVNDtJX2YY1Md+s/NOKxcb5dwwu2FIkE1IURCBAcXzoHVb+9uLf
	40U4xShCWnSZEKli1B8q4Ic/SBtCR2pVGghG1ZgGoCOM8g3nLgK8lGafRedVauyjuibO0z
	X79QF7kBJuLaYex/2E7j1gEJS2hYXv2bHp7j16lL7MFUKhVfNIDpKHPIRWXFO4v850DQ8F
	+qwW/lx0bAUzvu6jrQAxO+B+I3VYQPEBOQXSX0pYEHd2jllCmUcOLVQ6dToUrp0QFOwStx
	co3a3ungxeAVwZP2cbZh6kEWhyF1LVgB0QcOA3+jjVqW6UaDjCntRvDpuZqDQg==
ARC-Authentication-Results: i=1;
	rspamd-854f7f575d-xnhql;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Befitting-Hook: 388575326d7760ee_1738344696250_244362567
X-MC-Loop-Signature: 1738344696250:4262860451
X-MC-Ingress-Time: 1738344696250
Received: from pdx1-sub0-mail-a215.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.119.243.17 (trex/7.0.2);
	Fri, 31 Jan 2025 17:31:36 +0000
Received: from offworld (ip72-199-50-187.sd.sd.cox.net [72.199.50.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a215.dreamhost.com (Postfix) with ESMTPSA id 4Yl2xg163dz8m;
	Fri, 31 Jan 2025 09:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1738344695;
	bh=uDGIYzvVvz1Yg61KexnHobDE2HMWuZriExs/LO5tQu0=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=WdPWWh6Gs5IYzBogP8z1oZBEFgaT4Idq2Vpx+z0g5hjxwUNUJQV5rEmAuVKUNmfjb
	 onbzLBSZFrNu0y+TW+Uh6kT7hSQxVTs2SkWV6bJGS/AlY+mmwCAtJeYYuudN9dp+pj
	 rZSGOXVmE9PDgDsmL6Dpxjog8lsyCuQMPQ17gX+QQySkNMv28OsqgMuVNQLMuoYjIG
	 mBWMyVx5tQxBBQZ1LmTKM+SXNf7yC8zBnpz0zNZ4tj+QOg9pddGy2s+UdkX+STsSCA
	 kZx5YuO5lEyuXRRCVYn8fQInCXFBRuvWrIk7GlXs61ExZfb3aTUCqRnl7SnaakTD6P
	 GYphyau7P0GfQ==
Date: Fri, 31 Jan 2025 09:31:32 -0800
From: Davidlohr Bueso <dave@stgolabs.net>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: SeongJae Park <sj@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC PATCH v2 4/4] mm/madvise: remove redundant mmap_lock
 operations from process_madvise()
Message-ID: <20250131173132.uqjwrzj7e5vx2sbv@offworld>
Mail-Followup-To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	SeongJae Park <sj@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
References: <20250117013058.1843-1-sj@kernel.org>
 <20250117013058.1843-5-sj@kernel.org>
 <aeeac6f3-f828-4bee-966f-c8df41df30bc@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aeeac6f3-f828-4bee-966f-c8df41df30bc@lucifer.local>
User-Agent: NeoMutt/20220429

On Fri, 31 Jan 2025, Lorenzo Stoakes wrote:

>On Thu, Jan 16, 2025 at 05:30:58PM -0800, SeongJae Park wrote:
>> Optimize redundant mmap lock operations from process_madvise() by
>> directly doing the mmap locking first, and then the remaining works for
>> all ranges in the loop.
>>
>> Signed-off-by: SeongJae Park <sj@kernel.org>
>
>I wonder if this might increase lock contention because now all of the
>vector operations will hold the relevant mm lock without releasing after
>each operation?

That was exactly my concern. While afaict the numbers presented in v1
are quite nice, this is ultimately a micro-benchmark, where no other
unrelated threads are impacted by these new hold times.

>Probably it's ok given limited size of iov, but maybe in future we'd want
>to set a limit on the ranges before we drop/reacquire lock?

imo, this should best be done in the same patch/series. Maybe extend
the benchmark to use IOV_MAX and find a sweet spot?

Thanks,
Davidlohr
