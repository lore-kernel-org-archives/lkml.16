Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F5E2DA741
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 08:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749802812; cv=none; b=DvivCUR5D/mdGKnNOTIBkk9Lm/pe94nP4CbfQck3OMRqDdZtcb02CKEUqwyLSsUKca8ccgsGHfWrEDx3DtHOxWBtzUssaLtEbjz4zX/ZaH/niBnA4iv3G62HC3h7xz1hrZrpRR14G5bGjHUJTovLpLlwjOl30tXT8xRdluFpZGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749802812; c=relaxed/simple;
	bh=GSGa9mYpXFDqEXNWh+Z5O46Xsbv2j+2RtaShIlILVPM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HEf+jw1lmAHPrgy06FdEBFQ8WAJ5Dr9KfMVgLtdFGcJPqtT/nvi6zo6wd5EGdE8DY/D6ptHxj86BGccylCh7uqigotudDm2lwSf2N8TtTkffeOhfE/bHzqCTRhje+/LHDqsfqRoFeEMHQhoUVB7uHtAqNuNpE1Gqi1v9Z5l0VMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZZGevU/x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=e92A5p2+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZZGevU/x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=e92A5p2+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZZGevU/x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e92A5p2+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZZGevU/x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e92A5p2+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 06EEC21908;
	Fri, 13 Jun 2025 08:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749802809; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xSjjdUGWbLWqhVsP+MgHktHXGBgBvC/efTGixpTxlf4=;
	b=ZZGevU/x89xVgJOZTEbKMZDvn5Tl+hPxoB9sjkU2fMSQ+GaUR705u9OjOn0wXRtmIdU/3x
	wQlpkKm1nqNIhza65PmJhi6wSvkU40rrwgKK6Dv7HTVFlOthJgO8oeDXiDMX9sK2zgU9Za
	fidXexhIQ2cSwvn3P7qFsGHsPxl4skE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749802809;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xSjjdUGWbLWqhVsP+MgHktHXGBgBvC/efTGixpTxlf4=;
	b=e92A5p2+L8HUm6IeCZVSedL4ktfXlrc4FTQyxQA9HIU27brR/+qEgLeK7ItoTxEwowbIB4
	qfvwSQga3VN3iVAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749802809; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xSjjdUGWbLWqhVsP+MgHktHXGBgBvC/efTGixpTxlf4=;
	b=ZZGevU/x89xVgJOZTEbKMZDvn5Tl+hPxoB9sjkU2fMSQ+GaUR705u9OjOn0wXRtmIdU/3x
	wQlpkKm1nqNIhza65PmJhi6wSvkU40rrwgKK6Dv7HTVFlOthJgO8oeDXiDMX9sK2zgU9Za
	fidXexhIQ2cSwvn3P7qFsGHsPxl4skE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749802809;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xSjjdUGWbLWqhVsP+MgHktHXGBgBvC/efTGixpTxlf4=;
	b=e92A5p2+L8HUm6IeCZVSedL4ktfXlrc4FTQyxQA9HIU27brR/+qEgLeK7ItoTxEwowbIB4
	qfvwSQga3VN3iVAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CC2B513782;
	Fri, 13 Jun 2025 08:20:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EuqqMDjfS2gDKAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 13 Jun 2025 08:20:08 +0000
Date: Fri, 13 Jun 2025 10:20:08 +0200
Message-ID: <87msacrr2f.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v1 0/2] Add Support for ASUS NUC using CS35L41
In-Reply-To: <20250612160029.848104-1-sbinding@opensource.cirrus.com>
References: <20250612160029.848104-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Thu, 12 Jun 2025 18:00:21 +0200,
Stefan Binding wrote:
> 
> Add support for 1 amp configuration for ASUS NUC using CS35L41.
> The NUC is using 1 CS35L41 amplifier using SPI with Internal Boost.
> 
> Stefan Binding (2):
>   ALSA: hda: cs35l41: Add support for center channel in CS35L41 HDA
>   ALSA: hda/realtek: Add support for ASUS NUC using CS35L41 HDA

Applied both patches now to for-next branch.


thanks,

Takashi
