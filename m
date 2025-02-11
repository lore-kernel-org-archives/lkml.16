Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9DB2505C8
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 16:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739290441; cv=none; b=T8pWTFKPA1ZWKsnAfDuzPZiMyW0UI0q9vUI1W61KHX0N8w929jsZgYGhzTGI36Jlh8RhcaQ098pTUVlIlyIHV8f6kp/r/GYHvUwkZr0wFbI6E6tmzvqSrWbGsnGlzvB8buZ0d9eOUydktye4UTMtRttQ4FxDfQIazMbQtpxjRY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739290441; c=relaxed/simple;
	bh=fBXYzcqvIbd45QOCvQrKCQ9uKzMybGKj5Y3ci1KNHZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bLr6oo5NjkNhRMgt0YrALX4hzRC4h2ozQh9npmWreSQ4c7Hhfm/tzQViayuZYx7OPpRAwNpTiJMG2KvdS4f0apT7v/npMa7fm8ptBNck5vEXaIBT2Aiy0F7vDrNfwS8Oambmch/q02GUCmSe1NCDjPxLMQa6svQifLiyQLlxago=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LsPOHtxD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zqQ5h6Se; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LsPOHtxD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zqQ5h6Se; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LsPOHtxD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zqQ5h6Se";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LsPOHtxD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zqQ5h6Se"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 18882340B9;
	Tue, 11 Feb 2025 14:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739284436; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wP4TiwjPCAJH4FpvrSugoXVfViPrtoVII+IT/shhIyA=;
	b=LsPOHtxDyXmjO7R5FP4U3CHNFHEuIJ8z5Rav6kW8+hmDdu4vu94LHQF7p4qp78e+nrcna3
	CC77R91ptd6o0H+00HdAfapC2/L9ngL1Y6ujuwPW33mvnF3E46rj54MyO51LHYB0/bJbTy
	/NX/fO6/w3+6CI3JPBPhtKgVVZyw9Pk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739284436;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wP4TiwjPCAJH4FpvrSugoXVfViPrtoVII+IT/shhIyA=;
	b=zqQ5h6SeLM3p46dSgh7OSMqmCIhwpsQSPOrMs8N4DHLTVcANt70307YKiESEnLgz7NSvET
	Q01DIafhRuSrqsDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739284436; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wP4TiwjPCAJH4FpvrSugoXVfViPrtoVII+IT/shhIyA=;
	b=LsPOHtxDyXmjO7R5FP4U3CHNFHEuIJ8z5Rav6kW8+hmDdu4vu94LHQF7p4qp78e+nrcna3
	CC77R91ptd6o0H+00HdAfapC2/L9ngL1Y6ujuwPW33mvnF3E46rj54MyO51LHYB0/bJbTy
	/NX/fO6/w3+6CI3JPBPhtKgVVZyw9Pk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739284436;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wP4TiwjPCAJH4FpvrSugoXVfViPrtoVII+IT/shhIyA=;
	b=zqQ5h6SeLM3p46dSgh7OSMqmCIhwpsQSPOrMs8N4DHLTVcANt70307YKiESEnLgz7NSvET
	Q01DIafhRuSrqsDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BA1D213782;
	Tue, 11 Feb 2025 14:33:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CnwFLNNfq2cLUQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 11 Feb 2025 14:33:55 +0000
Message-ID: <428f88f2-1f30-4018-8113-1c4716288789@suse.de>
Date: Tue, 11 Feb 2025 15:33:55 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/15] drm/vkms: Fix use after free and double free on
 init error
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250211110912.15409-1-jose.exposito89@gmail.com>
 <20250211110912.15409-2-jose.exposito89@gmail.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20250211110912.15409-2-jose.exposito89@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,bootlin.com];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Hi

Am 11.02.25 um 12:08 schrieb José Expósito:
> If the driver initialization fails, the vkms_exit() function might
> access an uninitialized or freed default_config pointer and it might
> double free it.
>
> Fix both possible errors by initializing default_config only when the
> driver initialization succeeded.

Could you send this patch separately, so that it can go into 
drm-misc-fixes quickly?

Best regards
Thomas

>
> Reported-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Link: https://lore.kernel.org/all/Z5uDHcCmAwiTsGte@louis-chauvet-laptop/
> Fixes: 2df7af93fdad ("drm/vkms: Add vkms_config type")
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>   drivers/gpu/drm/vkms/vkms_drv.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 7c142bfc3bd9..b6de91134a22 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -235,17 +235,19 @@ static int __init vkms_init(void)
>   	if (!config)
>   		return -ENOMEM;
>   
> -	default_config = config;
> -
>   	config->cursor = enable_cursor;
>   	config->writeback = enable_writeback;
>   	config->overlay = enable_overlay;
>   
>   	ret = vkms_create(config);
> -	if (ret)
> +	if (ret) {
>   		kfree(config);
> +		return ret;
> +	}
>   
> -	return ret;
> +	default_config = config;
> +
> +	return 0;
>   }
>   
>   static void vkms_destroy(struct vkms_config *config)
> @@ -269,9 +271,10 @@ static void vkms_destroy(struct vkms_config *config)
>   
>   static void __exit vkms_exit(void)
>   {
> -	if (default_config->dev)
> -		vkms_destroy(default_config);
> +	if (!default_config)
> +		return;
>   
> +	vkms_destroy(default_config);
>   	kfree(default_config);
>   }
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

