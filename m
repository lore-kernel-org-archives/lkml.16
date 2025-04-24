Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEECC7DA6D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489908; cv=none; b=NRhiRvDM7LRakxLeUzeILGk0BK7TFYvSTTcX3bdMcnkpy653jc4ZitQCro5xTCpJUWPh8Zvk3qNYPzo6qHmJN3ZsuAtu9GhgUtj5q0ZShoT0WRp9lQNZwr1FeDPUPn24UxXV81YVOVk87sM1x0qi7gogje7iiNaGYKYzPKAJtYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489908; c=relaxed/simple;
	bh=1n3aaB7OYR2tcirTv0+I+dpiNGzox+W15Q38WAItQUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UQuz4MoZvza6vjV5oo7TNl6CQ7E4zvoqqB8Ao9PNYt3WRF8F3VfHejKcaaPKUpHKJ/RDlpDC+QL5zmpZQ+L4BrgAZR8u0SlqBSP+ZbnuBebmArLiPJp4upo82WPcWv7NcqtqXQqKNNmyaBvOeFqiFBwJmNNu5ARPFvooU1iNh1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZRy9+xbA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ibGZV7rt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZRy9+xbA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ibGZV7rt; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZRy9+xbA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ibGZV7rt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZRy9+xbA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ibGZV7rt"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D399021187;
	Thu, 24 Apr 2025 10:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745489904; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hlrhWSp4LkA8NXtEh+S7SFouZGLI6jBC2fLXOzgW3F0=;
	b=ZRy9+xbAkUFG8Z6YraP8OP5RwCuuT41RTihZ8YuONAf3m+kIm0UlJUd+kuTpQ95ZWLVupF
	Xo3zmEKaYLhcwcIrKPTMZ7YZnMhJ+MhrD3nfqoYgh0jUPXSLziaABrRcyzs75Sjp++DG2j
	+UST60XXyVVXHszoVr5luJc66YWKIpU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745489904;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hlrhWSp4LkA8NXtEh+S7SFouZGLI6jBC2fLXOzgW3F0=;
	b=ibGZV7rt3k+Py50LwuDUD5VLd8uLJaY2yu0M9sdUcbM1glUqL2K57HfapPcfoJyJqBfoNA
	MFBwq9w89owTXzBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZRy9+xbA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ibGZV7rt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745489904; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hlrhWSp4LkA8NXtEh+S7SFouZGLI6jBC2fLXOzgW3F0=;
	b=ZRy9+xbAkUFG8Z6YraP8OP5RwCuuT41RTihZ8YuONAf3m+kIm0UlJUd+kuTpQ95ZWLVupF
	Xo3zmEKaYLhcwcIrKPTMZ7YZnMhJ+MhrD3nfqoYgh0jUPXSLziaABrRcyzs75Sjp++DG2j
	+UST60XXyVVXHszoVr5luJc66YWKIpU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745489904;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hlrhWSp4LkA8NXtEh+S7SFouZGLI6jBC2fLXOzgW3F0=;
	b=ibGZV7rt3k+Py50LwuDUD5VLd8uLJaY2yu0M9sdUcbM1glUqL2K57HfapPcfoJyJqBfoNA
	MFBwq9w89owTXzBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BC19F139D0;
	Thu, 24 Apr 2025 10:18:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MP52LfAPCmgWKAAAD6G6ig
	(envelope-from <hare@suse.de>); Thu, 24 Apr 2025 10:18:24 +0000
Message-ID: <ef064271-7328-41b9-8df0-b4a3639ae33f@suse.de>
Date: Thu, 24 Apr 2025 12:18:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/14] nvmet-fcloop: allocate/free fcloop_lsreq
 directly
To: Daniel Wagner <wagi@kernel.org>, James Smart <james.smart@broadcom.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Chaitanya Kulkarni <kch@nvidia.com>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250423-nvmet-fcloop-v5-0-3d7f968728a5@kernel.org>
 <20250423-nvmet-fcloop-v5-9-3d7f968728a5@kernel.org>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20250423-nvmet-fcloop-v5-9-3d7f968728a5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D399021187
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
> fcloop depends on the host or the target to allocate the fcloop_lsreq
> object. This means that the lifetime of the fcloop_lsreq is tied to
> either the host or the target. Consequently, the host or the target must
> cooperate during shutdown.
> 
> Unfortunately, this approach does not work well when the target forces a
> shutdown, as there are dependencies that are difficult to resolve in a
> clean way.
> 
> The simplest solution is to decouple the lifetime of the fcloop_lsreq
> object by managing them directly within fcloop. Since this is not a
> performance-critical path and only a small number of LS objects are used
> during setup and cleanup, it does not significantly impact performance
> to allocate them during normal operation.
> 
> Signed-off-by: Daniel Wagner <wagi@kernel.org>
> ---
>   drivers/nvme/target/fcloop.c | 63 +++++++++++++++++++++++++++++++-------------
>   1 file changed, 45 insertions(+), 18 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
