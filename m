Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5B37DA82
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 07:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747035530; cv=none; b=jInLuHvuFl4S/RjCTaWQwGM1VhgiX4wJxKo3IEfNlT2FEGGgs7p0+WCw6ZdSJVzqui2qvGZ7GqMgyqyRZxNbW3R6AIzT+K7+uGVv5vsypDytVJODkjtYhwBLlCp7PPBWJ5u3nhRlXmXuB05udQMtrx3zbR1Cp3C1xpZL+HfnBuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747035530; c=relaxed/simple;
	bh=Hcqrrn4iivC6AZRQs/SDe5WoEbqHddmWG6LWmF1Zxxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fDJhFU4zJ6lLch8iik2Sna0/X0ri6EJhaURgp2S1DPumCxO3RhVDC3xC0Kf916U+fgilFFm7IZNhWMOvVs442aQ0zqrfQTwLAqX5bBztt6o04sql5FVWtGvtxWDiNmJeP8aTZyqV5+whrsSxSEZvtupo/HYHrBIii44jXDSTMyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=i3g+Jbs0; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=omWygHk3; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=i3g+Jbs0; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=omWygHk3; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="i3g+Jbs0";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="omWygHk3";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="i3g+Jbs0";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="omWygHk3"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7C2281F745;
	Mon, 12 May 2025 07:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1747035526; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JoDpL4KkrG8kp8IAvPXB0yhKZ6iYox4XDgz1pC3w6iw=;
	b=i3g+Jbs0Y2Ntf1HTmop2kulYMHKojsVuNEnKx0M/v8T7bGYIG3UetdRoUv0BYxJVMkLJx0
	S4bdsmj+xi89vnfAvRR9iVCX0Gg79Dc89rFp+bEvkEJvO/D2J0FKntsQwy7aIpWZBePQNM
	lIiiAwhUp1UsjzmOTGvvilL0DHFjm4Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1747035526;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JoDpL4KkrG8kp8IAvPXB0yhKZ6iYox4XDgz1pC3w6iw=;
	b=omWygHk3zQGay5K940aMeKxzOMQHMvUp6X+K9x+koZu7VJBFC/qq5G2wlZm2lANPL4xuzU
	6O6AI0kj1EtoXvDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1747035526; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JoDpL4KkrG8kp8IAvPXB0yhKZ6iYox4XDgz1pC3w6iw=;
	b=i3g+Jbs0Y2Ntf1HTmop2kulYMHKojsVuNEnKx0M/v8T7bGYIG3UetdRoUv0BYxJVMkLJx0
	S4bdsmj+xi89vnfAvRR9iVCX0Gg79Dc89rFp+bEvkEJvO/D2J0FKntsQwy7aIpWZBePQNM
	lIiiAwhUp1UsjzmOTGvvilL0DHFjm4Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1747035526;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JoDpL4KkrG8kp8IAvPXB0yhKZ6iYox4XDgz1pC3w6iw=;
	b=omWygHk3zQGay5K940aMeKxzOMQHMvUp6X+K9x+koZu7VJBFC/qq5G2wlZm2lANPL4xuzU
	6O6AI0kj1EtoXvDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 52D66137D2;
	Mon, 12 May 2025 07:38:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wMBCEoalIWiiDgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 12 May 2025 07:38:46 +0000
Message-ID: <eb2b0bce-6012-4019-8ff7-c35c24ba7aa1@suse.cz>
Date: Mon, 12 May 2025 09:38:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add mm GUP section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>
Cc: Uladzislau Rezki <urezki@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250506173601.97562-1-lorenzo.stoakes@oracle.com>
 <20250506162113.f8fa0c00e76722a1789ec56a@linux-foundation.org>
 <c4258dfd-14ee-411a-9fa7-c4a1fa4fad1c@redhat.com> <aBshiBX_N6hhExmS@pc636>
 <13a32f52-dc5c-45ef-b45a-585586868509@lucifer.local>
 <e3e2663b-2749-44c7-8452-ffcbf2167572@redhat.com>
 <28428030-1178-469a-a4ab-f1e7179d9106@lucifer.local>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <28428030-1178-469a-a4ab-f1e7179d9106@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux-foundation.org,nvidia.com,redhat.com,kvack.org,vger.kernel.org];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid]

On 5/8/25 14:23, Lorenzo Stoakes wrote:
>>
>> M for "PAGE ALLOCATOR", hmmm ..., I was hoping that Vlastimil might have
>> capacity for that? :)
> 
> Vlastimil? ;)
> 
> I'd certainly support this.

OK, can do, thanks.

>>
>>
>>
>> Not 100% sure what to do with
>>
>> * include/linux/page_isolation.h
>> * mm/page_isolation.c
>>
>> (I hate the word "page isolation")
>>
>> They are mostly about page migration (either for alloc_contig... or memory
>> hotunplug). Likely they should either go to the MIGRATION section or to the
>> PAGE ALLOCATOR? Maybe MIGRATION makes more sense. Thoughts?
> 
> I mean it explicitly relates to migrate type and migration so seems to me
> it ought to be in migration.
> 
> Though migrate type + the machinary around it is a product of the physical
> page allocator (I even cover it in the 'physical memory' section of the
> book).
> 
> I wonder if our soon-to-be page allocator maintainer Vlastimil has
> thoughts? ;)
> 
> I'd vote for migration though to be honest.

I checked the code briefly and although migratetypes are related to
migration, it seems rather page allocator code to me.

In fact if I didn't miss these files, I would have included them when
proposing the PAGE ALLOCATOR section.
Zi Yan has a series on that topic now and is one of the R: in PAGE
ALLOCATOR. What do you think?

>>
>> --
>> Cheers,
>>
>> David / dhildenb
>>

