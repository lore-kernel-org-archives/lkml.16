Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866BE17A302
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744815278; cv=none; b=HWtwD4He4u3dLXhqSuucquUN8EJfjRrwGNxnpHc9pwafI462MvvcBr82G5ZKhVjAgNgQs9m+nlQ1VY/LTTQcaK25UnxJjV98+bUNTiDKRtXaMaMkRWLhKCDwPMF9rfgOzlH1osOau7STZPQQx5WpjZdXjdYSS1qR201MIhnYTUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744815278; c=relaxed/simple;
	bh=vCptyCDAVHtf52EOuAa9st3SCQSmlSTcb9CfQnIWxEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fiMK5ESUEUs4cK2YO2/Kuko8zFXfcrwzsMKUegRVDs3SsQAdUo3jqVmmAbp5DJv5g1L2MeDK39ugb8Cre3Z6YhZ71S6X1r2ob7RlbDABepdBxkh8xIPDxdNbA6QidI4jwG81LD/uISMKrzcqHgaSqIXXM/uPd/AMcySOrHSefp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=O/JDeFln; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=+uzIFYRv; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=O/JDeFln; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=+uzIFYRv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="O/JDeFln";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="+uzIFYRv";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="O/JDeFln";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="+uzIFYRv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A1A4121179;
	Wed, 16 Apr 2025 14:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744815274; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+aIP5V1iRRBnNMoJiEPZOdI/0V++DQRzOoRFFq+DLbY=;
	b=O/JDeFlnXWIckbVJK8hCA7Vp8CX/6YsITCKBQZFu3xEmiG1521xuG2w+dJFtM/1jma7GUU
	8h4NKChItwqxpOEiC6Qt0H7AIPv0PXl++QM6B839EgRRZXYX5CoRnGo1epFYhPWSkEe2hX
	yYfCGuup3zN+cGTOfa3+yfVZTpdN74Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744815274;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+aIP5V1iRRBnNMoJiEPZOdI/0V++DQRzOoRFFq+DLbY=;
	b=+uzIFYRv3ae4qviVH0oUmHkHbNefa5kuOVE3Bb+v5u6cJbe9xBkXsSqH9ExMreZphMXphR
	qzsC0Fkf9dE3/9AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744815274; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+aIP5V1iRRBnNMoJiEPZOdI/0V++DQRzOoRFFq+DLbY=;
	b=O/JDeFlnXWIckbVJK8hCA7Vp8CX/6YsITCKBQZFu3xEmiG1521xuG2w+dJFtM/1jma7GUU
	8h4NKChItwqxpOEiC6Qt0H7AIPv0PXl++QM6B839EgRRZXYX5CoRnGo1epFYhPWSkEe2hX
	yYfCGuup3zN+cGTOfa3+yfVZTpdN74Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744815274;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+aIP5V1iRRBnNMoJiEPZOdI/0V++DQRzOoRFFq+DLbY=;
	b=+uzIFYRv3ae4qviVH0oUmHkHbNefa5kuOVE3Bb+v5u6cJbe9xBkXsSqH9ExMreZphMXphR
	qzsC0Fkf9dE3/9AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 94C0013976;
	Wed, 16 Apr 2025 14:54:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DicGJKrE/2fhVQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 16 Apr 2025 14:54:34 +0000
Message-ID: <0277450c-c0f0-4aa2-9271-db45d417d827@suse.cz>
Date: Wed, 16 Apr 2025 16:54:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm: vmscan: fix kswapd exit condition in defrag_mode
Content-Language: en-US
To: Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Brendan Jackman <jackmanb@google.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250416135142.778933-1-hannes@cmpxchg.org>
 <20250416135142.778933-3-hannes@cmpxchg.org>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250416135142.778933-3-hannes@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
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
	RCPT_COUNT_FIVE(0.00)[5]
X-Spam-Score: -4.30
X-Spam-Flag: NO

On 4/16/25 15:45, Johannes Weiner wrote:
> Vlastimil points out an issue with kswapd in defrag_mode not waking up
> kcompactd reliably.
> 
> Background: When kswapd is woken for any higher-order request, it
> initially checks those high-order watermarks to decide if work is
> necesary. However, it cannot (efficiently) meet the contiguity goal of
> such a request by itself. So once it has reclaimed a compaction gap,
> it adjusts the request down to check for free order-0 pages, then
> wakes kcompactd to coalesce them into larger blocks.
> 
> In defrag_mode, the initial watermark check needs to be analogously
> against free pageblocks. However, once kswapd drops the high-order to
> hand off contiguity work, it also needs to fall back to base page
> watermarks - otherwise it'll keep reclaiming until blocks are freed.
> 
> While it appears kcompactd is woken up frequently enough to do most of
> the compaction work, kswapd ends up overreclaiming by quite a bit:
> 
>                                                      DEFRAGMODE     DEFRAGMODE-thispatch
> Hugealloc Time mean                       79381.34 (    +0.00%)    88126.12 (   +11.02%)
> Hugealloc Time stddev                     85852.16 (    +0.00%)   135366.75 (   +57.67%)
> Kbuild Real time                            249.35 (    +0.00%)      226.71 (    -9.04%)
> Kbuild User time                           1249.16 (    +0.00%)     1249.37 (    +0.02%)
> Kbuild System time                          171.76 (    +0.00%)      166.93 (    -2.79%)
> THP fault alloc                           51666.87 (    +0.00%)    52685.60 (    +1.97%)
> THP fault fallback                        16970.00 (    +0.00%)    15951.87 (    -6.00%)
> Direct compact fail                         166.53 (    +0.00%)      178.93 (    +7.40%)
> Direct compact success                       17.13 (    +0.00%)        4.13 (   -71.69%)
> Compact daemon scanned migrate          3095413.33 (    +0.00%)  9231239.53 (  +198.22%)
> Compact daemon scanned free             2155966.53 (    +0.00%)  7053692.87 (  +227.17%)
> Compact direct scanned migrate           265642.47 (    +0.00%)    68388.33 (   -74.26%)
> Compact direct scanned free              130252.60 (    +0.00%)    55634.87 (   -57.29%)
> Compact total migrate scanned           3361055.80 (    +0.00%)  9299627.87 (  +176.69%)
> Compact total free scanned              2286219.13 (    +0.00%)  7109327.73 (  +210.96%)
> Alloc stall                                1890.80 (    +0.00%)     6297.60 (  +232.94%)
> Pages kswapd scanned                    9043558.80 (    +0.00%)  5952576.73 (   -34.18%)
> Pages kswapd reclaimed                  1891708.67 (    +0.00%)  1030645.00 (   -45.52%)
> Pages direct scanned                    1017090.60 (    +0.00%)  2688047.60 (  +164.29%)
> Pages direct reclaimed                    92682.60 (    +0.00%)   309770.53 (  +234.22%)
> Pages total scanned                    10060649.40 (    +0.00%)  8640624.33 (   -14.11%)
> Pages total reclaimed                   1984391.27 (    +0.00%)  1340415.53 (   -32.45%)
> Swap out                                 884585.73 (    +0.00%)   417781.93 (   -52.77%)
> Swap in                                  287106.27 (    +0.00%)    95589.73 (   -66.71%)
> File refaults                            551697.60 (    +0.00%)   426474.80 (   -22.70%)
> 
> Reported-by: Vlastimil Babka <vbabka@suse.cz>
> Fixes: a211c6550efc ("mm: page_alloc: defrag_mode kswapd/kcompactd watermarks")
> Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

Thanks!

