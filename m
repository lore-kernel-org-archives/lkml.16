Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3216A224FA
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750270775; cv=none; b=X3zb8d3672LKO4lGbkNzJb/hFK5djIpiifPi0wMpaL9lLuA4cDuAMLv1Ut6O+zc48XLxuQUlYd3stoP8eNKZ6rf0SedDGQExwwiOxJajkJZ4dktOHRBQxvxqX4Quf12p67WEwdC86ZkFfZvpOAFvEdAko4EIe5hPVViwL9vDN0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750270775; c=relaxed/simple;
	bh=MlZoJdg+22hzILIY5pkXr+G/amOejs9cl3kSiFMmC3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qhrhL2EGU5MC8BfbO7SpAeEsifg1RXBA/aLWMRVLUSzRIrdq5sRSvOQ5zhfQx5Exz641kBkBPLSlTZlHJu+cUA3Md89z4T9seFcqeOF13RvFdXAO9WRZ3CHLldWDzb8y5PXPkZT84nbXk3X+A0QjDnAWxio6q5QL6mfmQZRSqdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sBCB2ETU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bUpHZ2GX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sBCB2ETU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bUpHZ2GX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sBCB2ETU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bUpHZ2GX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sBCB2ETU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bUpHZ2GX"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 13C361F7BD;
	Wed, 18 Jun 2025 18:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750270771; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2qoAqe6Tz+Ixn12xTbWlPEovX8xRcRkaG3QnFbPGW38=;
	b=sBCB2ETUtaw34+DuQPPHpSrGBsVJpQUu8owr5sMTKIIGGUOXXrNOlkDWI/hq72SkdUQfRA
	8NsnjfxmFkPYgfFtvaGN2v8LAXksKV71M7w7Ch8mRU2ytNyrpI/wPBUxWhrsyanD4rV1MO
	08bsGxJYBAiQNTIh1YLM9sZpJsS0AUM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750270771;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2qoAqe6Tz+Ixn12xTbWlPEovX8xRcRkaG3QnFbPGW38=;
	b=bUpHZ2GXCUtxX5l5Yyz+YWiwGQxe4ldWuSVUM3CLZdoiRquylArkeXwho32B2YoCZCXeuG
	AaE3RSbrgMiEHkCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sBCB2ETU;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bUpHZ2GX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750270771; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2qoAqe6Tz+Ixn12xTbWlPEovX8xRcRkaG3QnFbPGW38=;
	b=sBCB2ETUtaw34+DuQPPHpSrGBsVJpQUu8owr5sMTKIIGGUOXXrNOlkDWI/hq72SkdUQfRA
	8NsnjfxmFkPYgfFtvaGN2v8LAXksKV71M7w7Ch8mRU2ytNyrpI/wPBUxWhrsyanD4rV1MO
	08bsGxJYBAiQNTIh1YLM9sZpJsS0AUM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750270771;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2qoAqe6Tz+Ixn12xTbWlPEovX8xRcRkaG3QnFbPGW38=;
	b=bUpHZ2GXCUtxX5l5Yyz+YWiwGQxe4ldWuSVUM3CLZdoiRquylArkeXwho32B2YoCZCXeuG
	AaE3RSbrgMiEHkCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4758113A3F;
	Wed, 18 Jun 2025 18:19:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xXVlDjIDU2gyRwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Wed, 18 Jun 2025 18:19:30 +0000
Date: Wed, 18 Jun 2025 19:19:28 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [RFC 1/2] lib/vsprintf: Add support for pte_t
Message-ID: <zsfblk4nfi6nigfnv7umruhewmg7fqhhtz6fiigezzk2wtn2n7@agpzorfpaywq>
References: <20250618041235.1716143-1-anshuman.khandual@arm.com>
 <20250618041235.1716143-2-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618041235.1716143-2-anshuman.khandual@arm.com>
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 13C361F7BD
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lwn.net:email,linux-foundation.org:email,goodmis.org:email,arm.com:email,suse.de:dkim,kvack.org:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.01
X-Spam-Level: 

On Wed, Jun 18, 2025 at 09:42:34AM +0530, Anshuman Khandual wrote:
> Add a new format for printing page table entries.
> 
> Cc: Petr Mladek <pmladek@suse.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mm@kvack.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  Documentation/core-api/printk-formats.rst | 14 ++++++++++++++
>  lib/vsprintf.c                            | 20 ++++++++++++++++++++
>  mm/memory.c                               |  5 ++---
>  scripts/checkpatch.pl                     |  2 +-
>  4 files changed, 37 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> index 4b7f3646ec6ce..75a110b059ee1 100644
> --- a/Documentation/core-api/printk-formats.rst
> +++ b/Documentation/core-api/printk-formats.rst
> @@ -689,6 +689,20 @@ Rust
>  Only intended to be used from Rust code to format ``core::fmt::Arguments``.
>  Do *not* use it from C.
>  
> +Page Table Entry
> +----------------
> +
> +::
> +        %ppte
> +
> +Print standard page table entry pte_t.
> +
> +Passed by reference.
> +
> +Examples for a 64 bit page table entry, given &(u64)0xc0ffee::
> +
> +        %ppte   0x00c0ffee

Ok, so what's the point of this if you're just printing the number?

Could at least do something like:

%ppte 0xc0ff000|WRITE|DIRTY|PRESENT

no? Otherwise it's a not super useful wrapper around printing pte_val(*pte).

> +
>  Thanks
>  ======
>  
> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index 3d85800757aa5..005490202ffb5 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -2433,6 +2433,9 @@ early_param("no_hash_pointers", no_hash_pointers_enable);
>   *		Without an option prints the full name of the node
>   *		f full name
>   *		P node name, including a possible unit address
> + * - 'pte'	For a 64 bit page table entry, this prints its contents in
> + *              a hexa decimal format
> + *
>   * - 'x' For printing the address unmodified. Equivalent to "%lx".
>   *       Please read the documentation (path below) before using!
>   * - '[ku]s' For a BPF/tracing related format specifier, e.g. used out of
> @@ -2542,6 +2545,23 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
>  		default:
>  			return error_string(buf, end, "(einval)", spec);
>  		}
> +	case 'p':
> +		if (fmt[1] == 't' && fmt[2] == 'e') {
> +			pte_t *pte = (pte_t *)ptr;
> +
> +			spec.field_width = 10;
> +			spec.precision = 8;
> +			spec.base = 16;
> +			spec.flags = SPECIAL | SMALL | ZEROPAD;
> +			if (sizeof(pte_t) == sizeof(u64)) {
> +				u64 val = pte_val(*pte);
> +
> +				return number(buf, end, val, spec);
> +			}

As mentioned elsewhere in the thread, this obviously doesn't work for everything
32-bit, and 64-bit PAE, and all of the weird page table formats we have around.

-- 
Pedro
