Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1664424290D
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747750083; cv=none; b=ExTn2GBTyiVu/sC4Ea025kBMeI/rGBlBzp20+z3ib6IxRqR4RwMxkL9Is25f14Qs25x0Bq/d2/MAulVtyMwrYOoSYk+h2HGOLjKcGj7vpEEpTuJcAzC45Gv4hl5biLehFelkgmLZqeKjTpIB0FACnSCLsXaxhaJYriN+zTyezUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747750083; c=relaxed/simple;
	bh=QFhvtj0Sl+BHz7ypHBHd0x1u03F5swOxR/cL+arqNGQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bwndl6RDeddZst1VXgfP56lQYvoxAx5nxpvJ4J8zFCxcp9r+LJrGRu73rHg+O5usI870z8fQPUeqsdauQTLnx8vs+Er8LHhb2B3JzHWuOzN0STQGdIMgd/HH1B8N9+twSDUFUqOX8OAA64q0yN4ul70eAqQu5x9tHYaSWHhIFv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UzJMLX4z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XmBgfwy2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UzJMLX4z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XmBgfwy2; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UzJMLX4z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XmBgfwy2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UzJMLX4z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XmBgfwy2"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 374B92072D;
	Tue, 20 May 2025 14:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747750080; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YJjpF2oq306QxlLhy44UfPqUCNQZRZagd6kOASBJqIY=;
	b=UzJMLX4zwu54N8ja3PVSALvOK4rAUgrVLVh2UP4MsyeXiqb1aCA4tvovLInErGMWsfNxhD
	X2/ZxXrC52TEil9n0IMqs6xRLMissLfsxF5hnnDLFfF2oK3OknEra40HJ0Tr3GXfivh3kk
	kGSLtRTSOy+fXbfucsuexuJIgBdwnaY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747750080;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YJjpF2oq306QxlLhy44UfPqUCNQZRZagd6kOASBJqIY=;
	b=XmBgfwy2bpIFGUcXzXCz4pp8BAPK4rZ/hl3VI/XnFRbU1nNZdGg89/yTTV+7gQdHcDzp7S
	vwxYhHxA2FfxxeBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747750080; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YJjpF2oq306QxlLhy44UfPqUCNQZRZagd6kOASBJqIY=;
	b=UzJMLX4zwu54N8ja3PVSALvOK4rAUgrVLVh2UP4MsyeXiqb1aCA4tvovLInErGMWsfNxhD
	X2/ZxXrC52TEil9n0IMqs6xRLMissLfsxF5hnnDLFfF2oK3OknEra40HJ0Tr3GXfivh3kk
	kGSLtRTSOy+fXbfucsuexuJIgBdwnaY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747750080;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YJjpF2oq306QxlLhy44UfPqUCNQZRZagd6kOASBJqIY=;
	b=XmBgfwy2bpIFGUcXzXCz4pp8BAPK4rZ/hl3VI/XnFRbU1nNZdGg89/yTTV+7gQdHcDzp7S
	vwxYhHxA2FfxxeBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1E7C413A3E;
	Tue, 20 May 2025 14:08:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NMSpBsCMLGieHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 20 May 2025 14:08:00 +0000
Date: Tue, 20 May 2025 16:07:44 +0200
Message-ID: <87a577qssv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Siddarth Gundu <siddarthsgml@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: amd7930: replace strcpy() with strscpy()
In-Reply-To: <20250520113012.70270-1-siddarthsgml@gmail.com>
References: <20250520113012.70270-1-siddarthsgml@gmail.com>
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
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Tue, 20 May 2025 13:30:12 +0200,
Siddarth Gundu wrote:
> 
> strcpy() is deprecated; use strscpy() instead.
> 
> Both the destination and source buffer are of fixed length
> so strscpy with 2-arguments is used.
> 
> No functional changes intended.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Siddarth Gundu <siddarthsgml@gmail.com>

Applied now.  Thanks.


Takashi
