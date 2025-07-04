Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFAE15DBC1
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 14:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751640405; cv=none; b=O6iudNrgUhA6YlVnLLn599Hxwq23XD1SvMyFiNYmN3E8IqILwBvn3eykA1b807L8s+qunoNb0nnSvdpsGkG7/Sklyv9TqnNTB0Cli3uu99bSN1YKEZLOikUhu/6zYrvqfej+r2oLc1O7k4RC7p+YtiyREwZvc/hewUsMybA7KuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751640405; c=relaxed/simple;
	bh=nGVC9jTeQAWgykknQk9K2+Hcfag69dMrc2YU7w393w8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sNtdgK+5llwRa3JIPUkkOkXIJ7Os8rLzUIunwBzN3bncsFiiBO0G890WkxwYNm/stsBZ6hLINopWKtpQ6d4DfKBrG7MIfC4j5w4n8ZmlgKdwVpRhFgMQ5AHHPczVovpPHC5AR7JNABzouCbu8U6Osqgz8gIkEszAt8yFKNdkvq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MwoDi5jf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PbRxcG5H; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MwoDi5jf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PbRxcG5H; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MwoDi5jf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PbRxcG5H";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MwoDi5jf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PbRxcG5H"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 80AE21F74A;
	Fri,  4 Jul 2025 14:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751640401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9frsXWKqJUycEBgjpx/MaijERGDr4YZunJ3meZeytu8=;
	b=MwoDi5jfNMsodAI3nT0YzR6nvL1Y9cRkMEjofNm9HKPW3caZHqykzpmA/5NA/ftgFRk6YN
	+wNSZ09IVl3Yicw1X9TgFliZ/76h4hAwSbjyk1A55R2koTDhHzoWf+D9fpY9LKtdWoUPgK
	yFrnvLKkh8nlLUHwTBblirGrs2elv7U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751640401;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9frsXWKqJUycEBgjpx/MaijERGDr4YZunJ3meZeytu8=;
	b=PbRxcG5H+BrclZAkVhcDcgKdloJq30AiW6NzL1KHqfXhkHjKadsmymhPSFfO2sllLg14Xm
	GGO1uZGHLgm053Dg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751640401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9frsXWKqJUycEBgjpx/MaijERGDr4YZunJ3meZeytu8=;
	b=MwoDi5jfNMsodAI3nT0YzR6nvL1Y9cRkMEjofNm9HKPW3caZHqykzpmA/5NA/ftgFRk6YN
	+wNSZ09IVl3Yicw1X9TgFliZ/76h4hAwSbjyk1A55R2koTDhHzoWf+D9fpY9LKtdWoUPgK
	yFrnvLKkh8nlLUHwTBblirGrs2elv7U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751640401;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9frsXWKqJUycEBgjpx/MaijERGDr4YZunJ3meZeytu8=;
	b=PbRxcG5H+BrclZAkVhcDcgKdloJq30AiW6NzL1KHqfXhkHjKadsmymhPSFfO2sllLg14Xm
	GGO1uZGHLgm053Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1330513A71;
	Fri,  4 Jul 2025 14:46:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SWC5AlHpZ2hgfQAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Fri, 04 Jul 2025 14:46:41 +0000
Date: Fri, 4 Jul 2025 16:46:37 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-aspeed@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Henry
 Martin <bsdhenrymartin@gmail.com>, Patrick Rudolph
 <patrick.rudolph@9elements.com>, Andrew Geissler <geissonator@yahoo.com>,
 Ninad Palsule <ninad@linux.ibm.com>, Patrick Venture <venture@google.com>,
 Robert Lippert <roblip@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/10] soc: aspeed: lpc-snoop: Use dev_err_probe()
 where possible
Message-ID: <20250704164637.3552933a@endymion>
In-Reply-To: <20250616-aspeed-lpc-snoop-fixes-v2-8-3cdd59c934d3@codeconstruct.com.au>
References: <20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd59c934d3@codeconstruct.com.au>
	<20250616-aspeed-lpc-snoop-fixes-v2-8-3cdd59c934d3@codeconstruct.com.au>
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
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,yahoo.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,jms.id.au,gmail.com,9elements.com,yahoo.com,linux.ibm.com,google.com,lists.infradead.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,codeconstruct.com.au:email,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.80

On Mon, 16 Jun 2025 22:43:45 +0930, Andrew Jeffery wrote:
> Exploit that it returns the provided error to eliminate some lines, and
> return the actual error involved rather than -ENODEV.
> 
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> (...)

LGTM.

Acked-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
