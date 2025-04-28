Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3632F86323
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745846482; cv=none; b=K8hAQl4XJW4SB3k8+sTYa3EFrC9+xHDFYBOwT3xoh7wsws+bEAtDgrmt9Jq1rPgmAenWndIkwE6Y4hw45RrWYEpH1/70N4FYZs5Az7XUcfAviyBc+t8en0caU8X2GGTkM1AIol2IovEvkfxjXDtnsogkzMIjO+YpW56vLhnAd4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745846482; c=relaxed/simple;
	bh=T3rtYr3RqTLgly4xse6CBiPIQEj61xZdAIQ7m0HvvOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HatDPUq+/E73iMHHaf2ifuMB0EYdFzIMpnqw4v0aV1YXGGxEbof6CoOygLjtDpxpu0aOjOEDCyumJSGvwHWTjJB60fLRIoGB13tWC6Q+N2x+kt0HFkr1sF+Km8LkJCWi8cCBZlrY3EL3bSjx+Dsx+Ep405eZt+6L7+Pn/I6g3TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dFdSM1hX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ds0IHOTw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dFdSM1hX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ds0IHOTw; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dFdSM1hX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ds0IHOTw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dFdSM1hX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ds0IHOTw"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 332161F390;
	Mon, 28 Apr 2025 13:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745846479; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LKCfsUSiVgaMGLYlRKMuDqRi+jxJnou69nt3LDKwSkY=;
	b=dFdSM1hXoQ/DErZ4LG7lSkry0rA/fgCYFkaoBc2RiJf4m1k+EEmCspgKpu6/C+YaRlExAX
	HV+7xysk2dNcMbQTsn4YhrXZAHD5sS4ZSSOUcRJKvjV/pfIIyMQBOHPBr43t8fsJGhrzti
	eoR/1FINAXmDDzdd+fsX2FNuemi2YHE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745846479;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LKCfsUSiVgaMGLYlRKMuDqRi+jxJnou69nt3LDKwSkY=;
	b=Ds0IHOTwBrmtL9+kBlcqWdlfdH0ryq2b4FpcVnfjdrwA0NaRod110CF8WThug4H3+eBr+s
	NM4y6ImOwJvap4Bw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745846479; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LKCfsUSiVgaMGLYlRKMuDqRi+jxJnou69nt3LDKwSkY=;
	b=dFdSM1hXoQ/DErZ4LG7lSkry0rA/fgCYFkaoBc2RiJf4m1k+EEmCspgKpu6/C+YaRlExAX
	HV+7xysk2dNcMbQTsn4YhrXZAHD5sS4ZSSOUcRJKvjV/pfIIyMQBOHPBr43t8fsJGhrzti
	eoR/1FINAXmDDzdd+fsX2FNuemi2YHE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745846479;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LKCfsUSiVgaMGLYlRKMuDqRi+jxJnou69nt3LDKwSkY=;
	b=Ds0IHOTwBrmtL9+kBlcqWdlfdH0ryq2b4FpcVnfjdrwA0NaRod110CF8WThug4H3+eBr+s
	NM4y6ImOwJvap4Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 12A7113A25;
	Mon, 28 Apr 2025 13:21:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id blcPBM+AD2ikYAAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 28 Apr 2025 13:21:19 +0000
Message-ID: <9763c4cf-8ca5-45d4-b723-270548ca1001@suse.de>
Date: Mon, 28 Apr 2025 15:21:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] nvme: only allow entering LIVE from CONNECTING state
To: Daniel Wagner <dwagner@suse.de>, Guenter Roeck <linux@roeck-us.net>
Cc: Daniel Wagner <wagi@kernel.org>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, James Smart <james.smart@broadcom.com>,
 Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250214-nvme-fc-fixes-v1-0-7a05d557d5cc@kernel.org>
 <20250214-nvme-fc-fixes-v1-1-7a05d557d5cc@kernel.org>
 <0134ea15-8d5f-41f7-9e9a-d7e6d82accaa@roeck-us.net>
 <cb46aa83-8033-4d64-a3c7-420172c3f3f5@flourine.local>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <cb46aa83-8033-4d64-a3c7-420172c3f3f5@flourine.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-8.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid]
X-Spam-Score: -8.30
X-Spam-Flag: NO

On 4/28/25 14:44, Daniel Wagner wrote:
> On Sun, Apr 27, 2025 at 08:59:13AM -0700, Guenter Roeck wrote:
>> Hi,
>>
>> On Fri, Feb 14, 2025 at 09:02:03AM +0100, Daniel Wagner wrote:
>>> The fabric transports and also the PCI transport are not entering the
>>> LIVE state from NEW or RESETTING. This makes the state machine more
>>> restrictive and allows to catch not supported state transitions, e.g.
>>> directly switching from RESETTING to LIVE.
>>>
>>> Signed-off-by: Daniel Wagner <wagi@kernel.org>
>>
>> nvme_handle_aen_notice(), when handling NVME_AER_NOTICE_FW_ACT_STARTING,
>> sets the state to RESETTING and and triggers a worker. This worker
>> waits for firmware activation to complete and then tries to set the
>> state back to LIVE. This step now fails.
>>
>> Possibly the handling of NVME_AER_NOTICE_FW_ACT_STARTING needs to be
>> improved. However, leaving the NVME in RESETTING state after an
>> NVME_AER_NOTICE_FW_ACT_STARTING event is worse.
>>
>> I think this patch should be reverted at least for the time being until
>> the handling of NVME_AER_NOTICE_FW_ACT_STARTING no longer relies on a
>> direct state change from RESETTING to LIVE.
> 
> ee59e3820ca9 ("nvme-fc: do not ignore connectivity loss during connecting")
> f13409bb3f91 ("nvme-fc: rely on state transitions to handle connectivity loss")
> 
> are depending on the fact that is not possible to switch from
> NEW/RESETTING directly into LIVE.
> 
> I think it would be better to fix the worker instead dropping this patch
> and the above fix for the fc transport.
> 
> What about:
> 
> 
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index b502ac07483b..d3c4eacf607f 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -4493,7 +4493,8 @@ static void nvme_fw_act_work(struct work_struct *work)
>                  msleep(100);
>          }
> 
> -       if (!nvme_change_ctrl_state(ctrl, NVME_CTRL_LIVE))
> +       if (!nvme_change_ctrl_state(ctrl, NVME_CTRL_CONNECTING) ||
> +           !nvme_change_ctrl_state(ctrl, NVME_CTRL_LIVE))
>                  return;
> 
>          nvme_unquiesce_io_queues(ctrl);

I would rather have a separate state for firmware activation.
(Ab-)using the 'RESETTING' state here has direct implications
with the error handler, as for the error handler 'RESETTING'
means that the error handler has been scheduled.
Which is not true for firmware activation.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
