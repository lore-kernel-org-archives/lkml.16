Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF08D269CFA
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745844296; cv=none; b=EYCOUHgA/8RJuM2AN+QIm25Svpe32ncqpA02/Q8ILAOO79G67gfegytYAxRnazBLEIg8ZGYuCPJ2auJds+dYMUWx51F7UdgZlZu4h4ZBK/xh4Pd+J56nq94bnMiS/P1ZWSSaBH2HkdbzXQGiqke5tHxANag7Kk6BoKos+R7VjFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745844296; c=relaxed/simple;
	bh=+ZzCd82rRUyZnXENVjxEksDMseHIbSNrxKtFRkJ07lI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PaZIUoWlBAoyl7ilgLSdk/DxmdgapaeVZBRJoCXGqPrM1yrbqu7bCoxWLUxcizidlXaVt55ClsdzQPL484XIEg+G+6+9UnUTPnmrsI8gb0pqGb1cirsq6iIf0AAWpRQ/d9DC8WmOud6kCuP5wYNnGDg9aFoZDSZjGK8PzDT5+iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pe+YRST1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TvPH6gN6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pe+YRST1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TvPH6gN6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pe+YRST1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TvPH6gN6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pe+YRST1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TvPH6gN6"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CB3E02126D;
	Mon, 28 Apr 2025 12:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745844292; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JUOzAxXpKBY4ook23eb1wMZSaBWWaCk1yZbynmV9x3o=;
	b=pe+YRST1OP+34LABw2QHHeQ7zKy8Ya5MQa8F1VIbo0Yk7df4af1pWAa+iCN7rXK5FvC1Jz
	3ouWIFeFyi4r7bIEsqrvhpthaCir6RaijyXTbUOoikB6O4dXzh1al/7Uk9A/ni7e6X3hch
	BdRk/Jusyz5cmGRuPDni8qKfT0syHMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745844292;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JUOzAxXpKBY4ook23eb1wMZSaBWWaCk1yZbynmV9x3o=;
	b=TvPH6gN6ocZjlPq4K+9umzWp/IMG5ctz2c5iQ0W38gIe3xELhCcQ4k/njRW/zmiklER13z
	CqnYeUzsXDk6mXCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745844292; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JUOzAxXpKBY4ook23eb1wMZSaBWWaCk1yZbynmV9x3o=;
	b=pe+YRST1OP+34LABw2QHHeQ7zKy8Ya5MQa8F1VIbo0Yk7df4af1pWAa+iCN7rXK5FvC1Jz
	3ouWIFeFyi4r7bIEsqrvhpthaCir6RaijyXTbUOoikB6O4dXzh1al/7Uk9A/ni7e6X3hch
	BdRk/Jusyz5cmGRuPDni8qKfT0syHMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745844292;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JUOzAxXpKBY4ook23eb1wMZSaBWWaCk1yZbynmV9x3o=;
	b=TvPH6gN6ocZjlPq4K+9umzWp/IMG5ctz2c5iQ0W38gIe3xELhCcQ4k/njRW/zmiklER13z
	CqnYeUzsXDk6mXCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B84BA13A25;
	Mon, 28 Apr 2025 12:44:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WzURLER4D2juVAAAD6G6ig
	(envelope-from <dwagner@suse.de>); Mon, 28 Apr 2025 12:44:52 +0000
Date: Mon, 28 Apr 2025 14:44:48 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Daniel Wagner <wagi@kernel.org>, Keith Busch <kbusch@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	James Smart <james.smart@broadcom.com>, Hannes Reinecke <hare@suse.de>, 
	Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] nvme: only allow entering LIVE from CONNECTING state
Message-ID: <cb46aa83-8033-4d64-a3c7-420172c3f3f5@flourine.local>
References: <20250214-nvme-fc-fixes-v1-0-7a05d557d5cc@kernel.org>
 <20250214-nvme-fc-fixes-v1-1-7a05d557d5cc@kernel.org>
 <0134ea15-8d5f-41f7-9e9a-d7e6d82accaa@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0134ea15-8d5f-41f7-9e9a-d7e6d82accaa@roeck-us.net>
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Sun, Apr 27, 2025 at 08:59:13AM -0700, Guenter Roeck wrote:
> Hi,
> 
> On Fri, Feb 14, 2025 at 09:02:03AM +0100, Daniel Wagner wrote:
> > The fabric transports and also the PCI transport are not entering the
> > LIVE state from NEW or RESETTING. This makes the state machine more
> > restrictive and allows to catch not supported state transitions, e.g.
> > directly switching from RESETTING to LIVE.
> > 
> > Signed-off-by: Daniel Wagner <wagi@kernel.org>
> 
> nvme_handle_aen_notice(), when handling NVME_AER_NOTICE_FW_ACT_STARTING,
> sets the state to RESETTING and and triggers a worker. This worker
> waits for firmware activation to complete and then tries to set the
> state back to LIVE. This step now fails.
> 
> Possibly the handling of NVME_AER_NOTICE_FW_ACT_STARTING needs to be
> improved. However, leaving the NVME in RESETTING state after an
> NVME_AER_NOTICE_FW_ACT_STARTING event is worse.
> 
> I think this patch should be reverted at least for the time being until
> the handling of NVME_AER_NOTICE_FW_ACT_STARTING no longer relies on a
> direct state change from RESETTING to LIVE.

ee59e3820ca9 ("nvme-fc: do not ignore connectivity loss during connecting")
f13409bb3f91 ("nvme-fc: rely on state transitions to handle connectivity loss")

are depending on the fact that is not possible to switch from
NEW/RESETTING directly into LIVE.

I think it would be better to fix the worker instead dropping this patch
and the above fix for the fc transport.

What about:


diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index b502ac07483b..d3c4eacf607f 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -4493,7 +4493,8 @@ static void nvme_fw_act_work(struct work_struct *work)
                msleep(100);
        }

-       if (!nvme_change_ctrl_state(ctrl, NVME_CTRL_LIVE))
+       if (!nvme_change_ctrl_state(ctrl, NVME_CTRL_CONNECTING) ||
+           !nvme_change_ctrl_state(ctrl, NVME_CTRL_LIVE))
                return;

        nvme_unquiesce_io_queues(ctrl);
