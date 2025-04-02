Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060E01DA5F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 15:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743606067; cv=none; b=HYufNgIQxRHBEyGRvtvbp4YORWC/EVeoPD9nI8bK/wPz1/MEbSoC55Q7XIANob4YllMX5+Lcg3U5A6/Ok+qTVHFSgViJt/H09+3G1cmePaH7GE3qUUB9q5GDhfEmTeYXgwO8uBWduI7DtSiH4K6Tg5oi6dP5gBmvuGg46NTfRvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743606067; c=relaxed/simple;
	bh=9UfJyk/t+XFUbADNbcaQiEQ/D03Nyq6bdU+IIG/4FuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CA4fVloeh0MtllnEpGKT0hGeVA/YDf50d1K8I9T5IsLQyvh8L/mLWf/AQ/a1N6FspGidCHRkRci6HtXuiUb8m8VQQArJFFu9siXSSz805B/IuRit4Y5VlmE9rUHH3ik//HS+dHSGzXYABOdwoYU9ZzZxxvRvt3I/8+uQv3GxxZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=O24XNBs8; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=6Zrpjao9; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=O24XNBs8; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=6Zrpjao9; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="O24XNBs8";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="6Zrpjao9";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="O24XNBs8";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="6Zrpjao9"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1B20A1F38E;
	Wed,  2 Apr 2025 15:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1743606059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vT8nPzlOT1lU8ebYpJie/X1Ap1hIbW88MbUW9YrYAqU=;
	b=O24XNBs8UVVAi1baqmzIhyKkmFifqnUFRf34CmLjNWAicmj7e4mNJ8ccK9YCpLaBL8puBr
	ZvwmEWUvipAaDaPke6Ggr1mtwYRWeo7cocARoCdztZu3EyEZz/qjdJ86vMdr4NpnasHb98
	87vQ9Wvu0qknpGjDB4wTCrb8Lg+f74I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1743606059;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vT8nPzlOT1lU8ebYpJie/X1Ap1hIbW88MbUW9YrYAqU=;
	b=6Zrpjao9YnlzRAbXvGetaQjcD6SMITwZsedpMtKk3jN6oGXQxWY6JtJdgE++rWa+BPLF+X
	txEm8gBRpFzVnoCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=O24XNBs8;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=6Zrpjao9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1743606059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vT8nPzlOT1lU8ebYpJie/X1Ap1hIbW88MbUW9YrYAqU=;
	b=O24XNBs8UVVAi1baqmzIhyKkmFifqnUFRf34CmLjNWAicmj7e4mNJ8ccK9YCpLaBL8puBr
	ZvwmEWUvipAaDaPke6Ggr1mtwYRWeo7cocARoCdztZu3EyEZz/qjdJ86vMdr4NpnasHb98
	87vQ9Wvu0qknpGjDB4wTCrb8Lg+f74I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1743606059;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vT8nPzlOT1lU8ebYpJie/X1Ap1hIbW88MbUW9YrYAqU=;
	b=6Zrpjao9YnlzRAbXvGetaQjcD6SMITwZsedpMtKk3jN6oGXQxWY6JtJdgE++rWa+BPLF+X
	txEm8gBRpFzVnoCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EE190137D4;
	Wed,  2 Apr 2025 15:00:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tEPBOSpR7WcvOAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 02 Apr 2025 15:00:58 +0000
Message-ID: <d9a8d187-a05f-45b1-ac4b-ed6bd04b99a5@suse.cz>
Date: Wed, 2 Apr 2025 17:00:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Ask help about this patch c0cd6f557b90 "mm: page_alloc: fix
 freelist movement during block conversion"
Content-Language: en-US
To: Carlos Song <carlos.song@nxp.com>, "hannes@cmpxchg.org"
 <hannes@cmpxchg.org>,
 "baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
 "ying.huang@intel.com" <ying.huang@intel.com>,
 "david@redhat.com" <david@redhat.com>,
 "mgorman@techsingularity.net" <mgorman@techsingularity.net>,
 "ziy@nvidia.com" <ziy@nvidia.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <VI2PR04MB11147E11724F867F4FCB6677DE8AF2@VI2PR04MB11147.eurprd04.prod.outlook.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <VI2PR04MB11147E11724F867F4FCB6677DE8AF2@VI2PR04MB11147.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1B20A1F38E
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
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,suse.cz:dkim];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On 4/2/25 13:31, Carlos Song wrote:
> Hi, all

Hi,

> I found a 300ms~600ms IRQ off when writing 1Gb data to storage device at I.MX7d SDB board at Linux-kernel-v6.14.
> From this discussion I find the regression root cause:
> https://lore.kernel.org/linux-mm/CAJuCfpGajtAP8-kw5B5mKmhfyq6Pn67+PJgMjBeozW-qzjQMkw@mail.gmail.com/T/
> 
> Before add this patch c0cd6f557b90 "mm: page_alloc: fix freelist movement during block conversion", this longest IRQ off time is only 1ms~2ms.
> After add this patch c0cd6f557b90 "mm: page_alloc: fix freelist movement during block conversion", this longest IRQ off time is only ~100ms.
> This patch is added in linux-kernel 6.10.
> In the same test case and environment. From 6.10, as other PATCHs are added, the spinlock time gradually increases. At 6.12 the IRQ off is ~150ms
> and at 6.14, the IRQ off time is ~300ms.
> 
> Run this cmd to test:
> dd if=/dev/zero of=/dev/mmcblk0p3 bs=4096 seek=12500 count=256000 conv=fsync
> 
> I use Ftrace irqoff tracer to trace the longest IRQ off event. Here is my test log. Do I trigger a bug?
> 
> 4 Ftrace logs of irqoff tracing on the same environment using the same case only with different kernel version: 
> 1. Not add the patch 2. Add the patch 3. At 6.12 4. At 6.14.
> 
> Log is here:

Do you have CONFIG_DEBUG_VM enabled? Or maybe what's the .config in general?

I guess we do more work in __rmqueue_fallback() now under the lock but it
should not take *that* long, hm. I'm not however sure if we can split the
zone lock holding here.

Guess we could at least optimize account_freepages() done as part of
__move_freepages_block() -> move_to_free_list() as the migratetypes are
always the same so it could be a single pair of calls on an accumulated
nr_pages count instead of pair for every page moved. And the loop in
__move_freepages_block() could have an extra struct page * iterator instead
of pfn_to_page() in every iteration.
