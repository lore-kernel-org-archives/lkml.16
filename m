Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F600283140
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 07:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749455626; cv=none; b=SudvlBQvelhtsxYcKpj5OLSvRPua4nEt3aUWZbHOzfDqzYGn++jVximO6oz3YdhYCeQPT2zjlwBRxB12tBISg55B4RYSQGu+AMcSEVVEEnZegnZwKd94AzrdzWMZNwp2L/TZAm3Q2lXQZrZk8OF+HIFqFeOLVcyG2bSYidVvPQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749455626; c=relaxed/simple;
	bh=9GsLZ+EFoPG+goqQ3sE/qhPuBXkojCUutJAXDaX3vM8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sk7ssFAjhhaQZ5BJjyqdJEX70MhVChFrDd85zfTRq3o1RT+vknJnZVrshoPMSll2cSS72rqXJoDjXnQWNGYxKuKMVS2jCADPa4kik/0Hvck5eTyf3izmrkp0bRhSt5gZ7gVWM/gvnb1KE8S3Oauac1iiP2/l/LoK4OprAMc8/g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mMs16IB8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=h+QaP8jC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mMs16IB8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=h+QaP8jC; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mMs16IB8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h+QaP8jC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mMs16IB8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h+QaP8jC"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7F95921190;
	Mon,  9 Jun 2025 07:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749455623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=quxSoYRKJuTpSqofCNGtGpcfbsATU0SNQEOAN/2/ZKE=;
	b=mMs16IB8gOL5mRqGaf/nxmurQp1risj63aEfT3kSlnEhYPh1emxJRqdPAc6QNW44+5P8bt
	s15z/1beGJw/77msfRP40m7WUwDJdhjSh/8QOIF+Mx4s4FSWrSIuz/yTX05JSpCqj0l0Om
	FNao9ONk0K8BabeSoW5EC+Xzed/4agk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749455623;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=quxSoYRKJuTpSqofCNGtGpcfbsATU0SNQEOAN/2/ZKE=;
	b=h+QaP8jC0rC1NNNpOCHE7ZzLndSXilHxqzxU8Yb4kfF7gnrVBD5/sm12P7ZoQp58FHjWSs
	mug58aUBIdnhzzBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mMs16IB8;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=h+QaP8jC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749455623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=quxSoYRKJuTpSqofCNGtGpcfbsATU0SNQEOAN/2/ZKE=;
	b=mMs16IB8gOL5mRqGaf/nxmurQp1risj63aEfT3kSlnEhYPh1emxJRqdPAc6QNW44+5P8bt
	s15z/1beGJw/77msfRP40m7WUwDJdhjSh/8QOIF+Mx4s4FSWrSIuz/yTX05JSpCqj0l0Om
	FNao9ONk0K8BabeSoW5EC+Xzed/4agk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749455623;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=quxSoYRKJuTpSqofCNGtGpcfbsATU0SNQEOAN/2/ZKE=;
	b=h+QaP8jC0rC1NNNpOCHE7ZzLndSXilHxqzxU8Yb4kfF7gnrVBD5/sm12P7ZoQp58FHjWSs
	mug58aUBIdnhzzBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5297113A1D;
	Mon,  9 Jun 2025 07:53:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uprtEgeTRmjKfgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Jun 2025 07:53:43 +0000
Date: Mon, 09 Jun 2025 09:53:42 +0200
Message-ID: <8734c98i61.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Brahmajit Das <listout@listout.xyz>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	wychay@ctl.creative.com,
	tiwai@suse.com,
	perex@perex.cz
Subject: Re: [PATCH 1/1] ALSA: ctxfi: Replace deprecated strcpy() with strscpy()
In-Reply-To: <20250606204000.8156-1-listout@listout.xyz>
References: <20250606204000.8156-1-listout@listout.xyz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 7F95921190
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	URIBL_BLOCKED(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,listout.xyz:email];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Spam-Score: -3.51
X-Spam-Level: 

On Fri, 06 Jun 2025 22:40:00 +0200,
Brahmajit Das wrote:
> 
> strcpy() is deprecated; use strscpy() instead. Use strscpy() to copy the
> long name because there's no string to format with sprintf().
> 
> No functional changes intended.
> 
> Link: https://github.com/KSPP/linux/issues/88
> 
> Signed-off-by: Brahmajit Das <listout@listout.xyz>

Applied now.  Thanks.


Takashi
