Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5F42459FE
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 17:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745948147; cv=none; b=Q8zguqOwUqMxNYrwiYuZaL8MBn4JAdx0anI8WFKuC1T1rzvYedCxhUYD3H66boqI2rMZHEVgQm8CVCA+VfVCwU+4IXc3PZgW11xmsI08vrGEx89TL7+MtssWtlxiQZRC9hsQz8XZnUlh/0M+fBu2fLgQi88Ww3qhjoHKtC3edOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745948147; c=relaxed/simple;
	bh=eqFyvYpr93JmfsXltEn20SrpagqAUSogx2PIMraWJQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mNcIMJQ/UygaefL5XbsGcNQZqc574oiqC6imoBAOFpF/XUOpSBxMCAUeoV5G8+PSm8Pfsovk2VtYJuEfqirfeLE9lfXPGxLUHL3ntv+Xq6yXnlgUz8APYLBLJeUXpm/LIVeu6E0L4S2GCY1xv3VyR0sb29NNK2Y1v4fTQnQEzWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wHgzt1eE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FSTCRZ/D; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wHgzt1eE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FSTCRZ/D; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wHgzt1eE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FSTCRZ/D";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wHgzt1eE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FSTCRZ/D"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 52E5621206;
	Tue, 29 Apr 2025 17:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745948142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lTql7HnDsxiIl3qbXiANCn26wibJ3QtLQajx4ncrD2o=;
	b=wHgzt1eEZbBCyK8k7Pdyf3ymTbQPGqq4Ga77Y3M9cYGnyeUOuIx/u8xj2Zy9e/e22McJBa
	Usi8wTXX9hImndCkAHHe5w3vmJXT4utsLFw6rpjUOTJMPwT8KPC59nWK3Jql/7NXyBsJDj
	MFI9pHkT+sR+wYuE0sONmfYvBXIFoDA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745948142;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lTql7HnDsxiIl3qbXiANCn26wibJ3QtLQajx4ncrD2o=;
	b=FSTCRZ/D/eTka6b0o4j8dV4ATJAhkuUXmNkufZlrkVRi5sLloW76AwhQ0qTudzgxth8daK
	br45g6Q4KgnaHgDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745948142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lTql7HnDsxiIl3qbXiANCn26wibJ3QtLQajx4ncrD2o=;
	b=wHgzt1eEZbBCyK8k7Pdyf3ymTbQPGqq4Ga77Y3M9cYGnyeUOuIx/u8xj2Zy9e/e22McJBa
	Usi8wTXX9hImndCkAHHe5w3vmJXT4utsLFw6rpjUOTJMPwT8KPC59nWK3Jql/7NXyBsJDj
	MFI9pHkT+sR+wYuE0sONmfYvBXIFoDA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745948142;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lTql7HnDsxiIl3qbXiANCn26wibJ3QtLQajx4ncrD2o=;
	b=FSTCRZ/D/eTka6b0o4j8dV4ATJAhkuUXmNkufZlrkVRi5sLloW76AwhQ0qTudzgxth8daK
	br45g6Q4KgnaHgDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 120791340C;
	Tue, 29 Apr 2025 17:35:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +3y1Au4NEWj4MgAAD6G6ig
	(envelope-from <hare@suse.de>); Tue, 29 Apr 2025 17:35:42 +0000
Message-ID: <0d46ca2b-3cb2-48c0-8e6d-989e1e5f9325@suse.de>
Date: Tue, 29 Apr 2025 19:35:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvme-tcp: select tls config when tcp tls is enabled
To: Chaitanya Kulkarni <chaitanyak@nvidia.com>,
 Alistair Francis <alistair23@gmail.com>, "hch@lst.de" <hch@lst.de>,
 "sagi@grimberg.me" <sagi@grimberg.me>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20250424101333.2908504-1-alistair.francis@wdc.com>
 <f3282cae-ce46-4aa3-8f55-dcc73da93d0e@nvidia.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <f3282cae-ce46-4aa3-8f55-dcc73da93d0e@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[nvidia.com,gmail.com,lst.de,grimberg.me,lists.infradead.org];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,wdc.com:email,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On 4/29/25 18:28, Chaitanya Kulkarni wrote:
> On 4/24/25 03:13, Alistair Francis wrote:
>> Ensure that TLS support is enabled in the kernel when
>> NVME_TARGET_TCP_TLS is enabled. This allows TLS secure channels to be
>> used out of the box.
>>
>> Signed-off-by: Alistair Francis<alistair.francis@wdc.com>
> 
> Looks good.
> 
> Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
> 
> -ck
> 
Alistair, I think the same fix should be applied to the host side, too;
check the last patch of my patch series to convert the authentication
code to use the kernel keyring [1].

Should I send out that one as a stand-alone patch to get this issue
resolved?

[1] 
https://lore.kernel.org/linux-nvme/20250425094927.102656-13-hare@kernel.org/T/#u

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
