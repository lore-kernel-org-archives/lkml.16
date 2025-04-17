Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6400F22AE74
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 10:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744886961; cv=none; b=jHcIZvV7hW2+fDvd6V1nXZISlRdFYEpZdFFpvwRc0klYZQPytZIc7NOpNU8rv3E1+qp85RybLWSrf7cTZvRO8MiZxPzH6apdNjXDzXX7BehjEkCJvG3I1aVb3oUSybvrEM5ZRkx6+20y9/pqDPEW4PwgYm3qltb2d5AKlHck3j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744886961; c=relaxed/simple;
	bh=cvIlQ7wMKAmBLuGD8J/k+8QJiAJq2WQfIxaEfXMl5zI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FBh+V9lUgN9MMrhBwsPokXlJ/+hWbbmUkYJLeCqYGEeS5N+5VwKHADaNhwSE4PPg24n9EPE2nPYyewyqyUWBPTNgFgTvb3/ky8hnUPffm8i7vkTm5PiA6SU3HAQ1m9aS6XD8oSkMguc0hVPuI/kz5yow8y7O+BGmTGnPf+aV7uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=elfO380P; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VSJVXdM1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=elfO380P; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VSJVXdM1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="elfO380P";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VSJVXdM1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="elfO380P";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VSJVXdM1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 735732116B;
	Thu, 17 Apr 2025 10:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744886956; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XgBGIb8Ml757E8HqOMQaHqsZI/NRoUruYO5ZoA1mMes=;
	b=elfO380PV0rf33+Q7/uzinckxIOPD9vkd4TAU5u+L1FPUmA3oeBB9AyRRCbsDzcGRO61xo
	kCAPy/QSRZNnW+nCEMwYGCJF54ExKa1AmKYLAqk2peiL0fKFktzJ4pMwxuDSiwA4VoJQ7F
	8dzV3yVrEpZA87aerlUQQWjs6/4YzsU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744886956;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XgBGIb8Ml757E8HqOMQaHqsZI/NRoUruYO5ZoA1mMes=;
	b=VSJVXdM1oxM8OHTgsNKb2F1UwlPXIT0MTCbX/bPLZkZOON2Dc4Idd0pjse7s/E9Lilow8v
	o5aWNYrXwyPEykCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744886956; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XgBGIb8Ml757E8HqOMQaHqsZI/NRoUruYO5ZoA1mMes=;
	b=elfO380PV0rf33+Q7/uzinckxIOPD9vkd4TAU5u+L1FPUmA3oeBB9AyRRCbsDzcGRO61xo
	kCAPy/QSRZNnW+nCEMwYGCJF54ExKa1AmKYLAqk2peiL0fKFktzJ4pMwxuDSiwA4VoJQ7F
	8dzV3yVrEpZA87aerlUQQWjs6/4YzsU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744886956;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XgBGIb8Ml757E8HqOMQaHqsZI/NRoUruYO5ZoA1mMes=;
	b=VSJVXdM1oxM8OHTgsNKb2F1UwlPXIT0MTCbX/bPLZkZOON2Dc4Idd0pjse7s/E9Lilow8v
	o5aWNYrXwyPEykCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 15E89137CF;
	Thu, 17 Apr 2025 10:49:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id j2ZuA6zcAGilEAAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Thu, 17 Apr 2025 10:49:16 +0000
Date: Thu, 17 Apr 2025 12:49:14 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Joel Stanley <joel@jms.id.au>, Henry Martin <bsdhenrymartin@gmail.com>,
 Patrick Rudolph <patrick.rudolph@9elements.com>, Andrew Geissler
 <geissonator@yahoo.com>, Ninad Palsule <ninad@linux.ibm.com>, Patrick
 Venture <venture@google.com>, Robert Lippert <roblip@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] soc: aspeed: lpc-snoop: Lift channel config to
 const structs
Message-ID: <20250417124914.77f80975@endymion>
In-Reply-To: <20250411-aspeed-lpc-snoop-fixes-v1-7-64f522e3ad6f@codeconstruct.com.au>
References: <20250411-aspeed-lpc-snoop-fixes-v1-0-64f522e3ad6f@codeconstruct.com.au>
	<20250411-aspeed-lpc-snoop-fixes-v1-7-64f522e3ad6f@codeconstruct.com.au>
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
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,yahoo.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[jms.id.au,gmail.com,9elements.com,yahoo.com,linux.ibm.com,google.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[]
X-Spam-Score: -3.80
X-Spam-Flag: NO

Hi Andrew,

On Fri, 11 Apr 2025 10:38:37 +0930, Andrew Jeffery wrote:
> The shifts and masks for each channel are defined by hardware and
> are not something that changes at runtime. Accordingly, describe the
> information in an array of const structs and associate elements with
> each channel instance, removing the need for the switch and handling of
> its default case.

I like the idea very much. A few comments on the implementations below.

> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 82 +++++++++++++++++------------------
>  1 file changed, 41 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> index 0b2044fd79b1be08dfa33bfcaf249b020c909bb9..b54d8fbf7b83ebadd4fe1b16cbddf07a0bfac868 100644
> --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> @@ -10,6 +10,7 @@
>   * 0x80 writes made by the BIOS during the boot process.
>   */
>  
> +#include "linux/ratelimit.h"
>  #include <linux/bitops.h>
>  #include <linux/clk.h>
>  #include <linux/interrupt.h>
> @@ -57,7 +58,15 @@ struct aspeed_lpc_snoop_model_data {
>  	unsigned int has_hicrb_ensnp;
>  };
>  
> +struct aspeed_lpc_snoop_channel_cfg {
> +	u32 hicr5_en;
> +	u32 snpwadr_mask;
> +	u32 snpwadr_shift;
> +	u32 hicrb_en;
> +};
> +
>  struct aspeed_lpc_snoop_channel {
> +	const struct aspeed_lpc_snoop_channel_cfg *cfg;
>  	bool enabled;
>  	struct kfifo		fifo;
>  	wait_queue_head_t	wq;
> @@ -188,7 +197,6 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
>  				   int index, u16 lpc_port)
>  {
>  	const struct aspeed_lpc_snoop_model_data *model_data;
> -	u32 hicr5_en, snpwadr_mask, snpwadr_shift, hicrb_en;
>  	struct aspeed_lpc_snoop_channel *channel;
>  	int rc = 0;
>  
> @@ -200,6 +208,9 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
>  	if (channel->enabled)
>  		return -EBUSY;
>  
> +	if (WARN_ONCE(!channel->cfg, "snoop channel %d lacks required config", index))

Why not just WARN? WARN_ONCE has a higher cost, and I don't expect this
code path to be taken more than twice.

> +		return -EINVAL;
> +
>  	init_waitqueue_head(&channel->wq);
>  
>  	channel->miscdev.minor = MISC_DYNAMIC_MINOR;
> @@ -220,39 +231,20 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
>  		goto err_free_fifo;
>  
>  	/* Enable LPC snoop channel at requested port */
> -	switch (index) {
> -	case 0:
> -		hicr5_en = HICR5_EN_SNP0W | HICR5_ENINT_SNP0W;
> -		snpwadr_mask = SNPWADR_CH0_MASK;
> -		snpwadr_shift = SNPWADR_CH0_SHIFT;
> -		hicrb_en = HICRB_ENSNP0D;
> -		break;
> -	case 1:
> -		hicr5_en = HICR5_EN_SNP1W | HICR5_ENINT_SNP1W;
> -		snpwadr_mask = SNPWADR_CH1_MASK;
> -		snpwadr_shift = SNPWADR_CH1_SHIFT;
> -		hicrb_en = HICRB_ENSNP1D;
> -		break;
> -	default:
> -		rc = -EINVAL;
> -		goto err_misc_deregister;
> -	}
> -
> -	/* Enable LPC snoop channel at requested port */

Strange that you discard a comment which you added yourself in the
previous patch.

> -	regmap_update_bits(lpc_snoop->regmap, HICR5, hicr5_en, hicr5_en);
> -	regmap_update_bits(lpc_snoop->regmap, SNPWADR, snpwadr_mask,
> -			   lpc_port << snpwadr_shift);
> +	regmap_update_bits(lpc_snoop->regmap, HICR5, channel->cfg->hicr5_en,
> +		channel->cfg->hicr5_en);

Not caused by your patch, but I think regmap_set_bits() could be used
here to improve readability.

> +	regmap_update_bits(lpc_snoop->regmap, SNPWADR, channel->cfg->snpwadr_mask,
> +		lpc_port << channel->cfg->snpwadr_shift);
>  
>  	model_data = of_device_get_match_data(dev);
>  	if (model_data && model_data->has_hicrb_ensnp)
> -		regmap_update_bits(lpc_snoop->regmap, HICRB, hicrb_en, hicrb_en);
> +		regmap_update_bits(lpc_snoop->regmap, HICRB, channel->cfg->hicrb_en,
> +			channel->cfg->hicrb_en);

Could also use regmap_set_bits().

>  
>  	channel->enabled = true;
>  
>  	return 0;
>  
> -err_misc_deregister:
> -	misc_deregister(&lpc_snoop->chan[index].miscdev);
>  err_free_fifo:
>  	kfifo_free(&lpc_snoop->chan[index].fifo);
>  	return rc;
> @@ -272,21 +264,7 @@ static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
>  	if (!channel->enabled)
>  		return;
>  
> -	/* Disable interrupts along with the device */

Any reason for killing this poor innocent comment? ^^

> -	switch (index) {
> -	case 0:
> -		regmap_update_bits(lpc_snoop->regmap, HICR5,
> -				   HICR5_EN_SNP0W | HICR5_ENINT_SNP0W,
> -				   0);
> -		break;
> -	case 1:
> -		regmap_update_bits(lpc_snoop->regmap, HICR5,
> -				   HICR5_EN_SNP1W | HICR5_ENINT_SNP1W,
> -				   0);
> -		break;
> -	default:
> -		return;
> -	}
> +	regmap_update_bits(lpc_snoop->regmap, HICR5, channel->cfg->hicr5_en, 0);

Could use regmap_clear_bits() if I'm not mistaken.

>  
>  	channel->enabled = false;
>  	/* Consider improving safety wrt concurrent reader(s) */
> @@ -294,6 +272,21 @@ static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
>  	kfifo_free(&channel->fifo);
>  }
>  
> +static const struct aspeed_lpc_snoop_channel_cfg channel_cfgs[] = {
> +	{
> +		.hicr5_en = HICR5_EN_SNP0W | HICR5_ENINT_SNP0W,
> +		.snpwadr_mask = SNPWADR_CH0_MASK,
> +		.snpwadr_shift = SNPWADR_CH0_SHIFT,
> +		.hicrb_en = HICRB_ENSNP0D,
> +	},
> +	{
> +		.hicr5_en = HICR5_EN_SNP1W | HICR5_ENINT_SNP1W,
> +		.snpwadr_mask = SNPWADR_CH1_MASK,
> +		.snpwadr_shift = SNPWADR_CH1_SHIFT,
> +		.hicrb_en = HICRB_ENSNP1D,
> +	},
> +};
> +
>  static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
>  {
>  	struct aspeed_lpc_snoop *lpc_snoop;
> @@ -308,6 +301,13 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
>  	if (!lpc_snoop)
>  		return -ENOMEM;
>  
> +	static_assert(ARRAY_SIZE(channel_cfgs) == ARRAY_SIZE(lpc_snoop->chan),
> +		"Broken implementation assumption regarding cfg count");
> +	static_assert(ARRAY_SIZE(lpc_snoop->chan) == 2,
> +		"Broken implementation assumption regarding channel count");

Wouldn't it be good (and maybe sufficient) to declare
aspeed_lpc_snoop_channel_cfg as channel_cfgs[NUM_SNOOP_CHANNELS]?

If you insist on keeping the second assert then you should at least use
NUM_SNOOP_CHANNELS instead of hard-coding 2.

> +	lpc_snoop->chan[0].cfg = &channel_cfgs[0];
> +	lpc_snoop->chan[1].cfg = &channel_cfgs[1];

Could this be done at the beginning of aspeed_lpc_enable_snoop()? So
that you don't have to duplicate the statement (and don't set
lpc_snoop->chan[1].cfg if there's no second port). Would save a WARN as
well.

> +
>  	np = pdev->dev.parent->of_node;
>  	if (!of_device_is_compatible(np, "aspeed,ast2400-lpc-v2") &&
>  	    !of_device_is_compatible(np, "aspeed,ast2500-lpc-v2") &&
> 


-- 
Jean Delvare
SUSE L3 Support
