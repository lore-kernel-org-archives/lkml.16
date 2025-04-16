Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E930E22DF80
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744788158; cv=none; b=VwWMEmzr36nxY6hrbWrGeu+SK8bDkuQ0hz1NB/G0j2n4cSHNwxuD+Ckg9F+c9z79bxUuJpi4Nr2N4lRe2usUJkCDAsYKZhMYzsmZLL3eG9t/cBkgnP8f2kcTpDIx8UhVsj4S3i/he21oDIcJpYPX7d/lhl2METqYzS8FbTuRIVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744788158; c=relaxed/simple;
	bh=eseylKMdVRZH2+CNpgs9H6rty2NhrrwmC/qUEJSp59o=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sb45k2g8R3Qj/hPaI2WJJeJOWR9fmd1fSrLoyjFABsM/5oGb9m3UCHlYmRu4XTtQTBpGxqpGMAsltIvg/CbS1zVdw5sd5O2Y6QNLiohAnV3kVDOh/KyfujL/Mj0i8GHTfL4QZOz78sViQyAhUsSwjGp+T0cb+qDokQL2KKwSNMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s9LTNb5X; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Nc0hDZPa; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s9LTNb5X; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Nc0hDZPa; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s9LTNb5X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Nc0hDZPa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s9LTNb5X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Nc0hDZPa"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F21E621157;
	Wed, 16 Apr 2025 07:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744788155; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sigi6BLV9HZPEYvYXElKrGDVaSnKG9moEmfl608ubyE=;
	b=s9LTNb5X/Y1K5CSLcQhudtytXYebLDTAyXOA8U56kzvrEkCPR7AbOX3BXKfFXCIJucSCd7
	gOxeJkONdyMKM7CleJYi6pasH4GLEmBzCQMW0GUtszVVLoAFZApf82IH+7qdG1DnAnQOre
	gzwnrTyPxV9lt735rxrxFgID4YEpb+s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744788155;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sigi6BLV9HZPEYvYXElKrGDVaSnKG9moEmfl608ubyE=;
	b=Nc0hDZPa++XIlgJk/AgD2I4NvdvcRrqGWn4aZ7qIk3Sfw3S9wrgG2P3Wl/XNr9EMNPf7Us
	Rv3us87240WPLHCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744788155; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sigi6BLV9HZPEYvYXElKrGDVaSnKG9moEmfl608ubyE=;
	b=s9LTNb5X/Y1K5CSLcQhudtytXYebLDTAyXOA8U56kzvrEkCPR7AbOX3BXKfFXCIJucSCd7
	gOxeJkONdyMKM7CleJYi6pasH4GLEmBzCQMW0GUtszVVLoAFZApf82IH+7qdG1DnAnQOre
	gzwnrTyPxV9lt735rxrxFgID4YEpb+s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744788155;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sigi6BLV9HZPEYvYXElKrGDVaSnKG9moEmfl608ubyE=;
	b=Nc0hDZPa++XIlgJk/AgD2I4NvdvcRrqGWn4aZ7qIk3Sfw3S9wrgG2P3Wl/XNr9EMNPf7Us
	Rv3us87240WPLHCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 90A9A13976;
	Wed, 16 Apr 2025 07:22:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Q7/7Ibpa/2fjSgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 16 Apr 2025 07:22:34 +0000
Date: Wed, 16 Apr 2025 09:22:34 +0200
Message-ID: <87lds0y3id.wl-tiwai@suse.de>
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
	<robinchen@ti.com>
Subject: Re: [PATCH v3] ALSA: hda/tas2781: Create a common header for both spi and i2c tas2781 hda driver
In-Reply-To: <20250416051838.2001-1-shenghao-ding@ti.com>
References: <20250416051838.2001-1-shenghao-ding@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,139.com,alsa-project.org,vger.kernel.org,ti.com,fpt.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,ti.com:email]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Wed, 16 Apr 2025 07:18:38 +0200,
Shenghao Ding wrote:
> 
> Move the common macro definition of kcontrols into a common header for code
> cleanup, and create a common header to store the common declaration for
> both spi and i2c hda driver.
> 
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

Applied now to for-next branch.  Thanks.


Takashi
