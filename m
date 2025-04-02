Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEF920DD4B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 09:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743586383; cv=none; b=N4npoq3jPIfYadVdgtk9Zx48JL/6EPVy/pZAkFBKZrzc5lQEREbRYXeqdINAbLNMHSK8sAMbeuA+UB0SH9RpdBRiJf4ZWEMSsrUq1Ie2zNXTREvcUb7MUxG3mAa10PxAf40lISksAwwMPqiGSXr2AoYKibE7FCp/fz1Uf86kg2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743586383; c=relaxed/simple;
	bh=rmJuTAUT53pPAKT9U/nGuTL0xex9WS9uP65RMVrnccg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VZNzARBNADkd3XvpZ9haa17PdcJebF3VusYXg9yFdDg+qRfCjBm6P2RdPba0zHjqHjg9SSyPLcGjO7BexN6rzZDLCDSjxaknTbAF38RyN030l57OL2Zp7CMP5vdJzSdmEgHu7efAFvDlV7zys7dLJM60GyDvd7mn+LGr2YUqeYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aqEl2BOc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NoAuqlcC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aqEl2BOc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NoAuqlcC; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aqEl2BOc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NoAuqlcC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aqEl2BOc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NoAuqlcC"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7BA8E21166;
	Wed,  2 Apr 2025 09:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743586379; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZubpHG5fc3B2Tl8fN4vFMieoIJbfo3Q6Fgo56Y28uB0=;
	b=aqEl2BOcRncVLmDYO4BIDBYJLt1v3CXoJeR7MzpX6tN36mra9x1dAiuvhxA7Q3G0tNF0x1
	TTlEcovpu3pV1upl2pkWiv3HyrJdlJZvpoSgqt/kXhJVBD+ay76B5x9cN8TagVCqe6knIQ
	NHVadcPWlcSSWolYhJlCvjea3RkRa+Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743586379;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZubpHG5fc3B2Tl8fN4vFMieoIJbfo3Q6Fgo56Y28uB0=;
	b=NoAuqlcC1J5TLQQIrWEqxygwnebnnTekS3RbpdtiYpZEKe/l+vrIHcSOuTLTe8tT4KNLcQ
	qyJd7S3K4RbrHUCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743586379; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZubpHG5fc3B2Tl8fN4vFMieoIJbfo3Q6Fgo56Y28uB0=;
	b=aqEl2BOcRncVLmDYO4BIDBYJLt1v3CXoJeR7MzpX6tN36mra9x1dAiuvhxA7Q3G0tNF0x1
	TTlEcovpu3pV1upl2pkWiv3HyrJdlJZvpoSgqt/kXhJVBD+ay76B5x9cN8TagVCqe6knIQ
	NHVadcPWlcSSWolYhJlCvjea3RkRa+Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743586379;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZubpHG5fc3B2Tl8fN4vFMieoIJbfo3Q6Fgo56Y28uB0=;
	b=NoAuqlcC1J5TLQQIrWEqxygwnebnnTekS3RbpdtiYpZEKe/l+vrIHcSOuTLTe8tT4KNLcQ
	qyJd7S3K4RbrHUCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 11FDC13A4B;
	Wed,  2 Apr 2025 09:32:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Vwi2AUsE7WdGRgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 02 Apr 2025 09:32:59 +0000
Date: Wed, 2 Apr 2025 11:32:57 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Songtang Liu <liusongtang@bytedance.com>
Cc: akpm@linux-foundation.org, ying.huang@linux.alibaba.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	zhengqi.arch@bytedance.com, songmuchun@bytedance.com
Subject: Re: [PATCH] mm: page_alloc: Remove redundant READ_ONCE
Message-ID: <Z-0ESbUhl4HvZMpI@localhost.localdomain>
References: <CAA=HWd1kn01ym8YuVFuAqK2Ggq3itEGkqX8T6eCXs_C7tiv-Jw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA=HWd1kn01ym8YuVFuAqK2Ggq3itEGkqX8T6eCXs_C7tiv-Jw@mail.gmail.com>
X-Spam-Score: -4.29
X-Spamd-Result: default: False [-4.29 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.19)[-0.968];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,bytedance.com:email,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, Apr 02, 2025 at 03:41:16AM -0400, Songtang Liu wrote:
> In the current code, batch is a local variable, and it cannot be
> concurrently modified. It's unnecessary to use READ_ONCE here,
> so remove it.
> 
> Fixes: 51a755c56dc0 ("mm: tune PCP high automatically")
> Signed-off-by: Songtang Liu <liusongtang@bytedance.com>

Reviewed-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs
