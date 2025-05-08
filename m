Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37941DF75A
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 09:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746697845; cv=none; b=JV51Gi/I9EUUMMxFeFJN1uwpmmPnBadXLXhRi87d9bAjfoaRneXgO+Uo0j0Ue7XuSC148GUGtIeUCANtBfACycoVkKJ03wfNyc42YTIJSXTTEBSYCPMupb0/OvqZBNr6KSueP61Zc/DTMYnE6bysSxJXAwKatvPOtl6adzRUYEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746697845; c=relaxed/simple;
	bh=ZREctUmp6r6Zg6HnU/gAww5LJGfSshPHAQY2gKG+49o=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WMxZ4eWtstyDBiYi5yLWSnScp+W1pN6gEvVIiPmnO002JXZJ6NqU8h3s1VjM7MMPdnsQFAdqaiN55JxH4aYWBzOVJB9xcmNWwhP1tDz7xGiDQRBQxF1tdWb4G74T8OHfqH2j9rkpELomNMYXQnqimMTCq/1a1DA15vik69gKh2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CsFdzj7c; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=t9eTfgpX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CsFdzj7c; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=t9eTfgpX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CsFdzj7c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="t9eTfgpX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CsFdzj7c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="t9eTfgpX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BF0EF1F385;
	Thu,  8 May 2025 09:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746697841; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LBFM1WuyxHRIMZhih6Nys2lEgE1gL9VScD3Y79jXqtI=;
	b=CsFdzj7c25po7swm7RP9LJa9h4B77FaSRfemefLJAi9A+xbQoueZocoEjhFKfrJ1FCm00Y
	NxKRB4BDI34C+J49UoJhO7GJnmkep4yozSnWzA6J60+iPYEmauGkO5TibOPHABl+kudGWB
	F/wLyi7kgi8UBchUZfyqzTE7DLn1Sao=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746697841;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LBFM1WuyxHRIMZhih6Nys2lEgE1gL9VScD3Y79jXqtI=;
	b=t9eTfgpX0ixPXmQi42VvSmX9LloHtDJsjtA88HoxoHm98jMLpIK9HGFZnegtlaeE2k860R
	0IbJCfoOuhqmxgBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746697841; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LBFM1WuyxHRIMZhih6Nys2lEgE1gL9VScD3Y79jXqtI=;
	b=CsFdzj7c25po7swm7RP9LJa9h4B77FaSRfemefLJAi9A+xbQoueZocoEjhFKfrJ1FCm00Y
	NxKRB4BDI34C+J49UoJhO7GJnmkep4yozSnWzA6J60+iPYEmauGkO5TibOPHABl+kudGWB
	F/wLyi7kgi8UBchUZfyqzTE7DLn1Sao=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746697841;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LBFM1WuyxHRIMZhih6Nys2lEgE1gL9VScD3Y79jXqtI=;
	b=t9eTfgpX0ixPXmQi42VvSmX9LloHtDJsjtA88HoxoHm98jMLpIK9HGFZnegtlaeE2k860R
	0IbJCfoOuhqmxgBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 94DDC13712;
	Thu,  8 May 2025 09:50:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CXPDInF+HGgUdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 08 May 2025 09:50:41 +0000
Date: Thu, 08 May 2025 11:50:41 +0200
Message-ID: <87ecwzv3bi.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: linux@treblig.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: Remove unused snd_hdac_stream_get_spbmaxfifo
In-Reply-To: <20250505011037.340592-1-linux@treblig.org>
References: <20250505011037.340592-1-linux@treblig.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Score: -3.30

On Mon, 05 May 2025 03:10:37 +0200,
linux@treblig.org wrote:
> 
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> snd_hdac_stream_get_spbmaxfifo() was originally added in 2015
> in commit ee8bc4df1b5a ("ALSA: hdac: Add support to enable SPIB for hdac
> ext stream")
> 
> when it was originally called snd_hdac_ext_stream_set_spbmaxfifo,
> it was renamed snd_hdac_ext_stream_get_spbmaxfifo shortly after
> and was finally renamed to snd_hdac_stream_get_spbmaxfifo in 2022.
> But it was never used.
> 
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Thanks, applied now.


Takashi
