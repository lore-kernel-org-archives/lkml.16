Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8236130E83E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750406496; cv=none; b=MLOziAVI5wEJAcnrwxBg3CyQ0zB5oHTg/Ct7ntBP8zZNtRDUCl0Ge/i8OUHlI7H+KsgAlgAt492MhU3QbE4DFqQeJE0jj2vshQj9y+AtaEOV8DolI29r5FRkc8z+SLElrbMAMAajzU26HtLvMyzy6Ev9Ne1Zg9sotNfW1ASNK3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750406496; c=relaxed/simple;
	bh=ei5TCEvtcygrE6+QwZHiX831z/Q2wq9Tgnp6CUfvyCw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KXHqbAP7sIJ1h0UCsQV9eNit2Nyj4yDhWcYujGGsOXLVC10Bh9sKYr3hMtzUthmh5ChuaCsv0albXRzKvVcowwuNm8NVWwvjDrxLTkq85wPY5JVzYEihXf4/OrZ58KI1hFbQX40Bnav5tPrxX0wSMgp6tEtpg2WYB0SiIIVF3T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aPq5hUkK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3k1xQNg+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uhrlvLk0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cOcdjAo3; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aPq5hUkK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3k1xQNg+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uhrlvLk0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cOcdjAo3"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1D0B721222;
	Fri, 20 Jun 2025 08:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750406488; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=50BWLZrso6w212HfOHjDgMwDQvF9dm0kjF/VQn3tiWY=;
	b=aPq5hUkK6BBeubhXu10A5mD02jzP2/U3bpKa+edlAtNKE+Dy8TJxj0MwmPFMFatliea1PE
	CHMpDoL6NdyWG6azGsamyHkTRfvUuakNQawYL+L5Xaz6W2AzPqoRMIn7oHOW5OssZTStEh
	P/MQFoYEgFz+Jh7Gkw3N9gQUnRdafD4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750406488;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=50BWLZrso6w212HfOHjDgMwDQvF9dm0kjF/VQn3tiWY=;
	b=3k1xQNg+0O/tnGRmSdmoslRFLZSgXPbbfRT50rFX76s7Pet7lEIgySSGvJzvQjTue4Ji6m
	k7plRkMxRt8E4LBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750406484; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=50BWLZrso6w212HfOHjDgMwDQvF9dm0kjF/VQn3tiWY=;
	b=uhrlvLk0ko7RrvYXXsgdcnz+ziKlB0hWNs5PceRhYNI1DLq57+tTQ3iAJMZStHZgO6l8Wa
	Hiwg5WBTtAxWkfO1881iiiKd+XDvlldB17jcl4M0wfd8WeX0k3YrDZcpz8zprCkZg0KwOv
	6i6xEPmEsVirKXcbw8s48CvhR1j5u60=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750406484;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=50BWLZrso6w212HfOHjDgMwDQvF9dm0kjF/VQn3tiWY=;
	b=cOcdjAo3qHQDzK8e91dNOg5oFIpYYEj8UJm7fGulmofM8/FMvHWs0A2YXsqfXCmC//01Z1
	sh3QxccSyofgWUDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D380D13736;
	Fri, 20 Jun 2025 08:01:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ExpIMlMVVWi5WAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Jun 2025 08:01:23 +0000
Date: Fri, 20 Jun 2025 10:01:23 +0200
Message-ID: <87v7oqx2ng.wl-tiwai@suse.de>
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
Subject: Re: [PATCH] ALSA: hda/realtek: Enable headset Mic on Positivo P15X
In-Reply-To: <20250619191215.17203-1-edson.drosdeck@gmail.com>
References: <20250619191215.17203-1-edson.drosdeck@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 

On Thu, 19 Jun 2025 21:12:15 +0200,
Edson Juliano Drosdeck wrote:
> 
> Positivo P15X is equipped with ALC269VC, and needs a fix to make
> the headset mic to work.
> Also must to limits the internal microphone boost.
> 
> Signed-off-by: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>

Thanks, applied now.


Takashi
