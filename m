Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81797151986;
	Wed,  5 Feb 2025 12:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738756913; cv=none; b=dsmLNoEI2tSpTNtP1d4yCxBQL2Dm8XmhFOEOoAXA2qvCc8iyfwOKBOyD1pIQOw54ouC7aYNnMVRLS8HB9YZsPYV2OYeiHFj++eRe2HZp1RVbb2sBS/cMNlPc76ognKEDt2ZMS43u46ZZpPQLmyixDk+QTTTQ7c+nDpIj3VZ9zQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738756913; c=relaxed/simple;
	bh=6BQasaey9W7PwV1STrv5o5bzcUHC8qfu2pSTsn2njQ4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vx0+FpIh1NQLxPenNi7W75d9b+Ox/Yw1eoqRqi4IZH1tgEjGeAiC2kQTG4HV4uO8I5ZcFbizGQUjsadkroO74hH/e9cB/qegpJiOjoFQcR8rlRv24yC6Mt1KjXyqfq1wdOfBEjrFhQw1IxligtVdXZu0uOSYGDZAyi3Odc2JYcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=I6atKqAE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ctoS39UF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=I6atKqAE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ctoS39UF; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="I6atKqAE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ctoS39UF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="I6atKqAE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ctoS39UF"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C6785211F7;
	Wed,  5 Feb 2025 12:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738756909; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6CqGj5stDqragqzAWDoZyiGjBWDtRPGC39Hc2AozBl0=;
	b=I6atKqAER8ZIAC1a7aUeCddgqnsI9GVrtqv9dzpec+4cXCAT5+8joOz2bpIL32X/egmM9Q
	nkPuv1lkc3T1z+YnOiy59RRsebY2UEIzd1T1tpom472unEHhWwPqDjavpmBnyIMO2HGdfC
	Bfr6VrjNsQjPhHT0aEP0h68+V9nGmFw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738756909;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6CqGj5stDqragqzAWDoZyiGjBWDtRPGC39Hc2AozBl0=;
	b=ctoS39UFUeHRXriKTnb2ax5PJExg/sSfj5Apbxa6tcM5jLaGMV7kTBwLoJhtFr6pXeef7E
	3fZ7m9j1ALXBZ/BA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738756909; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6CqGj5stDqragqzAWDoZyiGjBWDtRPGC39Hc2AozBl0=;
	b=I6atKqAER8ZIAC1a7aUeCddgqnsI9GVrtqv9dzpec+4cXCAT5+8joOz2bpIL32X/egmM9Q
	nkPuv1lkc3T1z+YnOiy59RRsebY2UEIzd1T1tpom472unEHhWwPqDjavpmBnyIMO2HGdfC
	Bfr6VrjNsQjPhHT0aEP0h68+V9nGmFw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738756909;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6CqGj5stDqragqzAWDoZyiGjBWDtRPGC39Hc2AozBl0=;
	b=ctoS39UFUeHRXriKTnb2ax5PJExg/sSfj5Apbxa6tcM5jLaGMV7kTBwLoJhtFr6pXeef7E
	3fZ7m9j1ALXBZ/BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7D4C913694;
	Wed,  5 Feb 2025 12:01:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sjBdHS1To2fvXgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Feb 2025 12:01:49 +0000
Date: Wed, 05 Feb 2025 13:01:49 +0100
Message-ID: <87pljwzjki.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	kailang@realtek.com,
	sbinding@opensource.cirrus.com,
	simont@opensource.cirrus.com,
	josh@joshuagrisham.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH]  ALSA: hda/realtek: Limit mic boost on Positivo ARN50
In-Reply-To: <20250201143930.25089-1-edson.drosdeck@gmail.com>
References: <20250201143930.25089-1-edson.drosdeck@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -1.80
X-Spam-Flag: NO

On Sat, 01 Feb 2025 15:39:30 +0100,
Edson Juliano Drosdeck wrote:
> 
> The internal mic boost on the Positivo ARN50 is too high.
> Fix this by applying the ALC269_FIXUP_LIMIT_INT_MIC_BOOST fixup to the machine
> to limit the gain.
> 
> Signed-off-by: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>

Applied now.  Thanks.


Takashi
