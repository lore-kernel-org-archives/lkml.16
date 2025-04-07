Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DDA2288D6
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744014314; cv=none; b=OIqKXyAHXbF4jGwPg8GiiH/Or2CkaLiy38P2YxXpNBhPlQ5dIbN4b001UDTFoiB2OZVuqY/kAR0wTHcR+1TxaRqCqgfNqzQf9+rgunam+2KIEbvu5T/714QWvIc91b6yGbmiDphOg7BCZRUI9LamP+M4cWSB9sHfzi9XDVLbJPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744014314; c=relaxed/simple;
	bh=/hIMl4+mLhpPLboiB20WfdNYrJJ6PlLDES0zxElaMkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZDSWnGPqsCgCW0txDyJn0/EQgJqioqW+OYLkhk5KgsoN/R+wZ5DqSEPzWst6c9DZEmnBfcKDt+GyBfKvZHheYumIEbuGAY75TjjGmyDnBP6sxmjRCoN1g/3SlNZXK22b1iUZYU2pvdtQtKjzGfvSyDV6daFn17hG8xH2G9u475M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=K4Hf+WXL; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=WDg7p30+; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=K4Hf+WXL; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=WDg7p30+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="K4Hf+WXL";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="WDg7p30+";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="K4Hf+WXL";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="WDg7p30+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B055321180;
	Mon,  7 Apr 2025 08:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744014310; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eucjGI5L+fAJv1gXj894Li5EaWdn6CCCGtiawNIWpJo=;
	b=K4Hf+WXLAkSXhS3yV9Pl6bV1pHvueah2bMNJmiB3TCjJMbqAiVX6UYrjWWKt9xPZb4LYVF
	+1saiOFi6faeC2L4mYaf3DPGJ3i8w0nrVIm/qLRBTYYQWpSCAR9p89olQHcyTKaDVcmUR7
	8GhtrSj84S8wCJ3NWhW137AQaNkPNBk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744014310;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eucjGI5L+fAJv1gXj894Li5EaWdn6CCCGtiawNIWpJo=;
	b=WDg7p30+DJ6D+/ia4v+fLmfTzseJcRF7kqPsm9SLc2WjPA3uIbrPMCOvDQpOBVfdR6RMey
	gQmxpBABj7+xBJAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744014310; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eucjGI5L+fAJv1gXj894Li5EaWdn6CCCGtiawNIWpJo=;
	b=K4Hf+WXLAkSXhS3yV9Pl6bV1pHvueah2bMNJmiB3TCjJMbqAiVX6UYrjWWKt9xPZb4LYVF
	+1saiOFi6faeC2L4mYaf3DPGJ3i8w0nrVIm/qLRBTYYQWpSCAR9p89olQHcyTKaDVcmUR7
	8GhtrSj84S8wCJ3NWhW137AQaNkPNBk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744014310;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eucjGI5L+fAJv1gXj894Li5EaWdn6CCCGtiawNIWpJo=;
	b=WDg7p30+DJ6D+/ia4v+fLmfTzseJcRF7kqPsm9SLc2WjPA3uIbrPMCOvDQpOBVfdR6RMey
	gQmxpBABj7+xBJAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9922813691;
	Mon,  7 Apr 2025 08:25:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9fANJeaL82cdLAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 07 Apr 2025 08:25:10 +0000
Message-ID: <35a061e5-d6c6-43e8-87d3-2edf1d9a517d@suse.cz>
Date: Mon, 7 Apr 2025 10:25:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] slub_kunit: Add missing MODULE_DESCRIPTION() to fix
 modpost warning
Content-Language: en-US
To: Shivank Garg <shivankg@amd.com>, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc: kent.overstreet@linux.dev, kuba@kernel.org, harry.yoo@oracle.com,
 kees@kernel.org, Arnd Bergmann <arnd@arndb.de>
References: <20250407072153.871265-1-shivankg@amd.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250407072153.871265-1-shivankg@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Flag: NO

On 4/7/25 09:21, Shivank Garg wrote:
> Fix a modpost warning due to the missing MODULE_DESCRIPTION() macro in
> slub_kunit.c:
> 
>   WARNING: modpost: missing MODULE_DESCRIPTION() in lib/tests/slub_kunit.o
> 
> Signed-off-by: Shivank Garg <shivankg@amd.com>

Hi, AFAICS Arnd's fixes [1] for this and other modules is in -mm already.

[1]
https://lore.kernel.org/all/20250324173242.1501003-10-arnd@kernel.org/T/#m265ef1255bed7e2ab47fbcf2242a2d98d4875417

> ---
>  lib/tests/slub_kunit.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/lib/tests/slub_kunit.c b/lib/tests/slub_kunit.c
> index d47c472b0520..f1bc30be6503 100644
> --- a/lib/tests/slub_kunit.c
> +++ b/lib/tests/slub_kunit.c
> @@ -323,6 +323,8 @@ static struct kunit_suite test_suite = {
>  	.init = test_init,
>  	.test_cases = test_cases,
>  };
> +
>  kunit_test_suite(test_suite);
>  
> +MODULE_DESCRIPTION("KUnit tests for SLUB allocator");
>  MODULE_LICENSE("GPL");

