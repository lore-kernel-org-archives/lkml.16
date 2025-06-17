Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC21B19DF4F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 04:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750134622; cv=none; b=takNNJbkj3iXOjdyYjBqsPmgTkxZEaPluJ369LIvOee3xYAcwrT1VbCb2mJTBF4cuaiDZXsEKsfzy20hkD7wnajqceLljQvmIJORl3AX8PD/oqtrt9gs6OhGBfvdoMz9dm4EWkqL0Ds48iZEPBZiiVOBm9l1nMuTUZ7zw27p+/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750134622; c=relaxed/simple;
	bh=o8qxPnKajbhU26IX6WAYDDREoPcwZlPfwRxx6UmRANM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=l4b09ZtGRzgYhTeu3+oe1BxP7nxTL7n7PBEIxfOQZ+S6D9A1iLpnG24IXEAQJUCauO1ETG1Bklbon0rPCcgt9kSvFPr/W/l4yuGWms6aGF2FBkSVPAvUNqvPjUurgqLMIK5tR+cawCkwskpuSz+19JKyg3UfpXZIWfDn7uS6y6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net; spf=pass smtp.mailfrom=fluxnic.net; dkim=pass (2048-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b=A3YKDrRm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VYqyndU4; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="A3YKDrRm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VYqyndU4"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id D13381380367;
	Tue, 17 Jun 2025 00:30:18 -0400 (EDT)
Received: from phl-frontend-01 ([10.202.2.160])
  by phl-compute-05.internal (MEProxy); Tue, 17 Jun 2025 00:30:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fluxnic.net; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1750134618; x=1750221018; bh=w5FvWlEY7T
	SO1Pxtrp1Df4tPKmB7tpAEPy5nDKprDxM=; b=A3YKDrRmYvAoMNBvXSjGLUkW+F
	9NJnlaA32kLwZ11LT4RYQ3H1Jg1dUVGYG/cWKD66bUNWHIdEjplYinwXUWRUADB+
	LC3UVvzQ/NGLTaTQaXEJWtnD1/eH+dwNHCkgMncw50IHynuJR1iehR/s1aMcq1pM
	7mv1XQn2Pu8YTCC2NBW9VHtnxxHXQORUB6alg0qR6RyKjDcfJfqw98I7KOpUrGm5
	WVuOlpHePlc9OjNoMaXoGwkr5DfTjEmiJZfhqtZlDROObdwWuKhRYgysDitfRTDi
	OtBmyuaVO6Pqufqh0GeGJmKMmQN7V/Ls2TZRwdTxCaUfeBZu1XtHjvVTbdZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750134618; x=1750221018; bh=w5FvWlEY7TSO1Pxtrp1Df4tPKmB7tpAEPy5
	nDKprDxM=; b=VYqyndU4nlywMiIxo4y+kMTD+xchiOV3T4iOrLOhhWW1L321qjF
	f1wmwCEUA+2/HfEEOcsx/XlNj0HJQafVLkmzLqTlLRFAJByTITS+gjbeutaGPskT
	J30DC11gjyrKnow6hkaS3WnumDa/yO7ryn2PhI5sZtz2o2F7mDkrH4L/MXfCybMw
	yCgcuEibSrafNrKjC7JJrg9LpmqGgEUcBwmOcBSHRg11Mq75SO+oAYsFLqGQOwko
	dby4AK7Ob1fD7jr7q4KBYJQzpOv29RV202XyXu76X+0IRS726vd/PgjGXqMQK2g3
	wfWk+vgtdXdT9GB56UpjFLopItXCPvnB3xQ==
X-ME-Sender: <xms:Wu9QaHSHiDY8AyBu2JS1-4uFcZIQbgXBxxdpZO0dgNRv31N4azBnQQ>
    <xme:Wu9QaIwAuqA3ac9b1Xx1JZLyG_CNViEg-H-NDEonIcRHfR826Yz8XLPJE3mnwB4Qi
    3oZwYb6cDTWyotOmyA>
X-ME-Received: <xmr:Wu9QaM1bIGwPFTuwz5fR7RDQQquFmm3t5XOBoMP1zUJE26pqcsXH80v8kPjo5Y8wx5LclUBGfY0drJ6Q9jz2htZJCuf3x9FpKo3SZnRdljEvgPOi6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvkeehudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvden
    ucfhrhhomheppfhitgholhgrshcurfhithhrvgcuoehnihgtohesfhhluhignhhitgdrnh
    gvtheqnecuggftrfgrthhtvghrnhepgfevvdfhfeeujeeggffgfefhleffieeiuddvheff
    udehudffkeekhfegfffhfeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepnhhitghosehflhhugihnihgtrdhnvghtpdhnsggprhgtphhtthho
    peejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehurdhklhgvihhnvgdqkhhovg
    hnihhgsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopegsihhjuhdruggrshdrjhii
    segsphdrrhgvnhgvshgrshdrtghomhdprhgtphhtthhopegurghvihgurdhlrghighhhth
    drlhhinhhugiesghhmrghilhdrtghomhdprhgtphhtthhopehpvghtvghriiesihhnfhhr
    rgguvggrugdrohhrghdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrth
    hiohhnrdhorhhgpdhrtghpthhtohepohhlvghgsehrvgguhhgrthdrtghomhdprhgtphht
    thhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Wu9QaHCwIMi4NIN5AUJx4AXSRlK9eSI-h7GKTlhYs1q3ZayafqD21w>
    <xmx:Wu9QaAiE85eh_TO5HPfO4iJIJBuJOzZ6EhH7jzbmh_vm-bufMMRIWA>
    <xmx:Wu9QaLoDlaMipSWbncDsBCGJRMN-iSkStdpTJ9VFwCXn_b4ROphb4A>
    <xmx:Wu9QaLhD4bUpHiDnA8LCBoCfaqErA_GY907dwR2cz2UQyI1REyzVYg>
    <xmx:Wu9QaLzjI-E3IXhY1AHA1Q_IQOIAVRw6vAd8BjVf6oSdNGl2DZgJ3Pg0>
Feedback-ID: i58514971:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jun 2025 00:30:17 -0400 (EDT)
Received: from xanadu (xanadu.lan [192.168.1.120])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 41C0711F849C;
	Tue, 17 Jun 2025 00:30:17 -0400 (EDT)
Date: Tue, 17 Jun 2025 00:30:17 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: David Laight <david.laight.linux@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 next 05/10] lib: Add tests for
 mul_u64_u64_div_u64_roundup()
In-Reply-To: <20250614095346.69130-6-david.laight.linux@gmail.com>
Message-ID: <q168q017-9p30-69p2-o4o5-s6q1s1385o27@syhkavp.arg>
References: <20250614095346.69130-1-david.laight.linux@gmail.com> <20250614095346.69130-6-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 14 Jun 2025, David Laight wrote:

> Replicate the existing mul_u64_u64_div_u64() test cases with round up.
> Update the shell script that verifies the table, remove the comment
> markers so that it can be directly pasted into a shell.
> 
> Rename the divisor from 'c' to 'd' to match mul_u64_add_u64_div_u64().
> 
> It any tests fail then fail the module load with -EINVAL.
> 
> Signed-off-by: David Laight <david.laight.linux@gmail.com>

I must withdraw my Reviewed-by here.

>  /*
>   * The above table can be verified with the following shell script:
> - *
> - * #!/bin/sh
> - * sed -ne 's/^{ \+\(.*\), \+\(.*\), \+\(.*\), \+\(.*\) },$/\1 \2 \3 \4/p' \
> - *     lib/math/test_mul_u64_u64_div_u64.c |
> - * while read a b c r; do
> - *   expected=$( printf "obase=16; ibase=16; %X * %X / %X\n" $a $b $c | bc )
> - *   given=$( printf "%X\n" $r )
> - *   if [ "$expected" = "$given" ]; then
> - *     echo "$a * $b / $c = $r OK"
> - *   else
> - *     echo "$a * $b / $c = $r is wrong" >&2
> - *     echo "should be equivalent to 0x$expected" >&2
> - *     exit 1
> - *   fi
> - * done
> +
> +#!/bin/sh
> +sed -ne 's/^{ \+\(.*\), \+\(.*\), \+\(.*\), \+\(.*\), \+\(.*\) },$/\1 \2 \3 \4 \5/p' \
> +    lib/math/test_mul_u64_u64_div_u64.c |
> +while read a b d r d; do

This "read a b d r d" is wrong and that breaks the script.


Nicolas
