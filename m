Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A2528C2C7
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750152371; cv=none; b=JOPvys83MbT3IpyNKdXN43C6La0Ndv7JFlD10kkGibtpuQ9fxYj6BLGRDNpErXYRo1zF5nQaoQZtEiXqvUMKOCf/WxwZVh2bUoq0AfkIi677cyBvaQz0t1082mBBuwCx0Un275GLu+zbIlXLbxKtw9IPCgUr/z/LuRLbSnauh+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750152371; c=relaxed/simple;
	bh=mHloKpHeIqjd28yabftvO0kzJW8++POCYyqtmXjfZwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8/ZpQaK75Mw3Px1DbigjPL1Wr6kWnaZhkQk+yC2zoaKWNERCiZmSwZNmL5YUHRPbQxrGDpJqJRAz0KkJh8tCiJhED610FVR6f04+Svd1rbVa2z4uwEiFapNdfbisZxrzAbwmtiQ1Qe4bUV+TS+rlDl97kSlSofMl0letzxxxa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=b//26688; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gPcu95GC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=b//26688; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gPcu95GC; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b//26688";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gPcu95GC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b//26688";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gPcu95GC"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CB21821170;
	Tue, 17 Jun 2025 09:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750152367; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LuvnCETedbBU+Lf4XYDf0unBd6y0p8DZmC16erlmjdY=;
	b=b//266883fGKUrK4O0jRR6q+dCtJ9iwfHBl9E3N96qrpnr8P9x3ijt236xyi90P/i2GzCf
	FuuU9EBtt27f7NdchP60hkA1l4Jncn8DJ3b2Q+SCwG6vrqHJaF5QYxQWTdeYXtY8RDgg1b
	pzYr9wMYg/P+hd3Xxd3OhjekXSy7HD0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750152367;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LuvnCETedbBU+Lf4XYDf0unBd6y0p8DZmC16erlmjdY=;
	b=gPcu95GCD365nvDwPgEMzE/ebHqpuGPBHGybDqQQEZtJ1ekdnlQqn3uAfhVKnTF5F1H41X
	FroK/8B6sNDpfsBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="b//26688";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gPcu95GC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750152367; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LuvnCETedbBU+Lf4XYDf0unBd6y0p8DZmC16erlmjdY=;
	b=b//266883fGKUrK4O0jRR6q+dCtJ9iwfHBl9E3N96qrpnr8P9x3ijt236xyi90P/i2GzCf
	FuuU9EBtt27f7NdchP60hkA1l4Jncn8DJ3b2Q+SCwG6vrqHJaF5QYxQWTdeYXtY8RDgg1b
	pzYr9wMYg/P+hd3Xxd3OhjekXSy7HD0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750152367;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LuvnCETedbBU+Lf4XYDf0unBd6y0p8DZmC16erlmjdY=;
	b=gPcu95GCD365nvDwPgEMzE/ebHqpuGPBHGybDqQQEZtJ1ekdnlQqn3uAfhVKnTF5F1H41X
	FroK/8B6sNDpfsBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 41739139E2;
	Tue, 17 Jun 2025 09:26:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cFAcDa80UWi+CgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 17 Jun 2025 09:26:07 +0000
Date: Tue, 17 Jun 2025 11:26:05 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 00/11] Implement numa node notifier
Message-ID: <aFE0rTNnw_X0pT5D@localhost.localdomain>
References: <20250616135158.450136-1-osalvador@suse.de>
 <fe0e9434-0c6d-4a24-b209-d40c7b9e9352@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe0e9434-0c6d-4a24-b209-d40c7b9e9352@redhat.com>
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: CB21821170
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-foundation.org,suse.cz,huawei.com,oracle.com,sk.com,gmail.com,kvack.org,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim]
X-Spam-Score: -3.01
X-Spam-Level: 

On Mon, Jun 16, 2025 at 04:32:32PM +0200, David Hildenbrand wrote:
> All looking good to me (and much easier to digest now that it's properly
> split up into patches!) :)

Great! Thank you all for all the feedback ;-P!

 

-- 
Oscar Salvador
SUSE Labs
