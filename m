Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF53422173D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 12:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749730443; cv=none; b=Dl1A5TquR29L/Uz37DxhtKOwDVYyRibmanivWIqHDmt7j5a3lFB7fMJP2pkl1Ou2V7ox7w8QXMIAKM1zcTB7uEsbFHOM/K80RBuRBGSHAb+xZqT3XmxDKKqydV0pSCODPNhGuG678Hll54BhtJqqqCsNajaxi3aYmw0EW5nS4A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749730443; c=relaxed/simple;
	bh=EH0s1Pm3IFLOMzDcQLbRoq5Njn1Q4NNObx8IgbEOXA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JxHwYg0b2ZztnBLMOzxyD230u8Hf68zUJ5ClH/ovJDtzOpYv/ZW4dqi7UAJrpuciQmvS9cDV3WAylRhU5+C5ZLOhyoCtO8TdBWAcFHRjAyU3GyMD4R1zpMYx2Qw0DKBwQZ6Ej2xdxoz2X1VxvmUshwx9YSZdsLzQR1FJzB6gSHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GblwlS/J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=e2PTDUO1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=su6Ru5rB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9qaCMp9g; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GblwlS/J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e2PTDUO1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="su6Ru5rB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9qaCMp9g"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0F7652193C;
	Thu, 12 Jun 2025 12:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749730440; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=igqigvRNjdpiGj091yZDoYG9R3yOYk9WpBChKBlsbF4=;
	b=GblwlS/J79a405opJXvwzo1rzQH+49MkVzSn7sFw9crJm8cETsZPAZZvwrwh3M+AT2UiFW
	QKIk6lYRU5T4eJXFk10TkoZVigBlSBBOAWQksCxM56gEVHqYXjlPwQ3X55HB+7UYylteNf
	7bUz0vx7eOjy9BWKLuucb+hRJLJiXo8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749730440;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=igqigvRNjdpiGj091yZDoYG9R3yOYk9WpBChKBlsbF4=;
	b=e2PTDUO1PCpz1eIiyr4KInG7UPyNX/hhW2d926JAC1Cp0HyFVHB2nlYQijy8KIQSwYJRZq
	xp3UMyqp0s8uJ5BA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749730439; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=igqigvRNjdpiGj091yZDoYG9R3yOYk9WpBChKBlsbF4=;
	b=su6Ru5rBuVDe8e8USTus+8/FW0C3mwhw5wEjer9AqQ4YSkApysFX4FdRFN6vscjkfsfvNt
	OcZGajUA6VSiNmchDgVavZPL3oyRbhb1fjIcISddpPKuog0KnoeIrEa/LPMF1LXqHWSwV+
	ksadfgrD5pODxr2LaBD+gGnUIFj/AvU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749730439;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=igqigvRNjdpiGj091yZDoYG9R3yOYk9WpBChKBlsbF4=;
	b=9qaCMp9g+13w4iccW4v1/P5hNJwYu/0yptYO6cNDHn3ohR2QQKY+1+BQP91HE5qElozVpl
	7/J7+jF3q5OYslCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B32F9132D8;
	Thu, 12 Jun 2025 12:13:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nJOpKIXESmhTcgAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Thu, 12 Jun 2025 12:13:57 +0000
Date: Thu, 12 Jun 2025 13:13:52 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, vbabka@suse.cz, jannh@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com, ryan.roberts@arm.com, 
	mingo@kernel.org, libang.li@antgroup.com, maobibo@loongson.cn, 
	zhengqi.arch@bytedance.com, baohua@kernel.org, anshuman.khandual@arm.com, 
	willy@infradead.org, ioworker0@gmail.com, yang@os.amperecomputing.com, 
	baolin.wang@linux.alibaba.com, ziy@nvidia.com, hughd@google.com
Subject: Re: [PATCH v4 2/2] mm: Optimize mremap() by PTE batching
Message-ID: <jnv4n23bydfkn6kz4cpgtkrryfme2zjybp2frc2v734gnn32zj@3oboohu3bqiy>
References: <20250610035043.75448-1-dev.jain@arm.com>
 <20250610035043.75448-3-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610035043.75448-3-dev.jain@arm.com>
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,oracle.com,suse.cz,google.com,kvack.org,vger.kernel.org,redhat.com,arm.com,kernel.org,antgroup.com,loongson.cn,bytedance.com,infradead.org,gmail.com,os.amperecomputing.com,linux.alibaba.com,nvidia.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.80

On Tue, Jun 10, 2025 at 09:20:43AM +0530, Dev Jain wrote:
> Use folio_pte_batch() to optimize move_ptes(). On arm64, if the ptes
> are painted with the contig bit, then ptep_get() will iterate through all 16
> entries to collect a/d bits. Hence this optimization will result in a 16x
> reduction in the number of ptep_get() calls. Next, ptep_get_and_clear()
> will eventually call contpte_try_unfold() on every contig block, thus
> flushing the TLB for the complete large folio range. Instead, use
> get_and_clear_full_ptes() so as to elide TLBIs on each contig block, and only
> do them on the starting and ending contig block.
> 
> For split folios, there will be no pte batching; nr_ptes will be 1. For
> pagetable splitting, the ptes will still point to the same large folio;
> for arm64, this results in the optimization described above, and for other
> arches (including the general case), a minor improvement is expected due to
> a reduction in the number of function calls.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>

Reviewed-by: Pedro Falcato <pfalcato@suse.de>

-- 
Pedro
