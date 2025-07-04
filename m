Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AA1149C7B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 14:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751640181; cv=none; b=q4UGvrtRWxfRCTQ2ztvJEO82ESJteLuAR8s8JtzcYz/1j1L9CjbPxFSE/uwxauCsLk5eZqtnBDBrrADa88nTG2ZexpqRcLZYCNUK6EY2KUrA+e9GW3beESUFpUt2P32Uepf5Lb5Sx9N3pKnyIRptUsuy69S2lFzWH9Vh0DD6lao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751640181; c=relaxed/simple;
	bh=qz8KMOeKKfB4XEsAnwb161xkxu9XTGDxz2oDH30/9kM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oYgKNV+94+cC6i+tzmBjZE+oo68NiTeDgRjRtk3LqzOadP/wIOZJmLLA7gCIRmQisi/pezeTsivlwJpDXe4ELvlXUJe5iqqHNhYFNI/I+id7NMPdM7hrHI41EQiDqZchD9V7L+VUaOA2dCF5ivI7P1P9piowy7lOyv34Hq4hVwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JI5jseJB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fsbL5TB5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Yi8oHM7s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oRK85OcJ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JI5jseJB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fsbL5TB5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Yi8oHM7s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oRK85OcJ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 63573211BA;
	Fri,  4 Jul 2025 14:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751640176; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jDuinaPR64zVqK1kEHxNBJvXQ3xp9ELmQCqfHweGrhI=;
	b=JI5jseJB7B/YhYbzYvXeagZZyF9c2hIdxNnfDIAW81eDpL5Fh/FbdYyV1HQLlHupvjMZEm
	TuNDP87VhVyizcXbU82dRdXBdfedgny0GvnBrpKzvM02uoCb1kZKVPvi2Igyi+1YFM8Oyt
	nHob6ZxJv7v3u3FsZYTE7jB3A+HpMd8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751640176;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jDuinaPR64zVqK1kEHxNBJvXQ3xp9ELmQCqfHweGrhI=;
	b=fsbL5TB5hLciuclaRNawX3H/a+4dnOFecIz/fIv8nHU9mXV28LDI85ld/cM29kx1wKMnVv
	l8W6RlSuxeUVdtDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751640175; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jDuinaPR64zVqK1kEHxNBJvXQ3xp9ELmQCqfHweGrhI=;
	b=Yi8oHM7sUV41hh65wylwSGn80poGIh+0wbgJiLwo71CYjFFYLS5dUczUKrxY23tcrK/Ko4
	XwR2rgINKNPiMQTrv5HPF2NrW20PN+GUhg1Ta03GzTPjS70waIhZxC/i6NOUD63i4KUFXa
	c0uvuPiVLMIfR1nUgsuX++dRDybcnpI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751640175;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jDuinaPR64zVqK1kEHxNBJvXQ3xp9ELmQCqfHweGrhI=;
	b=oRK85OcJA+qB91kIW95y3wnR5u/gfiEy7ES/IzngxEcncAypzncFteNHuzXF0dPNZ6dLoT
	v3HaT6ILvYDYKwDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E1BA613A71;
	Fri,  4 Jul 2025 14:42:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CgyCNG7oZ2hIfAAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Fri, 04 Jul 2025 14:42:54 +0000
Date: Fri, 4 Jul 2025 16:42:39 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-aspeed@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Henry
 Martin <bsdhenrymartin@gmail.com>, Patrick Rudolph
 <patrick.rudolph@9elements.com>, Andrew Geissler <geissonator@yahoo.com>,
 Ninad Palsule <ninad@linux.ibm.com>, Patrick Venture <venture@google.com>,
 Robert Lippert <roblip@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/10] soc: aspeed: lpc-snoop: Switch to
 devm_clk_get_enabled()
Message-ID: <20250704164239.2f3a7d62@endymion>
In-Reply-To: <20250616-aspeed-lpc-snoop-fixes-v2-7-3cdd59c934d3@codeconstruct.com.au>
References: <20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd59c934d3@codeconstruct.com.au>
	<20250616-aspeed-lpc-snoop-fixes-v2-7-3cdd59c934d3@codeconstruct.com.au>
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
	BAYES_HAM(-3.00)[100.00%];
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
X-Spam-Score: -3.80

Hello Andrew,

On Mon, 16 Jun 2025 22:43:44 +0930, Andrew Jeffery wrote:
> Simplify clock handling as done in other drivers.
> 
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 20 ++++----------------
>  1 file changed, 4 insertions(+), 16 deletions(-)
> (...)

LGTM.

Acked-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
