Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556772116F6
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747126941; cv=none; b=Zmu3iIa1o24S6Ktq2FojJcqBDR/z3uyYgnqu0sVgIw9+J1xEfuHSneW+dQqoudwkXZCESOQsD5We5Bpdd/kS9sEXlzmEgsFbz9RsehgpZQqajukvTTIQSea2muS1qrTGkUYoiH6lYArH0BJ6H7AID62WcLH/FxAp675WC7Bklnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747126941; c=relaxed/simple;
	bh=dCMZsS5yy9vn30pcrolPLTccTn48yh3b6ksDcgXhDO4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YkihXm307ougordQDyFMSrdPADIffamZTpf1/6hu9kgQ+tAREsepwpMBsnZKv95qqU4cxutW0kGMRrpR4ODyPXecd9hdaMa0C4pJJLzIkMkhCzf42EVaHV4kbIFFqGBOWNY/Tgl7FXmbaSnmSaBL4b3/qPRtzkNIpsjOUGb33ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Pf0Eee/o; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kIVzvB0W; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Pf0Eee/o; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kIVzvB0W; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Pf0Eee/o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kIVzvB0W";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Pf0Eee/o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kIVzvB0W"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7F8FF1F6E6;
	Tue, 13 May 2025 09:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747126938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nq1d9ovfN++gmheqjN9ni2gogF089hk9pgYlzPAmSJ0=;
	b=Pf0Eee/oPP9gIuBYK9BvB+fbvqKN092PBDUzlU6R3aMfT2LuYWzMYNTwEZvP8aFwgkRcUT
	NOiVJD1CEsLnnPAEBdd4/RKs2j4IhTqgq39b4eI2Kh1slPpjIKb+sD51KY+q64IXqx7fdw
	UWvC6mTltsQHTTJS2lbYAnYUO8uUQG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747126938;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nq1d9ovfN++gmheqjN9ni2gogF089hk9pgYlzPAmSJ0=;
	b=kIVzvB0WZcv7VM+g3+4oX3fvdcg+hut6nkKfsbuEsDIbAOJOAzzDCSgPREcKUQ11Iy1A/J
	cXM1gypxyb/D1BAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Pf0Eee/o";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kIVzvB0W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747126938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nq1d9ovfN++gmheqjN9ni2gogF089hk9pgYlzPAmSJ0=;
	b=Pf0Eee/oPP9gIuBYK9BvB+fbvqKN092PBDUzlU6R3aMfT2LuYWzMYNTwEZvP8aFwgkRcUT
	NOiVJD1CEsLnnPAEBdd4/RKs2j4IhTqgq39b4eI2Kh1slPpjIKb+sD51KY+q64IXqx7fdw
	UWvC6mTltsQHTTJS2lbYAnYUO8uUQG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747126938;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nq1d9ovfN++gmheqjN9ni2gogF089hk9pgYlzPAmSJ0=;
	b=kIVzvB0WZcv7VM+g3+4oX3fvdcg+hut6nkKfsbuEsDIbAOJOAzzDCSgPREcKUQ11Iy1A/J
	cXM1gypxyb/D1BAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5D191137E8;
	Tue, 13 May 2025 09:02:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CIcpFpoKI2j6fgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 May 2025 09:02:18 +0000
Date: Tue, 13 May 2025 11:02:10 +0200
Message-ID: <871pssubn1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<13564923607@139.com>,
	<13916275206@139.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<baojun.xu@ti.com>,
	<Baojun.Xu@fpt.com>,
	<jesse-ji@ti.com>,
	kernel test robot
	<lkp@intel.com>
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Fix the symbol was not declare warning reported by kernel test robot
In-Reply-To: <20250513071721.1090-1-shenghao-ding@ti.com>
References: <20250513071721.1090-1-shenghao-ding@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 7F8FF1F6E6
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,139.com,alsa-project.org,vger.kernel.org,ti.com,fpt.com,intel.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REDIRECTOR_URL(0.00)[urldefense.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,urldefense.com:url,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,ti.com:email,intel.com:email]
X-Rspamd-Action: no action

On Tue, 13 May 2025 09:17:21 +0200,
Shenghao Ding wrote:
> 
> After commit 28a09d9e42c5 ("ALSA: hda/tas2781: Create an independent lib
> to save the shared parts for both SPI and I2C driver") created a separated
> lib for both hda-i2c and hda-spi driver, which caused this issue.
> sparse warnings: (new ones prefixed by >>)
> >> sound/pci/hda/tas2781_hda_spi.c:496:25: sparse: sparse: symbol
>    'tas2781_snd_ctls' was not declared. Should it be static?
> >> sound/pci/hda/tas2781_hda_spi.c:505:25: sparse: sparse: symbol
>    'tas2781_prof_ctl' was not declared. Should it be static?
> >> sound/pci/hda/tas2781_hda_spi.c:512:25: sparse: sparse: symbol
>    'tas2781_dsp_ctls' was not declared. Should it be static?
> 
> Fixes: 28a09d9e42c5 ("ALSA: hda/tas2781: Create an independent lib to save the shared parts for both SPI and I2C driver")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://urldefense.com/v3/__https://lore.kernel.org/oe-kbuild-all/202505130420.vr9yDI3k-lkp@intel.com/__;!!G3vK!URphGMMfZ2erCLfJdETofl0O1mTSydDLLJ6inMIYWYUDUKYef_IuLvI7pnYj3Mx-4LRIi4BJEw$
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

Applied now.  Thanks.


Takashi
