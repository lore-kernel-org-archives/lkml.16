Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EDB23183A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875831; cv=none; b=frl84mAaFILm5rKRzmUTY141hUfmJ5vmPngxjiV0Pi5/3ZtW9/uLVWP5/hsANTfK6RweyihRVNtSR/skFvsTFyNw0s3yVbNaQQLrr3yeNeqUQqGMQBF+TA/3VWW0Zez5r5EStfcocuttSdedNeF2/Y9KTok+QMX04vcjqlOFHzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875831; c=relaxed/simple;
	bh=cD4utyu5riOW/V88wiSLFky7g7XfLN/qhdRlEyPH7cQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D5/u/ppqKf1IRrfT7qI1W4ZxunwHelTi/pgIle51vhgyYEsyHvP/h56/ByrBekuO8YDlPAkIX6BV5PfGsnb8xkzVzQYJDVhsSJF3NbtvE2g83bNeN/AD6tclfQRX6Zjq1fJ1HIIZT4Foh9OHDwuwo/M8X0t3bxYnjn+zw+FtzvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0riFQfn/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VvDhAlkd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0riFQfn/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VvDhAlkd; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0riFQfn/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VvDhAlkd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0riFQfn/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VvDhAlkd"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 134CB219DF;
	Mon,  2 Jun 2025 14:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748875828; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7yRG/WBt5KTJudP/SPS57xZI3pNN4+BeO93PpMIaodY=;
	b=0riFQfn/O6vo82Ugquo9J2M404GjVS4vWwWrpFG4/oajj+58OCkKwjZrNxMgkfSvZZHHCD
	99SREuYjabMfSVmiI2cBPpndw0Eag+4VWtLEKTfpiwU5rvFEuZVetZnolrVcZKj/xVKJCS
	xJA6Nbl/D3SsPgXetrROMnS4HaGNHhc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748875828;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7yRG/WBt5KTJudP/SPS57xZI3pNN4+BeO93PpMIaodY=;
	b=VvDhAlkdD/zqyARal94gTpiTwPKf9mGGs2cVwn0/n/55qnj5ks3Yxvz1/ZxsVhusslI4C3
	T6BIehk82DSnOyBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="0riFQfn/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VvDhAlkd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748875828; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7yRG/WBt5KTJudP/SPS57xZI3pNN4+BeO93PpMIaodY=;
	b=0riFQfn/O6vo82Ugquo9J2M404GjVS4vWwWrpFG4/oajj+58OCkKwjZrNxMgkfSvZZHHCD
	99SREuYjabMfSVmiI2cBPpndw0Eag+4VWtLEKTfpiwU5rvFEuZVetZnolrVcZKj/xVKJCS
	xJA6Nbl/D3SsPgXetrROMnS4HaGNHhc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748875828;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7yRG/WBt5KTJudP/SPS57xZI3pNN4+BeO93PpMIaodY=;
	b=VvDhAlkdD/zqyARal94gTpiTwPKf9mGGs2cVwn0/n/55qnj5ks3Yxvz1/ZxsVhusslI4C3
	T6BIehk82DSnOyBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CB70313AE0;
	Mon,  2 Jun 2025 14:50:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vfLxLzO6PWgGXwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Jun 2025 14:50:27 +0000
Date: Mon, 02 Jun 2025 16:50:27 +0200
Message-ID: <87plfmxkng.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "David Heimann" <d@dmeh.net>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add implicit feedback quirk for RODE AI-1
In-Reply-To: <084dc88c-1193-4a94-a002-5599adff936c@app.fastmail.com>
References: <084dc88c-1193-4a94-a002-5599adff936c@app.fastmail.com>
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
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 134CB219DF
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.51

On Sun, 01 Jun 2025 18:41:16 +0200,
David Heimann wrote:
> 
> The RODE AI-1 audio interface requires implicit feedback sync between playback endpoint 0x03 and feedback endpoint 0x84 on interface 3, but doesn't advertise this in its USB descriptors.
> 
> Without this quirk, the device receives audio data but produces no output.
> 
> Signed-off-by: David Heimann <d@dmeh.net>
> ---
> Tested using module parameter:
>   options snd-usb-audio implicit_fb=1:19f7:000a
> 
> This device previously worked but stopped producing audio output (possibly after a kernel or audio subsystem update). This quirk restores functionality.
> 
> This resolves audio output on the RODE AI-1 which otherwise receives audio data but produces no sound.

Applied now.  Thanks.


Takashi
