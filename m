Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FB8285C9F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 12:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751630531; cv=none; b=mcJg6VY301tL0RQ/jJ29+fHGmLTBYaF7RSAx1y6t1NfiX9Zktltgwh4ZbPdGjiFuIvOGLquWmMJWbiNMiwDg8P9nCq02UPwZI6Xz41DYfgvLzeuvR/Q/stckTTZDQDT1wR1R/xo6Ga3nuMnOYealodGzDhCAQWC1Jrnafo1R5o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751630531; c=relaxed/simple;
	bh=VyVXvW0GJCusfg2t/Z3AbgPKYnBY/yqNTPJqxs/sjSo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FSic7ZRvj19JRmqLT8bfmxl4+j7bqV8lqUokBoeli1MguqqWVcKhZ418BUGO9QaFqi5Eoax4+l/5K7+JweA4X6LlNtGyqy++zq1Un90RRH2mCi3T9d0977bRg+1CuvBOo7CrbjX/PU+MqpHfk1OWXxphbevB8vj84MqvrHvTpp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LxGjtFFI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ea49YdsV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D5G/4eWo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ze7jQaz/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LxGjtFFI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ea49YdsV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D5G/4eWo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ze7jQaz/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1CBBB1F458;
	Fri,  4 Jul 2025 12:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751630528; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ksO2cKP2xTep54j9rlHzxwNG5XzdhWH3z3gduU+w4VI=;
	b=LxGjtFFIWAdlwosTNr293wu7lP1Yt1pWNNUcSsbuGNxMfqhkUSKPsRHGTszi203GNtv1qL
	p3DJFxpU44aqNkuIr2fh2U1iXa+dxjyWuAnAWiwJVqtf2HFcLVQxEhlMmyIoyKPmA+UXc7
	PFG4sZXZqpPe45we9+ZwJL9TaxQp/Cg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751630528;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ksO2cKP2xTep54j9rlHzxwNG5XzdhWH3z3gduU+w4VI=;
	b=ea49YdsVb06RUVKqRd8LlV9yOZf1Z9MqNXDoQLczOhkspNLgTNCCQjqwdTM0V+0/EZkZwa
	+LD0Tz2zKUHi0TBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="D5G/4eWo";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="Ze7jQaz/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751630527; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ksO2cKP2xTep54j9rlHzxwNG5XzdhWH3z3gduU+w4VI=;
	b=D5G/4eWo9uIr0vKJzMwVf04JoMmj1G7zH1Ot9veBWHTTdD6OaSl4ENWGorT550zHhaK16Q
	wtdli/A8/i78T0ow+ueKvlFSRJXxjmsjgVvut2s/EttbixHGYMBJNXJuIiMR6iuY+oeUN/
	1J+A4AYqPXr/LrAxWVNcJSplRJXlX6U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751630527;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ksO2cKP2xTep54j9rlHzxwNG5XzdhWH3z3gduU+w4VI=;
	b=Ze7jQaz/CvjvkdV2ev6SxePcut4vrzM5ORLNE2DZhlMTrpNQBAS/hADrw0rPC06L+qC6nk
	YmzjjhSLP/6JQXCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C9DC713A71;
	Fri,  4 Jul 2025 12:02:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xZwaML7CZ2hoTQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 04 Jul 2025 12:02:06 +0000
Date: Fri, 04 Jul 2025 14:02:06 +0200
Message-ID: <87ms9knozl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: patches@opensource.cirrus.com
Cc: GalaxySnail <me@glxys.nl>,
    simont@opensource.cirrus.com,
    david.rhodes@cirrus.com,
    linux-kernel@vger.kernel.org,
    linux-sound@vger.kernel.org,
    lkp@intel.com,
    oe-kbuild-all@lists.linux.dev,
    perex@perex.cz,
    rf@opensource.cirrus.com,
    tiwai@suse.com
Subject: Re: [PATCH v3] ALSA: hda: add MODULE_FIRMWARE for cs35l41/cs35l56
In-Reply-To: <20250624101716.2365302-2-me@glxys.nl>
References: <002901dbe4ef$57d0cce0$077266a0$@opensource.cirrus.com>
	<20250624101716.2365302-2-me@glxys.nl>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glxys.nl:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 1CBBB1F458
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51

On Tue, 24 Jun 2025 12:17:17 +0200,
GalaxySnail wrote:
> 
> add firmware information in the .modinfo section, so that userspace
> tools can find out firmware required by cs35l41/cs35l56 kernel module
> 
> Signed-off-by: GalaxySnail <me@glxys.nl>
> ---
> Thanks for your review!
> 
> v2 -> v3: fixed typo
> v1 -> v2: fixed missing ';' in the previous patch

Cirrus people, can you review this before I merge?


thanks,

Takashi

> 
>  sound/pci/hda/cs35l41_hda.c | 2 ++
>  sound/pci/hda/cs35l56_hda.c | 4 ++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
> index d5bc81099d0d..17cdce91fdbf 100644
> --- a/sound/pci/hda/cs35l41_hda.c
> +++ b/sound/pci/hda/cs35l41_hda.c
> @@ -2085,3 +2085,5 @@ MODULE_IMPORT_NS("SND_SOC_CS_AMP_LIB");
>  MODULE_AUTHOR("Lucas Tanure, Cirrus Logic Inc, <tanureal@opensource.cirrus.com>");
>  MODULE_LICENSE("GPL");
>  MODULE_IMPORT_NS("FW_CS_DSP");
> +MODULE_FIRMWARE("cirrus/cs35l41-*.wmfw");
> +MODULE_FIRMWARE("cirrus/cs35l41-*.bin");
> diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
> index 3f2fd32f4ad9..eedd8fdd3b8b 100644
> --- a/sound/pci/hda/cs35l56_hda.c
> +++ b/sound/pci/hda/cs35l56_hda.c
> @@ -1122,3 +1122,7 @@ MODULE_IMPORT_NS("SND_SOC_CS_AMP_LIB");
>  MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
>  MODULE_AUTHOR("Simon Trimmer <simont@opensource.cirrus.com>");
>  MODULE_LICENSE("GPL");
> +MODULE_FIRMWARE("cirrus/cs35l54-*.wmfw");
> +MODULE_FIRMWARE("cirrus/cs35l54-*.bin");
> +MODULE_FIRMWARE("cirrus/cs35l56-*.wmfw");
> +MODULE_FIRMWARE("cirrus/cs35l56-*.bin");
> -- 
> 2.50.0
> 
