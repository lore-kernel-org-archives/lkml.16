Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AE61DE884
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 16:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746029078; cv=none; b=FgXwS1PY1PKD+BUzLjNVrM2ePh54HC9ZXZlTVN+MKIdGLlUHujmH9CyKqOz7KKF5oR1nTsxn8rre6qoukR4g9yrwD2kXZbQ3z3aKocyuqIbftZGzXAfNVrH2WALwz0fybq5bx9RtFfD7mTK4Ag+aAlCMriTr0nli3CUMlhjmOPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746029078; c=relaxed/simple;
	bh=zRy7kkX/2tAa/YmE02cejl5pM77vcWhcz1pP4RJhRQA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cbga9+1hxoDi3guvAr58tRMoKz5UjWRxdfI+DAGO/RoYRUGbHGivZ6qDonKJVUTeuRAWKuzStobY/y2TxSZ2vwOPC4qcCgq0QsclO7J1zq7U1nzKWe3Gtpd821RBU49EVBjP+OCwhCGGfgPJu/Oidlo8r3oVKx2xJqqRjNDZ6Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BPeKN4LJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6MDg3x0g; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BPeKN4LJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6MDg3x0g; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BPeKN4LJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6MDg3x0g";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BPeKN4LJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6MDg3x0g"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 065A321222;
	Wed, 30 Apr 2025 16:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746029075; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n7CgZf6CEVloLW4YC4oh+syHmDeEvABJZ7UoBnBwZdQ=;
	b=BPeKN4LJHLPKOuev1EjDx9g/0CX/GCdjGz9jEdF3e/frBMbh37CdMxrN/nBbiFYPyZJ36d
	bX49lhdIhvgHqWgspCx/MiIdD29atC5HNVPzIp6eTULjEQfrCm+sU8JIbiFefM9pYl0rQR
	dZ2NmJvkvbnEh/EJM//c/mFqAgLIt00=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746029075;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n7CgZf6CEVloLW4YC4oh+syHmDeEvABJZ7UoBnBwZdQ=;
	b=6MDg3x0gXaj9E7Dhvxc21rE/mFMbEONDa+Bemrk8ap9/rnKxWy9Q2t3PKdM/RYvzTI4zkY
	XHII6YekfuNxGgAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BPeKN4LJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6MDg3x0g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746029075; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n7CgZf6CEVloLW4YC4oh+syHmDeEvABJZ7UoBnBwZdQ=;
	b=BPeKN4LJHLPKOuev1EjDx9g/0CX/GCdjGz9jEdF3e/frBMbh37CdMxrN/nBbiFYPyZJ36d
	bX49lhdIhvgHqWgspCx/MiIdD29atC5HNVPzIp6eTULjEQfrCm+sU8JIbiFefM9pYl0rQR
	dZ2NmJvkvbnEh/EJM//c/mFqAgLIt00=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746029075;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n7CgZf6CEVloLW4YC4oh+syHmDeEvABJZ7UoBnBwZdQ=;
	b=6MDg3x0gXaj9E7Dhvxc21rE/mFMbEONDa+Bemrk8ap9/rnKxWy9Q2t3PKdM/RYvzTI4zkY
	XHII6YekfuNxGgAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CA900139E7;
	Wed, 30 Apr 2025 16:04:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8KEfMBJKEmhLJwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 30 Apr 2025 16:04:34 +0000
Date: Wed, 30 Apr 2025 18:04:34 +0200
Message-ID: <87cyctd4a5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Chris Chiu <chris.chiu@canonical.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek - Add more HP laptops which need mute led fixup
In-Reply-To: <20250430101843.150833-1-chris.chiu@canonical.com>
References: <20250430101843.150833-1-chris.chiu@canonical.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 065A321222
X-Spam-Level: 
X-Spamd-Result: default: False [-5.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,canonical.com:email]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -5.51
X-Spam-Flag: NO

On Wed, 30 Apr 2025 12:18:43 +0200,
Chris Chiu wrote:
> 
> More HP EliteBook with Realtek HDA codec ALC3247 and combined CS35L56
> Amplifiers need quirk ALC236_FIXUP_HP_GPIO_LED to fix the micmute LED.
> 
> Signed-off-by: Chris Chiu <chris.chiu@canonical.com>

Thanks, applied now.


Takashi
