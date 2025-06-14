Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31972E11C3
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 15:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749914258; cv=none; b=Nni+f2MwrNBz6tw4loXZgqouvS4LaAeQ0nrW967IboJWLSDynNrX0puxgvDegmSGXd7umxqZtrsRmB1bSYeYb1LncnTsuCNMDutp67dwiYhludFV6lyLAQTEjEGfvIoEu7FTtRdDOIJWq2jNx/JvSCtxTQwgXwfLkFAeyeL5SlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749914258; c=relaxed/simple;
	bh=ItZMvLublJp5wmKFUlnoxW/3aYoOaClrsJbAVQJSCdE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NMzobyEUvtxm7G01C+lEFScEyEYAJEoUOkPdSnsbaQEvrMJH0AOLN+p9ZRf3njsO8rlB95Zj5lGpr6OpiziZFjILHCyb6fiv7cjjkYyghz3ya9UBepahmoup0HCNS97cUGMjqyvsSS3JZsCzqDLo5JyMHggSuXQhqGG7qqw/cuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net; spf=pass smtp.mailfrom=fluxnic.net; dkim=pass (2048-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b=WWrBs7eU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KNSOFy6B; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="WWrBs7eU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KNSOFy6B"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E68421140089;
	Sat, 14 Jun 2025 11:17:34 -0400 (EDT)
Received: from phl-frontend-01 ([10.202.2.160])
  by phl-compute-04.internal (MEProxy); Sat, 14 Jun 2025 11:17:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fluxnic.net; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1749914254; x=1750000654; bh=Xn/hXWPRpB
	w/ZwXw8B/03u6Q3JDllYglccPOST8HPZA=; b=WWrBs7eUbkYYB+kuIGsO/u/8z2
	QmoDvW9+xCqyE1Dq3EDfYgW5lNL9LKW1wqnAoFpfyndv8Hg412wjGK2psizsRxUb
	KfEAGbixAiNjicelCXOgkWqCia+RrfCm9XDvHczjL2jRH2Sh23BFPjE+jX54Mlw7
	DbMY3p2R1tIztVmPBLVjLiHB8TdgwsQHB1ycsIxv+ZkTm2yrtYP0+ITl2tzpe885
	uVVpUgjxvZoy9FfW/RQFCZbT1lUPS1VlW3/yftC5BfeWg1ZvQy0g58bUImuo3U9P
	TtPeK3CoU0PZqRi1q6nMICSSDgC69Jby//O/bG5LXAZXaA5RvddKUcs9GLuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749914254; x=1750000654; bh=Xn/hXWPRpBw/ZwXw8B/03u6Q3JDllYglccP
	OST8HPZA=; b=KNSOFy6B+LxlOCYy6zGOoATZf6ZoueGsLhyLZyCnRju/kwNSuX+
	ZYi7YQpJf7nJOXg/fAcZGs2MDZ95w+AjINvBw0UnqGxOfyNth4Vlld4M58zT0pXc
	CdQjVy6ALR1wwsC9/PLoO7hkrC66fe5uztiUC76t5seufFmvEQ0yECPKYzfohWjf
	316HyeXLKQx1Zy3EdhDOUqrtTJ/FKTud0lsXyvYcwcdVKugPKFSqE7WeKb3ttRer
	L50B2ISNm2FLuN6n61vT54Qvkwe2kfvvZN9A+U44HYUEU73Mgc+jJgQ7Qy7H7WgC
	f2KeZxwU7kj+WhZXG+e2QdQqhFr8XytIt7Q==
X-ME-Sender: <xms:jpJNaO6_exTgegUZv7T55JvNkjQbXbQFCvc62tHAHNnHX1bZMw5Tew>
    <xme:jpJNaH6ofoKxMymDldi6gCaJa14PDfdgG7wQOCVWJfQPrBWZmwvf56AAxYFnWIkx2
    3Y8-o1Ey-Zg10Vx2po>
X-ME-Received: <xmr:jpJNaNdJ1-r_9eN6ih88vqmeem4Y9dVKsGzNdXq2_ZRpiiTiGbPvT6hT__pNl-qWbGcFSQegGYDS8DzP8-DM2J-BpE7wRLwFIpwdEfK6NF88LGOm0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvuddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvden
    ucfhrhhomheppfhitgholhgrshcurfhithhrvgcuoehnihgtohesfhhluhignhhitgdrnh
    gvtheqnecuggftrfgrthhtvghrnhepgfevvdfhfeeujeeggffgfefhleffieeiuddvheff
    udehudffkeekhfegfffhfeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepnhhitghosehflhhugihnihgtrdhnvghtpdhnsggprhgtphhtthho
    peekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehnphhithhrvgessggrhihlih
    gsrhgvrdgtohhmpdhrtghpthhtohepuhdrkhhlvghinhgvqdhkohgvnhhighessggrhihl
    ihgsrhgvrdgtohhmpdhrtghpthhtohepsghijhhurdgurghsrdhjiiessghprdhrvghnvg
    hsrghsrdgtohhmpdhrtghpthhtohepuggrvhhiugdrlhgrihhghhhtrdhlihhnuhigsehg
    mhgrihhlrdgtohhmpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorh
    hgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdp
    rhgtphhtthhopeholhgvghesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugi
    dqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:jpJNaLIGGTNU_qR_2z678wTpWucQL8vdeg00Cps2LZFdBMalhrvT5A>
    <xmx:jpJNaCKKBwLljw5jwkgzE7aRWffJDly8G2dFxp3UEMuj92KsRR_Uxg>
    <xmx:jpJNaMz4jvfmP0FdMXIUp2G8zWGP6ozHX87XSWZKWDAX--NNvS-y2Q>
    <xmx:jpJNaGLIFJLQUHlow3Vm9MwyN67u-Mrcei6gkBlCLHbbfgml5IbX3g>
    <xmx:jpJNaDgfUJTfJpPBSP3dYRY0yNu9ncGE_NhAmZyTHTL6-SJKAMEnXhlM>
Feedback-ID: i58514971:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Jun 2025 11:17:34 -0400 (EDT)
Received: from xanadu (xanadu.lan [192.168.1.120])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 5361811F2DB9;
	Sat, 14 Jun 2025 11:17:33 -0400 (EDT)
Date: Sat, 14 Jun 2025 11:17:33 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: David Laight <david.laight.linux@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>, Nicolas Pitre <npitre@baylibre.com>
Subject: Re: [PATCH v3 next 02/10] lib: mul_u64_u64_div_u64() Use WARN_ONCE()
 for divide errors.
In-Reply-To: <20250614095346.69130-3-david.laight.linux@gmail.com>
Message-ID: <4rp80297-985r-546o-on47-q34rr7po03r7@syhkavp.arg>
References: <20250614095346.69130-1-david.laight.linux@gmail.com> <20250614095346.69130-3-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 14 Jun 2025, David Laight wrote:

> Do an explicit WARN_ONCE(!divisor) instead of hoping the 'undefined
> behaviour' the compiler generates for a compile-time 1/0 is in any
> way useful.
> 
> Return 0 (rather than ~(u64)0) because it is less likely to cause
> further serious issues.

I still disagree with this patch. Whether or not what the compiler 
produces is useful is beside the point. What's important here is to have 
a coherent behavior across all division flavors and what's proposed here 
is not.

Arguably, a compile time 1/0 might not be what we want either. The 
compiler forces an "illegal instruction" exception when what we want is 
a "floating point" exception (strange to have floating point exceptions 
for integer divisions but that's what it is).

So I'd suggest the following instead:

----- >8
From Nicolas Pitre <npitre@baylibre.com>
Subject: [PATCH] mul_u64_u64_div_u64(): improve division-by-zero handling

Forcing 1/0 at compile time makes the compiler (on x86 at least) to emit 
an undefined instruction to trigger the exception. But that's not what 
we want. Modify the code so that an actual runtime div-by-0 exception
is triggered to be coherent with the behavior of all the other division
flavors.

And don't use 1 for the dividend as the compiler would convert the 
actual division into a simple compare.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>

diff --git a/lib/math/div64.c b/lib/math/div64.c
index 5faa29208bdb..e6839b40e271 100644
--- a/lib/math/div64.c
+++ b/lib/math/div64.c
@@ -212,12 +212,12 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
 
 #endif
 
-	/* make sure c is not zero, trigger exception otherwise */
-#pragma GCC diagnostic push
-#pragma GCC diagnostic ignored "-Wdiv-by-zero"
-	if (unlikely(c == 0))
-		return 1/0;
-#pragma GCC diagnostic pop
+	/* make sure c is not zero, trigger runtime exception otherwise */
+	if (unlikely(c == 0)) {
+		unsigned long zero = 0;
+		asm ("" : "+r" (zero)); /* hide actual value from the compiler */
+		return ~0UL/zero;
+	}
 
 	int shift = __builtin_ctzll(c);
 
