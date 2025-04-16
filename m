Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C782921E096
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744785579; cv=none; b=AA5olKSqlmxaQXOyGcNMLXMxGBsRomhG2yn7g9h0dmj6nfsZ7ZOc4w/vKdHzvwlr59NKIbqw9OYwFXmaay02zOLavDteHYmvk2xk9YMmJ3ZHbvelWUY/sAnqdNkpF2qkYw6zL+Yvb2HuIaefb1bWkGiAajpDarKUeSLd+BVDqzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744785579; c=relaxed/simple;
	bh=fC/u6FApHAINK3zG50Ct9A3y8jyeYZcy6YBsUYtmXKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vb/PUfTS5BRhYC6UUNB/CQpZPuOGro2yB45fLbpLniyxxo2gS3qD1okbtOxjhWQcpxzYTGgGnwHFJ2Uxq53OHOEZGOchw2L9rJwLm0KJ4s+Kdb+Lb8o1iRc+mUoXUcqpJS3PlerYSe+3HjeLKyksH3jlppyKE0CTllUcO1X0DbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ysYjk1If; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XHEM3KqC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ysYjk1If; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XHEM3KqC; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ysYjk1If";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XHEM3KqC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ysYjk1If";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XHEM3KqC"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 88EFB1F445;
	Wed, 16 Apr 2025 06:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744785570; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7HphwoQ3UYl+riquXvw/1AG2UvmNxPhU5HdcbJfi5K0=;
	b=ysYjk1If8DkB3i97C3/qCJEky6KRWqrNL9DgyuyGTZcBqd1fipZ6lq1wgSk76DGeo2xTvb
	UMASCronoEgMqGo80E5yMWoEvVJQAxThAoI2+za7jyJtXk/bou4oEExIDRDxaGIgg9Wc2A
	MtJtUlF7ssStu8xxUy3PTTGXc1tWDj8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744785570;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7HphwoQ3UYl+riquXvw/1AG2UvmNxPhU5HdcbJfi5K0=;
	b=XHEM3KqCwyrgKeDqCE7e07XJZi8z6qDqK4aWj7ZY0BLzW8QrvOubigk0SkZe4iehmts6K6
	2n+Bg0CYfWUDTIBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744785570; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7HphwoQ3UYl+riquXvw/1AG2UvmNxPhU5HdcbJfi5K0=;
	b=ysYjk1If8DkB3i97C3/qCJEky6KRWqrNL9DgyuyGTZcBqd1fipZ6lq1wgSk76DGeo2xTvb
	UMASCronoEgMqGo80E5yMWoEvVJQAxThAoI2+za7jyJtXk/bou4oEExIDRDxaGIgg9Wc2A
	MtJtUlF7ssStu8xxUy3PTTGXc1tWDj8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744785570;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7HphwoQ3UYl+riquXvw/1AG2UvmNxPhU5HdcbJfi5K0=;
	b=XHEM3KqCwyrgKeDqCE7e07XJZi8z6qDqK4aWj7ZY0BLzW8QrvOubigk0SkZe4iehmts6K6
	2n+Bg0CYfWUDTIBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 792B6139A1;
	Wed, 16 Apr 2025 06:39:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gjumHKJQ/2cBPgAAD6G6ig
	(envelope-from <dwagner@suse.de>); Wed, 16 Apr 2025 06:39:30 +0000
Date: Wed, 16 Apr 2025 08:39:21 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Randy Jennings <randyj@purestorage.com>
Cc: Mohamed Khalfella <mkhalfella@purestorage.com>, 
	Daniel Wagner <wagi@kernel.org>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Keith Busch <kbusch@kernel.org>, Hannes Reinecke <hare@suse.de>, 
	John Meneghini <jmeneghi@redhat.com>, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/3] nvme: delay failover by command quiesce timeout
Message-ID: <7d94aa46-8176-4ed6-8937-b6aed3639afc@flourine.local>
References: <20250324-tp4129-v1-0-95a747b4c33b@kernel.org>
 <20250324-tp4129-v1-3-95a747b4c33b@kernel.org>
 <20250410085137.GE1868505-mkhalfella@purestorage.com>
 <6f0d50b2-7a16-4298-8129-c3a0b1426d26@flourine.local>
 <CAPpK+O3QXTEe0BV5M+P644Xs-0rFvxg8w2MR51kwG7_7374Emw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPpK+O3QXTEe0BV5M+P644Xs-0rFvxg8w2MR51kwG7_7374Emw@mail.gmail.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Flag: NO

On Tue, Apr 15, 2025 at 03:56:13PM -0700, Randy Jennings wrote:
> 2*/3*KATO is from when the host has detected a loss of communication
> to when the host knows (given some assumptions) that the target has
> detected a loss of communication.  A command timeout on the host is a
> fine time for the host to decide that it has lost communication with
> the target, but there are other events.  At the time the host has
> detected a loss of communication, it needs to tear down the
> association (which includes stopping KATO & starting disconnect on
> _all_ the connections in the association).  CQT does not start until
> the host knows that the target has detected a loss of communication.
> So, Mohamed's delay is correct.

I was answering the question why I have chosen the values
nvme_schedule_failover and wanted to point out these values are not
related to the timeout detection.

> > > - What about requests that do not go through nvme_failover_req(), like
> > >   passthrough requests, do we not want to hold these requests until it
> > >   is safe for them to be retried?
> >
> > Pasthrough commands should fail immediately. Userland is in charge here,
> > not the kernel. At least this what should happen here.
> This is not correct according to the spec, and, I believe, not a good
> implementation choice.  The driver (in the spec) is instructed _not_
> to return an error for any request until it knows (given some
> assumptions) that the target is no longer processing the request (or
> that processing does not matter; as in the case of a READ).

I was not precise enough: admin commands should fail.

I suggest to keep this topic separated for the time being. It makes
this discussion even more complex.
