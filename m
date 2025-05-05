Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9F01E0DD1
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 08:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746432102; cv=none; b=qBvEBisgK12WLqW2egZWsug4EzTIy7B2HvI3kY03X2BrrgbfFWTcyySs2UfeGBB/3j/HggXXVWpMozg1kNMv1oiFYz1bhujSwwgs/la/BMyZhGKkvP6yyLvr5B64SL7M2h/EqfA1iDxKC5woaUFvrM5MM4evr71bHY0Y6BtiQ2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746432102; c=relaxed/simple;
	bh=AXnl16BJRMfxHClMTjP3xdYanBe+9oi15rZDlnsq1Nk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eqfIqyzxWK6DZFNNx7bXnBY4E3ct6ifZmoKFoUqWIYpeq70AffaPStTu2nTkEx+Q073wzPJXlhNsgv7/QHZSnxgSfFxutGwXd+1d1GcC69JRArG6ExCqTSMtduOmAcQie6aVYnRgp2MPQx5KU+zgafZTC4lOrxCPGT4g7HmC8TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=hJ149HZw; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=6sVERG7m; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Fb69ZYxb; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=W0Sn3Qfu; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="hJ149HZw";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="6sVERG7m";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Fb69ZYxb";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="W0Sn3Qfu"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 974B41F391;
	Mon,  5 May 2025 08:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1746432093; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CNdDkGoZiznzuDlL7O+fPoyE7bKp8zSH6hAOlLsG7YE=;
	b=hJ149HZwwpGP0kESNPMp4bf02DRp/rrX1Pz9tDafrmTKQBOF6vLzZuYH9SKKAQWZ13pTBu
	pKaMzUiAoeib6kBuQj1xTFsp0r558HvRTXXUNrglMMhvLZWhDMhRpGqXCfSgq8WLSEnc7S
	BjZX7DtyI5XmX0ZM9hK2yvPHIAHN40M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1746432093;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CNdDkGoZiznzuDlL7O+fPoyE7bKp8zSH6hAOlLsG7YE=;
	b=6sVERG7mlaMBx0mhSmh+NUO0pmNh/EX+dCDR7TKqycoE4aA77wcuv+dyqf9djXPpognY8t
	WjMgBFC4fJTrPrCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1746432092; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CNdDkGoZiznzuDlL7O+fPoyE7bKp8zSH6hAOlLsG7YE=;
	b=Fb69ZYxbai3NddUY5nS5o/QSoBC/wDY5Z1VnuKyFaAFOFGsKGJVZEpkp5BxMgrN+F08hQJ
	0ma3mF3vVp98bFUEImdp/D+7e90BWdXD75iCMVhruysiTz05PLrXruSqakPLUipdOuhbah
	wS+OT1UKStf3I+P8hQ59A1t4BJwXSEc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1746432092;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CNdDkGoZiznzuDlL7O+fPoyE7bKp8zSH6hAOlLsG7YE=;
	b=W0Sn3QfuvZNQc2kEwREUwDORrYe9syRW2kqkmhi/EHrEIHJbAn3tulIkj7a4XpsuVSNuL+
	8eGEce767rpyNqDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8446B13883;
	Mon,  5 May 2025 08:01:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Hzz1H1xwGGilUgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 05 May 2025 08:01:32 +0000
Message-ID: <1a679bb9-b701-47cf-83a5-b0f5cc4a5eaf@suse.cz>
Date: Mon, 5 May 2025 10:01:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/1] local_lock: Minor improvements of
 local_trylock*() documentation
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Leonardo Bras <leobras@redhat.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
References: <20250430073610.163846-1-leobras@redhat.com>
 <20250430145954.hsnIXmYO@linutronix.de>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250430145954.hsnIXmYO@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On 4/30/25 16:59, Sebastian Andrzej Siewior wrote:
> On 2025-04-30 04:36:10 [-0300], Leonardo Bras wrote:
>> Fix local_trylock_init() documentation, as it was mentioning the non-try
>> helper instead, and use the opportunity to make clear the try_lock*() needs
>> to receive a try-enabled variable as parameter.
> 
> Maybe replaced "try-enabled lock" with "local_trylock_t". "Try enabled
> lock" as mentioned in the documentation or "try-enabled variable" as here
> in the description does not really fit.

I agree, it's more clear that way.

Thanks,
Vlastimil

>> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> 
> Sebastian

