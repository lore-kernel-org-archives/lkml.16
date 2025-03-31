Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E477815A856
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 18:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743444206; cv=none; b=s/l+BNzX6Y72U0KNDY/WzgMlDYUDUawvWeJSqJ7+f+pYQH2yBtAoLAS8SkMgyEIKYC66Cxa1PhT30iIOLNolDJR2XHuHxsTPpz8LdpqplAj3g+ACzn5F4KMWALKgEei1TVIjtv4GqiP4+Vw8ODldmd2L/XaCp6Ewg+fEGkHHv5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743444206; c=relaxed/simple;
	bh=r78nqsjLGspH2tOjKgRiZNR3tMQVibxkFpze3Kokc6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gb9tBsVUZadhV+S2lbgSf0HwLc6XhznmpGGVCrd86R46ZTYTzeA2DhyWKQkA+5Fk2Lrp6sx0u5nRdeuy4Myh4kqxTTwqQ9nzjh4Kx+NP8heCHHizU+XXrZ0OHPCKR/q9nz632iGz00cA9Ge60dwf/g496KTFmm1G3X/H14haC5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=hOPA38Kz; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=7gTiISn0; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=qzXVf8bk; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=Ee2uG+Y3; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="hOPA38Kz";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="7gTiISn0";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="qzXVf8bk";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Ee2uG+Y3"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D8C471F457;
	Mon, 31 Mar 2025 18:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1743444203;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ktt9B4VUIXX5iAp5r4W91XhdoWHYHRvvyJlgoNm7azM=;
	b=hOPA38Kzq7HadxbR4wl9yC0aMN5Z4OIBEWNjSqVG4Xw4xV4JqyltMd58FekRPI527NUfB7
	KPbeH3+VGXhUc2Y1D6XEKaU+VNLCS8if25co7OzjK1ih3xvpay8oHXIePgWK+4dg1eFBxP
	xUoeK/Ofh3DvfGi4Z3zp1e/yg8BV5zM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1743444203;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ktt9B4VUIXX5iAp5r4W91XhdoWHYHRvvyJlgoNm7azM=;
	b=7gTiISn0EJVVhTwFdnofswpRP3KTuBI6nWwtao7Zujc58ZFPUvi2QY/DNzX8IeP9DjE5X5
	8Itr/q+pplCXF2DA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=qzXVf8bk;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=Ee2uG+Y3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1743444202;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ktt9B4VUIXX5iAp5r4W91XhdoWHYHRvvyJlgoNm7azM=;
	b=qzXVf8bkS+IuoPrG5aXMRMvGzk6TcvgLzPRUxfgNWsp/RDAB/4DwlGnbbUP9c43OcrRJkM
	8PT24Vy2NH1wNhgZFT3ZqcYFGfffwN0EOozWTcG+0jwauYoDH5ohoGpTIfCIiD/vVBGpOg
	A9OfQsj/P973yrb1aoMPENiWO7EnD5A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1743444202;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ktt9B4VUIXX5iAp5r4W91XhdoWHYHRvvyJlgoNm7azM=;
	b=Ee2uG+Y36GzlPEbztsdZJmX6KsVpTOTnsUj3MPI86jsm3XifLnmmhOIxcUKshT+EbC/eQY
	0ur7QVh6CFt4W8Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AB89F13A1F;
	Mon, 31 Mar 2025 18:03:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BN6sKerY6mciewAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Mon, 31 Mar 2025 18:03:22 +0000
Date: Mon, 31 Mar 2025 20:03:17 +0200
From: David Sterba <dsterba@suse.cz>
To: cve@kernel.org, linux-kernel@vger.kernel.org
Cc: linux-cve-announce@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: CVE-2022-49761: btrfs: always report error in
 run_one_delayed_ref()
Message-ID: <20250331180316.GJ32661@suse.cz>
Reply-To: dsterba@suse.cz
References: <2025032703-CVE-2022-49761-9b1e@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025032703-CVE-2022-49761-9b1e@gregkh>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Rspamd-Queue-Id: D8C471F457
X-Spam-Level: 
X-Spamd-Result: default: False [-4.21 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HAS_REPLYTO(0.30)[dsterba@suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,suse.cz:dkim,suse.cz:mid];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.21
X-Spam-Flag: NO

On Thu, Mar 27, 2025 at 05:43:19PM +0100, Greg Kroah-Hartman wrote:
> Description
> ===========
> 
> In the Linux kernel, the following vulnerability has been resolved:
> 
> btrfs: always report error in run_one_delayed_ref()
> 
> Currently we have a btrfs_debug() for run_one_delayed_ref() failure, but
> if end users hit such problem, there will be no chance that
> btrfs_debug() is enabled.  This can lead to very little useful info for
> debugging.
> 
> This patch will:
> 
> - Add extra info for error reporting
>   Including:
>   * logical bytenr
>   * num_bytes
>   * type
>   * action
>   * ref_mod
> 
> - Replace the btrfs_debug() with btrfs_err()
> 
> - Move the error reporting into run_one_delayed_ref()
>   This is to avoid use-after-free, the @node can be freed in the caller.
> 
> This error should only be triggered at most once.
> 
> As if run_one_delayed_ref() failed, we trigger the error message, then
> causing the call chain to error out:
> 
> btrfs_run_delayed_refs()
> `- btrfs_run_delayed_refs()
>    `- btrfs_run_delayed_refs_for_head()
>       `- run_one_delayed_ref()
> 
> And we will abort the current transaction in btrfs_run_delayed_refs().
> If we have to run delayed refs for the abort transaction,
> run_one_delayed_ref() will just cleanup the refs and do nothing, thus no
> new error messages would be output.
> 
> The Linux kernel CVE team has assigned CVE-2022-49761 to this issue.

I'm disputing this CVE, there is no vulnerability. The code moves a
debugging print and makes it a more verbose error but does not have any
other functional change. Specifically it does not extend error handling
in any sensible way.

There is no apparent _vulnerability_, the patch was in stable likely
because it adds some user convenience, but thre's no Fixes nor CC:stable
tags so it was probably picked by AUTOSEL. Please reject the CVE, thanks.
