Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CE71EEF9
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 06:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745993519; cv=none; b=BqQ5FhBUUYTmyjbxvtjGDk40sZCIpuTmtt4ZhjXvIKQ+fgJfUoJqVZILVnBHJBl75vMopJb0dt9GLYhF9Ra2tfQkJv3dsbpthABFve8U+FeImfAIH7KAcLRfBzu2dNn9tM/+pjW50wVlGmWTRjul5kKZ9YPcZqDVVsx5xxQ7TOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745993519; c=relaxed/simple;
	bh=kETMFO3KMieRFaOBAAcbOD4ZstiW0I6imMF/XuVe5t0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=amJAMm0T7uZWQ11hW1hrJ8uq9RJsQsQrzPRjy6cxkPwauvItrwgU0xyGEr4SeB1vnEYLRNfhYE1wD3XFQOipPIkfn0JEKOPNO7i9LHVHCX/BMh9E3/Uo6Hlmy6gE62fpx8ZfGmVU6TmUc4OCQsTOpt1DeBkI8vxm5tTOmUqpdV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kz/g2iop; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Zy2qZILx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kz/g2iop; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Zy2qZILx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kz/g2iop";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Zy2qZILx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kz/g2iop";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Zy2qZILx"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 558B01F7C3;
	Wed, 30 Apr 2025 06:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745993516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gGWuaN7STuBYcEHEJXBOyq6Fwqm+Zb5wLCPclUy2Ouo=;
	b=kz/g2iopnAsbHJocaZhy6/vKs9euv0wWG+w+buzc0gKGpUtb77RKz7OoEJ+cXfo5WNmtae
	rtrvuxFzfgDJiHgU6Tt6FqyubKTMKEAjo4ym8pFnr8UAiIjv9F12cF/P5JXWxCNmo1A2T7
	EX1cNFQv9lQ0+E1QRm9f49tJipp25vc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745993516;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gGWuaN7STuBYcEHEJXBOyq6Fwqm+Zb5wLCPclUy2Ouo=;
	b=Zy2qZILxLEhVzwZAoDFl21QjKbSGFV7rA5dfnamWKw/5cwGXmfNhJi1G++JoPsXFAMA99h
	+aV/vILy4/K678CA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="kz/g2iop";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Zy2qZILx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745993516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gGWuaN7STuBYcEHEJXBOyq6Fwqm+Zb5wLCPclUy2Ouo=;
	b=kz/g2iopnAsbHJocaZhy6/vKs9euv0wWG+w+buzc0gKGpUtb77RKz7OoEJ+cXfo5WNmtae
	rtrvuxFzfgDJiHgU6Tt6FqyubKTMKEAjo4ym8pFnr8UAiIjv9F12cF/P5JXWxCNmo1A2T7
	EX1cNFQv9lQ0+E1QRm9f49tJipp25vc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745993516;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gGWuaN7STuBYcEHEJXBOyq6Fwqm+Zb5wLCPclUy2Ouo=;
	b=Zy2qZILxLEhVzwZAoDFl21QjKbSGFV7rA5dfnamWKw/5cwGXmfNhJi1G++JoPsXFAMA99h
	+aV/vILy4/K678CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 029B3139E7;
	Wed, 30 Apr 2025 06:11:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qneMOSu/EWggZQAAD6G6ig
	(envelope-from <hare@suse.de>); Wed, 30 Apr 2025 06:11:55 +0000
Message-ID: <7fafdae3-5114-4fa7-a9a5-e6ff4df49b50@suse.de>
Date: Wed, 30 Apr 2025 08:11:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] nvme-tcp: select tls config when tcp tls is enabled
To: Alistair Francis <alistair23@gmail.com>, hch@lst.de, sagi@grimberg.me,
 kch@nvidia.com, linux-nvme@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Alistair Francis <alistair.francis@wdc.com>
References: <20250429222347.2215363-1-alistair.francis@wdc.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20250429222347.2215363-1-alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 558B01F7C3
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com,lst.de,grimberg.me,nvidia.com,lists.infradead.org];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MID_RHS_MATCH_FROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email,nvidia.com:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On 4/30/25 00:23, Alistair Francis wrote:
> Ensure that TLS support is enabled in the kernel when
> NVME_TARGET_TCP_TLS is enabled. This allows TLS secure channels to be
> used out of the box.
> 
> Fixes: 675b453e0241 ("nvmet-tcp: enable TLS handshake upcall")
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
> ---
>   drivers/nvme/target/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/nvme/target/Kconfig b/drivers/nvme/target/Kconfig
> index fb7446d6d682..4c253b433bf7 100644
> --- a/drivers/nvme/target/Kconfig
> +++ b/drivers/nvme/target/Kconfig
> @@ -98,6 +98,7 @@ config NVME_TARGET_TCP_TLS
>   	bool "NVMe over Fabrics TCP target TLS encryption support"
>   	depends on NVME_TARGET_TCP
>   	select NET_HANDSHAKE
> +	select TLS
>   	help
>   	  Enables TLS encryption for the NVMe TCP target using the netlink handshake API.
>   

Can you fold both patches together?
If not, this patch need to be titled 'nvmet-tcp: select tls config ...'

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
