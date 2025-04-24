Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5741C7019
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490073; cv=none; b=HR4HabDTQSybY1kCCaI6BO09EKvKWCSGdjc0FJ1X9fohOQwUE/6wPhR1D8sKx56UYjq53K9hzP/qpwmvT+Wr4PhgHbcOHzI9TYJgdiXN+VxOoUEffcYGt+x4hXGt6ctMLPyJTfJmtw4OaOYvUNpMkX/aPWIusif5Au8UhGIm80I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490073; c=relaxed/simple;
	bh=NO0YNrSUpeeUz/umMcxKASEz7GpHr+A4vuAb/Rv3BpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J2hLGwOFt3FF0eQbgQTO3iPO0vU9rX0Nd/bUieP6ip5X6fXVeOf5zdb56Bp6kEoh6Ttau2i9xqv/UMsVlzrEm+7cPaYW4R2mibH0FDU1CAyBVOMiB6b0VdUcF7z+0bZObeeNyyIb669VgyEUKhLpKwbpFnF6j5mywWWKD/lbv+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wq9G5fdD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7qzyewYo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Yhzr6B0a; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3jKVYwRt; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wq9G5fdD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7qzyewYo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Yhzr6B0a";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3jKVYwRt"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E272521170;
	Thu, 24 Apr 2025 10:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745490070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2t0TWwoG7f9YsNTtW+kGMC8SR5v5qT56DFtVKfvVtTE=;
	b=wq9G5fdDOFV027hKveuIbr3COfsK3yd6CE3DaFc99Il6vDAMurxpNqWnDvM50Hdn0FFQMc
	VPd+gntn48Iko+ThEXZzl+c5G5Tx5qaC03qLStHZwjznQm7lNFcStSo4oNuIQERr2kVwsp
	zWLgYjKsp19BpvUO6ljC+jEqLxky8nA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745490070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2t0TWwoG7f9YsNTtW+kGMC8SR5v5qT56DFtVKfvVtTE=;
	b=7qzyewYoJPKDFKD3EOyfsXCkoOmB7bEWSaUG8/lwNzFDMUtyfHODA6WqyCcGE2czT9Cp3I
	54MHnKUKetu37rAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Yhzr6B0a;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3jKVYwRt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745490069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2t0TWwoG7f9YsNTtW+kGMC8SR5v5qT56DFtVKfvVtTE=;
	b=Yhzr6B0ayBJYu95t81xuqdd+h6SUScVInBmPDPMNoXQfYhi5eAU8kJXwb+Af16/Ym3KuPt
	ZBKfeobVF8mfbtG0EAEmdv2gK47Fo3lkEyPu2ObglyG9/MteJbF6LW6EHH5gyVOOu2kvku
	/CBOMljMYxFPsYZK8mqKjRUbRmIr2Tc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745490069;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2t0TWwoG7f9YsNTtW+kGMC8SR5v5qT56DFtVKfvVtTE=;
	b=3jKVYwRtFzFGI3Sy+/P4HP+LA29Hhju5M+YJnknupeRkBNvv1AvEo5LUHy0k1NLS8gRgF3
	htGOSVxTZatV7BAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C72B8139D0;
	Thu, 24 Apr 2025 10:21:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fCTVL5UQCmjSKAAAD6G6ig
	(envelope-from <hare@suse.de>); Thu, 24 Apr 2025 10:21:09 +0000
Message-ID: <05ac9a81-66a9-4bbc-92e0-6ff47a6dc7ad@suse.de>
Date: Thu, 24 Apr 2025 12:21:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/14] nvmet-fcloop: don't wait for lport cleanup
To: Daniel Wagner <wagi@kernel.org>, James Smart <james.smart@broadcom.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Chaitanya Kulkarni <kch@nvidia.com>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250423-nvmet-fcloop-v5-0-3d7f968728a5@kernel.org>
 <20250423-nvmet-fcloop-v5-10-3d7f968728a5@kernel.org>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20250423-nvmet-fcloop-v5-10-3d7f968728a5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E272521170
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On 4/23/25 15:21, Daniel Wagner wrote:
> The lifetime of the fcloop_lsreq is not tight to the lifetime of the
> host or target port, thus there is no need anymore to synchronize the
> cleanup path anymore.
> 
> Signed-off-by: Daniel Wagner <wagi@kernel.org>
> ---
>   drivers/nvme/target/fcloop.c | 21 ++++-----------------
>   1 file changed, 4 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/nvme/target/fcloop.c b/drivers/nvme/target/fcloop.c
> index 47ce51183a66b4b37fc850cced2ddf70be2cdb42..ca11230bffedb0f2313a99e24e54e892daf0d644 100644
> --- a/drivers/nvme/target/fcloop.c
> +++ b/drivers/nvme/target/fcloop.c
> @@ -207,7 +207,6 @@ static LIST_HEAD(fcloop_nports);
>   struct fcloop_lport {
>   	struct nvme_fc_local_port *localport;
>   	struct list_head lport_list;
> -	struct completion unreg_done;
>   	refcount_t ref;
>   };
>   
> @@ -1083,9 +1082,6 @@ fcloop_localport_delete(struct nvme_fc_local_port *localport)
>   	struct fcloop_lport_priv *lport_priv = localport->private;
>   	struct fcloop_lport *lport = lport_priv->lport;
>   
> -	/* release any threads waiting for the unreg to complete */
> -	complete(&lport->unreg_done);
> -
>   	fcloop_lport_put(lport);
>   }
>   
> @@ -1238,18 +1234,9 @@ fcloop_create_local_port(struct device *dev, struct device_attribute *attr,
>   }
>   
>   static int
> -__wait_localport_unreg(struct fcloop_lport *lport)
> +__localport_unreg(struct fcloop_lport *lport)
>   {
> -	int ret;
> -
> -	init_completion(&lport->unreg_done);
> -
> -	ret = nvme_fc_unregister_localport(lport->localport);
> -
> -	if (!ret)
> -		wait_for_completion(&lport->unreg_done);
> -
> -	return ret;
> +	return nvme_fc_unregister_localport(lport->localport);
>   }
>   
>   static struct fcloop_nport *
> @@ -1332,7 +1319,7 @@ fcloop_delete_local_port(struct device *dev, struct device_attribute *attr,
>   	if (!lport)
>   		return -ENOENT;
>   
> -	ret = __wait_localport_unreg(lport);
> +	ret = __localport_unreg(lport);
>   	fcloop_lport_put(lport);
>   
>   	return ret ? ret : count;
> @@ -1776,7 +1763,7 @@ static void __exit fcloop_exit(void)
>   
>   		spin_unlock_irqrestore(&fcloop_lock, flags);
>   
> -		ret = __wait_localport_unreg(lport);
> +		ret = __localport_unreg(lport);
>   		if (ret)
>   			pr_warn("%s: Failed deleting local port\n", __func__);
>   
> 
And who is freeing the allocated fcloop_lsreq structures?

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
