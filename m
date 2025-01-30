Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79BB1E7668
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 15:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738252441; cv=none; b=PNbdmoszXEtg9CDBsmO0ODPWfm6hfBwNK7vEOn/36QE8AOgFyf+N81t3BMViUTlObnyShgUey3YLTcUT/UmJA3wjAqIYiY/Uco5ftjWccxkdgUavcLSLEA6eLPT4JkRzAOys4Y3Xo2nlQzZeBe5S5ExWcBarkQoZB7GRfCdF1VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738252441; c=relaxed/simple;
	bh=H+e3OlFpBmNWVWfMET5OLGzSL7cxBAmIfQN5NjbRm28=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=auDOLRckUrXGWefeT8kvEaWsQb5U9CginF8gtk1gFkC81Q4kAUH9sH6gBzSbm6txqOWurlhw/7+PXw5hjLRPiIbDiMMsjhKnkSS7OW2+tU9DVMrtNnHXnWbNk/RTX05q1mKTwEcZEour8bklLn23HR69MUewFD/V+RNtAJl7ckI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=khs6mK5s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uK2e1rJe; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hIueoExz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DaIYu31c; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="khs6mK5s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uK2e1rJe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hIueoExz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DaIYu31c"
Received: from hawking.nue2.suse.org (unknown [IPv6:2a07:de40:a101:3:92b1:1cff:fe69:ddc])
	by smtp-out1.suse.de (Postfix) with ESMTP id ECB2821119;
	Thu, 30 Jan 2025 15:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738252438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RPAJkN6OC+am6GO8NqpZY0HniVqg2hpiAus7C+OxupE=;
	b=khs6mK5swyyHFpf4usPkQ0pCcp8Xcaozpqs0SYZ9N9MjHKvW/ztn035f5iX5aimAM8Rie+
	u7SyQJfXE/9gb7L+BUUasK6OynWbtohOzB/GW5575p4aFwBMOzUN0AGZ+rXjz1vvxy8AtF
	emk8KRMU3hxzvpOZv/eVAR2VGBLD6pM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738252438;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RPAJkN6OC+am6GO8NqpZY0HniVqg2hpiAus7C+OxupE=;
	b=uK2e1rJeDgXquAqIvNL4xfZwq4Wjic1lROQupuAs0l1l4V1Bt+Pb8dm7Fb5togQswNL0k6
	MkflyO78/1fF7mDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hIueoExz;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=DaIYu31c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738252437; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RPAJkN6OC+am6GO8NqpZY0HniVqg2hpiAus7C+OxupE=;
	b=hIueoExz8w2EA9+RQGCp0zkyTsKG1tf36eI78UeOhey//shZ1a29leFllK9S9kDvlQnhXH
	Ry6zEk2IYfnii+XRRExjfpbgZal2pLvlIHGa+aaPaOSrTJaZpSaIjtttj7XQmPu6vKh7n8
	xLvM09rjdgpfD9oM11gZVQD4DTsCnII=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738252437;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RPAJkN6OC+am6GO8NqpZY0HniVqg2hpiAus7C+OxupE=;
	b=DaIYu31cjQcUKGB6NlFSCJezQxKLBj0UT3AET+YFIa7mm3waN1jTbei+1eCsFU4+lD4t48
	UgXjJ9Efv8cmXADw==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id D84AE4A03B1; Thu, 30 Jan 2025 16:53:57 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv/atomic: Do proper sign extension also for
 unsigned in arch_cmpxchg
In-Reply-To: <ac53a62e-4f89-49c9-a755-fdfa7a582337@ghiti.fr> (Alexandre
	Ghiti's message of "Thu, 30 Jan 2025 16:23:00 +0100")
References: <mvmed0k4prh.fsf@suse.de>
	<c9cbc2be-d1fd-44ef-aa14-fd25a5ff8490@ghiti.fr>
	<mvm5xlw4anb.fsf@suse.de>
	<ac53a62e-4f89-49c9-a755-fdfa7a582337@ghiti.fr>
Date: Thu, 30 Jan 2025 16:53:57 +0100
Message-ID: <mvmwmec2t7u.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Level: **
X-Spamd-Result: default: False [2.59 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	ONCE_RECEIVED(1.20)[];
	HFILTER_HELO_IP_A(1.00)[hawking.nue2.suse.org];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[hawking.nue2.suse.org];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
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
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid]
X-Spam-Score: 2.59
X-Spamd-Bar: ++
X-Rspamd-Queue-Id: ECB2821119
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Flag: NO

On Jan 30 2025, Alexandre Ghiti wrote:

> a2 is used as it is passed by the calling function, so we can't be sure a2
> is sign extended to me, what am I missing?

32-bit scalar arguments are guaranteed to be sign extended on entry.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
