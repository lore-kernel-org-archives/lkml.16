Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A313638F80
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 08:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749456656; cv=none; b=Vqqztz9GSgKoZuAvVLtGQ1fU+xBTVn3eoufm8ok/vC4LRSkXTtCV10a0K+7XVn4fYoQZAZzXaTKjFZwrjugQKmOHRYN0wzrSt5W0Bo0ldEEbF3GreZQ49wptZFoa0zeW29ghY91j4K/cnDcG5Xl4OY9kzx7mx4KgJ46Q2FErNkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749456656; c=relaxed/simple;
	bh=I/F8iRJFzA27d/J4l6IxuXiNx5fCFVrmjq9JxH76Xys=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ltH4cGTtxo0pyp8CD9J13luLzb0Kh/lG2BX8+ysnRHI9QU1TBVQV9cmbw+YEQOcRXEBKIjWDAu4VS9preVc2ujQLcymxMGc+qO+wHCSQZIVtGgtyDC0NVnyJ8O+c3A3kPZKKiI53gzUga+vG1qMg5gQHqKofquJs3Q0tyfVyM7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=j9R54A2B; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rtdB3O4B; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dnC47jom; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bKunwmY1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="j9R54A2B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rtdB3O4B";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dnC47jom";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bKunwmY1"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D75DE21190;
	Mon,  9 Jun 2025 08:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749456653; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KFsePeMY4LZ8aLc03SJlB+r//v0HN7fAgNJknJYZjtI=;
	b=j9R54A2BILyVWwwe+Pqgc26tkXOIq6UpALqSUQTlnKHQWHHjDJ5wHcGOjJDYmtvYdkPH9g
	P+vBdZjzC48tq8pd5qsq7ydgsRkynSdXCTh/D37ds+PPuUK34Ng9eXUGX+mEYJ2/CXCvLR
	BHCWy9+RXr1nNdCY6k+tZ4rJPOo1sLw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749456653;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KFsePeMY4LZ8aLc03SJlB+r//v0HN7fAgNJknJYZjtI=;
	b=rtdB3O4BBiVEkscPZQtehHYEvmGsYxlrWj63GSNX5WbLe90Iw6DJID2tSeCu+BBJUxFaJG
	f/W0XWYDM5ohw3Cw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dnC47jom;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bKunwmY1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749456652; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KFsePeMY4LZ8aLc03SJlB+r//v0HN7fAgNJknJYZjtI=;
	b=dnC47jom8Tw/2AEq2ZY68u2sKfQmYKQcFroIY0UZmzz1xS/ruaV10OlyyzZ41gQplAPSSw
	y0vH2i0f/P4DkqdqlrflTWZa9tlUUSZRBTiK5kMDXLnnejrfHNDE+iXJ13frNhzNfs9FvZ
	ESw1IPwjpV1XvuY0NgHtg30VlAQT8Y0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749456652;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KFsePeMY4LZ8aLc03SJlB+r//v0HN7fAgNJknJYZjtI=;
	b=bKunwmY138SepDa30LNjP0NtgWGRS42JEzs9T2ZduzSMwVjVOcdyRMoQ/b97OiskY3cS3B
	PzpDyl7QdrNcupBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9AEB113A1D;
	Mon,  9 Jun 2025 08:10:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id or0xJAyXRmjjBAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Jun 2025 08:10:52 +0000
Date: Mon, 09 Jun 2025 10:10:52 +0200
Message-ID: <87zfeh72sz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] ALSA: pcm: Convert multiple {get/put}_user to user_access_begin/user_access_end()
In-Reply-To: <d2609397eafc2b55ec1f44a3f30ccec00e0c7f6e.1749455639.git.christophe.leroy@csgroup.eu>
References: <d2609397eafc2b55ec1f44a3f30ccec00e0c7f6e.1749455639.git.christophe.leroy@csgroup.eu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: D75DE21190
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51
X-Spam-Level: 

On Mon, 09 Jun 2025 10:00:38 +0200,
Christophe Leroy wrote:
> 
> With user access protection (Called SMAP on x86 or KUAP on powerpc)
> each and every call to get_user() or put_user() performs heavy
> operations to unlock and lock kernel access to userspace.
> 
> To avoid that, perform user accesses by blocks using
> user_access_begin/user_access_end() and unsafe_get_user()/
> unsafe_put_user() and alike.
> 
> As an exemple, before the patch the 9 calls to put_user() at the
> end of snd_pcm_ioctl_sync_ptr_compat() imply the following set of
> instructions about 9 times (access_ok - enable user - write - disable
> user):
>     0.00 :   c057f858:       3d 20 7f ff     lis     r9,32767
>     0.29 :   c057f85c:       39 5e 00 14     addi    r10,r30,20
>     0.77 :   c057f860:       61 29 ff fc     ori     r9,r9,65532
>     0.32 :   c057f864:       7c 0a 48 40     cmplw   r10,r9
>     0.36 :   c057f868:       41 a1 fb 58     bgt     c057f3c0 <snd_pcm_ioctl+0xbb0>
>     0.30 :   c057f86c:       3d 20 dc 00     lis     r9,-9216
>     1.95 :   c057f870:       7d 3a c3 a6     mtspr   794,r9
>     0.33 :   c057f874:       92 8a 00 00     stw     r20,0(r10)
>     0.27 :   c057f878:       3d 20 de 00     lis     r9,-8704
>     0.28 :   c057f87c:       7d 3a c3 a6     mtspr   794,r9
> ...
> 
> A perf profile shows that in total the 9 put_user() represent 36% of
> the time spent in snd_pcm_ioctl() and about 80 instructions.
> 
> With this patch everything is done in 13 instructions and represent
> only 15% of the time spent in snd_pcm_ioctl():
> 
>     0.57 :   c057f5dc:       3d 20 dc 00     lis     r9,-9216
>     0.98 :   c057f5e0:       7d 3a c3 a6     mtspr   794,r9
>     0.16 :   c057f5e4:       92 7f 00 04     stw     r19,4(r31)
>     0.63 :   c057f5e8:       93 df 00 0c     stw     r30,12(r31)
>     0.16 :   c057f5ec:       93 9f 00 10     stw     r28,16(r31)
>     4.95 :   c057f5f0:       92 9f 00 14     stw     r20,20(r31)
>     0.19 :   c057f5f4:       92 5f 00 18     stw     r18,24(r31)
>     0.49 :   c057f5f8:       92 bf 00 1c     stw     r21,28(r31)
>     0.27 :   c057f5fc:       93 7f 00 20     stw     r27,32(r31)
>     5.88 :   c057f600:       93 36 00 00     stw     r25,0(r22)
>     0.11 :   c057f604:       93 17 00 00     stw     r24,0(r23)
>     0.00 :   c057f608:       3d 20 de 00     lis     r9,-8704
>     0.79 :   c057f60c:       7d 3a c3 a6     mtspr   794,r9
> 
> Note that here the access_ok() in user_write_access_begin() is skipped
> because the exact same verification has already been performed at the
> beginning of the fonction with the call to user_read_access_begin().
> 
> A couple more can be converted as well but require
> unsafe_copy_from_user() which is not defined on x86 and arm64, so
> those are left aside for the time being and will be handled in a
> separate patch.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2: Split out the two hunks using copy_from_user() as unsafe_copy_from_user() is not implemented on x86 and arm64 yet.

Thanks for the patch.

The idea looks interesting, but the implementations with
unsafe_get_user() leads to very ugly goto lines, and that's too bad;
it makes the code flow much more difficult to follow.

I guess that, in most cases this patch tries to cover, we just use
another temporary variable for compat struct, copy fields locally,
then run copy_to_user() in a shot instead.


Takashi
