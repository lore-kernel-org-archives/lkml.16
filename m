Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9E71487F4
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750055487; cv=none; b=qzFUQ3SkvEipOefVGKaG6YnARSaHqZisna4+3q/tFXRy3cI0N/BWicw0S+gLxHttmfnGnFY/rsSi1oVv4lcWgDWLoXDx6Xl24skupNIEoi5etUUbxzEDD8S1ABpUEMT2RDuGjvJ0vk+VpT49JJb7gYBaHgcMHJFD+8E86TliBxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750055487; c=relaxed/simple;
	bh=Z3Dhen/NIhRUrb2lRopKSmga+Bncrc0GJH/fiyjtzdk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BEcyDZ+IWYuguA8QP5LVmamLagBK8rwY5vBzQKq4Nd4uF1cpoRxldoqTTE0szho0nX9Bk43I0pZsB3Cgz9N6bZCI4yLJjJYTmGB0apW/TrDqRmov01BX5ALy4NdPkiLYeUisXUDgXReRHCS/qmLMghJVm7CPxSXhZFbpJDv8Tcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W7UZT+DR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YarI5pGg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=11JZj6M8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jr5LLV0P; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W7UZT+DR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YarI5pGg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="11JZj6M8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jr5LLV0P"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E2E83211FE;
	Mon, 16 Jun 2025 06:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750055478; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e76VJmfpP2Yor4xtdesgaAQgCirhh2iFdOwvdjWCaUs=;
	b=W7UZT+DR84iwZYYpmKkbdtVF15N80oTV8W5kyTypX2S8MW9Q0x7CZ+ZtewDrzueHRWaoZU
	bCekQeak9ZqwribcMYnN/bK2R84efjHOYmx5bac0HclTnQCY2wERYceZ6e17AFMh8CaYe5
	YC008p6YaIMayGW2IffiHruiiCNnOA4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750055478;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e76VJmfpP2Yor4xtdesgaAQgCirhh2iFdOwvdjWCaUs=;
	b=YarI5pGg/zNpctUjy8aFQL/fhieWyPOwSqtCPoFXGoeoRuxMTrVbJx50+EfhQhOdkeMrIl
	uRdreMUzGy0I6zBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=11JZj6M8;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jr5LLV0P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750055477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e76VJmfpP2Yor4xtdesgaAQgCirhh2iFdOwvdjWCaUs=;
	b=11JZj6M8Exqvd2NV3iCmKcMT1S8xMOiqWIG+h8NqXsg9LD+iSoYyjsAWT27CfSggO0OXaO
	rqYIqLN+58ut2nvJtAWwTHOI9Cgv+srVNRqYnBR/wYOf1pdHAt9gD3MoxWSs0wSHwuzMtp
	/ervomuAaar11PiRCIEScKZwjElZU3c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750055477;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e76VJmfpP2Yor4xtdesgaAQgCirhh2iFdOwvdjWCaUs=;
	b=jr5LLV0P94CMoGYS1cnD6b4RXzP3AdyYIwakUo2lEVnige5BqntQZlCSFHQ1XyMzgckfoZ
	yo3/mhHEzToAX+Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 91247139E2;
	Mon, 16 Jun 2025 06:31:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4VEYIjW6T2g2FAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Jun 2025 06:31:17 +0000
Date: Mon, 16 Jun 2025 08:31:17 +0200
Message-ID: <87msa8p58q.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Add compatible for hardware id TIAS2781 and TXNW2781
In-Reply-To: <20250616035607.2569-1-baojun.xu@ti.com>
References: <20250616035607.2569-1-baojun.xu@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,alsa-project.org,ti.com,139.com,vger.kernel.org];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,ti.com:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: E2E83211FE
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.51

On Mon, 16 Jun 2025 05:56:07 +0200,
Baojun Xu wrote:
> 
> TIAS2781 is unofficial hardware id in ACPI for tas2781 in HDA,
> has been used for several projects. TXNW is the official hardware
> id for TI, will be used in new projects, including device on SPI bus,
> which was enumerated by drivers/acpi/scan.c, and probed by smi_probe()
> in drivers/platform/x86/serial-multi-instantiate.c.
> This patch will support both TIAS2781 and TXNW2781 in ACPI with
> tas2781 under HDA.
> As our I2C driver will handle all of slaver devices, so we probe
> first device only: "TXNW2781:00-tas2781-hda.0"
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>

Thanks, applied now.


Takashi
