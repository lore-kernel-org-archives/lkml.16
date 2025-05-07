Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2B0209F43
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746625894; cv=none; b=uXYZaAwWu7rb+MahZhBaG4E7Wz4vWEPJAweFgz+sE2QYwS3LpgnN1cieNZj8S8bkRTys3ly088voTanAhx/oxGpCFzs2Ka0I9CjFTLfF1lf4JxjjCltY9+iG68VAH89IZqG2NtTuOK3OaVBtLLejrR8Y5mSUN3elavubWiLqd8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746625894; c=relaxed/simple;
	bh=0N7ntTXUYuKVCt8MHdZNa5d3VconHB3xgSzpjk8WSnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZKvlIy6KAL4d6lPKKZCur+pH7bFIoegBc1HHlUuFyJ87mUwlti6UigbWBb/9M+A9gvy/HSKAelJDO/yn24gPksRPP1vgFcBLzsEZgqkaDkl3shrEg+HOC0dm6M+2gixI+2u98VRdHI6vPiWHL7jL0cFMkoqWHgp8NsDS9okBBIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G7hIR4ku; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hoFCj8aF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qb6Zz4vV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=s3N7jbhR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G7hIR4ku";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hoFCj8aF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qb6Zz4vV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s3N7jbhR"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F1E1B1F441;
	Wed,  7 May 2025 13:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746625890; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cp6Y+iDKepynE7pZQgIxTxDWzN13jqiRumIztALhbSM=;
	b=G7hIR4kuxKcK7GSeHWsCo27dYQvvqtgHHbdRWjF4ECx/GctLq80ZagakJsgCfg9R9ls5sD
	a0WFVUsmgzWTMv/2S9My8RAPFExr6sIQ9wYvuu81vAqffQCiHv72bUcBzL/auyprdKgCJu
	5KPV1uZF2+HLtEoM1TuyHaFoWTWitu0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746625890;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cp6Y+iDKepynE7pZQgIxTxDWzN13jqiRumIztALhbSM=;
	b=hoFCj8aF080Bj0J9YfEsMWTFdHYno6sS5xMSqifUGeaoPC02YwwP8LJYoyrOIhqFIqJKhr
	Pr5wU+sjV3UtpQBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746625889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cp6Y+iDKepynE7pZQgIxTxDWzN13jqiRumIztALhbSM=;
	b=qb6Zz4vVBmN2OeoHzyJQqXpzCe2xhdqP08qJAP/VWwc7/xjbEI22dQk+weqz65XFuAilDt
	P272RxP6WzPQbfrBeLBqYct/VFkWNCpa9c09Hff/O5qFl0GEBXA1rGidtzmQXn0Wxw4Ty5
	hI5hW/9IFA5GT8HJ+ZEFza9RwzZGJ4Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746625889;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cp6Y+iDKepynE7pZQgIxTxDWzN13jqiRumIztALhbSM=;
	b=s3N7jbhRGRKMOl+Cq70lEkgSAO7iPXWL9ZeP1RYPMAZ74MMX8V0g8bqvPUeJ7yqPYY79om
	7UdPbhxZRIwNABBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D0739139D9;
	Wed,  7 May 2025 13:51:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id otJHMmFlG2gYTAAAD6G6ig
	(envelope-from <hare@suse.de>); Wed, 07 May 2025 13:51:29 +0000
Message-ID: <6fdc1395-ab4d-4288-96dc-e16c1162ba42@suse.de>
Date: Wed, 7 May 2025 15:51:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/14] nvmet-fcloop: add missing
 fcloop_callback_host_done
To: Daniel Wagner <wagi@kernel.org>, James Smart <james.smart@broadcom.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Chaitanya Kulkarni <kch@nvidia.com>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250507-nvmet-fcloop-v6-0-ca02e16fb018@kernel.org>
 <20250507-nvmet-fcloop-v6-6-ca02e16fb018@kernel.org>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20250507-nvmet-fcloop-v6-6-ca02e16fb018@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email]
X-Spam-Score: -3.30

On 5/7/25 14:23, Daniel Wagner wrote:
> Add the missing fcloop_call_host_done calls so that the caller
> frees resources when something goes wrong.
> 
> Signed-off-by: Daniel Wagner <wagi@kernel.org>
> ---
>   drivers/nvme/target/fcloop.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
