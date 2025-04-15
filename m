Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C7C14831E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744731930; cv=none; b=GidE0oxyJuVLmsR1tPlMWNYOOdVSInQR0Kcn63++GO+4jHKDQ47I1qakDsnL4/UtLLL248sMfnivp3p+J1W71Fys4bpPY9HkdswnJi1G7M8Ca1WdKS6tGPJAj4NCeVLw3sLIqtPNAeMn1yR6K1ST1O9RRw+CScyHWDcwXB/DUbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744731930; c=relaxed/simple;
	bh=m2fkGEVlnFm00Qqtt5fPt1VDtYCjKxwgcWjUSlP57Pw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SxQagvGw2zR+1Nix7O+xDA6FwdXQFPUVnQaZ6no/rPcbd67R3BBnhpfSR80nJtoFaf7+WLBPlcvPTfdKqsK0/O7NgTWQxYjmbDS+VY6FKJ+rdcBsFwCAxj9zz++9XjyzyDCIhC1JB2n4cXfLmia/pV5HbFYr/x27xCg6mrDM6aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kE40J6JA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BaxYHqh5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kE40J6JA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BaxYHqh5; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kE40J6JA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BaxYHqh5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kE40J6JA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BaxYHqh5"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3A85121160;
	Tue, 15 Apr 2025 15:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744731927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fwQm7pdIvsfiQ1wOvubvUNZJmn1HQbe3h8/K+LEFo3o=;
	b=kE40J6JAIiMkYm431w+zz2CE1kSs19tGjN6bU/mKmVI2bLA1F2UUI6Kn3Taxc7wqGXSH3H
	rThFm+s+qVVW0H7fAp924U86BHBnnAqRYqVyS0cny0wIBm9ubWistL4Cl0M4iNxuBprwO5
	85aReM7YEKd+EOOLatvWxyeuGCSDMTs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744731927;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fwQm7pdIvsfiQ1wOvubvUNZJmn1HQbe3h8/K+LEFo3o=;
	b=BaxYHqh5GNZSiZKxmQUm4b3c4pYlDe3pGoSnezBOaAoQ7nGLwYBuGVY7FL1dkvLvvsKpOR
	ELlX6y/hc3uchsDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kE40J6JA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BaxYHqh5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744731927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fwQm7pdIvsfiQ1wOvubvUNZJmn1HQbe3h8/K+LEFo3o=;
	b=kE40J6JAIiMkYm431w+zz2CE1kSs19tGjN6bU/mKmVI2bLA1F2UUI6Kn3Taxc7wqGXSH3H
	rThFm+s+qVVW0H7fAp924U86BHBnnAqRYqVyS0cny0wIBm9ubWistL4Cl0M4iNxuBprwO5
	85aReM7YEKd+EOOLatvWxyeuGCSDMTs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744731927;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fwQm7pdIvsfiQ1wOvubvUNZJmn1HQbe3h8/K+LEFo3o=;
	b=BaxYHqh5GNZSiZKxmQUm4b3c4pYlDe3pGoSnezBOaAoQ7nGLwYBuGVY7FL1dkvLvvsKpOR
	ELlX6y/hc3uchsDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C52A1139A1;
	Tue, 15 Apr 2025 15:45:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AoLJLhZ//mcVVQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 15 Apr 2025 15:45:26 +0000
Date: Tue, 15 Apr 2025 17:45:26 +0200
Message-ID: <87wmblxwbt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: WangYuli <wangyuli@uniontech.com>
Cc: Philipp Stanner <pstanner@redhat.com>,
	akpm@linux-foundation.org,
	guanwentao@uniontech.com,
	linux-kernel@vger.kernel.org,
	mingo@kernel.org,
	niecheng1@uniontech.com,
	tglx@linutronix.de,
	zhanjun@uniontech.com,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	SOUND <linux-sound@vger.kernel.org>
Subject: Re: [PATCH v2 5/5] ALSA: korg1212: snd_korg1212_prepare: Rename del_timer in comment
In-Reply-To: <1F0B4039A1EC1361+e24aa199-17e5-4cb3-9218-52412a60924e@uniontech.com>
References: <37A1CE32D2AEA134+20250414042251.61846-1-wangyuli@uniontech.com>
	<590769506CF46967+20250414042629.63019-5-wangyuli@uniontech.com>
	<70bb676764099754d10c4be2f095e0fb829f233a.camel@redhat.com>
	<1F0B4039A1EC1361+e24aa199-17e5-4cb3-9218-52412a60924e@uniontech.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3A85121160
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, 14 Apr 2025 13:10:39 +0200,
WangYuli wrote:
> 
> Hi Philipp Stanner,
> 
> On 2025/4/14 16:34, Philipp Stanner wrote:
> > Wouldn't it be better to just remove all that? Or at least document
> > what it is good for?
> 
> This code comes from commit 4d6dcf60b9 ("ALSA update   - documentation
>   - control API - added multi-elements to reduce memory usage   -
> improved preallocation of DMA buffers   - CS46xx driver - added
> support for secondary codec   - HDSP driver - big update     -
> firmware is loaded with hdsptool now   - pmac driver updates (fixed
> oops and beep stuff)   - VIA82xx driver updated   - ymfpci driver
> updated   - drivers updated to new PnP layer     - wavefront, ad1816a,
> cs423x, es18xx, interwave, opl3sa2, cmi8330") in the history tree [1]
> as part of a huge patch.
> 
> I couldn't find any useful information about this specific code within
> that commit.
> 
> Since I'm uncertain if we truly don't need it (this code is marked
> with "FIXME" above), I've kept this comment.
> 
> Furthermore, this driver has other sections of commented-out code as
> well, so a more comprehensive cleanup of this driver might be a better
> approach in the future.
> 
> If possible, I'd also be happy to contribute to that effort.
> 
> However, this commit isn't intended for that purpose.
> 
> Its sole aim is to clean up the comment that were missed by commit
> 8fa7292fee5c ("treewide: Switch/rename to timer_delete_sync") and
> should have been updated.
> 
> 
> [1]. https://web.git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/commit/?id=4d6dcf60b98000c204b309b529c10b2a3884789e

Yeah, the code is quite old and dirty, and this timer stuff can be
omitted completely by introducing the proper sync_stop PCM ops.
Let me rewrite the code instead.


thanks,

Takashi
