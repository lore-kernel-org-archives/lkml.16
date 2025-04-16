Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85892232792
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805986; cv=none; b=jHNYoOiNKLl447WDQb011GXnl2QDRHpOhKak7AtDFDUANyON5bK9qNNvTMr2N8fQpBAk+HWgGpzaM1bf/l2FHbnyUkKM07XkIu12fiyTVFqxSQ3oGYhLlzag1u2/DYubD6jJXiGyHagYqhTc/b9edOnECNCi04nZhXqjEqJLgqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805986; c=relaxed/simple;
	bh=5QYy/zWGX6bR1IiLlNUtTnGM5oB5i0Y/+eH4bAavRb0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mt1oo5udrL/yRK2IHjSa3fs595IaVXn/FywkZPjnPYMr2M8oq29n6xuoIDFfpfvP2dKuC22h+kUdkd6N35KUvYpJIOPugedl6CYeUKSpwRYdrPPmR6TQA9JJbLEkgXYfwYkkCLD9n3OqTxL4ZugEZ7CwUXR+QMCyeOiely1zsPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YRMsUJKQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4z94Mgrj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YRMsUJKQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4z94Mgrj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YRMsUJKQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4z94Mgrj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YRMsUJKQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4z94Mgrj"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 85A1B1F461;
	Wed, 16 Apr 2025 12:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744805982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ust/glcC2qccqxXbzpLnJ7xqfvWyofmc2jyJ1SpQnss=;
	b=YRMsUJKQoDR9Hv5HOgcFnGZE2nMu9C6tA44VmCf76msZ2FvjvM8254CEJ0kQ6ITAPLP4KJ
	1ofylyL9CBlWKqVItHbMQIc3FXjvrp4P7qVecA/BecY4z2AJAIZTOqn+Rpcw7liCqSm7EJ
	7wpkjhauifGf0AlyAcnG/N9tNlFW7y8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744805982;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ust/glcC2qccqxXbzpLnJ7xqfvWyofmc2jyJ1SpQnss=;
	b=4z94MgrjttqmCwnghpridupjEc18IAXcBAD8372pEpaJtsQ4M46p2UVcz0qwnW7sRPZ5rA
	ZRg3ioxf2GZP8qDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744805982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ust/glcC2qccqxXbzpLnJ7xqfvWyofmc2jyJ1SpQnss=;
	b=YRMsUJKQoDR9Hv5HOgcFnGZE2nMu9C6tA44VmCf76msZ2FvjvM8254CEJ0kQ6ITAPLP4KJ
	1ofylyL9CBlWKqVItHbMQIc3FXjvrp4P7qVecA/BecY4z2AJAIZTOqn+Rpcw7liCqSm7EJ
	7wpkjhauifGf0AlyAcnG/N9tNlFW7y8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744805982;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ust/glcC2qccqxXbzpLnJ7xqfvWyofmc2jyJ1SpQnss=;
	b=4z94MgrjttqmCwnghpridupjEc18IAXcBAD8372pEpaJtsQ4M46p2UVcz0qwnW7sRPZ5rA
	ZRg3ioxf2GZP8qDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 24847139A1;
	Wed, 16 Apr 2025 12:19:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hdH4Bl6g/2dTJgAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Wed, 16 Apr 2025 12:19:42 +0000
Date: Wed, 16 Apr 2025 14:19:40 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Joel Stanley <joel@jms.id.au>, Henry Martin <bsdhenrymartin@gmail.com>,
 Patrick Rudolph <patrick.rudolph@9elements.com>, Andrew Geissler
 <geissonator@yahoo.com>, Ninad Palsule <ninad@linux.ibm.com>, Patrick
 Venture <venture@google.com>, Robert Lippert <roblip@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] soc: aspeed: lpc-snoop: Ensure model_data is valid
Message-ID: <20250416141940.5495e537@endymion>
In-Reply-To: <20250411-aspeed-lpc-snoop-fixes-v1-3-64f522e3ad6f@codeconstruct.com.au>
References: <20250411-aspeed-lpc-snoop-fixes-v1-0-64f522e3ad6f@codeconstruct.com.au>
	<20250411-aspeed-lpc-snoop-fixes-v1-3-64f522e3ad6f@codeconstruct.com.au>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,yahoo.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[jms.id.au,gmail.com,9elements.com,yahoo.com,linux.ibm.com,google.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codeconstruct.com.au:email,suse.de:email]
X-Spam-Score: -3.80
X-Spam-Flag: NO

On Fri, 11 Apr 2025 10:38:33 +0930, Andrew Jeffery wrote:
> of_device_get_match_data() can return NULL, though shouldn't in current
> circumstances. Regardless, initialise model_data closer to use so it's
> clear we need to test for validity prior to dereferencing.
> 
> Fixes: 2dee584bc9e3 ("drivers/misc: (aspeed-lpc-snoop): Add ast2400 to compat")
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> index e9d9a8e60a6f062c0b53c9c02e5d73768453998d..28f034b8a3b7226efe20cbe30a7da0c2b49fbd96 100644
> --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> @@ -186,10 +186,10 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
>  				   struct device *dev,
>  				   int channel, u16 lpc_port)
>  {
> -	int rc = 0;
> +	const struct aspeed_lpc_snoop_model_data *model_data;
>  	u32 hicr5_en, snpwadr_mask, snpwadr_shift, hicrb_en;
> -	const struct aspeed_lpc_snoop_model_data *model_data =
> -		of_device_get_match_data(dev);
> +	int rc = 0;
> +

Duplicate blank line.

>  
>  	if (lpc_snoop->chan[channel].enabled)
>  		return -EBUSY;
> @@ -236,9 +236,10 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
>  	regmap_update_bits(lpc_snoop->regmap, HICR5, hicr5_en, hicr5_en);
>  	regmap_update_bits(lpc_snoop->regmap, SNPWADR, snpwadr_mask,
>  			   lpc_port << snpwadr_shift);
> -	if (model_data->has_hicrb_ensnp)
> -		regmap_update_bits(lpc_snoop->regmap, HICRB,
> -				hicrb_en, hicrb_en);
> +
> +	model_data = of_device_get_match_data(dev);
> +	if (model_data && model_data->has_hicrb_ensnp)
> +		regmap_update_bits(lpc_snoop->regmap, HICRB, hicrb_en, hicrb_en);
>  
>  	lpc_snoop->chan[channel].enabled = true;
>  
> 

Acked-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
