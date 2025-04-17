Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E878A22FDE4
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 11:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744887731; cv=none; b=nkIIE6rFetTWkQ4G8PmckRvNeCpTBY/dmCUSQsBMYPLQj5BgAnNuhR32KC/af9iKdAksGzpHoDZH3Ellap0phvwRrUmC5qNp1xa4tqmR+pLDs6jlfoubVX2EyCBcZ58BMBu4E+MCZHifnxZlaRzWDdZ7gBNxFWrAkMfR9hmud6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744887731; c=relaxed/simple;
	bh=J/FowG4RGkULSW3OssXMIDVHAXdaoztj5xMbaZ+jKiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=unip17CSypdRQsUV0LQyqHuVCllk80jqd4lpONVEt7KGPuF+3fBEYteQSmSVlH5nKzhfv8U/Y2T1OYhMbkGk7lJ0Hz+3fbs6jhk79zLgqV2duOzTsrnbHCH4WLjUscnYarPJxM++vhCbghTcbgEs/9l3Vx6ptSogXtFWF4G/GiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Z6omR/t7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3JBM1DWN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CEWpdI55; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oLkB+Qln; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z6omR/t7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3JBM1DWN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CEWpdI55";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oLkB+Qln"
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BB5451F391;
	Thu, 17 Apr 2025 11:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744887728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sZpnzxRSUDSCBklz6FPF9ZmFbPU52UYcDzvyh6Eiog4=;
	b=Z6omR/t7yrPWbMThHOZDgz53u1mkrFazP7anvZnL/gYHGOXjZGpv9/wpeh9mZQRTdszgQ3
	wbDsx0OSguttj1gE7M2JFyOQHBNpzmTyR9894KjNezOfsnDfZDcWRGKrgoRkRDo1DMrWYm
	xLMeD6nJeu0VTTxGEi8HYKrIBPE5zSg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744887728;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sZpnzxRSUDSCBklz6FPF9ZmFbPU52UYcDzvyh6Eiog4=;
	b=3JBM1DWNzcSgFyaNKGgYey8Wtjn0c8L1fMtD51Ejl8pe/uhzXDWZYGYNe2XCCw109Am+0Q
	kZZm45Ag21n4XFAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744887726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sZpnzxRSUDSCBklz6FPF9ZmFbPU52UYcDzvyh6Eiog4=;
	b=CEWpdI55EFwlD/v0t9f6J8zVavV/UMm1PxVxevM/HVmvvtW3gszghtf+nDsYxZJqXGMPiQ
	15IeTWWM98mlF4BPfPyEabS3w0DZRKHVCcxdT4ZnL6Yqv+aF6y+T6VEikIPoA1zwxTAXXH
	pC7B35otRo/waCcGU85YXiH5apIMNpk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744887726;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sZpnzxRSUDSCBklz6FPF9ZmFbPU52UYcDzvyh6Eiog4=;
	b=oLkB+QlnxL6znlv4rmg1YpFbX22sfSUHYZDFDDULOSG50aXcg2dAtbv50PYlgaoiVbkL6d
	qp4rSpauK9KzHsAQ==
Date: Thu, 17 Apr 2025 13:02:05 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/boot: Fix build with gcc 15
Message-ID: <aADfrUcNqBejcdrR@kitsune.suse.cz>
References: <20250307092055.21986-1-msuchanek@suse.de>
 <fo7xb3bqk5h57mqgfrnyfpweitkr2l5vk3tomu6zgxgqlivwpt@afm2n3c2sxke>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fo7xb3bqk5h57mqgfrnyfpweitkr2l5vk3tomu6zgxgqlivwpt@afm2n3c2sxke>
X-Spam-Score: -8.30
X-Spamd-Result: default: False [-8.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_ZERO(0.00)[0];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,kernel.org,fjasle.eu,google.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kitsune.suse.cz:mid,kitsune.suse.cz:helo,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, Apr 17, 2025 at 11:37:09AM +0530, Mukesh Kumar Chaurasiya wrote:
> On Fri, Mar 07, 2025 at 10:20:52AM +0100, Michal Suchanek wrote:
> > Similar to x86 the ppc boot code does not build with GCC 15.
> > 
> > Copy the fix from
> > commit ee2ab467bddf ("x86/boot: Use '-std=gnu11' to fix build with GCC 15")
> > 
> > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > ---
> >  arch/powerpc/boot/Makefile | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> > index 1ff6ad4f6cd2..e6b35699c049 100644
> > --- a/arch/powerpc/boot/Makefile
> > +++ b/arch/powerpc/boot/Makefile
> > @@ -33,6 +33,7 @@ else
> >  endif
> >  
> >  ifdef CONFIG_PPC64_BOOT_WRAPPER
> > +BOOTTARGETFLAGS	+= -std=gnu11
> >  BOOTTARGETFLAGS	+= -m64
> >  BOOTTARGETFLAGS	+= -mabi=elfv2
> >  ifdef CONFIG_PPC64_ELF_ABI_V2
> > -- 
> > 2.47.1
> > 
> There's another patch which fixes this problem by version comparison.
> https://lore.kernel.org/all/20250323163607.537270-2-misanjum@linux.ibm.com/
> 
> In my opinion this is a better solution as it will use the features of latest
> compiler.

No it's not a better solution. It's documented that the kernel is built
with the GNU dialect of ISO C11. When a file is not compiled with the
documented C dialect that's a bug.

If newer C dialect features are desirable then they should be enabled
consistently across the tree, not individually for a few files used in
boot code.

Thanks

Michal
