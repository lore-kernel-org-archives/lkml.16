Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CF13594D
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 23:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743378979; cv=none; b=CivF2RQMd/ySdELjsgXlDp8lm/Oc3jfhBOcb93jfkGWQAuKcQ6S5bagSO1vARJDOssx8BrkQDXS1Ofb00XfmMZBj9RdViZaQ5mWC7uxUQh8yD6g9hIhTFarrtrXxxR9D/Vemb44aVrWmop9C9O179jiT8B9dCjwJUCm6hLlAi2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743378979; c=relaxed/simple;
	bh=iVuClAr2aYqh7WKm6QX2yMC0zJR6TTLN2hLzA+GJXOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CaP5i/z9Okc/iaHuNu28XtHWfboLl8gN21hVzDO8bjMn/MrCUlybFOTJJ8nw5rbCNFNHd1vv747Z1ydJ37uY2u/AleNr4VMmXuhGerkM41+PmgzVOynGBKnfqzy7aqX4fhlWylF/D6Gng42uDWT61iAax15u65nfKH0GXgP7k+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=ZWPmgawD; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=Y2hvEGas; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=ZWPmgawD; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=Y2hvEGas; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="ZWPmgawD";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Y2hvEGas";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="ZWPmgawD";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Y2hvEGas"
Received: from lion.mk-sys.cz (unknown [10.100.225.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 850942119B;
	Sun, 30 Mar 2025 23:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1743378973; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KkFtXGeyDEF6b4XWmmH4QrQrUTJ4sXopxEBUbn/eJZo=;
	b=ZWPmgawDQEyJxUCqViYu4NcD/tJ7OGLtTpBV/Ws+Dxci6odAlFfxh+peCGJetCl8Tgt4uB
	jwyQCB+sJ2w4NO+YVwAGz3tPhneV1A5/dbtKsMqsXsUjMYbFlcCrvX46wLNwpJpniHLflu
	G7Fkg3ejNyDSFWNIxcBKl8R9qa7G078=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1743378973;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KkFtXGeyDEF6b4XWmmH4QrQrUTJ4sXopxEBUbn/eJZo=;
	b=Y2hvEGas8uKls6Xc+o+se4SUjJ7LZA6okTFAgNhWucVWE1oyoh3oR2n8vL+WkJqFaWjLP5
	RzbiSKyu50aKdXDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1743378973; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KkFtXGeyDEF6b4XWmmH4QrQrUTJ4sXopxEBUbn/eJZo=;
	b=ZWPmgawDQEyJxUCqViYu4NcD/tJ7OGLtTpBV/Ws+Dxci6odAlFfxh+peCGJetCl8Tgt4uB
	jwyQCB+sJ2w4NO+YVwAGz3tPhneV1A5/dbtKsMqsXsUjMYbFlcCrvX46wLNwpJpniHLflu
	G7Fkg3ejNyDSFWNIxcBKl8R9qa7G078=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1743378973;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KkFtXGeyDEF6b4XWmmH4QrQrUTJ4sXopxEBUbn/eJZo=;
	b=Y2hvEGas8uKls6Xc+o+se4SUjJ7LZA6okTFAgNhWucVWE1oyoh3oR2n8vL+WkJqFaWjLP5
	RzbiSKyu50aKdXDg==
Received: by lion.mk-sys.cz (Postfix, from userid 1000)
	id 6DE0720057; Mon, 31 Mar 2025 01:56:13 +0200 (CEST)
Date: Mon, 31 Mar 2025 01:56:13 +0200
From: Michal Kubecek <mkubecek@suse.cz>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Jason Xing <kernelxing@tencent.com>, 
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH ethtool-next 0/3] Add support for hardware timestamp
 provider
Message-ID: <mjn6eeo6lestvo6z3utb7aemufmfhn5alecyoaz46dt4pwjn6v@4aaaz6qpqd4b>
References: <20250305-feature_ptp-v1-0-f36f64f69aaa@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305-feature_ptp-v1-0-f36f64f69aaa@bootlin.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-2.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,redhat.com,lunn.ch,gmail.com,tencent.com,armlinux.org.uk,vger.kernel.org,bootlin.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[]
X-Spam-Score: -2.30
X-Spam-Flag: NO

On Wed, Mar 05, 2025 at 06:33:36PM +0100, Kory Maincent wrote:
> Add support for reading tsinfo of a specific hardware timetstamp provider.
> Enable selecting the hwtstamp provider within the network topology of a
> network interface.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
> Kory Maincent (3):
>       update UAPI header copies
>       tsinfo: Add support for hwtstamp provider
>       netlink: Add support for tsconfig command
> 

Hello,

the series has been applied to master branch as the kernel counterpart
is already present in 6.14 kernel release.

Michal
