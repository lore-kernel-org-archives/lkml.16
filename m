Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB161FECA1
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811992; cv=none; b=pXhA3kUbLTGakyvxo2o8YEujInea8J8Pt7Lc7fqmlwRz4IzFYPvH2LNJ1X+Tmvvb6BwAF3wV9r8KPgHhvY3AQVGAyb74WLPkJy7tRo507C3FpjqTMrbClJe9yS+YfjWQtPnWKn6h1gVwBhN6rfjY0zAIuO4m4SdNQWmqP2gSo6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811992; c=relaxed/simple;
	bh=ZKeTJcAQauX3ZYJ9A0tSCcUAXdPNVOFW8a3KPutKB+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bTnAtYOPyIAH/dr7XaEy4ntB2Ea/+0Rnzn8hkvwjAM3McxnV4l7BPiDhiN87e3LfcA0sYqEBiPQhigcmTYxgfjhb3WaL/es/1HkWCQOqrNvT1O/13fNK9we2bOlwIoQYbkB5n9oGZNAf3eJvxBSuFZqdHqbo2syngpiQUSa0m3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=pVZ/OeOO; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=cHRriyKR; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Dz74m58J; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=X2tKJKup; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="pVZ/OeOO";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="cHRriyKR";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Dz74m58J";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="X2tKJKup"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EF1111F6E6;
	Wed, 16 Apr 2025 13:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744811989; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SHDGqv1OI4hhRkxVWXmrGgx5NhWsftkMacf1qKgIh2s=;
	b=pVZ/OeOOdXhU+wnjHKkkD5W74KIquyrykoGjfGYZ9WcByjBzG1pCQIbdArcKyO8ZLqf8vX
	avVlEpV6pn5yJPu3sO7HDD349KAAqrZxYnwqgUoT60LMCGm6aiBS5TeVyHQaN9FOWFX5ZI
	fcioTTxhJrGdYVJVAOj5yBi/VGpEw3I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744811989;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SHDGqv1OI4hhRkxVWXmrGgx5NhWsftkMacf1qKgIh2s=;
	b=cHRriyKR/G6B41GRd1te+FRpCN3xuNFMrY8j6XXXXO9/xDuLc/JXDy9GLFD8f//wqG6jMJ
	++ap8Y+CNyddPhDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=Dz74m58J;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=X2tKJKup
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744811987; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SHDGqv1OI4hhRkxVWXmrGgx5NhWsftkMacf1qKgIh2s=;
	b=Dz74m58Jl9nUq4tHLzV0Ee37iKD2j5ZyE2cU5PQEaYk7m7801yPuQ65qmEt2Xou7L+l3FF
	v7MBS9TUFNXJm2BmAy71aVXj4FOP8CXS3fyrZlh9SBQsCkl8PN1mlHjybRQYRnfWUL4YT2
	vlNtuUAl/AebqsYQapcRVUB/rYJ9i/k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744811987;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SHDGqv1OI4hhRkxVWXmrGgx5NhWsftkMacf1qKgIh2s=;
	b=X2tKJKupHyJTVqRlwhCfvPzAo6iZo6nWuG/ZWaoywCEAS92Jgb7nOT2gm/jK6YXrTgWoMf
	tNqYcqdcACvkscBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DD618139A1;
	Wed, 16 Apr 2025 13:59:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JPizNdO3/2f+RQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 16 Apr 2025 13:59:47 +0000
Message-ID: <869da814-9219-4c5c-803c-e0fd3405246b@suse.cz>
Date: Wed, 16 Apr 2025 15:59:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add Pedro as reviewer to the MEMORY MAPPING
 section
Content-Language: en-US
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Pedro Falcato <pfalcato@suse.de>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Jann Horn <jannh@google.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20250416135301.43513-1-lorenzo.stoakes@oracle.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250416135301.43513-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: EF1111F6E6
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MID_RHS_MATCH_FROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,linux-mm.org:url,suse.cz:dkim,suse.cz:mid,suse.cz:email,kvack.org:email];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On 4/16/25 15:53, Lorenzo Stoakes wrote:
> Pedro has offered to review memory mapping code. He has good experience in
> this area and has provided excellent feedback on memory mapping series in
> the past so I feel he'll be a great addition.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Acked-by: Vlastimil Babka <vbabka@suse.cz>

Thanks!

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8d834514a047..ecbf9bcc7b57 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15579,6 +15579,7 @@ M:	Liam R. Howlett <Liam.Howlett@oracle.com>
>  M:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>  R:	Vlastimil Babka <vbabka@suse.cz>
>  R:	Jann Horn <jannh@google.com>
> +R:	Pedro Falcato <pfalcato@suse.de>
>  L:	linux-mm@kvack.org
>  S:	Maintained
>  W:	http://www.linux-mm.org

