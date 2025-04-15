Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F0D201017
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 12:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744720456; cv=none; b=Yvd+OLy64/oCdVX85L3Q3ink7xaRvEumXQkUYV3rQ2vOCJyRuei7saJ/PIuAByMjxiAjna5PWr7A0toNK0A/TS/3iZWvwWclfrghG/LCYIbJ/LWgXW4x4842c23kP+zDE8THXyaMfgvGAC75dTteXuKDDbXM0Hhs0V062UOsHUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744720456; c=relaxed/simple;
	bh=ggnIbNLWvG1z5jMSBO1ziwufHB2LZNe9Z8V0RajgShI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FAIlomJj3P6ZJioOyyXI7indybpi2Dp2suin8DDPCwfDS/g+drzAVOAbpse3p+YTyNQbMHLPecDqB2D2+BnERbRcB/wOuVbJtTWHp0FkSi/ytjqRwe81AR/AIvGD89FO/QhTjg73DZW8omtLjfCs2i0/49/Bp0XNEKKNn+RdHGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JPBs7s9m; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BzjtjqQs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JPBs7s9m; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BzjtjqQs; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JPBs7s9m";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BzjtjqQs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JPBs7s9m";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BzjtjqQs"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 90BAB1F454;
	Tue, 15 Apr 2025 12:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744720452; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1+67X3s0+LtDgnVqweOYLzcbxICYyQTbn4dfq/CvPpQ=;
	b=JPBs7s9mwTexAkKO2LUNyZLvLV1QdJrBs67wF4khREKN7XM6UvA/BDvpfY2QIHz1+rk36F
	EJ+sZZoVXV6hYQ2nBWNlKoGOywFDkPle69CUofEnruD2mn60gaBCre9n/4ZB8Tm2G6PuQB
	hmHTCcTNGETr/JxeyJBBVvutm2Fe4KA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744720452;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1+67X3s0+LtDgnVqweOYLzcbxICYyQTbn4dfq/CvPpQ=;
	b=BzjtjqQsZcu+jHqQ41mwllcXcIISpeVsJPaDPLxTiCELx7lPzj3t9GnGyySExXGN8ymaFn
	8J9thXLcFcfHmCBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JPBs7s9m;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BzjtjqQs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744720452; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1+67X3s0+LtDgnVqweOYLzcbxICYyQTbn4dfq/CvPpQ=;
	b=JPBs7s9mwTexAkKO2LUNyZLvLV1QdJrBs67wF4khREKN7XM6UvA/BDvpfY2QIHz1+rk36F
	EJ+sZZoVXV6hYQ2nBWNlKoGOywFDkPle69CUofEnruD2mn60gaBCre9n/4ZB8Tm2G6PuQB
	hmHTCcTNGETr/JxeyJBBVvutm2Fe4KA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744720452;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1+67X3s0+LtDgnVqweOYLzcbxICYyQTbn4dfq/CvPpQ=;
	b=BzjtjqQsZcu+jHqQ41mwllcXcIISpeVsJPaDPLxTiCELx7lPzj3t9GnGyySExXGN8ymaFn
	8J9thXLcFcfHmCBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7BA97137A5;
	Tue, 15 Apr 2025 12:34:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id N948HURS/mfEFAAAD6G6ig
	(envelope-from <dwagner@suse.de>); Tue, 15 Apr 2025 12:34:12 +0000
Date: Tue, 15 Apr 2025 14:34:08 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Jiewei Ke <jiewei_ke@163.com>
Cc: wagi@kernel.org, hare@suse.de, hch@lst.de, jmeneghi@redhat.com, 
	kbusch@kernel.org, linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, 
	mkhalfella@purestorage.com, randyj@purestorage.com, sagi@grimberg.me
Subject: Re: [PATCH RFC 3/3] nvme: delay failover by command quiesce timeout
Message-ID: <424fe473-8472-42b8-99c7-8b0534771343@flourine.local>
References: <8F2489FD-1663-4A52-A50B-F15046AC2878@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8F2489FD-1663-4A52-A50B-F15046AC2878@163.com>
X-Rspamd-Queue-Id: 90BAB1F454
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[163.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[flourine.local:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

Hi Jiewei,

On Thu, Apr 10, 2025 at 11:44:13PM +0800, Jiewei Ke wrote:
> I just noticed that your patchset addresses a similar issue to the one I ’m
> trying to solve with my recently submitted patchset [1]. Compared to your
> approach, mine differs in a few key aspects:
> 
> 1. Only aborted requests are delayed for retry. In the current implementation,
> nvmf_complete_timed_out_request and nvme_cancel_request set the request status
> to NVME_SC_HOST_ABORTED_CMD. These requests are usually already sent to the
> target, but may have timed out or been canceled before a response is received.
> Since the target may still be processing them, the host needs to delay retrying
> to ensure the target has completed or cleaned up the stale requests. On the
> other hand, requests that are not aborted — such as those that never got
> submitted due to no usable path (e.g., from nvme_ns_head_submit_bio), or those
> that already received an ANA error from the target — do not need
> delayed retry.

If I understand you correctly, you are concerned about delaying all
commands even these which are not transmitted yet. If there are no
garantees on ordering it would be possible to failover these commands
immediately. Sure something which could be improved in my series.

> 2. The host explicitly disconnects and stops KeepAlive before delay scheduling
> retrying requests. This aligns with Section 9.6 "Communication Loss Handling"
> of the NVMe Base Specification 2.1. Once the host disconnects, the target may
> take up to the KATO interval to detect the lost connection and begin cleaning
> up any remaining requests. Retrying too early may still lead to data
> corruption issues.

The host error handler is executed thus all communication is stopped.
This part hasn't changed. Not sure what you are referring too. The only
thing which changes in this series is when we enqueue the failed
commands again.

> @@ -2178,6 +2180,7 @@ static void nvme_rdma_shutdown_ctrl(struct nvme_rdma_ctrl *ctrl, bool shutdown)
>  	nvme_quiesce_admin_queue(&ctrl->ctrl);
>  	nvme_disable_ctrl(&ctrl->ctrl, shutdown);
>  	nvme_rdma_teardown_admin_queue(ctrl, shutdown);
> +	nvme_delay_kick_retry_lists(&ctrl->ctrl); <<< delay kick retry
>  	after teardown all queues

Without the kick it hangs. The admin has explicitly removed the ctrl.

As I already said, this is a RFC for the sake to figure out if this
approach is a good idea. We all agreed, we should first try to sort this
out before introducing a new queue. There are many problems which it
will introduce, like the one from above 'why delaying not send
requests?', 'What happens when we have several short
disconnects/connects?', ...

BTW, there is already a hack in disconnect/connect state transition.
Ideally we solve this in a more generic manner.

Thanks,
Daniel
