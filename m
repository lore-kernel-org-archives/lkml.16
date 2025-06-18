Received: from flow-a2-smtp.messagingengine.com (flow-a2-smtp.messagingengine.com [103.168.172.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C94D3A1DB
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 01:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750210768; cv=none; b=K95siIAqCAVKkYaq8LR/URWGzcy0/qxXbV8x84vb1PEhLqB9frdjOTItfQTExGdRBG+6jEEQRyRPC2I94DNwP4FZS0a9HDoIOC3SDbsXLqhVzX1dwGA1DvHQ0qQUEgROmrd5q50/bQjY1/ezzEP6kW1QxLUa4aHEUjKSjxliPKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750210768; c=relaxed/simple;
	bh=iLKZnycYf/OaOv9aVHq0rjf9FBwxqL8huDeHOM7iHf0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KbICNcopFPcu0CAnSj/YA/LoFpz+SuXM093ptGBdkZiDNdo2+3RN7rJOgXvpVW2PYmQQhz27u/p+Q/ZlS6W8IJxpL857OQP1RNUsgZliySvVtZJ44WTqEHFPhE8YbiPxMP1sCh7YJPhx3pYgvXSf+bQMeHlR/7JzwRy+j298dxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net; spf=pass smtp.mailfrom=fluxnic.net; dkim=pass (2048-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b=Znq/YFXf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hOyptZOj; arc=none smtp.client-ip=103.168.172.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="Znq/YFXf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hOyptZOj"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailflow.phl.internal (Postfix) with ESMTP id 6BD85200B07;
	Tue, 17 Jun 2025 21:39:25 -0400 (EDT)
Received: from phl-frontend-02 ([10.202.2.161])
  by phl-compute-03.internal (MEProxy); Tue, 17 Jun 2025 21:39:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fluxnic.net; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1750210765; x=1750217965; bh=OhNFPRsDM5
	3nAN0hWZH1mFzSLl9tnq3SE9PYicDk9Pk=; b=Znq/YFXfQUYKrIEKC7P7n+lWOd
	a+QPVAFtI0JijgCaZxk5PRImqbVNxdjfKQmCfqPXNZjlNbPeqYlo8/k2l53F27+G
	/socNusr/KAD8YsgHjzt8toppoAEc+Pcvf9YWWUFTuY/3VHRcuSYI8of/Rjm6v+U
	qq4mNZjom5Wr/14DXkKF5PZwlPa/MB75nYXj7TiqoCsZoNXPu2nsWy5TEkSVSuJ4
	5YT9A4OUr/P95mN+OeoWUTX//LV7oa4vC1ql9RSjeUQ9NLrtTmljEqTg8s0oQ2r3
	d/EZF5hT91pq0hr8UABL58o3SVqB918z3RvWq8N77RwGWmWt3pSh9cVLgb0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750210765; x=1750217965; bh=OhNFPRsDM53nAN0hWZH1mFzSLl9tnq3SE9P
	YicDk9Pk=; b=hOyptZOjTtn7XcO7Jc4LkmDZrk6Z9T3xR+G5Vijjhhewc84oit8
	SemxNvzB/zYGHlIzScVGuNrDgjlKYKubKCPXs1XaBiAe5C8kFEWzj6wOkAcrgGi6
	VEWYrbNxW0E7Z8WgmjwWqpb9AFfq5lsuQ6tbI6vVS8+8SdmiEumGOOKFPgF80cPY
	QH+FtI9hmcFB8MsKwjIrEnOnBrRcChBKrj4RdzlJtfEY8tyZgWZ+HLOkmChIBgbv
	J0sMg1GF6s29CmQ2tbVCzjraBAD6MZcgL+I9C1qya9ckflt6S1IAOpCvbDaHD68+
	B9l0rbZf4qJHU8rmw+mEdCYWAT6cOfsKrTg==
X-ME-Sender: <xms:zBhSaJFQbGoJ5EJMVxxZ4RSQWEJthMYHkQPjSHI8A9SSG5ZRPFJBbQ>
    <xme:zBhSaOWvIuzmRoNE7yMkVvG_GvKT6_27kr5qXe57-r-2eANkDR8iuL_AKzfTk2rfV
    eyCtdcnY6ZNQIYfX_M>
X-ME-Received: <xmr:zBhSaLL6SGmumy0f8HvbCH4fT7isZQyHzF7UcBXnLS5IIMphdrw9DtltUQk1oTCSvumd4QxFanfRnE9bIJxLpBBaG2vE7dKSYShwQGFISw3xVeq04w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmneetughnkfguqdgfufdqffettdelucdlfedttddmnecujfgurhep
    fffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefpihgtohhlrghsucfrih
    htrhgvuceonhhitghosehflhhugihnihgtrdhnvghtqeenucggtffrrghtthgvrhhnpefg
    vedvhfefueejgefggfefhfelffeiieduvdehffduheduffekkefhgeffhfefveenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihgtohesfhhl
    uhignhhitgdrnhgvthdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepuhdrkhhlvghinhgvqdhkohgvnhhighessggrhihlihgsrhgvrdgtohhm
    pdhrtghpthhtohepsghijhhurdgurghsrdhjiiessghprdhrvghnvghsrghsrdgtohhmpd
    hrtghpthhtohepuggrvhhiugdrlhgrihhghhhtrdhlihhnuhigsehgmhgrihhlrdgtohhm
    pdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoh
    eprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeho
    lhgvghesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlse
    hvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:zBhSaPEVSiLXoDt2U5LJUn4s2TgFzidF8QpOlk2YOrQjVv-CmoH28w>
    <xmx:zBhSaPWhsZ16AqpDRGhzoRRMCVHubPcWcSWjCF3z7jxobGLyOsCHvQ>
    <xmx:zBhSaKOv5gCx6AI9H41yPwcPu_XkDBLGta3tc5l4L8X5KsBselmT4g>
    <xmx:zBhSaO3L5lrNexWlALZKYt-SkvfDfdJ0fxB0oCdTtVF4tHB4G5u5CQ>
    <xmx:zRhSaD5xXpF03V6gDnGP-lFsRxyNLSx8CYNub0Lr9_k_2qpxlqCyZoNR>
Feedback-ID: i58514971:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jun 2025 21:39:23 -0400 (EDT)
Received: from xanadu (xanadu.lan [192.168.1.120])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 66F9C11FA04F;
	Tue, 17 Jun 2025 21:39:23 -0400 (EDT)
Date: Tue, 17 Jun 2025 21:39:23 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: David Laight <david.laight.linux@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 next 06/10] lib: test_mul_u64_u64_div_u64: Test both
 generic and arch versions
In-Reply-To: <q51q92o9-s77q-9431-nss5-03o1258803n0@onlyvoer.pbz>
Message-ID: <85440s3q-n8po-o604-4877-514sq5q3o034@syhkavp.arg>
References: <20250614095346.69130-1-david.laight.linux@gmail.com> <20250614095346.69130-7-david.laight.linux@gmail.com> <q51q92o9-s77q-9431-nss5-03o1258803n0@onlyvoer.pbz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 14 Jun 2025, Nicolas Pitre wrote:

> On Sat, 14 Jun 2025, David Laight wrote:
> 
> > Change the #if in div64.c so that test_mul_u64_u64_div_u64.c
> > can compile and test the generic version (including the 'long multiply')
> > on architectures (eg amd64) that define their own copy.
> > Test the kernel version and the locally compiled version on all arch.
> > Output the time taken (in ns) on the 'test completed' trace.
> > 
> > For reference, on my zen 5, the optimised version takes ~220ns and the
> > generic version ~3350ns.
> > Using the native multiply saves ~200ns and adding back the ilog2() 'optimisation'
> > test adds ~50ms.
> > 
> > Signed-off-by: David Laight <david.laight.linux@gmail.com>
> 
> Reviewed-by: Nicolas Pitre <npitre@baylibre.com>

In fact this doesn't compile on ARM32. The following is needed to fix that:

commit 271a7224634699721b6383ba28f37b23f901319e
Author: Nicolas Pitre <nico@fluxnic.net>
Date:   Tue Jun 17 17:14:05 2025 -0400

    fixup! lib: test_mul_u64_u64_div_u64: Test both generic and arch versions

diff --git a/lib/math/test_mul_u64_u64_div_u64.c b/lib/math/test_mul_u64_u64_div_u64.c
index 88316e68512c..44df9aa39406 100644
--- a/lib/math/test_mul_u64_u64_div_u64.c
+++ b/lib/math/test_mul_u64_u64_div_u64.c
@@ -153,7 +153,10 @@ static void __exit test_exit(void)
 }
 
 /* Compile the generic mul_u64_add_u64_div_u64() code */
+#define __div64_32 __div64_32
+#define div_s64_rem div_s64_rem
 #define div64_u64 div64_u64
+#define div64_u64_rem div64_u64_rem
 #define div64_s64 div64_s64
 #define iter_div_u64_rem iter_div_u64_rem
 
