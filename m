Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805598BE7
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 08:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745741073; cv=none; b=juJTqkrcOHngsILrnrVXtMJUZHaW8FpV0TwYuaL80Q9BxgQ0Mn1Q81i2IP/Xfx5nYwQ/LVQeIt5McIutsO6mlRgRNgqrJREKaekZZDDjRAd+M+zQeLg9QeF5RQkJvsI/zIw4Ki3XzJRU+HpU1SftwI0wV5YhkJXfD1D4SnSkKgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745741073; c=relaxed/simple;
	bh=WBSJc7oB+yR13DAvdQSBqLkKRXyHSO2MBCampK9h5KQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V1xMwD4ssyAo8epLXs0H7rv+0XELjYnl8oUsb/1gm8yVM6n6sB3MoGaeC73Af6Dj09+T7j5S/D4j53Ek+asUfEFO8cIuJw5RJb8vFn73y3jlxj+u0d/3+mUEDTIm2quCZzwFkRi80oXNl0/fvGj6LaJs9Bd9/Ay+vpWBRbBj3QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RrB+nrqz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ov+8iBvC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RrB+nrqz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ov+8iBvC; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RrB+nrqz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ov+8iBvC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RrB+nrqz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ov+8iBvC"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 940FA1F749;
	Sun, 27 Apr 2025 08:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745741069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/xgdygPLSQTBfZrtxZDlXzTaXvQR6hthcsY3VTYUN84=;
	b=RrB+nrqzgmS0WyplsrVf/KU8Jyo9r2OgHJwcIOnP5lyiC+DX3bdYKgTosKCS8d9khd4vR4
	awPOz5lKzeb9lmOFpmgziYaB2Yd5ZJk3TEAdQ2foxDr2pIQkpfYacRtS5KfwM0C+MzDKGm
	4kYvG5/pmL1DAi0QzvWxfazRG9k8cFw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745741069;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/xgdygPLSQTBfZrtxZDlXzTaXvQR6hthcsY3VTYUN84=;
	b=ov+8iBvCaxb8eZENdujWj/Nc8I3Rlazz6GkrOrwJlENK5yugEhcA/iOrL3Iow7sT59K5dm
	HOUQVfDAeVOvEdAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745741069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/xgdygPLSQTBfZrtxZDlXzTaXvQR6hthcsY3VTYUN84=;
	b=RrB+nrqzgmS0WyplsrVf/KU8Jyo9r2OgHJwcIOnP5lyiC+DX3bdYKgTosKCS8d9khd4vR4
	awPOz5lKzeb9lmOFpmgziYaB2Yd5ZJk3TEAdQ2foxDr2pIQkpfYacRtS5KfwM0C+MzDKGm
	4kYvG5/pmL1DAi0QzvWxfazRG9k8cFw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745741069;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/xgdygPLSQTBfZrtxZDlXzTaXvQR6hthcsY3VTYUN84=;
	b=ov+8iBvCaxb8eZENdujWj/Nc8I3Rlazz6GkrOrwJlENK5yugEhcA/iOrL3Iow7sT59K5dm
	HOUQVfDAeVOvEdAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 62E4A13927;
	Sun, 27 Apr 2025 08:04:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0eLNFg3lDWhXKgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 27 Apr 2025 08:04:29 +0000
Date: Sun, 27 Apr 2025 10:04:29 +0200
Message-ID: <87r01exc6q.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Chris Chiu <chris.chiu@canonical.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: Apply volume control on speaker+lineout for HP EliteStudio AIO
In-Reply-To: <20250425103618.534951-1-chris.chiu@canonical.com>
References: <20250425103618.534951-1-chris.chiu@canonical.com>
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
	NEURAL_HAM_SHORT(-0.20)[-0.999];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Fri, 25 Apr 2025 12:36:18 +0200,
Chris Chiu wrote:
> 
> This hardware has ALC274 codec with speaker NID 0x17 and line out
> NID 0x16 for audio output. The line out is routed correctly but
> the speaker is not. Thus the volume can't be controlled.
> 
> This patch removes DAC NID 0x06 (without volume control) from the
> connection list for speaker NID 0x17. Routing both speaker and line
> out pins to DAC NID 0x02 which controls the output volume.
> 
> Signed-off-by: Chris Chiu <chris.chiu@canonical.com>

Applied to for-linus branch now.  Thanks.


Takashi
