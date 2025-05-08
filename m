Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F8919D087
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 09:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746697815; cv=none; b=hdZRfoUXyMtM6yFFaMJv9X1xDrWwYY+L4E8m/EHs6+y5ech0zTHkrSc15batSPVZpWmpeoZRM6D+DGruSX7IS/x3oJ5nTBJHAL8YJQjeCfFY5OUD4qD4AWzR2DNcNZC3SAl98t/pbDANDtSiIEH2ex30rYvZkkN/mpO4mgfQ9Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746697815; c=relaxed/simple;
	bh=UMYTbAfhSz3oYez7MYIou5fHejdjBHCi0/9zaF7aZtc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RTRrpmEDQm+0rYZbRpIoWX7KmgjVyu5bYq94L1KAeXu9JVed0IUOU7O+jtn356qvsQuxuGGhCJKSF4Fw/YCmd355rlLR5Sj29jy7NcC+FeyXKW2c6W/bsMV9LnAFs3ykkqt2Yu2wywGJbTOBnNChdnJqhbgYbE+MRI74C/aLuy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L0g9gO3q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lXbMvYnO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L0g9gO3q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lXbMvYnO; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L0g9gO3q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lXbMvYnO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L0g9gO3q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lXbMvYnO"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 95DAB2117A;
	Thu,  8 May 2025 09:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746697811; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DVddMs/Um0AZ7UxaV3gqfzUVzmN9lHKdP84ZVyxCRkk=;
	b=L0g9gO3qFszvNxPdTqiSuYqEglQy+K5Wj21Vbn3+mYMvhrzpJ0PgBETlgG/g/NI72+O/Nf
	L+MXhbW1mGragnfXSWfoTEk2Mx5xNQhX4fjV8s5LxMj4vSYEdMyPUMPAFCbXEkmFbJ13Ng
	HFeH5hHkXPTovKesoBVyU6yp87vRwk0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746697811;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DVddMs/Um0AZ7UxaV3gqfzUVzmN9lHKdP84ZVyxCRkk=;
	b=lXbMvYnOrzlFMTWKrjcmiEOnKiFRuuJtu40tsNzKglwRYurNxZXmwTXvNkvtQua1rm1OCK
	9xaWBITL5pA8YRCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746697811; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DVddMs/Um0AZ7UxaV3gqfzUVzmN9lHKdP84ZVyxCRkk=;
	b=L0g9gO3qFszvNxPdTqiSuYqEglQy+K5Wj21Vbn3+mYMvhrzpJ0PgBETlgG/g/NI72+O/Nf
	L+MXhbW1mGragnfXSWfoTEk2Mx5xNQhX4fjV8s5LxMj4vSYEdMyPUMPAFCbXEkmFbJ13Ng
	HFeH5hHkXPTovKesoBVyU6yp87vRwk0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746697811;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DVddMs/Um0AZ7UxaV3gqfzUVzmN9lHKdP84ZVyxCRkk=;
	b=lXbMvYnOrzlFMTWKrjcmiEOnKiFRuuJtu40tsNzKglwRYurNxZXmwTXvNkvtQua1rm1OCK
	9xaWBITL5pA8YRCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 673AB13712;
	Thu,  8 May 2025 09:50:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VbnpF1N+HGjndgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 08 May 2025 09:50:11 +0000
Date: Thu, 08 May 2025 11:50:11 +0200
Message-ID: <87frhfv3cc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: linux@treblig.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: Remove unused snd_hda_add_nid
In-Reply-To: <20250505010922.340534-1-linux@treblig.org>
References: <20250505010922.340534-1-linux@treblig.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_NONE(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]

On Mon, 05 May 2025 03:09:22 +0200,
linux@treblig.org wrote:
> 
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> snd_hda_add_nid() last use was removed in 2014 by
> commit db8e8a9dc972 ("ALSA: hda - Remove the obsoleted static quirk codes
> from patch_cmedia.c")
> 
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Thanks, applied now.


Takashi
