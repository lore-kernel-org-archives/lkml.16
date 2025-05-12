Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B1920326
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 06:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747032780; cv=none; b=Y0IeP3Tk5IUR+aYudFuLUwEr6CvuXdP84TUp9tgy1GRPsF14U8IWCtMOnX5KFCOLS9VVIJv+0XigimF4lewMrLNY4AClpGbUcfwWlck+R/d2N/+5CQhBJJewrJdAbBBE168w0+GhU1xEqyOqMuq0nnJ1eHeoijpsacMVfj3F3MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747032780; c=relaxed/simple;
	bh=q+4hpuiW0G+U3VR58m8dP8SxubVa/xOr/Q3rMa7PfEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QxqM9oWOO5HRP2+35ikZ/LyVCcD9quJEPdkh+W++z71wC/Ti5ZK0psrACqeXpIdGglOtEnBqLnm7y+RehhPE1lmZLldKQ+Rq1tum5TvmJD1GRzZdmtTggXRNdGUxBT/DfSzz+J6jfmh58yTMn/RR7yx77fzJN9sadOLkKnu4VEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QlExkglM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ovzUngJn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XdOn/Jft; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NA8yFggq; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QlExkglM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ovzUngJn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XdOn/Jft";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NA8yFggq"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D8AA4211B1;
	Mon, 12 May 2025 06:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747032777; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hzv2KvOidr3xs/D3WqlSkPug9UNWzHtNl+4GGK8twCI=;
	b=QlExkglMZxXExcUPWd4z6UUTfvgYwjIoynskw8VyGB1nD0QhJjLoA1y5KEVU5BM0fihZ4c
	CBVwUc05o++WJn3pDu21FnrH3YT3xNx0kMfearc4OEi1PfcjVa1ib0yqFbJYLQpK7gf8Ad
	zwDZ8qXsBmcs9AmIvQfIaEFPE3D/0f0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747032777;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hzv2KvOidr3xs/D3WqlSkPug9UNWzHtNl+4GGK8twCI=;
	b=ovzUngJnMXIOQAvEH8yOS8sBlNi9LxJZAro4Kc6iY3/6gANfC7Jr2Aa6Q1UBuP9uA05Eg7
	xwgVztWSS0Q8/EBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="XdOn/Jft";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=NA8yFggq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747032776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hzv2KvOidr3xs/D3WqlSkPug9UNWzHtNl+4GGK8twCI=;
	b=XdOn/Jft9pDeoBF1EE7Fle2tXCFogTbyXFc9/eJFKq2wOdbbHYKqEFUgSIqsvy8Wzoe3Q7
	5L++p5/iZi3IF9IgZ6QWtCm1zOcJXQeQbcopYd+KGBE9OpJa9z0X9RcJWBjq6DB6sLiliZ
	vZyWrxjFuVXRlMx0gwXZSIXf4L+Z+N0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747032776;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hzv2KvOidr3xs/D3WqlSkPug9UNWzHtNl+4GGK8twCI=;
	b=NA8yFggqlB+iCTgoASGauyv09F6HlFvyucZRrJ7PZJjP8xztl0qfcwj+drvmElve+BDIn6
	lBddSxMTEEGIfqBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 940B5137D2;
	Mon, 12 May 2025 06:52:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id h2PIIsiaIWgLfwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 12 May 2025 06:52:56 +0000
Message-ID: <7133e9b4-c05a-4901-940e-de3e70bbbb1e@suse.de>
Date: Mon, 12 May 2025 08:52:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: drm_auth: Convert mutex usage to guard(mutex)
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Kees Cook <keescook@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: <20250509142627.639419-1-andrealmeid@igalia.com>
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
In-Reply-To: <20250509142627.639419-1-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: D8AA4211B1
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[igalia.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Score: -4.51

Hi

Am 09.05.25 um 16:26 schrieb André Almeida:
> Replace open-coded mutex handling with cleanup.h guard(mutex). This
> simplifies the code and removes the "goto unlock" pattern.
>
> Tested with igt tests core_auth and core_setmaster.
>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

but with questions below

> ---
>
> For more information about guard(mutex):
> https://www.kernel.org/doc/html/latest/core-api/cleanup.html

This page lists issues with guards, so conversion from manual locking 
should be decided on a case-by-case base IMHO.

> ---
>   drivers/gpu/drm/drm_auth.c | 64 ++++++++++++++------------------------
>   1 file changed, 23 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index 22aa015df387..d6bf605b4b90 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -95,7 +95,7 @@ int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
>   	struct drm_auth *auth = data;
>   	int ret = 0;
>   
> -	mutex_lock(&dev->master_mutex);
> +	guard(mutex)(&dev->master_mutex);

These guard statements are hidden variable declarations. Shouldn't they 
rather go to the function top with the other declarations? This would 
also help to prevent the problem listed in cleanup.html to some extend.

Best regards
Thomas

>   	if (!file_priv->magic) {
>   		ret = idr_alloc(&file_priv->master->magic_map, file_priv,
>   				1, 0, GFP_KERNEL);
> @@ -103,7 +103,6 @@ int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
>   			file_priv->magic = ret;
>   	}
>   	auth->magic = file_priv->magic;
> -	mutex_unlock(&dev->master_mutex);
>   
>   	drm_dbg_core(dev, "%u\n", auth->magic);
>   
> @@ -118,13 +117,12 @@ int drm_authmagic(struct drm_device *dev, void *data,
>   
>   	drm_dbg_core(dev, "%u\n", auth->magic);
>   
> -	mutex_lock(&dev->master_mutex);
> +	guard(mutex)(&dev->master_mutex);
>   	file = idr_find(&file_priv->master->magic_map, auth->magic);
>   	if (file) {
>   		file->authenticated = 1;
>   		idr_replace(&file_priv->master->magic_map, NULL, auth->magic);
>   	}
> -	mutex_unlock(&dev->master_mutex);
>   
>   	return file ? 0 : -EINVAL;
>   }
> @@ -248,41 +246,33 @@ int drm_setmaster_ioctl(struct drm_device *dev, void *data,
>   {
>   	int ret;
>   
> -	mutex_lock(&dev->master_mutex);
> +	guard(mutex)(&dev->master_mutex);
>   
>   	ret = drm_master_check_perm(dev, file_priv);
>   	if (ret)
> -		goto out_unlock;
> +		return ret;
>   
>   	if (drm_is_current_master_locked(file_priv))
> -		goto out_unlock;
> +		return ret;
>   
> -	if (dev->master) {
> -		ret = -EBUSY;
> -		goto out_unlock;
> -	}
> +	if (dev->master)
> +		return -EBUSY;
>   
> -	if (!file_priv->master) {
> -		ret = -EINVAL;
> -		goto out_unlock;
> -	}
> +	if (!file_priv->master)
> +		return -EINVAL;
>   
> -	if (!file_priv->is_master) {
> -		ret = drm_new_set_master(dev, file_priv);
> -		goto out_unlock;
> -	}
> +	if (!file_priv->is_master)
> +		return drm_new_set_master(dev, file_priv);
>   
>   	if (file_priv->master->lessor != NULL) {
>   		drm_dbg_lease(dev,
>   			      "Attempt to set lessee %d as master\n",
>   			      file_priv->master->lessee_id);
> -		ret = -EINVAL;
> -		goto out_unlock;
> +		return -EINVAL;
>   	}
>   
>   	drm_set_master(dev, file_priv, false);
> -out_unlock:
> -	mutex_unlock(&dev->master_mutex);
> +
>   	return ret;
>   }
>   
> @@ -299,33 +289,27 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
>   {
>   	int ret;
>   
> -	mutex_lock(&dev->master_mutex);
> +	guard(mutex)(&dev->master_mutex);
>   
>   	ret = drm_master_check_perm(dev, file_priv);
>   	if (ret)
> -		goto out_unlock;
> +		return ret;
>   
> -	if (!drm_is_current_master_locked(file_priv)) {
> -		ret = -EINVAL;
> -		goto out_unlock;
> -	}
> +	if (!drm_is_current_master_locked(file_priv))
> +		return -EINVAL;
>   
> -	if (!dev->master) {
> -		ret = -EINVAL;
> -		goto out_unlock;
> -	}
> +	if (!dev->master)
> +		return -EINVAL;
>   
>   	if (file_priv->master->lessor != NULL) {
>   		drm_dbg_lease(dev,
>   			      "Attempt to drop lessee %d as master\n",
>   			      file_priv->master->lessee_id);
> -		ret = -EINVAL;
> -		goto out_unlock;
> +		return -EINVAL;
>   	}
>   
>   	drm_drop_master(dev, file_priv);
> -out_unlock:
> -	mutex_unlock(&dev->master_mutex);
> +
>   	return ret;
>   }
>   
> @@ -337,7 +321,7 @@ int drm_master_open(struct drm_file *file_priv)
>   	/* if there is no current master make this fd it, but do not create
>   	 * any master object for render clients
>   	 */
> -	mutex_lock(&dev->master_mutex);
> +	guard(mutex)(&dev->master_mutex);
>   	if (!dev->master) {
>   		ret = drm_new_set_master(dev, file_priv);
>   	} else {
> @@ -345,7 +329,6 @@ int drm_master_open(struct drm_file *file_priv)
>   		file_priv->master = drm_master_get(dev->master);
>   		spin_unlock(&file_priv->master_lookup_lock);
>   	}
> -	mutex_unlock(&dev->master_mutex);
>   
>   	return ret;
>   }
> @@ -355,7 +338,7 @@ void drm_master_release(struct drm_file *file_priv)
>   	struct drm_device *dev = file_priv->minor->dev;
>   	struct drm_master *master;
>   
> -	mutex_lock(&dev->master_mutex);
> +	guard(mutex)(&dev->master_mutex);
>   	master = file_priv->master;
>   	if (file_priv->magic)
>   		idr_remove(&file_priv->master->magic_map, file_priv->magic);
> @@ -376,7 +359,6 @@ void drm_master_release(struct drm_file *file_priv)
>   	/* drop the master reference held by the file priv */
>   	if (file_priv->master)
>   		drm_master_put(&file_priv->master);
> -	mutex_unlock(&dev->master_mutex);
>   }
>   
>   /**

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

