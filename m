Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33731289E30
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746625941; cv=none; b=M3libgPEurHL4cJKJg5yLZqmPL/55euSg0q4ZuWqIsfc9gtuWKQtBJ/u/JLbnOd1wPhVrunB1W75zyYT3qesO114uyqja7d7uEK7I3xirYNHN0Tsuw79jcurDmRhbGa2FsHLMG14OmMS35z/76S7EQ53hjePjHLEId9/X/zOSaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746625941; c=relaxed/simple;
	bh=KZXnhnVlS3ZpCIW8/m7DHyBauUv8UN31Uqw5kc9B10M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mfNhjDjXEo66Z4hcsKIjk834ANIzZGq0H77zLolpn2bvagNd3hs7y3h2+HpzrNFlIV3MR0Os+Kkz9qNVKLCvPk5PIIj4bP3KwhMBLbZhdGnQZ7EPTyu4ytx3cAF/pRV3+jnonogyRA13SP4deLSq7mAjE4/sPdXiZEZ1URFRm30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2GiHouZb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sdtGOSM9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2GiHouZb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sdtGOSM9; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2GiHouZb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sdtGOSM9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2GiHouZb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sdtGOSM9"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1A59F211FE;
	Wed,  7 May 2025 13:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746625938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mrm0LSgf0T7+vZehFw5e/fA0qycFUxwAcsUfEA9Tu5E=;
	b=2GiHouZbu/TlRGvEdr9zCHXJwY8+Auhs+BJVOmXCAIrMjdV3/kBbywt/dZAdsNdYYw57Cs
	fHkfIaE7dqrzPOSRuzl4isRUoZyiOA0EkjyIqAr4hVPzRFHOQcv2K80GuxfWXamw687o22
	UY4CQKfYM/TUVta6MzcgeQLXPMGcZWk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746625938;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mrm0LSgf0T7+vZehFw5e/fA0qycFUxwAcsUfEA9Tu5E=;
	b=sdtGOSM9yYADlYW2cbb7Nk1RQHUxOgGd53cKK7L1JJDaAoQ/S5n8ZZFL9pzoVHiiQYxHFv
	VnOjEg3M4jjs1ZAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=2GiHouZb;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=sdtGOSM9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746625938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mrm0LSgf0T7+vZehFw5e/fA0qycFUxwAcsUfEA9Tu5E=;
	b=2GiHouZbu/TlRGvEdr9zCHXJwY8+Auhs+BJVOmXCAIrMjdV3/kBbywt/dZAdsNdYYw57Cs
	fHkfIaE7dqrzPOSRuzl4isRUoZyiOA0EkjyIqAr4hVPzRFHOQcv2K80GuxfWXamw687o22
	UY4CQKfYM/TUVta6MzcgeQLXPMGcZWk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746625938;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mrm0LSgf0T7+vZehFw5e/fA0qycFUxwAcsUfEA9Tu5E=;
	b=sdtGOSM9yYADlYW2cbb7Nk1RQHUxOgGd53cKK7L1JJDaAoQ/S5n8ZZFL9pzoVHiiQYxHFv
	VnOjEg3M4jjs1ZAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E1BF1139D9;
	Wed,  7 May 2025 13:52:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Z7lKNpFlG2hcTAAAD6G6ig
	(envelope-from <hare@suse.de>); Wed, 07 May 2025 13:52:17 +0000
Message-ID: <61024777-f640-4455-8f96-aa81c48f710b@suse.de>
Date: Wed, 7 May 2025 15:52:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/14] nvmet-fcloop: access fcpreq only when holding
 reqlock
To: Daniel Wagner <wagi@kernel.org>, James Smart <james.smart@broadcom.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Chaitanya Kulkarni <kch@nvidia.com>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250507-nvmet-fcloop-v6-0-ca02e16fb018@kernel.org>
 <20250507-nvmet-fcloop-v6-7-ca02e16fb018@kernel.org>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20250507-nvmet-fcloop-v6-7-ca02e16fb018@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 1A59F211FE
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51

On 5/7/25 14:23, Daniel Wagner wrote:
> The abort handling logic expects that the state and the fcpreq are only
> accessed when holding the reqlock lock.
> 
> While at it, only handle the aborts in the abort handler.
> 
> Signed-off-by: Daniel Wagner <wagi@kernel.org>
> ---
>   drivers/nvme/target/fcloop.c | 31 ++++++++++++++++---------------
>   1 file changed, 16 insertions(+), 15 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
