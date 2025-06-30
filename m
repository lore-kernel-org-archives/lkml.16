Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3D928981B
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751285283; cv=none; b=sxZLlpAk/VUyHaVJAqqTFjr+4vRCXyrXBxQmO3yzSDwgdqlGo0WucF9fqFWhVQAVrOy7mtMeCfvnameLbAwSCn8qq0hwUSMMthaJHa7CNlydUMqAoUcSYdlKbNVNItEdeFJfcs7TBl4sSryvN1v5ekDGm21PLaiVn3lCQBPRBJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751285283; c=relaxed/simple;
	bh=loRvepv0cmUyZBC31dA/Ap2Jw9Q6U/aN5ftlrmP5Dlk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fsUqrld+Iu+knVYAfhNrIIXh5Y5Dxzv8FlYQN6or4wBZ7Zv6VbE5Cb3CptrQXp/gpp9/2lGLKJHcjzuP1fU5ljf2DiGlPP6Jasfmspa0NYrWO1NwHFnQeuk8LSETsoIgnmdbeMQRL9hXwM1tCx7L5HWJoIxXFWPjyaSxS7z5Hu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wR6nhyNC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WpjmRO8L; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qRlMvt4Q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oMpujkD7; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wR6nhyNC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WpjmRO8L";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qRlMvt4Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oMpujkD7"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3E8AD2115E;
	Mon, 30 Jun 2025 12:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751285279; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L1SQkZPtOxt/LGcSxb/WkgWDcsNlGsJ/AuGpzqFh4r0=;
	b=wR6nhyNCvIlaTklJhn1Ngb4pg/6OA/SxmJm/2n4QUhkerUBYeWWerbe88JVkdOYiNMCE8A
	nVzmbn7t6XgUlb8l8AsTt0r2oMZmbvKBCYq5p1pmQy9aqT/Jiz2sfYYtpOWgJBWSB+ACjs
	ownoZ9dpAwv5QWlAoebUyOdrPJDndBg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751285279;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L1SQkZPtOxt/LGcSxb/WkgWDcsNlGsJ/AuGpzqFh4r0=;
	b=WpjmRO8LYULHEObeg+RsQ6R3ZUvrxUJPkxTPaPSQX7M2l8lwSDD7LR4h3VWiJ2ZO+xra9X
	iS/i8V8YWy5ANyAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751285278; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L1SQkZPtOxt/LGcSxb/WkgWDcsNlGsJ/AuGpzqFh4r0=;
	b=qRlMvt4QarpLccULlAZ3Fp/9RNw3y3TwYX83J93j8fY6fNbD3oI6REA57SK4RIoKRoGj3V
	oYRjqQUT8/AlDsarqrZ95rovlwgFjM+gdVXGBtLStuoxgw32KyOGX755WNpzKbVGMyRSrF
	7MjhfQtMh7dbd8HquNmLxxpfd1mH7rA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751285278;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L1SQkZPtOxt/LGcSxb/WkgWDcsNlGsJ/AuGpzqFh4r0=;
	b=oMpujkD7vH1XjlZLx/ZyNkUSynRMWPI+NbjFsXMOiRtjC2BIMDNfgu06hJBEYX5hG9DW2B
	xr5BNnl6svlHCIAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D8E8713983;
	Mon, 30 Jun 2025 12:07:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mO+hMx1+Ymh0RAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 30 Jun 2025 12:07:57 +0000
Date: Mon, 30 Jun 2025 14:07:56 +0200
Message-ID: <87tt3xe8kj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: timer: Replace deprecated strcpy() with strscpy()
In-Reply-To: <20250630105420.1448-2-thorsten.blum@linux.dev>
References: <20250630105420.1448-2-thorsten.blum@linux.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,linutronix.de,kernel.org,gmail.com,zeniv.linux.org.uk,huawei.com,suse.de,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.80

On Mon, 30 Jun 2025 12:54:18 +0200,
Thorsten Blum wrote:
> 
> strcpy() is deprecated; use strscpy() instead.
> 
> No functional changes intended.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Applied now.  Thanks.


Takashi
