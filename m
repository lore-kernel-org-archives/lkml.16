Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5C225745F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487264; cv=none; b=t96fOdZIGKlpUHaLfDk9pg00roEl21NxNqNEQzmVUmruLMkQn89MhNZY2foKa2XyaQ7U+J4pQfzEcg42NklbPxDGrB5i8E+OSnjDF37NPVm/UzSgi3VcReMt/H3dDHklsXaMD1L1+pYPt4Nre2PVp/PQxzEaQ99oh/d0AkNaMhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487264; c=relaxed/simple;
	bh=Z++27ncjcOuMlTdV088m+6vSWE+jrrtVyQK1kSg6K84=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=YR7IunrcYybN/kHyL3YUDqleaXugIZD78PZMonskxewoMxRqquTXZhJ9z+7gG+Fc0cLLauY/aOfwzLwd4e/AsNuTUT3aZOpsGHcZVUKE7LKJ571OAlpcL8HDGBHUaO4F1LYVNHgxX6v2EKjSGfppzkeIYLWX/jXuV4IR0xPSmj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=l4oz5E9e; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dT6yqn5i; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="l4oz5E9e";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dT6yqn5i"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 55F991380553;
	Thu, 24 Apr 2025 05:34:19 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Thu, 24 Apr 2025 05:34:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745487259;
	 x=1745573659; bh=g8qMObmnBvoV59zuTKBbhVVCoTSB0SGdVbbq3ciSqIs=; b=
	l4oz5E9ejhddalNE1gBp+WbQB1JewQJqQ9RdL0zT/gUM3oRuK35ZYP2tWi5htxmP
	yY0KzoYer1ELpvxbaW+FRzTUcW/HbvM3DPa/tNw/hHC/LV9mxdx0AH/aQetgWJJO
	CXDV5fh4s++ZuBKQrI2Hvs2N0SbuyfpBQdrBKd1NiYTIXxw1ybRJ1TfrF3IIx5oI
	cDpwF2xrssubc8Z6gngfGyCpx9i2yT3jRMXUJPB8b7tfKr62910stzDTsEwobuhJ
	HH/0TwOXdZCgFo8v9wY4PcWAtt4s+7LtlxuNCt5ppvx/tee4reFVnrxScUZfeEIw
	sYknnea8eYNlR9yPs9BwKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1745487259; x=
	1745573659; bh=g8qMObmnBvoV59zuTKBbhVVCoTSB0SGdVbbq3ciSqIs=; b=d
	T6yqn5iMxmNORQxqSJVxVOfsE1+MyPJ2IlhsOxZg5eYAlKo+V/ZSoU/kAEI2UFRJ
	QP8BLuWqARE+/yBTN4MnBP1PnLf06gYsuL8ilVJxAl1uasCo0RL5R2q63aS/9ocl
	nCyYl+c+5W8I7vJhdhuH0zkul45eZdNb59MZqO9I1CQnMx3FQOV7VSW/xo+bJ25x
	sEtg/LSLQ7JaRp56YE76CPGvcJYGZPN+8vKQTcTYoQ5mq3qBInbA6UQNw1w+aNQi
	SorZso3zWNrCK01NEKFtpQ/FzFwvPJGFkjlRIiWk7tvRAzJBK6CTXfUK0BlMwJfS
	CEOX5p7mechLpVr+0PBmg==
X-ME-Sender: <xms:mgUKaCaPimW3wcxILfm3FjZd-bFBsnZwjD4EBBjuuT07Hm-_H_eE9Q>
    <xme:mgUKaFYzmevekXL1SEwZ6uoWLM9YCOoaDbZ-xrx07SSprEw46yYnoyXqXVmEGpXmW
    KM8_XiNisXOsngv2WM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeluddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    ledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghhrrghfsegrmhgriihonhdrtg
    homhdprhgtphhtthhopegthhgrnhhghihurghnlhesghhoohhglhgvrdgtohhmpdhrtghp
    thhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhohhrmhhssehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehrphhptheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtth
    hopehkvgigvggtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohep
    sghhvgesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlse
    hvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:mgUKaM93AtMAZkkQnEadhKb6xhm5dMqzXlz2s99LTiCcIjlp6CsfnQ>
    <xmx:mgUKaEppaEm5MZ8Y110NSSIUVAaHiZLwqEkxrIc6DERY1OGSv9_Yjg>
    <xmx:mgUKaNoUiYjTRKi5dN_5BSIv2ZnNYTgtPB1BmCaQJBOADnvUZIEUbw>
    <xmx:mgUKaCRZ-BDrqUczsHwqw61BfOo4L-wkV4L-yvEzLNj1qxZrpEg4VQ>
    <xmx:mwUKaI20wZLLwZFJX1IyMtI4gGFUYoQ19uIHnB_aE5750WsSegl2253v>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7844C2220073; Thu, 24 Apr 2025 05:34:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T5f99f2cd9f4697c1
Date: Thu, 24 Apr 2025 11:33:58 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Simon Horman" <horms@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Alexander Graf" <graf@amazon.com>, "Mike Rapoport" <rppt@kernel.org>,
 "Changyuan Lyu" <changyuanl@google.com>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Baoquan He" <bhe@redhat.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <19985176-a552-482e-9baf-7a1c4fe45d89@app.fastmail.com>
In-Reply-To: <20250424092344.GC3042781@horms.kernel.org>
References: <20250423162924.2213664-1-arnd@kernel.org>
 <20250424092344.GC3042781@horms.kernel.org>
Subject: Re: [PATCH] kexec: include asm/early_ioremap.h
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Apr 24, 2025, at 11:23, Simon Horman wrote:
> On Wed, Apr 23, 2025 at 06:29:18PM +0200, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> The early_memremap() function is decleared in a header that is only indirectly
>> included here:
>> 
>> kernel/kexec_handover.c:1116:8: error: call to undeclared function 'early_memremap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>>  1116 |         fdt = early_memremap(fdt_phys, fdt_len);
>>       |               ^
>> 
>> Fixes: 4bfe738ce89a ("kexec: add KHO support to kexec file loads")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> I didn't try to reproduce this problem. And perhaps this isn't particularly
> important. But, naively, I would have expected the following as it is
> the commit the introduces calls to early_memremap() in exec_handover.c.
>
> Fixes: b0a311dba688 ("kexec: add KHO parsing support")

Yes, you are correct. I've sent a v2 now. Ideally Andrew can just fold
the fixup into the "kexec: add KHO parsing support" patch, in which
case my incorrect changelog text disappears.

    Arnd
