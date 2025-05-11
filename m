Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCCA22D4DA
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 14:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746973557; cv=none; b=IhNnYOnNapAF26IB6Ra/nQEkNiz0BcwFrd8/XusyblMkleKcifD6zBDjuy7tPgQ6CuFvVvb/Ac53LUUVA1dC7sRdh88vx2GhdViWNGTBuhwJC61J//WCPFSR33I+3zCg1i5q7ABDkSp05Xor7luplNv5Hf5fTJL1xvXVkZ9RUnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746973557; c=relaxed/simple;
	bh=IHk1olfBwzZMoZnRGgDebnkYYmhcTGi4xAHWUZa5DYE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LAufu3jSmbc51wk0tzjRUWT7zpXAmw2V8VbrxP/DsFlV5asHX0EoJ0Zo8tU19fwsvrtdDqsx+AQC5pDRUekSSDefJl2qAo5SqKPpYEORFzBlJcP2n2/SggUGjj8Yj8mta3OzuVnh1YzFcJIu+GHjd1lXUTGkQxf1dRqcxsleobs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KfnWw6Kf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dpp24V6p; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=d1WJQwny; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jrxFIEkB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KfnWw6Kf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dpp24V6p";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d1WJQwny";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jrxFIEkB"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A0ED81F390;
	Sun, 11 May 2025 14:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746973554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8AC2koIVeHkIpiGZ1imTC0GukYvzJbthx9ggeTpWBH8=;
	b=KfnWw6Kf9mXPMMdX0jcjCjfmwt9Nv98/+3NHeJOQheWv3gAUf0eZmd8HFaYLk9UfPIrbS5
	PbU+KQ7dEhtH6zLtL9xcqRKwB+6Q2GqOCJMW/CZcHGyaxdCKuY8B5dL/Vcfq/O7TT9DW5L
	h39TGGxCrA2j59z0Wh+Daw5BHBbXuZQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746973554;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8AC2koIVeHkIpiGZ1imTC0GukYvzJbthx9ggeTpWBH8=;
	b=dpp24V6pJ5CNQRp7rRUqoi/FeG/dXyqTjN0bqMIRaQu2Q4u+2RovyAouCshaKY0o2v2utt
	/1AHhe7HadwyXsDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=d1WJQwny;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jrxFIEkB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746973553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8AC2koIVeHkIpiGZ1imTC0GukYvzJbthx9ggeTpWBH8=;
	b=d1WJQwnyl9YXo2grC1vGn8PS3kQ+b8FYHbyFV2LfIIETggB2TnEHbjzST8+Nmmu2Z/ZDnW
	swEQDMFyW8zB0N9R1pyow16sWU6v1cUEQPxQLlHkZbyzMi8PCm3xfdCCrnB/txque8AfJx
	sAj/fmpBVvJUDtcBDhjUd2Kcetn6MF0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746973553;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8AC2koIVeHkIpiGZ1imTC0GukYvzJbthx9ggeTpWBH8=;
	b=jrxFIEkBnpBK8RmfLo3yoIxQ/cLOVALtlu47VUX8rhL8s/c0AKfln7Wo2WTNqWteWvHxFa
	Y+w+BpO0iexX/QCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 584C613690;
	Sun, 11 May 2025 14:25:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yx4MFHGzIGiBcQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 11 May 2025 14:25:53 +0000
Date: Sun, 11 May 2025 16:25:52 +0200
Message-ID: <87h61rxlzj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: intel-hdmi-audio: Replace deprecated strcpy() with strscpy()
In-Reply-To: <20250509162930.171047-2-thorsten.blum@linux.dev>
References: <20250509162930.171047-2-thorsten.blum@linux.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: A0ED81F390
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
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action

On Fri, 09 May 2025 18:29:28 +0200,
Thorsten Blum wrote:
> 
> strcpy() is deprecated; use strscpy() instead.
> 
> No functional changes intended.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Thanks, applied now.


Takashi
