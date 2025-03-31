Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA56670820
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 09:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743413470; cv=none; b=SqoKhTlaWgIAYxM8mHC45MTg/obo5JhA0Yxby4chKFAVN9mVbltD2DyQ6f3OdKZKtAccTKYMRb+/VbrjUYd3lIaoK0jK2ltOG1+k1VnPyF7WhxPOX3XNFqCWezeuGbWMuAV2BA0vkE15rppoEzutiveqFrDCRmy/dmxI6k/EKn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743413470; c=relaxed/simple;
	bh=uOPwBDL6ifjulW8aJXslWFL1QA+4RKxBW1rvVQyQx7c=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s7+R+1EkW+smivVX5BoFE+rZd4F63Dkuj1FzNycwJgu4OZguXYNxyDdhc4Ror0wzcx9792D0qpTzh5K4+3ZsA6JJPgBACvkKIZjD1MYAjDJ9NpTgtKR6eJnvMTHxOjOfmoGfNIf0AyD5EGVO/iaCmkaFi/xplwZA5NTAm9HLS7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rCr5Dei8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PYT13v0U; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rCr5Dei8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PYT13v0U; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rCr5Dei8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PYT13v0U";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rCr5Dei8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PYT13v0U"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C2AD3211DD;
	Mon, 31 Mar 2025 09:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743413466; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AJXTQNycgRS+GvV3VbpzJ/2q04MFXlHJ1EMhClmTpU8=;
	b=rCr5Dei8U87xbTGxuIHF8/VYXLd30L4UZnMaDRdqKkrxQrMflIHFCoYixSHTmDr79GxP8d
	VGQTrSl3HrCYn42PWwdoYMLmqzxvWv3nE9+daqpQwgf6hex3JC/q/IZcLMSG2b0joX3DjF
	zLUAHxCnZm6fKGZklHx14oZaYXf62Gk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743413466;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AJXTQNycgRS+GvV3VbpzJ/2q04MFXlHJ1EMhClmTpU8=;
	b=PYT13v0UCiO148sXqiJmy0tUEDuSDNsVA36thQp+rwpE3hgJ4Z8bIRa0ruXiFmf1Tq6zZR
	+07bePGZkKTBlaBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rCr5Dei8;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PYT13v0U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743413466; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AJXTQNycgRS+GvV3VbpzJ/2q04MFXlHJ1EMhClmTpU8=;
	b=rCr5Dei8U87xbTGxuIHF8/VYXLd30L4UZnMaDRdqKkrxQrMflIHFCoYixSHTmDr79GxP8d
	VGQTrSl3HrCYn42PWwdoYMLmqzxvWv3nE9+daqpQwgf6hex3JC/q/IZcLMSG2b0joX3DjF
	zLUAHxCnZm6fKGZklHx14oZaYXf62Gk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743413466;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AJXTQNycgRS+GvV3VbpzJ/2q04MFXlHJ1EMhClmTpU8=;
	b=PYT13v0UCiO148sXqiJmy0tUEDuSDNsVA36thQp+rwpE3hgJ4Z8bIRa0ruXiFmf1Tq6zZR
	+07bePGZkKTBlaBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9EDD813A1F;
	Mon, 31 Mar 2025 09:31:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1HVsJdpg6mdSUgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 31 Mar 2025 09:31:06 +0000
Date: Mon, 31 Mar 2025 11:31:06 +0200
Message-ID: <878qol4kdh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sharan Kumar M <sharweshraajan@gmail.com>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Enable Mute LED on HP OMEN 16 Laptop xd000xx
In-Reply-To: <20250329154105.7618-2-sharweshraajan@gmail.com>
References: <20250329154105.7618-2-sharweshraajan@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: C2AD3211DD
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Sat, 29 Mar 2025 16:41:06 +0100,
Sharan Kumar M wrote:
> 
> This patch adds the HP OMEN 16 Laptop xd000xx to enable mute led.
> it uses ALC245_FIXUP_HP_MUTE_LED_COEFBIT with a slight modification setting mute_led_coef.off to 0(it was set to 4 i guess 
> in that function) which i referred to your previous patch disscusion https://bugzilla.kernel.org/show_bug.cgi?id=214735 .
> i am not sure whether i can modify the current working function so i added another version calling
> ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT. and both works for me.
> 
> Tested on 6.13.4-arch1-1 to 6.14.0-arch1-1
> 
> 
> Signed-off-by: Sharan Kumar M <sharweshraajan@gmail.com>

Thanks, applied now.


Takashi
