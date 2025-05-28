Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE1C24500E
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 07:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748417475; cv=none; b=epuo4kzTW2rEvZ57m5KJQxznysl7b4b+qlGjo8u5bJGh10UucbCHJZx5sZxQVJjMOGqFAb4gMYt/TPyZRLAK3xW93LdKK5ODP+MHtqYll9/CuRHilUwCRxN4dRjfXKAQPNn2zA245n2ZbvfRTg0u04Bjpb6ftu5uTcOIM852e0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748417475; c=relaxed/simple;
	bh=lGbLr6D1aheHcW2X3Xg29PhTlsJPrCPfnRVZ2ym3TNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q5gG0OJLzH8iH4oR6ZemXDTBpPkNBYTxASB7O8nKgn63pJmuaaGsRJiv/VS7qMc7wO9et+ZIXbqZ30RbFacEq4j+OykyH8HgNDEsafxPByyaAmKqrm4MtnI8z9ycjdW1n3pL0MKkzqwInVzSp7xUcD3fFLapuOqJrZW1Jns2TYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Q3/36YLo; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=8GtYJkOY; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Q3/36YLo; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=8GtYJkOY; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Q3/36YLo";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="8GtYJkOY";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Q3/36YLo";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="8GtYJkOY"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7FE2D21BD7;
	Wed, 28 May 2025 07:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748417471; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3cLvsiR5HGJqXLAU8I0S9Yms2OS7UD/1yznj6XcMooQ=;
	b=Q3/36YLo82PZshOTF1jFfx5SGtO/T+YZyRTOrd/OtUQF+A30JTtTayHHIf09NHtvj1Mpew
	aU440zEP42bbdGdGdHSOIepfn/hPBaWafK46lth47Q9TYWsK1+bJj/CIPSaZimUW87nOUk
	yxtQmase0bFQTfPV6t9LHS+QNTjlarc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748417471;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3cLvsiR5HGJqXLAU8I0S9Yms2OS7UD/1yznj6XcMooQ=;
	b=8GtYJkOY6PSQRAY+v/vmltoXBVqg+gTfRtE9OcFh5thPho0Lq3wGfzcjQqDk8X5Fh++Df8
	+/5Z/pDCGmHIXBBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b="Q3/36YLo";
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=8GtYJkOY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748417471; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3cLvsiR5HGJqXLAU8I0S9Yms2OS7UD/1yznj6XcMooQ=;
	b=Q3/36YLo82PZshOTF1jFfx5SGtO/T+YZyRTOrd/OtUQF+A30JTtTayHHIf09NHtvj1Mpew
	aU440zEP42bbdGdGdHSOIepfn/hPBaWafK46lth47Q9TYWsK1+bJj/CIPSaZimUW87nOUk
	yxtQmase0bFQTfPV6t9LHS+QNTjlarc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748417471;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3cLvsiR5HGJqXLAU8I0S9Yms2OS7UD/1yznj6XcMooQ=;
	b=8GtYJkOY6PSQRAY+v/vmltoXBVqg+gTfRtE9OcFh5thPho0Lq3wGfzcjQqDk8X5Fh++Df8
	+/5Z/pDCGmHIXBBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 54B92136E3;
	Wed, 28 May 2025 07:31:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id grFXFL+7NmhNRgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 28 May 2025 07:31:11 +0000
Message-ID: <f5f5b4c6-90b1-4736-acfe-e4a6dbf4bb3f@suse.cz>
Date: Wed, 28 May 2025 09:31:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block
 order
To: Juan Yescas <jyescas@google.com>, David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, tjmercier@google.com,
 isaacmanjarres@google.com, kaleshsingh@google.com, masahiroy@kernel.org,
 Minchan Kim <minchan@kernel.org>
References: <20250520225945.991229-1-jyescas@google.com>
 <28a2881d-fd33-44d9-a212-adeb8600e15b@redhat.com>
 <CAJDx_rjyLXxFxCG3QENN23+Xcao=_jeLTDZho0xrLm5i=Sc9GQ@mail.gmail.com>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <CAJDx_rjyLXxFxCG3QENN23+Xcao=_jeLTDZho0xrLm5i=Sc9GQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.51 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,suse.cz:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 7FE2D21BD7
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -1.51

On 5/21/25 18:51, Juan Yescas wrote:
> On Tue, May 20, 2025 at 11:47 PM David Hildenbrand <david@redhat.com> wrote:
>> > -#define pageblock_order              MIN_T(unsigned int, HUGETLB_PAGE_ORDER, MAX_PAGE_ORDER)
>> > +#define pageblock_order              MIN_T(unsigned int, HUGETLB_PAGE_ORDER, PAGE_BLOCK_ORDER)
>> >
>> >   #endif /* CONFIG_HUGETLB_PAGE_SIZE_VARIABLE */
>> >
>> >   #elif defined(CONFIG_TRANSPARENT_HUGEPAGE)
>> >
>> > -#define pageblock_order              MIN_T(unsigned int, HPAGE_PMD_ORDER, MAX_PAGE_ORDER)
>> > +#define pageblock_order              MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER)
>>
>> Wait, why are we using the MIN_T in that case? If someone requests 4 MiB, why would we reduce
>> it to 2 MiB even though MAX_PAGE_ORDER allows for it?
>>
> I don't have the context for that change. I think Vlastimil might know
> why it is needed:
> 
> That change was introduced in this patch:
> https://lore.kernel.org/all/20240426040258.AD47FC113CD@smtp.kernel.org/

Well the intention was always that pageblock order should be lowered to pmd
order when THPs are enabled as then compaction/anti-fragmentation can better
help them being successfully allocated. And when it turned out this was not
true without having also CONFIG_HUGETLB_PAGE enabled, I considered it a bug.

At the time there was not a proposal to make the pageblock order fully
configurable, so it was just about having the best possible heuristic. Now
we could let the new config override that, but since the main intention here
is to make pageblock order smaller and not larger, it doesn't seem that urgent.

But if we go that way we should make sure the defaults (user doesn't
override MAX_PAGE_ORDER) still result in pageblock_order match PMD_ORDER
with hugepages/THPs enabled, and not become accidentally larger.

> Thanks
> Juan
> 
>>
>> Maybe we really have to clean all that up first :/
>>
>> --
>> Cheers,
>>
>> David / dhildenb
>>

