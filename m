Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319F280BEC
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744807327; cv=none; b=eJHwBsM3wgM7S+DmnTnhV099uI+TTycHjxBJQxhhymK54DxnqmPR3NfUzo+D1EbKuiQtlMFUUM0kyiVWgO2qwB8TbRAojmvm44uPeFhv1jFrqkEZLMH5Goc2jx0kJ72Eav9EFp1WEuBYSsTyn3QXShBaGF5/varZHlTaWpuzAtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744807327; c=relaxed/simple;
	bh=gVK1R/KDGz0eC6yz7RNbZ5SwqtGK6yxnWX/mfA30/Xw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kgk7HHYRcDSjGCOYhgCUGDQyPH7TBpLRHE7OutuXTeAj8qsLVmVOCN6HAO0SiAoNdRBo5e+qEQFYTPg26KlNm3klgcMU6X9yyeENmvnJtzxHCXd1wcs0iCTbehj8ZZI11dzSfyjmxoaedwFtYfoO9gKyWBoIv2DHPHf16nDv1Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yruitDDN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VM7Yf7fv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yruitDDN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VM7Yf7fv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yruitDDN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VM7Yf7fv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yruitDDN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VM7Yf7fv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3D637211B1;
	Wed, 16 Apr 2025 12:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744807323; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kft/l26UMn0qv4IUd1VHWoZxWYC9qYSMKnrYZATelJs=;
	b=yruitDDNMXa1gJlGbnAjA7sdAll4iGzgaClBmSklc8+1S41wBTvCbhX4Womn/R0PT5tD+K
	lTKMZAlJ4RL5EzW/sVeIl+FSa8bg00f/MfGaHiKv29xjBVTRlHfqzjfcWlRwVdoStMC9J0
	rG6o+ODInKNd2dhKqXgr8YVreRMq3kw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744807323;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kft/l26UMn0qv4IUd1VHWoZxWYC9qYSMKnrYZATelJs=;
	b=VM7Yf7fvOsRupA/LLQw945nUNK2rosUsc7NGOcczhrkeosMFaOzdrzaoxNmv4UVkIlSAcm
	YeVw0Gn/jByHgGDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744807323; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kft/l26UMn0qv4IUd1VHWoZxWYC9qYSMKnrYZATelJs=;
	b=yruitDDNMXa1gJlGbnAjA7sdAll4iGzgaClBmSklc8+1S41wBTvCbhX4Womn/R0PT5tD+K
	lTKMZAlJ4RL5EzW/sVeIl+FSa8bg00f/MfGaHiKv29xjBVTRlHfqzjfcWlRwVdoStMC9J0
	rG6o+ODInKNd2dhKqXgr8YVreRMq3kw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744807323;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kft/l26UMn0qv4IUd1VHWoZxWYC9qYSMKnrYZATelJs=;
	b=VM7Yf7fvOsRupA/LLQw945nUNK2rosUsc7NGOcczhrkeosMFaOzdrzaoxNmv4UVkIlSAcm
	YeVw0Gn/jByHgGDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CC5BE139A1;
	Wed, 16 Apr 2025 12:42:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BP8CMJql/2dbLQAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Wed, 16 Apr 2025 12:42:02 +0000
Date: Wed, 16 Apr 2025 14:42:01 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Joel Stanley <joel@jms.id.au>, Henry Martin <bsdhenrymartin@gmail.com>,
 Patrick Rudolph <patrick.rudolph@9elements.com>, Andrew Geissler
 <geissonator@yahoo.com>, Ninad Palsule <ninad@linux.ibm.com>, Patrick
 Venture <venture@google.com>, Robert Lippert <roblip@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] soc: aspeed: lpc-snoop: Rename 'channel' to 'index'
 in channel paths
Message-ID: <20250416144152.2bb505d6@endymion>
In-Reply-To: <20250411-aspeed-lpc-snoop-fixes-v1-5-64f522e3ad6f@codeconstruct.com.au>
References: <20250411-aspeed-lpc-snoop-fixes-v1-0-64f522e3ad6f@codeconstruct.com.au>
	<20250411-aspeed-lpc-snoop-fixes-v1-5-64f522e3ad6f@codeconstruct.com.au>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,yahoo.com];
	FREEMAIL_CC(0.00)[jms.id.au,gmail.com,9elements.com,yahoo.com,linux.ibm.com,google.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codeconstruct.com.au:email,imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Score: -3.80
X-Spam-Flag: NO

On Fri, 11 Apr 2025 10:38:35 +0930, Andrew Jeffery wrote:
> We'll introduce another 'channel' variable shortly
> 
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 47 ++++++++++++++++++-----------------
>  1 file changed, 24 insertions(+), 23 deletions(-)
> (...)

Acked-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
