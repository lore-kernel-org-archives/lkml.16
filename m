Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E481263C66
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744100662; cv=none; b=RiK1bl3Es1KjRnEOVITqMRylUtSqw96G+xbqZXusBSS//C92gIZ5F1FBEu68JbVHMXgHaE7u2npeFm6gsr6jq//gXYnc1JjdxdqNtGyaL7IaqzwCbxBH7FYxzw0/0SEByA0umtZY8kH5zvWxHScdcsKK4VAqIXiemqovUDwVjSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744100662; c=relaxed/simple;
	bh=FqODxgcq4xTFsQUBvIg6+QfBbchRG2U4JrA5fgAq0Ko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sjI5x4HDbTybQi4FDHiolsasYkMpVriQfDlVXf7dqXzL0zwjnColwMmqU9X26660lOZhqVrCzjyw75ACcQdlESsQSmGKjBZ3kbMaZwO0rD4nR95fGxYnOJel4DXIAm5D8gBhW4cyF5KiFskleiRYM0HDltzpYibntwkCfywzhDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GWWDd+b3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CNtYQJvk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GWWDd+b3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CNtYQJvk; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GWWDd+b3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CNtYQJvk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GWWDd+b3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CNtYQJvk"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 71C8C21175;
	Tue,  8 Apr 2025 08:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744100658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LNd99R1t/Bgh6Ea4Ap3UBNSYTs4ZusQqscRM8yi/jQE=;
	b=GWWDd+b3Z7zo/FKROoRZk06fZocWuP8dWBaQ/AUPYgyzD17vZclpa1zNwud1YBRkvslREn
	CMnUPY/7UxZW2Oxkdm9mmOysgwOFhnM2HGLZphzest1qHlG0USwaT+ytB4RSeQ5Sj7HO46
	ocE7M4ZYCs+hP+TKVvQFL53v801nfjs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744100658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LNd99R1t/Bgh6Ea4Ap3UBNSYTs4ZusQqscRM8yi/jQE=;
	b=CNtYQJvkPUCOM8Ma9+WwGu1i/vT5wpREwzHYGO6K/ey5wCHBSWutFQIUY290n557JEYB3g
	hK01mNX8n0TIyNCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GWWDd+b3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=CNtYQJvk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744100658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LNd99R1t/Bgh6Ea4Ap3UBNSYTs4ZusQqscRM8yi/jQE=;
	b=GWWDd+b3Z7zo/FKROoRZk06fZocWuP8dWBaQ/AUPYgyzD17vZclpa1zNwud1YBRkvslREn
	CMnUPY/7UxZW2Oxkdm9mmOysgwOFhnM2HGLZphzest1qHlG0USwaT+ytB4RSeQ5Sj7HO46
	ocE7M4ZYCs+hP+TKVvQFL53v801nfjs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744100658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LNd99R1t/Bgh6Ea4Ap3UBNSYTs4ZusQqscRM8yi/jQE=;
	b=CNtYQJvkPUCOM8Ma9+WwGu1i/vT5wpREwzHYGO6K/ey5wCHBSWutFQIUY290n557JEYB3g
	hK01mNX8n0TIyNCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2652B13691;
	Tue,  8 Apr 2025 08:24:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jDWMBTLd9GcuUQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 08 Apr 2025 08:24:18 +0000
Message-ID: <e976fa2c-88ce-44c3-807b-c6e6e414a28d@suse.de>
Date: Tue, 8 Apr 2025 10:24:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] panel/th101mb31ig002-28a: Use refcounted allocation
 in place of devm_kzalloc()
To: Anusha Srivatsa <asrivats@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>,
 Joel Selvaraj <jo@jsfamily.in>, Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
 <20250401-b4-drm-panel-mass-driver-convert-v1-6-cdd7615e1f93@redhat.com>
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
In-Reply-To: <20250401-b4-drm-panel-mass-driver-convert-v1-6-cdd7615e1f93@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 71C8C21175
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[redhat.com,linaro.org,quicinc.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,jsfamily.in,chromium.org];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Hi

this patch doesn't build.

linux/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c: In function 
‘boe_th101mb31ig002_dsi_probe’:
linux/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c:352:9: error: 
‘panel’ undeclared (first use in this function)
   352 |         panel = devm_drm_panel_alloc(dev, struct panel_desc, panel,
       |         ^~~~~
linux/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c:352:9: note: 
each undeclared identifier is reported only once for each function it 
appears in
In file included from 
linux/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c:18:
linux/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c:352:38: 
error: ‘dev’ undeclared (first use in this function); did you mean ‘cdev’?
   352 |         panel = devm_drm_panel_alloc(dev, struct panel_desc, panel,
       |                                      ^~~


Please fix.

Best regards
Thomas

Am 01.04.25 um 18:03 schrieb Anusha Srivatsa:
> Move to using the new API devm_drm_panel_alloc() to allocate the
> panel.
>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>   drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
> index 0b87f1e6ecaea71f10a249bdc53466d281f07a34..7ae196424b6dfb731cd1ea48363c4fa1e6c36464 100644
> --- a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
> +++ b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
> @@ -349,9 +349,11 @@ static int boe_th101mb31ig002_dsi_probe(struct mipi_dsi_device *dsi)
>   	const struct panel_desc *desc;
>   	int ret;
>   
> -	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
> -	if (!ctx)
> -		return -ENOMEM;
> +	panel = devm_drm_panel_alloc(dev, struct panel_desc, panel,
> +				     &boe_th101mb31ig002_funcs,
> +				     DRM_MODE_CONNECTOR_DSI);
> +	if (IS_ERR(panel))
> +		return PTR_ERR(panel);
>   
>   	mipi_dsi_set_drvdata(dsi, ctx);
>   	ctx->dsi = dsi;
> @@ -383,9 +385,6 @@ static int boe_th101mb31ig002_dsi_probe(struct mipi_dsi_device *dsi)
>   		return dev_err_probe(&dsi->dev, ret,
>   				     "Failed to get orientation\n");
>   
> -	drm_panel_init(&ctx->panel, &dsi->dev, &boe_th101mb31ig002_funcs,
> -		       DRM_MODE_CONNECTOR_DSI);
> -
>   	ret = drm_panel_of_backlight(&ctx->panel);
>   	if (ret)
>   		return ret;
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

