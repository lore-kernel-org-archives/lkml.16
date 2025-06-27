Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD95A2ECD02
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 18:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751049103; cv=none; b=U90azmuOkY8bXckOY5A40geKGBkT9KvYnZM/y4KPFdRXApImELbz2Wejd4HqhsqGmkQGKi9RhFWYKgetlIWq5RbTKwqSGs063hKboEUXj0Ax2jgIjcvl1YwiuWwkQY5qcUKhAVjt+G/v1s6AZw14ZboD/sBPi2A49GUSVu56eCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751049103; c=relaxed/simple;
	bh=AusrS8KkiP0iQzvArLjb8hmDy4OYftr39dfHttN9wHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PrJLp/0tC6SPWnbriVI3NRiU7XyhbQjmD7PYR4GqxhCY5xFLogifawy40n5zAtdL9Qh1zjNLj4+iid8u3ZxUpkDjNAygLiq9eA1xgur98nOcHXQYNeGsCJ9IY4pmogOS52mSXTfgLqaeKqmSyoytQm9ZJ70T5/sqATX4vX4+/3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=N5gP4/Cy; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=G0Li8utu; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=lTrpLGOK; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=q8izR8Oh; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="N5gP4/Cy";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="G0Li8utu";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="lTrpLGOK";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="q8izR8Oh"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2F0B521179;
	Fri, 27 Jun 2025 18:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1751049097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RyhwaPh79BMrE75uWZB91lbgrMRquBRZX78hoQrxYqo=;
	b=N5gP4/Cy/k5IBaRkCdVqYtFJtVuwYQ1vY+jQZQgOZNhqqwp9SemQUWRId2wR4GmMemCBHH
	Dr77KrDXypcU9LKnW7qzNbYEvsjNkmOLnSQGP7qoXwGPfQkQgZpvwshMmS5NhzngdfaTOv
	qoEBeftNef9bycCteiIubeXIoJ3b7dA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1751049097;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RyhwaPh79BMrE75uWZB91lbgrMRquBRZX78hoQrxYqo=;
	b=G0Li8utuNRVOigHgze2hPCkieX7XmSZJ4J8vZl+1RLx9z6JXiBz9yPPLoWHpM/vPyqSR0I
	OMKaZP5YKuL+OyBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1751049096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RyhwaPh79BMrE75uWZB91lbgrMRquBRZX78hoQrxYqo=;
	b=lTrpLGOKRDlFULbQzkj2leVJYCzvO8rqTR8hgMTnrMOGTzZH9kIuoZAyHd9a/IKuw1adXm
	W9MUUjcC/3i6pIRJxuPm3TgARGDbYj1QoervAhA5WipxmB49+6OyA8kMLgnvyQbtS7CvBx
	V/xHczVOycK1qm/r6OeaYJTEWW43XdA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1751049096;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RyhwaPh79BMrE75uWZB91lbgrMRquBRZX78hoQrxYqo=;
	b=q8izR8OhXxcBLxzBc5Z7CfF8sY1u7ZeWPMZdDbfn8xrF9XsBb/8Mcw/nLBWGrKoGTDrlpl
	Pwd9aNTfKxY2PEBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0F3A213786;
	Fri, 27 Jun 2025 18:31:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NF9LA4jjXmj+FAAAD6G6ig
	(envelope-from <jack@suse.cz>); Fri, 27 Jun 2025 18:31:36 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 7C789A08D2; Fri, 27 Jun 2025 20:31:35 +0200 (CEST)
Date: Fri, 27 Jun 2025 20:31:35 +0200
From: Jan Kara <jack@suse.cz>
To: Baokun Li <libaokun1@huawei.com>
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu, jack@suse.cz, 
	adilger.kernel@dilger.ca, ojaswin@linux.ibm.com, linux-kernel@vger.kernel.org, 
	yi.zhang@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH v2 04/16] ext4: utilize multiple global goals to reduce
 contention
Message-ID: <xmhuzjcgujdvmgmnc3mfd45txehmq73fiyg32vr6h7ldznctlq@rosxe25scojb>
References: <20250623073304.3275702-1-libaokun1@huawei.com>
 <20250623073304.3275702-5-libaokun1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250623073304.3275702-5-libaokun1@huawei.com>
X-Spam-Flag: NO
X-Spam-Score: -3.80
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,suse.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Mon 23-06-25 15:32:52, Baokun Li wrote:
> When allocating data blocks, if the first try (goal allocation) fails and
> stream allocation is on, it tries a global goal starting from the last
> group we used (s_mb_last_group). This helps cluster large files together
> to reduce free space fragmentation, and the data block contiguity also
> accelerates write-back to disk.
> 
> However, when multiple processes allocate blocks, having just one global
> goal means they all fight over the same group. This drastically lowers
> the chances of extents merging and leads to much worse file fragmentation.
> 
> To mitigate this multi-process contention, we now employ multiple global
> goals, with the number of goals being the CPU count rounded up to the
> nearest power of 2. To ensure a consistent goal for each inode, we select
> the corresponding goal by taking the inode number modulo the total number
> of goals.
> 
> Performance test data follows:
> 
> Test: Running will-it-scale/fallocate2 on CPU-bound containers.
> Observation: Average fallocate operations per container per second.
> 
>                    | Kunpeng 920 / 512GB -P80|  AMD 9654 / 1536GB -P96 |
>  Disk: 960GB SSD   |-------------------------|-------------------------|
>                    | base  |    patched      | base  |    patched      |
> -------------------|-------|-----------------|-------|-----------------|
> mb_optimize_scan=0 | 7612  | 19699 (+158%)   | 21647 | 53093 (+145%)   |
> mb_optimize_scan=1 | 7568  | 9862  (+30.3%)  | 9117  | 14401 (+57.9%)  |
> 
> Signed-off-by: Baokun Li <libaokun1@huawei.com>

...

> +/*
> + * Number of mb last groups
> + */
> +#ifdef CONFIG_SMP
> +#define MB_LAST_GROUPS roundup_pow_of_two(nr_cpu_ids)
> +#else
> +#define MB_LAST_GROUPS 1
> +#endif
> +

I think this is too aggressive. nr_cpu_ids is easily 4096 or similar for
distribution kernels (it is just a theoretical maximum for the number of
CPUs the kernel can support) which seems like far too much for small
filesystems with say 100 block groups. I'd rather pick the array size like:

min(num_possible_cpus(), sbi->s_groups_count/4)

to

a) don't have too many slots so we still concentrate big allocations in
somewhat limited area of the filesystem (a quarter of block groups here).

b) have at most one slot per CPU the machine hardware can in principle
support.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
