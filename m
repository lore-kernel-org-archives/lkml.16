Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005BA1D6DA9
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 20:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747513612; cv=none; b=M4NsjmEqZE1/AYI+CWGHuNha7aV5fHtik+ZFpSrxc0YbOm3yDTaGLii2AlrS18S6ALMv9//7aSp6MiqOQi/5EnlncMG4vrv5fDEoCivfww2uHdviS+r+rxHaPXd1VqpgZe3YUwGQV9USyNwMSvIfchz+DbpHpfVay5pVYHoVR/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747513612; c=relaxed/simple;
	bh=p0X6LwKoW3e69iY8pBBEnpCzq5hggRDqdBo+ptTVGsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d4xGnO2tQ84OLV7vgfQksqGTIS37DLe8xpcoa+FHeFt8PuY/XgNS1uNlElrNIEvFCdkGzBbled9HndICfwM2UfiVogtNorVmdEgBvQdHE/lAfhMmqfnfnYt7eQnd8S/LKm9PTCnwCIwJ0BH4CzlqkcTjCSw0ENBXLpkYrQzW288=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=SaSpluhw; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=7ON11TMB; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=SaSpluhw; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=7ON11TMB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="SaSpluhw";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="7ON11TMB";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="SaSpluhw";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="7ON11TMB"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1DD7C1FF3D;
	Sat, 17 May 2025 20:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1747513609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b7smq4DhYL3PFX7EvLtdmf7zKOzcFFiKxJHbWLr3yvs=;
	b=SaSpluhwACduZP7Mhq3dzPnMa63Fm3FHJ9BmO84LrTd6pB98vjtrHnYE9n+fQt/uJHBrDp
	rJtNylSj0qpfruDumOGsI352MdxiMw5xykzlBt5UZN1il5Li9sOVrWf76AmvrpZgLfKijC
	9o4HWz/MGX2HFPqnUuiTlCEpEt9uFVI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1747513609;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b7smq4DhYL3PFX7EvLtdmf7zKOzcFFiKxJHbWLr3yvs=;
	b=7ON11TMBvjTPhsO0NPVvHZaxQtIT84O/MR2wW9OPLXHj5OEj2x/r6lA1ulYlkS0VpoWTo2
	deWlxq9xg3IX/tDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1747513609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b7smq4DhYL3PFX7EvLtdmf7zKOzcFFiKxJHbWLr3yvs=;
	b=SaSpluhwACduZP7Mhq3dzPnMa63Fm3FHJ9BmO84LrTd6pB98vjtrHnYE9n+fQt/uJHBrDp
	rJtNylSj0qpfruDumOGsI352MdxiMw5xykzlBt5UZN1il5Li9sOVrWf76AmvrpZgLfKijC
	9o4HWz/MGX2HFPqnUuiTlCEpEt9uFVI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1747513609;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b7smq4DhYL3PFX7EvLtdmf7zKOzcFFiKxJHbWLr3yvs=;
	b=7ON11TMBvjTPhsO0NPVvHZaxQtIT84O/MR2wW9OPLXHj5OEj2x/r6lA1ulYlkS0VpoWTo2
	deWlxq9xg3IX/tDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F0F9D13991;
	Sat, 17 May 2025 20:26:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MWMVOgjxKGjsfQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Sat, 17 May 2025 20:26:48 +0000
Message-ID: <fed40607-edcd-4338-85ae-7656a374728b@suse.cz>
Date: Sat, 17 May 2025 22:26:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Make MIGRATE_ISOLATE a standalone bit
Content-Language: en-US
To: Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@redhat.com>,
 Oscar Salvador <osalvador@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang
 <richardycc@google.com>, linux-kernel@vger.kernel.org
References: <20250509200111.3372279-1-ziy@nvidia.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250509200111.3372279-1-ziy@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,imap1.dmz-prg2.suse.org:helo]

On 5/9/25 22:01, Zi Yan wrote:
> Hi David and Oscar,
> 
> Can you take a look at Patch 2, which changes how online_pages() set
> online pageblock migratetypes? It used to first set all pageblocks to
> MIGRATE_ISOLATE, then let undo_isolate_page_range() move the pageblocks
> to MIGRATE_MOVABLE. After MIGRATE_ISOLATE becomes a standalone bit, all
> online pageblocks need to have a migratetype other than MIGRATE_ISOLATE.
> Let me know if there is any issue with my changes.
> 
> Hi Johannes,
> 
> Patch 2 now have set_pageblock_migratetype() not accepting
> MIGRATE_ISOLATE. I think it makes code better. Thank you for the great
> feedback.
> 
> Hi all,
> 
> This patchset moves MIGRATE_ISOLATE to a standalone bit to avoid
> being overwritten during pageblock isolation process. Currently,
> MIGRATE_ISOLATE is part of enum migratetype (in include/linux/mmzone.h),
> thus, setting a pageblock to MIGRATE_ISOLATE overwrites its original
> migratetype. This causes pageblock migratetype loss during
> alloc_contig_range() and memory offline, especially when the process
> fails due to a failed pageblock isolation and the code tries to undo the
> finished pageblock isolations.

Seems mostly fine to me, just sent suggestion for 4/4.
I was kinda hoping that MIGRATE_ISOLATE could stop being a migratetype. But
I also see that it's useful for it to be because then it means it has the
freelists in the buddy allocator, can work via __move_freepages_block() etc.
Oh well. So it's still a migratetype, but the pageblock handling is now
different.

