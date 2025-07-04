Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B866272E46
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751613143; cv=none; b=ldGIFfHciA7mztr+rgkr0OGwPzKfb7ZZgANpzqERGX/3D12TC0uHtntmAYOn7YgsIEurOljM5qz8Lxf4w9rPOJJsbYeeQ0humCCiNNQIY8hY2dlQ++og/5lVn0o67bmnhHNuvo2j9XQAgfBN0pAuUmYr1gA8ouyEe3jIx9eptUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751613143; c=relaxed/simple;
	bh=wUGTN8iMv5up8lTmRIGIP/Jx9CPaLQPPMfIZ/wMFAw0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gDtOqSK1/iuS2zI/ovcOkGiL6W1NKg5ln5QbdT+vBHVShc138w6EHN/SnAJtsRauVumV+jJHNs3RANbO8NQ7qR7pxdU9pTcDVRVLlu8cm+PFOsRSY1TWYHHQTHoQYZwfI8xpfGfzW+7tALDCUWIwwIkR6xgMoW0iojNrhTeAZoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KQO9qE1G; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=m4Acd3pj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KQO9qE1G; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=m4Acd3pj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KQO9qE1G";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="m4Acd3pj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KQO9qE1G";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="m4Acd3pj"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5A6381F38A;
	Fri,  4 Jul 2025 07:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751613139; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z3jKnzohDpqKefDCoEq8Db2mUfTmqWIsbY/BLEwH6Ic=;
	b=KQO9qE1G7Q1oj5F+yri++n9rx3sDg1GVLLv1ZO3IjQzXKpG28MLi2cMZA6VAg+YPojTHBs
	/yolzwrFvdT8ZJVxwqAs5tXNgzz88vRUnoNZQEYdVfj2XXHxNitezumg4K/u31gYM4OHdl
	sqKkXQwyck+Sdd5r+essDxknjnbNeoI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751613139;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z3jKnzohDpqKefDCoEq8Db2mUfTmqWIsbY/BLEwH6Ic=;
	b=m4Acd3pjSpcsNLMf/onq59dbt3wHB5xEaA5pbYZ1dako2xbCApHrgxlU8BJqvCIZce2Lig
	sTHwm51pkc0TtFDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751613139; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z3jKnzohDpqKefDCoEq8Db2mUfTmqWIsbY/BLEwH6Ic=;
	b=KQO9qE1G7Q1oj5F+yri++n9rx3sDg1GVLLv1ZO3IjQzXKpG28MLi2cMZA6VAg+YPojTHBs
	/yolzwrFvdT8ZJVxwqAs5tXNgzz88vRUnoNZQEYdVfj2XXHxNitezumg4K/u31gYM4OHdl
	sqKkXQwyck+Sdd5r+essDxknjnbNeoI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751613139;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z3jKnzohDpqKefDCoEq8Db2mUfTmqWIsbY/BLEwH6Ic=;
	b=m4Acd3pjSpcsNLMf/onq59dbt3wHB5xEaA5pbYZ1dako2xbCApHrgxlU8BJqvCIZce2Lig
	sTHwm51pkc0TtFDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1A34A13757;
	Fri,  4 Jul 2025 07:12:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id e7sCBdN+Z2hCeQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 04 Jul 2025 07:12:19 +0000
Date: Fri, 04 Jul 2025 09:12:18 +0200
Message-ID: <87cyagpgz1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Wentao Liang <vulab@iscas.ac.cn>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: Remove old commented out sanity check
In-Reply-To: <20250703225238.308359-2-thorsten.blum@linux.dev>
References: <20250703225238.308359-2-thorsten.blum@linux.dev>
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
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.30

On Fri, 04 Jul 2025 00:52:36 +0200,
Thorsten Blum wrote:
> 
> The sanity check has been commented out for more than 12 years since
> commit d5657ec9f4ad ("ALSA: hda - Disable the sanity check in
> snd_hda_add_pincfg()") - remove it.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Applied now.  Thanks.


Takashi
