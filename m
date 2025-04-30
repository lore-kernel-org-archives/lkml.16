Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158AF1DE2A7
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 06:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745993320; cv=none; b=Fy4CAvIbXwA5LHZMunogKGL+gSn1pGTkK6/gQZpUXIgXiGBcgHuT6ti0yILeaV/wyphlqyPEe+fyhd8GwYnFg5ScamS/sUPb0nVGHV5xtWGFT2LICtqERMuk48RMRztd/e46KBRphl8TyVcpnJbAPvnKN3UYGxfC9I8+nNZH7sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745993320; c=relaxed/simple;
	bh=5lOJcGEX7G4Zx9jpydFFSo49PqTeib4SkU/oMsR7eNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AAIA54p56YiZGiHgkfPmC1oFPOxtpVwXEa0oSBDD+FZW0H+9teZLh8cRRCHkF42mNcQcYjcscRWX5eJtjTRs73wGSYHTo1jGaUc7EOcEryAgfz2zz4PaNJUjd/8o6BoExJzECrSyqksqhndTRsy2/GhgB84T5sTjf3O8NZjn/nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fDEQ8Zpk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qVq1Icc0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fDEQ8Zpk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qVq1Icc0; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fDEQ8Zpk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qVq1Icc0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fDEQ8Zpk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qVq1Icc0"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1EA3B211E5;
	Wed, 30 Apr 2025 06:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745993317; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iCJ7kphXDRJ8nsOq63foj70HkiOS92To0zYCk/e+AIs=;
	b=fDEQ8ZpkVj0MXrc8R2xno8NlIQF1aT/PKyO452+QM8M4EQrDNbzhjyuLJWOZheWO9HHcQV
	gXrXTKdWhrsYzxLffyrAtLdZ3dK57AdO1OnbYyDgZzjLCLPKkF3iArtL+WZGqCc9pZVKI6
	bntKqvddUyXq1Y5fn7H+KqLXjKcDDHo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745993317;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iCJ7kphXDRJ8nsOq63foj70HkiOS92To0zYCk/e+AIs=;
	b=qVq1Icc0Gx/cRf8HT+DsU5RtydquBqBAec6OpMd8tmLHx6kZ8tagFNK5CwM+P8SPH7QYMd
	4S0gZoRGNSLUtsBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fDEQ8Zpk;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qVq1Icc0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745993317; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iCJ7kphXDRJ8nsOq63foj70HkiOS92To0zYCk/e+AIs=;
	b=fDEQ8ZpkVj0MXrc8R2xno8NlIQF1aT/PKyO452+QM8M4EQrDNbzhjyuLJWOZheWO9HHcQV
	gXrXTKdWhrsYzxLffyrAtLdZ3dK57AdO1OnbYyDgZzjLCLPKkF3iArtL+WZGqCc9pZVKI6
	bntKqvddUyXq1Y5fn7H+KqLXjKcDDHo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745993317;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iCJ7kphXDRJ8nsOq63foj70HkiOS92To0zYCk/e+AIs=;
	b=qVq1Icc0Gx/cRf8HT+DsU5RtydquBqBAec6OpMd8tmLHx6kZ8tagFNK5CwM+P8SPH7QYMd
	4S0gZoRGNSLUtsBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A6B9C139E7;
	Wed, 30 Apr 2025 06:08:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RgHkJmS+EWhfZAAAD6G6ig
	(envelope-from <hare@suse.de>); Wed, 30 Apr 2025 06:08:36 +0000
Message-ID: <80bf4e1d-b60d-4c61-a887-b6d093cfbd60@suse.de>
Date: Wed, 30 Apr 2025 08:08:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] nvme: only allow entering LIVE from CONNECTING state
To: Keith Busch <kbusch@kernel.org>
Cc: Daniel Wagner <dwagner@suse.de>, Guenter Roeck <linux@roeck-us.net>,
 Daniel Wagner <wagi@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 James Smart <james.smart@broadcom.com>,
 Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250214-nvme-fc-fixes-v1-0-7a05d557d5cc@kernel.org>
 <20250214-nvme-fc-fixes-v1-1-7a05d557d5cc@kernel.org>
 <0134ea15-8d5f-41f7-9e9a-d7e6d82accaa@roeck-us.net>
 <cb46aa83-8033-4d64-a3c7-420172c3f3f5@flourine.local>
 <9763c4cf-8ca5-45d4-b723-270548ca1001@suse.de> <aBEW4W40ZelIXfs2@kbusch-mbp>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <aBEW4W40ZelIXfs2@kbusch-mbp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1EA3B211E5
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On 4/29/25 20:13, Keith Busch wrote:
> On Mon, Apr 28, 2025 at 03:21:18PM +0200, Hannes Reinecke wrote:
>>> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
>>> index b502ac07483b..d3c4eacf607f 100644
>>> --- a/drivers/nvme/host/core.c
>>> +++ b/drivers/nvme/host/core.c
>>> @@ -4493,7 +4493,8 @@ static void nvme_fw_act_work(struct work_struct *work)
>>>                   msleep(100);
>>>           }
>>>
>>> -       if (!nvme_change_ctrl_state(ctrl, NVME_CTRL_LIVE))
>>> +       if (!nvme_change_ctrl_state(ctrl, NVME_CTRL_CONNECTING) ||
>>> +           !nvme_change_ctrl_state(ctrl, NVME_CTRL_LIVE))
>>>                   return;
>>>
>>>           nvme_unquiesce_io_queues(ctrl);
>>
>> I would rather have a separate state for firmware activation.
>> (Ab-)using the 'RESETTING' state here has direct implications
>> with the error handler, as for the error handler 'RESETTING'
>> means that the error handler has been scheduled.
>> Which is not true for firmware activation.
> 
> But the point of having firmware activation set the state to RESETTING
> was to fence off error handling from trying to schedule a real reset.
> The fw activation work schedules its own recovery if it times out, but
> we don't want any other recovery action or user requested resets to
> proceed while an activation is still pending.

I know; that was precisely my point. We are overloading the 'RESETTTING'
state to mean either 'reset has started' or 'fw activation is ongoing'.
Which are two _vastly_ different situations, and we should differentiate
them eg by introducing a new state. That new state can (and should) have
the same effects as the RESETTING state, true.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
