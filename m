Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF7F221264
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489451; cv=none; b=VXRu2Bw/gebC1BKsWNIpjTEaEeqnnsHEzKcGXIBAnvsO+GScAGuJII/05qHF+Nb0iLmp4g5kmS3xy7iRF2fDX0NBZUcyTcZy0Zdd0+azNYfG9tzdhAVdd/w/rLHT9HQSyCppPPKKASeJI9CNSJ0bFVkKaJ18nR0jGsz1VBAjUKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489451; c=relaxed/simple;
	bh=f50Z2H9S/sXLCbR4pkOpDa5LhTSVuJn62iiA/a3IhxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MUy9PZAqAn1GbPCHWfkg7qsZpCpzeLz4Gg1CSEparFZUmnteSuhSYjFidde/D/i5vdFxWAD2EPwyRfyIZ8by55r0mH8IgUAmbSxc6L6misNe7kRAbWL5UUnBoqroAuaRRDQrRzB30nqx75CfEG9/GbDOeqAXGT4GLA5WStCnnpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f9uFLLOw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fKeNd/ey; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f9uFLLOw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fKeNd/ey; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f9uFLLOw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fKeNd/ey";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f9uFLLOw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fKeNd/ey"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1E5D921185;
	Thu, 24 Apr 2025 10:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745489447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=15fXK2koPc1bP/2CoTjjC71hWUB3zXXDI2M5+kB174Q=;
	b=f9uFLLOwg9E99NruAucjRGCJ+SU45kDdc8jqtjiwcYCelZ38UuAvTRRZfF1z0HQi1bRTb1
	MV9T2k+SQlQ4CN9Q2A3b7p6YYRUZOs2resRztSWO5LrMR0Izn6y3TNATqtRS8GmDx34eeB
	ftnKc0VC8mhGgI2obdY2Cqf8Nfxxh8Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745489447;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=15fXK2koPc1bP/2CoTjjC71hWUB3zXXDI2M5+kB174Q=;
	b=fKeNd/ey8Ig0SihnnoIDroeydZmzxkTP1u8wXz+avlYasqYnnSub+LRNKUK1QuwPJsEjbv
	qL46RuVV/YXCSJAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=f9uFLLOw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="fKeNd/ey"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745489447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=15fXK2koPc1bP/2CoTjjC71hWUB3zXXDI2M5+kB174Q=;
	b=f9uFLLOwg9E99NruAucjRGCJ+SU45kDdc8jqtjiwcYCelZ38UuAvTRRZfF1z0HQi1bRTb1
	MV9T2k+SQlQ4CN9Q2A3b7p6YYRUZOs2resRztSWO5LrMR0Izn6y3TNATqtRS8GmDx34eeB
	ftnKc0VC8mhGgI2obdY2Cqf8Nfxxh8Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745489447;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=15fXK2koPc1bP/2CoTjjC71hWUB3zXXDI2M5+kB174Q=;
	b=fKeNd/ey8Ig0SihnnoIDroeydZmzxkTP1u8wXz+avlYasqYnnSub+LRNKUK1QuwPJsEjbv
	qL46RuVV/YXCSJAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B5D751393C;
	Thu, 24 Apr 2025 10:10:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ki3PKSYOCmjqJQAAD6G6ig
	(envelope-from <hare@suse.de>); Thu, 24 Apr 2025 10:10:46 +0000
Message-ID: <0c04b345-152b-4bbe-b9b7-7796211b8547@suse.de>
Date: Thu, 24 Apr 2025 12:10:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/14] nvmet-fcloop: refactor fcloop_delete_local_port
To: Daniel Wagner <wagi@kernel.org>, James Smart <james.smart@broadcom.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Chaitanya Kulkarni <kch@nvidia.com>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250423-nvmet-fcloop-v5-0-3d7f968728a5@kernel.org>
 <20250423-nvmet-fcloop-v5-4-3d7f968728a5@kernel.org>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20250423-nvmet-fcloop-v5-4-3d7f968728a5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1E5D921185
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On 4/23/25 15:21, Daniel Wagner wrote:
> Use the newly introduced fcloop_lport_lookup instead
> of the open coded version.
> 
> Signed-off-by: Daniel Wagner <wagi@kernel.org>
> ---
>   drivers/nvme/target/fcloop.c | 30 +++++++++++++++---------------
>   1 file changed, 15 insertions(+), 15 deletions(-)
> 
You could merge it with the previous patch, but I guess that's
personal preference.

Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
