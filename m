Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3993215191
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 20:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743451725; cv=none; b=jPlqMyiORm8lPcGlPSbqVowI86QX+pTSjeMKENrrLyOMo9+BbNO2gMNiFUZ9uFojOZa8b3X6gJjs5KWmVjeY4qRYpAyWTaEUl6rGdvE1wfCZJcSoKmVknkCYXw2/YrgC1KTNsVMVNtHSIuRIKlGriAxZZCLglJkqh7Nz4k0KX+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743451725; c=relaxed/simple;
	bh=ksBjh/GoUbdRXtg2vBt7W1Gjfrru4Ty5MicHazTDBQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ikxnkx1VSuxXQix9jvYMp+hWwswQfb54cntU35E5wwiDhQo4ncGGN3/GuUfk67a7d1ZaKdOYwOVXRrQ0TkJAgx56KiQY8tVFxRnl2AUXDjR0CQGUZSRNFFASejoFLc8j240TfQC2CU4tGi8qs1KRfR1d5+Lqy2wBsGpyjy6Mmws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=I5bC2xF6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RF5YC24n; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=I5bC2xF6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RF5YC24n; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="I5bC2xF6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RF5YC24n";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="I5bC2xF6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RF5YC24n"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CA32E2119E;
	Mon, 31 Mar 2025 20:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743451720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AxtSZhlAxFKzw4BBK9N+f4ji1shi8sIGCG+DPES+K8E=;
	b=I5bC2xF6nDlaylLh4AAdv7nsn5oB7BO41B2+y+9MizIINY44kEfQRFgGntbCBTKk70uCSK
	deOrxgmCLXTKfbqDTVEO42uorkscnabtM/SYtJ85bnfTaa4JNKYPkWNyaZR3UaoEoCc32R
	Ldt1tWl1dSS+28oCR2yvGSekC3DkdFU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743451720;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AxtSZhlAxFKzw4BBK9N+f4ji1shi8sIGCG+DPES+K8E=;
	b=RF5YC24n1ncWpar9FZf2m6v0xaQo5z2f1LQgH//Ld8UeAKmyfHAmFHyrsGkJ6ZCuFNkgF6
	3xczLODr45fwJFAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743451720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AxtSZhlAxFKzw4BBK9N+f4ji1shi8sIGCG+DPES+K8E=;
	b=I5bC2xF6nDlaylLh4AAdv7nsn5oB7BO41B2+y+9MizIINY44kEfQRFgGntbCBTKk70uCSK
	deOrxgmCLXTKfbqDTVEO42uorkscnabtM/SYtJ85bnfTaa4JNKYPkWNyaZR3UaoEoCc32R
	Ldt1tWl1dSS+28oCR2yvGSekC3DkdFU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743451720;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AxtSZhlAxFKzw4BBK9N+f4ji1shi8sIGCG+DPES+K8E=;
	b=RF5YC24n1ncWpar9FZf2m6v0xaQo5z2f1LQgH//Ld8UeAKmyfHAmFHyrsGkJ6ZCuFNkgF6
	3xczLODr45fwJFAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3372C13A1F;
	Mon, 31 Mar 2025 20:08:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mcNfCUj26mc4HwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Mon, 31 Mar 2025 20:08:40 +0000
Date: Mon, 31 Mar 2025 21:08:30 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Ignacio Encinas <ignacio@iencinas.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	syzbot+419c4b42acc36c420ad3@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] mm: annotate data race in update_hiwater_rss
Message-ID: <qplfqar7kht2cyuqntxgzap6cha7evp4b4kj43a3fa7xhujebn@5pdd5igza3wg>
References: <20250331-mm-maxrss-data-race-v2-1-cf958e6205bf@iencinas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331-mm-maxrss-data-race-v2-1-cf958e6205bf@iencinas.com>
X-Spam-Score: -2.30
X-Spamd-Result: default: False [-2.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[419c4b42acc36c420ad3];
	RCVD_TLS_ALL(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, Mar 31, 2025 at 09:57:05PM +0200, Ignacio Encinas wrote:
> mm_struct.hiwater_rss can be accessed concurrently without proper
> synchronization as reported by KCSAN.
> 
> This data race is benign as it only affects accounting information.
> Annotate it with data_race() to make KCSAN happy.
> 
> Reported-by: syzbot+419c4b42acc36c420ad3@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/67e3390c.050a0220.1ec46.0001.GAE@google.com/
> Suggested-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>

Looks good, thank you for the contribution!
Acked-by: Pedro Falcato <pfalcato@suse.de>

--
Pedro
