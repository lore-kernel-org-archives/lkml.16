Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB72D19A
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 11:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746099610; cv=none; b=Vre7zPNSskLf3Tx5Wx23I2Hf/1pcAWLJjkRWbaVsBI4IaxJEDLIerPs0xeAxsecwgg5tIFnwb+/pCOd2djvp5rW/CoND0ue0kTWm0PiUTgilm7XArVzlAicgw6v70S6bu+XUy6DxiLguBfFcjsHWRkcz8n/Wpw9s7Ea+efgeMLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746099610; c=relaxed/simple;
	bh=FY7i9ySnzDKJVwIHgoYmlrPid+jBpBnbUPtfQoe2SnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nstpPsF+EydleY0jLIHuBZsj9KI0crgUSQfAXKcaIv9U3wQVG15sKJv0K6zUmtheGfqrJ7R+4Kkh8+qahm3N/2ajSWOQ0s6OvSXme2ZCYxORvia2O7rqez6RVwyzEBbZZNPVGgqJ/1/CcaC0B5d4BmI8TGpTkvzAMc9fhetJorY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zBus/T3A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WWgZTIUq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aeTvuNR5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ebFqSTjv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zBus/T3A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WWgZTIUq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aeTvuNR5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ebFqSTjv"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C8D4721210;
	Thu,  1 May 2025 11:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746099600; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wZMwpw29R+5bRJxtHJU340o40TdbMjMQX6rZrnPy7QE=;
	b=zBus/T3ALWG5rtaYrS6Uk9o0UsMsDPX2OiAfa7Y6rX4+gRWiAUTmy3D5FxrtXKsM4XU83K
	5Rg11xc+OlAu0f1VrQU90rLYylENxKPYFj6ClVyClC5RXnZWuUebW9MMN9PFEkVm9kR9kA
	7Wxm06W3GxLuuefnFsOp6+l1DZbNtf4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746099600;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wZMwpw29R+5bRJxtHJU340o40TdbMjMQX6rZrnPy7QE=;
	b=WWgZTIUqALdcq/jtUHrtsc/c1G2FICT2Qm0z9CbtNTfj0/YuLKJW0ZbNhaBoi9q2CmvMP8
	aaD+MFR9WWg8iaAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=aeTvuNR5;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ebFqSTjv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746099599; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wZMwpw29R+5bRJxtHJU340o40TdbMjMQX6rZrnPy7QE=;
	b=aeTvuNR59XPjzTWCsqNU2rXg4tHYYc+3K4IGxu0uQR1/8USiFrjWnxVuyb6MYni4U/ZUIo
	NqjE96ZhaJEGjtmW4UPdM8NY02w9ButwSZ69Eke4RvhQ1D8gcfVq7Q8OUGnj/Etua4i6iu
	LTrtxzBocQMhPHCrNJviHXSLENL2B7o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746099599;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wZMwpw29R+5bRJxtHJU340o40TdbMjMQX6rZrnPy7QE=;
	b=ebFqSTjvIgFzkTrmaMyR+CVK6Lc+D3eLyhcncIpq6qrYcu3/Bv9md3DwvItpCwid/VZh4F
	GKfsmjq8YdMRo6BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 76BE5139E7;
	Thu,  1 May 2025 11:39:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2rZ+Go9dE2jiNAAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Thu, 01 May 2025 11:39:59 +0000
Message-ID: <82a39d6d-ee7c-4ff2-af87-efda939e5568@suse.de>
Date: Thu, 1 May 2025 14:39:58 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/irq-bcm2712-mip: Add ARCH_BCM2835 arch option
To: Peter Robinson <pbrobinson@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Stanimir Varbanov <svarbanov@suse.de>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250416082523.179507-1-pbrobinson@gmail.com>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <20250416082523.179507-1-pbrobinson@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C8D4721210
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com,linutronix.de,suse.de,kernel.org,vger.kernel.org,lists.infradead.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Hi Peter,

On 4/16/25 11:25 AM, Peter Robinson wrote:
> The ARCH_BCM2835 is used widely for platforms enabling
> the Raspberry Pi and some drivers that make use of this
> driver are enabled using this or the BRCMSTB option so
> add this too so the users that want RPi5 without all the
> other STB devices end up with the driver as well.
> 
> Fixes: 32c6c054661a ("irqchip: Add Broadcom BCM2712 MSI-X interrupt controller")
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>  drivers/irqchip/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Stanimir Varbanov <svarbanov@suse.de>

> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index cec05e443083..08bb3b031f23 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -114,8 +114,8 @@ config I8259
>  
>  config BCM2712_MIP
>  	tristate "Broadcom BCM2712 MSI-X Interrupt Peripheral support"
> -	depends on ARCH_BRCMSTB || COMPILE_TEST
> -	default m if ARCH_BRCMSTB
> +	depends on ARCH_BRCMSTB || ARCH_BCM2835 || COMPILE_TEST
> +	default m if ARCH_BRCMSTB || ARCH_BCM2835
>  	depends on ARM_GIC
>  	select GENERIC_IRQ_CHIP
>  	select IRQ_DOMAIN_HIERARCHY

