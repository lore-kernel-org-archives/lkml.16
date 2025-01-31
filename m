Received: from panther.cherry.relay.mailchannels.net (panther.cherry.relay.mailchannels.net [23.83.223.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEC918E25
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 19:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738353375; cv=pass; b=Z/b2C5y0K1vkKZjqHDrYrETxno1HSgbbLlB2VDZxLMnoVDZjr1oIt3XsCXX/JRd5S5luY9xAU3pGUxQXC0IyemmCd34TY6X96v7n5of54mWjGMkf+YhSD3fqdpbNQ2VHtlDb4zEWmJYm6qnF22/1sOmZjaGoiVvNaBfPDZfiR5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738353375; c=relaxed/simple;
	bh=P8Ib5meronWJ5pog44MU33YDWBXPL1+27DT2hv4W32U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R0JtoMvEveey7IOzQqMAU1HIy2+EoOM4DSXsbMXhYh2AsHyRFgTh7Lo4jNpxmzG+iSvAajkhWuTmEQdVN93OimlxWc50kDnya+SuoK3ameB3rEWCiFR74iYoWKt/MSREIOICVhUIY7fiqySnw6tKuSMkz5/HampF2ijdp1Qrti4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=pass smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=ltawTiyp; arc=pass smtp.client-ip=23.83.223.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="ltawTiyp"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id B0EA5903F34;
	Fri, 31 Jan 2025 19:19:42 +0000 (UTC)
Received: from pdx1-sub0-mail-a241.dreamhost.com (100-119-10-57.trex-nlb.outbound.svc.cluster.local [100.119.10.57])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 2CD46903DF8;
	Fri, 31 Jan 2025 19:19:42 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1738351182; a=rsa-sha256;
	cv=none;
	b=bUbuSoMs2jRkRrJdBI4NQjRTTQIROwtNqeGLKFgKkXA1OLYPzWIq4Tx9Hel/6KMLQp5rp7
	9pd8RWa0VWRlBVN99OMM8PFDFNA2GIDNhLGJkqYbEo6zp3522nQ6PBgChVI2d2t11OpLYd
	q5hYRsemKvI05SYRvE7r0S+Mjw/W1a7pBgdqnGiZACGdWLDGI19umpjc4foc/eVl65pmBh
	8imVTZyc6ecG1iaMXTKs64Dc9XoILPcTjMg4I/BeKUmD7mgUlCLFpUUprQCXNY0YNzRpJg
	3P14o64Gj9O+tZsGs3TuDmDtlhrJq0HqU4Gm/5PMT9bQinYVgW/Xpparc8kY4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1738351182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=P8Ib5meronWJ5pog44MU33YDWBXPL1+27DT2hv4W32U=;
	b=QTMJOSzcf8rBGI1IyIejhnfzuxmZan4zBp3CzmJsRSzx7NZHM8d20kbEIk/a1UbUYc4ihB
	GXaObZJx0Q7rK6MNavX9OLnfrdvubAHG8xKnqrpXtTqDZskVWEDxqy11JMpry1LUnNcI7M
	RfyoQcISCIpDmnduK0/6DPmFtPaRzoJLfq508z+qHLrYvqC3Lt8YVHaFP6knMVzeUot/1J
	pSrmYOaDLDXfXcQgJixiNRb8EDWbyKbcwFoHsH0MDRg03qBCS2kO0bvAQlv0+bD2TI3nfy
	W9Dl/zBuYyu5hOqL4ffm+6yQXeINFgZWs8+VdmAIil5mMzqTbXpGC5VfhEKBaw==
ARC-Authentication-Results: i=1;
	rspamd-854f7f575d-7zwqq;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Share-Spill: 7a72042d720477ed_1738351182479_1353240969
X-MC-Loop-Signature: 1738351182479:4072642448
X-MC-Ingress-Time: 1738351182478
Received: from pdx1-sub0-mail-a241.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.119.10.57 (trex/7.0.2);
	Fri, 31 Jan 2025 19:19:42 +0000
Received: from offworld (ip72-199-50-187.sd.sd.cox.net [72.199.50.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a241.dreamhost.com (Postfix) with ESMTPSA id 4Yl5LP3KpKz8T;
	Fri, 31 Jan 2025 11:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1738351182;
	bh=P8Ib5meronWJ5pog44MU33YDWBXPL1+27DT2hv4W32U=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=ltawTiyp/SiXgRtujF1aHUZgWTsL3Q6NQwBVt9VjvDLIFysQT3P1K8fMJCKkU7Vs7
	 /w4WvBbcksm5fkG4L5c2kqIDHLySVSJ6CPCvy2sTdr0tJ9GLmCoj1HO1CUJ70UC85t
	 /x1fNkoOZH/AWi5P1OOPVOnU7tahRS1UAG9MlO2InbTqgZv4q0fQenh45tgwx8tpS3
	 ASEgU4BpLa0TCv1bzhZVAXeroos2roNaqBHbzb2N0UhRCfzSZJArfDONNyf3YjuTaA
	 HAkfn+creV1dWiAONWTaBMyhqtwU2Te+uadbkEB9rggI43/wUnrD1uUAZUjbkwWTYp
	 W7qctgBDBRXTw==
Date: Fri, 31 Jan 2025 11:19:38 -0800
From: Davidlohr Bueso <dave@stgolabs.net>
To: SeongJae Park <sj@kernel.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC PATCH v2 2/4] mm/madvise: split out madvise input validity
 check
Message-ID: <20250131191938.o7d3vkatodryi65e@offworld>
Mail-Followup-To: SeongJae Park <sj@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
References: <20250117013058.1843-1-sj@kernel.org>
 <20250117013058.1843-3-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250117013058.1843-3-sj@kernel.org>
User-Agent: NeoMutt/20220429

On Thu, 16 Jan 2025, SeongJae Park wrote:

>Split out the madvise parameters validation logic from do_madvise(), for
>easy reuse of the logic from a future change.
>
>Signed-off-by: SeongJae Park <sj@kernel.org>

Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
