Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4178F2AEFE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 09:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743500013; cv=none; b=DzQAoUsH8k2hj1Xk4CTAVGUi6S7auwscmUE7QVwstd4A+KGYRXE4pvRmifVLafwfheH3y/5INx9v5kkAAMimP2Jet1ZBdzZh7JOAhZoF6zym+f8MRYbpjJY/qHZeQdgD3+pTX9o07kqsKWa0EiHonJrLbWlX0OwNhnKhwpoN9uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743500013; c=relaxed/simple;
	bh=p4F5CsaPDW6m75LgqmAHzVHZQ2h+hAv2sU8hNBF6Yok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uggf0cB42cyEh4XDR/DFUsDmI2ymd45euXQGSfShDe7ZHeKLzxCXyPaWYGfhkLH7x3iUj0Zdtp7h5bv4B0KuEKI030DiSJYU7YobEa73dJ4ApWOeUrDKF4YYJBDSVLUh3oZRuK5evSGQNccWhqPN01DgJnXFcQGS1ja0wI/tf5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LuUoUuPw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sjIv6WoF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LuUoUuPw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sjIv6WoF; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LuUoUuPw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sjIv6WoF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LuUoUuPw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sjIv6WoF"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4985D1F38D;
	Tue,  1 Apr 2025 09:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743500010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4+SH6eeBTQzZ1CPgNpdP327MoBfPOV6H/Xkzknm4Hao=;
	b=LuUoUuPwPyYrwVPb168YD3sfPm3Q/bKFRvlv6/j1qIBCUgdnX8F6T0F1v+0KtzncCyQDh1
	3W5zx2+e7bVOzSiu7E7STLXiH6hSo+KQ9ldaq7UTSOJKg2QYbA5dUZov/oZaGpfVz8+dDu
	yczg7w0vdE1Rj/9i/oPL20QE2Oxvhoo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743500010;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4+SH6eeBTQzZ1CPgNpdP327MoBfPOV6H/Xkzknm4Hao=;
	b=sjIv6WoFSDKivm28GP9RtZ2tKLgJI+IDTADUdWRo4yHYTOtiDTGcgtQiFruaUFgg5Nr9qP
	u/BxC7b+EeTMv9Bw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=LuUoUuPw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=sjIv6WoF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743500010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4+SH6eeBTQzZ1CPgNpdP327MoBfPOV6H/Xkzknm4Hao=;
	b=LuUoUuPwPyYrwVPb168YD3sfPm3Q/bKFRvlv6/j1qIBCUgdnX8F6T0F1v+0KtzncCyQDh1
	3W5zx2+e7bVOzSiu7E7STLXiH6hSo+KQ9ldaq7UTSOJKg2QYbA5dUZov/oZaGpfVz8+dDu
	yczg7w0vdE1Rj/9i/oPL20QE2Oxvhoo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743500010;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4+SH6eeBTQzZ1CPgNpdP327MoBfPOV6H/Xkzknm4Hao=;
	b=sjIv6WoFSDKivm28GP9RtZ2tKLgJI+IDTADUdWRo4yHYTOtiDTGcgtQiFruaUFgg5Nr9qP
	u/BxC7b+EeTMv9Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2F04B138A5;
	Tue,  1 Apr 2025 09:33:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gDnUCuqy62eGAgAAD6G6ig
	(envelope-from <hare@suse.de>); Tue, 01 Apr 2025 09:33:30 +0000
Message-ID: <a301c37c-fcc1-4c1f-9317-eb70cae59cdc@suse.de>
Date: Tue, 1 Apr 2025 11:33:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] nvmet: add command quiesce time
To: Daniel Wagner <wagi@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Keith Busch <kbusch@kernel.org>,
 John Meneghini <jmeneghi@redhat.com>, randyj@purestorage.com,
 Mohamed Khalfella <mkhalfella@purestorage.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250324-tp4129-v1-0-95a747b4c33b@kernel.org>
 <20250324-tp4129-v1-1-95a747b4c33b@kernel.org>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20250324-tp4129-v1-1-95a747b4c33b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4985D1F38D
X-Spam-Score: -4.51
X-Rspamd-Action: no action
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
> TP4129 introduces Command Quiesce Time (CQT) for coordinating the
> shutdown sequence when for example KATO expires.
> 
> Add support to nvmet but only report CQT is available but the controller
> doesn't need any additional time when shutting down. In this case the
> spec says nvmet should report a value of 1.
> 
> Signed-off-by: Daniel Wagner <wagi@kernel.org>
> ---
>   drivers/nvme/target/admin-cmd.c | 6 ++++++
>   drivers/nvme/target/nvmet.h     | 1 +
>   include/linux/nvme.h            | 4 +++-
>   3 files changed, 10 insertions(+), 1 deletion(-)
> 
Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
