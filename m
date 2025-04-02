Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047D123A980
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743601519; cv=none; b=l72fJNguSzq5/4oGllf1GPCHX3hSb156UpO8H99o6P0I9fHF+BHbq7QXLktTgTQgF/Qm068Q2JD/QQ2PYn2UpMriDKtmfwoLShSJKBKzlMQ2k318ibMKNwDGN2GrnCQCwDvnm7OooqX67K5I9WtO6QeTaadDjqvqi+fHRcE9iG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743601519; c=relaxed/simple;
	bh=ou38J16lzWKPyDmRIHSMAl2iCcJKb2PNXf+krDDPR4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TkkDGCmUpMLa5Slj6+vnzPlIHay3zj8inpd93N3RtAEA3REtQe8EAJFK1V08vTN2jtMIUjRaLGW98pJJsgZZynOLoEV14r209+086mBddzGQqyp3yOqzbXdny7qV0e7X+dG3mqANofloh4YGCVgAvSlnS8f5zJSwnY2KmfiYcvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=HatgSIyQ; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=fMpfRdxo; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=SdjRtG2X; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=sj3fTrbk; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="HatgSIyQ";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="fMpfRdxo";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="SdjRtG2X";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="sj3fTrbk"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F0A1E21196;
	Wed,  2 Apr 2025 13:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1743601513; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dbEg7ZiTEcX7WNOb0hyQDt4lxFKLBGaAQx0+L1oQigo=;
	b=HatgSIyQRsBnqxqOQftX+HatIxARuUBUMTOhzxEpPcv3EA5S0vmYme+rzSTGD9XigFEntk
	4QorRtNu/UP/9geXawFWW7AtkVXuhzjPXgJU3LIG0NkdZI6POkNKRdzjVo++37Ah9EQMa8
	rFiWJcQ2Xbq74+gxyj/a839d4O1eXSM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1743601513;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dbEg7ZiTEcX7WNOb0hyQDt4lxFKLBGaAQx0+L1oQigo=;
	b=fMpfRdxoSpyAGqrUslxujMrLZ5SBhInrN40/w6glk5WQpaqBW2gTMA6IFDyL1M4XcaLwt2
	57v8DJfo+Vy8KkCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1743601512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dbEg7ZiTEcX7WNOb0hyQDt4lxFKLBGaAQx0+L1oQigo=;
	b=SdjRtG2XZmUxG3VNE36RHMtp7lHY4jmeDZ2kzWxXcFc11dDfuokPZMRX9XUAsuzUhLx0Z4
	crbC62kcNoU2szLQqdEMS9Cc4H0gcUgfwuCy7eGlBUP86x18V++6KKpl9kg/xxEPgHMaor
	WE8X+i+lFixaPpS4LeZk6BhzFhA7iZg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1743601512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dbEg7ZiTEcX7WNOb0hyQDt4lxFKLBGaAQx0+L1oQigo=;
	b=sj3fTrbkRnZpqcnrGy37fIpH64BZwBA6iP7umXiHt7yX69empsDox680/7t1MLTWtNiZ9f
	DxmTUmVhwm4uLVCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DFD5C13A4B;
	Wed,  2 Apr 2025 13:45:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UGhPNmg/7WdCHAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 02 Apr 2025 13:45:12 +0000
Message-ID: <64b5a8d5-6e58-401b-8cf4-404df0a11d07@suse.cz>
Date: Wed, 2 Apr 2025 15:45:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] lib/iov_iter: fix to increase non slab folio refcount
Content-Language: en-US
To: Sheng Yong <shengyong2021@gmail.com>, akpm@linux-foundation.org,
 willy@infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@archiver.kernel.org,
 Sheng Yong <shengyong1@xiaomi.com>
References: <20250401144712.1377719-1-shengyong1@xiaomi.com>
 <b2c07fdf-5ab1-4a65-9ce2-38638b7c718e@suse.cz>
 <15dfe0c4-c1cb-4146-ab06-cd36b7412b2e@gmail.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <15dfe0c4-c1cb-4146-ab06-cd36b7412b2e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-foundation.org,infradead.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	URIBL_BLOCKED(0.00)[xiaomi.com:email,suse.cz:email,suse.cz:mid,imap1.dmz-prg2.suse.org:helo];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.cz:mid]
X-Spam-Score: -4.30
X-Spam-Flag: NO

On 4/2/25 15:36, Sheng Yong wrote:
> On 4/1/25 23:22, Vlastimil Babka wrote:
>> On 4/1/25 16:47, Sheng Yong wrote:
>>> From: Sheng Yong <shengyong1@xiaomi.com>
> [...]
>>>
>>> Fixes: b9c0e49abfca ("mm: decline to manipulate the refcount on a slab page")
>> 
>> Sigh. That went to v6.14
>> 
>> mm-hotfixes and Cc: stable then?
> 
> Hi, Vlastimil,

Hi,

> Shall I resend this patch with Cc: tag to the stable list?

Andrew can do it when picking up the patch so no need to. Thanks.

> thanks,
> sheng
> 
>> 
>>> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
>> 
>> Acked-by: Vlastimil Babka <vbabka@suse.cz>
>> 
>> Thanks.
>> 
>>> ---
>>>   lib/iov_iter.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>> ---
>>> v2:
>>>    * update commit message
>>>    * update coding style
>>>
>>> diff --git a/lib/iov_iter.c b/lib/iov_iter.c
>>> index 8c7fdb7d8c8f..bc9391e55d57 100644
>>> --- a/lib/iov_iter.c
>>> +++ b/lib/iov_iter.c
>>> @@ -1191,7 +1191,7 @@ static ssize_t __iov_iter_get_pages_alloc(struct iov_iter *i,
>>>   			return -ENOMEM;
>>>   		p = *pages;
>>>   		for (int k = 0; k < n; k++) {
>>> -			struct folio *folio = page_folio(page);
>>> +			struct folio *folio = page_folio(page + k);
>>>   			p[k] = page + k;
>>>   			if (!folio_test_slab(folio))
>>>   				folio_get(folio);
>> 
> 

