Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1362914
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747891697; cv=none; b=bbHdb7PrFo5e+J4N3979XhLCWqq2LX0cg9y+sS4AShlT2rMeTyASz3nzRy5kUvyFpaEEPBn8UF8hr1ocyqpFblTANM7XcO4Ivb7sSB2TMTpd27PSGtu9IT4T8QQ9kpuxwemZpnQwMvU2gixz+SiCnyoe4KJDva8EG1WvLAZM1fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747891697; c=relaxed/simple;
	bh=9cZtTNBkmOInry/0DtcVdPIk3LGdV1wFuHEaKaPwSN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YgEoXotnBNSUmNSQXdnap9F6WY1En1SJF8Hbd6gxau0jJHYkHmYfN7OV789wcR6jyo1JwzQheZknALzf3xqnIYvi9EwGeWYLvtwAWkFIqROFW9foXe3lwfmQomrj/bs6X0jZf2pXYxPGQR7u6fihkkvoyzVaV/a9P4Cwoipup5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-681ff7000002311f-45-682eb5eb93ce
Date: Thu, 22 May 2025 14:28:06 +0900
From: Byungchul Park <byungchul@sk.com>
To: aahringo@redhat.com
Cc: kernel_team@skhynix.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC] DEPT(DEPendency Tracker) with DLM(Distributed Lock Manager)
Message-ID: <20250522052806.GB42746@system.software.com>
References: <20250522052453.GA42746@system.software.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522052453.GA42746@system.software.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFLMWRmVeSWpSXmKPExsXC9ZZnoe7rrXoZBh0XZC2+Xg+2uLxrDpsD
	k8f7fVfZPD5vkgtgiuKySUnNySxLLdK3S+DK2PJ8B1PBUY6Ktm8zmBsYb7J1MXJySAiYSHTf
	Oghn33m7kRXEZhFQlVhx6BuYzSagLnHjxk9mEFtEQFyi6ft0dhCbWcBSYt6tY0xdjBwcwgJ+
	Et2LAkDCvAIWEg/ezmIBCQsB2e+77CHCghInZz5hgejUkrjx7yVYJ7OAtMTyfxwgJifQwNZb
	PCAVogLKEge2HQeq4AK66ymrxPUNh9khjpSUOLjiBssERoFZSKbOQjJ1FsLUBYzMqxiFMvPK
	chMzc0z0MirzMiv0kvNzNzECQ3BZ7Z/oHYyfLgQfYhTgYFTi4XU4oJshxJpYVlyZe4hRgoNZ
	SYQ3doVOhhBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFeo2/lKUIC6YklqdmpqQWpRTBZJg5OqQZG
	BV/Ogl32jvuMRZcIZRy57+kamvFR20yeI1FvXazSOmfnH+yHPlpN2XZ+SVrtygu5l2elVjay
	7QmOf/6532jiX53TtyVnW3nsXJXjmlRq8/y4bsITF41r0wSOzfPanyrhGOXuxehsYGxxh9Xx
	YzzferXH4eeu2Ex+9Oem/Jz7Tj1V2fE3a2KVWIozEg21mIuKEwGb0VvHPQIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprILMWRmVeSWpSXmKPExsXC5WfdrPt6q16GQe8iUYuv14MtDs89yWpx
	edccNgdmj/f7rrJ5LH7xgcnj8ya5AOYoLpuU1JzMstQifbsErowtz3cwFRzlqGj7NoO5gfEm
	WxcjJ4eEgInEnbcbWUFsFgFViRWHvoHZbALqEjdu/GQGsUUExCWavk9nB7GZBSwl5t06xtTF
	yMEhLOAn0b0oACTMK2Ah8eDtLBaQsBCQ/b7LHiIsKHFy5hMWiE4tiRv/XoJ1MgtISyz/xwFi
	cgINbL3FA1IhKqAscWDbcaYJjLyzkDTPQtI8C6F5ASPzKkaRzLyy3MTMHFO94uyMyrzMCr3k
	/NxNjMCAWlb7Z+IOxi+X3Q8xCnAwKvHwOhzQzRBiTSwrrsw9xCjBwawkwhu7QidDiDclsbIq
	tSg/vqg0J7X4EKM0B4uSOK9XeGqCkEB6YklqdmpqQWoRTJaJg1OqgTF7hn9g5gHGjht3lAX7
	emUS89NNex4alWpvV9+1uNlSdNuP+OnXLaXPyGf7WTNzc/GmHUgRdPdTZD4/2b3QyOJM1d7V
	RuqFzBOWzDyX+0aNy0P829vEjyW9k3wCO09m5UdosZ/7K+UQ/eXqm5WXPl1j6rXQj1nIv8j9
	UrZgCoPpd8HmA0/LlViKMxINtZiLihMBf8ZkHyQCAAA=
X-CFilter-Loop: Reflected

On Thu, May 22, 2025 at 02:24:53PM +0900, Byungchul Park wrote:
> Hi Alexander,
> 
> We briefly talked about dept with DLM in an external channel.  However,
> it'd be great to discuss what to aim and how to make it in more detail,
> in this mailing list.
> 
> It's worth noting that dept doesn't track dependencies beyond different
> contexts to avoid adding false dependencies by any chance, which means
> though dept checks the dependency sanity *globally*, when it comes to
> creating dependencies, it happens only within e.g. each single system
> call context, each single irq context, each worker context, and so on,
> with its unique context id assigned to each independent context.
> 
> In order for dept to work on DLM, we need a way to assign a unique
> context id to each interesting context in DLM's point of view, and let
> dept know the id.  Once making it done, I think dept can work on DLM
> perfectly.

Plus, we need a way to share the global dependency graph used by dept
between nodes too.

	Byungchul
> 
> Thoughts or any concern?
> 
> 	Byungchul
