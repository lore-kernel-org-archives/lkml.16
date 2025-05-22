Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A4B1D5CE5
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747939361; cv=none; b=hClChp8Ro3sjx/9UBDVCGKdrm12wIHloOIhAw4sagQYi/nS8s0RcfVpCoAb/zktOZsvp3IdZkpm6rg+aJzZz4maTdTkVEvE2iagAh4keWMu9N76mqQsowHAjiH0s40XnlOdv02fp8A3g+KMT9c2zVKdTlsns2XqOH7k3BM25+Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747939361; c=relaxed/simple;
	bh=TU68+MuHaZ+V2rT99YhiKs+Jtl9VRqI9iPpGrxXlQoQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=syP84mbkEFsQRO/cPcvc+gUp2dILVwp99O3e2T4XfkWabhoQLOs8xoKhQmd3s3eZ1OVYyteCJplbC5+HMpOVbdkm+7yOt/cCMBtEspTsjNEVRbd5mnUgju62Z2oeM+Pc/3o/PkJEX9eK0NgckAR225pB9+SZ0dOocdMnCqV5vCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qvvrFRs/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iDQxvoUb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qvvrFRs/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iDQxvoUb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qvvrFRs/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iDQxvoUb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qvvrFRs/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iDQxvoUb"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 45E952191C;
	Thu, 22 May 2025 18:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747939029; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MRNC0M2Usv0fLv7UIfWx3OQDLNTlcrnoPK+AWpnhyaw=;
	b=qvvrFRs/0quPeZtxTgbqWT5X3YMzWs/AK6Gq7XU201+B51o5Xs+KH+Rc171Tp2zjkQbduc
	8CfF5ubD/MThzrVRNcihWmikGSVNp1Ito+hWCpjm44ZC0c4DeJ3clEi9c3M07GwJK17nSI
	XyVrWRXMI10p3t6DiXeOd5y2dQw5NNY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747939029;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MRNC0M2Usv0fLv7UIfWx3OQDLNTlcrnoPK+AWpnhyaw=;
	b=iDQxvoUbsgjcc9bkZLut5qNfE2GCgHFifO4BFZTrHxjbSjUqkZmazn0P7UFScBpZ9UkFNz
	SzXLyICaYApvJhAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="qvvrFRs/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=iDQxvoUb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747939029; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MRNC0M2Usv0fLv7UIfWx3OQDLNTlcrnoPK+AWpnhyaw=;
	b=qvvrFRs/0quPeZtxTgbqWT5X3YMzWs/AK6Gq7XU201+B51o5Xs+KH+Rc171Tp2zjkQbduc
	8CfF5ubD/MThzrVRNcihWmikGSVNp1Ito+hWCpjm44ZC0c4DeJ3clEi9c3M07GwJK17nSI
	XyVrWRXMI10p3t6DiXeOd5y2dQw5NNY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747939029;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MRNC0M2Usv0fLv7UIfWx3OQDLNTlcrnoPK+AWpnhyaw=;
	b=iDQxvoUbsgjcc9bkZLut5qNfE2GCgHFifO4BFZTrHxjbSjUqkZmazn0P7UFScBpZ9UkFNz
	SzXLyICaYApvJhAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 17823137B8;
	Thu, 22 May 2025 18:37:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hDrvBNVuL2iVXAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 May 2025 18:37:09 +0000
Date: Thu, 22 May 2025 20:37:08 +0200
Message-ID: <87y0uo7aqz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jaroslav Kysela <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,	Nicolas
 Ferre <nicolas.ferre@microchip.com>,	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Takashi Iwai <tiwai@suse.de>,	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: atmel: Replace deprecated strcpy() with strscpy()
In-Reply-To: <20250522180111.12144-2-thorsten.blum@linux.dev>
References: <20250522180111.12144-2-thorsten.blum@linux.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Bar: /
X-Spam-Flag: NO
X-Spam-Score: -0.51
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 45E952191C
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.51 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]

On Thu, 22 May 2025 20:01:09 +0200,
Thorsten Blum wrote:
> 
> strcpy() is deprecated; use strscpy() instead. Use strscpy() to copy the
> long name because there's no string to format with sprintf().
> 
> No functional changes intended.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Applied now.  Thanks.


Takashi
