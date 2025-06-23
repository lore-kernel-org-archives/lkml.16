Received: from panther.cherry.relay.mailchannels.net (panther.cherry.relay.mailchannels.net [23.83.223.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8F7146A66
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 23:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750721801; cv=pass; b=MwCyn5L13aF7TJm4J9f6hAzATGx/a7WlYEnMJrrLqSM7rt6t+Kc0zMMub1Q61W7WAnJs8WGXOdHIASKc24v6qzsyq0oG4nZ9i79Lqga4nrVMMZLwd5STLVAS+iM68zxEV4PVT/YKyQ+ujZpt71eCSqD/7MzM80QvJ/26+N+lIok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750721801; c=relaxed/simple;
	bh=CE2mHNZ+9Eog2dFdWpwOrrjyyGkcpM9V9hpM7yzG+E4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FyFzV1udtYwOS20KIP4qXajrv6D/SE+0vWnPdRo0wgZd0C2OYfrFWwibcLCI4DLcIqhFoLKNMHq2Mye8drWjgy8WK+JupuIIEzVHDARyeJRfvhUUf3juc3/3N2Ut3HxUoMKMjqXbpa84dMI0s+ztrzXjdbHAOE9YXVyZ73yG0dY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=pass smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=YYCy+M/P; arc=pass smtp.client-ip=23.83.223.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="YYCy+M/P"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id A0D1B8450F6;
	Mon, 23 Jun 2025 23:36:33 +0000 (UTC)
Received: from pdx1-sub0-mail-a262.dreamhost.com (trex-green-0.trex.outbound.svc.cluster.local [100.108.88.53])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 31072844C67;
	Mon, 23 Jun 2025 23:36:33 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1750721793; a=rsa-sha256;
	cv=none;
	b=ivaUBsjtTbFvqsZZ3zABvVqqFNtEFPUW8hlSIdfDF2SsKzUfEhXMJh1kWAqVCX34EYmtYt
	soFAjMRbyu4cInZZEe6AWqTDl133QifvHb//IlJLS2oe4ReqhlLbHxKis897NFWfe3yj5f
	p0yTfBGF0l0j2GR9R91Xh5MSXcEFEBx78OUR8NbzcYOh0o2J0mQonAd/t/AwX5eGkfKc77
	Yui3QLQ43pkn/78Ej8sFX9TSFnCocvyNHxHsin1Bnsk7btuN/zzWZwyIyKokUjG04gm+NF
	sQfQzV4Sk56kA2WwQpQCe3uJcOCe63CF+6WsiYK+8UrXCL9mqL+B51OOp800lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1750721793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=OQyAC5Zwg9VOAoEoP5oerQJSnLa4XNp2rsgYqfm0n0Y=;
	b=OvB9uYJT8ebCAZ97f8O0O35OWyFw1TNoI2deW2RV8cI2YpES1MqpEepU6XEqQYGRY7NXJd
	OuDTrGNmrdOsy+uz8ywDyqpEmYhgKpChw4p0nOu0GbIWWLKkjEY1DXhKls1LUHICoE0xXp
	FeRWujjuFbYPSzvJDTv2QnMaxDz6EfGdL/Xa30S8X1tL+PSVVUS30Q52VYlSD3L/h2VDuM
	svzRe2RRM/TNqYbnHFqRr0daQZ0nKqjoirLVMS0XBG10rmENf7Bhw37wHzrlA+JtEsgHWq
	DoIOi9jkWeBHpt1/Xa4yVkD/VNteKBXqlpZy2er+AnuhgnCpgsbnA0AdJyAfSQ==
ARC-Authentication-Results: i=1;
	rspamd-6597f9cdc7-tzmdw;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Slimy-Juvenile: 562a32f86304b267_1750721793479_2456449309
X-MC-Loop-Signature: 1750721793479:2756345217
X-MC-Ingress-Time: 1750721793479
Received: from pdx1-sub0-mail-a262.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.108.88.53 (trex/7.1.3);
	Mon, 23 Jun 2025 23:36:33 +0000
Received: from offworld (syn-076-167-199-067.res.spectrum.com [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a262.dreamhost.com (Postfix) with ESMTPSA id 4bR4Gm3W1sz9v;
	Mon, 23 Jun 2025 16:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1750721792;
	bh=OQyAC5Zwg9VOAoEoP5oerQJSnLa4XNp2rsgYqfm0n0Y=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=YYCy+M/PJOzIJse6rDHHkkQvVR/gdqh61FsOaFOZrONM4ymwcVRIxBwjlBT9jIk5C
	 ZT8tVlBNo84xY4dNmwxNwYL4+N2DQfYbLMhR0PSEL8AqYCCcYLJWLGfxezgNg2EKGA
	 +8Z51B+nRl74CNRicejw9UjlHRnS6/g2QRFBx+fYO+ndRymNArIIZzIi5L+uAZ7Yw+
	 Ilci6qzCU5zD67JFWoGP1/QHmTCl3SaHEQtRhH+PWF9u+sSngi7JBGFCTGgNIsyFMD
	 dq9ZfFdQuw/D+Fh9PNnuOmOi5Ez6SuaFGHRNbOcYlWQmYexvEGb9exuN3QBcyrtqje
	 vZwo8seBqWEmg==
Date: Mon, 23 Jun 2025 16:36:28 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: mhocko@kernel.org, hannes@cmpxchg.org, roman.gushchin@linux.dev,
	shakeel.butt@linux.dev, yosryahmed@google.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] mm/memcg: make memory.reclaim interface generic
Message-ID: <20250623233628.kv4c4k74rdpfek7x@offworld>
Mail-Followup-To: Andrew Morton <akpm@linux-foundation.org>,
	mhocko@kernel.org, hannes@cmpxchg.org, roman.gushchin@linux.dev,
	shakeel.butt@linux.dev, yosryahmed@google.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
References: <20250623185851.830632-1-dave@stgolabs.net>
 <20250623185851.830632-3-dave@stgolabs.net>
 <20250623144528.19721543236d8a0165df4cad@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250623144528.19721543236d8a0165df4cad@linux-foundation.org>
User-Agent: NeoMutt/20220429

On Mon, 23 Jun 2025, Andrew Morton wrote:

>On Mon, 23 Jun 2025 11:58:49 -0700 Davidlohr Bueso <dave@stgolabs.net> wrote:
>
>> This adds a general call for both parsing as well as the
>> common reclaim semantics. memcg is still the only user and
>> no change in semantics.
>>
>> +int user_proactive_reclaim(char *buf,
>> +			   struct mem_cgroup *memcg, pg_data_t *pgdat);
>
>Feeling nitty, is this a good name for it?  It's hard to imagine what a
>function called "user_proactive_reclaim" actually does.

I'm open to another name, sure. But imo the chosen one is actually pretty
descriptive: you know it's coming from userspace (justifying the 'buf'),
you know this is not about memory pressure and the memcg/pgdat parameters
tell the possible interfaces. Would prefixing a 'do_' be any better?

>That it isn't documented isn't helpful either!

I had done this but felt rather redundant and unnecessary, and further
don't expect for it go gain any other users. But ok, will add.

Thanks,
Davidlohr
