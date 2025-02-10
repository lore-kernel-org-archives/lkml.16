Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53B7223309
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 12:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739192052; cv=none; b=CgiZm+VffcsopYDDw4CPOd/cF/Tl2Jt5svKE09ErkpqVnLxWirJVoItOyAmbi5qPZ6I821ip2vRnOegjaPZyz/lRxcfbneuwI0fLZX+K1mFQ+p3CIOh4SnUTMp2WcLAqKH4jDf7c6XNULmLSXFLGJxYOcWw6fTHsINLbAdeR/eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739192052; c=relaxed/simple;
	bh=3Bx2FyXiTTnnuO1boKiSMCN8QPwPoaFXEQFG/r95L9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Oof6DmaPzLEKJSDLbC83ba+oAgRn+5rJcyNyE2rbw0CnYiX9ug8sCrpNUeHkIyKPINLzoZQKQhmpHZ/GeUed//JZcfiDAG4GAwQ1Kt3WlYKO6Phx4qTPOTewdmoWP803QElrdYy82b22D4nh55w5d2OZrBOoAkIGvwTejP81Gfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1XSG3tqg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TdS4jbKg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1XSG3tqg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TdS4jbKg; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1XSG3tqg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TdS4jbKg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1XSG3tqg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TdS4jbKg"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B0ADA1F38F;
	Mon, 10 Feb 2025 12:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739192048; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UbA5Sh7zAF/zl7H2Bp4al9zVQ07WyD2PKDiI8FpUUlU=;
	b=1XSG3tqg5Sur2gW7jO/rtgBIfZKuX326iXr3lkkhhJ34pwYtf2rd1Ro2k3Y/+bKiMKkE6V
	gM540tlotRpz2AieXs8yZZad6cDumRhR7/0ey2fbvONN+V3Y5uYG7si+t20C4gmbwY/bm5
	JcpUxvlXxgZQ9wFziJJuvu1dYMDtnrI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739192048;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UbA5Sh7zAF/zl7H2Bp4al9zVQ07WyD2PKDiI8FpUUlU=;
	b=TdS4jbKgq7oZzuraFVUfiHIonkOIvGwLhNSDC9dz+4ndIMj9kkmMleC68rpdV28HWjFKyb
	O49Wq6bfBR1UMwAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1XSG3tqg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=TdS4jbKg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739192048; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UbA5Sh7zAF/zl7H2Bp4al9zVQ07WyD2PKDiI8FpUUlU=;
	b=1XSG3tqg5Sur2gW7jO/rtgBIfZKuX326iXr3lkkhhJ34pwYtf2rd1Ro2k3Y/+bKiMKkE6V
	gM540tlotRpz2AieXs8yZZad6cDumRhR7/0ey2fbvONN+V3Y5uYG7si+t20C4gmbwY/bm5
	JcpUxvlXxgZQ9wFziJJuvu1dYMDtnrI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739192048;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UbA5Sh7zAF/zl7H2Bp4al9zVQ07WyD2PKDiI8FpUUlU=;
	b=TdS4jbKgq7oZzuraFVUfiHIonkOIvGwLhNSDC9dz+4ndIMj9kkmMleC68rpdV28HWjFKyb
	O49Wq6bfBR1UMwAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7D89413707;
	Mon, 10 Feb 2025 12:54:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9BvYHPD2qWfIfQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 10 Feb 2025 12:54:08 +0000
Message-ID: <1584838c-c7e1-4837-b5b2-4325bff58155@suse.de>
Date: Mon, 10 Feb 2025 13:54:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Maintaining Repaper and MI0283QT
To: Alex Lanzano <lanzano.alex@gmail.com>, airlied@gmail.com,
 simona@ffwll.ch, noralf@tronnes.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <mubhrsqwsixflh5iagrtwsbup7nrnxkhwhn3nmqvmfhibwxauo@g3jvqxpo2fb7>
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
In-Reply-To: <mubhrsqwsixflh5iagrtwsbup7nrnxkhwhn3nmqvmfhibwxauo@g3jvqxpo2fb7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B0ADA1F38F
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,tronnes.org,lists.freedesktop.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Hi

Am 07.02.25 um 15:53 schrieb Alex Lanzano:
> I saw that Noralf has to unfortunately step down from maintaining the
> repaper and mi0283qt drivers. I would be more than happy to maintain
> these two if need be. The repaper device is very similar to the
> sharp-memory display I currently maintain and I've worked with mi0283qt
> displays before.

Thank you for stepping up.

Best regards
Thomas

>
> best regards,
> Alex

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

