Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E942D3A74
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 08:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751533013; cv=none; b=dRRuA5HrADutTn3FKWX1tXuav1PLnSjjmi0Ns5a7XIIJ1sJFKJ4MTb0i6WjQDwhuN2FQMHoaHjScGZSc9AyIWDzvxJgqh4UU+vb/G8kXR6uqSpXpWby/PE2lOJmrkKEeGzJZKIvfQ0N7mriLvd1uVEigR0VoZxW5CrUXKqBgY4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751533013; c=relaxed/simple;
	bh=Jxog2IoFv7idskIfKrEnJxlaYigitE9t3NSke2lZh7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E7DsrfvVHeYDQKG+PZvhqgjhKWGOCQBTy2IiXfZ88s2yVYMH9rHokemBTIo4m7sGCnPj/Dh03D1srbb9m2E9qpTphS3+q20Tm691O01zljzBx3qI/Zax0V3HZZ62bC1obRDQrLZ/bXjWM7w7nZ4REmxNdaDlpJI7ff7Z8mOOhko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fQnC7lfX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iLUDohGd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fQnC7lfX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iLUDohGd; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fQnC7lfX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iLUDohGd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fQnC7lfX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iLUDohGd"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3ED951F387;
	Thu,  3 Jul 2025 08:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751533009; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oycqRPKYrKrU48lYuQEibM7u281caSR1VZVk0+w2pi0=;
	b=fQnC7lfXKodxC1NnNc5cI3h2rpnMomRWtcUfHvsu55eW0P42U2z26lhK+hn7G/G1Up2N22
	+gq1g4eeKsFZqg8ruiAtteiNqjqdly9nRRFtuOnMxUzyTslEyGo7bhwfKGc4/KswMozQz2
	BjKvN6cj5kkePCy1cM4llRN+/dw4S6A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751533009;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oycqRPKYrKrU48lYuQEibM7u281caSR1VZVk0+w2pi0=;
	b=iLUDohGdKioE47x8hrIsnnBXwB5ClzsiiXehVlPokiLLzT+H/N3rZXd731VmOv3KFqyQdN
	NPdeC4IjIFsxHVCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fQnC7lfX;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=iLUDohGd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751533009; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oycqRPKYrKrU48lYuQEibM7u281caSR1VZVk0+w2pi0=;
	b=fQnC7lfXKodxC1NnNc5cI3h2rpnMomRWtcUfHvsu55eW0P42U2z26lhK+hn7G/G1Up2N22
	+gq1g4eeKsFZqg8ruiAtteiNqjqdly9nRRFtuOnMxUzyTslEyGo7bhwfKGc4/KswMozQz2
	BjKvN6cj5kkePCy1cM4llRN+/dw4S6A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751533009;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oycqRPKYrKrU48lYuQEibM7u281caSR1VZVk0+w2pi0=;
	b=iLUDohGdKioE47x8hrIsnnBXwB5ClzsiiXehVlPokiLLzT+H/N3rZXd731VmOv3KFqyQdN
	NPdeC4IjIFsxHVCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D444A1368E;
	Thu,  3 Jul 2025 08:56:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1ExmM9BFZmg+dgAAD6G6ig
	(envelope-from <hare@suse.de>); Thu, 03 Jul 2025 08:56:48 +0000
Message-ID: <b5849e57-8b8a-4c62-8960-18c4802b8d67@suse.de>
Date: Thu, 3 Jul 2025 10:56:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] nvme: prevent admin controller from smart log
 fetch (LID 2)
To: Kamaljit Singh <kamaljit.singh1@wdc.com>, kbusch@kernel.org,
 axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: cassel@kernel.org, dlemoal@kernel.org
References: <20250702005830.889217-1-kamaljit.singh1@wdc.com>
 <20250702005830.889217-3-kamaljit.singh1@wdc.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20250702005830.889217-3-kamaljit.singh1@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 3ED951F387
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.51

On 7/2/25 02:58, Kamaljit Singh wrote:
> Similar to a discovery ctrl, prevent an admin-ctrl from getting a smart
> log. LID 2 is optional for admin controllers to support.
> 
> In the future when support for the newly added LID=0 (supported log
> pages) is added, GLP accesses can be made smarter by basing such calls
> on response from LID=0 reads.
> 
> Reference: NVMe Base rev 2.2, sec 3.1.3.5, fig 31.
> 
> Signed-off-by: Kamaljit Singh <kamaljit.singh1@wdc.com>
> ---
>   drivers/nvme/host/core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index a1155fb8d5be..c310634e75f3 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -3705,7 +3705,7 @@ int nvme_init_ctrl_finish(struct nvme_ctrl *ctrl, bool was_suspended)
>   
>   	nvme_configure_opal(ctrl, was_suspended);
>   
> -	if (!ctrl->identified && !nvme_discovery_ctrl(ctrl)) {
> +	if (!ctrl->identified && !nvme_discovery_ctrl(ctrl) && !nvme_admin_ctrl(ctrl)) {
>   		/*
>   		 * Do not return errors unless we are in a controller reset,
>   		 * the controller works perfectly fine without hwmon.

Nope. You said yourself, that log page is optional.
But that also means that there _might_ be controller who support it.
If you want to avoid an error here we would need to check if that log
page is supported, not disable it upfront.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
