Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D72914A639
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739178922; cv=none; b=sn5Bw9iWVSv1RBeRIk598hKRWLRqqavZ/qO3bkarz0VWrUKlfHeE2U9eXRo89fgLA6ptcNW3tbCKTywss6MS1l/796GYt2kDpWEaVfBG5FhfMx/vrr24d8RFfUhXvpYR6Rju3oK4oYWWMlIT6oDqTD0ur9VgluN6eWXNGfHrbpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739178922; c=relaxed/simple;
	bh=JxkRRn1Tb7RxWlesprTYooAFE4qUoDqS20xhZ92EttI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jQtd6OP91RaebNRmVzUJ5Rz7J9Z5CnrfR8GfYEHi2IPxlCawYugPNN78FD/nCYzFX4TotICc2i1R7Lroj319n+0bIjzai3QxTN6Y4Smj1OD2rQvfqvDEoKPpaPBiXJMA6429Pwhz+xOYb8oBcda7gaoOli/RUkDtB3ZiukU6yyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KMazZUZN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FOCRfSHf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KMazZUZN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FOCRfSHf; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KMazZUZN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FOCRfSHf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KMazZUZN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FOCRfSHf"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BD1581F37E;
	Mon, 10 Feb 2025 09:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739178917; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NT6Y3qhRyAsyFJFpCq4OSd5s89jdYk1Kn+n0Tiyzstk=;
	b=KMazZUZN7HSxDbhwbrEaucHWQ2L5akigIUdGTXqXKFrs3M1DAOw07L1LKKfy/FA+9mJUIf
	ZP/Xgu+mZjxhex/lFLkiyJfXWIuzPW5hHjtxjixzbIfy26Yhe8ys0DSrPZSU33cQq4bIyN
	YF1oWbqu5z62lXEgYbwEPe3Kh4W3Q8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739178917;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NT6Y3qhRyAsyFJFpCq4OSd5s89jdYk1Kn+n0Tiyzstk=;
	b=FOCRfSHfSOVWf/2dCM3dw6Xd7xrFVZb8XEl56VGhAsc3CC8m3l7YknJwK4sbFBvvDqgrHw
	HSFPk3n6HixjMvAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739178917; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NT6Y3qhRyAsyFJFpCq4OSd5s89jdYk1Kn+n0Tiyzstk=;
	b=KMazZUZN7HSxDbhwbrEaucHWQ2L5akigIUdGTXqXKFrs3M1DAOw07L1LKKfy/FA+9mJUIf
	ZP/Xgu+mZjxhex/lFLkiyJfXWIuzPW5hHjtxjixzbIfy26Yhe8ys0DSrPZSU33cQq4bIyN
	YF1oWbqu5z62lXEgYbwEPe3Kh4W3Q8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739178917;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NT6Y3qhRyAsyFJFpCq4OSd5s89jdYk1Kn+n0Tiyzstk=;
	b=FOCRfSHfSOVWf/2dCM3dw6Xd7xrFVZb8XEl56VGhAsc3CC8m3l7YknJwK4sbFBvvDqgrHw
	HSFPk3n6HixjMvAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3CD1013A62;
	Mon, 10 Feb 2025 09:15:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SvIWDKXDqWclMgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 10 Feb 2025 09:15:17 +0000
Date: Mon, 10 Feb 2025 10:15:07 +0100
From: Oscar Salvador <osalvador@suse.de>
To: yangge1116@126.com
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, 21cnbao@gmail.com, david@redhat.com,
	baolin.wang@linux.alibaba.com, aisheng.dong@nxp.com,
	liuzixing@hygon.cn
Subject: Re: [PATCH V2] mm/cma: using per-CMA locks to improve concurrent
 allocation performance
Message-ID: <Z6nDmznSoFNDlsvU@localhost.localdomain>
References: <1739152566-744-1-git-send-email-yangge1116@126.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1739152566-744-1-git-send-email-yangge1116@126.com>
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,kvack.org,vger.kernel.org,gmail.com,redhat.com,linux.alibaba.com,nxp.com,hygon.cn];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[126.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[126.com,gmail.com];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, Feb 10, 2025 at 09:56:06AM +0800, yangge1116@126.com wrote:
> From: yangge <yangge1116@126.com>
> 
> For different CMAs, concurrent allocation of CMA memory ideally should not
> require synchronization using locks. Currently, a global cma_mutex lock is
> employed to synchronize all CMA allocations, which can impact the
> performance of concurrent allocations across different CMAs.
> 
> To test the performance impact, follow these steps:
> 1. Boot the kernel with the command line argument hugetlb_cma=30G to
>    allocate a 30GB CMA area specifically for huge page allocations. (note:
>    on my machine, which has 3 nodes, each node is initialized with 10G of
>    CMA)
> 2. Use the dd command with parameters if=/dev/zero of=/dev/shm/file bs=1G
>    count=30 to fully utilize the CMA area by writing zeroes to a file in
>    /dev/shm.
> 3. Open three terminals and execute the following commands simultaneously:
>    (Note: Each of these commands attempts to allocate 10GB [2621440 * 4KB
>    pages] of CMA memory.)
>    On Terminal 1: time echo 2621440 > /sys/kernel/debug/cma/hugetlb1/alloc
>    On Terminal 2: time echo 2621440 > /sys/kernel/debug/cma/hugetlb2/alloc
>    On Terminal 3: time echo 2621440 > /sys/kernel/debug/cma/hugetlb3/alloc
> 
> We attempt to allocate pages through the CMA debug interface and use the
> time command to measure the duration of each allocation.
> Performance comparison:
>              Without this patch      With this patch
> Terminal1        ~7s                     ~7s
> Terminal2       ~14s                     ~8s
> Terminal3       ~21s                     ~7s
> 
> To slove problem above, we could use per-CMA locks to improve concurrent
> allocation performance. This would allow each CMA to be managed
> independently, reducing the need for a global lock and thus improving
> scalability and performance.
> 
> Signed-off-by: yangge <yangge1116@126.com>

Reviewed-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs
