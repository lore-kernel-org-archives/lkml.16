Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F0D1B0420
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 07:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748245052; cv=none; b=KrHfeT74VL6nPco2l1C2T8TE1rFyeCWenLMhrvKcTS9g5ddxYE7XgkXmVmgmTc13tMyAiXxkN6DobBq2KhH0C0rLxe+Fr24hnTW/z1jx0LP4QTd38EYLsOdp6F2BSJgtUxfkrlNyFwdfmydKK2l4rp01ghdf1MTOylYWqxQ8ouU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748245052; c=relaxed/simple;
	bh=U9DOP0ZQk2xe6udCV4YXFIVzl/S0eMvpue3MgNSi4As=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N01eoXHUzoXbx4yneyWxHrI/1i6ZyCdHi2dzJsF6uo6WS0QTkTpf9w/EMNQLmg3cEJPT5v+gRUbCtA+Kb98LkkITgFE+Jcy+cY1vzpKsHvQtZQHhNdgKfJQztGmZf9L+708yJAZvybEnt8UsyhlejtsUFRqaW5ZP4du1GG2shpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UlgodH8+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PXLB2pff; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UlgodH8+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PXLB2pff; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UlgodH8+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PXLB2pff";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UlgodH8+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PXLB2pff"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 893471F82E;
	Mon, 26 May 2025 07:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748245048; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=b5WA9id1jsylC6pxXa7hI70PrfVToq0dBoQhvVaR02I=;
	b=UlgodH8+4bML30voMcwE3UcgO6anfHuTNszcgvePn+iZyXRucuc1807pxGZzSQ/tYIO9qW
	6NsUWu0cAbOFWHZlTBxhWD+vkslVxqlOmG/dcRavCwDw5Kb1gnEIHpu7YDN4djn1T+VxIf
	ifVaKARlKqo5NeYzOJwp41Ht3JrIBEU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748245048;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=b5WA9id1jsylC6pxXa7hI70PrfVToq0dBoQhvVaR02I=;
	b=PXLB2pff202senB512T1L7mA1uejcxI4RhWdenLYQYksjMTHwgk1ovYwGwMjXMk3ojYT77
	kPZnDwi+J5LzWFBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748245048; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=b5WA9id1jsylC6pxXa7hI70PrfVToq0dBoQhvVaR02I=;
	b=UlgodH8+4bML30voMcwE3UcgO6anfHuTNszcgvePn+iZyXRucuc1807pxGZzSQ/tYIO9qW
	6NsUWu0cAbOFWHZlTBxhWD+vkslVxqlOmG/dcRavCwDw5Kb1gnEIHpu7YDN4djn1T+VxIf
	ifVaKARlKqo5NeYzOJwp41Ht3JrIBEU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748245048;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=b5WA9id1jsylC6pxXa7hI70PrfVToq0dBoQhvVaR02I=;
	b=PXLB2pff202senB512T1L7mA1uejcxI4RhWdenLYQYksjMTHwgk1ovYwGwMjXMk3ojYT77
	kPZnDwi+J5LzWFBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5035D1397F;
	Mon, 26 May 2025 07:37:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YycKEjgaNGhMOgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 26 May 2025 07:37:28 +0000
Message-ID: <deb97144-9880-4bab-b33e-8415467e8446@suse.de>
Date: Mon, 26 May 2025 09:37:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gem-framebuffer: log errors when gem size < afbc_size
To: Andy Yan <andyshrk@163.com>, Daniel Stone <daniel@fooishbar.org>
Cc: simona@ffwll.ch, mripard@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250508084811.2472877-1-andyshrk@163.com>
 <CAPj87rMJgJaj8p_2DLdM8p3phB+eQnMm7iAHgEe_R8sjuGox1w@mail.gmail.com>
 <6883df90.7132.196f6fc6055.Coremail.andyshrk@163.com>
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
In-Reply-To: <6883df90.7132.196f6fc6055.Coremail.andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[163.com,fooishbar.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_FIVE(0.00)[6]
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 

Hi

Am 22.05.25 um 09:54 schrieb Andy Yan:
> Hello，
>
>
> At 2025-05-08 17:11:01, "Daniel Stone" <daniel@fooishbar.org> wrote:
>> Hi Andy,
>>
>> On Thu, 8 May 2025 at 11:49, Andy Yan <andyshrk@163.com> wrote:
>>> Let the user know what went wrong in drm_gem_fb_afbc_init
>>> failure paths.
>> Thanks for this, and thanks also for using drm_dbg_kms() to make sure
>> that userspace can't flood the log with errors.
>>
>> Reviewed-by: Daniel Stone <daniels@collabora.com>
>
> May I kindly ask which Maintainer can take this patch?

Merged into drm-misc-next. Thanks for the patch.

Best regards
Thomas

>
>> Cheers,
>> Daniel

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

