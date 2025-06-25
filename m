Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6821AF0BB
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 17:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750873944; cv=none; b=XCukiBmJldzbLMQh43eNe1wc89A/dTjfZE03ZbcmXnWbtXPzt5rB3n6watj2cmlrqcT3lYYcd07ixqyHtScTL4pCYd3IF6oe6AIlGseAiwrUCVQyx9hpiU+5pdXrft5Atf5X3TCNg764YI4hSvUime93z3aoVfsWRYplQ+lPRoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750873944; c=relaxed/simple;
	bh=6eVnPygdGvcbyBklcxFdynuh820nikOauMfnNutbGV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tQVdCqIkxcQMWiaActP+IRDG9rwliDbQJA92upHQGc4rf4bUG4zcpMW3ZUFVDNSHIcWjzdwdhwv+esyxYgxTQ3ets6HWPQXX8VO09AxGWmdWaPyoIGM2F2++XU7Cbl5OMDNCSy91YTeDn+M1YB5PUb+4Q+uZFHxCyjeKHv35iBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hfl5uXtV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GEec/7xo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hfl5uXtV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GEec/7xo; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hfl5uXtV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GEec/7xo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hfl5uXtV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GEec/7xo"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9EE3F2116C;
	Wed, 25 Jun 2025 17:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750873939; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x/hssygHw+m37RmPXPWJbRXpFWFXQ2itxK9rSA/a6JA=;
	b=hfl5uXtVMJzn7ovOErbWUON+Hmntvg/ajAIFBchjl8ReCEflhjFcDbD4V1NRkwLI1SB3UH
	zKetR3sw7N0/8y2ICGQ1pI1xYw9WFl03u6EmRC0PuoMZu8SY41YNYib1q+gEuTXGk9lsPu
	f1YkL6YVE2YSl/WOUYoexJyq+ifdRvQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750873939;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x/hssygHw+m37RmPXPWJbRXpFWFXQ2itxK9rSA/a6JA=;
	b=GEec/7xopnmhhPUqeK7gzwE5fRSXtecBMpSycdNr4kqhBc5jUIg1jJtJCesJFz6RFetCZn
	LRnvdgR9GPPwNyAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750873939; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x/hssygHw+m37RmPXPWJbRXpFWFXQ2itxK9rSA/a6JA=;
	b=hfl5uXtVMJzn7ovOErbWUON+Hmntvg/ajAIFBchjl8ReCEflhjFcDbD4V1NRkwLI1SB3UH
	zKetR3sw7N0/8y2ICGQ1pI1xYw9WFl03u6EmRC0PuoMZu8SY41YNYib1q+gEuTXGk9lsPu
	f1YkL6YVE2YSl/WOUYoexJyq+ifdRvQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750873939;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x/hssygHw+m37RmPXPWJbRXpFWFXQ2itxK9rSA/a6JA=;
	b=GEec/7xopnmhhPUqeK7gzwE5fRSXtecBMpSycdNr4kqhBc5jUIg1jJtJCesJFz6RFetCZn
	LRnvdgR9GPPwNyAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 210CB13301;
	Wed, 25 Jun 2025 17:52:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id L+WPBVM3XGhMUQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 25 Jun 2025 17:52:19 +0000
Date: Wed, 25 Jun 2025 19:52:17 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Harry Yoo <harry.yoo@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2 next] mm,memory_hotplug: set failure reason in
 offline_pages()
Message-ID: <aFw3UQpDoYKavFBg@localhost.localdomain>
References: <be4fd31b-7d09-46b0-8329-6d0464ffa7a5@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be4fd31b-7d09-46b0-8329-6d0464ffa7a5@sabinyo.mountain>
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,suse.de:email]
X-Spam-Level: 

On Wed, Jun 25, 2025 at 10:32:04AM -0500, Dan Carpenter wrote:
> The "reason" variable is uninitialized on this error path.  It's supposed
> to explain why the function failed.
> 
> Fixes: e4e2806b639c ("mm,memory_hotplug: implement numa node notifier")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks Dan!

Acked-by: Oscar Salvador <osalvador@suse.de>

Although.. we might be in time to squash it, right?

 

-- 
Oscar Salvador
SUSE Labs
