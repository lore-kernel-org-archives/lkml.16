Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540F41B423D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 13:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743774435; cv=none; b=J7Q9G3jTWb2OFpJmqk6K4Q+hbpSErK13a+NSz4UDLhEuczqVGfEqcww4MS3KQG912/kuHCZL0Pz3NiNyOQ4sQdXA1qn7q8DsqZm7iIRVqXsLdNfcwIp4+IUGyjKhIZ5Zn06qQDGWEqU2SNAPpwc/mFLaK2+PvF86m6RTizcUySM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743774435; c=relaxed/simple;
	bh=CZpvuo4PohJM4PSPuECEJnxRgWNQAAoHyWNbJ0KE9Lg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RcIEOuQR8FhklLENP5vczsD1FKPvyAFFg0WW3Y+zaj7Q290VRAf3ID/7qddG+4VmZOvnb5YMMMFVWosjnMxGaOR5ftFItABYELlMsCIO0Dnf79DTNG/bfqYAYvOO4tdYEKfTeWaxr1FpnE12/4ZrvjQJDwV/GB3Z1qTwCDYu4Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XcOTpl7L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=i1OMEcEa; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XcOTpl7L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=i1OMEcEa; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XcOTpl7L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="i1OMEcEa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XcOTpl7L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="i1OMEcEa"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 922C221160;
	Fri,  4 Apr 2025 13:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743774431; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/ZpWpZchNBNZf7LZzUsmpGD1YvwOssy8MnclmriBsus=;
	b=XcOTpl7L7N2bZ5cRDCB39AT+rOICpZbxHTjE54GD0yReiMYHS3WSWj0ORUT5HzjXDa8r1D
	4UiVoZd7d8kmE618McRRZyWHtPl71eclT0KTnBvqYg08WXt4P9jutp5vkiYutln9uSiUZP
	W5lLLJfEnUdqFvAfNxR1o81bKhhmUwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743774431;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/ZpWpZchNBNZf7LZzUsmpGD1YvwOssy8MnclmriBsus=;
	b=i1OMEcEadeRvCAfdcNYjX8Oc7bKNORzUpQRhWMwadamwJGFONcmrTVygtz0YN6haAou188
	bBfjZR2QDj/3uSAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743774431; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/ZpWpZchNBNZf7LZzUsmpGD1YvwOssy8MnclmriBsus=;
	b=XcOTpl7L7N2bZ5cRDCB39AT+rOICpZbxHTjE54GD0yReiMYHS3WSWj0ORUT5HzjXDa8r1D
	4UiVoZd7d8kmE618McRRZyWHtPl71eclT0KTnBvqYg08WXt4P9jutp5vkiYutln9uSiUZP
	W5lLLJfEnUdqFvAfNxR1o81bKhhmUwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743774431;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/ZpWpZchNBNZf7LZzUsmpGD1YvwOssy8MnclmriBsus=;
	b=i1OMEcEadeRvCAfdcNYjX8Oc7bKNORzUpQRhWMwadamwJGFONcmrTVygtz0YN6haAou188
	bBfjZR2QDj/3uSAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1FA811364F;
	Fri,  4 Apr 2025 13:47:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id H9pzBt/i72dzYgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 04 Apr 2025 13:47:11 +0000
Date: Fri, 04 Apr 2025 15:47:10 +0200
Message-ID: <87plhs2g4h.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Philipp Stanner <phasta@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Maxim Mikityanskiy <maxtram95@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	He Lugang <helugang@uniontech.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Tang Bin <tangbin@cmss.chinamobile.com>,
	linux-parisc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] sound: Replace deprecated PCI functions
In-Reply-To: <20250404121911.85277-2-phasta@kernel.org>
References: <20250404121911.85277-2-phasta@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,ladisch.de,gmail.com,kernel.org,linux.dev,linux.intel.com,renesas.com,uniontech.com,baylibre.com,loongson.cn,cmss.chinamobile.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Fri, 04 Apr 2025 14:19:01 +0200,
Philipp Stanner wrote:
> 
> pcim_iomap_table() and pcim_iomap_regions() have been deprecated by the
> PCI subsystem. In sound/, they can easily be replaced with
> pcim_iomap_region().
> 
> This series was around some time in late summer last year as a single
> patch. I lost track of it for a while, but Takashi Iwai (AFAIR)
> requested that I split it by component.
> 
> So that's being done here. Feel free to squash the patches as you like.

Thanks for the patches.  I suppose those are no urgent fixes, and can
be postponed for 6.16?  If so, I'll pick them up after 6.15-rc1 merge
window is closed.


Takashi
