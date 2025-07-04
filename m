Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954AD2E36E0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 16:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751647456; cv=none; b=eS5l5x9bmpGSgODIGScZXe2oMxX+Pyjvn8WxiHdS4+C4vpth/crjP4ghgqTASHF6K6B3m1kc3tGuYk5zjv8Kr1cub9U2vVP8bUVFOdiJaPnLvbpRlKqZ/NJaoaqi2oms4XnTDWo6EeCwQLE7Yc0BHIRdXqgsLG3EnQQflWLJXaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751647456; c=relaxed/simple;
	bh=IiVhvvIUKL154sHh0mv375cULp9fD050+oT9Rck//OI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i+0cEr0pPnFhXDJ7eA5UCzT2mU2TQQl1n4+RhKVvXPMR2PGSM693zsHmQN60F2OOt7akxszmw0h/HN4msQRXn2E9RX9aVEA18I8RTl/jF04llA2MG2vwJoCf9uUJWlhArOGQuhDzSt18sSjd0yTnsmuExVtibX8927SkJbpf4D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RcWspLcB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BX5TyJQ0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RcWspLcB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BX5TyJQ0; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RcWspLcB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BX5TyJQ0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RcWspLcB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BX5TyJQ0"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A40F7211BA;
	Fri,  4 Jul 2025 16:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751647452; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qxQHpdBMzlCPDXHMm1ORYDxLqtE7pehFuUdHE7/n4Vo=;
	b=RcWspLcB3YBLz305W0/E2X3o2YDattPqn7XJh+U1iJ4jVh1XmbEzQtiDD/yXmUyz0hdcTa
	CtxsYq8d0mKgOvWWg0wEK8ORFnD0uC3R1YHtPZBmXSTqdQQ7NU46NDqbzyXPg+6Wu/wrNJ
	CxOYlhSxiOd5BjKeGyvSGg/mQmJpLmE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751647452;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qxQHpdBMzlCPDXHMm1ORYDxLqtE7pehFuUdHE7/n4Vo=;
	b=BX5TyJQ0SJEeI7nPi09seMV2vHO8EfK3VDsOUju91z3BoNPwcqgZow/prMeNGGI5irC7NZ
	vTn6sb+54PzS5ZAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751647452; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qxQHpdBMzlCPDXHMm1ORYDxLqtE7pehFuUdHE7/n4Vo=;
	b=RcWspLcB3YBLz305W0/E2X3o2YDattPqn7XJh+U1iJ4jVh1XmbEzQtiDD/yXmUyz0hdcTa
	CtxsYq8d0mKgOvWWg0wEK8ORFnD0uC3R1YHtPZBmXSTqdQQ7NU46NDqbzyXPg+6Wu/wrNJ
	CxOYlhSxiOd5BjKeGyvSGg/mQmJpLmE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751647452;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qxQHpdBMzlCPDXHMm1ORYDxLqtE7pehFuUdHE7/n4Vo=;
	b=BX5TyJQ0SJEeI7nPi09seMV2vHO8EfK3VDsOUju91z3BoNPwcqgZow/prMeNGGI5irC7NZ
	vTn6sb+54PzS5ZAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 32D3113757;
	Fri,  4 Jul 2025 16:44:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BiWQCdwEaGj+HwAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Fri, 04 Jul 2025 16:44:12 +0000
Date: Fri, 4 Jul 2025 18:44:08 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-aspeed@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Henry
 Martin <bsdhenrymartin@gmail.com>, Patrick Rudolph
 <patrick.rudolph@9elements.com>, Andrew Geissler <geissonator@yahoo.com>,
 Ninad Palsule <ninad@linux.ibm.com>, Patrick Venture <venture@google.com>,
 Robert Lippert <roblip@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/10] soc: aspeed: lpc-snoop: Constrain parameters
 in channel paths
Message-ID: <20250704184408.32227305@endymion>
In-Reply-To: <20250616-aspeed-lpc-snoop-fixes-v2-4-3cdd59c934d3@codeconstruct.com.au>
References: <20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd59c934d3@codeconstruct.com.au>
	<20250616-aspeed-lpc-snoop-fixes-v2-4-3cdd59c934d3@codeconstruct.com.au>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[codeconstruct.com.au:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.80

On Mon, 16 Jun 2025 22:43:41 +0930, Andrew Jeffery wrote:
> Ensure pointers and the channel index are valid before use.
> 
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> index ca7536213e0986f737606a52996ffea620df2a7a..804c6ed9c4c671da73a6c66c1de41c59922c82dc 100644
> --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> @@ -25,7 +25,6 @@
>  
>  #define DEVICE_NAME	"aspeed-lpc-snoop"
>  
> -#define NUM_SNOOP_CHANNELS 2
>  #define SNOOP_FIFO_SIZE 2048
>  
>  #define HICR5	0x80
> @@ -57,6 +56,12 @@ struct aspeed_lpc_snoop_model_data {
>  	unsigned int has_hicrb_ensnp;
>  };
>  
> +enum aspeed_lpc_snoop_index {
> +	ASPEED_LPC_SNOOP_INDEX_0 = 0,
> +	ASPEED_LPC_SNOOP_INDEX_1 = 1,
> +	ASPEED_LPC_SNOOP_INDEX_MAX = ASPEED_LPC_SNOOP_INDEX_1,
> +};

I don't have a strong opinion on this (again, I'm neither the driver
maintainer nor the subsystem maintainer so my opinion has little
value), but IMHO the main value of introducing an enum here was to make
it possible to get rid of the default statement in the switch
constructs. With switch constructs being gone in patch 10/10 (soc:
aspeed: lpc-snoop: Lift channel config to const structs), the value of
this enum seems pretty low now. You could use NUM_SNOOP_CHANNELS
instead of ASPEED_LPC_SNOOP_INDEX_MAX + 1 and 0 and 1 instead of
ASPEED_LPC_SNOOP_INDEX_0 and ASPEED_LPC_SNOOP_INDEX_1, respectively,
and the code would work just the same, while being more simple, with no
downside that I can see.

-- 
Jean Delvare
SUSE L3 Support
