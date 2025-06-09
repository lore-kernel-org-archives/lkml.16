Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693A3280A47
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 07:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749455428; cv=none; b=HrXHaBAWmh/vwdntX3amGWkP25c+jra/4vQh2nBWKOCQJ/IBbBfCnjWApNvRCEFtozwgnULV8TD+t+PJJ/3ysTh5WDCbIg6VuFYCECdPnVPFsoQAipSqrSTnalq2Blj7rLSdb5X2K8/M6PlH+FK8a3YWaIo0xfxSQWtBYrL13RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749455428; c=relaxed/simple;
	bh=VzgaAo83KGzaU5ZuakpXRFzCoWnX8INmaPf4LX4LN5g=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VLflBceYR/P638IggV07/NLMuY6HO1VDSsGMqB8O8iLtqlFT2OQSEWyPuJdpbVlKTQBynXQmBY7S+Z7yRI2lLK4LqR8oczHst978uMJL63ghYLLTSVTrDFM/yQkmC84jlVuhlSrFvjwNNs8ZamP+M2pxzfQXdJe3361tamaWXYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Z3Npbeah; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RRCqypLW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Z3Npbeah; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RRCqypLW; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z3Npbeah";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RRCqypLW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z3Npbeah";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RRCqypLW"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9092C21190;
	Mon,  9 Jun 2025 07:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749455425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+l/DpDgLJJI3yYllWX98p7zZsbjEpFjKDookGd3rOPg=;
	b=Z3NpbeahU8YinUHBwGKQ2k/kQSKJqB8rqlq9uMZJrlJ07c31i+DV7n+/EtqInb16o5rFFQ
	EYThF0+zlA9H47EDAipXODyxdcHUAwWIcaoUcYMesTUT1CLMcJaKUAy8Jb6IY63poeTXRY
	uLq2RnQIzuaPDtQhopTMkoH6eTdDRsE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749455425;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+l/DpDgLJJI3yYllWX98p7zZsbjEpFjKDookGd3rOPg=;
	b=RRCqypLWs40Z7uh2wbDPsyI1ThdLY/RCCjrocF4Xbh5Eq4IHZcEhl0ib95QPcDyGdWuAuV
	OBEkeDrs/CJHOJDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749455425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+l/DpDgLJJI3yYllWX98p7zZsbjEpFjKDookGd3rOPg=;
	b=Z3NpbeahU8YinUHBwGKQ2k/kQSKJqB8rqlq9uMZJrlJ07c31i+DV7n+/EtqInb16o5rFFQ
	EYThF0+zlA9H47EDAipXODyxdcHUAwWIcaoUcYMesTUT1CLMcJaKUAy8Jb6IY63poeTXRY
	uLq2RnQIzuaPDtQhopTMkoH6eTdDRsE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749455425;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+l/DpDgLJJI3yYllWX98p7zZsbjEpFjKDookGd3rOPg=;
	b=RRCqypLWs40Z7uh2wbDPsyI1ThdLY/RCCjrocF4Xbh5Eq4IHZcEhl0ib95QPcDyGdWuAuV
	OBEkeDrs/CJHOJDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3E87813A1D;
	Mon,  9 Jun 2025 07:50:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zlERDkGSRmj7fQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Jun 2025 07:50:25 +0000
Date: Mon, 09 Jun 2025 09:50:24 +0200
Message-ID: <878qm18ibj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Baojun Xu <baojun.xu@ti.com>
Cc: <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<alsa-devel@alsa-project.org>,
	<shenghao-ding@ti.com>,
	<navada@ti.com>,
	<13916275206@139.com>,
	<v-hampiholi@ti.com>,
	<v-po@ti.com>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Add missed brace and hardware id re-order
In-Reply-To: <20250602015809.20344-1-baojun.xu@ti.com>
References: <20250602015809.20344-1-baojun.xu@ti.com>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,alsa-project.org,ti.com,139.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	URIBL_BLOCKED(0.00)[ti.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Mon, 02 Jun 2025 03:58:09 +0200,
Baojun Xu wrote:
> 
> This patch is do code clean and prepare for next patch,
> which is relative with hardware id.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>

Merged to for-next branch now.  Thanks.


Takashi
