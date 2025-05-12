Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACDB257421
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 07:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747036579; cv=none; b=Zu/KGH6QiLgsJZk7D9y+M3Im+0qeH3xxRJYFoR94MVDTeBzkSrapxPUZ1utQATaDXYMfBpF5jSN8fO0QKEFJc7MajY60DfGP+5opzOxK3Q/VqxivCZtSlLnIyFQlppBPNOWnVgFxrLUpY1SUhAL8XnYY3FngFzOr7t4W4sSAAio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747036579; c=relaxed/simple;
	bh=0EU4+2jK89EhyErsG3ivuot8oJE4GOEHcxesP+hdRFs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jsb+xxQFoNcR5HU/EdFa1HZ6Sw8fHYJ9GNmCejoTkmcbJwN09hF6pROQaJs5oPlk+JINKsPRXSKuwAx9nf+bzw9C9AjUcG7cUAenDnYSdPgWFCrzPGvMqNwGriCMlNlBFj+JfhGeVyOiYBCjbkVboSm/1bt0lQjYqvxLDkPj5CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EzAaN+CS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=r0CZ7qZy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bM4Deu++; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PK8ChYPY; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EzAaN+CS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="r0CZ7qZy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bM4Deu++";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PK8ChYPY"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D1569211E3;
	Mon, 12 May 2025 07:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747036575; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pgUNNz4w/3G78HwqRCGV7qEpEt71tYq4lU0/QdqjGLg=;
	b=EzAaN+CSSDDPi36iVbHlRW96fQMqtguAAj5+QNNZxjgAVNJiyve34EJ4b+Dve4HKmnJi+E
	mNEk4Q+2dz0x0bCJn86gRshLndGFrHutgI1uwtqFFWDOql2a9MDhNl+fZRLdOrLByKmTri
	5FQwkoVJiEAfJAuyDkih1R7urOVLQEc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747036575;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pgUNNz4w/3G78HwqRCGV7qEpEt71tYq4lU0/QdqjGLg=;
	b=r0CZ7qZywAiGHNzHXXiSxlJaWK08wWJUS6iCr50QPybn+vioQcLXyktiSnCKUdR7cGHaPT
	tgnJRsEseNZKbmAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bM4Deu++;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PK8ChYPY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747036574; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pgUNNz4w/3G78HwqRCGV7qEpEt71tYq4lU0/QdqjGLg=;
	b=bM4Deu++OfudXpyjLYGTCSV5SKLBcPD+eBqtLhvmUoG8kTgg25uRSRZJzrQvLTILgjokrc
	vxoOlZuAZWvxcUtZhi9h7YLNmESPReriiAvJs9CJH5WgSAbnpTuSxervmk6qJTeYJAbfDG
	XAWJ3aNlLclrcxhgxz7R6YHH5k2EcGk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747036574;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pgUNNz4w/3G78HwqRCGV7qEpEt71tYq4lU0/QdqjGLg=;
	b=PK8ChYPYhGvK++SycROBoiyf13K37uQ/P503zcVisJ6ArWCCV3baHQ6p/RDodEu96YLt5e
	DSE2FcHSypnbwPDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9B6FF1397F;
	Mon, 12 May 2025 07:56:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Q0AoJJ6pIWh/FAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 12 May 2025 07:56:14 +0000
Date: Mon, 12 May 2025 09:56:14 +0200
Message-ID: <87ldr2uush.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: linux@treblig.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	krzysztof.h1@wp.pl,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: msnd: Remove midi code
In-Reply-To: <20250511172957.1001583-1-linux@treblig.org>
References: <20250511172957.1001583-1-linux@treblig.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: D1569211E3
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[wp.pl];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,wp.pl,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim,treblig.org:email]
X-Rspamd-Action: no action

On Sun, 11 May 2025 19:29:57 +0200,
linux@treblig.org wrote:
> 
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> Nothing calls snd_msndmidi_new()
>   thus nothing sets chip->msndmidi_mpu
>     The call to snd_msndmidi_input_read is gated on that being set,
>     so snd_msndmidi_input_read() won't be called either.
> 
> This is probably a missing call to snd_msndmidi_new(), but since
> this is ancient code, it's probably best to remove it (especially
> since I don't have the hardware to test it).
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Applied now.  Thanks.


Takashi
