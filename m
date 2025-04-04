Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B97418C930
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 06:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743749671; cv=none; b=mewJTFZiXjWkTCw4z+DnJwG2xEW4TztvpvQqoLCkYjFJZ7I0VGpF4seW6kDhfJJAodXA/8Rt6EOtOfOzsDRq2F120o+tURzOdjSSu9k9tyDE7uMjqvUdfB16keLjiiVicON/ea4Rr2/YR/a//KBJLU+6HnOrqGXSynMEH21IS8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743749671; c=relaxed/simple;
	bh=xMVbyCHwFmTSFiUsRdRz+WZwDQtMV90raRl5K2ATkn4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Elq6iSclyZjW6kS4Llwb0EBIT4EeO09Kgnrxi9sQr3jNij6P7aud/40ikMugde1DHMUKjWN8VYZVMgJkYz6eqm5f/q57zgMkTNxpWUAiu8nAH6B/S+SRG8rRHGMOgfaaDCJkdxsYF1l9GOvrhFeWrFb2sS0DIrmBFOTy/AfqY+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=R+sVOgX2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iiPflYXO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=R+sVOgX2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iiPflYXO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="R+sVOgX2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iiPflYXO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="R+sVOgX2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iiPflYXO"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 776F21F385;
	Fri,  4 Apr 2025 06:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743749667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9lmjj6zNiTdDv40dHv3q1k8YAjJkIDE5uiiP95uhUC4=;
	b=R+sVOgX2wSShUY9LXz9aWI/Wqne/3ONx7rtOFNwMb9ZMRmrew4uRqcQ/Ac/MloEfFipKQa
	D3m43CJRtLSIRH7EU41IhOkklzhZ/phJw0IB004GfYSwIbPstij5nHqNk5IGgV/4QHuEeU
	EpnUEHXuSyorxROqyMMzB1s3xfHDXYE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743749667;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9lmjj6zNiTdDv40dHv3q1k8YAjJkIDE5uiiP95uhUC4=;
	b=iiPflYXOMs2KGEo3RF+MDH+yN8IDqmuCetnVonOqLpwW/5ma0nS8sLCwkN6Q9UbPFRtwFX
	dGeCYquBnLY4VUDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743749667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9lmjj6zNiTdDv40dHv3q1k8YAjJkIDE5uiiP95uhUC4=;
	b=R+sVOgX2wSShUY9LXz9aWI/Wqne/3ONx7rtOFNwMb9ZMRmrew4uRqcQ/Ac/MloEfFipKQa
	D3m43CJRtLSIRH7EU41IhOkklzhZ/phJw0IB004GfYSwIbPstij5nHqNk5IGgV/4QHuEeU
	EpnUEHXuSyorxROqyMMzB1s3xfHDXYE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743749667;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9lmjj6zNiTdDv40dHv3q1k8YAjJkIDE5uiiP95uhUC4=;
	b=iiPflYXOMs2KGEo3RF+MDH+yN8IDqmuCetnVonOqLpwW/5ma0nS8sLCwkN6Q9UbPFRtwFX
	dGeCYquBnLY4VUDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3C2F113691;
	Fri,  4 Apr 2025 06:54:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uC0ADSOC72f2WgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 04 Apr 2025 06:54:27 +0000
Date: Fri, 04 Apr 2025 08:54:26 +0200
Message-ID: <87mscw4dst.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "C.D. MacEachern" <craig.daniel.maceachern@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Salvatore Bonaccorso <carnil@debian.org>,
	1100928@bugs.debian.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: Bug#1100928: [regression 6.1.y] microphone no longer records (on VivoBook_ASUSLaptop TP401MARB_J401MA)
In-Reply-To: <CAJ8x=4gN1fH6chp4C3jX1OXq2-JhbP5yUzLbqvWrAJ-u=+VNhw@mail.gmail.com>
References: <174248253267.1718.4037292692790831697.reportbug@x>
	<Z95s5T6OXFPjRnKf@eldamar.lan>
	<Z-MMsp3XJyNHOlma@eldamar.lan>
	<87iknwb80x.wl-tiwai@suse.de>
	<CAJ8x=4jNhsjw_s-p5FXBk9WScPHEdUMZ0tXnhCiya8fCf_PH7w@mail.gmail.com>
	<Z-ct2D6uIN1f6UbL@eldamar.lan>
	<87zfh43uti.wl-tiwai@suse.de>
	<CAJ8x=4ibzvVxxv7FzswtwTcYT73XaDOUr7gHWMcdxB+j8+zyyw@mail.gmail.com>
	<878qojypu6.wl-tiwai@suse.de>
	<CAJ8x=4gN1fH6chp4C3jX1OXq2-JhbP5yUzLbqvWrAJ-u=+VNhw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,debian.org,bugs.debian.org,gmail.com,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -1.80
X-Spam-Flag: NO

On Thu, 03 Apr 2025 21:05:09 +0200,
C.D. MacEachern wrote:
> 
> 
> I've added 'snd_hda_intel.model=1043:1271' to the end of
> GRUB_CMDLINE_LINUX_DEFAULT in /etc/default/grub then ran 'sudo update-grub'
> and rebooted, choose the non-working kernel, and the audio input still did not
> work. Any other ideas?

Please try the patch.  If it still doesn't work, please give
alsa-info.sh output again.


Takashi
