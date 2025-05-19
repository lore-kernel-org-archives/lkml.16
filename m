Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7686D286888
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 15:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747669830; cv=none; b=M7ZRYzlE3cOS0E72TuvvYTgt3AGnRB/t7Xs0FejVmjgxf4iiThR2g7kiHxyDsmTtImlR1qk5h5ZSe/DgySfbkZ1zlVudbMeKFYjXjmGjBrSLnyb4b5/dwcH6Gm4F47irIl4D6X3HY2SpM1RZfNQ2kCcA04SSOWEtOiZo/OGZHb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747669830; c=relaxed/simple;
	bh=qvgXC6e3QaibqpdMmxndFYWD4/98DamLngZhgZ/Ly00=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SMjgmpnMJzUNxFt7r7QHgwaa5dVvsBfnDk8CoyRnEmalbAKCluJlRmgNrhJ8dq3Yx4HocwmwfyHYqkyeCdhABzpfVnEUJq7pZS1GREtW2tk5RTtvIX6i0fHCVgBak1NOF9tjtb6N67MPTK5Ms1GUQI8Kr5kVa81ZyEvw/r7SQsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HV1+3j/x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CwFGe8OX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HV1+3j/x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CwFGe8OX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HV1+3j/x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CwFGe8OX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HV1+3j/x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CwFGe8OX"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B965022A93;
	Mon, 19 May 2025 15:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747669820; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wgNvWTyrmgYDOPgyjZI8XcylbGkqS6qTNdGeFTYMxrQ=;
	b=HV1+3j/xL4VTPgStJTY2b/YpGzNXp/PON/GFomqODNiTBKKS53i0ttXwmpupR7fmi/w7EM
	gdE0jufXp4xHmeugQBM5QEBlOCs31RtqE38vRkoV5R8m1/kLAeAy1cz0SrrQcLinqWOGPP
	6b/k+M0d17AOTtNJQ2iUQgp5ImL8Ko4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747669820;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wgNvWTyrmgYDOPgyjZI8XcylbGkqS6qTNdGeFTYMxrQ=;
	b=CwFGe8OX2iEbD1WHSGVwcDApg9fVZ3nIDEdYnuYH49HApaBe+UEHVYbUdJp32NNWtNw3Z8
	Z61/VbvF7eKYO7Bw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="HV1+3j/x";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=CwFGe8OX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747669820; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wgNvWTyrmgYDOPgyjZI8XcylbGkqS6qTNdGeFTYMxrQ=;
	b=HV1+3j/xL4VTPgStJTY2b/YpGzNXp/PON/GFomqODNiTBKKS53i0ttXwmpupR7fmi/w7EM
	gdE0jufXp4xHmeugQBM5QEBlOCs31RtqE38vRkoV5R8m1/kLAeAy1cz0SrrQcLinqWOGPP
	6b/k+M0d17AOTtNJQ2iUQgp5ImL8Ko4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747669820;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wgNvWTyrmgYDOPgyjZI8XcylbGkqS6qTNdGeFTYMxrQ=;
	b=CwFGe8OX2iEbD1WHSGVwcDApg9fVZ3nIDEdYnuYH49HApaBe+UEHVYbUdJp32NNWtNw3Z8
	Z61/VbvF7eKYO7Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9C6A71372E;
	Mon, 19 May 2025 15:50:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4TcxJTxTK2iKTgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 19 May 2025 15:50:20 +0000
Date: Mon, 19 May 2025 17:50:20 +0200
Message-ID: <871pskk3b7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: n64: Replace deprecated strcpy() with strscpy()
In-Reply-To: <20250519105628.491675-1-thorsten.blum@linux.dev>
References: <20250519105628.491675-1-thorsten.blum@linux.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: B965022A93
X-Spam-Level: 
X-Spam-Flag: NO

On Mon, 19 May 2025 12:56:25 +0200,
Thorsten Blum wrote:
> 
> strcpy() is deprecated; use strscpy() instead.
> 
> No functional changes intended.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Thanks, applied now.


Takashi
