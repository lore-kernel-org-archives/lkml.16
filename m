Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066D3231A51
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875510; cv=none; b=FCfBX+ACaaQRWPG0MAuG34CYaspvMC4xXeeDwJhOgnIBs/RfXx/08IlUPl4FbtVPLPGfQwwRoZ8TXsNRxxXidYf037wBjhFJiz5BZ63ZlZBVSw9tFDwUj8f1rOIZj9AKjGIfbgkMNGYYaG3iBPDCwtyWsogPpmiYh2sL+wsHuL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875510; c=relaxed/simple;
	bh=rocoVK1KMh9IRRHiVil/P+8CcCj29u2eAKbjYXVvmO4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MHOh2xpYCnVw5oZHZd6EITOFjizKxSGQ4puKIO4hQW2dQQkuZeDiGs2YJmV92S62clFAmVF9Ps7GMNUbv+s6pwHz2FTGuZsCCxSvssGTe+a6aEw+Zy0rcWTmZIaJHKqCr+mejWIeYpLjidosKgxeDbA1CaG3l6GF1K7zsdKZKqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ahrF4Xic; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LWscmAmc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ahrF4Xic; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LWscmAmc; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ahrF4Xic";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LWscmAmc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ahrF4Xic";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LWscmAmc"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 280E5211FB;
	Mon,  2 Jun 2025 14:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748875506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G2Fr2BBp/p4PUZT0/CMhsfVnu0eEk2kKX8C1kl9B55I=;
	b=ahrF4XicHioVza8pTVvjxSFuUl6zM6AkST3951qB4QoNlar315lLnML6YQ1rjrSZlf1yyq
	T81TW03AIdOXt3WZhPckfA6eZDeiu2mmOVjvDvlTomxjyyo/K/vcMe/Yctqh6k+UKoBn5H
	4YrjbnMjnazdgKUBkljJy8VYlbwOKR8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748875506;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G2Fr2BBp/p4PUZT0/CMhsfVnu0eEk2kKX8C1kl9B55I=;
	b=LWscmAmcbsDH6Xn9AsryDWC0je5vXaZD6+6RCAdSUZUHpWDL5PNlGfvsTn2beDSn728XFl
	pj3NjIhvR13pwyDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748875506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G2Fr2BBp/p4PUZT0/CMhsfVnu0eEk2kKX8C1kl9B55I=;
	b=ahrF4XicHioVza8pTVvjxSFuUl6zM6AkST3951qB4QoNlar315lLnML6YQ1rjrSZlf1yyq
	T81TW03AIdOXt3WZhPckfA6eZDeiu2mmOVjvDvlTomxjyyo/K/vcMe/Yctqh6k+UKoBn5H
	4YrjbnMjnazdgKUBkljJy8VYlbwOKR8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748875506;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G2Fr2BBp/p4PUZT0/CMhsfVnu0eEk2kKX8C1kl9B55I=;
	b=LWscmAmcbsDH6Xn9AsryDWC0je5vXaZD6+6RCAdSUZUHpWDL5PNlGfvsTn2beDSn728XFl
	pj3NjIhvR13pwyDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D290313AE0;
	Mon,  2 Jun 2025 14:45:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id moHJMfG4PWhlXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Jun 2025 14:45:05 +0000
Date: Mon, 02 Jun 2025 16:45:05 +0200
Message-ID: <87wm9uxkwe.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: cs35l41: Constify regmap_irq_chip
In-Reply-To: <20250528194402.567062-2-krzysztof.kozlowski@linaro.org>
References: <20250528194402.567062-2-krzysztof.kozlowski@linaro.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Wed, 28 May 2025 21:44:03 +0200,
Krzysztof Kozlowski wrote:
> 
> Static 'struct regmap_irq_chip' is not modified so can be changed to
> const for more safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied now.  Thanks.


Takashi
