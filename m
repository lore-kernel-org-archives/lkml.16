Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541D722A4EF
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 07:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747382263; cv=none; b=vDx7OTDOZWqngy9vc0Mo74evkuoBTPNMkNMAsI4/JUBOpHuQ0KY7GnKNl/5+/bD5ahZlolfr1Nz6UCmrir9x5A0ZSWfhhlEA0xnilD2rXeWXbt5ONCPZwqgGwLbpJpDRQp6w2hpE68ID2H8uKB+c2EaznFlJ8FXVEIo9FMFFFiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747382263; c=relaxed/simple;
	bh=8utIiyd9CQDss9kAzJcZaPUjnFZOAVM615J5C3Qh7B4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ff0hDI073EgKpCE7kZJ0zuJ5M6E1i/7+c7JBsWVLaz8zeoVg2cgBes7v9+Sx1H2o8mPcwg6a0/kqCmDW3uZCKkCuIg7+xsgHn4rVVgVzxum7d/9ed5atSrOqQw5a5pjx0WDPjYKS+hdiiyla/uUE1AEghTA1f3njpxo4/KJP/c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cAn2T6op; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Tow4f+0p; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cAn2T6op; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Tow4f+0p; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cAn2T6op";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Tow4f+0p";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cAn2T6op";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Tow4f+0p"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 55A461F7EE;
	Fri, 16 May 2025 07:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747382259; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7F6ASfUhy3Ogjv0fj23qSGbSfm30A8DjwOn6lXKJ40Y=;
	b=cAn2T6opIFUdBjYpxHX6NOOu6PQmhDf3E1u1omE0NMH1ikbvCurS6cpK4DNr34dq8caNuA
	XnOibxZ8Uvf9v24fNpil4MqxlgIfle82b/FDkfdr4sA4IZMB5PXtETTJDQAYdj4iRxl9nz
	pX8+Z1YlNLxvs4rlmZhP+2/WGpvUU+c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747382259;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7F6ASfUhy3Ogjv0fj23qSGbSfm30A8DjwOn6lXKJ40Y=;
	b=Tow4f+0puezh5xwlZ0G2U/V3TFfSuCLezanvSNL8/uFgppTp26viQpBwiFzBK+OcuNliH3
	CQoQlJv6f1z7NVAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cAn2T6op;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Tow4f+0p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747382259; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7F6ASfUhy3Ogjv0fj23qSGbSfm30A8DjwOn6lXKJ40Y=;
	b=cAn2T6opIFUdBjYpxHX6NOOu6PQmhDf3E1u1omE0NMH1ikbvCurS6cpK4DNr34dq8caNuA
	XnOibxZ8Uvf9v24fNpil4MqxlgIfle82b/FDkfdr4sA4IZMB5PXtETTJDQAYdj4iRxl9nz
	pX8+Z1YlNLxvs4rlmZhP+2/WGpvUU+c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747382259;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7F6ASfUhy3Ogjv0fj23qSGbSfm30A8DjwOn6lXKJ40Y=;
	b=Tow4f+0puezh5xwlZ0G2U/V3TFfSuCLezanvSNL8/uFgppTp26viQpBwiFzBK+OcuNliH3
	CQoQlJv6f1z7NVAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2530F13977;
	Fri, 16 May 2025 07:57:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gv3sB/PvJmg8TQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 May 2025 07:57:39 +0000
Date: Fri, 16 May 2025 09:57:38 +0200
Message-ID: <87wmahvvgt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: g@b4.vu,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb: fcp: Use USB API functions rather than constants
In-Reply-To: <20250516070938.12520-1-nichen@iscas.ac.cn>
References: <20250516070938.12520-1-nichen@iscas.ac.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 55A461F7EE
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
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action

On Fri, 16 May 2025 09:09:38 +0200,
Chen Ni wrote:
> 
> Use the function usb_endpoint_num() rather than constants.
> 
> The Coccinelle semantic patch is as follows:
> 
> @@ struct usb_endpoint_descriptor *epd; @@
> 
> - (epd->bEndpointAddress & \(USB_ENDPOINT_NUMBER_MASK\|0x0f\))
> + usb_endpoint_num(epd)
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Thanks, applied.


Takashi
