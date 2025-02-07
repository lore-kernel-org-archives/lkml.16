Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7E51D54E9
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738919305; cv=none; b=ccfe/JQNwQMevpM5JxKAh1N0qLQFjtSaNRrga1759ClbNm3pRE7GB5qMxXDSVDBD2a3V7Ngt5uiF028R0UCKU1nmM98iO7YqRP0yM1PXzv/CvakG6C2zjrDeK4oJ3kstbBIQ9QaXuWHp6/TtCZOb385LmBBO6j+BTsJKr8hGZOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738919305; c=relaxed/simple;
	bh=qXnOx1SJjYQgse2fTeyv7xSEyfySo6ocQ/XUjVcnk3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HOaciNzjuhYK7BpkfnyMPOUjl54j5sXid4bpWZmqZM4fAR4GtngUV8X8eFidziVWhGH8BOnQ6f4zqFVFpsFlpDeZMy7WQq2yNDTZGGRMs2fItW2plNcQtz8b/BGENJiP4viC/rJMxMMxzfoI0thSCWBFCdWE9HiLCKhzWkU8wsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=HBXginFE; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=t7Hkrv30; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=hUMPCp6s; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=e5ELiBKh; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="HBXginFE";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="t7Hkrv30";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="hUMPCp6s";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="e5ELiBKh"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D23F41F38D;
	Fri,  7 Feb 2025 09:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1738919301; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Kv4yu5gTRfLniNJIyW1nq0RSLgkQthYZOBQofd5742M=;
	b=HBXginFEfYkITWmnFPHy3uC45AiGfe1JKjx3A5+K2Fs5vn5VFn/foOK2PwG+063tTFJIav
	K+xDAnvNdb06df4MLotxCPTAiJOwO1Pd1+jFJJBLU1+tuBGKwJsGBzTrdeljZkcib76VAX
	Fb3iQr7OoAnutVq+226UJP9jLN/6H2A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1738919301;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Kv4yu5gTRfLniNJIyW1nq0RSLgkQthYZOBQofd5742M=;
	b=t7Hkrv3093l2d98CgtMh0V+ANxy7r9R7oOlDr1z1LGMrUhrahfly3AiDG6SjfCMSdYpN8F
	w5/lQm5V3WkXzIAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1738919300; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Kv4yu5gTRfLniNJIyW1nq0RSLgkQthYZOBQofd5742M=;
	b=hUMPCp6sXF+r6zv/igPYJRbTyAKXgHg7GkdS6Zi9aZI9s9rA4eH5F7xW4wxyfiHcFM76pR
	w6aN/kfUO7sZB5x/BB/LndJfuhuTHx7eVhz2pjFm4y/EI/a6yPLIRKfyNPwGG72LG/HOgl
	AFCJ5QA4R3P7CvA/LVxy9ojEXqymzlA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1738919300;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Kv4yu5gTRfLniNJIyW1nq0RSLgkQthYZOBQofd5742M=;
	b=e5ELiBKhYJcSSpR9KuMgeeS0j5IOGRfNpqMy180/HV4ua4cEqxp3TSIBK4L36S/hrzi8p1
	PrQz55EmJ/JiakDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AF47F13694;
	Fri,  7 Feb 2025 09:08:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IYltKoTNpWeHVwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Fri, 07 Feb 2025 09:08:20 +0000
Message-ID: <4462a28e-b78d-4735-8aed-03cace80b24d@suse.cz>
Date: Fri, 7 Feb 2025 10:08:20 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm: slub: call WARN() instead of pr_err on slab_fix.
To: Hyesoo Yu <hyesoo.yu@samsung.com>
Cc: janghyuck.kim@samsung.com, Christoph Lameter <cl@linux.com>,
 Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <CGME20250205004741epcas2p3081bc2c97b7c1c27a9797cd498c4bc64@epcas2p3.samsung.com>
 <20250205004615.1253389-1-hyesoo.yu@samsung.com>
 <47de9f52-e66a-4ecd-b561-6b97d2eab671@suse.cz>
 <20250207032828.GA491394@tiffany>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 EP+ylKVEKb0Q2A==
In-Reply-To: <20250207032828.GA491394@tiffany>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[samsung.com,linux.com,kernel.org,google.com,lge.com,linux-foundation.org,linux.dev,gmail.com,kvack.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On 2/7/25 04:28, Hyesoo Yu wrote:
> On Thu, Feb 06, 2025 at 12:35:22PM +0100, Vlastimil Babka wrote:
>> On 2/5/25 01:46, Hyesoo Yu wrote:
>> > If a slab object is corrupted or an error occurs in its internal
>> > value, continuing after restoration may cause other side effects.
>> > At this point, it is difficult to debug because the problem occurred
>> > in the past. It is better to use WARN() instead of pr_err to catch
>> > errors at the point of issue because WARN() could trigger panic for
>> > system debugging when panic_on_warn is enabled. WARN() should be
>> > called prior to fixing the value because when a panic is triggered by WARN(),
>> > it allows us to check corrupted data.
>> > 
>> > Changes in v2:
>> > - Replace direct calling with BUG_ON with the use of WARN in slab_fix.
>> > 
>> > Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
>> 
>> Hi and thanks for the patch,
>> 
>> I wonder if it would be better not to change slab_fix() but rather
>> slab_err() and object_err(). It wouldn't then require to rearrange the fixup
>> code. Also I think some error reporting paths don't go through slab_fix()
>> and we still would like them to become a WARN too.
>> 
>> Basically it would mean the last line in slab_err() would be a WARN and we'd
>> drop the dump_stack() as that's redundant. Same in object_err() (no
>> dump_stack() there). It would be a bit noisier as a result, but hopefully
>> acceptable. The slab specific debugging info would still be printed before
>> the WARN hits (and potentially results in a panic) so anyone investigating
>> the crash dump would have that information.
>> 
>> Hm but I see some places print stuff after slab_err(). slab_pad_check() and
>> list_slab_objects(). We could create slab_err_start() and slab_err_end() for
>> those, and slab_err() would just call both at once.
>> 
> 
> Thank you so much for your review.
> 
> That's a great suggestion. Following your suggestion, it seems possible to use
> WARN on all error reporting paths. For some places print stuff after slab_err,
> print them as follows,
> 
> +static void __slab_err(struct slab *slab)
> +{
> +       print_slab_info(slab);
> +       add_taint(TAINT_BAD_PAGE, LOCKDEP_NOW_UNRELIABLE);
> +
> +       WARN_ON(1);
> +}
> +
>  static __printf(3, 4) void slab_err(struct kmem_cache *s, struct slab *slab,
>                         const char *fmt, ...)
>  {
>         vsnprintf(buf, sizeof(buf), fmt, args);
>         va_end(args);
>         slab_bug(s, "%s", buf);
> -       print_slab_info(slab);
> -       dump_stack();
> -       add_taint(TAINT_BAD_PAGE, LOCKDEP_NOW_UNRELIABLE);
> +       __slab_err(slab);
>  }
> 
> @@ -1316,11 +1322,13 @@ slab_pad_check(struct kmem_cache *s, struct slab *slab)
>         while (end > fault && end[-1] == POISON_INUSE)
>                 end--;
> 
> -       slab_err(s, slab, "Padding overwritten. 0x%p-0x%p @offset=%tu",
> -                       fault, end - 1, fault - start);
> +       slab_bug(s, "Padding overwritten. 0x%p-0x%p @offset=%tu",
> +                fault, end - 1, fault - start);
>         print_section(KERN_ERR, "Padding ", pad, remainder);
> 
>         restore_bytes(s, "slab padding", POISON_INUSE, fault, end);
> +
> +       __slab_err(slab);

Yeah but move that above restore_bytes()?

BTW I think we could also do this?

--- a/mm/slub.c
+++ b/mm/slub.c
@@ -1162,7 +1162,7 @@ void skip_orig_size_check(struct kmem_cache *s, const void *object)
        set_orig_size(s, (void *)object, s->object_size);
 }
 
-static void slab_bug(struct kmem_cache *s, char *fmt, ...)
+static void slab_bug(struct kmem_cache *s, const char *fmt, ...)
 {
        struct va_format vaf;
        va_list args;
@@ -1263,15 +1263,11 @@ static __printf(3, 4) void slab_err(struct kmem_cache *s, struct slab *slab,
                        const char *fmt, ...)
 {
        va_list args;
-       char buf[100];
 
        if (slab_add_kunit_errors())
                return;
 
-       va_start(args, fmt);
-       vsnprintf(buf, sizeof(buf), fmt, args);
-       va_end(args);
-       slab_bug(s, "%s", buf);
+       slab_bug(s, fmt, args);


>  }
> 
>> > ---
>> >  mm/slub.c | 10 +++++-----
>> >  1 file changed, 5 insertions(+), 5 deletions(-)
>> > 
>> > diff --git a/mm/slub.c b/mm/slub.c
>> > index 1f50129dcfb3..ea956cb4b8be 100644
>> > --- a/mm/slub.c
>> > +++ b/mm/slub.c
>> > @@ -1043,7 +1043,7 @@ static void slab_fix(struct kmem_cache *s, char *fmt, ...)
>> >  	va_start(args, fmt);
>> >  	vaf.fmt = fmt;
>> >  	vaf.va = &args;
>> > -	pr_err("FIX %s: %pV\n", s->name, &vaf);
>> > +	WARN(1, "FIX %s: %pV\n", s->name, &vaf);
>> >  	va_end(args);
>> >  }
>> >  
>> > @@ -1106,8 +1106,8 @@ static bool freelist_corrupted(struct kmem_cache *s, struct slab *slab,
>> >  	if ((s->flags & SLAB_CONSISTENCY_CHECKS) &&
>> >  	    !check_valid_pointer(s, slab, nextfree) && freelist) {
>> >  		object_err(s, slab, *freelist, "Freechain corrupt");
>> > -		*freelist = NULL;
>> >  		slab_fix(s, "Isolate corrupted freechain");
>> > +		*freelist = NULL;
>> >  		return true;
>> >  	}
>> >  
>> > @@ -1445,9 +1445,9 @@ static int on_freelist(struct kmem_cache *s, struct slab *slab, void *search)
>> >  				set_freepointer(s, object, NULL);
>> >  			} else {
>> >  				slab_err(s, slab, "Freepointer corrupt");
>> > +				slab_fix(s, "Freelist cleared");
>> >  				slab->freelist = NULL;
>> >  				slab->inuse = slab->objects;
>> > -				slab_fix(s, "Freelist cleared");
>> >  				return 0;
>> >  			}
>> >  			break;
>> > @@ -1464,14 +1464,14 @@ static int on_freelist(struct kmem_cache *s, struct slab *slab, void *search)
>> >  	if (slab->objects != max_objects) {
>> >  		slab_err(s, slab, "Wrong number of objects. Found %d but should be %d",
>> >  			 slab->objects, max_objects);
>> > -		slab->objects = max_objects;
>> >  		slab_fix(s, "Number of objects adjusted");
>> > +		slab->objects = max_objects;
>> >  	}
>> >  	if (slab->inuse != slab->objects - nr) {
>> >  		slab_err(s, slab, "Wrong object count. Counter is %d but counted were %d",
>> >  			 slab->inuse, slab->objects - nr);
>> > -		slab->inuse = slab->objects - nr;
>> >  		slab_fix(s, "Object count adjusted");
>> > +		slab->inuse = slab->objects - nr;
>> >  	}
>> >  	return search == NULL;
>> >  }
>> 
>> 
> 
> 

