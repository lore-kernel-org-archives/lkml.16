Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B6014D2A0
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750668751; cv=none; b=izJ8wIb10HOEZs6memtLJbuUztk6pnxD34BKtfpNF74g5jCHAI6xEovw2aucPteXQeFP5PIeRtvLkYaxXKsf6j8Rk3MqhnhP+1QTS6Fs2uUVXUgcOkAkrrADz9oImsQ8nQlEBjNJ12LpWegX6dRiXhtjuiatoAvm03gsY6SJLqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750668751; c=relaxed/simple;
	bh=KJWqLNgr44ov9Nt7XTqCfTOgZQdq9+3m7oNS56IZMvw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MP82Az43HR+XPdGWqLbLI0x50qOWwvn6Y2up4FSK/QIIDUeQov9gXKOqN/C/U4sbqI44oKgd9UQoPchbeJeVCG7eyQ6Zv+1BazUPIvqpdTbKCAn2tmTK5MPRHq7S0ZVOaCgKWKKzgKdfhK0oh+NyOzpY3tdS1RCn9VeaYR0drkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0JZhcAFq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=g+UGvVKT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0JZhcAFq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=g+UGvVKT; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0JZhcAFq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="g+UGvVKT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0JZhcAFq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="g+UGvVKT"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CF84921186;
	Mon, 23 Jun 2025 08:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750668747; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ql9UrgN1OmhzZPKRccJHFCfyhskGVGW3Gx/UQr7M9j8=;
	b=0JZhcAFqaO1ExD5isKVwmiqYfCULuUnI8E0ez5QyMp+Rm2b1FKPswwiYlMyxZ1SVkABxcR
	kWQo1nojLLOjtw5I76szmgKutCDDz+CYcS3/wvlvOjJLkaZ/PK2zKHKYrP1AbO1cNsX4Kl
	X70WO0OvWjZhjv7atswZmzFGd6jVo08=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750668747;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ql9UrgN1OmhzZPKRccJHFCfyhskGVGW3Gx/UQr7M9j8=;
	b=g+UGvVKTK5lGIQ5YZOeaxFbVgMSYjYSMLPIvWrXgzuNkW3GGqL0AzIccfWMskEc5sS8OMU
	h/4MJQkuEFvfBnAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750668747; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ql9UrgN1OmhzZPKRccJHFCfyhskGVGW3Gx/UQr7M9j8=;
	b=0JZhcAFqaO1ExD5isKVwmiqYfCULuUnI8E0ez5QyMp+Rm2b1FKPswwiYlMyxZ1SVkABxcR
	kWQo1nojLLOjtw5I76szmgKutCDDz+CYcS3/wvlvOjJLkaZ/PK2zKHKYrP1AbO1cNsX4Kl
	X70WO0OvWjZhjv7atswZmzFGd6jVo08=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750668747;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ql9UrgN1OmhzZPKRccJHFCfyhskGVGW3Gx/UQr7M9j8=;
	b=g+UGvVKTK5lGIQ5YZOeaxFbVgMSYjYSMLPIvWrXgzuNkW3GGqL0AzIccfWMskEc5sS8OMU
	h/4MJQkuEFvfBnAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 93B7E13485;
	Mon, 23 Jun 2025 08:52:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IL+uIcsVWWjYewAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 23 Jun 2025 08:52:27 +0000
Date: Mon, 23 Jun 2025 10:52:27 +0200
Message-ID: <87y0tin8l0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: phasta@kernel.org,
	Philipp Stanner <phasta@mailbox.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	perex@perex.cz,
	tiwai@suse.com,
	andriy.shevchenko@linux.intel.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: intel8x0: Fix incorrect codec index usage in mixer for ICH4
In-Reply-To: <3c6c7fb03375bc4532c3a6af65d78226cb5b9281.camel@mailbox.org>
References: <20250621185233.4081094-1-alok.a.tiwari@oracle.com>
	<87msa0w2f2.wl-tiwai@suse.de>
	<3c6c7fb03375bc4532c3a6af65d78226cb5b9281.camel@mailbox.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Mon, 23 Jun 2025 10:02:30 +0200,
Philipp Stanner wrote:
> 
> On Sun, 2025-06-22 at 11:28 +0200, Takashi Iwai wrote:
> > On Sat, 21 Jun 2025 20:52:24 +0200,
> > Alok Tiwari wrote:
> > > 
> > > code mistakenly used a hardcoded index (codec[1]) instead of
> > > iterating, over the codec array using the loop variable i.
> > > Use codec[i] instead of codec[1] to match the loop iteration.
> > > 
> > > Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> > 
> > Applied now.  Thanks.
> 
> Shouldn't that have been a bug fix with
> 
> Fixes:
> and
> Cc: stable
> 
> ?

This change likely won't influence on the existing devices, and the
issue has been present from the very beginning of the driver code,
hence no regression.

The stuff in question is about the hardware of over 20 years ago, and
there has been no bug reports about this.  After all, all devices were
with at most two codecs, and this patch is for 3rd and 4th codecs.


thanks,

Takashi
