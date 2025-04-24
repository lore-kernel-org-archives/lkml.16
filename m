Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBC17D3F4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489724; cv=none; b=LwuPDt0OpERe+9hS3/d14grm/ZfOzoao0TFkFZuULcG2Mx1lSn12TEEt7kZ/dXkOJKwspr7zQwtqXrgMCrmtK5idUr7YNySpgvN7anNFB8527DV9RQD+vH6ETnUxp6SCf0sf/ML289W7uoUEeWIBlwHOtKW3eel1bfAwvtJIQm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489724; c=relaxed/simple;
	bh=AV+4TArRd9RPzTzzXm918DGTMEIfqH2SnQp10TcMH9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jjFTrkCqyBCUUR0YJefCV8ioEtyxJyK0/6ZvELIgwXRAFcTX9BrRCG1IJ8edk7Sl6uCjFoWBPnOIUyKZQiZn6ioloKmaO9vVjYnN6xplV9qTvyGviovzGzanoKOEeJByF14djKTfpphax4uoxwqXrSLCRQ5aaCt8zDP/AWwXo8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PBc9+a5B; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Whu6XTgh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PBc9+a5B; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Whu6XTgh; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PBc9+a5B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Whu6XTgh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PBc9+a5B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Whu6XTgh"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B8D4F21174;
	Thu, 24 Apr 2025 10:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745489720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a5IQBKvYRsGe/TYklWhuDg/hyExQn4176RKKuvoFBrE=;
	b=PBc9+a5BUERupde4QZodH2bjqOzXfLNLsviLTDZAiCwYayp7qMPvNHgqs9GvVmHRA31VhJ
	1lJbPRD1Wm3R/EMevUxtNvsw+Gao2HBpg8OD4aX9jz6I0Sw948LziGwdphTDfEfWTtWPJ5
	LEIgnRzfrYfdIw3y4ORYE74yjkKvjm4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745489720;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a5IQBKvYRsGe/TYklWhuDg/hyExQn4176RKKuvoFBrE=;
	b=Whu6XTghMed//5dYjmeUpfJvwDwUA2ofXhLLWAAnmtbOaWOGJL6KnjwZ73EVbClJoIwUSB
	QhQvuBC43MJFOpBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745489720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a5IQBKvYRsGe/TYklWhuDg/hyExQn4176RKKuvoFBrE=;
	b=PBc9+a5BUERupde4QZodH2bjqOzXfLNLsviLTDZAiCwYayp7qMPvNHgqs9GvVmHRA31VhJ
	1lJbPRD1Wm3R/EMevUxtNvsw+Gao2HBpg8OD4aX9jz6I0Sw948LziGwdphTDfEfWTtWPJ5
	LEIgnRzfrYfdIw3y4ORYE74yjkKvjm4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745489720;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a5IQBKvYRsGe/TYklWhuDg/hyExQn4176RKKuvoFBrE=;
	b=Whu6XTghMed//5dYjmeUpfJvwDwUA2ofXhLLWAAnmtbOaWOGJL6KnjwZ73EVbClJoIwUSB
	QhQvuBC43MJFOpBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 95A7C139D0;
	Thu, 24 Apr 2025 10:15:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LOEbIzgPCmgkJwAAD6G6ig
	(envelope-from <hare@suse.de>); Thu, 24 Apr 2025 10:15:20 +0000
Message-ID: <9444ac93-b0f7-4198-ad0f-d8c950b5d0ec@suse.de>
Date: Thu, 24 Apr 2025 12:15:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/14] nvmet-fcloop: access fcpreq only when holding
 reqlock
To: Daniel Wagner <wagi@kernel.org>, James Smart <james.smart@broadcom.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Chaitanya Kulkarni <kch@nvidia.com>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250423-nvmet-fcloop-v5-0-3d7f968728a5@kernel.org>
 <20250423-nvmet-fcloop-v5-7-3d7f968728a5@kernel.org>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20250423-nvmet-fcloop-v5-7-3d7f968728a5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Flag: NO

On 4/23/25 15:21, Daniel Wagner wrote:
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
> diff --git a/drivers/nvme/target/fcloop.c b/drivers/nvme/target/fcloop.c
> index 0c0117e03adc81c643e90a7e7832ff087a4c2fd7..9adaee3c7129f7e270842c5d09f78de2e108479a 100644
> --- a/drivers/nvme/target/fcloop.c
> +++ b/drivers/nvme/target/fcloop.c
> @@ -619,12 +619,13 @@ fcloop_fcp_recv_work(struct work_struct *work)
>   {
>   	struct fcloop_fcpreq *tfcp_req =
>   		container_of(work, struct fcloop_fcpreq, fcp_rcv_work);
> -	struct nvmefc_fcp_req *fcpreq = tfcp_req->fcpreq;
> +	struct nvmefc_fcp_req *fcpreq;
>   	unsigned long flags;
>   	int ret = 0;
>   	bool aborted = false;
>   
>   	spin_lock_irqsave(&tfcp_req->reqlock, flags);
> +	fcpreq = tfcp_req->fcpreq;
>   	switch (tfcp_req->inistate) {
>   	case INI_IO_START:
>   		tfcp_req->inistate = INI_IO_ACTIVE;
> @@ -639,16 +640,19 @@ fcloop_fcp_recv_work(struct work_struct *work)
>   	}
>   	spin_unlock_irqrestore(&tfcp_req->reqlock, flags);
>   
> -	if (unlikely(aborted))
> -		ret = -ECANCELED;
> -	else {
> -		if (likely(!check_for_drop(tfcp_req)))
> -			ret = nvmet_fc_rcv_fcp_req(tfcp_req->tport->targetport,
> -				&tfcp_req->tgt_fcp_req,
> -				fcpreq->cmdaddr, fcpreq->cmdlen);
> -		else
> -			pr_info("%s: dropped command ********\n", __func__);
> +	if (unlikely(aborted)) {
> +		/* the abort handler will call fcloop_call_host_done */
> +		return;
> +	}
> +
> +	if (unlikely(check_for_drop(tfcp_req))) {
> +		pr_info("%s: dropped command ********\n", __func__);
> +		return;
>   	}
> +
> +	ret = nvmet_fc_rcv_fcp_req(tfcp_req->tport->targetport,
> +				   &tfcp_req->tgt_fcp_req,
> +				   fcpreq->cmdaddr, fcpreq->cmdlen);
>   	if (ret)
>   		fcloop_call_host_done(fcpreq, tfcp_req, ret);
>   }
> @@ -663,9 +667,10 @@ fcloop_fcp_abort_recv_work(struct work_struct *work)
>   	unsigned long flags;
>   
>   	spin_lock_irqsave(&tfcp_req->reqlock, flags);
> -	fcpreq = tfcp_req->fcpreq;
>   	switch (tfcp_req->inistate) {
>   	case INI_IO_ABORTED:
> +		fcpreq = tfcp_req->fcpreq;
> +		tfcp_req->fcpreq = NULL;
>   		break;
>   	case INI_IO_COMPLETED:
>   		completed = true;
> @@ -688,10 +693,6 @@ fcloop_fcp_abort_recv_work(struct work_struct *work)
>   		nvmet_fc_rcv_fcp_abort(tfcp_req->tport->targetport,
>   					&tfcp_req->tgt_fcp_req);
>   
> -	spin_lock_irqsave(&tfcp_req->reqlock, flags);
> -	tfcp_req->fcpreq = NULL;
> -	spin_unlock_irqrestore(&tfcp_req->reqlock, flags);
> -
What happens for INI_IO_COMPLETED?
Don't we need to clear the 'fcpreq' pointer in that case, too?

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
