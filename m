Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1CC28A70A
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626383; cv=none; b=kKzT6OSqkyGPNY6RaC6vvEVUFL/yNgRT1/dzXjrWCUFKi1HS3libSts+Z/JOnBW7z6dpyHE2s8Ldccy2RPZvMYBakQT33dvTnqpHdLtgYFHPZpE1indK/NVDLPs0LsA2dGpnTO+pQ5aGn/xiQPzMa9tAH7zmmTKZLZtF+J1aOC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626383; c=relaxed/simple;
	bh=LT/8qL8AnBvwTlaIWe/cKjnGfvio8al1/i6/usjQHb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SKJAZ9eDlPZv44dyZ3DiVthW+fvGMj7wUVYxGlCc3EjBgCro2XLmWy4yfDsfh4LUiWFrIyk6kDL7fyNtRpfOxXe/tnSiyexHq3QwPFElj3rm9hJ1IrUULzdRq6nHGJ/rHQtP7PXQB2ox10dPDLmgD99HJwsmsQ9U3X2r+rln/zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LRV1yyss; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LjXUk3qh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LRV1yyss; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LjXUk3qh; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LRV1yyss";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LjXUk3qh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LRV1yyss";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LjXUk3qh"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5FA811F395;
	Wed,  7 May 2025 13:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746626379; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CmeTg3rjXN4MkuoVZrPEg6WRNv22XhbV9ixjF1dT3f0=;
	b=LRV1yysshpXdAx6c9h5CeFT6lTzSqNbmC7gOoG+LwE+XxBZvzkH60SPw8hb3diWx9vkFvs
	OpEakw7YHZNpD7kvDSC3FHeaQZi+RGPsrPkgU6dTmdBev6+JhBWxQ+0t+9xiaAA00rWZnB
	Z0H+9UhCysTZdz8P6fYnPGyDRC+wj+k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746626379;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CmeTg3rjXN4MkuoVZrPEg6WRNv22XhbV9ixjF1dT3f0=;
	b=LjXUk3qhq8BhA3N4iw7wucf374BjUoVPRRPlg/a86HfZHV1Ku4MsH4RoKIcXhyRl56kvmG
	5Ij2tK1/f25UH4AA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746626379; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CmeTg3rjXN4MkuoVZrPEg6WRNv22XhbV9ixjF1dT3f0=;
	b=LRV1yysshpXdAx6c9h5CeFT6lTzSqNbmC7gOoG+LwE+XxBZvzkH60SPw8hb3diWx9vkFvs
	OpEakw7YHZNpD7kvDSC3FHeaQZi+RGPsrPkgU6dTmdBev6+JhBWxQ+0t+9xiaAA00rWZnB
	Z0H+9UhCysTZdz8P6fYnPGyDRC+wj+k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746626379;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CmeTg3rjXN4MkuoVZrPEg6WRNv22XhbV9ixjF1dT3f0=;
	b=LjXUk3qhq8BhA3N4iw7wucf374BjUoVPRRPlg/a86HfZHV1Ku4MsH4RoKIcXhyRl56kvmG
	5Ij2tK1/f25UH4AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3C0E8139D9;
	Wed,  7 May 2025 13:59:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id H0gADktnG2h9TgAAD6G6ig
	(envelope-from <hare@suse.de>); Wed, 07 May 2025 13:59:39 +0000
Message-ID: <8d418b1b-a2bb-46ec-9469-c67bb59be089@suse.de>
Date: Wed, 7 May 2025 15:59:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/14] nvmet-fcloop: don't wait for lport cleanup
To: Daniel Wagner <wagi@kernel.org>, James Smart <james.smart@broadcom.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Chaitanya Kulkarni <kch@nvidia.com>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250507-nvmet-fcloop-v6-0-ca02e16fb018@kernel.org>
 <20250507-nvmet-fcloop-v6-10-ca02e16fb018@kernel.org>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20250507-nvmet-fcloop-v6-10-ca02e16fb018@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]

On 5/7/25 14:23, Daniel Wagner wrote:
> The lifetime of the fcloop_lsreq is not tight to the lifetime of the
> host or target port, thus there is no need anymore to synchronize the
> cleanup path anymore.
> 
> Signed-off-by: Daniel Wagner <wagi@kernel.org>
> ---
>   drivers/nvme/target/fcloop.c | 21 ++++-----------------
>   1 file changed, 4 insertions(+), 17 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
