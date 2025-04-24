Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618BC221725
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489385; cv=none; b=B+X+0mt8MrMV3ZYXxD5A3oZlo4fysp/ETpLn4UfZDrAC07kmJSezzm5JfbfYc8qGzsBWuP5/Mnl/lFnpm+TWT1UiUC5B7QEMtvmfmrIzg8pkKp0IBrj0mgx3IdvBli4K26BNPoHvLh3cmDjEwG6XZssd0LvFuI32m/F7NmFEVGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489385; c=relaxed/simple;
	bh=uoI9/tbLI89XxL8JgtO04TSXnXn0TTxeeGUwIzlQGOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=agfomgGFk1IQJ4g6d9okR5ZlNHIryEIbYtuG71gn314d2J1emBpGj949KZIldRcoTVdr95/jJer+TTEgnx/zagDyhQpT3KmQwe6KVt5QQO9k/6avl7QVx8L2gAYoR+JC8oh4DzOKcXs3dNyjfQRq9B0QBi+zUng0Me5UMHk7Qfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P8fTghRS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aIROMciQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AhSsGbjN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=u4NOdAuN; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P8fTghRS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aIROMciQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AhSsGbjN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u4NOdAuN"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EA91121187;
	Thu, 24 Apr 2025 10:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745489382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CPJD9tr4PRr6ns76wa1hzi/fcA1+SfKGNcMXIo1EFfw=;
	b=P8fTghRSrJtE6VileRjNLFsSEwwWVF88UU/7TXLRU4CK+EjpRlwRLxdK6ZYFthE39H7Nvh
	SP31j4zVxX0wAcVCRhk8sQg4AnazOXLelP2oXW2CJkD6jc4lKWPGB8R1b+GHrZuraOh1QX
	JUmIJ99hwfF7hsWK9D42KsjRzBOBKtk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745489382;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CPJD9tr4PRr6ns76wa1hzi/fcA1+SfKGNcMXIo1EFfw=;
	b=aIROMciQoTMW3CPwXMwF3nEZWmGy868trZCvVSWQ326zofp54y4QBTdnsQWoBU/8cZrD7D
	OPin2sptFvrEKLBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=AhSsGbjN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=u4NOdAuN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745489381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CPJD9tr4PRr6ns76wa1hzi/fcA1+SfKGNcMXIo1EFfw=;
	b=AhSsGbjN/jknstQ3YCfPt3Zlhhi0yanEoWClPgYkKjc4cciv9AW612QTtwBH4ly4aLWwiG
	Zcv+StlFEatrPyCOh4tZffOXrwHAuwPNhHFACwEYnXPC3f1ELbOCqkhM4k+DmvnCkmXIEi
	FuUejidtcrMt1GA6Y2aWnEBUH4UcgdY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745489381;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CPJD9tr4PRr6ns76wa1hzi/fcA1+SfKGNcMXIo1EFfw=;
	b=u4NOdAuNgzQcK4BnbKgr0o0W1918YRkUR0mR4DCSQhjK5SlDqDuom2ZWxWa3xa4rVymgBJ
	9cFyhTGVGoQ0QQBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D22631393C;
	Thu, 24 Apr 2025 10:09:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xxxQMuUNCmhzJQAAD6G6ig
	(envelope-from <hare@suse.de>); Thu, 24 Apr 2025 10:09:41 +0000
Message-ID: <cb781689-422b-4439-a6e4-8c4b98d9238a@suse.de>
Date: Thu, 24 Apr 2025 12:09:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/14] nvmet-fcloop: refactor fcloop_nport_alloc and
 track lport
To: Daniel Wagner <wagi@kernel.org>, James Smart <james.smart@broadcom.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Chaitanya Kulkarni <kch@nvidia.com>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250423-nvmet-fcloop-v5-0-3d7f968728a5@kernel.org>
 <20250423-nvmet-fcloop-v5-3-3d7f968728a5@kernel.org>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20250423-nvmet-fcloop-v5-3-3d7f968728a5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EA91121187
X-Spam-Level: 
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
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On 4/23/25 15:21, Daniel Wagner wrote:
> The checks for a valid input values are mixed with the logic to insert a
> newly allocated nport. Refactor the function so that first the checks
> are done.
> 
> This allows to untangle the setup steps into a more linear form which
> reduces the complexity of the functions.
> 
> Also start tracking lport when a lport is assigned to a nport. This
> ensures, that the lport is not going away as long it is still referenced
> by a nport.
> 
> Signed-off-by: Daniel Wagner <wagi@kernel.org>
> ---
>   drivers/nvme/target/fcloop.c | 107 ++++++++++++++++++++++++++-----------------
>   1 file changed, 64 insertions(+), 43 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
