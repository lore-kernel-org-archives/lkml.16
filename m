Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8306A155342
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 07:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749455533; cv=none; b=WdLPY4Tad9bjOcAFVB42EJcpWaG8dU+VFwHM6A08X+bqFdx1c8BdY+VbzfgwfU8up+GKqBM6jbJpltVYGwZgHFHSE0rvGrdmFhOgwGDqB0aX8Q94RVXMqdJQTypI+1Nm37P3VIGxw7cNNmKtJsJdyPvCEMes5fB7rU7o3sPyhVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749455533; c=relaxed/simple;
	bh=OPM7eGbMOaldKxc/2bFf5QdlGgh0zAJ0c+fdNFMeXGc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g6bqJUv38JxqFtLaxUlpL+ZdrYtdjF50Z204rA2Uo6kROuu+66hwfy0PwTGfbZFeIbB/wlGmmZ8+oG1efbxZbI4jWbVyy5duBVYM2y/pJ6PdGsX0sB2V53CY4agxsvSWqiAf6XVlVuFdxVc6TvScCwe3nNjQgFIC65ItmWqO63A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xMR7XUgE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HnH0D0fr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xMR7XUgE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HnH0D0fr; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xMR7XUgE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HnH0D0fr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xMR7XUgE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HnH0D0fr"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C85AE1F38D;
	Mon,  9 Jun 2025 07:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749455528; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xRYSusvSS/FvbGuGu+0gzqIquxGLX3BPgbbkTVTlWEY=;
	b=xMR7XUgEbNM++cX7csyRtXDVjPlrbBoOFBLqEbJ4ckVkv6NhPSpNjwffWkfDHwTT3LtrFT
	NfEicOlaz3s/kE3XHOmRlfosvUKBFhIWa9WWm7u1Mgc66xgvsBELhseBF4f7aOtdMrrPjQ
	IS5aqT+RJrpC9nGUp+ZcFsRnVvdvLUE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749455528;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xRYSusvSS/FvbGuGu+0gzqIquxGLX3BPgbbkTVTlWEY=;
	b=HnH0D0frsqzPaxY9+lPja7kY05Tesl30DEv68kal3sO0j/EBfIlpSYlSr5zi2gMpthLZI2
	FPzXOcaV5s0qcQCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749455528; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xRYSusvSS/FvbGuGu+0gzqIquxGLX3BPgbbkTVTlWEY=;
	b=xMR7XUgEbNM++cX7csyRtXDVjPlrbBoOFBLqEbJ4ckVkv6NhPSpNjwffWkfDHwTT3LtrFT
	NfEicOlaz3s/kE3XHOmRlfosvUKBFhIWa9WWm7u1Mgc66xgvsBELhseBF4f7aOtdMrrPjQ
	IS5aqT+RJrpC9nGUp+ZcFsRnVvdvLUE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749455528;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xRYSusvSS/FvbGuGu+0gzqIquxGLX3BPgbbkTVTlWEY=;
	b=HnH0D0frsqzPaxY9+lPja7kY05Tesl30DEv68kal3sO0j/EBfIlpSYlSr5zi2gMpthLZI2
	FPzXOcaV5s0qcQCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8FD7C13A1D;
	Mon,  9 Jun 2025 07:52:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Okq8IaiSRmhrfgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Jun 2025 07:52:08 +0000
Date: Mon, 09 Jun 2025 09:52:08 +0200
Message-ID: <875xh58i8n.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH] ALSA: pcm: Rewrite recalculate_boundary() to avoid costly loop
In-Reply-To: <4836e2cde653eebaf2709ebe30eec736bb8c67fd.1749202237.git.christophe.leroy@csgroup.eu>
References: <4836e2cde653eebaf2709ebe30eec736bb8c67fd.1749202237.git.christophe.leroy@csgroup.eu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,csgroup.eu:email];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Fri, 06 Jun 2025 11:44:02 +0200,
Christophe Leroy wrote:
> 
> At the time being recalculate_boundary() is implemented with a
> loop which shows up as costly in a perf profile, as depicted by
> the annotate below:
> 
>     0.00 :   c057e934:       3d 40 7f ff     lis     r10,32767
>     0.03 :   c057e938:       61 4a ff ff     ori     r10,r10,65535
>     0.21 :   c057e93c:       7d 49 50 50     subf    r10,r9,r10
>     5.39 :   c057e940:       7d 3c 4b 78     mr      r28,r9
>     2.11 :   c057e944:       55 29 08 3c     slwi    r9,r9,1
>     3.04 :   c057e948:       7c 09 50 40     cmplw   r9,r10
>     2.47 :   c057e94c:       40 81 ff f4     ble     c057e940 <snd_pcm_ioctl+0xee0>
> 
> Total: 13.2% on that simple loop.
> 
> But what the loop does is to multiply the boundary by 2 until it is
> over the wanted border. This can be avoided by using fls() to get the
> boundary value order and shift it by the appropriate number of bits at
> once.
> 
> This change provides the following profile:
> 
>     0.04 :   c057f6e8:       3d 20 7f ff     lis     r9,32767
>     0.02 :   c057f6ec:       61 29 ff ff     ori     r9,r9,65535
>     0.34 :   c057f6f0:       7d 5a 48 50     subf    r10,r26,r9
>     0.23 :   c057f6f4:       7c 1a 50 40     cmplw   r26,r10
>     0.02 :   c057f6f8:       41 81 00 20     bgt     c057f718 <snd_pcm_ioctl+0xf08>
>     0.26 :   c057f6fc:       7f 47 00 34     cntlzw  r7,r26
>     0.09 :   c057f700:       7d 48 00 34     cntlzw  r8,r10
>     0.22 :   c057f704:       7d 08 38 50     subf    r8,r8,r7
>     0.04 :   c057f708:       7f 5a 40 30     slw     r26,r26,r8
>     0.35 :   c057f70c:       7c 0a d0 40     cmplw   r10,r26
>     0.13 :   c057f710:       40 80 05 f8     bge     c057fd08 <snd_pcm_ioctl+0x14f8>
>     0.00 :   c057f714:       57 5a f8 7e     srwi    r26,r26,1
> 
> Total: 1.7% with that loopless alternative.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Applied now to for-next branch.  Thanks.


Takashi
