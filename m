Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2652819E975
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 05:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744262744; cv=none; b=PO1rDcXP6uDKn2Kye5lzrNIxoCx8hNSLa4G1OqorCS8jayzyH0jZIi8BNXUu8Omtj+DpO08ZZYz7q32Y1xlLJB+EHQ7lvq5fBO3gbi4ugZ/6G7QazwgIQtnFkA+vgQc91z8zND0vYXklfSJUs7lwz9Q3EMG7sZWnIKq5joMRfh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744262744; c=relaxed/simple;
	bh=CDc0rurRDPM43Jts4lwXuvxVPR25QqQZ/+Ykh0MoRgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EGwmJJn3mpFGok+HTXYuJoi32/U/jQJZdeMcWRI7fEKTiVRy55oHmnu3JWl28OfIo1xm7DZHyQsFaxWigQF8HKN61OHDM+aI/hPZ+sMd2a0pEriytpSrZtRF6yVk35ggNqa1rd4V6JYYZoNW+wxUOnSGFXW6HdhqcobPPWGZdeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tgKERqRW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+sfd0kBa; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tgKERqRW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+sfd0kBa; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tgKERqRW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+sfd0kBa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tgKERqRW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+sfd0kBa"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2C9E21F385;
	Thu, 10 Apr 2025 05:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744262740; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sz//AQNK6HBfjELDubxkvHQdxuVnx9BP9YnbKTYNU8Y=;
	b=tgKERqRWxcrS8WKKiKkjXpx11PHfw9lYAjJriM7NXmreAr5wDDkL2XyuOtPeHCLYy/7HZh
	1wRreeUJ41jiSmzJzRcoloCGE+T9QZTOAZPl4bWyxgw49NGO+udj7OxD7oY2LsM33rCmx6
	buz9y+2b2KtffpuKxdAYygmA1LyxLEk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744262740;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sz//AQNK6HBfjELDubxkvHQdxuVnx9BP9YnbKTYNU8Y=;
	b=+sfd0kBaZgy9Ou8qAc0gy2ji7HnprFQ6btY+MFjO7tY5ylp6ybMPn0YyRCEsnvqSKhz6HH
	rqeAgLVqNBZx+/Dg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744262740; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sz//AQNK6HBfjELDubxkvHQdxuVnx9BP9YnbKTYNU8Y=;
	b=tgKERqRWxcrS8WKKiKkjXpx11PHfw9lYAjJriM7NXmreAr5wDDkL2XyuOtPeHCLYy/7HZh
	1wRreeUJ41jiSmzJzRcoloCGE+T9QZTOAZPl4bWyxgw49NGO+udj7OxD7oY2LsM33rCmx6
	buz9y+2b2KtffpuKxdAYygmA1LyxLEk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744262740;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sz//AQNK6HBfjELDubxkvHQdxuVnx9BP9YnbKTYNU8Y=;
	b=+sfd0kBaZgy9Ou8qAc0gy2ji7HnprFQ6btY+MFjO7tY5ylp6ybMPn0YyRCEsnvqSKhz6HH
	rqeAgLVqNBZx+/Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8FAA8139D5;
	Thu, 10 Apr 2025 05:25:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6wELIFNW92dJWgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 10 Apr 2025 05:25:39 +0000
Date: Thu, 10 Apr 2025 07:25:33 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Aditya Gupta <adityag@linux.ibm.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [REPORT] Softlockups on PowerNV with upstream
Message-ID: <Z_dWTU8UsvCHFMpN@localhost.localdomain>
References: <20250409180344.477916-1-adityag@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409180344.477916-1-adityag@linux.ibm.com>
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, Apr 09, 2025 at 11:33:44PM +0530, Aditya Gupta wrote:
> Hi,
> 
> While booting current upstream kernel, I consistently get "softlockups", on IBM PowerNV system.
> 
> I have tested it only on PowerNV systems. But some architectures/platforms also
> might have it. PSeries systems don't have this issue though.
> 
> Bisect points to the following commit:
> 
>     commit 61659efdb35ce6c6ac7639342098f3c4548b794b
>     Author: Gavin Shan <gshan@redhat.com>
>     Date:   Wed Mar 12 09:30:43 2025 +1000
> 
>         drivers/base/memory: improve add_boot_memory_block()
> 
... 
> Console log
> -----------
> 
>     [    2.783371] smp: Brought up 4 nodes, 256 CPUs
>     [    2.783475] numa: Node 0 CPUs: 0-63
>     [    2.783537] numa: Node 2 CPUs: 64-127
>     [    2.783591] numa: Node 4 CPUs: 128-191
>     [    2.783653] numa: Node 6 CPUs: 192-255
>     [    2.804945] Memory: 735777792K/738197504K available (17536K kernel code, 5760K rwdata, 15232K rodata, 6528K init, 2517K bss, 1369664K reserved, 0K cma-reserved)

If I am not mistaken this is ~700GB, and PowerNV uses 16MB as section size,
and sections_per_block == 1 (I think).

The code before the mentioned commit, was something like:

 for (nr = base_section_nr; nr < base_section_nr + sections_per_block; nr++)
       if (present_section_nr(nr))
          section_count++;

 if (section_count == 0)
    return 0;
 return add_memory_block()

So, in case of PowerNV , we will just check one section at a time and
either return or call add_memory_block depending whether it is present.

Now, with the current code that is something different.
We now have 

memory_dev_init:
 for(nr = 0, nr <= __highest_present_section_nr; nr += 1)
     ret = add_boot_memory_block

add_boot_memory_block:
 for_each_present_section_nr(base_section_nr, nr) {
     if (nr >= (base_section_nr + sections_per_block))
            break;

     return add_memory_block();
 }
 return 0;

The thing is that next_present_section_nr() (which is called in
for_each_present_section_nr()) will loop until we find a present
section.
And then we will check whether the found section is beyond
base_section_nr + sections_per_block (where sections_per_block = 1).
If so, we skip add_memory_block.

Now, I think that the issue comes from for_each_present_section_nr
having to loop a lot until we find a present section.
And then the loop in memory_dev_init increments only by 1, which means
that the next iteration we might have to loop a lot again to find the
another present section. And so on and so forth.

Maybe we can fix this by making memory_dev_init() remember in which
section add_boot_memory_block returns.
Something like the following (only compile-tested)

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index 8f3a41d9bfaa..d97635cbfd1d 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -816,18 +816,25 @@ static int add_memory_block(unsigned long block_id, unsigned long state,
 	return 0;
 }

-static int __init add_boot_memory_block(unsigned long base_section_nr)
+static int __init add_boot_memory_block(unsigned long *base_section_nr)
 {
+	int ret;
 	unsigned long nr;

-	for_each_present_section_nr(base_section_nr, nr) {
-		if (nr >= (base_section_nr + sections_per_block))
+	for_each_present_section_nr(*base_section_nr, nr) {
+		if (nr >= (*base_section_nr + sections_per_block))
 			break;

-		return add_memory_block(memory_block_id(base_section_nr),
-					MEM_ONLINE, NULL, NULL);
+		ret = add_memory_block(memory_block_id(*base_section_nr),
+				       MEM_ONLINE, NULL, NULL);
+		*base_section = nr;
+		return ret;
 	}

+	if (nr == -1)
+		*base_section = __highest_present_section_nr + 1;
+	else
+		*base_section = nr;
 	return 0;
 }

@@ -973,9 +980,9 @@ void __init memory_dev_init(void)
 	 * Create entries for memory sections that were found
 	 * during boot and have been initialized
 	 */
-	for (nr = 0; nr <= __highest_present_section_nr;
-	     nr += sections_per_block) {
-		ret = add_boot_memory_block(nr);
+	nr = first_present_section_nr();
+	for (; nr <= __highest_present_section_nr; nr += sections_per_block) {
+		ret = add_boot_memory_block(&nr);
 		if (ret)
 			panic("%s() failed to add memory block: %d\n", __func__,
 			      ret);
 

@Aditya: can you please give it a try?



-- 
Oscar Salvador
SUSE Labs
