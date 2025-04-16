Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70291EFFB4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744815239; cv=none; b=GvTzrXqVGZUUNPA2GqKMaabi4wmNRRrNq+Lz7pBzDT/SpOTlYD2w9m98+7E44pkZ6JK5wGZj8TurUdh5sTILVVm/p59Hmu9nh4Gy9cRf568eanolty6OOJm7L1V1jIOZsdN1+kdTaRO/ECATLGwD5+uj9m2IpWVeUaiTh89DnJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744815239; c=relaxed/simple;
	bh=2HLPaON0jUs7Pe4d4sOEDY7JVP7LdKYS3apTzXG7u+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W2bUygmfnv3TRDPHV7wybnb7jushUJxDlL9G+2P1drHrkPH2Cpy7uUksixECEFcoOxBWCsOLVUNKsWcQNnAWlFxrExU7DmVb5G9wxzrvx56iQC6FRsE0xh6n/SEiRAhjXUJH2z/zBbloEMT/ko0lQ+DUgXFqTUaqLY8MI3MDXKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=mLDHyHOA; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=36EYFSdW; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=sskh7Uax; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=M76MfYdE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="mLDHyHOA";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="36EYFSdW";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="sskh7Uax";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="M76MfYdE"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E10AE21184;
	Wed, 16 Apr 2025 14:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744815236; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YkgtQ+UWIbfCZnWoGZ6JgnphjyVNxz8iN4SOVzgTZFE=;
	b=mLDHyHOA02XoeRDv7orOfwnWt88ZO1StLQmXSvGnWxL9gDE/8VJ8D5NVnI+KctV1Jn6rrX
	GxZLHwc40muTbDlwW0nP8jQKYmrXecuv84urpZ/ShkkleE+ZxLZtwbqBv5J/GC8jXnJ3cc
	eyrFiZDqo5wtJVKVx0RhRPmQUQkTPw4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744815236;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YkgtQ+UWIbfCZnWoGZ6JgnphjyVNxz8iN4SOVzgTZFE=;
	b=36EYFSdWakGluSIT6lBAAewxH893XIgtKEHaDivnL5XmIKl7cqsXQUpOTRErhFJ2omySpJ
	/PljNxP8a3DejrDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=sskh7Uax;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=M76MfYdE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744815235; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YkgtQ+UWIbfCZnWoGZ6JgnphjyVNxz8iN4SOVzgTZFE=;
	b=sskh7UaxDvdKcUVeXYdZCbgSwmNCHM7fENy1DuT6JKUrUDFz5Uf1WIW4SPjp7siCMBbHFL
	oZTfNqWHn/ZzcvR8nSWo2AqHsrqjaq1q71/6eLVnDe2ujgGTuJK0v2oQ8tT7zgkw0NAUu2
	aun2RPz5J8t1c6QunXOt4o1oaMwd7mM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744815235;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YkgtQ+UWIbfCZnWoGZ6JgnphjyVNxz8iN4SOVzgTZFE=;
	b=M76MfYdEo9Bmzw/mtzHRkBohJA6vW2j7W0gcin0vcm7Dd62pnG6tw9WVw3l+bsPmTqJTJm
	xC9QMG8YOn4KSSBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D33DA13976;
	Wed, 16 Apr 2025 14:53:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0xdBM4PE/2e9VQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 16 Apr 2025 14:53:55 +0000
Message-ID: <e754fdc5-de73-477e-a78d-b0fa9ce730f7@suse.cz>
Date: Wed, 16 Apr 2025 16:53:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm: vmscan: restore high-cpu watermark safety in
 kswapd
Content-Language: en-US
To: Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Brendan Jackman <jackmanb@google.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250416135142.778933-1-hannes@cmpxchg.org>
 <20250416135142.778933-2-hannes@cmpxchg.org>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250416135142.778933-2-hannes@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E10AE21184
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On 4/16/25 15:45, Johannes Weiner wrote:
> Vlastimil points out that commit a211c6550efc ("mm: page_alloc:
> defrag_mode kswapd/kcompactd watermarks") switched kswapd from
> zone_watermark_ok_safe() to the standard, percpu-cached version of
> reading free pages, thus dropping the watermark safety precautions for
> systems with high CPU counts (e.g. >212 cpus on 64G). Restore them.
> 
> Since zone_watermark_ok_safe() is no longer the right interface, and
> this was the last caller of the function anyway, open-code the
> zone_page_state_snapshot() conditional and delete the function.
> 
> Reported-by: Vlastimil Babka <vbabka@suse.cz>
> Fixes: a211c6550efc ("mm: page_alloc: defrag_mode kswapd/kcompactd watermarks")
> Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>


