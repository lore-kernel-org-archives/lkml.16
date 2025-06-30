Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC0D20E032
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751283441; cv=none; b=KJZfUO/kSJuyZSMCGubZUeGTHH61hntYHtOXCP4lsZlgJq3XgZikeO+Fmt3VP2d8tojT/iB6eDb8q1zAwIFueBQZnh55bv9iaJskecDy21tvyyr69QhJsxvQIa6xubH2UehfgFiENDr4QICOAAjJTCbzVgPNo0yudH0ISgdomMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751283441; c=relaxed/simple;
	bh=k6RFILVugMSJXcK86odZo3f8SWM0jcB3GZUsc7r7a/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=emgAMzfJiUZBIho6T/FqV77kRNCp2NpAujRP6b/mRuq/no6FYvw7vyAD9m6p/DWzhFEpbaAJZipIP0pnHZZ3KXzfG85mGsxu6PsHn+M3VP4h8Y7ZBXYm5mlhgHBk4rRpVwLahUe017CSyyPZEwUXUzGPBmfn/QXl6o+p0QbJuq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qwgA3s8E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Whl5v57d; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qwgA3s8E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Whl5v57d; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qwgA3s8E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Whl5v57d";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qwgA3s8E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Whl5v57d"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 27EC51F390;
	Mon, 30 Jun 2025 11:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751283438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fQP5n5jurUvp47X/wr/DaABvZAO1KzBq4Ptarr0vgys=;
	b=qwgA3s8EEtOQHKBRyslwT2Z1B5j3qL8w2ZN5INLQ/BJjFPkicUv6zG1Sl0kDtdp9jE60v4
	LR5kd3vwlHY3aogISL1lvavtBEsiYWnw1mKYfU3hBbDjntnFxWOEuJzqhNOEg9rb79I38z
	rHgDjLV7QBrv8rRAnmcETTQTpu2hQto=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751283438;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fQP5n5jurUvp47X/wr/DaABvZAO1KzBq4Ptarr0vgys=;
	b=Whl5v57dSdUda0AqnmwFNGRD0TgaZ03w1wf6xjnb8WX3anOcu4GJPoR2ZggWGj8gIEPzjp
	tu7RB4A8vEAdymDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751283438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fQP5n5jurUvp47X/wr/DaABvZAO1KzBq4Ptarr0vgys=;
	b=qwgA3s8EEtOQHKBRyslwT2Z1B5j3qL8w2ZN5INLQ/BJjFPkicUv6zG1Sl0kDtdp9jE60v4
	LR5kd3vwlHY3aogISL1lvavtBEsiYWnw1mKYfU3hBbDjntnFxWOEuJzqhNOEg9rb79I38z
	rHgDjLV7QBrv8rRAnmcETTQTpu2hQto=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751283438;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fQP5n5jurUvp47X/wr/DaABvZAO1KzBq4Ptarr0vgys=;
	b=Whl5v57dSdUda0AqnmwFNGRD0TgaZ03w1wf6xjnb8WX3anOcu4GJPoR2ZggWGj8gIEPzjp
	tu7RB4A8vEAdymDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D76FB13983;
	Mon, 30 Jun 2025 11:37:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YmcxM+12Ymg/OgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 30 Jun 2025 11:37:17 +0000
Message-ID: <9f420ae9-beb5-43b0-8447-6f00d7f72535@suse.de>
Date: Mon, 30 Jun 2025 13:37:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/tests: Fix endian warning
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org,
 cristian.ciocaltea@collabora.com, gcarlos@disroot.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250630090054.353246-1-jose.exposito89@gmail.com>
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
In-Reply-To: <20250630090054.353246-1-jose.exposito89@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,ffwll.ch,collabora.com,disroot.org,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 



Am 30.06.25 um 11:00 schrieb José Expósito:
> When compiling with sparse enabled, this warning is thrown:
>
>    warning: incorrect type in argument 2 (different base types)
>       expected restricted __le32 const [usertype] *buf
>       got unsigned int [usertype] *[assigned] buf
>
> Add a cast to fix it.
>
> Fixes: 453114319699 ("drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_xrgb2101010()")
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/tests/drm_format_helper_test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> index 7299fa8971ce..86829e1cb7f0 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -1033,7 +1033,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
>   		NULL : &result->dst_pitch;
>   
>   	drm_fb_xrgb8888_to_xrgb2101010(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
> -	buf = le32buf_to_cpu(test, buf, dst_size / sizeof(u32));
> +	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
>   	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>   
>   	buf = dst.vaddr; /* restore original value of buf */

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

