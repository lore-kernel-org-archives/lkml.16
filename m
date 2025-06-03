Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC13D146A66
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 12:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748952719; cv=none; b=t/1SweYEYga4g1di4O+8f/+YAYk97lhdub4aMAEJZ0tBDaoUmhRZFXNSl+4Md+E6J120Y+DiDX7Tsdu44jZE/eslgSCZfwEi7gSChu86Yo5PZgDsYT7f5C/ffTSONIqJizfHGViT2oc+s5bC8uRwae5+ylGgEO6JLz24L1Jw9CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748952719; c=relaxed/simple;
	bh=n+Ml2A7QDS9pBXBY5/8zFlwpWsHlV5Vcmn3x1XR0Bmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HO003rG2hvTbT4q0lFRJIT+ckV8Zn4kWAD5/5x0n6J6RAjGBGmaXSa7KggM2iYHF7UlSzlN28mJXd+kvztZGLDXQza+js19KQv4xMYEpJInNT+jyV1C6MBl3S2ZyTQ7M22CjatXY66KlIunJRMzahZTeDgVpHPx0ftTFkHzvLEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=KBuDX1qc; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=f7zUdW+6; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=KBuDX1qc; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=f7zUdW+6; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="KBuDX1qc";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="f7zUdW+6";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="KBuDX1qc";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="f7zUdW+6"
Received: from localhost (unknown [10.100.12.32])
	by smtp-out2.suse.de (Postfix) with ESMTP id AF3D11FBA4;
	Tue,  3 Jun 2025 12:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748952715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lKWJbX0PLKuRXFkwoq7rogv1tm65PhpIOsVYoZQ/ZIk=;
	b=KBuDX1qc4X6RVCI1Er/XBW/X9j7Nl7fl7eA0Bm6/fBjn0GAIGBnKMQIBsHYgqT2/BH0o4x
	cHuXiV6nkmBU0TyuPUO1JmzqUTX5cNucS4I8ug7V0UI5a2ijfi6l8WJHUlyfJEvRDmQOki
	SYYan06yt6kxXs++1TYpRem5KHPzTt4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748952715;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lKWJbX0PLKuRXFkwoq7rogv1tm65PhpIOsVYoZQ/ZIk=;
	b=f7zUdW+6DWgJFZCT0bpAFE/fV4iYkZG+u1R5OcMARAGM1iVM8oiOgYVyYRDk/KVXc2sXLT
	SzvANfWba12tJjDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748952715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lKWJbX0PLKuRXFkwoq7rogv1tm65PhpIOsVYoZQ/ZIk=;
	b=KBuDX1qc4X6RVCI1Er/XBW/X9j7Nl7fl7eA0Bm6/fBjn0GAIGBnKMQIBsHYgqT2/BH0o4x
	cHuXiV6nkmBU0TyuPUO1JmzqUTX5cNucS4I8ug7V0UI5a2ijfi6l8WJHUlyfJEvRDmQOki
	SYYan06yt6kxXs++1TYpRem5KHPzTt4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748952715;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lKWJbX0PLKuRXFkwoq7rogv1tm65PhpIOsVYoZQ/ZIk=;
	b=f7zUdW+6DWgJFZCT0bpAFE/fV4iYkZG+u1R5OcMARAGM1iVM8oiOgYVyYRDk/KVXc2sXLT
	SzvANfWba12tJjDw==
Date: Tue, 3 Jun 2025 14:11:55 +0200
From: Jiri Bohac <jbohac@suse.cz>
To: Baoquan He <bhe@redhat.com>
Cc: Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	kexec@lists.infradead.org, Philipp Rudo <prudo@redhat.com>,
	Donald Dutile <ddutile@redhat.com>, Pingfan Liu <piliu@redhat.com>,
	Tao Liu <ltao@redhat.com>, linux-kernel@vger.kernel.org,
	David Hildenbrand <dhildenb@redhat.com>,
	Michal Hocko <mhocko@suse.cz>
Subject: Re: [PATCH v4 5/5] x86: implement crashkernel cma reservation
Message-ID: <aD7mi4j2llS-Kpfv@dwarf.suse.cz>
References: <aDoT08LfXUEkS9E4@dwarf.suse.cz>
 <aDoVhDc11ZcJyHm2@dwarf.suse.cz>
 <aD7WLv86BOVS+GPm@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aD7WLv86BOVS+GPm@MiWiFi-R3L-srv>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ZERO(0.00)[0];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost:helo,suse.cz:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.30

On Tue, Jun 03, 2025 at 07:02:06PM +0800, Baoquan He wrote:
> On 05/30/25 at 10:31pm, Jiri Bohac wrote:
> ......snip.. 
> > @@ -582,7 +582,7 @@ static void __init arch_reserve_crashkernel(void)
> >  
> >  	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
> >  				&crash_size, &crash_base,
> > -				&low_size, NULL, &high);
> > +				&low_size, &cma_size, &high);
> >  	if (ret)
> >  		return;
> >  
> > @@ -592,6 +592,7 @@ static void __init arch_reserve_crashkernel(void)
> >  	}
> >  
> >  	reserve_crashkernel_generic(crash_size, crash_base, low_size, high);
> > +	reserve_crashkernel_cma(cma_size);
> 
> Wondering if ,high|low is still allowed (or needed) when ,cma is specified.

Probably not needed but it works, totally independent of the
extra CMA-reserved area.

I saw no reason to artificially prevent it.

-- 
Jiri Bohac <jbohac@suse.cz>
SUSE Labs, Prague, Czechia

