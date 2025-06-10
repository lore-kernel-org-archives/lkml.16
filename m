Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88264194080
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749537196; cv=none; b=TktWUK60yYoY/aRI7JlJiUYlnpaBMw3w5MAubxyExR8toKe0fkNbOcjAkQ8RMx7l+reN0kGsRepG92hG4HW6EGkCCl82PYl3DLo6pY16dIGeHxTbGxE1QkYhG5BK4G4KPV7TFm4Lqzp+BreTUW/PRCQD/3AUY+2qd4mkSCQS2PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749537196; c=relaxed/simple;
	bh=D8kso/9NiO4VmUqneCv8Cj6Si65W5ZqJIjzaNC4wOzI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aL+sEWNGD4A1DhRSj8/RoqTpUMCCkTId59o9uwuq7W/a2OejYCj6UQjCf+8M+SNxXJ31KjDmYqzcNKlisepcpc2Fk1w6AHtKSgStT8LnbRId0lu4JVFrSJo4iEurzrmkWbn1olx988sH2yQFFO4eFKRJO8Px+EdZ6k5bKV+6DQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=J4x4x/sl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wVn9mwAx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=J4x4x/sl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wVn9mwAx; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J4x4x/sl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wVn9mwAx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J4x4x/sl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wVn9mwAx"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B8066211B8;
	Tue, 10 Jun 2025 06:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749537191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TxQqG4KhaYRw6yfY61UkGdjq9X8xvLgX9uDEy/sLWeg=;
	b=J4x4x/sli2M9TNZ1VcK4DNUGrjsgPTuLD4SQZEcipGAA9pgX19lUasb/WZ0WrACHCcc+gu
	umBDqYy1hvWsCe96E0qgKWiebo6+GuvfWAQe0guBSI11kxOYGbpgHeSd1cocbVcaQJYmdS
	7g8QCfsp15SOy7uY3351vcHRUsZo00A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749537191;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TxQqG4KhaYRw6yfY61UkGdjq9X8xvLgX9uDEy/sLWeg=;
	b=wVn9mwAx0jqJ+cSBzJDwBsad98GueG1NoFuZOiKNq4rDqMtacGD496JSRs/5TJzFkkgCr9
	Te947Y0n5y/dDNCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749537191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TxQqG4KhaYRw6yfY61UkGdjq9X8xvLgX9uDEy/sLWeg=;
	b=J4x4x/sli2M9TNZ1VcK4DNUGrjsgPTuLD4SQZEcipGAA9pgX19lUasb/WZ0WrACHCcc+gu
	umBDqYy1hvWsCe96E0qgKWiebo6+GuvfWAQe0guBSI11kxOYGbpgHeSd1cocbVcaQJYmdS
	7g8QCfsp15SOy7uY3351vcHRUsZo00A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749537191;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TxQqG4KhaYRw6yfY61UkGdjq9X8xvLgX9uDEy/sLWeg=;
	b=wVn9mwAx0jqJ+cSBzJDwBsad98GueG1NoFuZOiKNq4rDqMtacGD496JSRs/5TJzFkkgCr9
	Te947Y0n5y/dDNCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 86B22139E2;
	Tue, 10 Jun 2025 06:33:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QhGkH6fRR2jAcQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 10 Jun 2025 06:33:11 +0000
Date: Tue, 10 Jun 2025 08:33:11 +0200
Message-ID: <871prs14yg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	nick@karaolidis.com
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Asus GU605C
In-Reply-To: <20250609102125.63196-1-rf@opensource.cirrus.com>
References: <20250609102125.63196-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,cirrus.com:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Mon, 09 Jun 2025 12:21:25 +0200,
Richard Fitzgerald wrote:
> 
> The GU605C has similar audio hardware to the GU605M so apply the
> same quirk.
> 
> Note that in the linked bugzilla there are two separate problems
> with the GU605C. This patch fixes one of the problems, so I haven't
> added a Closes: tag.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Reported-by: Nick Karaolidis <nick@karaolidis.com>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=220152

Applied now.  Thanks.


Takashi
