Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAF6158524
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743610016; cv=none; b=RWdOsFPWlC2OXx2kNErivMmMp6CtvP+TBX8o0BgMQFin5tJYj2Qg+ZHUYFo2cYXhaWy4Xq+n4g/5ar09mX7sD4ouTKnavcAmkXyqX4KC5Rt54tbRQA6Gw3pbcXkfG4+WHNHDuN7enf3q3EiY5NcgmKgWDYb+G4QkSCgoMO6fXPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743610016; c=relaxed/simple;
	bh=DNKbWC8NyM3pn4l2DB7HVuTwaM86CErRabFgu+DHeBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Umd2d4yOImV0XhRe25+y/gjshHMX6RAqvMAl23XISLxOIxidCG2+sU5wEArFao9a8Y18Z2BpmnzboX/qxu3YEwbXirACnLjX33wYLohMX++i8qj8SWQiNbASrXRjltaNnQWUXDrzZZl91dX0jqBuNpCmkZnRDt95JX4KBdzabYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=ihK1lgdN; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=VQmEhNFu; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=ihK1lgdN; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=VQmEhNFu; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="ihK1lgdN";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="VQmEhNFu";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="ihK1lgdN";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="VQmEhNFu"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5FDF31F38A;
	Wed,  2 Apr 2025 16:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1743610012; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FTmL57kmDGPHrWxHn7Y0/jU2ldGmqDN2KOEd87ly/+g=;
	b=ihK1lgdNSbaGAsdx8eEofyZ/wkCP7m00DqHtDaDYKzD2vUjlU9Cjz8N0q73p5QcfolaLbm
	dbsWPbgp6NO/Tw4KBK44eBVN5ZeQcIR29vDCcUJn8ufacd0nmg+MsZyz731OZk65VQTJJH
	SOzsTEYwh4yD24I/ghCc6lbBUM19AJA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1743610012;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FTmL57kmDGPHrWxHn7Y0/jU2ldGmqDN2KOEd87ly/+g=;
	b=VQmEhNFuBb5K/rReOBQWMPr0g0W2jC6Hg6tDAAWrixHxeaCiUNs7xqICESoUyygxvT1cdd
	/hJz3VWK7wBRB3Cg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=ihK1lgdN;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=VQmEhNFu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1743610012; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FTmL57kmDGPHrWxHn7Y0/jU2ldGmqDN2KOEd87ly/+g=;
	b=ihK1lgdNSbaGAsdx8eEofyZ/wkCP7m00DqHtDaDYKzD2vUjlU9Cjz8N0q73p5QcfolaLbm
	dbsWPbgp6NO/Tw4KBK44eBVN5ZeQcIR29vDCcUJn8ufacd0nmg+MsZyz731OZk65VQTJJH
	SOzsTEYwh4yD24I/ghCc6lbBUM19AJA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1743610012;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FTmL57kmDGPHrWxHn7Y0/jU2ldGmqDN2KOEd87ly/+g=;
	b=VQmEhNFuBb5K/rReOBQWMPr0g0W2jC6Hg6tDAAWrixHxeaCiUNs7xqICESoUyygxvT1cdd
	/hJz3VWK7wBRB3Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 48F2A13A4B;
	Wed,  2 Apr 2025 16:06:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eX99EZxg7Wf9TQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 02 Apr 2025 16:06:52 +0000
Message-ID: <78c976ba-1eaf-47b7-a310-b8a99a3882e2@suse.cz>
Date: Wed, 2 Apr 2025 18:06:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Implement numa node notifier
Content-Language: en-US
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 mkoutny@suse.com, Dan Williams <dan.j.williams@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20250401092716.537512-1-osalvador@suse.de>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250401092716.537512-1-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 5FDF31F38A
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,kvack.org,vger.kernel.org,gmail.com,suse.com,intel.com,huawei.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

On 4/1/25 11:27, Oscar Salvador wrote:
> Memory notifier is a tool that allow consumers to get notified whenever
> memory gets onlined or offlined in the system.
> Currently, there are 10 consumers of that, but 5 out of those 10 consumers
> are only interested in getting notifications when a numa node has changed its
> state.
> That means going from memoryless to memory-aware of vice versa.
> 
> Which means that for every {online,offline}_pages operation they get
> notified even though the numa node might not have changed its state.
> 
> The first patch implements a numa node notifier that does just that, and have
> those consumers register in there, so they get notified only when they are
> interested.

What if we had two chains:

register_node_notifier()
register_node_normal_notifier()

I think they could have shared the state #defines and struct node_notify
would have just one nid and be always >= 0.

Or would it add too much extra boilerplate and only slab cares?

> The second patch replaces 'status_change_normal{_normal}' fields within
> memory_notify with a 'nid', as that is only what we need for memory
> notifer and update the only user of it (page_ext).
> 
> Consumers that are only interested in numa node states change are:
> 
>  - memory-tier
>  - slub
>  - cpuset
>  - hmat
>  - cxl
> 
> 
> Oscar Salvador (2):
>   mm,memory_hotplug: Implement numa node notifier
>   mm,memory_hotplug: Replace status_change_nid parameter in
>     memory_notify
> 
>  drivers/acpi/numa/hmat.c  |  6 +--
>  drivers/base/node.c       | 19 +++++++++
>  drivers/cxl/core/region.c | 14 +++----
>  drivers/cxl/cxl.h         |  4 +-
>  include/linux/memory.h    | 37 ++++++++++++++++++
>  kernel/cgroup/cpuset.c    |  2 +-
>  mm/memory-tiers.c         |  8 ++--
>  mm/memory_hotplug.c       | 82 +++++++++++++++++++++++++++++----------
>  mm/page_ext.c             | 12 +-----
>  mm/slub.c                 | 22 +++++------
>  10 files changed, 146 insertions(+), 60 deletions(-)
> 

