Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8629231A30
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751460428; cv=none; b=MS71PMcamoNZqPltp9FLf+a7n123VV21RrtCT71MH2YZQhxKCDbKJ5au822hJ6FWqwxZTM7+qQNtuAKGsssP+Fx5MwNqqECs+d6tkBsmymcO0trntRLZ/YQBICFcVSNWl9CifZwAR4HKpexkSfkW9+Gsl0Mj0RBLFGao4pZToOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751460428; c=relaxed/simple;
	bh=l+p3bDcBSkJgkgPACPqFtqpENjc+EXoFlJLoQWKKtFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R5Q5hqqS1RkyZhOZlRE5Qt8ullqZprBMm9qPZhFge3pkWY0j/PFeT71RjOwV9jESAY4Z5H73LcLOzlQZWV+W/+vcJ5LmsYUy3dC2FofbwEkOdBW9K6VscWybHtZn2VSmAlsM7q5bY7h9iyXdBQx/G/ZiAZ0q8fFbVdX57rJ9ikY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c8j+VtJ9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ESnPDywp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QX0CWQCj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ALNdxtcR; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c8j+VtJ9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ESnPDywp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QX0CWQCj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ALNdxtcR"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BA20E21171;
	Wed,  2 Jul 2025 12:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751460425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k1wIY7FTlKQzM4gTXb/EEfgvLm5LmwpW3ETkIJgLZjQ=;
	b=c8j+VtJ9YX236iDh5ujSFWehUKt/yDO2+nPYL7d+SfjtapNmhey0WhzSQk+HX7+4RIEe6Y
	WVVTtPvuo8F4Sxx7OXgT/Qers4GQW81Ju+9qYdbdDwPyv51gUBPo18kJ1rdYJVxiHUdBLZ
	60HVoOy9BACxYQyseeQhwgylSbJu7HM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751460425;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k1wIY7FTlKQzM4gTXb/EEfgvLm5LmwpW3ETkIJgLZjQ=;
	b=ESnPDywpn3TljQ5v0UNHyV5ab7aLXcfCktN7xZ/b1FjfjHxRrj94A51KQnhuPHR1yBZTko
	LZ28qujdQV6L8KDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751460423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k1wIY7FTlKQzM4gTXb/EEfgvLm5LmwpW3ETkIJgLZjQ=;
	b=QX0CWQCjM7tKWQTzKmW15h6JTE3U9IHQ55Tsa+1UdJRsyLHXV+hvjOyFwpT3U8/0vbOvyk
	rA+P0Wo5GJ6nGtQ81r1csD/pxqcC6GziFpx6FM9kRJtGn3vJiH02H4cHQUeJcSt1o/opuA
	qRIp2u0gBaTTc5rhJrKdoaL/KzephRo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751460423;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k1wIY7FTlKQzM4gTXb/EEfgvLm5LmwpW3ETkIJgLZjQ=;
	b=ALNdxtcRXQpzvotQ/cV98jn5/j/K7zdIvU0Pe1xxilGoAUlGVPUdgYOe5CNqykhHnBfu8e
	3Nqj1bL9wYIMT7AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DA08C1369C;
	Wed,  2 Jul 2025 12:47:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MABhMkYqZWjKIQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 02 Jul 2025 12:47:02 +0000
Date: Wed, 2 Jul 2025 14:46:57 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Donet Tom <donettom@linux.ibm.com>
Cc: David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ritesh Harjani <ritesh.list@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	Dave Jiang <dave.jiang@intel.com>,
	KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
Subject: Re: [PATCH] drivers/base/node: Handle error properly in
 register_one_node()
Message-ID: <aGUqQbybFXd6uJu-@localhost.localdomain>
References: <20250702112856.295176-1-donettom@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702112856.295176-1-donettom@linux.ibm.com>
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,linux-foundation.org,nvidia.com,linuxfoundation.org,gmail.com,kvack.org,vger.kernel.org,kernel.org,huawei.com,intel.com,jp.fujitsu.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost.localdomain:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80

On Wed, Jul 02, 2025 at 06:28:56AM -0500, Donet Tom wrote:
> If register_node() returns an error, it is not handled correctly.
> The function will proceed further and try to register CPUs under the
> node, which is not correct.
> 
> So, in this patch, if register_node() returns an error, we return
> immediately from the function.
> 
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> ---
> 
... 
> diff --git a/drivers/base/node.c b/drivers/base/node.c
> index bef84f01712f..aec991b4c0b2 100644
> --- a/drivers/base/node.c
> +++ b/drivers/base/node.c
> @@ -885,6 +885,8 @@ int register_one_node(int nid)
>  	node_devices[nid] = node;
>  
>  	error = register_node(node_devices[nid], nid);
> +	if (error)
> +		return error;

Ok, all current callers (based on mm-unstable) panic or BUG() if this fails,
but powerpc, in init_phb_dynamic(), which keeps on going.
Unless it panics somewhere down the road as well.

So I think we need to: 

 node_devices[nid] = NULL
 kfree(node)

 ?

Also, once Hannes fix lands, we might need that as well.

Anyway, I'd suggest you hold on until Hannes fix lands, so we can later
rebase all your mem-hotplug on top of that [1].

[1] https://lore.kernel.org/linux-mm/86f89a65-f0f6-4462-9eea-ac691de2f3b6@suse.de/T/#mbf392eb390b8053f96be50da3b40dfd9b62dd389


-- 
Oscar Salvador
SUSE Labs
