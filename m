Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29001185B62
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739176151; cv=none; b=IQmWLQjoAwkPCZvT07L8DmVvaXyMwSPfElMAqJdr6ih1XgaEaRvnxACBwZv1NY35oPZ2GziExTwqWav19o7M0YCWMkMwfVHi2eej5Jqj3nq/YlIfHkQRpv7ClUwh7q+n8m+FWuy4u3G7FjY4R3WshvuKrPS9pEOytpYc43LJsjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739176151; c=relaxed/simple;
	bh=rUb57qsTLfElYjtWTe2y//uiRtDFWGhtkIRUhfJfVmg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=slFfINCqT54TxDrg3gJsJQy0Q9OUei+HU+9ovTSYDrA4Gfu/l7rGusGWTH9RNwxiS+6pqtUPKWZ7AFZIKKN6aLojdvmCiWHtHrNNw8oxRhzueEhzRg4Z/W3pceJKCKNYbGRMNQUC4y3AdzAhd7c2QW78n+FizO+HWUAxUWS0L/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OaeZWlCW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rG3y5ZuJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OaeZWlCW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rG3y5ZuJ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OaeZWlCW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rG3y5ZuJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OaeZWlCW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rG3y5ZuJ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 509C21F37E;
	Mon, 10 Feb 2025 08:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739176148; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oIsSEssiz+qZXTGXmImK8j+BnssRUIYKxjq82HZHXN0=;
	b=OaeZWlCWui/dZP2ftwXje0AR4LMtCQ17Fv9D1KmwAeBfU/TeSY3ii42KcdDd9MKF5tCCJ7
	ptsUk3/lu3zJ4rqJGvQlU29PEhUIIvr9+H3fCw6FvPrzLs0wNzV3jYaWXiwdy3/x12tNTf
	rPJOzsN8MrCJZg398ZfyTxAajZcuvZg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739176148;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oIsSEssiz+qZXTGXmImK8j+BnssRUIYKxjq82HZHXN0=;
	b=rG3y5ZuJGSeaf6Zy+x5JchibT2oyJ9WLvdO0tIKhQAqIKyACW+9hK+fGKfC0v8P550Wp4B
	4NKxbP1HT+34fiAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OaeZWlCW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rG3y5ZuJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739176148; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oIsSEssiz+qZXTGXmImK8j+BnssRUIYKxjq82HZHXN0=;
	b=OaeZWlCWui/dZP2ftwXje0AR4LMtCQ17Fv9D1KmwAeBfU/TeSY3ii42KcdDd9MKF5tCCJ7
	ptsUk3/lu3zJ4rqJGvQlU29PEhUIIvr9+H3fCw6FvPrzLs0wNzV3jYaWXiwdy3/x12tNTf
	rPJOzsN8MrCJZg398ZfyTxAajZcuvZg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739176148;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oIsSEssiz+qZXTGXmImK8j+BnssRUIYKxjq82HZHXN0=;
	b=rG3y5ZuJGSeaf6Zy+x5JchibT2oyJ9WLvdO0tIKhQAqIKyACW+9hK+fGKfC0v8P550Wp4B
	4NKxbP1HT+34fiAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1AD7513707;
	Mon, 10 Feb 2025 08:29:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HiROBdS4qWdtIgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 10 Feb 2025 08:29:08 +0000
Date: Mon, 10 Feb 2025 09:29:07 +0100
Message-ID: <87ikpiursc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Nam Cao <namcao@linutronix.de>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	Zack Rusin <zack.rusin@broadcom.com>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v2 45/45] ALSA: Switch to use hrtimer_setup()
In-Reply-To: <598031332ce738c82286a158cb66eb7e735b2e79.1738746904.git.namcao@linutronix.de>
References: <cover.1738746904.git.namcao@linutronix.de>
	<598031332ce738c82286a158cb66eb7e735b2e79.1738746904.git.namcao@linutronix.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 509C21F37E
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Wed, 05 Feb 2025 11:46:33 +0100,
Nam Cao wrote:
> 
> hrtimer_setup() takes the callback function pointer as argument and
> initializes the timer completely.
> 
> Replace hrtimer_init() and the open coded initialization of
> hrtimer::function with the new setup mechanism.
> 
> Patch was created by using Coccinelle.
> 
> Acked-by: Zack Rusin <zack.rusin@broadcom.com>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Cc: Takashi Iwai <tiwai@suse.com>

Applied now to for-linus branch of sound.git tree.


thanks,

Takashi
