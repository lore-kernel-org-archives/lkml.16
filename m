Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833842040A8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744275113; cv=none; b=rjmJdJPin0JJ91NqeBq+J/e94dMHip9u+mcC28iIr0DRNCXnpeq4z/G5XsJ+ifPirMiFWKSw7tVCBfFsDf1Y6XVj8QzJTZLoAwLvN1vZs8KMwXcAyeD51I7ZilbI1VTvA1y8wp+0i731Ll//uwiGWIqFfaDslKnq9kpF5bImofw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744275113; c=relaxed/simple;
	bh=JNlYT8HfjtWzft0edhKHt+QvGm6Mx2VYHaPkTao2OmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qTLFmWj4dMowLea0fQIliz0kH9UO2QZOV/Syo44R+wEu44hFVKOvlURcuB5h+iB5NcV+/ta64Cu/8PAu9raIArbI278kJaiNpLQSfoAabT1nCksvdh4TCm4vXw9rw4jzQvkQ/i+q035OnIgPY9AQqB3nKKWLA43TilazIWHWoJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=tCyJbGPw; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=Nc0k7Y9W; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=tCyJbGPw; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=Nc0k7Y9W; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="tCyJbGPw";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Nc0k7Y9W";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="tCyJbGPw";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Nc0k7Y9W"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8D37C1F38C;
	Thu, 10 Apr 2025 08:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744275109; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+EAeNUcXZ6Tir+sJZfVXkhzz4zdL/LImPcTbHi0NHl8=;
	b=tCyJbGPw38uAn4ArAK6UuiXmTsHCMM4E/lWbgB8JShi0PwGMztMperTnPpQteuEH7NZyWA
	XSbCfNSCPdej6Beai+0fH1YW/N9yHUqIDV8i1hlXqSzWv+qL8T6s7ftW+nv4xUgwenxC4o
	AbS4gbU2bJW0xYnS70nHo+fyzVaeumk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744275109;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+EAeNUcXZ6Tir+sJZfVXkhzz4zdL/LImPcTbHi0NHl8=;
	b=Nc0k7Y9W+DeVdyouGFMrw0LVSN+2Qse8c0px9dCFFssyR2/TXZ4Bf/k2DMFq/t0N7rBEWP
	TPEHN3FLZmcxznDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744275109; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+EAeNUcXZ6Tir+sJZfVXkhzz4zdL/LImPcTbHi0NHl8=;
	b=tCyJbGPw38uAn4ArAK6UuiXmTsHCMM4E/lWbgB8JShi0PwGMztMperTnPpQteuEH7NZyWA
	XSbCfNSCPdej6Beai+0fH1YW/N9yHUqIDV8i1hlXqSzWv+qL8T6s7ftW+nv4xUgwenxC4o
	AbS4gbU2bJW0xYnS70nHo+fyzVaeumk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744275109;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+EAeNUcXZ6Tir+sJZfVXkhzz4zdL/LImPcTbHi0NHl8=;
	b=Nc0k7Y9W+DeVdyouGFMrw0LVSN+2Qse8c0px9dCFFssyR2/TXZ4Bf/k2DMFq/t0N7rBEWP
	TPEHN3FLZmcxznDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7B50813886;
	Thu, 10 Apr 2025 08:51:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hRnJHaWG92eNDwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Thu, 10 Apr 2025 08:51:49 +0000
Message-ID: <7e638027-7c50-4af8-ab6b-fa0a438098a2@suse.cz>
Date: Thu, 10 Apr 2025 10:51:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm: page_alloc: tighten up find_suitable_fallback()
Content-Language: en-US
To: Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Brendan Jackman <jackmanb@google.com>,
 Mel Gorman <mgorman@techsingularity.net>, Carlos Song <carlos.song@nxp.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250407180154.63348-1-hannes@cmpxchg.org>
 <20250407180154.63348-2-hannes@cmpxchg.org>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250407180154.63348-2-hannes@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,cmpxchg.org:email]
X-Spam-Flag: NO
X-Spam-Level: 

On 4/7/25 20:01, Johannes Weiner wrote:
> find_suitable_fallback() is not as efficient as it could be, and
> somewhat difficult to follow.
> 
> 1. should_try_claim_block() is a loop invariant. There is no point in
>    checking fallback areas if the caller is interested in claimable
>    blocks but the order and the migratetype don't allow for that.
> 
> 2. __rmqueue_steal() doesn't care about claimability, so it shouldn't
>    have to run those tests.
> 
> Different callers want different things from this helper:
> 
> 1. __compact_finished() scans orders up until it finds a claimable block
> 2. __rmqueue_claim() scans orders down as long as blocks are claimable
> 3. __rmqueue_steal() doesn't care about claimability at all
> 
> Move should_try_claim_block() out of the loop. Only test it for the
> two callers who care in the first place. Distinguish "no blocks" from
> "order + mt are not claimable" in the return value; __rmqueue_claim()
> can stop once order becomes unclaimable, __compact_finished() can keep
> advancing until order becomes claimable.
> 
> Before:
> 
>  Performance counter stats for './run case-lru-file-mmap-read' (5 runs):
> 
> 	 85,294.85 msec task-clock                       #    5.644 CPUs utilized               ( +-  0.32% )
> 	    15,968      context-switches                 #  187.209 /sec                        ( +-  3.81% )
> 	       153      cpu-migrations                   #    1.794 /sec                        ( +-  3.29% )
> 	   801,808      page-faults                      #    9.400 K/sec                       ( +-  0.10% )
>    733,358,331,786      instructions                     #    1.87  insn per cycle              ( +-  0.20% )  (64.94%)
>    392,622,904,199      cycles                           #    4.603 GHz                         ( +-  0.31% )  (64.84%)
>    148,563,488,531      branches                         #    1.742 G/sec                       ( +-  0.18% )  (63.86%)
>        152,143,228      branch-misses                    #    0.10% of all branches             ( +-  1.19% )  (62.82%)
> 
> 	   15.1128 +- 0.0637 seconds time elapsed  ( +-  0.42% )
> 
> After:
> 
>  Performance counter stats for './run case-lru-file-mmap-read' (5 runs):
> 
>          84,380.21 msec task-clock                       #    5.664 CPUs utilized               ( +-  0.21% )
>             16,656      context-switches                 #  197.392 /sec                        ( +-  3.27% )
>                151      cpu-migrations                   #    1.790 /sec                        ( +-  3.28% )
>            801,703      page-faults                      #    9.501 K/sec                       ( +-  0.09% )
>    731,914,183,060      instructions                     #    1.88  insn per cycle              ( +-  0.38% )  (64.90%)
>    388,673,535,116      cycles                           #    4.606 GHz                         ( +-  0.24% )  (65.06%)
>    148,251,482,143      branches                         #    1.757 G/sec                       ( +-  0.37% )  (63.92%)
>        149,766,550      branch-misses                    #    0.10% of all branches             ( +-  1.22% )  (62.88%)
> 
>            14.8968 +- 0.0486 seconds time elapsed  ( +-  0.33% )
> 
> Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>

Yay, you found a way to get rid of the ugly "bool claim_only, bool
*claim_block" parameter combo. Great!

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

