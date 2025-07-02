Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F037028983B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 14:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751466494; cv=none; b=XaBV5ov3+ywqrQcsKTUUeX+U/VD+97czp1mEBrr6QzmiiM0wKDndvxEvpIg3hoNqI9TORuyPaOeye08rqBrw2QKuXurB8pxrZ/i4g/WKN3xLGoBUHzeFsBQSo/XCH+Gaun+G7Ha9v4H/3gChyFDkqcw4eHAeOv7OHyvGO+k3yx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751466494; c=relaxed/simple;
	bh=3BZ0EcZ9iIT2Npi/5+c9zN+CG0dtM3domuiUCe2i5HU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K7KSpwKpBlNk8UOQXGFKVXqKOZXCi8UB5Nj0m9IwixVtfscvrSaiiS3QlnBbZu85e7NlfaP8PGph9oFXRbgsnDJOp9OXV5+Dxw9CoqA3e9QYb1KnWqlogkIZH/gdfdI61U8ycNpA6jEaU3iJlupVlr90fwjpejf9Z0nzCc8dMg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fwnDSJfT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Q6skPXuV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fwnDSJfT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Q6skPXuV; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fwnDSJfT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q6skPXuV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fwnDSJfT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q6skPXuV"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 39F5E1F38D;
	Wed,  2 Jul 2025 14:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751466491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WKn7nfpLbQdqLa3Gs0ktQFA3G6rpEXBOvOOQ2Vt1jAA=;
	b=fwnDSJfTUmwZLoHz+HjVYImTpYgkINHONMux7weGAK9eTGxFEF8vWxu68aLLsGrzGOjxA+
	3XD9NpcAq2sLyOEE9CMTbCTJN+o97A/vubuGcxiwSCVAf8XcdXPNnbW5MuXApLXF0B335q
	eeVpBdBKGid2+HivQC/XGpp3YGhjnoM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751466491;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WKn7nfpLbQdqLa3Gs0ktQFA3G6rpEXBOvOOQ2Vt1jAA=;
	b=Q6skPXuVu/qhu1XZQdhAz6pImBHp2Ymjc4l/a5NSUPi9zMLAYMCTMIM74Jn+3lcNBzfQDn
	3ok95wZx+XM71KAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751466491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WKn7nfpLbQdqLa3Gs0ktQFA3G6rpEXBOvOOQ2Vt1jAA=;
	b=fwnDSJfTUmwZLoHz+HjVYImTpYgkINHONMux7weGAK9eTGxFEF8vWxu68aLLsGrzGOjxA+
	3XD9NpcAq2sLyOEE9CMTbCTJN+o97A/vubuGcxiwSCVAf8XcdXPNnbW5MuXApLXF0B335q
	eeVpBdBKGid2+HivQC/XGpp3YGhjnoM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751466491;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WKn7nfpLbQdqLa3Gs0ktQFA3G6rpEXBOvOOQ2Vt1jAA=;
	b=Q6skPXuVu/qhu1XZQdhAz6pImBHp2Ymjc4l/a5NSUPi9zMLAYMCTMIM74Jn+3lcNBzfQDn
	3ok95wZx+XM71KAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0CC1913A54;
	Wed,  2 Jul 2025 14:28:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HGD6AftBZWiBRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 02 Jul 2025 14:28:11 +0000
Date: Wed, 02 Jul 2025 16:28:10 +0200
Message-ID: <87ms9mvf9h.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcmtest: Replace deprecated strcpy() with strscpy()
In-Reply-To: <20250701120525.185831-2-thorsten.blum@linux.dev>
References: <20250701120525.185831-2-thorsten.blum@linux.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
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
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,linux.dev:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.80

On Tue, 01 Jul 2025 14:05:25 +0200,
Thorsten Blum wrote:
> 
> strcpy() is deprecated; use strscpy() instead.
> 
> No functional changes intended.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Applied now.  Thanks.


Takashi
