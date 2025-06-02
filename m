Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1F022ACF3
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875571; cv=none; b=qDHhl9DHAeCiUBs5W0vgkDQh06538Nl9h7V9hJQ5WSamAwKMyxstPbq3xWU1I8zzTkrp+UXqGrZnbdHRfmjWwOE70lm1Wg3fs2BI5ncckFBnMnOOxd/FJlKsBYQWAI6sOwIMcuaDV+QZe//g5mvZ19ovh6Zanaz3LzIT6kJVWhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875571; c=relaxed/simple;
	bh=085F+VfQC6Aofahj6fpw4RhR2qAs0x5z1++xCfD+hCg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hrvvXOBnQGgYCoEi/bPdPpWDwuGMcvu1avUn9JeNwrEI0N4Vz1cCSznJ9RsRYNJnP+XlbuVOvrxyDvQsb5cjc0nAJ89kV9XZXvMg1OjqPr8YYQiR0O+6GNyxpGyhVMub5IYT6EqVKwCHI0W0O1AnHKoDQVNKqefi+sB2/3mnFGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q86IU2cF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PfdE9/2j; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q86IU2cF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PfdE9/2j; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q86IU2cF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PfdE9/2j";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q86IU2cF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PfdE9/2j"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 219A91F443;
	Mon,  2 Jun 2025 14:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748875568; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aS+wawCNtEIHtbvRiU6OJlp/x7y3T5bmdB1kCqnxeuw=;
	b=q86IU2cFvgXx7AJkNGJPCcRiESbRHpYdPkT9wHoxLim6ACQIHRaYqWi/WfWEq8omisZTnz
	uSAJ39EPidtEGClOVbCyzn5IJVU/ULZ4++8T1B1FWixgt2QbW6ze1dPdNiAsepiFbfIdJc
	XNuOXX/gmiv9Dcf3eyqVPCMrQZ5INlQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748875568;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aS+wawCNtEIHtbvRiU6OJlp/x7y3T5bmdB1kCqnxeuw=;
	b=PfdE9/2jPcwx7USxbx2pgBBEK20pARTEDNRqCWkyMLh6n7rh4Ua/0sbD0uP4JDND1ECSD2
	D9deOYsgwphs0/DA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748875568; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aS+wawCNtEIHtbvRiU6OJlp/x7y3T5bmdB1kCqnxeuw=;
	b=q86IU2cFvgXx7AJkNGJPCcRiESbRHpYdPkT9wHoxLim6ACQIHRaYqWi/WfWEq8omisZTnz
	uSAJ39EPidtEGClOVbCyzn5IJVU/ULZ4++8T1B1FWixgt2QbW6ze1dPdNiAsepiFbfIdJc
	XNuOXX/gmiv9Dcf3eyqVPCMrQZ5INlQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748875568;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aS+wawCNtEIHtbvRiU6OJlp/x7y3T5bmdB1kCqnxeuw=;
	b=PfdE9/2jPcwx7USxbx2pgBBEK20pARTEDNRqCWkyMLh6n7rh4Ua/0sbD0uP4JDND1ECSD2
	D9deOYsgwphs0/DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CD8AF13AE0;
	Mon,  2 Jun 2025 14:46:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Kh+dMC+5PWikXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Jun 2025 14:46:07 +0000
Date: Mon, 02 Jun 2025 16:46:07 +0200
Message-ID: <87v7pexkuo.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: <perex@perex.cz>,
	<tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<Sunil-kumar.Dommati@amd.com>,
	<alexander.deucher@amd.com>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: hda: Add new pci id for AMD GPU display HD audio controller
In-Reply-To: <20250529053838.2350071-1-Vijendar.Mukunda@amd.com>
References: <20250529053838.2350071-1-Vijendar.Mukunda@amd.com>
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
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

On Thu, 29 May 2025 07:38:13 +0200,
Vijendar Mukunda wrote:
> 
> Add new pci id for AMD GPU display HD audio controller(device id- 0xab40).
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

Applied now.  Thanks.


Takashi
