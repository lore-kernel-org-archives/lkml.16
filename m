Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6D613AA27
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 17:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750614294; cv=none; b=TGTW4WNGBQSNRK+2YTIE0znzBT8I3g809lmTlu3sbILi/+ZZl8WkBcFRJLCTMJJ1l5Ks0pTtYkoCgHUBJbz0iyGJsE2KqWsXIvWA9eRGTZ5gfO9yomrqmzk+A1rohJIdrTijHPsbodaEMhNxpJM8w35jrIjok7Dl/gJC5sz6NW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750614294; c=relaxed/simple;
	bh=zeQAhV43QUeQfq0WWDM7g00W44r0T+wHcAs4LY6MVbY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=YyGZOCDS7LF1fb+Z71mwzvIJJy3p9RYwOmUe/zbJJ+8QoZMQdj4L4ymsOmVn+y3SGVhzDxJko3nAQfIGe6WOKNxuMxMjdhPglE2b01fwGT4/9OZKhrkopgUoOnD6fN3M7V3zky2d21nng34cAQAQf7gecDiVF8fpuk+323QdfrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Yahs6+cj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pA2tFXjT; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Yahs6+cj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pA2tFXjT"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 43CE51380CEA;
	Sun, 22 Jun 2025 13:44:50 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sun, 22 Jun 2025 13:44:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1750614290;
	 x=1750700690; bh=wX0xhtUiNaavlvoeqLUK7VU9fCulEKaVWdquJFUErSQ=; b=
	Yahs6+cjCA52QFm02QRROAdB00ML3PHNHPDEX8lZxqxvE/UZxIksm3cfJKloyEwC
	08ViWQ01A+YR1J4lfneZZ3/+wF/OA6VWIqrHdTP7xbQOYotYJjMWa0s6t/FbK/AK
	jXqGXCHSLxHwSw6aff5xg5xmaJYxqWWCtoBHbYIEr3LB0KTMqxA05ccP2JJh2Dyq
	ftqvOmr/ItNSgKnX+IMqoKohBXHlfYuXiutqXuzNkuMzBDTkOqTfIPA4lyEsNUfq
	q3DPyil6nzQDxV5dvFi9R6zSZoAuVK3InQkvTZRDvvXA1FbUtb5kLik/LhRYKPhO
	+sSR9vTy5WxjxulK9bFM/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750614290; x=
	1750700690; bh=wX0xhtUiNaavlvoeqLUK7VU9fCulEKaVWdquJFUErSQ=; b=p
	A2tFXjTtjS1p5pykgpAzvkucR4+iYdEQ020f78W4MhaEh8VJiqS5A/CaEIlO76RR
	vI2xsv9TIqk7MsT3Hd9YD91JjRy0LKR0oMybR0Wez+pTwZ7SeioWZQT6gGjc5fqn
	uD97+2SMGPDUaa5/PCzMDM64vsRDEJxSzPO+L+ugPxl8A9+MlvpyGJ0qdSNKg08a
	5D+E/J+oifR9cX15EqLKv1OEGAC88ORY280Gh0rrhpT7AIpraGDTaPIBmRizGobl
	njXLmAWKXxbee5oGwUGXXbpm4qyPCOxiKgmS2nZHZ5esyd+PsW1ZIWUcPul9uheP
	0w8YUCp3gcAU8j5yB8SKw==
X-ME-Sender: <xms:EUFYaLI15FDYsQS_9YA_AGNAOkUxG9n1PjIyDb3T-akdbs_ukV1wFQ>
    <xme:EUFYaPLkdp1VRe6DT2650DeklDieDyeiRfTY15rvL8JxndxC8o7BjalG1U4JfUHIR
    wf2uKBWj7Usx4q81qE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddugeejlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepvhhinhgtvghniihordhfrhgrshgtihhnohesrghrmhdrtghomhdprh
    gtphhtthhopegrnhgurhgvhihknhhvlhesghhmrghilhdrtghomhdprhgtphhtthhopehr
    higrsghinhhinhdrrgdrrgesghhmrghilhdrtghomhdprhgtphhtthhopehsnhhovhhith
    holhhlsehgmhgrihhlrdgtohhmpdhrtghpthhtohepughvhihukhhovhesghhoohhglhgv
    rdgtohhmpdhrtghpthhtohepvghlvhgvrhesghhoohhglhgvrdgtohhmpdhrtghpthhtoh
    epghhlihguvghrsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkrghsrghnqdguvghv
    sehgohhoghhlvghgrhhouhhpshdrtghomhdprhgtphhtthhopehhtghhsehinhhfrhgrug
    gvrggurdhorhhg
X-ME-Proxy: <xmx:EUFYaDs_yb9YFppfCv4c0fskz0zJ80kVkvXwz9b6-c0fgPIMRlITFQ>
    <xmx:EUFYaEZaxjCB4hzPBWCwWBzNtdz8WB5Jk4UT_ekkDfHwLxYiu_fukQ>
    <xmx:EUFYaCYYWyKk4C_a-XKuBCE-IqJ_PCRyQQvJSwWIWNjq94sohS8LEQ>
    <xmx:EUFYaIAIajDN9wOSOu1jvmX001tICAPRn9_fb3Mjcsyl5fl1-lw2YA>
    <xmx:EkFYaEKIkb_SD1ArJAQy6hGxH0Xj0HCI--J_JMKLhqffgDVI5lmO1Cqg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5CC9C700062; Sun, 22 Jun 2025 13:44:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ta22caa133d9fa1a8
Date: Sun, 22 Jun 2025 19:44:29 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Sabyrzhan Tasbolatov" <snovitoll@gmail.com>,
 "Andrey Konovalov" <andreyknvl@gmail.com>
Cc: "Andrew Morton" <akpm@linux-foundation.org>,
 "David Hildenbrand" <david@redhat.com>, "Dmitry Vyukov" <dvyukov@google.com>,
 "Marco Elver" <elver@google.com>, "Alexander Potapenko" <glider@google.com>,
 "Christoph Hellwig" <hch@infradead.org>, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 "Andrey Ryabinin" <ryabinin.a.a@gmail.com>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>
Message-Id: <8ab6c624-28a1-47b9-93fc-190719c06727@app.fastmail.com>
In-Reply-To: <20250622141142.79332-1-snovitoll@gmail.com>
References: 
 <CA+fCnZeb4eKAf18U7YQEUvS1GVJdC1+gn3PSAS2b4_hnkf8xaw@mail.gmail.com>
 <20250622141142.79332-1-snovitoll@gmail.com>
Subject: Re: [PATCH v2] mm: unexport globally copy_to_kernel_nofault
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025, at 16:11, Sabyrzhan Tasbolatov wrote:
> `copy_to_kernel_nofault()` is an internal helper which should not be
> visible to loadable modules =E2=80=93 exporting it would give exploit =
code a
> cheap oracle to probe kernel addresses.  Instead, keep the helper
> un-exported and compile the kunit case that exercises it only when
> `mm/kasan/kasan_test.o` is linked into vmlinux.
>
> Fixes: ca79a00bb9a8 ("kasan: migrate copy_user_test to kunit")
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Suggested-by: Marco Elver <elver@google.com>
> Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
> Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
