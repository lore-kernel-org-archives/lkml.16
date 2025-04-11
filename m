Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF2A1D86FB
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744379551; cv=none; b=WlYEsbPD7XJ7uL0XXZJj2hx1AFzDg+pez1+Gm04InyvvsvlAy5srey87/C7c5UC8E2jrJ4jT3ixak0IKcEgYp+soomVXJEU/pFu5J7cuXrEtXyz1s2NQPuGwpjYpmVtuzRJgxtgoJ+2JEyGNOAQEJ9B39otqVzNhg1Q9PNeZuDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744379551; c=relaxed/simple;
	bh=szzDNYi10SZeGHWmUnxazURY4qRgxQ93N4avMNpODMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t5UD7Y+dQMKNyJTS/PZFadwN8WgaUnmOQqD49SViKCwyikPTtw+wAD1dj0C6cs2BBLonzts9obIA3DwlP7oYX8JW+8vyT6UzAX5U6/AIyeSb1tDRp9yS3bue5c2ce2q+CjQchCRYNuayBki9WzqeZJH6nhZAQ0WZN1SFAxGnp/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Cbbo/L4N; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7vnG/ak7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=e9nshYrh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HbDhCzK7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Cbbo/L4N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7vnG/ak7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e9nshYrh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HbDhCzK7"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E8DFE1F457;
	Fri, 11 Apr 2025 13:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744379548; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=bn4vEdF7BMMX6U/j8Vn/KS84WNVVfGH2V+Zaq+K+Ek0=;
	b=Cbbo/L4N1VXWJr1Dzw8LiAPuOKSos9kURIN1aiZ/74aStqjsHYBMISn9Azq19Tb4d0WMkB
	4kJYeJbxjhyUfjkheX7pn1QMhlPA3A3qUc62slwlpXBUOCEhMY/k0ZdoV81BksCv6nRjrJ
	zB3VDCq0MIW2aQxdqVEyaDHIdTG/8mI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744379548;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=bn4vEdF7BMMX6U/j8Vn/KS84WNVVfGH2V+Zaq+K+Ek0=;
	b=7vnG/ak7/3Rrc3uWUSYH32fTThIuHTnHkd5/hl6udGLyUlkQTbwkjW/C42QALuxB9PHHio
	iF2xWSLpzNX4+hCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744379547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=bn4vEdF7BMMX6U/j8Vn/KS84WNVVfGH2V+Zaq+K+Ek0=;
	b=e9nshYrhpApkfcZ0wX7eDzXN5ykgD6XNdquem1rKe7T5GjkM0r1WAX0qk1Vs6o4BvOzgC3
	hVdNUMa6TLmkRusZWBgZ1SQfs6xf7Jmy27k3X+X1/QBAp2chP1JPBqp+/GBsGNmPi09zX3
	3ZW23c1OmVdjod6FFAeXIREmrcQ5qdU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744379547;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=bn4vEdF7BMMX6U/j8Vn/KS84WNVVfGH2V+Zaq+K+Ek0=;
	b=HbDhCzK7/5/yDt1WArz2pENtbzWSMMAh60B68pU+lFEGRQX9suf5rVZy75yNS3fpNZ87NV
	uSZbfbHUJcOQZhBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 86C2613886;
	Fri, 11 Apr 2025 13:52:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OuMKH5se+WfHfQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 11 Apr 2025 13:52:27 +0000
Message-ID: <f455789b-c0bb-469d-b6bf-35774d0323c1@suse.de>
Date: Fri, 11 Apr 2025 15:52:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/efidrm: ensure screen_base is initialized
To: Javier Martinez Canillas <javierm@redhat.com>,
 Arnd Bergmann <arnd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20250411125554.1453825-1-arnd@kernel.org>
 <8734ee3ksz.fsf@minerva.mail-host-address-is-not-set>
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
In-Reply-To: <8734ee3ksz.fsf@minerva.mail-host-address-is-not-set>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[lkml];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[redhat.com,kernel.org,linux.intel.com,gmail.com,ffwll.ch];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,gmail.com,google.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

Hi Arnd

Am 11.04.25 um 15:11 schrieb Javier Martinez Canillas:
> Arnd Bergmann <arnd@kernel.org> writes:
>
> Hello Arnd,
>
>> From: Arnd Bergmann <arnd@arndb.de>

Thanks for the fix.

>>
>> clang points out that there is a code path that leads to undefined behavior:
>>
>> drivers/gpu/drm/sysfb/efidrm.c:353:11: error: variable 'screen_base' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>>    353 |         else if (mem_flags & EFI_MEMORY_WB)
>>        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> Add the missing initialization.
>>
>> Fixes: 32ae90c66fb6 ("drm/sysfb: Add efidrm for EFI displays")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
> A similar patch has been proposed by Nathan already and acked by Thomas:
>
> https://lists.freedesktop.org/archives/dri-devel/2025-April/500539.html

I've meanwhile merged this patch into drm-misc-next.

Best regards
Thomas

>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

