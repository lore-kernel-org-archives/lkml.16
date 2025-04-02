Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB10C23875A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 14:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743602620; cv=none; b=H2zR0d6/MVaj6BYD0aAplPxHHOqHATCvOyQamygNHmPhw/EjZzB3A3mq5c7w0ljGxSeR6dxrrvNSKDp3KGYV2cuiMbuEbITM3J/pKY9S1GtUR4SNaFeHgRskEOeU9ETxOXPjE6N2HMBVy3cFKtDbeOiIjW8sANkk8of0tEwGtgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743602620; c=relaxed/simple;
	bh=GjXTvj9xb2GzWW3mlXTnUxkcIX9VcE/p7Fg8PevSAOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LR0RRzIAdMVfn6jgDeHi+jXEAb5gkBtDAk7Oer8wdgVPXwgdrhsYtFoTqNBn/I03OW+WrExaUHRhIi5hy861Xq53An6pvrpQf/Ve/RLlsn3hWOXn7YbASt3gwAgkNs8nely+2IyZGC1oeLWXMC9MAfTcjNr9jp2iNdRL9I8RC6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O96Rm3z1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8EcOn2s1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O96Rm3z1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8EcOn2s1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O96Rm3z1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8EcOn2s1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O96Rm3z1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8EcOn2s1"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C16EE210F2;
	Wed,  2 Apr 2025 14:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743602616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pWctlHaLutJX4c1zYarMiQ/lMppk3s7YXy2NAqxD7pQ=;
	b=O96Rm3z1x8iclfYuIibE7TC3cxn2rKDudBNjR8Kef3jHRDPUyz6VHfHI6o8sZ1jqvDxsyh
	WCPj6jIgCKaamflGnhHklyPRQYIWRxWDzK59QXWH44r0wvtQ/WCjGBt+kJEYM6SquuU1xG
	MICL4+dufpugqWk6VpKJvCzmv4FwUXQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743602616;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pWctlHaLutJX4c1zYarMiQ/lMppk3s7YXy2NAqxD7pQ=;
	b=8EcOn2s1gLpWJkatZXTfE7BisiMFt6KYvxKKPSC4fq+iX4VYy4PQfAZXJGsmYMO4Wl0iJ3
	VTRAlCn4IvFVBMAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=O96Rm3z1;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=8EcOn2s1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743602616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pWctlHaLutJX4c1zYarMiQ/lMppk3s7YXy2NAqxD7pQ=;
	b=O96Rm3z1x8iclfYuIibE7TC3cxn2rKDudBNjR8Kef3jHRDPUyz6VHfHI6o8sZ1jqvDxsyh
	WCPj6jIgCKaamflGnhHklyPRQYIWRxWDzK59QXWH44r0wvtQ/WCjGBt+kJEYM6SquuU1xG
	MICL4+dufpugqWk6VpKJvCzmv4FwUXQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743602616;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pWctlHaLutJX4c1zYarMiQ/lMppk3s7YXy2NAqxD7pQ=;
	b=8EcOn2s1gLpWJkatZXTfE7BisiMFt6KYvxKKPSC4fq+iX4VYy4PQfAZXJGsmYMO4Wl0iJ3
	VTRAlCn4IvFVBMAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A4B3113A4B;
	Wed,  2 Apr 2025 14:03:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4jHOJbhD7WfCIgAAD6G6ig
	(envelope-from <dwagner@suse.de>); Wed, 02 Apr 2025 14:03:36 +0000
Date: Wed, 2 Apr 2025 16:03:35 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Hannes Reinecke <hare@suse.de>
Cc: Daniel Wagner <wagi@kernel.org>, 
	James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Chaitanya Kulkarni <kch@nvidia.com>, Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/18] nvmet-fcloop: replace kref with refcount
Message-ID: <709b524c-7191-451f-81ea-8bad8f1c6a16@flourine.local>
References: <20250318-nvmet-fcloop-v3-0-05fec0fc02f6@kernel.org>
 <20250318-nvmet-fcloop-v3-2-05fec0fc02f6@kernel.org>
 <e94a7fab-3811-449b-9999-7641b9274b07@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e94a7fab-3811-449b-9999-7641b9274b07@suse.de>
X-Rspamd-Queue-Id: C16EE210F2
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Tue, Mar 18, 2025 at 11:56:50AM +0100, Hannes Reinecke wrote:
> On 3/18/25 11:39, Daniel Wagner wrote:
> > The kref wrapper is not really adding any value ontop of refcount. Thus
> > replace the kref API with the refcount API.
> > 
> > Signed-off-by: Daniel Wagner <wagi@kernel.org>
> > ---
> >   drivers/nvme/target/fcloop.c | 37 +++++++++++++------------------------
> >   1 file changed, 13 insertions(+), 24 deletions(-)
> > 
> Can you split this in two, one for the nport and one for fcpreq?
> That way it's easier to follow what has been modified.

Do you still want me to split the patch? You and Christoph have sent the
Reviewed-by tag after this review.
