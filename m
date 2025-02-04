Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6B4208984
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 11:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738667058; cv=none; b=XAFK8inoR/mCdG98+Cdjxe3BrTfTjLOgerJyHlUtBhnZU7bBvVdxH7ZYKuPs23DtyOfA67oG/2Vej7K89bVH1g0DEotzRiuB/eG0QsXPiURdX3iv58CeNtgETZ1G+RIRYFazdq+O3FsqQZui13JB3RCH3G1cRDOzwtiv0MEofjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738667058; c=relaxed/simple;
	bh=E90MRZM5b3SgjCyPNWDURSNi29LJ0RSTil2o7g4SO+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dj0xAk1T8ISKWU79oLnh20+Zu8HsmjXrPJZUvRp/XT52KuWexS+/Mrm6qOH8JYVoq8S8gD32aW0dONIJR+E46lOhyXxsHd3tqvGcN3drZtbdhyYkQUfuATsqzQgTWOxhyovTcH3VJ337gXCa0+eE0GiPA1+kXCxwJfUeqrTPaSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Csi1EnE+; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=dHG0AIxq; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Csi1EnE+; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=dHG0AIxq; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Csi1EnE+";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="dHG0AIxq";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Csi1EnE+";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="dHG0AIxq"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0C3F9210F7;
	Tue,  4 Feb 2025 11:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1738667054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KebHPtJqjNVklQo/c4le7QuhMJtDMnVt9AKQwyh1qsM=;
	b=Csi1EnE+FCSvLRKu8RMdC5hb+ohcRqE5RdtySiWcbIzpbqogQkkT4ocf2Iai6mbGkoV98r
	uBdZCdYkoGhaCSZFmzdTY7bllxty7C9eoHS7G6mB6mYuSZ4Vp6mKwX5qhriBnpyESPwKwO
	YjIwNSrjZTiLTQKGwspHDEg04NL1Vuw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1738667054;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KebHPtJqjNVklQo/c4le7QuhMJtDMnVt9AKQwyh1qsM=;
	b=dHG0AIxqhojsnk8EdFRyglZ7TPzprm58ZAPVtTVJ7sJ+kBIni0YhS/mXUdFxtNCyOp+Wk3
	Z7AhVY7ZPGNW+pDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1738667054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KebHPtJqjNVklQo/c4le7QuhMJtDMnVt9AKQwyh1qsM=;
	b=Csi1EnE+FCSvLRKu8RMdC5hb+ohcRqE5RdtySiWcbIzpbqogQkkT4ocf2Iai6mbGkoV98r
	uBdZCdYkoGhaCSZFmzdTY7bllxty7C9eoHS7G6mB6mYuSZ4Vp6mKwX5qhriBnpyESPwKwO
	YjIwNSrjZTiLTQKGwspHDEg04NL1Vuw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1738667054;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KebHPtJqjNVklQo/c4le7QuhMJtDMnVt9AKQwyh1qsM=;
	b=dHG0AIxqhojsnk8EdFRyglZ7TPzprm58ZAPVtTVJ7sJ+kBIni0YhS/mXUdFxtNCyOp+Wk3
	Z7AhVY7ZPGNW+pDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E8E5B13795;
	Tue,  4 Feb 2025 11:04:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GqJAOC30oWd3IgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 04 Feb 2025 11:04:13 +0000
Message-ID: <8f84691b-4b48-46da-9c47-e1f41bd503e1@suse.cz>
Date: Tue, 4 Feb 2025 12:04:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: REGRESSION BISECTED mm, mmap: limit THP alignment of anonymous
 mappings to PMD-aligned sizes
Content-Language: en-US
To: Doug Smythies <dsmythies@telus.net>,
 'Andrew Morton' <akpm@linux-foundation.org>
Cc: 'Michael Matz' <matz@suse.de>,
 'Gabriel Krisman Bertazi' <gabriel@krisman.be>,
 'Matthias Bodenbinder' <matthias@bodenbinder.de>,
 'Lorenzo Stoakes' <lorenzo.stoakes@oracle.com>,
 'Yang Shi' <yang@os.amperecomputing.com>, linux-kernel@vger.kernel.org,
 linux-mm@vger.kernel.org
References: <019401db769f$961e7e20$c25b7a60$@telus.net>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 EP+ylKVEKb0Q2A==
In-Reply-To: <019401db769f$961e7e20$c25b7a60$@telus.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[]
X-Spam-Score: -4.30
X-Spam-Flag: NO

On 2/4/25 01:56, Doug Smythies wrote:
> Hello,
> 
> Note: The CC list is a guess, and I am not on the two vger.kernel.org lists.
> 
> After observing a 30% reduction in the ebizzy benchmark performance, I bisected the kernel and got:
> 
> doug@s19:~/kernel/linux$ git bisect bad
> d4148aeab412432bf928f311eca8a2ba52bb05df is the first bad commit
> commit d4148aeab412432bf928f311eca8a2ba52bb05df
> Author: Vlastimil Babka <vbabka@suse.cz>
> Date:   Thu Oct 24 17:12:29 2024 +0200
> 
>     mm, mmap: limit THP alignment of anonymous mappings to PMD-aligned sizes

Thanks for the report. That commit fixed regressions of other workloads, but
since it's tweaking a heuristic related to THPs that can have both positive
and negative consequences, it's not surprising to see that another workload
can regress.

Since that commit is implicated, there should have been a matching
improvement for this workload in 6.7 thanks to commit efa7df3e3bb5 ?

I guess one option to proceed would be to check what kind of mappings ebizzy
creates for its performance sensitive operations, and see if they e.g. were
backed by THPs before d4148aeab41 and now they aren't. Maybe some simple
adjustment to ebizzy's allocations is possible to achieve the better
performance always and not rely on this particular heuristic.

> As a double check I reverted the commit, on top of kernel 6.14-rc1.
> I had to manually revert it, due to other changes since then.
> The previous performance of the benchmark was restored.
> 
> I actually use the sleeping-ebizzy benchmark [1].
> I use it for idle governor testing because it has yielded interesting results in the past.
> And sweep over a range of sleep times. Example graphs attached.
> 
> Legend (regression average is over interval range from 400 to 3600 uSec):
> 
> teo611: kernel 6.11, teo idle governor. Reference.
> teo614: kernel 6.14-rc1, teo idle governor. Regression 25.7%
> teo612: kernel 6.12, teo idle governor. Regression 24.4%
> teo613: kernel 6.13, teo idle governor. Regression 25.1%
> teo614-revert: kernel 6.14-rc1, with this patch reverted, teo idle governor. No regression, 1.4%
> menu: kernel 6.14-rc1, menu idle governor. Regression 26.4% 
> 
> Example command:
> ./ebizzy -m -S 20 -t 128 -a 1 -i 400
>  
> My processor: Intel(R) Core(TM) i5-10600K CPU @ 4.10GHz
> Distro: Ubuntu 24.04, server, no desktop GUI.
> 
> [1] https://github.com/pratiksampat/sleeping-ebizzy
> 
> Doug Smythies
> 
> 
> interval-sweep.png
> 
> 
> relative-performance.png
> 

