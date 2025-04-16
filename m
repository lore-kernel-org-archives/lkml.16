Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1485412B73
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744807039; cv=none; b=JiXwENa3PQVKSJ9PJ2TF1xtuV7H5xeI1irD541dZihaGZLcWjT0fAZZ0ZBfqfzlejIJX2f/54blFM3bBiqhqHMLrKLlnlzwojXhLNs5iRzoAyTvnI/JOekULVwS0QdwXrGPb+TZtUwAdxJlBgtFumc4pC4o0E/ccHYG2PfaTGJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744807039; c=relaxed/simple;
	bh=G6Aw0GICv5oMW55Cm1YQ+MFNLT9Tm9L5xy3os3sr6Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a3FWRuQT02hOuutiahYDPVqAR+6V+fuZTVmLvmlkf0xk8jzwakvz8m1t0yZ/ByO8/mOA4SSq6Gq0ykpZP2/D91jd32XYwfFtrT0qilandYa5eN6ykigVO6SG3xtHANMSiyjheDsZE+QCz+5k0Wgg0yf1Er+j/d+/QCbUA5Xnlok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=j63+8iy5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lAxOynw+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=j63+8iy5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lAxOynw+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="j63+8iy5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lAxOynw+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="j63+8iy5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lAxOynw+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1289A21190;
	Wed, 16 Apr 2025 12:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744807034; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=imDqb6FdPl9NyDhmjZJsTReD78sub4j6/DimaVfnzYQ=;
	b=j63+8iy5IWWiLTUurfQmZr6Yu91UCtxFXywcEnpFh9vVQ+vA4LULhzIQ4ODykEsjMZNjtQ
	GrfymvpVIQNE5mHLT214gt4/Dm14DhkN3xdDJVMt7jdspbPR6tTpPEdhhliV9PNYmHe5JJ
	2f1V3SQnlLSn6bQQCmCZZmbZLjIpXjs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744807034;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=imDqb6FdPl9NyDhmjZJsTReD78sub4j6/DimaVfnzYQ=;
	b=lAxOynw+mXcxvIobfBLV/Q2cZLiPG8z8p4m1QgRRDMWNNMiRh6r1QdRL0qxjsCSpWRwvHt
	CTjZU/nyRnP7BcBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=j63+8iy5;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lAxOynw+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744807034; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=imDqb6FdPl9NyDhmjZJsTReD78sub4j6/DimaVfnzYQ=;
	b=j63+8iy5IWWiLTUurfQmZr6Yu91UCtxFXywcEnpFh9vVQ+vA4LULhzIQ4ODykEsjMZNjtQ
	GrfymvpVIQNE5mHLT214gt4/Dm14DhkN3xdDJVMt7jdspbPR6tTpPEdhhliV9PNYmHe5JJ
	2f1V3SQnlLSn6bQQCmCZZmbZLjIpXjs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744807034;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=imDqb6FdPl9NyDhmjZJsTReD78sub4j6/DimaVfnzYQ=;
	b=lAxOynw+mXcxvIobfBLV/Q2cZLiPG8z8p4m1QgRRDMWNNMiRh6r1QdRL0qxjsCSpWRwvHt
	CTjZU/nyRnP7BcBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A8C55139A1;
	Wed, 16 Apr 2025 12:37:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vRk3J3mk/2f3KwAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Wed, 16 Apr 2025 12:37:13 +0000
Date: Wed, 16 Apr 2025 14:37:12 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Joel Stanley <joel@jms.id.au>, Henry Martin <bsdhenrymartin@gmail.com>,
 Patrick Rudolph <patrick.rudolph@9elements.com>, Andrew Geissler
 <geissonator@yahoo.com>, Ninad Palsule <ninad@linux.ibm.com>, Patrick
 Venture <venture@google.com>, Robert Lippert <roblip@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] soc: aspeed: lpc-snoop: Constrain parameters in
 channel paths
Message-ID: <20250416143712.4e4666f4@endymion>
In-Reply-To: <20250411-aspeed-lpc-snoop-fixes-v1-4-64f522e3ad6f@codeconstruct.com.au>
References: <20250411-aspeed-lpc-snoop-fixes-v1-0-64f522e3ad6f@codeconstruct.com.au>
	<20250411-aspeed-lpc-snoop-fixes-v1-4-64f522e3ad6f@codeconstruct.com.au>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1289A21190
X-Spam-Score: -4.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,yahoo.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[jms.id.au,gmail.com,9elements.com,yahoo.com,linux.ibm.com,google.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codeconstruct.com.au:email,suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Fri, 11 Apr 2025 10:38:34 +0930, Andrew Jeffery wrote:
> Ensure pointers and the channel index are valid before use.
> 
> Fixes: 9f4f9ae81d0a ("drivers/misc: add Aspeed LPC snoop driver")

Please don't abuse Fixes tags. Here you are hardening the code just in
case, but this isn't fixing any actual bug, as functions
aspeed_lpc_enable_snoop() and aspeed_lpc_disable_snoop() were never
called with an incorrect channel index.

> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> index 28f034b8a3b7226efe20cbe30a7da0c2b49fbd96..6ab362aeb180c8ad356422d8257717f41a232b3c 100644
> --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> @@ -182,6 +182,7 @@ static int aspeed_lpc_snoop_config_irq(struct aspeed_lpc_snoop *lpc_snoop,
>  	return 0;
>  }
>  
> +__attribute__((nonnull))
>  static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
>  				   struct device *dev,
>  				   int channel, u16 lpc_port)
> @@ -190,6 +191,8 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
>  	u32 hicr5_en, snpwadr_mask, snpwadr_shift, hicrb_en;
>  	int rc = 0;
>  
> +	if (channel < 0 || channel >= ARRAY_SIZE(lpc_snoop->chan))
> +		return -EINVAL;
>  
>  	if (lpc_snoop->chan[channel].enabled)
>  		return -EBUSY;
> @@ -252,9 +255,13 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
>  	return rc;
>  }
>  
> +__attribute__((nonnull))
>  static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
>  				     int channel)
>  {
> +	if (channel < 0 || channel >= ARRAY_SIZE(lpc_snoop->chan))
> +		return;
> +
>  	if (!lpc_snoop->chan[channel].enabled)
>  		return;
>  
> 

TBH I'm not sure if this has much value, as any error in the channel
index (or passing NULL pointers for lpc_snoop or dev) would likely be
caught very early during driver development or update. And silently
returning early is not going to fix the problem if this ever happens.

But well, I'm not much into defensive programming anyway, so maybe this
is just me. As I'm not maintaining this driver, this ain't my decision.

Acked-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
