Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0476D227EBD
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 07:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747381521; cv=none; b=S+htUt+AaYiKRoQuB5DtJ7oT/WU9QsLOJmwqmbyVLp3nk0SyxF3J6ab5AhB1qEuIwhdLS3joUJMgpx03UlvdQBMYT6QbyoxJzNUe+Dolhxz1jPWo2Gpa0geJTJV11T/LjbJh+vN82i70PRXr7JkU23332UWC9IgqdCFb7zZkB8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747381521; c=relaxed/simple;
	bh=nNLpBT5ZVdYaH8EsdfY0OMKTl6JNBE5LX6u6Ck6Goi0=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=WGDYuipHWcGK91TbhMVpBAruR2e9LMLrD/vSJ7wtv7vY2km1iqoDOHAJR3KKZfKEjd7I3S6KiuGsA0qMDjlHSs3Pf/JchIXGk1mSoFbsmXOVnQmTvpkcxTToD/RwAvJUIo+PycmkhZ7vD9JVLq00gM/A32PXY0P0ilvFgSoFQTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0u1FIVRI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SyLwXxcn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=F/Ic7+by; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xXabpMep; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0u1FIVRI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SyLwXxcn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="F/Ic7+by";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xXabpMep"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B604821923;
	Fri, 16 May 2025 07:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747381515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=SbZYXZEUUYsyAGj18MxP5Yfc3s3L73/IwbD5zIa9Efw=;
	b=0u1FIVRIcn/2gBPZo2DeHUEQvDa7IB5e7nHI4YTqaIfjELP9eYrg5YuPbv0/x1Rr+f8YMS
	Xg2MHkASTiV/LUzJxm8n5DIsTcrvVYowixFIk7FaejgnOmW3zpQRUhjVaKGHyV7gQ3VWYK
	xPk0ig2wEUFP+Lrh4Pb7Ff2rMjZnszM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747381515;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=SbZYXZEUUYsyAGj18MxP5Yfc3s3L73/IwbD5zIa9Efw=;
	b=SyLwXxcn2uN6t0cEJN/fLUMGb2EJbTwu4MFO3JHW7ekinihDVvcnY/pLHFyG9jgd7PGbUH
	IbXIuu4S5qbxD0Ag==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="F/Ic7+by";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xXabpMep
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747381514; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=SbZYXZEUUYsyAGj18MxP5Yfc3s3L73/IwbD5zIa9Efw=;
	b=F/Ic7+byZvHshAEtYe9cwLbnB6XFCTNtTaf7MLbFk4mY1jEI7clKQaPof/7w27S1sz4uN2
	BCXyz/NDhZdEE++o8PJAseUYJhKr5nUfYp9riToym1u7fe7RJeTQAG1pRclvre4BS1b/fV
	/nmRqrR0SywGkqLTFKfCCtc3iu3fXwk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747381514;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=SbZYXZEUUYsyAGj18MxP5Yfc3s3L73/IwbD5zIa9Efw=;
	b=xXabpMepibdG+dILM+tOWii5Eq33qeQOJEX0oK29qErZOl5gjiuRB0omgsWiQHhLfW19nV
	uDCT7gMKJwP7wCAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 963F413977;
	Fri, 16 May 2025 07:45:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2rBOIwrtJmgTSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 May 2025 07:45:14 +0000
Date: Fri, 16 May 2025 09:45:14 +0200
Message-ID: <875xi1xalx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Sound Mailing List <linux-sound@vger.kernel.org>,
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 6.15-rc7
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
X-Rspamd-Queue-Id: B604821923
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_DN_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51

Linus,

please pull sound fixes for v6.15-rc7 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.15-rc7

The topmost commit is 7b9938a14460e8ec7649ca2e80ac0aae9815bf02

----------------------------------------------------------------

sound fixes for 6.15-rc7

A handful small fixes.  The only significant change is the fix for
MIDI 2.0 UMP handling in ALSA sequencer, but as MIDI 2.0 stuff is
still new and rarely used, the impact should be pretty limited.

Other than that, quirks for USB-audio and a few cosmetic fixes and
changes in drivers that should be safe to apply.

----------------------------------------------------------------

Christian Heusel (1):
      ALSA: usb-audio: Add sample rate quirk for Audioengine D1

Geert Uytterhoeven (1):
      ALSA: sh: SND_AICA should depend on SH_DMA_API

Nicolas Chauvet (1):
      ALSA: usb-audio: Add sample rate quirk for Microdia JP001 USB Camera

Peter Ujfalusi (1):
      ALSA/hda: intel-sdw-acpi: Correct sdw_intel_acpi_scan() function parameter

Takashi Iwai (2):
      ALSA: seq: Fix delivery of UMP events to group ports
      ALSA: ump: Fix a typo of snd_ump_stream_msg_device_info

Wentao Liang (1):
      ALSA: es1968: Add error handling for snd_pcm_hw_constraint_pow2()

---
 drivers/usb/gadget/function/f_midi2.c |  2 +-
 include/linux/soundwire/sdw_intel.h   |  2 +-
 include/sound/ump_msg.h               |  4 +--
 sound/core/seq/seq_clientmgr.c        | 52 ++++++++++++++++++++++-------------
 sound/core/seq/seq_ump_convert.c      | 18 ++++++++++++
 sound/core/seq/seq_ump_convert.h      |  1 +
 sound/hda/intel-sdw-acpi.c            |  2 +-
 sound/pci/es1968.c                    |  6 ++--
 sound/sh/Kconfig                      |  2 +-
 sound/usb/quirks.c                    |  4 +++
 10 files changed, 66 insertions(+), 27 deletions(-)

