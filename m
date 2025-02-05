Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DD122A80B
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751936; cv=none; b=PNIBZ8x42W1kPrtbYLalmi7v0XyT0zb8W13SR7TICWAqipAX8FGd5GoeNeOHI4JsW2Y3KCMtIC1o7dsl7mcDH3jgDTwsk1kOaJwaFhxRYRTmmKeZ8xyiZRLFdPkMhTNLyxwC2zTMuonwjduaT7l9Dm7a4lkGQYyT1tR/tl6JubI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751936; c=relaxed/simple;
	bh=/jggdLlhOu2PnUWKFIZq6EM4obemv/G2WILMSZQ7teE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NhoC/N6ZmVm86uIiTXZ+Qs4G9cEgnBJRnh01zb2sClPn+uJIEwB+h74TeC3a1gT/vwLqIN0TYz5lnIZXtSECeBU95P6YCQztfDUlLHxEitQ358JfzdF6GbqWVFETgWm1AyqNQ8XCOzGeV1HMSt4aANPiT9ZkDW9zct97xSj0PZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=aifSB4BC; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=+WGcb1Tt; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=aifSB4BC; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=+WGcb1Tt; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="aifSB4BC";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="+WGcb1Tt";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="aifSB4BC";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="+WGcb1Tt"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6092B1F45E;
	Wed,  5 Feb 2025 10:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1738751932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nLiNDfGTBvEPPXBkUyJYx8PBQHMS7L5Rv/YnmAMUCGw=;
	b=aifSB4BCjlFzbnHBjneBeJzBDfyOAS7oPZQIwp8xSuGdD5mkqvBN7KkuO8lVQnBYRYTQKf
	YI3KXZ5agwpLArR+Z38wt//UCZ+gCfW+Xlf0Ol0araitwh3tTAiIOWS3DPVVFWa8bzkALP
	wmJQmynKab6ejJtyzbQaF/l37jHWxyM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1738751932;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nLiNDfGTBvEPPXBkUyJYx8PBQHMS7L5Rv/YnmAMUCGw=;
	b=+WGcb1TtAqqS5bi7sdsq7qfu0UM2QnBi/bT0JRvp31LoAqfmo5pDSx8KvxN2yO4cLdTcIr
	02yliagGph7MceAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1738751932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nLiNDfGTBvEPPXBkUyJYx8PBQHMS7L5Rv/YnmAMUCGw=;
	b=aifSB4BCjlFzbnHBjneBeJzBDfyOAS7oPZQIwp8xSuGdD5mkqvBN7KkuO8lVQnBYRYTQKf
	YI3KXZ5agwpLArR+Z38wt//UCZ+gCfW+Xlf0Ol0araitwh3tTAiIOWS3DPVVFWa8bzkALP
	wmJQmynKab6ejJtyzbQaF/l37jHWxyM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1738751932;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nLiNDfGTBvEPPXBkUyJYx8PBQHMS7L5Rv/YnmAMUCGw=;
	b=+WGcb1TtAqqS5bi7sdsq7qfu0UM2QnBi/bT0JRvp31LoAqfmo5pDSx8KvxN2yO4cLdTcIr
	02yliagGph7MceAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4787813694;
	Wed,  5 Feb 2025 10:38:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FazoDrw/o2dTRQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 05 Feb 2025 10:38:52 +0000
Message-ID: <9c6e9064-89b0-4373-ae66-8aae5ade6fa2@suse.cz>
Date: Wed, 5 Feb 2025 11:38:51 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm/slab: simplify SLAB_* flag handling
Content-Language: en-US
To: Hyeonggon Yoo <42.hyeyoo@gmail.com>, Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>,
 David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Roman Gushchin <roman.gushchin@linux.dev>
References: <20250124164858.756425-1-kevin.brodsky@arm.com>
 <CAB=+i9QJsQEzSTf=LxY_Kuqm++2MZDXLL1eshngDZ5dAg5UzUQ@mail.gmail.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 EP+ylKVEKb0Q2A==
In-Reply-To: <CAB=+i9QJsQEzSTf=LxY_Kuqm++2MZDXLL1eshngDZ5dAg5UzUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_TO(0.00)[gmail.com,arm.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

On 2/2/25 07:57, Hyeonggon Yoo wrote:
> On Sat, Jan 25, 2025 at 1:49 AM Kevin Brodsky <kevin.brodsky@arm.com> wrote:
>>
>> SLUB is the only remaining allocator. We can therefore get rid of
>> the logic for allocator-specific flags:
>>
>> * Merge SLAB_CACHE_FLAGS into SLAB_CORE_FLAGS.
>>
>> * Remove CACHE_CREATE_MASK and instead mask out SLAB_DEBUG_FLAGS if
>>   !CONFIG_SLUB_DEBUG. SLAB_DEBUG_FLAGS is now defined
>>   unconditionally (no impact on existing code, which ignores it if
>>   !CONFIG_SLUB_DEBUG).
>>
>> * Define SLAB_FLAGS_PERMITTED in terms of SLAB_CORE_FLAGS and
>>   SLAB_DEBUG_FLAGS (no functional change).
>>
>> While at it also remove misleading comments that suggest that
>> multiple allocators are available.
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> 
> Hi Kevin,
> This patch in general looks fine to me.
> 
> However, there are subtle changes that were not documented by the changelog.
> SLUB currently does not _completely_ ignore debug flags even when
> CONFIG_SLUB_DEBUG=n. For example, calculate_sizes() relocate the free pointer
> regardless of CONFIG_SLUB_DEBUG.

I think the patch makes no difference there effectively? Before the patch,
CACHE_CREATE_MASK would be used to filter flags and not include the debug
flags, so that free pointer relocation due to SLAB_POISON or SLAB_RED_ZONE
would not happen. After the patch, it's filtered effectively the same? Am I
missing something?

> I believe completely ignoring debug flags should be acceptable
> when CONFIG_SLUB_DEBUG=n, but this change should at least be documented
> in the changelog.
> 
> Additionally, beyond what this patch currently does, we can remove several
> CONFIG_SLUB_DEBUG #ifdefs in some functions (e.g., in calculate_sizes())
> on top of this patch.

So AFAIK that should be possible both before and after this patch and you
can try (it's out of scope of this patch). But I suspect the reason for the
#ifdefs is that it the code would reference structures or fields that don't
exist without CONFIG_SLUB_DEBUG. Maybe that's not (no longer?) true in some
cases and we could clean up. Another reason would be performance, but we
shouldn't care in code that's only executed during cache creation.

> How does that sound to you?
> 
> Best,
> Hyeonggon

