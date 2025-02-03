Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5016D1863E
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 08:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738572178; cv=none; b=ThHUixm3S2WBmrWR/uQwEhny1yFreupP82H3xbj8e/c5tgZb/gh6aV961ZksT1yDkiVbHE3gnm4JCZF7jKvh5YJDmVyn2/vKrO/ZgeAdaPZdZWam7kWNFTij/WXJIvBi7NRmYl5/PeE9EZD5xR6q8cbP0BhdMV9fD2EcfhVOaj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738572178; c=relaxed/simple;
	bh=H0TUOUnzJTRV5KnnyEuI0sVcg8CMj6k8cgKBeWm17LE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LixzFQAW90mi/Zg5nTZbJrUb5I0DDM4eYqfB9rJV6JUTNHpXF/dsjKrkZXHCH5dazdqD+KaRz7E3Kjy9E+cOrNavJAaISxY/Qk4oebHWHCeO+KVxMuaX19CwsskpbN+TW2L5It7wjYCtFAofuVVkNqPAB/nybluJ8hR9ugaSKo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZRYXQX62; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WhfXxcht; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZRYXQX62; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WhfXxcht; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZRYXQX62";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WhfXxcht";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZRYXQX62";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WhfXxcht"
Received: from hawking.nue2.suse.org (unknown [IPv6:2a07:de40:a101:3:92b1:1cff:fe69:ddc])
	by smtp-out2.suse.de (Postfix) with ESMTP id 4266E1F37C;
	Mon,  3 Feb 2025 08:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738572175; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n4KmZoQfw8THBhrTIiwcH+di+9FGYYevhJ3k+w9c0xc=;
	b=ZRYXQX62EiH6D6fHevn7HpphdOaypDmDwrTpW7Cwo+d1b/O+2w3L2YhJAbrZenn8Ax6FS6
	c8981AUwCheJOZr5SqbnPbR7FSIjh1iZoWWzTZTjqH3MkQf2UUoTdzT93+VhuL2G2POO6z
	HLCzl+TC02gaVHILLiDqws9L3ZdTri4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738572175;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n4KmZoQfw8THBhrTIiwcH+di+9FGYYevhJ3k+w9c0xc=;
	b=WhfXxchtS4RjUIWr3l54PdGjWM1HtrSqRPzqPTTvVn4e73Mp6DkrGzkNsq2orSTcKdJQXj
	W3h2uh+1LdGnxPAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZRYXQX62;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WhfXxcht
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738572175; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n4KmZoQfw8THBhrTIiwcH+di+9FGYYevhJ3k+w9c0xc=;
	b=ZRYXQX62EiH6D6fHevn7HpphdOaypDmDwrTpW7Cwo+d1b/O+2w3L2YhJAbrZenn8Ax6FS6
	c8981AUwCheJOZr5SqbnPbR7FSIjh1iZoWWzTZTjqH3MkQf2UUoTdzT93+VhuL2G2POO6z
	HLCzl+TC02gaVHILLiDqws9L3ZdTri4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738572175;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n4KmZoQfw8THBhrTIiwcH+di+9FGYYevhJ3k+w9c0xc=;
	b=WhfXxchtS4RjUIWr3l54PdGjWM1HtrSqRPzqPTTvVn4e73Mp6DkrGzkNsq2orSTcKdJQXj
	W3h2uh+1LdGnxPAw==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 1EB8B4A0551; Mon,  3 Feb 2025 09:42:55 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv/atomic: Do proper sign extension also for
 unsigned in arch_cmpxchg
In-Reply-To: <CC2D9220-F8DE-4CC8-ACAD-7B1A21E276FE@jrtc27.com> (Jessica
	Clarke's message of "Thu, 30 Jan 2025 17:21:28 +0000")
References: <mvmed0k4prh.fsf@suse.de>
	<c9cbc2be-d1fd-44ef-aa14-fd25a5ff8490@ghiti.fr>
	<mvm5xlw4anb.fsf@suse.de>
	<ac53a62e-4f89-49c9-a755-fdfa7a582337@ghiti.fr>
	<mvmwmec2t7u.fsf@suse.de>
	<CC2D9220-F8DE-4CC8-ACAD-7B1A21E276FE@jrtc27.com>
Date: Mon, 03 Feb 2025 09:42:55 +0100
Message-ID: <mvmo6zj2zcg.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Level: **
X-Spamd-Result: default: False [2.70 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	ONCE_RECEIVED(1.20)[];
	HFILTER_HELO_IP_A(1.00)[hawking.nue2.suse.org];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[hawking.nue2.suse.org];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM_SHORT(-0.09)[-0.440];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DIRECT_TO_MX(0.00)[Gnus/5.13 (Gnus v5.13)];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid]
X-Spam-Score: 2.70
X-Spamd-Bar: ++
X-Rspamd-Queue-Id: 4266E1F37C
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Flag: NO

On Jan 30 2025, Jessica Clarke wrote:

> On 30 Jan 2025, at 15:53, Andreas Schwab <schwab@suse.de> wrote:
>> 
>> On Jan 30 2025, Alexandre Ghiti wrote:
>> 
>>> a2 is used as it is passed by the calling function, so we can't be sure a2
>>> is sign extended to me, what am I missing?
>> 
>> 32-bit scalar arguments are guaranteed to be sign extended on entry.
>
> Firstly, the calling convention is irrelevant if the function is
> inlined, which this almost always will be.

This is only about the non-inlined variant.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
