Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880A826157C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 12:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744203313; cv=none; b=ly+QMVhjE4TVWY7FsX3O1sZYzLpR/xsnSgpeMFzOqWBg0BZeA4FgPCjKC3ELlc1yLpNSGi+HRS/zY5c7h/5cWJFfMX39KYZDu0lawDeJff+HRf1byyUCjJ5XJFJcdFiSVJZ3PSh9w2G0yxZ0mIdfyc+NiGL8agJ+y7MLLLPJPzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744203313; c=relaxed/simple;
	bh=ef4d6/HEa7DyxMUqfBHtxsCFTuuCFXymPUY8RbWqyx4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JowNFuAbT1V/yH/REcL1O9MNllwJq26WuJWoZ+pG5QMPnA1Xz8BqB2X+OLii1wfu+e3birW/7G+mCrCeuLdffz9daVKL86SWeFpeDZVcSjmjg4ZUXjGVbx6mQsnwEPjM1MsuSLYEPg/5aE89FpjDKQIfBzy4Jn/X3nHQRWfmezQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ya+evipc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=O3n+GTUU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ya+evipc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=O3n+GTUU; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ya+evipc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="O3n+GTUU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ya+evipc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="O3n+GTUU"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 80E9D21166;
	Wed,  9 Apr 2025 12:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744203309; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U54D/g0/zmQ5bmlxq3Nx4k4L9Z2e9uKdzGzgMnmW/w4=;
	b=ya+evipcW9IbMpS/qgwAnQvh2sYPDHHW4E8ABAy1olyuMBWQkl3wbS+6k5147G6ZTqGMv+
	By5QngGq08vI2Uh7Hr7u4i+2yM2T+zV17FQqkzD5H8Yg/kNUACilQnFUdj78ctQKi0UX5a
	nhA59vub1PMPMuCuv2Bfve6X6GMjszk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744203309;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U54D/g0/zmQ5bmlxq3Nx4k4L9Z2e9uKdzGzgMnmW/w4=;
	b=O3n+GTUUCyiKGfiiLoKawIJsOfTkNJK7eAn4tatj4RyOhcMtjHXJhgGtcqeZLe4kvfmCh1
	o+Vj10WLBcIEjMAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744203309; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U54D/g0/zmQ5bmlxq3Nx4k4L9Z2e9uKdzGzgMnmW/w4=;
	b=ya+evipcW9IbMpS/qgwAnQvh2sYPDHHW4E8ABAy1olyuMBWQkl3wbS+6k5147G6ZTqGMv+
	By5QngGq08vI2Uh7Hr7u4i+2yM2T+zV17FQqkzD5H8Yg/kNUACilQnFUdj78ctQKi0UX5a
	nhA59vub1PMPMuCuv2Bfve6X6GMjszk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744203309;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U54D/g0/zmQ5bmlxq3Nx4k4L9Z2e9uKdzGzgMnmW/w4=;
	b=O3n+GTUUCyiKGfiiLoKawIJsOfTkNJK7eAn4tatj4RyOhcMtjHXJhgGtcqeZLe4kvfmCh1
	o+Vj10WLBcIEjMAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5AF1D13691;
	Wed,  9 Apr 2025 12:55:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BpUIFS1u9mdfNQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 09 Apr 2025 12:55:09 +0000
Date: Wed, 09 Apr 2025 14:55:09 +0200
Message-ID: <87h62xze8i.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ALSA: hda/cirrus_scodec_test: Don't select dependencies
In-Reply-To: <20250409114520.914079-1-rf@opensource.cirrus.com>
References: <20250409114520.914079-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,cirrus.com:email]
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 09 Apr 2025 13:45:20 +0200,
Richard Fitzgerald wrote:
> 
> Depend on SND_HDA_CIRRUS_SCODEC and GPIOLIB instead of selecting them.
> 
> KUNIT_ALL_TESTS should only build tests that have satisfied dependencies
> and test components that are already being built. It must not cause
> other stuff to be added to the build.
> 
> Fixes: 2144833e7b41 ("ALSA: hda: cirrus_scodec: Add KUnit test")
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Thanks, applied now.


Takashi
