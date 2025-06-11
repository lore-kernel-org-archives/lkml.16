Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BBE22338
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749656321; cv=none; b=MhsWdnrUKwNr2kEXtup2EGQD9JvGsAyWuPkepP2IqBFYpf/K1U1ey+tH6D7e08I+fbuYNRYBiVp0zNJX2a3hfz4gg8hIQ4OR+Tii9YCCsGxlt2BXbT+pVvjqXAUwrjRIxhSH2J4LlFXpEQVNLu2+ShkjZg+vk7pBWXAjqa83Aew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749656321; c=relaxed/simple;
	bh=bZoP8z6K1sb/0mYz00sUANozCkNkO7ck8cCBM6hKPpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SqOcbDFqLsumwbEBfQ9WIx2WsKtkzVMqoZ6dX9W1zrJa/Q3PfR44ijB2thvjJAkGOreB70OK4gCGHXv+GTuyIVy4Bhq3wmekUY4LUFwYt6WHihECQZRon+iFcvI2aVkMcFEiOwPpcVaqDOS2q3NBRzMIS/ue/1ItHlbg8075kJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SvjQGE8U; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pzmUiJi/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SvjQGE8U; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pzmUiJi/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SvjQGE8U";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pzmUiJi/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SvjQGE8U";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pzmUiJi/"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 23CDD218EB;
	Wed, 11 Jun 2025 15:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749656315; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Dwhrw/EHSGZ+qlML6k1JAfb4u3M0ventqUmJA+/Di9A=;
	b=SvjQGE8UppzZxpL7EVJXlU6S+nk4KnfHbjI7n0zZD3z+4njLtJTHljumo9EvFziAATt5ND
	dF/gwvfxqLI+2J0Cy5F2TcUfTmNGBYdClz3HwphpPWSILZBWJBEZEglBaKKQ2ThVGULy01
	WE5mQo/g+pUfToGZj5JiB3FpS4w30Fc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749656315;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Dwhrw/EHSGZ+qlML6k1JAfb4u3M0ventqUmJA+/Di9A=;
	b=pzmUiJi/0DjIZjNK+zoQ2GBpNnQax7iIpEronpASwSBvtB5M+NZgT5rMpwOukHswZIYsle
	wjSt2kVGbqMSOeAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749656315; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Dwhrw/EHSGZ+qlML6k1JAfb4u3M0ventqUmJA+/Di9A=;
	b=SvjQGE8UppzZxpL7EVJXlU6S+nk4KnfHbjI7n0zZD3z+4njLtJTHljumo9EvFziAATt5ND
	dF/gwvfxqLI+2J0Cy5F2TcUfTmNGBYdClz3HwphpPWSILZBWJBEZEglBaKKQ2ThVGULy01
	WE5mQo/g+pUfToGZj5JiB3FpS4w30Fc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749656315;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Dwhrw/EHSGZ+qlML6k1JAfb4u3M0ventqUmJA+/Di9A=;
	b=pzmUiJi/0DjIZjNK+zoQ2GBpNnQax7iIpEronpASwSBvtB5M+NZgT5rMpwOukHswZIYsle
	wjSt2kVGbqMSOeAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E1534139CE;
	Wed, 11 Jun 2025 15:38:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ogynNfqiSWiqdwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 11 Jun 2025 15:38:34 +0000
Message-ID: <fb6d8eb9-cdc1-4d07-8a55-928282c9e7ad@suse.de>
Date: Wed, 11 Jun 2025 17:38:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ssd130x: fix ssd132x_clear_screen() columns
To: Javier Martinez Canillas <javierm@redhat.com>,
 John Keeping <jkeeping@inmusicbrands.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250611111307.1814876-1-jkeeping@inmusicbrands.com>
 <87y0tycumu.fsf@minerva.mail-host-address-is-not-set>
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
In-Reply-To: <87y0tycumu.fsf@minerva.mail-host-address-is-not-set>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[]
X-Spam-Level: 

Hi

Am 11.06.25 um 14:47 schrieb Javier Martinez Canillas:
> John Keeping <jkeeping@inmusicbrands.com> writes:
>
> Hello John,
>
>> The number of columns relates to the width, not the height.  Use the
>> correct variable.
>>
>> Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
>> ---
>>   drivers/gpu/drm/solomon/ssd130x.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
>> index dd2006d51c7a2..eec43d1a55951 100644
>> --- a/drivers/gpu/drm/solomon/ssd130x.c
>> +++ b/drivers/gpu/drm/solomon/ssd130x.c
>> @@ -974,7 +974,7 @@ static void ssd130x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
>>   
>>   static void ssd132x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
>>   {
>> -	unsigned int columns = DIV_ROUND_UP(ssd130x->height, SSD132X_SEGMENT_WIDTH);
>> +	unsigned int columns = DIV_ROUND_UP(ssd130x->width, SSD132X_SEGMENT_WIDTH);
>>   	unsigned int height = ssd130x->height;
>>   
> Ups, indeed. Thanks for fixing it!
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Could you please add a Fixes tag before merging the patch? Thanks!

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

