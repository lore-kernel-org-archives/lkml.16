Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78086433A4
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 15:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738597496; cv=none; b=Qr9t3IWzYxcx+l9PzavwTqkjoZJqXHqQmdLR4BpZJIn+uBwBQaOht0pJ6jj8fVcN698U+77lATMQF27zoZ6PfZ9GMFWC1XiI+0LkQ+jR0++iQzvIY64/YdLLS4p5HqYKReVC1+XngSffZK58gDiOzQPOWRGyK2cAJzjl1MOYRvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738597496; c=relaxed/simple;
	bh=nh4Y7ByCUeK4CK2OL1IjDHZ5W27BHqm/ziCONx+3O3g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PyNbck9tNBuAVzZpcq5uKcIVj6OKV5OZizXRjPORzTMIiEqqI5IzstZMKlqSclx5XPCoTaSVyDawmJJZSUgrn9aPzZj7t0dpe/guqB4JHj1/aMAmMb050twUFfD40frDacmWmHXKW9qsZbZAYb8AOXexqXR9MKvlAStkVC+pBEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lQXKuEEO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OTNX7fVm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lQXKuEEO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OTNX7fVm; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lQXKuEEO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OTNX7fVm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lQXKuEEO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OTNX7fVm"
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out2.suse.de (Postfix) with ESMTP id 70C621F381;
	Mon,  3 Feb 2025 15:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738597492; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U38BP1iA2Wv6XLn0cNaO7LCMdtkWZ8Pq3wyAGjQFYwU=;
	b=lQXKuEEODvVX9SAns9BV/mPBaMxhgf2XJNtICeqN6nbpjMBZWo+aEmortLXgnLfK8V8n6G
	AAXDGBsir9tBQlI3RGTKLIzEEZfrutcC7ENYBBxU7t8lcpzxLVKWSOGHnfA5/e5kLn79eY
	OaLO7jEgkZ5C0rbz0CZc0R9Gtrspw18=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738597492;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U38BP1iA2Wv6XLn0cNaO7LCMdtkWZ8Pq3wyAGjQFYwU=;
	b=OTNX7fVmyQbr4QWulI5iJ4zsgek4rKbs7iVUrbJPyVfRMLyd7VAPUfnPozl75k382ddCqt
	VZlaPEkPtpicnbCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738597492; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U38BP1iA2Wv6XLn0cNaO7LCMdtkWZ8Pq3wyAGjQFYwU=;
	b=lQXKuEEODvVX9SAns9BV/mPBaMxhgf2XJNtICeqN6nbpjMBZWo+aEmortLXgnLfK8V8n6G
	AAXDGBsir9tBQlI3RGTKLIzEEZfrutcC7ENYBBxU7t8lcpzxLVKWSOGHnfA5/e5kLn79eY
	OaLO7jEgkZ5C0rbz0CZc0R9Gtrspw18=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738597492;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U38BP1iA2Wv6XLn0cNaO7LCMdtkWZ8Pq3wyAGjQFYwU=;
	b=OTNX7fVmyQbr4QWulI5iJ4zsgek4rKbs7iVUrbJPyVfRMLyd7VAPUfnPozl75k382ddCqt
	VZlaPEkPtpicnbCA==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 6098B4A0551; Mon,  3 Feb 2025 16:44:52 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv/futex: sign extend compare value in atomic cmpxchg
In-Reply-To: <87jza7oxep.fsf@all.your.base.are.belong.to.us>
 (=?utf-8?Q?=22Bj=C3=B6rn_T=C3=B6pel=22's?=
	message of "Mon, 03 Feb 2025 16:33:50 +0100")
References: <mvmfrkv2vhz.fsf@suse.de>
	<87jza7oxep.fsf@all.your.base.are.belong.to.us>
Date: Mon, 03 Feb 2025 16:44:52 +0100
Message-ID: <mvmbjvj2ft7.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.20 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.988];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-Spam-Score: -4.20
X-Spam-Flag: NO

On Feb 03 2025, Björn Töpel wrote:

> Andreas Schwab <schwab@suse.de> writes:
>
>> Make sure the compare value in the lr/sc loop is sign extended to match
>> what lr.w does.  Fortunately, due to the compiler keeping the register
>> contents sign extended anyway the lack of the explicit extension didn't
>> result in wrong code so far, but this cannot be relied upon.
>>
>> Fixes: b90edb33010b ("RISC-V: Add futex support.")
>> Signed-off-by: Andreas Schwab <schwab@suse.de>
>
> Hmm, in this scenario we *can* rely on it, no (inline vs macro)?

No, the issue is that the asm operand (oldval) is u32, but the asm is
using the 64-bit value from the register.  You cannot expect that the
compiler keeps the upper half defined in any way at this point.  That is
different for the operand that is passed in from newval, because sc.w is
only using the low 32-bits from the operand.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
