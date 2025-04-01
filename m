Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229BC1EE7BE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 09:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743500077; cv=none; b=bclibts0DPulCvz0bySyWX0OjBU19EV45pgDjM9ja7h0HYJxhxEq9N/f8gfk/6jdfLN8RaeQ1giTYZaXRfx3JASDUeNFQxXxbegd252I3PWwAZwJbL+OHd1DfO0l59e6NdVu64Qcwz04BZkzj0nZqFKr9uDS1VTyJLS2T/z8XSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743500077; c=relaxed/simple;
	bh=+WDSPE0EAmEf5D/hBDJ0WtmwIdlXQ9kqmthezPrPsLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XT5+f9lPzfoJ21LZ8Ep7Qhk8WWXmsIYRnyW5n8iLsUKLJ3dDNnDAqmEyurRwnVo6WfsfWLl2z72WMFvb7ENzK4eZN4f6YazjTBclULG/9gvK2820Xyude75r6Xqwir5OMlAzV9HIzjsqSDVRiGhTDhYauFVeCum8GwL34dQkTc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KQtfQ09l; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GEelP56n; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KQtfQ09l; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GEelP56n; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KQtfQ09l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GEelP56n";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KQtfQ09l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GEelP56n"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1992B2118C;
	Tue,  1 Apr 2025 09:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743500074; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pjQmAlOnlXRvWyqEdc4jhoeoVjmOcozSBo3JK0Y2ZXw=;
	b=KQtfQ09lLwRwmhyg/hj7Tvqh5Zmnj9xIwwYp4s/IawsEIesqy1x/QA9rYBx+jX9tBpige5
	2HUgN7CHF8/uEMXu9ZvcA/IzlvYW1o7W8O/YQ4UFzqW1CD9WWNTPBuU4ty7DyWwdb4eDWM
	rFE6Jz9W/VGD8gfiNzAdDnh4xW59Mxo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743500074;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pjQmAlOnlXRvWyqEdc4jhoeoVjmOcozSBo3JK0Y2ZXw=;
	b=GEelP56n/Ip/4eaitvMKHlPiYSE9o93D8oQ6wF7KbABzDCfSocJqVTkt+gswOGsYOpNuAE
	oI8wOz+4DjBwBnDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KQtfQ09l;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GEelP56n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743500074; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pjQmAlOnlXRvWyqEdc4jhoeoVjmOcozSBo3JK0Y2ZXw=;
	b=KQtfQ09lLwRwmhyg/hj7Tvqh5Zmnj9xIwwYp4s/IawsEIesqy1x/QA9rYBx+jX9tBpige5
	2HUgN7CHF8/uEMXu9ZvcA/IzlvYW1o7W8O/YQ4UFzqW1CD9WWNTPBuU4ty7DyWwdb4eDWM
	rFE6Jz9W/VGD8gfiNzAdDnh4xW59Mxo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743500074;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pjQmAlOnlXRvWyqEdc4jhoeoVjmOcozSBo3JK0Y2ZXw=;
	b=GEelP56n/Ip/4eaitvMKHlPiYSE9o93D8oQ6wF7KbABzDCfSocJqVTkt+gswOGsYOpNuAE
	oI8wOz+4DjBwBnDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F2FF2138A5;
	Tue,  1 Apr 2025 09:34:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XAvoOimz62fiAgAAD6G6ig
	(envelope-from <hare@suse.de>); Tue, 01 Apr 2025 09:34:33 +0000
Message-ID: <5d0df457-f19e-450f-9073-3f83a091b69a@suse.de>
Date: Tue, 1 Apr 2025 11:34:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/3] nvme: store cqt value into nvme ctrl object
To: Daniel Wagner <wagi@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Keith Busch <kbusch@kernel.org>,
 John Meneghini <jmeneghi@redhat.com>, randyj@purestorage.com,
 Mohamed Khalfella <mkhalfella@purestorage.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250324-tp4129-v1-0-95a747b4c33b@kernel.org>
 <20250324-tp4129-v1-2-95a747b4c33b@kernel.org>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20250324-tp4129-v1-2-95a747b4c33b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1992B2118C
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On 3/24/25 13:07, Daniel Wagner wrote:
> Signed-off-by: Daniel Wagner <wagi@kernel.org>
> ---
>   drivers/nvme/host/core.c | 1 +
>   drivers/nvme/host/nvme.h | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index 40046770f1bf0b98261d8b80e21aa0cc04ebb7a0..135045528ea1c79eac0d6d47d5f7f05a7c98acc4 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -3380,6 +3380,7 @@ static int nvme_init_identify(struct nvme_ctrl *ctrl)
>   	ctrl->kas = le16_to_cpu(id->kas);
>   	ctrl->max_namespaces = le32_to_cpu(id->mnan);
>   	ctrl->ctratt = le32_to_cpu(id->ctratt);
> +	ctrl->cqt = le16_to_cpu(id->cqt);
>   
>   	ctrl->cntrltype = id->cntrltype;
>   	ctrl->dctype = id->dctype;
> diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
> index 7be92d07430e950c3faa764514daf3808009e223..7563332b5b7b76fc6165ec8c6f2d144737d4fe85 100644
> --- a/drivers/nvme/host/nvme.h
> +++ b/drivers/nvme/host/nvme.h
> @@ -344,6 +344,7 @@ struct nvme_ctrl {
>   	u32 oaes;
>   	u32 aen_result;
>   	u32 ctratt;
> +	u16 cqt;
>   	unsigned int shutdown_timeout;
>   	unsigned int kato;
>   	bool subsystem;
> 
Hmm. I would squash it with the next patch, but I'm sure others have
other opinions.

So:

Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
