Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9AD35958
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 18:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749581127; cv=none; b=RdeQ4rr+/UQK+elXvMZYHnOsQeA4FLBDHqzwTZWfOfGeDk/OwXg+3B3t3W2hr1XQMhNoPocdiIljAungABP3wILm3CSLPWYcO5ZRaSVX55Ih8TaJNzuQsyXmFmdMw4+Av1+FRz247QM11uBANmksd85+g6EloN2NWa9ExhFKrls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749581127; c=relaxed/simple;
	bh=+fn9osG/M+26f2D/gzNkIld1kqaGSVgUtuP7Ju7z0ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FXgKZr6kzdjdITmIjbEG/no7VvxepAQrcfl8iJ+n3iOc3E/xIc71Azt8gjSrPxT2mBf7DGXOU+uHrbMfRy836Iu6tSgTp5TS7/U2ndRzzENAlvKh0xXLck6WVzy903oxTQOMlVZqqFNhvbkPMnuw9XpPRE90mxsqojw57D+/4Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gHzkqnn5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JMmAAnF+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gHzkqnn5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JMmAAnF+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gHzkqnn5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JMmAAnF+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gHzkqnn5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JMmAAnF+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5EFD1211A3;
	Tue, 10 Jun 2025 18:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749581123; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sr7TxE0fMIVJqY4goPJsfGRsQqTX+JqGpVwsxM5JubI=;
	b=gHzkqnn5ZtWckU9ajahns7moKGuKJwCcKc2k/fS3XkIC53bYHF1/+hdbMhiuoS+8b0U06w
	8ZBrEWk0jdxauhYNrXSsrZDyfYVwFRYF00k8N45cLlLlKBGHW1aA/ZMzRmV+XpkD1bjPMq
	a3eZyv7SnIx2l/qOiR/ZlzMuUtYuyYo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749581123;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sr7TxE0fMIVJqY4goPJsfGRsQqTX+JqGpVwsxM5JubI=;
	b=JMmAAnF+71wDkIwsn+OciphIa4oNVjF6oRbCCF9C4H9d6ZrhySqWVIgqG3u6IMFG+oBvqj
	qrgYk0r46xLHsFCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749581123; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sr7TxE0fMIVJqY4goPJsfGRsQqTX+JqGpVwsxM5JubI=;
	b=gHzkqnn5ZtWckU9ajahns7moKGuKJwCcKc2k/fS3XkIC53bYHF1/+hdbMhiuoS+8b0U06w
	8ZBrEWk0jdxauhYNrXSsrZDyfYVwFRYF00k8N45cLlLlKBGHW1aA/ZMzRmV+XpkD1bjPMq
	a3eZyv7SnIx2l/qOiR/ZlzMuUtYuyYo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749581123;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sr7TxE0fMIVJqY4goPJsfGRsQqTX+JqGpVwsxM5JubI=;
	b=JMmAAnF+71wDkIwsn+OciphIa4oNVjF6oRbCCF9C4H9d6ZrhySqWVIgqG3u6IMFG+oBvqj
	qrgYk0r46xLHsFCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0D4AF139E2;
	Tue, 10 Jun 2025 18:45:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ckdrAEN9SGgpCwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 10 Jun 2025 18:45:23 +0000
Date: Tue, 10 Jun 2025 20:45:21 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Li Zhijian <lizhijian@fujitsu.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Ying Huang <huang.ying.caritas@gmail.com>
Subject: Re: [PATCH] mm/memory-tier: Fix abstract distance calculation
 overflow
Message-ID: <aEh9QaU2wUkufK18@localhost.localdomain>
References: <20250610062751.2365436-1-lizhijian@fujitsu.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610062751.2365436-1-lizhijian@fujitsu.com>
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kvack.org,linux-foundation.org,vger.kernel.org,gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,localhost.localdomain:mid]
X-Spam-Level: 

On Tue, Jun 10, 2025 at 02:27:51PM +0800, Li Zhijian wrote:
> In mt_perf_to_adistance(), the calculation of abstract distance (adist)
> involves multiplying several int values including MEMTIER_ADISTANCE_DRAM.
> ```
> *adist = MEMTIER_ADISTANCE_DRAM *
> 		(perf->read_latency + perf->write_latency) /
> 		(default_dram_perf.read_latency + default_dram_perf.write_latency) *
> 		(default_dram_perf.read_bandwidth + default_dram_perf.write_bandwidth) /
> 		(perf->read_bandwidth + perf->write_bandwidth);
> ```
> Since these values can be large, the multiplication may exceed the maximum
> value of an int (INT_MAX) and overflow (Our platform did), leading to an
> incorrect adist.
> 
> Change MEMTIER_ADISTANCE_DRAM to be a long constant by writing it with the
> 'L' suffix. This prevents the overflow because the multiplication will then
> be done in the long type which has a larger range.
> 
> Fixes: 3718c02dbd4c ("acpi, hmat: calculate abstract distance with HMAT")
> Cc: Ying Huang <huang.ying.caritas@gmail.com>
> Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>

Reviewed-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs
