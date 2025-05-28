Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72937193077
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748420511; cv=none; b=rRhGg5k9JbcY6F/Bd/GyQmXztHRRcTqL60IxGW4++v5cx7KVBGXrNDg2MA/UhNvvrHNRdua0I+WZCjEGUnP0mn2aYymEh3x4u9adKv99ISTNw1rG5rZnr3LH+YqM6lUPvG/0jN+pRFK6ohsJutspg2ea18nR6lTCIb9jg1mI8U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748420511; c=relaxed/simple;
	bh=y9HRWTnHz4bDZrOtS67J76ayuL+yHdc+H4GH8Oah78U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RXq7NBQKz5YXyag6zBqUVsQaO0v58X84VAZlJZhOYzTW7VqqixwrrrZmgrXxZAz1mgqBYmCp0pCP3TgU4C9d429SlhuFcgdAWsLAZbsffwiPwIQw+g373falXt/Zw33qQ/CTP747nYx2XDCVh1Vg0q2K+YEOmI7aKfWPUa+8RAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=jslYXHOX; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=mNTXITJu; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=jslYXHOX; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=mNTXITJu; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="jslYXHOX";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="mNTXITJu";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="jslYXHOX";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="mNTXITJu"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 61EF41F7C0;
	Wed, 28 May 2025 08:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748420507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xFnLkQ2p2pcScQ0tA9MbXXmlkAvA2ji4vH+ZT6d5yg8=;
	b=jslYXHOXspB/oRJL2Ge6r/Cj9D1aM0v+T+UGh7cjIqUSpsWLSpyku0X7iiOucQX6edT+5q
	Tm8lJkU4nnobseH9CPOdul5PPCcWAnafoA7XMhpfYr7Lk+fXpMgm5uE84s1suSmqr2m0m8
	0OpbZeT3LA8xg0deNpszBDjvl3Sbkos=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748420507;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xFnLkQ2p2pcScQ0tA9MbXXmlkAvA2ji4vH+ZT6d5yg8=;
	b=mNTXITJuMHCTRMHn1OSRRJV8jxOQoHDyOYbaT7R6r2rKRWUY6Sih5V6xpkc4ROxHqOVN4M
	ymPa5ESv77i48LCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=jslYXHOX;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=mNTXITJu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748420507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xFnLkQ2p2pcScQ0tA9MbXXmlkAvA2ji4vH+ZT6d5yg8=;
	b=jslYXHOXspB/oRJL2Ge6r/Cj9D1aM0v+T+UGh7cjIqUSpsWLSpyku0X7iiOucQX6edT+5q
	Tm8lJkU4nnobseH9CPOdul5PPCcWAnafoA7XMhpfYr7Lk+fXpMgm5uE84s1suSmqr2m0m8
	0OpbZeT3LA8xg0deNpszBDjvl3Sbkos=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748420507;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xFnLkQ2p2pcScQ0tA9MbXXmlkAvA2ji4vH+ZT6d5yg8=;
	b=mNTXITJuMHCTRMHn1OSRRJV8jxOQoHDyOYbaT7R6r2rKRWUY6Sih5V6xpkc4ROxHqOVN4M
	ymPa5ESv77i48LCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3E46B136E0;
	Wed, 28 May 2025 08:21:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PC27DpvHNmikVgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 28 May 2025 08:21:47 +0000
Message-ID: <77f9dd55-fc5c-44c8-b7ac-eac68c1d378f@suse.cz>
Date: Wed, 28 May 2025 10:21:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block
 order
Content-Language: en-US
To: Juan Yescas <jyescas@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Cc: tjmercier@google.com, isaacmanjarres@google.com, kaleshsingh@google.com,
 masahiroy@kernel.org, Minchan Kim <minchan@kernel.org>
References: <20250521215807.1860663-1-jyescas@google.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 xsFNBFZdmxYBEADsw/SiUSjB0dM+vSh95UkgcHjzEVBlby/Fg+g42O7LAEkCYXi/vvq31JTB
 KxRWDHX0R2tgpFDXHnzZcQywawu8eSq0LxzxFNYMvtB7sV1pxYwej2qx9B75qW2plBs+7+YB
 87tMFA+u+L4Z5xAzIimfLD5EKC56kJ1CsXlM8S/LHcmdD9Ctkn3trYDNnat0eoAcfPIP2OZ+
 9oe9IF/R28zmh0ifLXyJQQz5ofdj4bPf8ecEW0rhcqHfTD8k4yK0xxt3xW+6Exqp9n9bydiy
 tcSAw/TahjW6yrA+6JhSBv1v2tIm+itQc073zjSX8OFL51qQVzRFr7H2UQG33lw2QrvHRXqD
 Ot7ViKam7v0Ho9wEWiQOOZlHItOOXFphWb2yq3nzrKe45oWoSgkxKb97MVsQ+q2SYjJRBBH4
 8qKhphADYxkIP6yut/eaj9ImvRUZZRi0DTc8xfnvHGTjKbJzC2xpFcY0DQbZzuwsIZ8OPJCc
 LM4S7mT25NE5kUTG/TKQCk922vRdGVMoLA7dIQrgXnRXtyT61sg8PG4wcfOnuWf8577aXP1x
 6mzw3/jh3F+oSBHb/GcLC7mvWreJifUL2gEdssGfXhGWBo6zLS3qhgtwjay0Jl+kza1lo+Cv
 BB2T79D4WGdDuVa4eOrQ02TxqGN7G0Biz5ZLRSFzQSQwLn8fbwARAQABzSBWbGFzdGltaWwg
 QmFia2EgPHZiYWJrYUBzdXNlLmN6PsLBlAQTAQoAPgIbAwULCQgHAwUVCgkICwUWAgMBAAIe
 AQIXgBYhBKlA1DSZLC6OmRA9UCJPp+fMgqZkBQJnyBr8BQka0IFQAAoJECJPp+fMgqZkqmMQ
 AIbGN95ptUMUvo6aAdhxaOCHXp1DfIBuIOK/zpx8ylY4pOwu3GRe4dQ8u4XS9gaZ96Gj4bC+
 jwWcSmn+TjtKW3rH1dRKopvC07tSJIGGVyw7ieV/5cbFffA8NL0ILowzVg8w1ipnz1VTkWDr
 2zcfslxJsJ6vhXw5/npcY0ldeC1E8f6UUoa4eyoskd70vO0wOAoGd02ZkJoox3F5ODM0kjHu
 Y97VLOa3GG66lh+ZEelVZEujHfKceCw9G3PMvEzyLFbXvSOigZQMdKzQ8D/OChwqig8wFBmV
 QCPS4yDdmZP3oeDHRjJ9jvMUKoYODiNKsl2F+xXwyRM2qoKRqFlhCn4usVd1+wmv9iLV8nPs
 2Db1ZIa49fJet3Sk3PN4bV1rAPuWvtbuTBN39Q/6MgkLTYHb84HyFKw14Rqe5YorrBLbF3rl
 M51Dpf6Egu1yTJDHCTEwePWug4XI11FT8lK0LNnHNpbhTCYRjX73iWOnFraJNcURld1jL1nV
 r/LRD+/e2gNtSTPK0Qkon6HcOBZnxRoqtazTU6YQRmGlT0v+rukj/cn5sToYibWLn+RoV1CE
 Qj6tApOiHBkpEsCzHGu+iDQ1WT0Idtdynst738f/uCeCMkdRu4WMZjteQaqvARFwCy3P/jpK
 uvzMtves5HvZw33ZwOtMCgbpce00DaET4y/UzsBNBFsZNTUBCACfQfpSsWJZyi+SHoRdVyX5
 J6rI7okc4+b571a7RXD5UhS9dlVRVVAtrU9ANSLqPTQKGVxHrqD39XSw8hxK61pw8p90pg4G
 /N3iuWEvyt+t0SxDDkClnGsDyRhlUyEWYFEoBrrCizbmahOUwqkJbNMfzj5Y7n7OIJOxNRkB
 IBOjPdF26dMP69BwePQao1M8Acrrex9sAHYjQGyVmReRjVEtv9iG4DoTsnIR3amKVk6si4Ea
 X/mrapJqSCcBUVYUFH8M7bsm4CSxier5ofy8jTEa/CfvkqpKThTMCQPNZKY7hke5qEq1CBk2
 wxhX48ZrJEFf1v3NuV3OimgsF2odzieNABEBAAHCwXwEGAEKACYCGwwWIQSpQNQ0mSwujpkQ
 PVAiT6fnzIKmZAUCZ8gcVAUJFhTonwAKCRAiT6fnzIKmZLY8D/9uo3Ut9yi2YCuASWxr7QQZ
 lJCViArjymbxYB5NdOeC50/0gnhK4pgdHlE2MdwF6o34x7TPFGpjNFvycZqccSQPJ/gibwNA
 zx3q9vJT4Vw+YbiyS53iSBLXMweeVV1Jd9IjAoL+EqB0cbxoFXvnjkvP1foiiF5r73jCd4PR
 rD+GoX5BZ7AZmFYmuJYBm28STM2NA6LhT0X+2su16f/HtummENKcMwom0hNu3MBNPUOrujtW
 khQrWcJNAAsy4yMoJ2Lw51T/5X5Hc7jQ9da9fyqu+phqlVtn70qpPvgWy4HRhr25fCAEXZDp
 xG4RNmTm+pqorHOqhBkI7wA7P/nyPo7ZEc3L+ZkQ37u0nlOyrjbNUniPGxPxv1imVq8IyycG
 AN5FaFxtiELK22gvudghLJaDiRBhn8/AhXc642/Z/yIpizE2xG4KU4AXzb6C+o7LX/WmmsWP
 Ly6jamSg6tvrdo4/e87lUedEqCtrp2o1xpn5zongf6cQkaLZKQcBQnPmgHO5OG8+50u88D9I
 rywqgzTUhHFKKF6/9L/lYtrNcHU8Z6Y4Ju/MLUiNYkmtrGIMnkjKCiRqlRrZE/v5YFHbayRD
 dJKXobXTtCBYpLJM4ZYRpGZXne/FAtWNe4KbNJJqxMvrTOrnIatPj8NhBVI0RSJRsbilh6TE
 m6M14QORSWTLRg==
In-Reply-To: <20250521215807.1860663-1-jyescas@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 61EF41F7C0
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,suse.cz:mid,suse.cz:dkim,suse.cz:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,linux-foundation.org:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Spam-Score: -4.51
X-Spam-Level: 

On 5/21/25 23:57, Juan Yescas wrote:
> Problem: On large page size configurations (16KiB, 64KiB), the CMA
> alignment requirement (CMA_MIN_ALIGNMENT_BYTES) increases considerably,
> and this causes the CMA reservations to be larger than necessary.
> This means that system will have less available MIGRATE_UNMOVABLE and
> MIGRATE_RECLAIMABLE page blocks since MIGRATE_CMA can't fallback to them.
> 
> The CMA_MIN_ALIGNMENT_BYTES increases because it depends on
> MAX_PAGE_ORDER which depends on ARCH_FORCE_MAX_ORDER. The value of
> ARCH_FORCE_MAX_ORDER increases on 16k and 64k kernels.
> 
> For example, in ARM, the CMA alignment requirement when:
> 
> - CONFIG_ARCH_FORCE_MAX_ORDER default value is used
> - CONFIG_TRANSPARENT_HUGEPAGE is set:
> 
> PAGE_SIZE | MAX_PAGE_ORDER | pageblock_order | CMA_MIN_ALIGNMENT_BYTES
> -----------------------------------------------------------------------
>    4KiB   |      10        |       9         |  4KiB * (2 ^  9) =   2MiB
>   16Kib   |      11        |      11         | 16KiB * (2 ^ 11) =  32MiB
>   64KiB   |      13        |      13         | 64KiB * (2 ^ 13) = 512MiB
> 
> There are some extreme cases for the CMA alignment requirement when:
> 
> - CONFIG_ARCH_FORCE_MAX_ORDER maximum value is set
> - CONFIG_TRANSPARENT_HUGEPAGE is NOT set:
> - CONFIG_HUGETLB_PAGE is NOT set
> 
> PAGE_SIZE | MAX_PAGE_ORDER | pageblock_order |  CMA_MIN_ALIGNMENT_BYTES
> ------------------------------------------------------------------------
>    4KiB   |      15        |      15         |  4KiB * (2 ^ 15) = 128MiB
>   16Kib   |      13        |      13         | 16KiB * (2 ^ 13) = 128MiB
>   64KiB   |      13        |      13         | 64KiB * (2 ^ 13) = 512MiB
> 
> This affects the CMA reservations for the drivers. If a driver in a
> 4KiB kernel needs 4MiB of CMA memory, in a 16KiB kernel, the minimal
> reservation has to be 32MiB due to the alignment requirements:
> 
> reserved-memory {
>     ...
>     cma_test_reserve: cma_test_reserve {
>         compatible = "shared-dma-pool";
>         size = <0x0 0x400000>; /* 4 MiB */
>         ...
>     };
> };
> 
> reserved-memory {
>     ...
>     cma_test_reserve: cma_test_reserve {
>         compatible = "shared-dma-pool";
>         size = <0x0 0x2000000>; /* 32 MiB */
>         ...
>     };
> };
> 
> Solution: Add a new config CONFIG_PAGE_BLOCK_ORDER that
> allows to set the page block order in all the architectures.
> The maximum page block order will be given by
> ARCH_FORCE_MAX_ORDER.
> 
> By default, CONFIG_PAGE_BLOCK_ORDER will have the same
> value that ARCH_FORCE_MAX_ORDER. This will make sure that
> current kernel configurations won't be affected by this
> change. It is a opt-in change.
> 
> This patch will allow to have the same CMA alignment
> requirements for large page sizes (16KiB, 64KiB) as that
> in 4kb kernels by setting a lower pageblock_order.
> 
> Tests:
> 
> - Verified that HugeTLB pages work when pageblock_order is 1, 7, 10
> on 4k and 16k kernels.
> 
> - Verified that Transparent Huge Pages work when pageblock_order
> is 1, 7, 10 on 4k and 16k kernels.
> 
> - Verified that dma-buf heaps allocations work when pageblock_order
> is 1, 7, 10 on 4k and 16k kernels.
> 
> Benchmarks:
> 
> The benchmarks compare 16kb kernels with pageblock_order 10 and 7. The
> reason for the pageblock_order 7 is because this value makes the min
> CMA alignment requirement the same as that in 4kb kernels (2MB).
> 
> - Perform 100K dma-buf heaps (/dev/dma_heap/system) allocations of
> SZ_8M, SZ_4M, SZ_2M, SZ_1M, SZ_64, SZ_8, SZ_4. Use simpleperf
> (https://developer.android.com/ndk/guides/simpleperf) to measure
> the # of instructions and page-faults on 16k kernels.
> The benchmark was executed 10 times. The averages are below:
> 
>            # instructions         |     #page-faults
>     order 10     |  order 7       | order 10 | order 7
> --------------------------------------------------------
>  13,891,765,770	 | 11,425,777,314 |    220   |   217
>  14,456,293,487	 | 12,660,819,302 |    224   |   219
>  13,924,261,018	 | 13,243,970,736 |    217   |   221
>  13,910,886,504	 | 13,845,519,630 |    217   |   221
>  14,388,071,190	 | 13,498,583,098 |    223   |   224
>  13,656,442,167	 | 12,915,831,681 |    216   |   218
>  13,300,268,343	 | 12,930,484,776 |    222   |   218
>  13,625,470,223	 | 14,234,092,777 |    219   |   218
>  13,508,964,965	 | 13,432,689,094 |    225   |   219
>  13,368,950,667	 | 13,683,587,37  |    219   |   225
> -------------------------------------------------------------------
>  13,803,137,433  | 13,131,974,268 |    220   |   220    Averages
> 
> There were 4.85% #instructions when order was 7, in comparison
> with order 10.
> 
>      13,803,137,433 - 13,131,974,268 = -671,163,166 (-4.86%)
> 
> The number of page faults in order 7 and 10 were the same.
> 
> These results didn't show any significant regression when the
> pageblock_order is set to 7 on 16kb kernels.
> 
> - Run speedometer 3.1 (https://browserbench.org/Speedometer3.1/) 5 times
>  on the 16k kernels with pageblock_order 7 and 10.
> 
> order 10 | order 7  | order 7 - order 10 | (order 7 - order 10) %
> -------------------------------------------------------------------
>   15.8	 |  16.4    |         0.6        |     3.80%
>   16.4	 |  16.2    |        -0.2        |    -1.22%
>   16.6	 |  16.3    |        -0.3        |    -1.81%
>   16.8	 |  16.3    |        -0.5        |    -2.98%
>   16.6	 |  16.8    |         0.2        |     1.20%
> -------------------------------------------------------------------
>   16.44     16.4            -0.04	          -0.24%   Averages
> 
> The results didn't show any significant regression when the
> pageblock_order is set to 7 on 16kb kernels.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: David Hildenbrand <david@redhat.com>
> CC: Mike Rapoport <rppt@kernel.org>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Minchan Kim <minchan@kernel.org>
> Signed-off-by: Juan Yescas <jyescas@google.com>
> Acked-by: Zi Yan <ziy@nvidia.com>

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

