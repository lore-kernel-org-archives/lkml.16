Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57A91CEACB
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 05:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745991334; cv=none; b=K7gT8FBtxlI7ld9p+gAwwwUnu7Ly1ACPUFbei7kHj8WadMp7w5ehhP7dgN2HcVGLj3r3NLbbx4kbfAO+85rC0lFgiX4uj++r8Zfdd651mfM3bDv+v0cxovR7y5rwzrEfXe0pV3sbWGC7MxAB4duslpKV2sBxY/tcw+jt49Rf0a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745991334; c=relaxed/simple;
	bh=Lbd0j3TltvcKQCfAXAFXm/aNfJ9/63SoeSM0oepWE5I=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r0Qd1R0qfamU2qy+dSS+V1d4pFRadJG4vT3X4AGuC7RaYe+jZk7f90HVT19UBeB2NzK9o5rfS7/URfwo8zllUwzmCznrFZXN2Ryrs7finG6wUX7igak8CHWiAnYTVMiKwPjKMuTfNylRyRwcWUwLAMsE7ELWoTwbOpRBbOeDxZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZI9qBcOK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FnU6GWiy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZI9qBcOK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FnU6GWiy; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZI9qBcOK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FnU6GWiy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZI9qBcOK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FnU6GWiy"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A8ADF1FB52;
	Wed, 30 Apr 2025 05:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745991329; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uzoDgnO1GC6lq3IrLVACQBFiuCloD2Mcv8LM70ow68k=;
	b=ZI9qBcOKkgQbzcz6zEIDYP7qRucekkg/yT9p7uu0jHdclGiSBhF4r/KLTZ9sVfNkEUlXW4
	kFAmydYp+fXomDJBx26o9IKP122OvNPACFCi7iUr5bmbGmqoZm0dBQdcsmu80AWavLskpA
	sb8FLty2kzeiAW1cUO8BsewwliQv1Nw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745991329;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uzoDgnO1GC6lq3IrLVACQBFiuCloD2Mcv8LM70ow68k=;
	b=FnU6GWiyBRpC78YK60FDl+AbFvkjvJnwnhz8MNwREfIqaJcdperb0OYwHrpIkNvH80bfXL
	gdCbRrA+iDr/wGAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZI9qBcOK;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=FnU6GWiy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745991329; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uzoDgnO1GC6lq3IrLVACQBFiuCloD2Mcv8LM70ow68k=;
	b=ZI9qBcOKkgQbzcz6zEIDYP7qRucekkg/yT9p7uu0jHdclGiSBhF4r/KLTZ9sVfNkEUlXW4
	kFAmydYp+fXomDJBx26o9IKP122OvNPACFCi7iUr5bmbGmqoZm0dBQdcsmu80AWavLskpA
	sb8FLty2kzeiAW1cUO8BsewwliQv1Nw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745991329;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uzoDgnO1GC6lq3IrLVACQBFiuCloD2Mcv8LM70ow68k=;
	b=FnU6GWiyBRpC78YK60FDl+AbFvkjvJnwnhz8MNwREfIqaJcdperb0OYwHrpIkNvH80bfXL
	gdCbRrA+iDr/wGAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7F1731384C;
	Wed, 30 Apr 2025 05:35:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7SHVHaG2EWjJWwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 30 Apr 2025 05:35:29 +0000
Date: Wed, 30 Apr 2025 07:35:29 +0200
Message-ID: <878qnidxem.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ALSA: hda/cs35l56: Remove dependency on COMPILE_TEST
In-Reply-To: <20250428094126.125781-1-rf@opensource.cirrus.com>
References: <20250428094126.125781-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: A8ADF1FB52
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Mon, 28 Apr 2025 11:41:26 +0200,
Richard Fitzgerald wrote:
> 
> Change the Kconfig dependency on ACPI || COMPILE_TEST to only depend on
> ACPI.
> 
> The alternate dependency on COMPILE_TEST was a fudge to enable building
> KUnit tests for modules that are selected by the CS35L56 driver but don't
> depend on ACPI. This was based on a misunderstanding that KUNIT_ALL_TESTS
> meant "all tests". Actually KUNIT_ALL_TESTS only means "tests for modules
> that have satisfied dependencies" so it shouldn't be overriding
> dependencies.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Applied now.  Thanks.


Takashi
