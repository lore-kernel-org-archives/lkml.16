Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0133248881
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746553370; cv=none; b=uwAV7w/j35ozTfYuLk7Vv8DWtsgNQ1c3i/QQTjooXDJfKmexcR9l8Lyja0TZwL2krNPylcJgjOlqBSMRmAykf4lqg/f4/wrM9Z+MBK+F4LBSpsNdOcJTmvrEq/GCFDtXu2BVjYg/Aw1V6+X9s4W4PDeOcACHB3498++3Zjf0xQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746553370; c=relaxed/simple;
	bh=x42flrj+dijeYhVuFWP1vdUfhPscp6CiZ38EXW7PYDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hl0gS3kdQjp216QWagOPKClFbdqb62+gQnVOr1hEyjtb33c00F/Kj3Xs3UUhvysT89wSaThgAGlhLzY4zXuYNzRnRWITK4TfeGm6vNHZ7d6doOa2bpBgM4kQOSeatS1ZikxobxzNBE/mKIa6jHPN/nfDDiZz9EG4lT/3rr7AP3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O/b0SHEF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4L7lLh8C; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QxJYwosG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YuguyMLI; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O/b0SHEF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4L7lLh8C";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QxJYwosG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YuguyMLI"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EDF2F1F38D;
	Tue,  6 May 2025 17:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746553367; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SQqVSoZZjQ072CuOxG4Mh6ggdo11NHBNTXMYW2HsWnM=;
	b=O/b0SHEFzL9ceURxcgaaTn5lSDtQPOhwQ0lM++7fT9n8cxZuTWN7sUJ55RDXCGmNpLtYh3
	MgShcMZlT5B79ffHg3JFEy+3IkPjRT7A3YejCW5iCcI/TykV5Lc5Oc+lsD2d6/N4yP1VWI
	qA8owOZmTewx8KaHKd6ComWo7Kz1BRc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746553367;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SQqVSoZZjQ072CuOxG4Mh6ggdo11NHBNTXMYW2HsWnM=;
	b=4L7lLh8CQRNAl1IssumZsv3FyRPjgFL8M76JrQg1FCZYtMwjPeeL569jqphlQedSzC1XSF
	D8z6/uzCai1gxMCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746553366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SQqVSoZZjQ072CuOxG4Mh6ggdo11NHBNTXMYW2HsWnM=;
	b=QxJYwosGBWXlnS0EDm4WJHd4l3jg1WTsjjp9/FYEPDZ9RBE/7WaRQ4xJFCPWo2CjFwwMd8
	w4kiOQNDkK3UkI3ngc8MQHoXBiuCWiabQjA+mj6CQpTCpYyUFKzOk20v7ozmuC+22H8b43
	52tnQk/EmoMVin3EhzmoJwIo5GDZGEM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746553366;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SQqVSoZZjQ072CuOxG4Mh6ggdo11NHBNTXMYW2HsWnM=;
	b=YuguyMLIlXmawd+w6app4YOkm2KgIVeFA6rp/RhA9KZCP/1twuP7tVb/Bt2dP4Jsj3Iv+s
	ygCeMYRUZN74kDAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 948C0137CF;
	Tue,  6 May 2025 17:42:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MjZOIRZKGmhPBwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 06 May 2025 17:42:46 +0000
Date: Tue, 6 May 2025 19:42:44 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm,mm_init: Mark set_high_memory as _init
Message-ID: <aBpKFEQeVezYLsAH@localhost.localdomain>
References: <20250506111012.108743-1-osalvador@suse.de>
 <aBnuzKw-zYDPwLE3@localhost.localdomain>
 <aBpB-dtL1hvd0TDi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBpB-dtL1hvd0TDi@kernel.org>
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.990];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Tue, May 06, 2025 at 08:08:09PM +0300, Mike Rapoport wrote:
> I'll pick this one and add the tags, thanks Oscar.

thank you Mike, appreciated ;-)!
 

-- 
Oscar Salvador
SUSE Labs
