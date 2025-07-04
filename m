Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1AE33E1
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 15:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643290; cv=none; b=bKmPp6ZUrT52tthkaDKc44ziDLXox5rVGeooQfEVEhuHUVHqtnj5TgDOaTXOKGRnFmVgtwTQNHtC6/Mr+PzxVKRsPhyiQUAZU/+ibJ721peI+LMICCbMukA3Kq7CNm8MQErFoIkf7ZTt6NY7ehRriqiu3DZDs4X4Oj7veqgQDl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643290; c=relaxed/simple;
	bh=/LlZgCqthjO7O63Qv4TJtsYHUc96sqZ52sgaD+MNqAI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K2Gjf8LDRd/ciRXtEIaC8wDihf1AHy8VKLZ9VVCmmO25pqWNjAhHO9gBkJFm4TCPKEKk02TynRwxExxaMp2qWx5CzWwGqVRttMut/1aa8QbphlBTe+yxWmNaZ/JRAupRLX5no4hMrrBhFG8zJH9U17p6zI7RvY6D+nbyHxHZxhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VDFc+xTh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QiQPeqke; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VDFc+xTh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QiQPeqke; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VDFc+xTh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QiQPeqke";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VDFc+xTh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QiQPeqke"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9446C1F394;
	Fri,  4 Jul 2025 15:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751643286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SIKVu0G3IqL/5nXUeA5vN9eSOQZPoQd570/KkcbAJ4g=;
	b=VDFc+xThyj/w9oOlp62W1Fc+/oYlUFtEEihGbjvqxX/ZRAZ92fccCVfOUCfd3MnQXoY9l9
	kDGoPS/Q/BLxy/sKYaswZbEUeK44CjQaAXajp/9He8MSgTDFpgbJZ1rIzHvCx11DreW21M
	CfTek6niAl4iv4hMUwa3utAQoFDkzV0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751643286;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SIKVu0G3IqL/5nXUeA5vN9eSOQZPoQd570/KkcbAJ4g=;
	b=QiQPeqkeovOdAE+fYvTOqNGMKtQ9gJSWR5KsMb8wbbYCohePkgZTBFDzHO7LvqfQpS3zQa
	JoGvMY1XtMWDRyDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751643286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SIKVu0G3IqL/5nXUeA5vN9eSOQZPoQd570/KkcbAJ4g=;
	b=VDFc+xThyj/w9oOlp62W1Fc+/oYlUFtEEihGbjvqxX/ZRAZ92fccCVfOUCfd3MnQXoY9l9
	kDGoPS/Q/BLxy/sKYaswZbEUeK44CjQaAXajp/9He8MSgTDFpgbJZ1rIzHvCx11DreW21M
	CfTek6niAl4iv4hMUwa3utAQoFDkzV0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751643286;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SIKVu0G3IqL/5nXUeA5vN9eSOQZPoQd570/KkcbAJ4g=;
	b=QiQPeqkeovOdAE+fYvTOqNGMKtQ9gJSWR5KsMb8wbbYCohePkgZTBFDzHO7LvqfQpS3zQa
	JoGvMY1XtMWDRyDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1D56E13757;
	Fri,  4 Jul 2025 15:34:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SYKTBJb0Z2i6DAAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Fri, 04 Jul 2025 15:34:46 +0000
Date: Fri, 4 Jul 2025 17:34:43 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-aspeed@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Henry
 Martin <bsdhenrymartin@gmail.com>, Patrick Rudolph
 <patrick.rudolph@9elements.com>, Andrew Geissler <geissonator@yahoo.com>,
 Ninad Palsule <ninad@linux.ibm.com>, Patrick Venture <venture@google.com>,
 Robert Lippert <roblip@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/10] soc: aspeed: lpc-snoop: Rearrange channel
 paths
Message-ID: <20250704173443.3436f535@endymion>
In-Reply-To: <20250616-aspeed-lpc-snoop-fixes-v2-6-3cdd59c934d3@codeconstruct.com.au>
References: <20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd59c934d3@codeconstruct.com.au>
	<20250616-aspeed-lpc-snoop-fixes-v2-6-3cdd59c934d3@codeconstruct.com.au>
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
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,yahoo.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,jms.id.au,gmail.com,9elements.com,yahoo.com,linux.ibm.com,google.com,lists.infradead.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codeconstruct.com.au:email,imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.80

On Mon, 16 Jun 2025 22:43:43 +0930, Andrew Jeffery wrote:
> Order assignments such that tests for conditions not involving resource
> acquisition are ordered before those testing acquired resources, and
> order managed resource acquisition before unmanaged where possible. This
> way we minimise the amount of manual cleanup required.
> 
> In the process, improve readability of the code by introducing a channel
> pointer that takes the place of the repeated object lookups.
> 
> Acked-by: Jean Delvare <jdelvare@suse.de>
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 51 ++++++++++++++++++++---------------
>  1 file changed, 29 insertions(+), 22 deletions(-)
> (...)
> @@ -238,6 +240,7 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
>  		goto err_misc_deregister;
>  	}
>  
> +	/* Enable LPC snoop channel at requested port */
>  	regmap_update_bits(lpc_snoop->regmap, HICR5, hicr5_en, hicr5_en);
>  	regmap_update_bits(lpc_snoop->regmap, SNPWADR, snpwadr_mask,
>  			   lpc_port << snpwadr_shift);

This duplicates a comment which is already present in the driver a few
lines before.

This duplicated comment gets cleaned up later in patch 10/10 (soc:
aspeed: lpc-snoop: Lift channel config to const structs).

-- 
Jean Delvare
SUSE L3 Support
