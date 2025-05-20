Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEA224886F
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747750209; cv=none; b=WARBDFzg1D/BAyxQIVyvhJ0r/XqpikeXa2ADnZYuJrqtHtquJ44eNV0NwkxQM5I3VFc1dluilWhdXQJxAUmzJp7stORule2ZSmZqmmyKh6mWXwTB3+Sxkk1chzqLA777r4ug1iF93Aj2UxjKE2JyFsseUIDxooklKwJZElN/Vf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747750209; c=relaxed/simple;
	bh=AqHIIv8C0BOad8IBsQ0hXoLObApMCiyZTA382rwtptU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a0k0SKTFp6Wu9W9HDV8auxS3FUjTbH4CjpMN3d6hMU0/emFnaZSOi4M8w2h7xtocTkoiT0C+wVxIQLZ4gYG4OWPUh9U4WIsUvpdam7Zie2XFq5q4t6RUyp9x05Bbf7aPtPiGsCfHr2DRrxYO/mQ8kYpVU9JLORgcm6J6DdUJfa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RGoZo5K3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SRyqYu/k; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RGoZo5K3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SRyqYu/k; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RGoZo5K3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SRyqYu/k";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RGoZo5K3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SRyqYu/k"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 65A3D2073E;
	Tue, 20 May 2025 14:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747750205; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fO5EgNYSCwQM9/BhH5dixZwwMrpu1+34Cp9DPpZN6y4=;
	b=RGoZo5K3WMnVHnAkNZqWXJ3pfFD0kRQvOYVFDZdxp4Y6awG5aXBc8uj+Qngxj5SieGnPID
	CPuPgiJ4h+Eb+UHv0zWhip/E0h6TAoHWc7fmsWDOGdB1DuD5GAWKN1yE4Ul15XDfeW9Xab
	jo1dwPSLE07bVP3I/j4eovNK02/3XZw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747750205;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fO5EgNYSCwQM9/BhH5dixZwwMrpu1+34Cp9DPpZN6y4=;
	b=SRyqYu/kPjkZTu/mnd8p0I8I4cvi5YvzRYWwJg6iOssOUp9ioS4sx6j08xy65adJbxthVL
	9E6JYFTUkt6+iNDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747750205; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fO5EgNYSCwQM9/BhH5dixZwwMrpu1+34Cp9DPpZN6y4=;
	b=RGoZo5K3WMnVHnAkNZqWXJ3pfFD0kRQvOYVFDZdxp4Y6awG5aXBc8uj+Qngxj5SieGnPID
	CPuPgiJ4h+Eb+UHv0zWhip/E0h6TAoHWc7fmsWDOGdB1DuD5GAWKN1yE4Ul15XDfeW9Xab
	jo1dwPSLE07bVP3I/j4eovNK02/3XZw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747750205;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fO5EgNYSCwQM9/BhH5dixZwwMrpu1+34Cp9DPpZN6y4=;
	b=SRyqYu/kPjkZTu/mnd8p0I8I4cvi5YvzRYWwJg6iOssOUp9ioS4sx6j08xy65adJbxthVL
	9E6JYFTUkt6+iNDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 44A6013A3E;
	Tue, 20 May 2025 14:10:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id j34BED2NLGgbIAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 20 May 2025 14:10:05 +0000
Date: Tue, 20 May 2025 16:09:49 +0200
Message-ID: <877c2bqspe.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Chris Chiu <chris.chiu@canonical.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	kailang@realtek.com,
	simont@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek - Add new HP ZBook laptop with micmute led fixup
In-Reply-To: <20250520132101.120685-1-chris.chiu@canonical.com>
References: <20250520132101.120685-1-chris.chiu@canonical.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -0.30
X-Spamd-Result: default: False [-0.30 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Tue, 20 May 2025 15:21:01 +0200,
Chris Chiu wrote:
> 
> New HP ZBook with Realtek HDA codec ALC3247 needs the quirk
> ALC236_FIXUP_HP_GPIO_LED to fix the micmute LED.
> 
> Signed-off-by: Chris Chiu <chris.chiu@canonical.com>

Applied now.  Thanks.


Takashi
