Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7E623774
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 12:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743249982; cv=none; b=lOtvIRmaEsEOk1TW1CmwzBbzTfoFa3FEOm8N19WaJAWhKqXXX0fqEfcD1IWz8s3436E83a++zxiPqFpvCYecbSbFYbObhBL3bwWsej2fMGv4nTs7mh+2X1z06vQWx3NPOU3LBLNreGPgHd8H7zyht0lCawq2XXILAW1M5Ku+Wyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743249982; c=relaxed/simple;
	bh=0x8AujERAitT4iw+rpey9OJMS3R+SPsEHN9CfPxRSpo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=axp7dcCYaCp41oZbLKRh24DZmRrnBCT7oSdeeZupCjVm3rYSe7XuNgcG/rPTn3B3jzzH+zvMXQJ/OzkMDgeuzBSAArqcrV7QHnd1Ik/lGOydxzYMHRZTBHHorZR0WOIXqPTyrrmX95+ZMgAPRg+dkYE65Mr/aP7wvWg6YlVtIsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bI9z5a5A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HmRB2hZm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bI9z5a5A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HmRB2hZm; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bI9z5a5A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HmRB2hZm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bI9z5a5A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HmRB2hZm"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6C61C1F38E;
	Sat, 29 Mar 2025 12:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743249978; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VfgVxxUCnjZW9dqCqO28s5X+RY7K9TOo5QVGQoi2ixM=;
	b=bI9z5a5AFDO50EGF6rTqatH+1MDeu/gm56F4FgZdRleF9sdXbuhhs7YJ6ggDrw672/8Oj0
	RqJ41Tol0lFPSqiNYujj/pQNYNmje5dbnmchuYJGNhffny45Mif+W0l3gAU1V/3o2mfX+c
	091/+/6w0knrwWvywLBPXkZVVbYPK6k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743249978;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VfgVxxUCnjZW9dqCqO28s5X+RY7K9TOo5QVGQoi2ixM=;
	b=HmRB2hZmSJd/tgW3l+COT1yH1d8LZhYvfRDm4yu2mjiIkwrH5g9e6EbeKilMdEn1im5335
	6dXdBp/RYmVUUeAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bI9z5a5A;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HmRB2hZm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743249978; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VfgVxxUCnjZW9dqCqO28s5X+RY7K9TOo5QVGQoi2ixM=;
	b=bI9z5a5AFDO50EGF6rTqatH+1MDeu/gm56F4FgZdRleF9sdXbuhhs7YJ6ggDrw672/8Oj0
	RqJ41Tol0lFPSqiNYujj/pQNYNmje5dbnmchuYJGNhffny45Mif+W0l3gAU1V/3o2mfX+c
	091/+/6w0knrwWvywLBPXkZVVbYPK6k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743249978;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VfgVxxUCnjZW9dqCqO28s5X+RY7K9TOo5QVGQoi2ixM=;
	b=HmRB2hZmSJd/tgW3l+COT1yH1d8LZhYvfRDm4yu2mjiIkwrH5g9e6EbeKilMdEn1im5335
	6dXdBp/RYmVUUeAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 34B7113A4B;
	Sat, 29 Mar 2025 12:06:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id X3etCzri52ccOAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 29 Mar 2025 12:06:18 +0000
Date: Sat, 29 Mar 2025 13:06:17 +0100
Message-ID: <87zfh43uti.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Salvatore Bonaccorso <carnil@debian.org>
Cc: "C.D. MacEachern" <craig.daniel.maceachern@gmail.com>,
	1100928@bugs.debian.org,
	Takashi Iwai <tiwai@suse.de>,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: Bug#1100928: [regression 6.1.y] microphone no longer records (on VivoBook_ASUSLaptop TP401MARB_J401MA)
In-Reply-To: <Z-ct2D6uIN1f6UbL@eldamar.lan>
References: <174248253267.1718.4037292692790831697.reportbug@x>
	<Z95s5T6OXFPjRnKf@eldamar.lan>
	<Z-MMsp3XJyNHOlma@eldamar.lan>
	<87iknwb80x.wl-tiwai@suse.de>
	<CAJ8x=4jNhsjw_s-p5FXBk9WScPHEdUMZ0tXnhCiya8fCf_PH7w@mail.gmail.com>
	<Z-ct2D6uIN1f6UbL@eldamar.lan>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 6C61C1F38E
X-Spam-Score: -2.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,bugs.debian.org,suse.de,vger.kernel.org,lists.linux.dev];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Sat, 29 Mar 2025 00:16:40 +0100,
Salvatore Bonaccorso wrote:
> 
> Hi,
> 
> On Thu, Mar 27, 2025 at 04:39:56PM -0400, C.D. MacEachern wrote:
> > Sorry I gave up trying to get kernel build to work and troubleshooting this
> > issue. I'll stick to working kernel version. Thanks for trying to help!
> 
> Okay sad to hear that, because we need your help to track and pinpoint
> the regression.
> 
> There was a question from Takashi to provide information from
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1100928#29 and
> provide the alsa-info.sh from working and nonworking kernels.
> 
> I think that would be the next step.
> 
> Get the script: https://git.alsa-project.org/?p=alsa-utils.git;a=blob;f=alsa-info/alsa-info.sh
> 
> And if Takashi finds it usefull to test a kernel with a reverted patch
> I might be able to provide you prebuild kernel images for amd64.

The fix patch would be a trivial oneliner, and even you can work
around without patching via a module option, but I cannot say exactly
unless I get the requested logs.


Takashi
