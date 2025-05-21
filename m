Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03ED325FA3F
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 11:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747826878; cv=none; b=aIo+P01CD1KNICvgE0iMv0c0tsj1atUA8TXOVfBM7P7q555lDwwWGeDGsCI7roiOJOy+DMGK9k/KqyQ5vt9OBL5exeqm0jLIy8EsAVwy/z2U7k+V2gK9AueL+Gs7aCHrdhcZNWxh5cFerSiJ6Eenc/b4XYGYR9Erqj1KuuPGmzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747826878; c=relaxed/simple;
	bh=5KhfHNZxlB1CBARwKAy5lt7RlIQnQoMU3qv3xI66EpQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XRkkrXTEwY2rtdMw18cGQEji70xZTrJNUSM99t4wI6zPbmkk0btD4wMwgctVTzUua3Lgcof9Lj2ygN7VJnLTHJ4haSPd2Zmc5lWa3FOfpA1f+kaYYclRmVHXguFGeMIAmJUSWk/AQAcIDY0xX5WOwV1a1wHVbh+6F5qa1/ArD4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vIz7/yhm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eL0efHeP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vIz7/yhm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eL0efHeP; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vIz7/yhm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eL0efHeP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vIz7/yhm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eL0efHeP"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0B436229FE;
	Wed, 21 May 2025 11:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747826875; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jYIcxxUNwqdMAjdDBeazqUYwztt1uaEJg9wvexDVEGk=;
	b=vIz7/yhmp88uyl+nJtFzCLfl2Oy8mhm975BDkHGRXpNHoDt9IXEEp0XKJRCgYi6v/AssEK
	/MzdtNp9McerrkxaWtipCYNt9di7emp79/hJ0H+5orIwt4IFQZ9YJfizOoNCh/n0o0bCrm
	Kahta/nKwTLgKnSMmWAVlzko4U5qxCk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747826875;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jYIcxxUNwqdMAjdDBeazqUYwztt1uaEJg9wvexDVEGk=;
	b=eL0efHePboRNevYc0UIJp22tFAhcP14fHMVcgr6j8dpeL9yZAFx6hqzaaybicJE/cKDcjS
	umYyX5OH/Br7eYAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747826875; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jYIcxxUNwqdMAjdDBeazqUYwztt1uaEJg9wvexDVEGk=;
	b=vIz7/yhmp88uyl+nJtFzCLfl2Oy8mhm975BDkHGRXpNHoDt9IXEEp0XKJRCgYi6v/AssEK
	/MzdtNp9McerrkxaWtipCYNt9di7emp79/hJ0H+5orIwt4IFQZ9YJfizOoNCh/n0o0bCrm
	Kahta/nKwTLgKnSMmWAVlzko4U5qxCk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747826875;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jYIcxxUNwqdMAjdDBeazqUYwztt1uaEJg9wvexDVEGk=;
	b=eL0efHePboRNevYc0UIJp22tFAhcP14fHMVcgr6j8dpeL9yZAFx6hqzaaybicJE/cKDcjS
	umYyX5OH/Br7eYAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C70B113888;
	Wed, 21 May 2025 11:27:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qRVEL7q4LWhvYQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 21 May 2025 11:27:54 +0000
Date: Wed, 21 May 2025 13:27:54 +0200
Message-ID: <87jz6a9pad.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] ALSA: hda/cs35l41_hda: select FW_CS_DSP
In-Reply-To: <20250520162101.3929551-1-arnd@kernel.org>
References: <20250520162101.3929551-1-arnd@kernel.org>
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
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Tue, 20 May 2025 18:20:48 +0200,
Arnd Bergmann wrote:
> 
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When compile-testing this driver, the missing FW_CS_DSP module
> causes a link failure:
> 
> aarch64-linux-ld: sound/pci/hda/cs35l41_hda.o: in function `cs35l41_shutdown_dsp':
> cs35l41_hda.c:(.text+0x7e4): undefined reference to `cs_dsp_stop'
> aarch64-linux-ld: cs35l41_hda.c:(.text+0x7ec): undefined reference to `cs_dsp_power_down'
> aarch64-linux-ld: sound/pci/hda/cs35l41_hda.o: in function `cs35l41_hda_remove':
> cs35l41_hda.c:(.text+0x14b4): undefined reference to `cs_dsp_remove'
> aarch64-linux-ld: sound/pci/hda/cs35l41_hda.o: in function `cs35l41_smart_amp.isra.0':
> cs35l41_hda.c:(.text+0x189c): undefined reference to `cs_dsp_halo_init'
> aarch64-linux-ld: cs35l41_hda.c:(.text+0x1bd4): undefined reference to `cs_dsp_power_up'
> aarch64-linux-ld: cs35l41_hda.c:(.text+0x1c38): undefined reference to `cs_dsp_run'
> aarch64-linux-ld: cs35l41_hda.c:(.text+0x1c80): undefined reference to `cs_dsp_get_ctl'
> aarch64-linux-ld: cs35l41_hda.c:(.text+0x1c90): undefined reference to `cs_dsp_coeff_read_ctrl'
> aarch64-linux-ld: cs35l41_hda.c:(.text+0x1cd4): undefined reference to `cs_dsp_get_ctl'
> aarch64-linux-ld: cs35l41_hda.c:(.text+0x1ce4): undefined reference to `cs_dsp_coeff_read_ctrl'
> 
> Fixes: bdd9ea9187c4 ("ALSA: hda/hda_cs_dsp_ctl: Delete hda_cs_dsp_ctl module")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: fix subject and Fixes line to point to the correct change

Applied now.  Thanks.


Takashi
