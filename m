Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EF83594E
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 08:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745740990; cv=none; b=oqqMt+X0EdxbgndZtqJhlv+3TeZZbuJE7nM8Xa5w9eBhY1muSJ+S+X5ASZvCo9B2NBj6/OcpAprDhiXgrB/bwpfCfPv034OLTCbXp4ZE6e3THcO/lWGPYoqjJVbbCHkn7AnmWamDnPwRL9svGQMq/r5xgLrP9vev6G8d+jeMXxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745740990; c=relaxed/simple;
	bh=PdMah9i7xXoEqlCd/zTLRQckryaHqCfwLdwHes2Pmjw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qXqb1JFdWUtyf6P3ESVTFnFBpb8zcYttqNawqx34KErVrsut2TZKn2qLGDau00REz/j1B3oqCN8cEQAiLwRkv+wUf3JVEiTyozmG3GeEq4NJFkPEMJ5+t9OLnBMfwYnoL8IfH1/AhOIaPFtoq9xekm36dYWTfGJkqojOg/h+5uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wCR9cfsj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cGOCrq7r; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wCR9cfsj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cGOCrq7r; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wCR9cfsj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cGOCrq7r";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wCR9cfsj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cGOCrq7r"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8BD531F749;
	Sun, 27 Apr 2025 08:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745740980; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0Bq1BzvX58A05FKVFn16w/ZW2ePE1wIYPtNNSUFAJao=;
	b=wCR9cfsjF4bLZhd0j4t5NGzC8GGpelvGBRLDV/kJup9aWQBU6GBgdXx2yQB5pPya2VLcC+
	+AuivPV/ZzPEh/Mm1D6IfDBY+Vnct0CDDNrzhLbZdS454jyamXV90lJJjNQgByVQQWDAEv
	5uhFsFrwAJQe08ESmJTX6fwGAVlMEBE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745740980;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0Bq1BzvX58A05FKVFn16w/ZW2ePE1wIYPtNNSUFAJao=;
	b=cGOCrq7roFkPOi1hlK1OBqDrRIMVK69QYSNNyxnKJD1dKS9sjW9dRb56d6fXOH/kiWl56K
	yQ1IATq4zJ/DZHCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wCR9cfsj;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cGOCrq7r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745740980; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0Bq1BzvX58A05FKVFn16w/ZW2ePE1wIYPtNNSUFAJao=;
	b=wCR9cfsjF4bLZhd0j4t5NGzC8GGpelvGBRLDV/kJup9aWQBU6GBgdXx2yQB5pPya2VLcC+
	+AuivPV/ZzPEh/Mm1D6IfDBY+Vnct0CDDNrzhLbZdS454jyamXV90lJJjNQgByVQQWDAEv
	5uhFsFrwAJQe08ESmJTX6fwGAVlMEBE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745740980;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0Bq1BzvX58A05FKVFn16w/ZW2ePE1wIYPtNNSUFAJao=;
	b=cGOCrq7roFkPOi1hlK1OBqDrRIMVK69QYSNNyxnKJD1dKS9sjW9dRb56d6fXOH/kiWl56K
	yQ1IATq4zJ/DZHCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C79D13927;
	Sun, 27 Apr 2025 08:03:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GAjJFLTkDWgPKgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 27 Apr 2025 08:03:00 +0000
Date: Sun, 27 Apr 2025 10:02:59 +0200
Message-ID: <87seluxc98.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ALSA: hda/hda_cs_dsp_ctl: Delete hda_cs_dsp_ctl module
In-Reply-To: <20250424181214.66759-1-rf@opensource.cirrus.com>
References: <20250424181214.66759-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 8BD531F749
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Thu, 24 Apr 2025 20:12:14 +0200,
Richard Fitzgerald wrote:
> 
> Delete the hda_cs_dsp module and move the one array and one function
> that is used by the cs35l41_hda driver into that driver.
> 
> The cs35l41 and cs35l56 drivers stopped creating ALSA controls to
> wrap firmware controls. The reasons are explained in:
> 
> commit 312c04cee408 ("ALSA: hda: cs35l41: Stop creating ALSA Controls
> for firmware coefficients")
> 
> and
> 
> commit 34e1b1bb7324 ("ALSA: hda: cs35l56: Stop creating ALSA controls
> for firmware coefficients")
> 
> The cs35l56_hda driver now doesn't use hda_cs_dsp_ctl at all. The
> cs35l41_hda driver only uses the small array of firmware names and the
> function to read a control value. All other functions and data in
> hda_cs_dsp_ctl are unused. There is no need to keep a separate module
> for such a small amount of data and code that is only used by one driver,
> so remove the whole module.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Thanks, applied now to for-next branch.


Takashi
