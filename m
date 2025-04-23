Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00BA20E00C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745408909; cv=none; b=iB7RYV1OI0wGPi+KSI1yL3BhsCCPreW+r4bEFc4XE8KptiRnTg+p060kh5q6aqYIZeYNRLbKLnXRS+hGlUfZHJsbQbNiz46Z3xErNJpavHrJjieRqYIlP0oXxseRMmLNiPp59tc4meZFcgnkZK2VMDp2k7sKQ5oFo1TAmX51Z68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745408909; c=relaxed/simple;
	bh=yD35uR97vBk7xWcCBm15oQRNSiMnQl1zX9rUghgEyp4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MNymjuleWVGtF8TUWRsxWvdG4KePVpk4LNNnr4pVJtjfD2NUYVUBq6Oii34AMfpGvOwtqHqv7x4UESHniT0JJnjl0/1y29oWnyEXAdaMJE88kCeiT3E4JlYmpEjCq4Q73td3sxoS/Kuqrl8vyvFtuE5090dk3xrqw445Zlp5X/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GwVm5guX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=e1oT5lrY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GwVm5guX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=e1oT5lrY; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GwVm5guX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e1oT5lrY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GwVm5guX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e1oT5lrY"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 13BA61F38D;
	Wed, 23 Apr 2025 11:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745408905; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1wz3PTQnLCthgEyehHEykcK3kjIg/rWBspJNGsd6ek8=;
	b=GwVm5guXUh0jXvluZgFmoBJq5IdhAdLN1ceH+5ps0IRfvb7P1O8ly4K+/up5a6Ihp+ju3z
	Ah4+UbrkAplC7sOYOLRS4/PcLvX5xdBQazh3f6MwOcOn3ABWPqV4OF6ZAqpTk8OLuW1RMQ
	rcoB9LETTbj4KBU3Fe9zWjH/yTUHAsE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745408905;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1wz3PTQnLCthgEyehHEykcK3kjIg/rWBspJNGsd6ek8=;
	b=e1oT5lrY/LMKOvMJsUIGhLRC6wPA4j4yr38pV4qXvFGiHS86F0ZWblEeWMvrOVPwvSpySC
	ODXACYg+axvxQADw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745408905; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1wz3PTQnLCthgEyehHEykcK3kjIg/rWBspJNGsd6ek8=;
	b=GwVm5guXUh0jXvluZgFmoBJq5IdhAdLN1ceH+5ps0IRfvb7P1O8ly4K+/up5a6Ihp+ju3z
	Ah4+UbrkAplC7sOYOLRS4/PcLvX5xdBQazh3f6MwOcOn3ABWPqV4OF6ZAqpTk8OLuW1RMQ
	rcoB9LETTbj4KBU3Fe9zWjH/yTUHAsE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745408905;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1wz3PTQnLCthgEyehHEykcK3kjIg/rWBspJNGsd6ek8=;
	b=e1oT5lrY/LMKOvMJsUIGhLRC6wPA4j4yr38pV4qXvFGiHS86F0ZWblEeWMvrOVPwvSpySC
	ODXACYg+axvxQADw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D4D6C13691;
	Wed, 23 Apr 2025 11:48:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hXlxM4jTCGgaOQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 23 Apr 2025 11:48:24 +0000
Date: Wed, 23 Apr 2025 13:48:16 +0200
Message-ID: <87ldrr3xq7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>
Cc: <perex@perex.cz>,
	<tiwai@suse.com>,
	<peter.ujfalusi@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>,
	<maxtram95@gmail.com>,
	<hkallweit1@gmail.com>,
	<ranjani.sridharan@linux.intel.com>,
	<skend@chromium.org>,
	<lumag@kernel.org>,
	<chaitanya.kumar.borah@intel.com>,
	<kai.vehmanen@linux.intel.com>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<CobeChen@zhaoxin.com>,
	<TimGuo@zhaoxin.com>,
	<LeoLiu-oc@zhaoxin.com>,
	<JoanneBao@glenfly.com>
Subject: Re: [PATCH] ALSA: HDA: Add Zhaoxin HDMI Controller and Codec support
In-Reply-To: <20250423102851.57997-1-TonyWWang-oc@zhaoxin.com>
References: <20250423102851.57997-1-TonyWWang-oc@zhaoxin.com>
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
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,linux.intel.com,linux.dev,gmail.com,chromium.org,kernel.org,intel.com,vger.kernel.org,zhaoxin.com,glenfly.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Wed, 23 Apr 2025 12:28:51 +0200,
Tony W Wang-oc wrote:
> 
> Add newer Zhaoxin HD Audio PCI IDs, and HDMI codec vendor IDs.
> 
> Because Zhaoxin hardware limitation, set BDL position to 128 to
> increase interrupt interval.
> 
> To fix response write request not synced to memory when handle
> HDAC interrupt, set bus->polling_mode = 1.
> 
> Signed-off-by: Joanne Bao <JoanneBao@glenfly.com>
> Signed-off-by: Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>

Applied to for-next branch.  Thanks.


Takashi
