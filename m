Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590271DE883
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 12:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746535703; cv=none; b=oioNpvK+UQcNM2yoVXK0pUyhv9+P2sveyvFAXBbeyq3VW4vdAdrvi7flTuNiRukDSdAEPRD/8cmTH/O/vabnk64TQNREf4ZJXn5s+MUarjxIlME4aounTfgTJKnh0VY6KLle374rD54Y9uLw7KL2XqGFEwWbwW2jBp3rL0VZcto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746535703; c=relaxed/simple;
	bh=8ubOWI8+2mUl2eaNqwg0k/WqOEL9YcUblXgwsyAtyo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uw8d7VdlOyy0BLW/37LxvqNVpEiHSE7oTOGH+G48JSfUErC8ebdFqnOMpAHDXfOgodKZH3rCoZi8R+0tujUy+n9QZ1I/LaS1pU9ETrN3eXI7CAPxzUUQRbihL+xP0CZ7SBif0PXq0zN0rmKNZwSM1Xg22/dpKktxamyz011z+Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=QSfxMzlT; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=8TItqUap; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=dVX6yepa; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=1/PorQBd; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="QSfxMzlT";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="8TItqUap";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="dVX6yepa";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="1/PorQBd"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7953C1F390;
	Tue,  6 May 2025 12:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1746535700; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5K/N/0WLkbc+DdrII6oye3X6T8Ni1CdM9Ifo6jBFaF0=;
	b=QSfxMzlTxlx/0DcSc0Q/Iw2mZ6eLIHjzK5HZqDXAjMHPDH8qJ9BD8v1nPZ12wn7icoXTL0
	JTJAY6PjnZvJb8pzWBdrd6Ql6ZXJMP9BPe+np11Q5Ewjm4SgdRl42a5J+ibdsLFPxyiycq
	uywjCKexqJhsp7FXRpJ8jd9lLYcAD1c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1746535700;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5K/N/0WLkbc+DdrII6oye3X6T8Ni1CdM9Ifo6jBFaF0=;
	b=8TItqUaplNDt0Wh9r9FOWtrzKNMcFn2ZHVEDyp+JNpx/P1LMdEaWRfHt/AtzMIE9Iw6p95
	TNwAo+TboQbcxxDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1746535699; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5K/N/0WLkbc+DdrII6oye3X6T8Ni1CdM9Ifo6jBFaF0=;
	b=dVX6yepaOsEz2V8wDOPXqEFaw5e9i++/fW/bsz58A44B6rwiwXYQ50bo64MyOjbXDlr4nZ
	mWR8Xq+v9dfvxlm7QbG0c983qrkuB3CFeHfhMYCPHue7x9uvY1ZCERsMQ9HkcSBMdqrYxh
	D+wdwBsQyuyrVThUgiR3NLOW1ok9fKY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1746535699;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5K/N/0WLkbc+DdrII6oye3X6T8Ni1CdM9Ifo6jBFaF0=;
	b=1/PorQBdQXDlzKYyY+e2WKbk7dhTiv5GobGnvxKOCVFUMy4d1niEK6oaJCyCrSke7MeqiH
	mbzaEKCgaeR1ZaCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5582313687;
	Tue,  6 May 2025 12:48:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qfWIFBMFGmizLwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 06 May 2025 12:48:19 +0000
Message-ID: <baeb1200-5293-4fe0-aa76-b1d41875af58@suse.cz>
Date: Tue, 6 May 2025 14:48:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block
 order
To: Andrew Morton <akpm@linux-foundation.org>,
 Juan Yescas <jyescas@google.com>
Cc: Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, tjmercier@google.com,
 isaacmanjarres@google.com, surenb@google.com, kaleshsingh@google.com,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 Minchan Kim <minchan@kernel.org>
References: <20250506002319.513795-1-jyescas@google.com>
 <20250506000133.ba44539dd517e4f54515751b@linux-foundation.org>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250506000133.ba44539dd517e4f54515751b@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.990];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Flag: NO

On 5/6/25 09:01, Andrew Morton wrote:
> On Mon,  5 May 2025 17:22:58 -0700 Juan Yescas <jyescas@google.com> wrote:
> 
>> Problem: On large page size configurations (16KiB, 64KiB), the CMA
>> alignment requirement (CMA_MIN_ALIGNMENT_BYTES) increases considerably,
>> and this causes the CMA reservations to be larger than necessary.
>> This means that system will have less available MIGRATE_UNMOVABLE and
>> MIGRATE_RECLAIMABLE page blocks since MIGRATE_CMA can't fallback to them.
>> 
>> The CMA_MIN_ALIGNMENT_BYTES increases because it depends on
>> MAX_PAGE_ORDER which depends on ARCH_FORCE_MAX_ORDER. The value of
>> ARCH_FORCE_MAX_ORDER increases on 16k and 64k kernels.
>> 
>> ...
>>
>> +config PAGE_BLOCK_ORDER
>> +	int "Page Block Order"
>> +	range 1 10 if !ARCH_FORCE_MAX_ORDER
>> +	default 10 if !ARCH_FORCE_MAX_ORDER
>> +	range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
>> +	default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
> 
> Do we really need to do this arithmetic within Kconfig?  Would it be
> cleaner to do this at runtime, presumably when calculating
> pageblock_order?

AFAIK pageblock_order is compile-time constant. Making this a boot parameter
was proposed in v1 but explained as not useful. That explanation could be
added in the changelog?
