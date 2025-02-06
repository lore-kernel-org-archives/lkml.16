Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CE71624C3
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 14:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738850934; cv=none; b=GsPzTMNUwDY0rKZQBk1wrUSKdZtsO8a6fBJDKFkoWFTblKn3umwL6jDFjpVl5mzy+I4yBcmKY+C8MQOR1X2LzlVwV/OyqX1HhcR65t9fqPsDuRxIWYPtKfbzOgt8fwuX80o9i1NtQGOpkRakSuyEMB1NoCqX2y6epcwf5nXlQqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738850934; c=relaxed/simple;
	bh=aHNbAngmGQOqAwhFCL3smGIHNd5u9NdSNgdqUJ7aJjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FXOHGz+rmeYLTEXbdsyII4MTn0FSTvB007TB797Rs5v7QdghkggG2ph8QyT8PxkkYDvWi0iMSZ3wuk769bFRcL1ibY/4ZKei/1e2e+WMPeaW6S/MIhxsTuXeqNiFgIsJXu5MBgUVOEDSg82Guz8Zz62MnUe8RcfTBOuAJyFdfOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=kyOPRP+2; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=DANjsawI; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=kyOPRP+2; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=DANjsawI; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="kyOPRP+2";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="DANjsawI";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="kyOPRP+2";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="DANjsawI"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 162681F397;
	Thu,  6 Feb 2025 14:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1738850929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6ADZUzcMjiw5AfwdGmzqDzb2Pr5H/f/BRZpAyBdSIdc=;
	b=kyOPRP+21nkiwq+c+5bU0TwEqPqskxWvmR6eXe4dgvcxaHs2Tv4haJn2XWs74rZo1/AGNp
	OPxKdd12azpzRZrty0D42plNqnTYHODKI+3SrSMefmR1RYGqYUB1Su90rWKDQxB3NoN+pz
	FLLUsoOQUCODD1Sqhdhuwjw8hDfupqY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1738850929;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6ADZUzcMjiw5AfwdGmzqDzb2Pr5H/f/BRZpAyBdSIdc=;
	b=DANjsawIeAc74jASCjMuJqE7ak7sadIYcq0GmTLBhPRhQrzTvc426D4zPkSLHfio4UVkN+
	uj1gfnfGj3ag6dBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=kyOPRP+2;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=DANjsawI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1738850929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6ADZUzcMjiw5AfwdGmzqDzb2Pr5H/f/BRZpAyBdSIdc=;
	b=kyOPRP+21nkiwq+c+5bU0TwEqPqskxWvmR6eXe4dgvcxaHs2Tv4haJn2XWs74rZo1/AGNp
	OPxKdd12azpzRZrty0D42plNqnTYHODKI+3SrSMefmR1RYGqYUB1Su90rWKDQxB3NoN+pz
	FLLUsoOQUCODD1Sqhdhuwjw8hDfupqY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1738850929;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6ADZUzcMjiw5AfwdGmzqDzb2Pr5H/f/BRZpAyBdSIdc=;
	b=DANjsawIeAc74jASCjMuJqE7ak7sadIYcq0GmTLBhPRhQrzTvc426D4zPkSLHfio4UVkN+
	uj1gfnfGj3ag6dBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ED78B13697;
	Thu,  6 Feb 2025 14:08:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XLOjOXDCpGeCHwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Thu, 06 Feb 2025 14:08:48 +0000
Message-ID: <0d4360b1-0010-45b4-a6d9-94941be89107@suse.cz>
Date: Thu, 6 Feb 2025 15:08:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm: slub: Print the broken data before restoring slub.
Content-Language: en-US
To: Hyesoo Yu <hyesoo.yu@samsung.com>
Cc: janghyuck.kim@samsung.com, chengming.zhou@linux.dev,
 Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>,
 David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <CGME20250205004552epcas2p43c15afa1e9c3e290693bc4921d46b6f5@epcas2p4.samsung.com>
 <20250205004424.1214826-1-hyesoo.yu@samsung.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 EP+ylKVEKb0Q2A==
In-Reply-To: <20250205004424.1214826-1-hyesoo.yu@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 162681F397
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.cz:mid,suse.cz:dkim,samsung.com:email];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[samsung.com,linux.dev,linux.com,kernel.org,google.com,lge.com,linux-foundation.org,gmail.com,kvack.org,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On 2/5/25 01:44, Hyesoo Yu wrote:
> Previously, the restore occured after printing the object in slub.
> After commit 47d911b02cbe ("slab: make check_object() more consistent"),
> the bytes are printed after the restore. This information about the bytes
> before the restore is highly valuable for debugging purpose.
> For instance, in a event of cache issue, it displays byte patterns
> by breaking them down into 64-bytes units. Without this information,
> we can only speculate on how it was broken. Hence the corrupted regions
> should be printed prior to the restoration process. However if an object breaks
> in multiple places, the same log may be output multiple times.
> Therefore the slub log is reported only once to prevent redundant printing,
> by sending a parameter indicating whether an error has occurred previously.
> 
> Changes in v2:
> - Instead of using print_section every time on check_bytes_and_report,
> just print it once for the entire slub object before the restore.
> 
> Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> ---
>  mm/slub.c | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index ea956cb4b8be..7a9f7a2c17d7 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -1182,7 +1182,7 @@ static void restore_bytes(struct kmem_cache *s, char *message, u8 data,
>  static pad_check_attributes int
>  check_bytes_and_report(struct kmem_cache *s, struct slab *slab,
>  		       u8 *object, char *what,
> -		       u8 *start, unsigned int value, unsigned int bytes)
> +		       u8 *start, unsigned int value, unsigned int bytes, int slab_obj_print)

It would be better to redistribute the arguments among lines to fit each <80
chars. The previous line is underutilized. Also could the new argument be bool?

>  {
>  	u8 *fault;
>  	u8 *end;
> @@ -1205,6 +1205,10 @@ check_bytes_and_report(struct kmem_cache *s, struct slab *slab,
>  	pr_err("0x%p-0x%p @offset=%tu. First byte 0x%x instead of 0x%x\n",
>  					fault, end - 1, fault - addr,
>  					fault[0], value);

Hm we have slab_bug() above this, not slab_err(). So this is another place
that would need to take care a WARN is called with your other patch.

> +	if (slab_obj_print) {
> +		print_trailer(s, slab, object);
> +		add_taint(TAINT_BAD_PAGE, LOCKDEP_NOW_UNRELIABLE);

I guess we could do the WARN here. If panic_on_warn is enabled it will not
report all problems that check_object() could find and panic on the first
one. But that would have happened too with your slab_fix() approach
(slab_fix() called from restore_bytes() below). I think we can live with
that instead of needing two separate reporting and fixing rounds from
check_object().

Could you send the two patches as a series in v3, as they are
inter-dependent? Thanks.

> +	}
>  
>  skip_bug_print:
>  	restore_bytes(s, what, value, fault, end);
> @@ -1268,7 +1272,7 @@ static int check_pad_bytes(struct kmem_cache *s, struct slab *slab, u8 *p)
>  		return 1;
>  
>  	return check_bytes_and_report(s, slab, p, "Object padding",
> -			p + off, POISON_INUSE, size_from_object(s) - off);
> +			p + off, POISON_INUSE, size_from_object(s) - off, 1);
>  }
>  
>  /* Check the pad bytes at the end of a slab page */
> @@ -1318,11 +1322,11 @@ static int check_object(struct kmem_cache *s, struct slab *slab,
>  
>  	if (s->flags & SLAB_RED_ZONE) {
>  		if (!check_bytes_and_report(s, slab, object, "Left Redzone",
> -			object - s->red_left_pad, val, s->red_left_pad))
> +			object - s->red_left_pad, val, s->red_left_pad, ret))
>  			ret = 0;
>  
>  		if (!check_bytes_and_report(s, slab, object, "Right Redzone",
> -			endobject, val, s->inuse - s->object_size))
> +			endobject, val, s->inuse - s->object_size, ret))
>  			ret = 0;
>  
>  		if (slub_debug_orig_size(s) && val == SLUB_RED_ACTIVE) {
> @@ -1331,7 +1335,7 @@ static int check_object(struct kmem_cache *s, struct slab *slab,
>  			if (s->object_size > orig_size  &&
>  				!check_bytes_and_report(s, slab, object,
>  					"kmalloc Redzone", p + orig_size,
> -					val, s->object_size - orig_size)) {
> +					val, s->object_size - orig_size, ret)) {
>  				ret = 0;
>  			}
>  		}
> @@ -1339,7 +1343,7 @@ static int check_object(struct kmem_cache *s, struct slab *slab,
>  		if ((s->flags & SLAB_POISON) && s->object_size < s->inuse) {
>  			if (!check_bytes_and_report(s, slab, p, "Alignment padding",
>  				endobject, POISON_INUSE,
> -				s->inuse - s->object_size))
> +				s->inuse - s->object_size, ret))
>  				ret = 0;
>  		}
>  	}
> @@ -1355,11 +1359,11 @@ static int check_object(struct kmem_cache *s, struct slab *slab,
>  			if (kasan_meta_size < s->object_size - 1 &&
>  			    !check_bytes_and_report(s, slab, p, "Poison",
>  					p + kasan_meta_size, POISON_FREE,
> -					s->object_size - kasan_meta_size - 1))
> +					s->object_size - kasan_meta_size - 1, ret))
>  				ret = 0;
>  			if (kasan_meta_size < s->object_size &&
>  			    !check_bytes_and_report(s, slab, p, "End Poison",
> -					p + s->object_size - 1, POISON_END, 1))
> +					p + s->object_size - 1, POISON_END, 1, ret))
>  				ret = 0;
>  		}
>  		/*
> @@ -1385,11 +1389,6 @@ static int check_object(struct kmem_cache *s, struct slab *slab,
>  		ret = 0;
>  	}
>  
> -	if (!ret && !slab_in_kunit_test()) {
> -		print_trailer(s, slab, object);
> -		add_taint(TAINT_BAD_PAGE, LOCKDEP_NOW_UNRELIABLE);
> -	}
> -
>  	return ret;
>  }
>  

