Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B9222C35E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745496624; cv=none; b=p48mWUvD/zDuc8jvZzmNAO+WsXjjuVN+JNC3pKkEx6WXagTr5CLglfckC/YBeKgIoALnA84PP3idBjOs7BhEi6zW36tHa5KCwEOgg3nclWOd6q9YtDmr8WNgMy7DlcSN3ge9drWwGncTyzDOUghfP5GNY3JuPedB+LG9d3p99M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745496624; c=relaxed/simple;
	bh=gvyUHBfz9UQXB8x4Tec9M6B7cw88yHiU9JmVh1GTZ5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s7mf9/f7Llr/nHCD6z5O4y9sS5BWQN5m5XxzYYPViL8J5nSzgYCh/XPjcXnKyGi7wtToVQernTgbsTJNgcJSks7aZFJzLaNa+ixEgkickIh3qKIO5ZaSdn3F/ACCip6Gx0RFdfgQQduc32mxAYJtRiUnHPzS32u7OaSFrD1HckE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Z+TnmlSJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SLD6AS08; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Z+TnmlSJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SLD6AS08; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z+TnmlSJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SLD6AS08";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z+TnmlSJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SLD6AS08"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 899A61F44E;
	Thu, 24 Apr 2025 12:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745496620; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZXpcopgfjV4IQOkDA8ZDLPpADRvWAQ28wmPHFKfWvk8=;
	b=Z+TnmlSJq0Hp3Ydhacir7K5kAMJdOB/XjX+bHym09XC/hlAnacLbbFfCHm+Jq/0iq65zlS
	EkVOTU6JtlR/5qc1rtbB25lfk3sR9tyOOBL1V/TknfyGDPPsTrAE9o5sTnRzidsMUy6AQy
	eTPe7E7AAsFHWKlvdCkQ4cl0g3kDDNA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745496620;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZXpcopgfjV4IQOkDA8ZDLPpADRvWAQ28wmPHFKfWvk8=;
	b=SLD6AS08fiPrQmjCgEy/XDOSMdL0PqLGI12aMpBLkIxiUJhD1fTPiywX1sTluGvK1V/vnL
	R8bwurOKjzaUfXAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745496620; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZXpcopgfjV4IQOkDA8ZDLPpADRvWAQ28wmPHFKfWvk8=;
	b=Z+TnmlSJq0Hp3Ydhacir7K5kAMJdOB/XjX+bHym09XC/hlAnacLbbFfCHm+Jq/0iq65zlS
	EkVOTU6JtlR/5qc1rtbB25lfk3sR9tyOOBL1V/TknfyGDPPsTrAE9o5sTnRzidsMUy6AQy
	eTPe7E7AAsFHWKlvdCkQ4cl0g3kDDNA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745496620;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZXpcopgfjV4IQOkDA8ZDLPpADRvWAQ28wmPHFKfWvk8=;
	b=SLD6AS08fiPrQmjCgEy/XDOSMdL0PqLGI12aMpBLkIxiUJhD1fTPiywX1sTluGvK1V/vnL
	R8bwurOKjzaUfXAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6EBAE1393C;
	Thu, 24 Apr 2025 12:10:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gMHoGSwqCmhbSAAAD6G6ig
	(envelope-from <hare@suse.de>); Thu, 24 Apr 2025 12:10:20 +0000
Message-ID: <8a3093b6-d5b2-496d-828a-0667abbf1670@suse.de>
Date: Thu, 24 Apr 2025 14:10:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/14] nvmet-fcloop: don't wait for lport cleanup
To: Daniel Wagner <dwagner@suse.de>
Cc: Daniel Wagner <wagi@kernel.org>, James Smart <james.smart@broadcom.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Chaitanya Kulkarni <kch@nvidia.com>, Keith Busch <kbusch@kernel.org>,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250423-nvmet-fcloop-v5-0-3d7f968728a5@kernel.org>
 <20250423-nvmet-fcloop-v5-10-3d7f968728a5@kernel.org>
 <05ac9a81-66a9-4bbc-92e0-6ff47a6dc7ad@suse.de>
 <c1f207f3-6657-4803-90df-a059353ba6da@flourine.local>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <c1f207f3-6657-4803-90df-a059353ba6da@flourine.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
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

On 4/24/25 13:48, Daniel Wagner wrote:
> On Thu, Apr 24, 2025 at 12:21:09PM +0200, Hannes Reinecke wrote:
>>> @@ -1776,7 +1763,7 @@ static void __exit fcloop_exit(void)
>>>    		spin_unlock_irqrestore(&fcloop_lock, flags);
>>> -		ret = __wait_localport_unreg(lport);
>>> +		ret = __localport_unreg(lport);
>>>    		if (ret)
>>>    			pr_warn("%s: Failed deleting local port\n", __func__);
>>>
>> And who is freeing the allocated fcloop_lsreq structures?
> 
> After a fcloop_lsreq is allocated it is put on either rport->ls_list or
> tport->ls_list and later freed in fcloop_tport_lsrqst_work, resp.
> fcloop_rport_lsrqst_work for the non-error case (or in the callbacks).
> 
> That means when the localport is unregistered successfully there are no
> fcloop_lsreq around. The issue is what to do when __localport_unreq
> returns an error.
> 
> This code could loop forever when the port_state is not in
> FC_OBJSTATE_ONLINE when calling nvme_fc_unregister_localport(). This
> should not happen (it did before this series) but now it shouldn't be
> the case anymore. I suppose a pr_warn_once() and a sleep might be a good
> idea to avoid a busy loop?

My point was more: you call kmem_cache_destroy() unconditionally upon
exit. But the boilerplate says that you have to free all allocations
from the kmem_cache before that call.
Yet the exit function doesn't do that.
Question is: what are the guarantees that the cache is empty upon exit?

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
