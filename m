Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8EA2D0263
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745932681; cv=none; b=G63AK9xSMTlyZxM7CVw76cxCJ+UzPUC+qn2TSL+YjrNxHGVG+5t8/T/ao0w31iby1r7wYsWi7bobN10JHpHxsfI8rHaipDQ2IggQ0+OqF09G/xWR9aoxUx+0lDwNeB2XF2Hej64kUt7MjTNWDCmKlu043fwv6ng2FgVC+FkKeVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745932681; c=relaxed/simple;
	bh=o9S3xS6x/7ltvjnbA8prO8mDFGuFdVAzu8uNbExAUYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ttEO5baOcZVw/H3qGaL7KhmfyphoIpAQQmFoVwnOaKou8ilQjvj/9zwhCnsPZAJMqRvonIjO2fx9TkAqPxcVtye5OPf6bkssHXqchVjkcNZgqbBu1PxI4yaHSVyW/CDh1BTVI/IfUMwpUV035qcllV8GmD5NbjjAwmn2jxwqS24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rjenn99I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=H3YDLAQm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rjenn99I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=H3YDLAQm; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rjenn99I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H3YDLAQm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rjenn99I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H3YDLAQm"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9A25F1F391;
	Tue, 29 Apr 2025 13:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745932677; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LMsTwHgoOwVW/cg0h8z/MHHeXCOyNAgrsW4S8mz0gNI=;
	b=rjenn99IKOJKneAgSUtp07MjWiiw9Fzo7v7xcQMM0B9TrsWdofeipTbMZOMdgg9Wq0VJs+
	17HKyrHlFLnBleDUQeKfgyF0GSF51Jc1xlID7vqr43ih8O53vV25axOHf8XjZKFVvQE3ZJ
	P7lDb85wwL71j35Ui46o6so4KuYx28Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745932677;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LMsTwHgoOwVW/cg0h8z/MHHeXCOyNAgrsW4S8mz0gNI=;
	b=H3YDLAQmg9aWlPK3HtKqixsARrVdAmLtdXoK8k7YT+vUd3gIh/onrs51hckzK6P5+B+a3I
	811O/IkhnsCcsjBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rjenn99I;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=H3YDLAQm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745932677; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LMsTwHgoOwVW/cg0h8z/MHHeXCOyNAgrsW4S8mz0gNI=;
	b=rjenn99IKOJKneAgSUtp07MjWiiw9Fzo7v7xcQMM0B9TrsWdofeipTbMZOMdgg9Wq0VJs+
	17HKyrHlFLnBleDUQeKfgyF0GSF51Jc1xlID7vqr43ih8O53vV25axOHf8XjZKFVvQE3ZJ
	P7lDb85wwL71j35Ui46o6so4KuYx28Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745932677;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LMsTwHgoOwVW/cg0h8z/MHHeXCOyNAgrsW4S8mz0gNI=;
	b=H3YDLAQmg9aWlPK3HtKqixsARrVdAmLtdXoK8k7YT+vUd3gIh/onrs51hckzK6P5+B+a3I
	811O/IkhnsCcsjBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 82F8C1340C;
	Tue, 29 Apr 2025 13:17:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id S79uH4XREGhTZgAAD6G6ig
	(envelope-from <hare@suse.de>); Tue, 29 Apr 2025 13:17:57 +0000
Message-ID: <a2aa71cc-b30f-4d48-aa1d-9058fcdbb6d0@suse.de>
Date: Tue, 29 Apr 2025 15:17:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvme-tcp: select tls config when tcp tls is enabled
To: Alistair Francis <alistair23@gmail.com>, hch@lst.de, sagi@grimberg.me,
 kch@nvidia.com, linux-nvme@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Alistair Francis <alistair.francis@wdc.com>
References: <20250424101333.2908504-1-alistair.francis@wdc.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20250424101333.2908504-1-alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9A25F1F391
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
	FREEMAIL_TO(0.00)[gmail.com,lst.de,grimberg.me,nvidia.com,lists.infradead.org];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On 4/24/25 12:13, Alistair Francis wrote:
> Ensure that TLS support is enabled in the kernel when
> NVME_TARGET_TCP_TLS is enabled. This allows TLS secure channels to be
> used out of the box.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
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
Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
