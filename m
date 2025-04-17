Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC39189B8C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744883562; cv=none; b=c8YElc/tczt+ok0SP6DiKBT2mRphciFB0rzfiy096Bhx+b+zaMwcn3Zy4S5ugUQGvz3s+haT4DMj9ZZe7AElRbMao7ww00YQhjzhc5NHdN8HoD7f70jtegY/o8brn26klFGG+9Vpv1lMYhoefQjV730ZXkF58D4G+b63C9aqcdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744883562; c=relaxed/simple;
	bh=07tYIb+RUs3FMwXrZ34gZ25Wn+BtLeFIH+KE/W8subg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TMdcbvmoBU47shsN665oV+sgzdan5U0JGTk4uswONL3eLT+1zrylAWdksCv9U0e85EXQHJY6vbpnc/yWDvRRfbixmkp5eFHNCiD3JVnW5FIAo8e8CDv7ZdpIjt/tLLpKCMKofaYzQAytqVjtxdfs2ZkGVT9Y75mHvyQNBT51IS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CO7BxkB4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TpBVHMkc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CO7BxkB4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TpBVHMkc; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CO7BxkB4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TpBVHMkc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CO7BxkB4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TpBVHMkc"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4176F21188;
	Thu, 17 Apr 2025 09:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744883558; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B9rqnyNyz33Bqk6MCIPWhbXscQcAY4IETP2JmrcSRvU=;
	b=CO7BxkB4s/gT/8OFxmzDEQi4B34fWyr+K622QBdVyDMYJt3B4EC8Eabqd/8mOkUNOYcPsF
	LxR9YfVfTA/c7modO/1/pV9M1NS3qgw4x1nx55pdnZBmuVlrBgLXaV1od5huYO7uLp1WVa
	Hrr+ox/xHstTlePq/iVNkJB1cVwFXkM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744883558;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B9rqnyNyz33Bqk6MCIPWhbXscQcAY4IETP2JmrcSRvU=;
	b=TpBVHMkcYuGjz9gxwKDbogTSGwK2rs9shxozPHDVd3BJ4bkgl0oA0e4aHVZXfy/U1wfvb8
	gYs0SAtsZhgyX/Bw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CO7BxkB4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=TpBVHMkc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744883558; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B9rqnyNyz33Bqk6MCIPWhbXscQcAY4IETP2JmrcSRvU=;
	b=CO7BxkB4s/gT/8OFxmzDEQi4B34fWyr+K622QBdVyDMYJt3B4EC8Eabqd/8mOkUNOYcPsF
	LxR9YfVfTA/c7modO/1/pV9M1NS3qgw4x1nx55pdnZBmuVlrBgLXaV1od5huYO7uLp1WVa
	Hrr+ox/xHstTlePq/iVNkJB1cVwFXkM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744883558;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B9rqnyNyz33Bqk6MCIPWhbXscQcAY4IETP2JmrcSRvU=;
	b=TpBVHMkcYuGjz9gxwKDbogTSGwK2rs9shxozPHDVd3BJ4bkgl0oA0e4aHVZXfy/U1wfvb8
	gYs0SAtsZhgyX/Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D3327137CF;
	Thu, 17 Apr 2025 09:52:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tneQMWXPAGgXfgAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Thu, 17 Apr 2025 09:52:37 +0000
Date: Thu, 17 Apr 2025 11:52:37 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Joel Stanley <joel@jms.id.au>, Henry Martin <bsdhenrymartin@gmail.com>,
 Patrick Rudolph <patrick.rudolph@9elements.com>, Andrew Geissler
 <geissonator@yahoo.com>, Ninad Palsule <ninad@linux.ibm.com>, Patrick
 Venture <venture@google.com>, Robert Lippert <roblip@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] soc: aspeed: lpc-snoop: Rearrange channel paths
Message-ID: <20250417115231.3e5771ad@endymion>
In-Reply-To: <20250411-aspeed-lpc-snoop-fixes-v1-6-64f522e3ad6f@codeconstruct.com.au>
References: <20250411-aspeed-lpc-snoop-fixes-v1-0-64f522e3ad6f@codeconstruct.com.au>
	<20250411-aspeed-lpc-snoop-fixes-v1-6-64f522e3ad6f@codeconstruct.com.au>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4176F21188
X-Spam-Level: 
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,yahoo.com];
	FREEMAIL_CC(0.00)[jms.id.au,gmail.com,9elements.com,yahoo.com,linux.ibm.com,google.com,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.01
X-Spam-Flag: NO

On Fri, 11 Apr 2025 10:38:36 +0930, Andrew Jeffery wrote:
> Order assignments such that tests for conditions not involving resource
> acquisition are ordered before those testing acquired resources, and
> order managed resource acquisition before unmanaged where possible. This
> way we minimise the amount of manual cleanup required.
> 
> In the process, improve readability of the code by introducing a channel
> pointer that takes the place of the repeated object lookups.
> 
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 47 ++++++++++++++++++++---------------
>  1 file changed, 27 insertions(+), 20 deletions(-)
> (...)

LGTM.

Acked-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
