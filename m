Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E3B3C38
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 06:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747030117; cv=none; b=XUi1W/VxyTYw/0vrdUpravBTXzbyghzLwk9pv8CnSPPqP4CWyEPMaSOaaIhuK21vqw93z7IOGM7lsyLLir8SVaaz3Jg+/gEqaQtqNZmh1cYU2ma/2a92ddRRy/I9+AGqqlmJLIHslsCS+emoGx117haYv5ji+1b4wLH50GVLvEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747030117; c=relaxed/simple;
	bh=FK8pEdCRQtG6bJlXiQWdi88Bu8Ab4nVxy28DqpeqP7s=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ENZ+9gaVOp79Mqy2jmcm7C+a6QOObZ22rQIg3glrLTOTN+PdcJO/zvHRGjNjPaODdICQMGPnB8+kZbCNdyvb3wqkj44VTrbDPQzln5nMce62tL23V4/+qYrjfb1r8bhbT5jOUrW8Pl2eYGgvGE9PNAejGvSlDYLzZFOX/p+t2PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P68ZAven; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=X4ag0s25; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P68ZAven; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=X4ag0s25; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P68ZAven";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X4ag0s25";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P68ZAven";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X4ag0s25"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 64D4D211AD;
	Mon, 12 May 2025 06:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747030102; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=39IvRBcW+cJ8NVSVS1ljrzz9mXA6cTtMOoBmdCkC5GE=;
	b=P68ZAvenefYZ4NDkzAWQDonwBFNXbXDZYtwdUfPOBWs8iBbR6DO+hrj5Vtu3tQBn+spiOY
	q58yLInZAbDhIWmys5/OFX8u+6Ni7k73KhtjmMmPt5n5k3cDox5eBljtiIDEV+OcLlWAsX
	torlOTa9h37E+iCwkWbtj5kDdFnw6Jc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747030102;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=39IvRBcW+cJ8NVSVS1ljrzz9mXA6cTtMOoBmdCkC5GE=;
	b=X4ag0s250XMgQ+nRAVL/unRTUX8pJeSCz4LYIb78m0QmkvgTes7RIDftLdnkXs45BtG4O0
	+vaouCEWQtpR85Cg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=P68ZAven;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=X4ag0s25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747030102; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=39IvRBcW+cJ8NVSVS1ljrzz9mXA6cTtMOoBmdCkC5GE=;
	b=P68ZAvenefYZ4NDkzAWQDonwBFNXbXDZYtwdUfPOBWs8iBbR6DO+hrj5Vtu3tQBn+spiOY
	q58yLInZAbDhIWmys5/OFX8u+6Ni7k73KhtjmMmPt5n5k3cDox5eBljtiIDEV+OcLlWAsX
	torlOTa9h37E+iCwkWbtj5kDdFnw6Jc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747030102;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=39IvRBcW+cJ8NVSVS1ljrzz9mXA6cTtMOoBmdCkC5GE=;
	b=X4ag0s250XMgQ+nRAVL/unRTUX8pJeSCz4LYIb78m0QmkvgTes7RIDftLdnkXs45BtG4O0
	+vaouCEWQtpR85Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 210211397F;
	Mon, 12 May 2025 06:08:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zdDjBlaQIWgYcgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 12 May 2025 06:08:22 +0000
Date: Mon, 12 May 2025 08:08:21 +0200
Message-ID: <878qn2xsx6.wl-tiwai@suse.de>
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
	<jesse-ji@ti.com>
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Fix the ld issue reported by kernel test robot
In-Reply-To: <20250511221844.1123-1-shenghao-ding@ti.com>
References: <20250511221844.1123-1-shenghao-ding@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 64D4D211AD
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.981];
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
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,139.com,alsa-project.org,vger.kernel.org,ti.com,fpt.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	REDIRECTOR_URL(0.00)[urldefense.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Action: no action

On Mon, 12 May 2025 00:18:44 +0200,
Shenghao Ding wrote:
> 
> Fix the ld issue reported by kernel test robot, moving the implementation
> of tasdevice_remove from tas2781-comlib-i2c.c to tas2781-comlib.c.
> 
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
> 
> ---
> v1:
>  - | Reported-by: kernel test robot <lkp@intel.com>
>    | Closes: https://urldefense.com/v3/__https://lore.kernel.org/oe-kbuild-all/202505111855.FP2fScKA-lkp@intel.com/__;!!G3vK!U-wdsvrOG1iezggZ55RYi8ikBxMaJD

You must put this in the patch description around your Signed-off-by
line (without quotes).
Also, please put the Fixes tag to point out the commit that introduced
the regression, too.

Care to resubmit?


thanks,

Takashi
