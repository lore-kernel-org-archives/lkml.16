Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A756C1E7640
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489594; cv=none; b=q4MYr0n+d4CJGTpNnO94bWPFNjC+Cm7MLmTXF6/pznkXAt9A6XqrZjMNaw7FKBXQHemwUF/9IqhucYM9L8518MmUwMgmAXMBOrhBZwXp78k0PzsiTUzWjjxwg0NVkaWmPemcKCDMhHjKiL4Oyw3gxilYVXrix5MTsJKz4l9KnnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489594; c=relaxed/simple;
	bh=2zjJY1NHlvRDgf4VdR7Ra+w0GjCB30Bk56K9KlQMbjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fQisFH7Iug2VEusaj1VVOg91YGLpAhXGv3+gniKrvPC152vzSR6desSQKbTvXgvJlOMNTgm7RQKZSv7aFGbiwCYOyTWY5gfMBvQqYLZuX27bbBd4N/5AvkXNujzzjXf/7yvovuEH3PspIouO39x7UqVN4IIYYJNASjdfE2fLbno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hm0QKjG0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BD6zeNP+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hm0QKjG0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BD6zeNP+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hm0QKjG0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BD6zeNP+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hm0QKjG0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BD6zeNP+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C45BB21186;
	Thu, 24 Apr 2025 10:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745489590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=op76xD/fUtanS4QBrB74ussM+f0lWDr70admEMRi6cY=;
	b=hm0QKjG0JyUgzRhE5fBSaxeZ8j+9uiufOWfq3g5bhL6AuOJCa5JH9r9gVfkaGO+5fn2L2Z
	EeAWS2z+7Hi5Ipv0fLtC4mMKKp5LFbUCpF/RKEUS6U25F858l7RlvFhTEO6+KGZ0cKGKkE
	OSKbJDEtBWpV3YnnetTj9hYNyU+ExQ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745489590;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=op76xD/fUtanS4QBrB74ussM+f0lWDr70admEMRi6cY=;
	b=BD6zeNP+TtARTxxmOUyd8MihFbw5Pjl82dFUBw4V5CR09BQUIdyIXSO7+2duckglkSP7Gu
	Dk3/iNCCl8+SgPAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745489590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=op76xD/fUtanS4QBrB74ussM+f0lWDr70admEMRi6cY=;
	b=hm0QKjG0JyUgzRhE5fBSaxeZ8j+9uiufOWfq3g5bhL6AuOJCa5JH9r9gVfkaGO+5fn2L2Z
	EeAWS2z+7Hi5Ipv0fLtC4mMKKp5LFbUCpF/RKEUS6U25F858l7RlvFhTEO6+KGZ0cKGKkE
	OSKbJDEtBWpV3YnnetTj9hYNyU+ExQ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745489590;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=op76xD/fUtanS4QBrB74ussM+f0lWDr70admEMRi6cY=;
	b=BD6zeNP+TtARTxxmOUyd8MihFbw5Pjl82dFUBw4V5CR09BQUIdyIXSO7+2duckglkSP7Gu
	Dk3/iNCCl8+SgPAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AB91D1393C;
	Thu, 24 Apr 2025 10:13:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hABuKbYOCmiAJgAAD6G6ig
	(envelope-from <hare@suse.de>); Thu, 24 Apr 2025 10:13:10 +0000
Message-ID: <89289452-3647-4d94-baf9-529d145b652f@suse.de>
Date: Thu, 24 Apr 2025 12:13:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/14] nvmet-fcloop: add missing
 fcloop_callback_host_done
To: Daniel Wagner <wagi@kernel.org>, James Smart <james.smart@broadcom.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Chaitanya Kulkarni <kch@nvidia.com>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250423-nvmet-fcloop-v5-0-3d7f968728a5@kernel.org>
 <20250423-nvmet-fcloop-v5-6-3d7f968728a5@kernel.org>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20250423-nvmet-fcloop-v5-6-3d7f968728a5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Flag: NO

On 4/23/25 15:21, Daniel Wagner wrote:
> Add the missing fcloop_call_host_done calls so that the caller
> frees resources when something goes wrong.
> 
> Signed-off-by: Daniel Wagner <wagi@kernel.org>
> ---
>   drivers/nvme/target/fcloop.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/nvme/target/fcloop.c b/drivers/nvme/target/fcloop.c
> index b54467b285181d6909c6592eb166cf4fe6fbe54c..0c0117e03adc81c643e90a7e7832ff087a4c2fd7 100644
> --- a/drivers/nvme/target/fcloop.c
> +++ b/drivers/nvme/target/fcloop.c
> @@ -966,9 +966,10 @@ fcloop_fcp_abort(struct nvme_fc_local_port *localport,
>   	}
>   	spin_unlock(&inireq->inilock);
>   
> -	if (!tfcp_req)
> +	if (!tfcp_req) {
>   		/* abort has already been called */
> -		return;
> +		goto out_host_done;
> +	}
>   
Sure this is correct?
If the abort has been called I would have expected that all resources
are cleaned up by the abort, so we wouldn't need to do that here...

>   	/* break initiator/target relationship for io */
>   	spin_lock_irqsave(&tfcp_req->reqlock, flags);
> @@ -983,7 +984,7 @@ fcloop_fcp_abort(struct nvme_fc_local_port *localport,
>   	default:
>   		spin_unlock_irqrestore(&tfcp_req->reqlock, flags);
>   		WARN_ON(1);
> -		return;
> +		goto out_host_done;

Do we still need the WARN_ON()? We can now gracefully recover, so a
simple log message would be sufficient here, no?

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
