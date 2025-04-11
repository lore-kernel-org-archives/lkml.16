Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA581DED56
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744356759; cv=none; b=VhPEAo1i21xlfesGzJdOjQJTIvVdI2WNoAKx03Do4FfTApY0ZAbh5E4RSXDUZcdua5QxJAKAWrCRXV1YC2svW3ZEdYQhWHjh12V5iinnS7riuRsT0VRLcMUV1VAdK+7dm6wYX7i2UDhvTuVvgOfnSAIsmbx3SZqpsOOJaN/B65o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744356759; c=relaxed/simple;
	bh=DW9ea9Y61BWgs0I/MZNHS6U6OKgCJ+kdenv2Xznx2ug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cphVQSeRAzYMKU2TXaYUDY95uhl6iCiyfj10Bgq+5+MSVQKfHm8eJWQOd3zKcfaJN+K094Lbf5bNirhjUGk850A3ONYMGL1tTGzePhgCMBQY+o95xeUNfD9Bt8dVuE0HHeJxWmd47sCbmlYZqYXrUrjzTXSNbtQoFutmna/O2GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=btXHBcQv; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=EZdlgi0E; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=btXHBcQv; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=EZdlgi0E; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="btXHBcQv";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="EZdlgi0E";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="btXHBcQv";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="EZdlgi0E"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 081001F453;
	Fri, 11 Apr 2025 07:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744356756; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dOE6AFasUP2dw9RpzhwVHr8ydKiAOCUzpYc4dztswk0=;
	b=btXHBcQvhNRb7gVWoE8dBdxWm87fKT6W/cGudsdmwXSn32GLz9+TkHHrj6I7e80O/mUVQp
	jt0TYvT+ORtYFrakdDswq4Vz3WuJ69Kw0N0p7l0MP265PltApicJvKsdQh7/4Op4tAt7YP
	fO5YSyY259Qcc2lQGHxPS6CXXpV32S0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744356756;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dOE6AFasUP2dw9RpzhwVHr8ydKiAOCUzpYc4dztswk0=;
	b=EZdlgi0E0oAnq3VZqBqrBGuUvXtFd2qi7rrUcs0NhknRjGwI3N8l8CEJgAF4W8a8i4ZQUu
	3pD53TiAo5BLVTDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=btXHBcQv;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=EZdlgi0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744356756; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dOE6AFasUP2dw9RpzhwVHr8ydKiAOCUzpYc4dztswk0=;
	b=btXHBcQvhNRb7gVWoE8dBdxWm87fKT6W/cGudsdmwXSn32GLz9+TkHHrj6I7e80O/mUVQp
	jt0TYvT+ORtYFrakdDswq4Vz3WuJ69Kw0N0p7l0MP265PltApicJvKsdQh7/4Op4tAt7YP
	fO5YSyY259Qcc2lQGHxPS6CXXpV32S0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744356756;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dOE6AFasUP2dw9RpzhwVHr8ydKiAOCUzpYc4dztswk0=;
	b=EZdlgi0E0oAnq3VZqBqrBGuUvXtFd2qi7rrUcs0NhknRjGwI3N8l8CEJgAF4W8a8i4ZQUu
	3pD53TiAo5BLVTDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E301B13886;
	Fri, 11 Apr 2025 07:32:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id S4sJN5PF+GfRAwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Fri, 11 Apr 2025 07:32:35 +0000
Message-ID: <eecb9994-1fdb-4636-9430-9911fd3e28c4@suse.cz>
Date: Fri, 11 Apr 2025 09:32:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] mm: compaction: push watermark into
 compaction_suitable() callers
Content-Language: en-US
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Mel Gorman <mgorman@techsingularity.net>, Zi Yan <ziy@nvidia.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250313210647.1314586-1-hannes@cmpxchg.org>
 <20250313210647.1314586-2-hannes@cmpxchg.org>
 <2025de6c-a25b-42f2-8ff2-da2bad0e0aa0@suse.cz>
 <20250410201718.GA366747@cmpxchg.org>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250410201718.GA366747@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 081001F453
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MID_RHS_MATCH_FROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On 4/10/25 22:17, Johannes Weiner wrote:
> On Thu, Apr 10, 2025 at 05:19:06PM +0200, Vlastimil Babka wrote:
>> On 3/13/25 22:05, Johannes Weiner wrote:
> 
> Ah yes, it would have made sense to point out.
> 
> I was wondering about this check. It was introduced to bail on
> compaction if there are not enough free non-CMA pages. But if there
> are, we still fall through and check the superset of regular + CMA
> pages against the watermarks as well. We know this will succeed, so
> this seems moot.

I guess we didn't want to avoid the fragindex part of compaction_suitable(),
which in theory may not succeed?

> It's also a little odd that compaction_suitable() hardcodes ALLOC_CMA
> with the explanation that "CMA are migration targets", but then this
> check says "actually, it doesn't help us if blocks are formed in CMA".

Hm yes.

> Does it make more sense to plumb alloc_flags to compaction_suitable()?

Possibly.

> There is more head-scratching, though. The check is meant to test
> whether compaction has a chance of forming non-CMA blocks. But free
> pages are targets. You could have plenty of non-contiguous, free
> non-CMA memory - compaction will then form blocks in CMA by moving CMA
> pages into those non-CMA targets.
> 
> The longer I look at this, the more I feel like this just hard-coded
> the very specific scenario the patch author had a problem with: CMA is
> massive. The page allocator fills up regular memory first. Once
> regular memory is full, non-CMA requests stall on compaction making
> CMA blocks. So just bail on compaction then.

Right.

> It's a valid problem, but I don't see how this code makes any general
> sense outside of this exact sequence of events. Especially once
> compaction has moved stuff around between regular and CMA memory, the
> issue will be back, and the check does nothing to prevent it.

Yeah, it seemed to fix a real problem and we both acked it :) but it's not
ideal.

Maybe the true solution (or a step towards it) would be for compaction for
!ALLOC_CMA only use non-CMA pageblocks as migration sources.
IMHO it's just another symptom of the general problem that CMA pageblocks
exist as part of a zone that's not otherwise ZONE_MOVABLE and suddenly the
watermarks have to depend on the allocation type. And of course for the
high-order allocations it doesn't just matter the amount of memory in cma vs
non-cma parts of the zone, but also its contiguity.
